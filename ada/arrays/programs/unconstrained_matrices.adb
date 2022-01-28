with Ada.Text_IO; use Ada.Text_IO;
with Ada.Command_Line;    use Ada.Command_Line;
-- with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

with Ada.Unchecked_Deallocation;

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
   
   procedure Initialise_Unit (M : out Matrix) is
   begin
      pragma Assert (M'First(1) = M'First(2));
      pragma Assert (M'Last(1) = M'Last(2));
      
      for I in M'Range(1) loop
         for J in M'Range(2) loop
            if I = J then
               M(I,J) := 1;
            else
               M(I,J) := 0;
            end if;
         end loop;
      end loop;
   end Initialise_Unit;
   
begin
   for I in M'Range(1) loop
      for J in M'Range(2) loop
         M(I,J) := I * J;
      end loop;
   end loop;
   
   Initialise_Unit( U );
   
   Put( M );
   Put_Last( M );
   
   Put_Separator;
   
   Put( U );
   Put_Last( U );
   
   if Argument_Count > 0 then
      N := Integer'Value( Argument(1) );
   end if;
   
   if N <= 20 then
      declare
         X : Matrix( 1..N, 1..N );
      begin
         Initialise_Unit( X );
         Put_Separator;
         Put( X );
         Put_Last( X );
      end;
   else
      for L in 1..20 loop
         declare
            K : Integer := N;            
         begin
            while K >= 2 loop
               declare
                  type PMatrix is access Matrix;
                  procedure Free is
                     new Ada.Unchecked_Deallocation(Matrix, PMatrix);
                  X : Pmatrix;
               begin
                  X := new Matrix( 1..K, 1..K );
         
                  Initialise_Unit( X.all );
                  Put_Separator;
                  Put_Last( X.all );
                  
                  FREE( X );
               end;
               K := K / 2;
            end loop;
         end; -- declare
      end loop;
   end if;
   
end;
