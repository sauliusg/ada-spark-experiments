pragma Ada_2022;
with Ada.Text_IO;         use Ada.Text_IO;
with Ada.Integer_Text_Io;      use Ada.Integer_Text_Io;
with Integer_Matrices;    use Integer_Matrices;
with Integer_Matrix_File; use Integer_Matrix_File;

with Ada.Command_Line;    use Ada.Command_Line;
with Option_Processor;    use Option_Processor;

procedure IPermutations is
   
   NOT_A_PERMUTATION : exception;
   
   procedure Help (Option_String : String; Position : in out Positive) is
      procedure P (S : String) renames Put_Line;
   begin
      P ("Generate a permutation matrix");
      P ("USAGE:");
      P ("    " & Command_Name & " --options 3,2,1,4");
   end;
   
   Options : Option_Array :=
     (
      1 => Help_Option("-h", "--help", Help'Access)
     );
   
   procedure Change_Commas_To_Spaces (S : in out String) is
   begin
      for I in S'Range loop
         if S(I) = ',' then
            S(I) := ' ';
         end if;
      end loop;
   end;
   
   function Count_Permutation_Elements (S : String) return Positive is
      N : Positive := 1;
   begin
      for I in S'First .. S'Last - 1 loop
         if S(I) /= ' ' and then S(I + 1) = ' ' then
            N := N + 1;
         end if;
      end loop;
      return N;
   end;
   
   type Permutation_Array is array (Positive range <>) of Positive;
   
   function Make_Permutation_Array (P : String) return Permutation_Array is
      S : String := P;
      N : Natural := 0;
   begin
      Change_Commas_To_Spaces (S);
      N := Count_Permutation_Elements (S);
      declare
         Pos : Natural := 0;
         PA : Permutation_Array (1 .. N);
      begin
         for I in PA'Range loop
            Get (S (Pos+1 .. S'Last), PA (I), Pos);
         end loop;
         return PA;
      end;
   end;
   
   type One_Or_Zero is range 0 .. 1;
   
   type Permutation_Matrix is array (Positive range <>, Positive range <> )
     of One_Or_Zero;
   
   function Get_Max_Value (P : Permutation_Array) return Positive is
      Max : Positive := 1;
   begin
      for X of P loop
         if Max < X then Max := X; end if;
      end loop;
      return Max;
   end;
   
   function Make_Permutation_Matrix
     (P : Permutation_Array) 
     return Permutation_Matrix is
      Max_Value : Positive := Get_Max_Value (P);
   begin
      if Max_Value < P'Length then Max_Value := P'Length; end if;
      
      declare
         M : Permutation_Matrix (1 .. Max_Value, 1 .. Max_Value) :=
           (others => (others => 0));
      begin
         for I in P'Range loop
            M (P(I), I) := 1;
         end loop;
         return M;
      end;
   end;
   
   type Scan_Direction_Type is (ROWS, COLUMNS);
   
   procedure Number_Of_Ones_In_Range 
     (
      P : Permutation_Matrix;
      Scan_Direction : Scan_Direction_Type;
      Min_Ones, Max_Ones : out Natural
     ) is
      N_Ones : Natural;
      Value : One_Or_Zero;
   begin
      Min_Ones := P'Length(1);
      Max_Ones := 0;
      
      for I in P'Range (1) loop
         N_Ones := 0;
         for J in P'Range (2) loop
            case Scan_Direction is
               when COLUMNS => Value := P (I, J);
               when ROWS    => Value := P (J, I);
            end case;
            if Value = 1 then
               N_Ones := N_Ones + 1;
            end if;
         end loop;
         if Max_Ones < N_Ones then
            Max_Ones := N_Ones;
         end if;
         if Min_Ones > N_Ones then
            Min_Ones := N_Ones;
         end if;
      end loop;
   end;
   
   function Is_Permutation_Matrix (P : Permutation_Matrix) return Boolean is
      Max_Number_Of_Ones_In_Columns : Natural;
      Max_Number_Of_Ones_In_Rows    : Natural;
      Min_Number_Of_Ones_In_Columns : Natural;
      Min_Number_Of_Ones_In_Rows    : Natural;
   begin
      Number_Of_Ones_In_Range
        (
         P, COLUMNS,
         Min_Number_Of_Ones_In_Columns,
         Max_Number_Of_Ones_In_Columns
        );
      Number_Of_Ones_In_Range
        (
         P, ROWS,
         Min_Number_Of_Ones_In_Rows,
         Max_Number_Of_Ones_In_Rows
        );
      return
        Max_Number_Of_Ones_In_Columns = 1 and then
        Max_Number_Of_Ones_In_Rows = 1 and then
        Min_Number_Of_Ones_In_Columns = 1 and then
        Min_Number_Of_Ones_In_Rows = 1;
   end;
   
   function Get_Argument (I : Natural) return String renames Get_File_Name;
   function Line_Argument_Count return Natural renames File_Name_Count;

begin
   
   Process_Options (Options, Read_STDIN_If_No_Files => False);
   
   for I in 1 .. Line_Argument_Count loop
      declare
         Permutation : String := Get_Argument (I);
         PA : Permutation_Array := Make_Permutation_Array (Permutation);
         PM : Permutation_Matrix := Make_Permutation_Matrix (PA);
      begin
         if Is_Permutation_Matrix (PM) then
            Put (PM'Length (1), 4);
            Put (PM'Length (2), 4);
            New_Line;
            for I in PM'Range (1) loop
               for J in PM'Range (1) loop
                  Put (Integer (PM (I, J)), 2);
               end loop;
               New_Line;
            end loop;
         else
            raise NOT_A_PERMUTATION with
              "matrix generated from the '" & Permutation & "' " &
              "is not a permutation matrix";
         end if;
      end;
   end loop;
   
exception
   when HELP_PRINTED => null;
      
end;
