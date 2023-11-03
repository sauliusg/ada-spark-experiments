with Ada.Text_IO;         use Ada.Text_IO;
with Ada.Float_Text_IO;

with Real_Generic_Matrices;
with Real_Generic_Matrix_File;

with Ada.Command_Line;    use Ada.Command_Line;

procedure FGenAntiDiag is
   
   package Float_Matrices is new Real_Generic_Matrices (Float);
   package Float_Matrix_File is new Real_Generic_Matrix_File 
     (
      Float,
      Float_Matrices,
      Ada.Float_Text_IO.Get
     );
   
   use Float_Matrices, Float_Matrix_File;
   
   Order : Integer;
   Value : Float := 1.0;
   
begin
   
   Order := Integer'Value (Argument(1));
   Value := Float'Value (Argument(2));
   
   declare
      M : Real_Matrix (1..Order, 1..Order) := (others => (others => 0.0));
      N : Integer := M'Last(1);
   begin
         
      for I in M'Range(1) loop
         M (I, N - I + 1) := Value;
      end loop;
         
      Put_Matrix (M);
      New_Line;
      
   end;
   
end;
