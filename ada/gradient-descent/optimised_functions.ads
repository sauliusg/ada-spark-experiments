with Real_Vector; use Real_Vector;

package Optimised_Functions is
   
   function Quadratic_Function(X : Vector) return Float;
   
   procedure Quadratic_Function_Derivative
     (X : Vector; Derivative : out Vector);
   
end Optimised_Functions;
