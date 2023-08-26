with Unities; use Unities;

package body Symmetry_Operation is
   
   function "*" (N : Unity_Integers; Q : Rational) return Rational
   is (Crystallographic_Integer (N) * Q);
   
   function "*" 
     (
      R : Ternary_3x3_Matrix;
      T : Crystallographic_Translation
     ) return Crystallographic_Translation
   is
      TR : Crystallographic_Translation;
   begin
      for I in T'Range loop
         TR (I) := R(1,I) * T(I) + R(I,2) * T(2) + R(I,3) * T(3);
      end loop;
      return TR;
   end;
   
   function "+" 
     (
      T1, T2 : Crystallographic_Translation
     ) return Crystallographic_Translation
   is
      TR : Crystallographic_Translation;
   begin
      for I in T1'Range loop
         TR (I) := T1 (I) + T2 (I);
      end loop;
      return TR;
   end;

   function "*" (S1, S2 : Symmetry_Operation) return Symmetry_Operation
   is
      R : Symmetry_Operation;
   begin
      R.R := S1.R * S2.R;
      R.T := S2.R * S1.T + S2.T;
      return R;
   end;
   
end Symmetry_Operation;
