with Ada.Text_IO;  use Ada.Text_IO;

procedure Run_Matmult is
   
   type Integer_Matrix is 
     array (Integer range <>, Integer range <>) of Integer;   
   
   function "*" (A, B : Integer_Matrix) return Integer_Matrix is
      R : Integer_Matrix (A'Range(1), B'Range(2)) :=
        (others => (others => 0));
   begin
      for I in A'Range(1) loop
         for J in B'Range(2) loop
            for K in A'Range(2) loop
               R(I,J) := R(I,J) + A(I,K) * B(K,J);
            end loop;
         end loop;
      end loop;      
      return R;
   end;
   
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
      ( 0, -1, -1 )
     );

   P : Integer_Matrix(1..3,1..3);
   
   procedure Put_Matrix (M : Integer_Matrix) is
   begin
      Put_Line (Integer'Image(M'Length(1)) & " " & Integer'Image(M'Length(2)));
      for I in M'Range (1) loop
         for J in M'Range (2) loop
            Put (Integer'Image (M (I, J)) & " ");
         end loop;
         New_Line;
      end loop;
   end Put_Matrix;
   
begin
   
   P := ((1,0,0), (0,1,0), (0,0,1));
   
   for I in 1 .. 20 loop
      P := P * M;
      Put_Matrix (P);
      New_Line;
   end loop;

end;
