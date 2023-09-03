with Ada.Strings.Maps; use Ada.Strings.Maps;
with Unities;          use Unities;

with GCD_Mod;

package body Symop_Parser is
   
   UNEXPECTED_SYMBOL : exception;

   function Count_Commas (S : in String) return Integer is
      N_Commas : Integer := 0;
   begin
      for C of S loop
         if C = ',' then
            N_Commas := N_Commas + 1;
         end if;
      end loop;
      return N_Commas;
   end Count_Commas;
   
   procedure Skip_Spaces (S : in String; Pos : in out Integer ) is
   begin
      while Pos <= S'Last and then S (Pos) = ' ' loop
         Pos := Pos + 1;
      end loop;
   end;
   
   procedure Expect (
                     S : in String;
                     Pos : in out Integer;
                     Ch_Set : in Character_Set
                    ) is
   begin
      Skip_Spaces (S, Pos);
      if Pos <= S'Last then
         if not Is_In( S (Pos), Ch_Set) then
            raise UNEXPECTED_SYMBOL with
              "symbol " & Character'Image (S (Pos)) & " " &
              "is not expected at position" & Integer'Image (Pos) &
              " in """ & S & """" &
              ", expecting one of """ &
              To_Sequence (Ch_Set) & """";
         end if;
      else
         raise UNEXPECTED_SYMBOL with
           "unexpected end-of-string";
      end if;
   end Expect;
   
   procedure Advance (S : in String; Pos : in out Integer) is
   begin
      if Pos < S'Last then
         Pos := Pos + 1;
      end if;
   end;
   
   procedure Expect (
                     S : in String;
                     Pos : in out Integer;
                     Chars : in String
                    ) is
   begin
      Expect (S, Pos, To_Set (Chars));
   end;
   
   procedure Parse_Rational (
                             S : in String;
                             Pos : in out Integer;
                             Coef : in Unity_Integers;
                             Numerator : out Integer;
                             Denominator : out Integer
                            ) is
      Fin : Integer := Pos;
      Start : Integer := Pos;
      Delim : Character := ' ';
   begin
      Denominator := 1;
      while Fin <= S'Last and then 
        S (Fin) in '0'..'9'
      loop
         Fin := Fin + 1;
      end loop;
      Numerator := Integer'Value (S (Pos..Fin-1));
      Skip_Spaces (S, Fin);
      Pos := Fin - 1;
      if Pos < S'Last then
         if S (Pos + 1) = '/' or else S (Pos + 1) = '.' then
            Delim := S (Pos + 1);
            Pos := Pos + 2;
            Skip_Spaces (S, Pos);
            Fin := Pos;
            while Fin <= S'Last and then 
              S (Fin) in '0'..'9'
            loop
               Fin := Fin + 1;
            end loop;
         end if;         
         if Delim = '/' then
            Denominator := Integer'Value (S (Pos..Fin-1));
         elsif Delim = '.' then
            declare
               Largest_Denom : constant Positive := 12;
               Float_Value : Float := Float'Value (S (Start..Fin-1)) * Float (Largest_Denom);
               Int_Value : Natural := Natural (Float_Value);
               GCD : Positive;
            begin
               GCD := GCD_Mod.GCD (Int_Value, Largest_Denom);
               Numerator := Int_Value / GCD;
               Denominator := Largest_Denom / GCD;
            end;
         end if;
         if Coef < 0 then
            Numerator := Denominator - Numerator;
         end if;
         Pos := Fin - 1;
      end if;
   end;
   
   procedure Parse_Row (
                        S : in String;
                        M : out Symmetry_Operation.Symmetry_Operation;
                        Pos : in out Integer;
                        Row : in Integer
                       ) is
      Coef : Unity_Integers := 1;
   begin
      Skip_Spaces (S, Pos);
      while Pos <= S'Last and then S(Pos) /= ',' and then S(Pos) /= ' ' loop
         case S (Pos) is
            when '-' => Coef := -1;
            when '+' => Coef := +1;
            when 'x'|'X' => Set_Rotation (M, Row, 1, Coef);
            when 'y'|'Y' => Set_Rotation (M, Row, 2, Coef);
            when 'z'|'Z' => Set_Rotation (M, Row, 3, Coef);
            when '0'..'9' =>
               declare
                  Numerator, Denominator : Integer;
               begin
                  Parse_Rational (S, Pos, Coef, Numerator, Denominator);
                  Set_Translation (M, Row, 
                                   Crystallographic_Integer (Numerator), 
                                   Crystallographic_Integer (Denominator)
                                  );
               end;
            when others =>
               raise UNEXPECTED_SYMBOL with
                 "Unexpected character " & S(Pos)'Image &
                 " in string """ & S & """" &
                 " at position " & Pos'Image;
         end case;
         Pos := Pos + 1;
         Skip_Spaces (S, Pos);
      end loop;
   end;
   
   function Parse_Symop (S : String) return 
     Symmetry_Operation.Symmetry_Operation is
      N : Integer := Count_Commas (S) + 1;
      R : Symmetry_Operation.Symmetry_Operation;
      Pos : Integer := 1;
   begin
      Parse_Row (S, R, Pos, Row => 1);
      
      Expect (S, Pos, ",");
      Advance (S, Pos);
      Parse_Row (S, R, Pos, Row => 2);
      
      Expect (S, Pos, ",");
      Advance (S, Pos);
      Parse_Row (S, R, Pos, Row => 3);
      
      return R;
   end;
   
   
end Symop_Parser;
