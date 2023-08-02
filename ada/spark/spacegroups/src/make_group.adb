pragma Spark_Mode (On);

with Ada.Text_IO;  use Ada.Text_IO;
   
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
      G : Group (1 .. 4) := (1, 6, 36, 31);
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
      begin
         for K in A'First .. A'Last loop
            if X = A (K) then
               return True;
            end if;
            pragma Loop_Invariant (for all I in A'First .. K => (A(I) /= X));
         end loop;
         pragma Assert (for all E of A => (E /= X));
         return False;
      end Contains;
      
   begin
      L (L'First) := E;
      NL := L'First;
      
      N (N'First) := Identity;
      NN := N'First;
      
      while NL >= L'First loop
         
         pragma Loop_Invariant (NN <= N'Last);
         pragma Loop_Invariant (NN >= N'First);
         pragma Loop_Invariant (N (N'First) = Identity);
         pragma Assume (NL <= L'Last);
                  
         declare
            T : Ring_Element := L (NL);
         begin
            NL := NL - 1;
            pragma Assert (NL < L'Last);
            for I in N'First .. NN loop
               
               pragma Loop_Invariant (NN >= N'First);
               pragma Loop_Invariant (NN <= N'Last);
               pragma Loop_Invariant (N (N'First) = Identity);
               
               declare
                  H : Ring_Element := N (I) * T;
               begin
                  
                  pragma Assume (if not Contains (N (N'First..NN), H) then
                    NN < N'Last);
                  pragma Assume (if not Contains (N (N'First..NN), H) then
                    NL < L'Last);
                     
                  if not Contains (N (N'First..NN), H) then
                     
                     NN := NN + 1;
                     N (NN) := H;
                     NL := NL + 1;
                     L (NL) := H;
                     
                  end if;
               end;
            end loop;
         end;
      end loop;
      
      pragma Assume (All_Elements_Have_Inverses (Group (N (N'First .. NN))));
      pragma Assume (Is_Closed_On_Multiplication (Group (N (N'First .. NN))));
      
      return Group (N (N'First .. NN));
   end Build_Group;
   
end Make_Group;
