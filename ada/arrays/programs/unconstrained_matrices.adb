with Ada.Text_IO; use Ada.Text_IO;
-- with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure Unconstrained_Matrices is
   
   package Integer_IO is new Ada.Text_IO.Integer_IO (Integer);
   use Integer_IO;
   
   type Matrix is 
     array (Integer range <>, Integer range <>) of Integer;
   
   M : Matrix( 1..10, 1..20 );
   U : Matrix( 1..8, 1..8 );
   
   N : Integer := 12;
   
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
   
   procedure Put_Last( M : Matrix ) is
   begin
      Put_Line ("The last element of the matrix is:");
      
      Put( "I = " ); Put( M'Last(1), 1 ); Put_Line("");
      Put( "J = " ); Put( M'Last(2), 1 ); Put_Line("");
      
      Put( "M(I,J) = " );
      Put( M(M'Last(1), M'Last(2)), 1 );
      Put_Line("");
   end Put_Last;
   
   procedure Put_Separator is
   begin
      Put_Line( "" );
      Put_Line( "---------------" );
      Put_Line( "" );
   end;
   
begin
   for I in M'Range(1) loop
      for J in M'Range(2) loop
         M(I,J) := I * J;
      end loop;
   end loop;
   
   for I in U'Range(1) loop
      for J in U'Range(2) loop
         if I = J then
            U(I,J) := 1;
         else
            U(I,J) := 0;
         end if;
      end loop;
   end loop;
   
   Put( M );
   Put_Last( M );
   
   Put_Separator;
   
   Put( U );
   Put_Last( U );
   
end;
