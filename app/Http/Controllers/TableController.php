<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\Validator;
use App\Models\Employees;
use App\Models\Tables;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class TableController extends Controller
{    
    
    public function register(Request $request){
        
            try {
        
                $user = Auth::user();

                $validator = Validator::make($request->all(), [
                    'number' => 'required',
                    'table_description' => 'required',
                ]);

                if($validator->fails()){
                    return response()->json($validator->errors()->toJson(),400);
                }

                $table = Tables::create(array_merge(
                    $validator->validate(),
                    ['state' => 1,
                    'created_user' => $user->id_employee]
                ));

                return response()->json([
                    'message' => '¡Successfully registered table!',
                    'data' => $table
                ], 201);

        } catch (Exception $e) {
            echo 'Caught exception: ',  $e->getMessage(), "\n";
        }

    }


    public function update(Request $request){

        try {
    
            $request->validate([
                'number' => 'required',
                'table_description' => 'required',
                'state' => 'required'
            ]);

            $user = Auth::user();

            $table = Tables::find($request->id);
            $table->number = $request->number;
            $table->table_description = $request->table_description;
            $table->state = $request->state;   
            $table->updated_user = $user->id;   
            $table->update();     
            
            return response()->json([
                'message' => '¡Successfully update table!',
                'data' => $table
            ], 201);

    
        } catch (Exception $e) {
            echo 'Caught exception: ',  $e->getMessage(), "\n";
        }

    }

    
    public function search(Request $request){
        
        $result = DB::table('tables');

        if ($request->search != null) {
            $result = $result->orWhere('number', 'like', '%'.$request->search. '%');
        }

        $result = $result
                        ->Where('state', 1)
                        ->limit(20)
                        ->get();

        return response()->json([
            'message' => '¡Tables list!',
            'data' => $result
        ], 201);
        
    }
    



    
}
