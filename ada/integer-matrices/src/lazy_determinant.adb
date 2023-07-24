with Integer_Matrices; use Integer_Matrices;

package body Lazy_Determinant is
   
   function Det (M : Integer_Matrix) return Integer is
      Value : Integer := 0;
      I, J : Integer;
      Coef : Integer := 1;
   begin
      if M'Length(1) = 1 and then M'Length(2) = 1 then
         I := M'First(1);
         J := M'First(2);
         return M (I,J);
      elsif M'Length(1) = 2 and then M'Length(2) = 2 then
         return Det2 (M);
      elsif M'Length(1) = 3 and then M'Length(2) = 3 then
         return Det3 (M);
      else
         I := M'First(1);
         for J in M'Range loop
            -- Lazy evaluation: only calculate the minor if the
            --  coefficient is not zero:
            if M (I,J) /= 0 then
               Value := Value + Coef * Det (Submatrix (M, I, J));
            end if;
         end loop;
         return Value;
      end if;
   end;
   
   function Det2 (M : Integer_Matrix) return Integer is
      (M(1,1) * M(2,2) - M(1,2) * M(2,1));
      
   function Det3 (M : Integer_Matrix) return Integer is
      ( 
        M(1,1) * M(2,2) * M(3,3) + 
        M(1,2) * M(2,3) * M(3,1) + 
        M(2,1) * M(3,2) * M(1,3) -
        M(1,3) * M(2,2) * M(3,1) - 
        M(2,1) * M(1,2) * M(3,3) - 
        M(1,1) * M(2,3) * M(3,2)
      );
      
end Lazy_Determinant;
