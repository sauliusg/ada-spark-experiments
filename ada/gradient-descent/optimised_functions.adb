with Ada.Numerics.Generic_Elementary_Functions;

package body Optimised_Functions is
   
   package Float_Elementary_Functions is new
     Ada.Numerics.Generic_Elementary_Functions (Float);
   
   use Float_Elementary_Functions;
   
   -- Target function sin(x):
   
   function Sin_Function (X : Vector) return Float is
      Result : Float := 0.0;
   begin
      for I in X'Range loop
         Result := Result + Sin (X(I));
      end loop;
      return Result;
   end;
   
   procedure Sin_Function_Derivative
     (X : Vector; Derivative : out Vector) 
   is
   begin
      for I in X'Range loop
         Derivative(I) := Cos (X(I));
      end loop;
   end;
   
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
