with Ada.Text_IO;         use Ada.Text_IO;
with Ada.Float_Text_IO;   use Ada.Float_Text_IO;

package body Matrices is
   
   function "*" (A, B : Matrix) return Matrix is
      R : Matrix (A'Range (1), B'Range (2));
   begin
      for I in A'Range (1) loop
         for J in B'Range (2) loop
            R (I, J) := 0.0;
            for K in A'Range (2) loop
               R (I, J) := R (I, J) + A (I, K) * B (K, J);
            end loop;
         end loop;
      end loop;
      return R;
   end;

   function "+" (A, B : Matrix) return Matrix is
      R : Matrix (A'Range (1), A'Range (2));
   begin
      for I in A'Range (1) loop
         for J in A'Range (2) loop
            R (I, J) := A (I, J) + B (I, J);
         end loop;
      end loop;
      return R;
   end;
   
   procedure Put (M : Matrix) is
   begin
      Put_Line ("Matrix:");
      for I in M'Range (1) loop
         for J in M'Range (2) loop
            if J > M'First(1) then
               Put (" ");
            end if;
            Put (M (I, J));
         end loop;
         New_Line;
      end loop;
   end;
   
end Matrices;
