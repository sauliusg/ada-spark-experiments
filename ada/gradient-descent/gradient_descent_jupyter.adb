--% run_file: gradient_descent_jupyter.adb

with Ada.Text_IO;         use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Float_Text_IO;   use Ada.Float_Text_IO;

with Gradient_Descent_Optimiser; use Gradient_Descent_Optimiser;
with Optimised_Functions; use Optimised_Functions;

procedure Gradient_Descent_Jupyter is

begin
   -- Perform gradient descent optimization
   Gradient_Descent_Optimizer(
      Sin_Function'Access,
      Sin_Function_Derivative'Access,
      Learning_Rate => 0.1,  -- Learning rate for the optimization
      Max_Iterations => 100,  -- Maximum number of iterations
      Initial_X => (12.0, 3.0, 4.0));  -- Initial values of X as a vector
end Gradient_Descent_Jupyter;