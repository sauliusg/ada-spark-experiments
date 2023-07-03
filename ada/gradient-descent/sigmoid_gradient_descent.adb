with Ada.Text_IO; use Ada.Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;
with Ada.Numerics.Elementary_Functions;
use Ada.Numerics.Elementary_Functions;

procedure Sigmoid_Gradient_Descent is
   type Vector is array (Integer range <>) of Float;

   -- Define the sigmoid function
   function Sigmoid(X : Float) return Float is
   begin
      return 1.0 / (1.0 + Exp(-X));
   end Sigmoid;

   -- Define the target function and its derivative
   function Target_Function(X : Vector; Y : Float) return Float is
      Result : Float := 0.0;
   begin
      for I in X'Range loop
         Result := Result + X(I) * Y;  -- Example: using dot product with Y
      end loop;
      return Sigmoid(Result);
   end Target_Function;

   procedure Target_Function_Derivative(X : Vector; Y : Float; Derivative : out Vector) is
   begin
      for I in X'Range loop
         Derivative(I) := Y * Sigmoid(-Target_Function(X, Y)) * Sigmoid(Target_Function(X, Y) - 1.0) * X(I);  -- Derivative of the logistic regression
      end loop;
   end Target_Function_Derivative;

   procedure Put (V : Vector) is
   begin
      Put ("[");
      for E of V loop
         Put (E);
      end loop;
      Put ("]");
   end;
   
   -- Define the gradient descent optimizer
   procedure Gradient_Descent_Optimizer(
      Learning_Rate : Float;
      Max_Iterations : Integer;
      Initial_X : Vector;
      Y : Float) is
      X : Vector := Initial_X;

   begin
      for I in 1 .. Max_Iterations loop
         declare
            Derivative : Vector(X'Range);
         begin
            Target_Function_Derivative(X, Y, Derivative);
            for J in X'Range loop
               X(J) := X(J) - Learning_Rate * Derivative(J);
            end loop;
         end;
         Put (X);
         New_Line;
      end loop;

      -- Print the optimized value of X
      Put("Optimized X: ");
      for I in X'Range loop
         Put(Item => X(I), Fore => 0, Aft => 4);
         Put(" ");
      end loop;
      New_Line;
   end Gradient_Descent_Optimizer;

begin
   -- Perform gradient descent optimization
   Gradient_Descent_Optimizer(
      Learning_Rate => 0.1,  -- Learning rate for the optimization
      Max_Iterations => 10000,  -- Maximum number of iterations
      Initial_X => (5.0, 7.0, 9.0),  -- Initial values of X as a vector
      Y => 1.0);  -- Example target value Y for logistic regression
end Sigmoid_Gradient_Descent;
