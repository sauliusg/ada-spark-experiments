with Ada.Command_Line; use Ada.Command_Line;
with Ada.Text_IO;      use Ada.Text_IO;
with Ada.Integer_Text_IO;   use Ada.Integer_Text_IO;
with Sudoku;           use Sudoku;

procedure Solve_Sudoku is
   
   Field : Sudoku_Field;
   
   Field_File : File_Type;
   
   procedure Load_Field (F : File_Type; S : out Sudoku_Field) is
      Value : Integer;
   begin
      for I in S'Range(1) loop
         for J in S'Range(1) loop
            Get (F, Value);
            S (I,J) := Sudoku_Field_Content (Value);
         end loop;
      end loop;
   end;
   
   Input_File : File_Type;
   
begin
   Open (Input_File, In_File, Argument (1));
   
   Load_Field (Input_File, Field);
   Put (Field);
   
   Close (Input_File);
end Solve_Sudoku;
