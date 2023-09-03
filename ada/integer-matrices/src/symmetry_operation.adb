with Text_IO;      use Text_IO;
with Unities;      use Unities;
with Lazy_Inverse; use  Lazy_Inverse;

package body Symmetry_Operation is
   
   function "*" (N : Unity_Integers; Q : Rational) return Rational
   is (Integer (N) * Q);
   
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
   
   function "-" (T : Crystallographic_Translation) 
                return Crystallographic_Translation
   is 
      RT : Crystallographic_Translation;
   begin
      for I in T'Range loop
         RT (I) := - T (I);
      end loop;
      return RT;
   end;
   
   function "*" (S1, S2 : Symmetry_Operation) return Symmetry_Operation
   is
      R : Symmetry_Operation;
   begin
      R.R := S1.R * S2.R;
      R.T := S2.R * S1.T + S2.T;
      return R;
   end;
   
   function Inverse (M : Ternary_Matrix) return Ternary_Matrix is
      IM, IInv : Integer_Matrix (M'Range (1), M'Range (2));
      Inv : Ternary_Matrix (M'Range (1), M'Range (2));
   begin
      for I in M'First(1) .. M'Last(1) loop
         for J in M'First(2) .. M'Last(2) loop
            IM (I,J) := Integer (M (I,J));
         end loop;
      end loop;
      
      IInv := Inverse (IM);
      
      for I in M'First(1) .. M'Last(1) loop
         for J in M'First(2) .. M'Last(2) loop
            Inv (I,J) := Unity_Integers (IInv (I,J));
         end loop;
      end loop;
      
      return Inv; 
   end;
   
   -- assume R' is the inverse of R:
   -- R * R' = I, where I is the unity matrix.
   -- then:
   -- (R,t) * (R',t') = (R*R', R't + t') = (I,0)
   -- =>
   -- R't + t' = 0
   -- =>
   -- t' = -R' * t = R' * (-t)
   function Inverse (S : Symmetry_Operation) return Symmetry_Operation is
      R : Symmetry_Operation;
   begin
      R.R := Inverse (S.R);
      R.T := R.R * (-S.T);
      return R;
   end;
   
   procedure Set_Rotation
     (
      S : out Symmetry_Operation;
      I, J : in Integer;
      Value : in Unity_Integers
     ) is
   begin
      S.R (I,J) := Value;
   end;
   
   procedure Set_Translation
     (
      S : out Symmetry_Operation;
      I : in Integer;
      Numerator: in Integer;
      Denominator : in Crystallographic_Integer
     ) is
   begin
      S.T (I) := Numerator / Integer (Denominator);
   end;

   procedure Add_Translation
     (
      S : out Symmetry_Operation;
      I : in Integer;
      Numerator: in Integer;
      Denominator : in Crystallographic_Integer
     ) is
   begin
      S.T (I) := S.T (I) + Rational'(Numerator / Integer (Denominator));
   end;

   procedure Put (S : Symmetry_Operation) is
   begin
      for I in S.R'Range(1) loop
         for J in S.R'Range(2) loop
            Put (S.R(I,J)'Image);
            Put (" ");
         end loop;
         Put ("  ");
         Put (Numerator (S.T(I))'Image & " /" & Denominator (S.T(I))'Image);
         New_Line;
      end loop;
   end;

end Symmetry_Operation;
