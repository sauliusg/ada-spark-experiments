with Ada.Text_IO;  use Ada.Text_IO;

with Integer_Matrices; use Integer_Matrices;

procedure Run_Matmult is
   
   -- This is an example of totally unimodular matrix the square of
   --  which is not totally unimodular:
   
   -- M : Integer_Matrix(1..3, 1..3) :=
   --   (
   --    ( 1,  0,  1 ),
   --    ( 0, -1,  1 ),
   --    ( 0,  1,  0 )
   --   );
   
   M : Integer_Matrix(1..3, 1..3) :=
     (
      (-1, -1,  0 ),
      ( 0,  0,  1 ),
      ( 0, -1,  1 )
     );

   P : Integer_Matrix(1..3,1..3);
   
begin
   
   P := ((1,0,0), (0,1,0), (0,0,1));
   
   for I in 1 .. 20 loop
      P := P * M;
      Put_Matrix (P);
      New_Line;
   end loop;

end;
