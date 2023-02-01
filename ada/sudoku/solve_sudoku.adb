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
   
   procedure Load_Field (File_Name : String; S : out Sudoku_Field) is
      Input_File : File_Type;
   begin
      Open (Input_File, In_File, File_Name);
      Load_Field (Input_File, S);
      Close (Input_File);
   end;
   
begin
   Load_Field (Argument (1), Field);
   Put (Field);
end Solve_Sudoku;
