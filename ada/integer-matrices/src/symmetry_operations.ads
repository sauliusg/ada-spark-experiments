with Integer_Matrices; use Integer_Matrices;
with Unities;          use Unities;
with Ternary_Matrices; use Ternary_Matrices;

with Generic_Rational;

package Symmetry_Operations is
   
   type Crystallographic_Integer is range -6 .. 6;
   
   package Crystallographic_Rational is
      new Generic_Rational (Integer);
   
   use Crystallographic_Rational;
   
   type Symmetry_Operation is private;
   
   function "*" (S1, S2 : Symmetry_Operation) return Symmetry_Operation;
   
   function Inverse (S : Symmetry_Operation) return Symmetry_Operation;
   
   function Mod1 (S : in Symmetry_Operation) 
                 return Symmetry_Operation;
   
   procedure Mod1 (S : in out Symmetry_Operation);

   procedure Set_Rotation
     (
      S : out Symmetry_Operation;
      I, J : in Integer;
      Value : in Unity_Integers
     );
   
   procedure Set_Translation
     (
      S : out Symmetry_Operation;
      I : in Integer;
      Numerator : in Integer;
      Denominator : in Crystallographic_Integer
     );
   
   procedure Add_Translation
     (
      S : out Symmetry_Operation;
      I : in Integer;
      Numerator : in Integer;
      Denominator : in Crystallographic_Integer
     );
     
   procedure Put (S : Symmetry_Operation);
   
private
   
   type Crystallographic_Translation is
     array (1..3) of Rational;
   
   subtype Ternary_3x3_Matrix is Ternary_matrix (1..3, 1..3);
   
   function "*" 
     (
      R : Ternary_3x3_Matrix;
      T : Crystallographic_Translation
     ) return Crystallographic_Translation;

   type Symmetry_Operation is record
      R : Ternary_matrix (1..3, 1..3) := 
        (others => (others => 0));
      T : Crystallographic_Translation :=
        (others => 0 / 1);
   end record;

end Symmetry_Operations;
