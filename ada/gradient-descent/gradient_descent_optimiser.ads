with Real_Vector; use Real_Vector;

package Gradient_Descent_Optimiser is
   
   type Function_Vector_To_Real is
     access function (V : Vector) return Float;
   
   type Procedure_Vector_To_Vector is
     access procedure (V : in Vector; Result : out Vector);
   
   procedure Gradient_Descent_Optimizer
     (
      Target_Function: Function_Vector_To_Real;
      Target_Function_Derivative : Procedure_Vector_To_Vector;
      Learning_Rate : Float;
      Max_Iterations : Integer;
      Initial_X : Vector
     );
      
end Gradient_Descent_Optimiser;
