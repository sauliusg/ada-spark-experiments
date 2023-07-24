with Ada.Text_IO;  use Ada.Text_IO;

package body Integer_Matrices is
   
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

end;
