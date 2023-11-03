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
   
   function "+" (A, B : Integer_Matrix) return Integer_Matrix is
      R : Integer_Matrix := A;
   begin
      for I in A'Range(1) loop
         for J in B'Range(2) loop
            R(I,J) := R(I,J) + B(I,J);
         end loop;
      end loop;      
      return R;
   end;
   
   function "-" (A, B : Integer_Matrix) return Integer_Matrix is
      R : Integer_Matrix := A;
   begin
      for I in A'Range(1) loop
         for J in B'Range(2) loop
            R(I,J) := R(I,J) - B(I,J);
         end loop;
      end loop;      
      return R;
   end;
   
   function Trace (M : Integer_Matrix) return Integer is
      T : Integer := 0;
   begin
      for I in M'Range(1) loop
         T := T + M (I,I);
      end loop;
      return T;
   end;
   
   function Submatrix 
     (
      M : Integer_Matrix;
      P, Q : Integer
     ) return Integer_Matrix is
      A : Integer_Matrix (1 .. M'Length(1) - 1, 1 .. M'Length(2) - 1);
      K, L : Integer;
   begin
      K := 1; L := 1;
      for I in M'Range(1) loop
         if I /= P then 
            for J in M'Range(2) loop
               if J /= Q then
                  A(K,L) := M(I,J);
                  L := L + 1;
               end if;
            end loop;
            L := 1;
            K := K + 1;
         end if;
      end loop;
      return A;
   end Submatrix;
   
   function Transpose (M : in Integer_Matrix) return Integer_Matrix is
      T : Integer_Matrix
        (
         M'First(2) .. M'Last (2),
         M'First(1) .. M'Last (1)
        );
   begin
      for I in M'Range(1) loop
         for J in M'Range(1) loop
            T (J,I) := M (I,J);
         end loop;
      end loop;
      return T;
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

   procedure Put_Matrix_Line (M : Integer_Matrix) is
   begin
      Put (Integer'Image(M'Length(1)) & " " & Integer'Image(M'Length(2)) & "  ");
      for I in M'Range (1) loop
         for J in M'Range (2) loop
            Put (Integer'Image (M (I, J)));
            if J /= M'Last(2) then
               Put (" ");
            end if;
         end loop;
         if I /= M'Last(1) then
            Put ("  ");
         end if;
      end loop;
   end Put_Matrix_Line;

end;
