with Ada.Text_IO;  use Ada.Text_IO;

with Integer_Matrices; use Integer_Matrices;

procedure List_Tu_Matrices is
   
   M : Integer_Matrix (1..3, 1..3);
   
   Z : constant Integer_Matrix (1..3, 1..3) := ((0,0,0), (0,0,0), (0,0,0));
   
   procedure Generate_Matrices
     (
      A : in out Integer_Matrix;
      I, J : Integer;
      Last : in out Boolean
     ) is
   begin
      
      if A (I,J) = 0 then
         A (I,J) := 1;
      elsif A (I,J) = 1 then
         A (I,J) := -1;
      else
         if I = A'Last(1) and then J = A'Last(2) then
            Last := True;
         else
            A (I,J) := 0;
            if J < A'Last(2) then
               Generate_Matrices (A, I, J + 1, Last);
            else
               Generate_Matrices (A, I + 1, 1, Last);
            end if;
         end if;
      end if;      
      
   end Generate_Matrices;
   
   procedure Generate_Matrices
     (
      A : in out Integer_Matrix;
      Last : in out Boolean
     ) is
   begin
      Generate_Matrices (A, 1, 1, Last);
   end;
   
   Last : Boolean := False;
   
begin
   
   M := Z;
   
   while not Last loop
      Put_Matrix_Line (M);
      New_Line;
      Generate_Matrices (M, Last);
   end loop;
   
end;
