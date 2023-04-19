with Matrices; use Matrices;

package Symops is
   
   type Symop is array (1..4, 1..4) of Float;
   
   function "*" (A, B : Symop) return Symop is
      (Symop (Matrix (A) * Matrix (B)));
      
   pragma Inline ("*");
   
   function "+" (A, B : Symop) return Symop is
      (Symop (Matrix (A) + Matrix (B)));
   
   pragma Inline ("+");
   
   procedure Put (S : Symop);
   
   procedure Parse (Text : in String; S : out Symop);
   
end Symops;
