<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\Validator;
use App\Models\Users;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class UserController extends Controller
{    
    
    public function register(Request $request){
        
            try {
        
                $validator = Validator::make($request->all(), [

                    'first_name' => 'required',
                    'last_name' => 'required',
                    'email' => 'required|string|email|max:100',
                    'birthday' => 'required',
                    'phone' => 'required',


                ]);

                if($validator->fails()){
                    return response()->json($validator->errors()->toJson(),400);
                }

                $user = Users::create(array_merge(
                    $validator->validate(),
                    ['state' => 1]
                ));

                return response()->json([
                    'message' => '¡Successfully registered user!',
                    'data' => $user
                ], 201);

        } catch (Exception $e) {
            echo 'Caught exception: ',  $e->getMessage(), "\n";
        }

    }

    
    public function search(Request $request){
        
        $result = DB::table('users');

        if ($request->search != null) {
            $result = $result->orWhere('first_name', 'like', '%'.$request->search. '%')
            ->orWhere('last_name', 'like', '%'.$request->search. '%');
        }

        $result = $result
                        ->Where('users.state', 1)
                        ->limit(20)
                        ->get();

        return response()->json([
            'message' => '¡Users list!',
            'data' => $result
        ], 201);
        
    }
    



    
}
