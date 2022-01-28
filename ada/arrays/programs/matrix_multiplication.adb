with Ada.Text_IO; use Ada.Text_IO;
-- with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure Matrix_Multiplication is
   
   package Integer_IO is new Ada.Text_IO.Integer_IO (Integer);
   use Integer_IO;
   
   type Matrix is 
     array (Integer range <>, Integer range <>) of Integer;
   
   M : Matrix( 1..10, 1..20 );

begin
   for I in M'Range(1) loop
      for J in M'Range(2) loop
         M(I,J) := I * J;
      end loop;
   end loop;
   
   Put_Line ("The last element of the matrix is:");
   
   Put( "I = " ); Put( M'Last(1), 1 ); Put_Line("");
   Put( "J = " ); Put( M'Last(2), 1 ); Put_Line("");
   
   Put( "M(I,J) = " );
   Put( M(M'Last(1), M'Last(2)), 1 );
   Put_Line("");
   
end;
