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
   
   type Sudoku_Solution_Candidate is record
      X, Y : Sudoku_Integer;
   end record;
   
   Max_Candidates : constant Integer := Integer (Sudoku_Integer'Last) ** 2;
   
   type Solution_Candidate_Array is
     array (1 .. Max_Candidates) of Sudoku_Solution_Candidate;
   
   type Sudoku_Solution_State is (In_Progress, Solved, Failed);
   
   procedure Solve
     (
      F : in out Sudoku_Field;
      Candidates : in out Solution_Candidate_Array;
      N : in Integer;
      N_Candidates : in Integer;
      State : in out Sudoku_Solution_State
     ) is
      X : Sudoku_Integer := Candidates (N).X;
      Y : Sudoku_Integer := Candidates (N).Y;
   begin
      
      if N > N_Candidates then
         State := Solved;
         return;
      end if;
      
      for Val in Sudoku_Integer'Range loop
         if Digit_Is_Permissible (F, Val, X, Y) then
            F (X, Y) := Val;
            Solve (F, Candidates, N + 1, N_Candidates, State);
            if State = Solved then
               return;
            end if;
         end if;
      end loop;
      
      -- backtrack:
      F (X, Y) := 0;
      
   end Solve;
   
   procedure Fill_Candidates
     (
      F : in Sudoku_Field;
      Candidates : out Solution_Candidate_Array;
      N_Candidates : out Integer
     ) is
   begin
      N_Candidates := 0;
      for I in F'Range(1) loop
         for J in F'Range(2) loop
            if F (I, J) = 0 then
               N_Candidates := N_Candidates + 1;
               Candidates (N_Candidates).X := I;
               Candidates (N_Candidates).Y := J;
            end if;
         end loop;
      end loop;
   end;
   
   procedure Solve
     (
      F : in out Sudoku_Field;
      State : out Sudoku_Solution_State
     ) is
      Candidates : Solution_Candidate_Array;
      N_Candidates : Integer;
   begin
      Fill_Candidates (F, Candidates, N_Candidates );
      
      State := In_Progress;
      
      Solve (F, Candidates, 1, N_Candidates, State);
      
      if State /= Solved then
         State := Failed;
      end if;
   end;

   State : Sudoku_Solution_State;
   
begin
   Load_Field (Argument (1), Field);
   
   Solve (Field, State);
   
   if State = Solved then
      Put (Field);
   else
      Put_Line ("No solutions could be found");
   end if;
end Solve_Sudoku;
