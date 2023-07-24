with System;           use System;
with Integer_Matrices; use Integer_Matrices;
with Lazy_Determinant; use Lazy_Determinant;

package body Lazy_Check_TU is
   
   function Is_Total_Unimodular (A : Integer_Matrix) return Boolean is
      D : Integer;
      M : Integer := A'Length(1);
      N : Integer := A'Length(2);
      F : constant Integer := Integer'First;
   begin
      if M < N then
         pragma Assert (F < A'First(1));
         for K in A'Range(2) loop
            if not Is_Total_Unimodular (Submatrix (A,F,K)) then
               return False;
            end if;
         end loop;
         return True;
      elsif M > N then
         pragma Assert (F < A'First(2));
         for K in A'Range(1) loop
            if not Is_Total_Unimodular (Submatrix (A,K,F)) then
               return False;
            end if;
         end loop;
         return True;
      else
         -- The matrix is square:
         D := Det (A);
         if abs(D) /= 1 and then D /= 0 then
            return False;
         else
            if A'Length(1) = 1 then
               return True;
            else
               for I in A'Range(1) loop
                  for J in A'Range(2) loop
                     if not Is_Total_Unimodular (Submatrix (A,I,J)) then
                       return False;
                     end if;
                  end loop;
               end loop;
               return True;
            end if;
         end if;
      end if;
   end;
   
end Lazy_Check_TU;
