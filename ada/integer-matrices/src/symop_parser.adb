-- with Text_IO; -- for debug prints...
with Ada.Strings.Maps;          use Ada.Strings.Maps;

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
