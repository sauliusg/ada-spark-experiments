with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;

with Matrix_Multiplication;

procedure Run_Matrix_Multiplication is
   
   package Float_Matrix_Multiplication is
      new Matrix_Multiplication (Float, 0.0);
   
   package Integer_Matrix_Multiplication is
      new Matrix_Multiplication (Integer, 0);
   
   use Integer_Matrix_Multiplication;
   use Float_Matrix_Multiplication;
   
   type IMatrix is new Integer_Matrix_Multiplication.Matrix;
   type FMatrix is new Float_Matrix_Multiplication.Matrix;
   
   procedure Put( M : IMatrix ) is
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
   
   procedure Put( M : FMatrix ) is
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
   
   A : IMatrix( 1..10, 1..20);
   B : IMatrix( 1..20, 1..10 );
   C : IMatrix( 1..10, 1..10 );
   
   X : FMatrix( 1..10, 1..20);
   Y : FMatrix( 1..20, 1..10 );
   Z : FMatrix( 1..10, 1..10 );
   
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
   
   New_Line;
   
   for I in X'Range(1) loop
      for J in X'Range(2) loop
         X(I,J) := Float(I) * Float(J);
      end loop;
   end loop;
   
   for I in Y'Range(1) loop
      for J in Y'Range(2) loop
         Y(I,J) := Float(I + J);
      end loop;
   end loop;
   
   Multiply ( X, Y, Z );
   Put ( Z );
   
end Run_Matrix_Multiplication;
