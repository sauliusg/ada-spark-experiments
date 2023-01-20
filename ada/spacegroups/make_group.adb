pragma Spark_Mode (On);

with Ada.Text_IO;  use Ada.Text_IO;
with Group_Theory;
   
package body Make_Group is
   
   function Make_Group (E : Ring_Element) return Group
   is
      G : Group (1 .. 1) := (1 => E);
   begin
      pragma Assert (Is_Identity (G (1), G));
      return G;
   end Make_Group;
   
   function Make_Full_Group return Group
   is
      G : Group (1 .. 6) := (1, 2, 3, 4, 5, 6);
   begin
      return G;
   end Make_Full_Group;
   
   function Build_Group (E : Ring_Element) return Group
   is
      type Ring_Element_Array is
        array (Natural range <>) of Ring_Element;
      
      -- New elements obtained by multiplication. Eventually they
      -- should be come a new group containing E:
      N : Ring_Element_Array (1 .. Integer (Ring_Element'Last));
      -- Number of occupied elements in N:
      NN : Natural;
      
      -- Elements still to be tested:
      L : Ring_Element_Array (1 .. Integer (Ring_Element'Last));
      -- Number of occupied elements in L:
      NL : Natural;
      
      -- Check whether the growing array contains the element X:
      function Contains 
        (
         A : Ring_Element_Array;
         X : Ring_Element
        )
        return Boolean
        with
        Post => ((for some E of A => (E = X)) = Contains'Result)
      is
         Y : Ring_Element;
      begin
         for K in A'First .. A'Last loop
            Y := A (K);
            if X = Y then
               pragma Assert (for some E of A => (E = X));
               return True;
            end if;
            pragma Loop_Invariant (for all I in A'First .. K => (A(I) /= X));
         end loop;
         pragma Assert (for all E of A => (E /= X));
         return False;
      end Contains;
      
   begin
      L (1) := E;
      NL := 1;
      
      N (1) := Identity;
      NN := 1;
      
      while NL > 0 loop
         pragma Loop_Invariant (NL <= L'Last);
         declare
            T : Ring_Element := L (NL);
         begin
            NL := NL - 1;
            for I in N'First .. NN loop
               declare
                  X : Ring_Element := N (I);
                  H : Ring_Element := X * T;
               begin
                  -- Put ("H = "); Put (Ring_Element'Image (H)); New_Line;
                  pragma Assert (H in Ring_Element'First .. Ring_Element'Last);
                  pragma Assert (for all I in 1..NN => (for all J in I .. NN => (I = J or else N(I) /= N(J))));
                  if not Contains (N (1..NN), H) then
                     NN := NN + 1;
                     N (NN) := H;
                     NL := NL + 1;
                     L (NL) := H;
                  end if;
               end;
            end loop;
         end;
      end loop;
      
      return Group (N (1..NN));
   end Build_Group;
   
end Make_Group;
