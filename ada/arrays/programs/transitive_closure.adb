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
   
   function "+" ( M1, M2 : Matrix ) return Matrix is
      Result : Matrix (M1'Range(1), M1'Range(2));
   begin
      for I in M1'Range(1) loop
         for J in M1'Range(2) loop
            Result(I,J) := M1(I,J) + M2(I,J);
         end loop;
      end loop;
      return Result;
   end;
   
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
               P, Q, R : Matrix(1 .. N, 1 .. N);
               I, J : Integer := 1;
            begin
               loop
                  exit when End_Of_File (Current_File.all);
                  Get (Current_File.all, R(I,J), Width => 0);
                  if J < R'Last then
                     J := J + 1;
                  else
                     I := I + 1;
                     J := 1;
                  end if;
                  exit when I > R'Last;
               end loop;
               
               Close (Current_File.all);
                              
               Q := R;
               loop
                  P := Q + Q * R;
                  exit when P = Q;
                  Q := P;
               end loop;
         
               Put( N, 1 ); New_Line;
               Put( P );
            end;
         end;
      end if;
      
      if Is_Open (Current_File.all) then
         Close (Current_File.all);
      end if;
      Free (Current_File);
   end loop;
   
end Transitive_Closure;
