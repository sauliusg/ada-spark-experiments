with Integer_Matrices; use Integer_Matrices;
with Lazy_Determinant; use Lazy_Determinant;

package body Lazy_Inverse is
   
   function Inverse (M : Integer_Matrix) return Integer_Matrix is
      Inv : Integer_Matrix
        (
         M'First(1) .. M'Last(1),
         M'First(2) .. M'Last(2)
        );
      Coef : Integer := 1;
      D : Integer;
   begin
      D := Det (M);
      
      pragma Assert (abs(D) = 1,
                     "Only integer matrices with " &
                       "determinant 1 or -1 are invertible");
      
      for I in M'Range(1) loop
         for J in M'Range(2) loop
            Inv (I,J) := Coef * Det (Submatrix(M,I,J)) * D;
            Coef := - Coef;
         end loop;
         Coef := (if I mod 2 = 0 then 1 else -1);
      end loop;
      return Inv;
   end;
   
end Lazy_Inverse;
