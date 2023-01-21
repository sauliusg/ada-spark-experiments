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
        array (Positive range <>) of Ring_Element;
      
      -- New elements obtained by multiplication. Eventually they
      -- should be come a new group containing E:
      N : Ring_Element_Array (1 .. Positive (Ring_Element'Last)) := 
        (others => 0);
      -- Number of occupied elements in N:
      NN : Natural;
      
      -- Elements still to be tested:
      L : Ring_Element_Array (1 .. Positive (Ring_Element'Last)) :=
        (others => 0);
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
               -- pragma Assert (for some E of A => (E = X));
               return True;
            end if;
            pragma Loop_Invariant (for all I in A'First .. K => (A(I) /= X));
         end loop;
         pragma Assert (for all E of A => (E /= X));
         return False;
      end Contains;
      
   function All_Elements_Are_Distinct_In_Prefix
     (
      G : Ring_Element_Array;   -- array with group elements to examine
      N : Positive              -- last index of the array prefix
     )
      return Boolean 
      is
     (
      for all I in G'First .. N =>
         (for all J in I .. N => (I = J or else G(I) /= G(J)))
     )
          with 
            Ghost,
            Pre => N <= G'Last;

   begin
      L (L'First) := E;
      NL := L'First;
      
      N (N'First) := Identity;
      NN := N'First;
      
      pragma Assert (L'First <= L'Last);
      pragma Assert (NL <= L'Last);
      
      while NL > 0 loop
         pragma Loop_Invariant (if NL <= L'Last then 
                                   All_Elements_Are_Distinct_In_Prefix (L, NL));
         pragma Loop_Invariant (NL >= L'First);
         pragma Loop_Invariant (NL <= L'Last);
         declare
            T : Ring_Element := L (NL);
         begin
            NL := NL - 1;
            pragma Assert (NL < L'Last);
            for I in N'First .. NN loop
               pragma Loop_Invariant (NN >= N'First);
               pragma Loop_Invariant (NN <= N'Last);
               pragma Loop_Invariant (for all I in N'First .. NN => 
                                        (for all J in N'First .. NN => 
                                           (I = J or else N(I) /= N(J))));
               
               pragma Loop_Invariant (Ring_Element'Last - Ring_Element'First + 1 <= N'Length);
               pragma Loop_Invariant (Natural (Ring_Element'Last - Ring_Element'First + 1) <= NN);
               
               declare
                  X : Ring_Element := N (I);
                  H : Ring_Element := X * T;
               begin
                  -- Put ("H = "); Put (Ring_Element'Image (H)); New_Line;
                  pragma Assert (H in Ring_Element'First .. Ring_Element'Last);
                  
                  if not Contains (N (1..NN), H) then
                     pragma Assert (for all I in N'First..NN => (N(I) /= H));
                     pragma Assert (for all I in N'First..NN => 
                                      (for all J in I .. NN => (N(I) /= N(J))));
                     NN := NN + 1;
                     N (NN) := H;
                     NL := NL + 1;
                     L (NL) := H;
                  end if;
                  pragma Assert 
                    (
                     if (for all I in N'First..NN => (N(I) /= H)) then 
                          NN <= Natural (Ring_Element'Last - Ring_Element'First + 1)
                    );
                  
               end;
            end loop;
         end;
      end loop;
      
      return Group (N (1..NN));
   end Build_Group;
   
end Make_Group;
