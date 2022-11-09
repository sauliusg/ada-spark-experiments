with Matrices; use Matrices;

package Symops is
   
   type Symop is array (1..4, 1..4) of Float;
   
   procedure Put (S : Symop);
   
end Symops;
