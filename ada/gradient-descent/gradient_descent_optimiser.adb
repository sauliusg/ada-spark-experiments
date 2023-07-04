with Ada.Text_IO;         use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Float_Text_IO;   use Ada.Float_Text_IO;

package body Gradient_Descent_Optimiser is
   
   procedure Put (V : Vector) is
   begin
      Put ("[");
      for E of V loop
         Put (E);
         Put (" ");
      end loop;
      Put ("]");
   end;
   
   -- Define the gradient descent optimizer
   procedure Gradient_Descent_Optimizer
     (
      Target_Function: Function_Vector_To_Real;
      Target_Function_Derivative : Procedure_Vector_To_Vector;
        
      Learning_Rate : Float;
      Max_Iterations : Integer;
      Initial_X : Vector
     ) is
      
      X : Vector := Initial_X;

   begin
      for I in 1 .. Max_Iterations loop
         declare
            Derivative : Vector(X'Range);
         begin
            Target_Function_Derivative.all(X, Derivative);
            for J in X'Range loop
               X(J) := X(J) - Learning_Rate * Derivative(J);
            end loop;
         end;
         if I mod 10 = 0 then
             Put (I);
             Put (": ");
             Put (X);
             Put (" F = ");
             Put (Target_Function(X));
             New_Line;
         end if;
      end loop;

      -- Print the optimized value of X
      Put("Optimized X: ");
      for I in X'Range loop
         Put(Item => X(I), Fore => 0, Aft => 4);
         Put(" ");
      end loop;
      New_Line;
   end Gradient_Descent_Optimizer;
   
end Gradient_Descent_Optimiser;
