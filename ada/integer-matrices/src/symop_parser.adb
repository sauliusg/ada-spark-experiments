with Text_IO; -- for debug prints...
with Ada.Strings.Maps;          use Ada.Strings.Maps;

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
                             Coef : in Integer;
                             Numerator : out Integer;
                             Denominator : out Integer
                            ) is
      Fin : Integer := Pos;
      Start : Integer := Pos;
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
         if S (Pos + 1) = '/' then
            Pos := Pos + 2;
            Skip_Spaces (S, Pos);
            Fin := Pos;
            while Fin <= S'Last and then 
              S (Fin) in '0'..'9'
            loop
               Fin := Fin + 1;
            end loop;
            Denominator := Integer'Value (S (Pos..Fin-1));
         elsif S (Pos + 1) = '.' then
            Fin := Pos + 2;
            while Fin <= S'Last and then 
              S (Fin) in '0'..'9'
            loop
               Fin := Fin + 1;
            end loop;
            declare
               Largest_Denom : constant Positive := 12;
               Float_Value : Float := Float'Value (S (Start..Fin-1)) * Float (Largest_Denom);
               Int_Value : Natural := Natural (Float_Value);
               GCD : Positive;
            begin
               Text_IO.Put_Line ("""" & S (Start..Fin-1) & """");
               Text_IO.Put_Line (Float_Value'Image);
               Text_IO.Put_Line (Int_Value'Image);
               GCD := GCD_Mod.GCD (Int_Value, Largest_Denom);
               Text_IO.Put_Line (GCD'Image);
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
                        M : out Integer_Matrix;
                        Pos : in out Integer;
                        Row : in Integer
                       ) is
      Coef : Integer := 1;
   begin
      while Pos <= S'Last and then S(Pos) /= ',' and then S(Pos) /= ' ' loop
         Skip_Spaces (S, Pos);
         case S (Pos) is
            when '-' => Coef := -1;
            when '+' => Coef := +1;
            when 'x'|'X' => M (Row,1) := Coef;
            when 'y'|'Y' => M (Row,2) := Coef;
            when 'z'|'Z' => M (Row,3) := Coef;
            when '0'..'9' =>
               declare
                  Numerator, Denominator : Integer;
               begin
                  Parse_Rational (S, Pos, Coef, Numerator, Denominator);
                  Text_IO.Put_Line (">>> " & 
                                      Numerator'Image & " /" &
                                      Denominator'Image);
                  Text_IO.Put_Line ("Pos = " & Pos'Image);
               end;
            when others =>
               raise UNEXPECTED_SYMBOL with
                 "Unexpected character " & S(Pos)'Image &
                 " in string """ & S & """" &
                 " at position " & Pos'Image;
         end case;
         Pos := Pos + 1;
      end loop;
   end;
   
   function Parse_Symop (S : String) return Integer_Matrix is
      N : Integer := Count_Commas (S) + 1;
      M : Integer_Matrix( 1..N, 1..N ) :=
        (others => (others => (0)));
      Pos : Integer := 1;
   begin
      Parse_Row (S, M, Pos, Row => 1);
      
      Expect (S, Pos, ",");
      Advance (S, Pos);
      Parse_Row (S, M, Pos, Row => 2);
      
      Expect (S, Pos, ",");
      Advance (S, Pos);
      Parse_Row (S, M, Pos, Row => 3);
      return M;
   end;
   
   
end Symop_Parser;
