<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\Validator;
use App\Models\Employees;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class EmployeeController extends Controller
{    
    
    public function register(Request $request){
        
            try {
        
                $user = Auth::user();

                $validator = Validator::make($request->all(), [

                    'first_name' => 'required',
                    'last_name' => 'required',
                    'email' => 'required|string|email|max:100|unique:employees',
                    'password' => 'required|string|min:6',  
                    'birthday' => 'required',
                    'phone' => 'required',
                    'postcode' => 'required',
                    'id_rol' => 'required',

                ]);

                if($validator->fails()){
                    return response()->json($validator->errors()->toJson(),400);
                }

                $employee = Employees::create(array_merge(
                    $validator->validate(),
                    ['password' => bcrypt($request->password),
                    'state' => 1,
                    'created_user' => $user->id_employee]
                ));

                return response()->json([
                    'message' => '¡Successfully registered employee!',
                    'data' => $employee
                ], 201);

        } catch (Exception $e) {
            echo 'Caught exception: ',  $e->getMessage(), "\n";
        }

    }


    public function update(Request $request){

        try {
    
            $request->validate([
                'first_name' => 'required',
                'last_name' => 'required',
                'email' => 'required',
                'password' => 'required|string|min:6',  
                'birthday' => 'required',
                'phone' => 'required',
                'postcode' => 'required',
                'id_rol' => 'required',
                'state' => 'required',
            ]);

            $user = Auth::user();

            $employee = Employees::find($request->id);
            $employee->first_name = $request->first_name;
            $employee->last_name = $request->last_name;
            $employee->email = $request->email;
            $employee->password = bcrypt($request->password);
            $employee->birthday = $request->birthday;
            $employee->phone = $request->phone;
            $employee->postcode = $request->postcode;
            $employee->id_rol = $request->id_rol;
            $employee->state = $request->state;   
            $employee->updated_user = $user->id;        
            

            $result = DB::table('employees')
            ->Where('email', $request->email,'id_employee,' and $request->id)->get();

            if(count($result) === 0){
                
                $employee->update();

                return response()->json([
                    'message' => '¡Successfully update employee!',
                    'data' => $employee
                ], 201);

            }else{
                
                foreach ($result as $key) { }

                if ($key->id_employee == $request->id) {

                    $employee->update();

                    return response()->json([
                        'message' => '¡Successfully update employee!',
                        'data' => $employee
                    ], 201);

                }else{

                    return response()->json([
                        'message' => '¡The email has already been taken!',
                    ], 401);
                }

            }

        } catch (Exception $e) {
            echo 'Caught exception: ',  $e->getMessage(), "\n";
        }

    }

    
    public function search(Request $request){
        
        $result = DB::table('employees');

        if ($request->search != null) {
            $result = $result->orWhere('first_name', 'like', '%'.$request->search. '%')
            ->orWhere('last_name', 'like', '%'.$request->search. '%');
        }

        $result = $result
                        ->join('roles', 'employees.id_rol', '=', 'roles.id_rol')                        
                        ->Where('employees.state', 1)
                        ->limit(20)
                        ->get();

        return response()->json([
            'message' => '¡Employees list!',
            'data' => $result
        ], 201);
        
    }
    



    
}
