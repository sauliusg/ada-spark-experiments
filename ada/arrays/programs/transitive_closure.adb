with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Command_Line;    use Ada.Command_Line;
with Ada.Unchecked_Deallocation;

with Matrix_Multiplication;

procedure Transitive_Closure is
   
   type TZeroOne is range 0 .. 1;
   
   function "+" ( N1, N2 : TZeroOne ) return TZeroOne is
      (if N1 = 0 and then N2 = 0 then 0 else 1);
   
   package Integer_Matrix_Multiplication is
      new Matrix_Multiplication (TZeroOne, 0, "+" => "+");
   
   package Zero_One_IO is new Ada.Text_IO.Integer_IO (TZeroOne);
   use Zero_One_IO;
   
   use Integer_Matrix_Multiplication;
   
   type Matrix is new Integer_Matrix_Multiplication.Matrix;
   
   procedure Put( M : Matrix ) is
   begin
      for I in M'Range(1) loop
         for J in M'Range(1) loop
            Put( M(I,J) );
            Put( " " );
         end loop;
         New_Line;
      end loop;
   end Put;   
   
   function "=" ( A, B : Matrix ) return Boolean is
   begin
      for I in A'Range(1) loop
         for J in A'Range(2) loop
            if A(I,J) /= B(I,J) then
               return False;
            end if;
         end loop;
      end loop;
      return True;
   end;
   
   Number_Of_Inputs : Integer :=
       (if Argument_Count > 0 then Argument_Count else 1);
       
   type Access_File_Type is access File_Type;
   Current_File : Access_File_Type;
       
   procedure Free is
      new Ada.Unchecked_Deallocation(File_Type, Access_File_Type);

begin
   
   for Input_Idx in 1 .. Number_Of_Inputs loop
      if Argument_Count = 0 then
         Current_File := new File_Type'(Standard_Input);
      else
         Current_File := new File_Type;
         Open (Current_File.all, In_File, Argument(Input_Idx));
      end if;
      
      if not End_Of_File (Current_File.all) then
         declare
            N : Integer := Integer'Value (Get_Line (Current_File.all));
         begin
            declare
               P, Q : Matrix(1 .. N, 1 .. N);
               I, J : Integer := 1;
            begin
               loop
                  exit when End_Of_File (Current_File.all);
                  Get (Current_File.all, P(I,J), Width => 0);
                  if J < P'Last then
                     J := J + 1;
                  else
                     I := I + 1;
                     J := 1;
                  end if;
                  exit when I > P'Last;
                  exit when End_Of_File (Current_File.all);
               end loop;
               
               Close (Current_File.all);
               Free (Current_File);
               
               loop
                  Q := P * P;
                  exit when P = Q;
                  P := Q;
               end loop;
         
               Put( N, 1 ); New_Line;
               Put( P );
            end;
         end;
      end if;
   end loop;
   
end Transitive_Closure;
