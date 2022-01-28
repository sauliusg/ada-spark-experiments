with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

with Matrix_Multiplication;

procedure Run_Matrix_Multiplication is
   
   -- package Float_Matrix_Multiplication is
   --    new Matrix_Multiplication (Float);
   
   package Integer_Matrix_Multiplication is
      new Matrix_Multiplication (Integer);
   
   use Integer_Matrix_Multiplication;
   
   type Matrix is new Integer_Matrix_Multiplication.Matrix;
   
   A : Matrix( 1..10, 1..20);
   B : Matrix( 1..20, 1..10 );
   C : Matrix( 1..10, 1..10 );
   
   procedure Put( M : Matrix ) is
   begin
      Put_Line( "[ " );
      for I in M'Range(1) loop
         Put( " [ " );
         for J in M'Range(1) loop
            Put( M(I,J) );
            Put( " " );
         end loop;
         Put_Line( "]" );
      end loop;
      Put_Line( "]" );
   end Put;   
   
begin
   for I in A'Range(1) loop
      for J in A'Range(2) loop
         A(I,J) := I * J;
      end loop;
   end loop;
   
   for I in B'Range(1) loop
      for J in B'Range(2) loop
         B(I,J) := I + J;
      end loop;
   end loop;
   
   Multiply ( A, B, C );
   
   Put ( C );
   
end Run_Matrix_Multiplication;
