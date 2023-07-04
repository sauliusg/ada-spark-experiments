package body Optimised_Functions is
   
   -- Define the target function and its derivative
   function Quadratic_Function(X : Vector) return Float is
      Result : Float := 0.0;
      N : Integer := 1;
   begin
      for I in X'Range loop
         -- Example: using a simple quadratic function:
         Result := Result + (X(I) - 0.5 * Float(N))**2;
         N := N + 1;
      end loop;
      Result := Result + 2.5;
      return Result;
   end Quadratic_Function;

   procedure Quadratic_Function_Derivative
     (X : Vector; Derivative : out Vector) 
   is
      N : Integer := 1;
   begin
      for I in X'Range loop
         -- Derivative of the quadratic function:
         Derivative(I) := 2.0 * (X(I) - 0.5 * Float(N));
         N := N + 1;
      end loop;
   end Quadratic_Function_Derivative;
   
end  Optimised_Functions;
