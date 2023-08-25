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
   
   function Build_Group (G : Group; E : Ring_Element) return Group
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
      
      procedure Add_Element
        (
         A : in out Ring_Element_Array;
         M : in out Natural;
         E : in Ring_Element
        ) 
        with 
        Pre => M < A'Last and then M + 1 >= A'First,
        Post => M <= A'Last and then M = M'Old + 1 and then Contains (A, E) and then
        A (M) = E and then (for all I in A'First .. M'Old => (A'Old (I) = A (I))) and then
        (if A'Old'Length > 0 and then M'Old >= A'Old'First and then  A'Old (A'Old'First) = Identity then A (A'First) = Identity)
      is
      begin
         M := M + 1;
         A (M) := E;
      end;
      
      pragma Inline (Add_Element);
      
   begin
      L (L'First) := E;
      NL := L'First;
      
      pragma Assume (N'First = G'First);
      pragma Assume (N'Last >= G'Last);
      
      N (G'First .. G'Last) := Ring_Element_Array (G (G'First .. G'Last));
      NN := G'Last;
      
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
               pragma Loop_Invariant (Has_Identity (Group (N (N'First .. NN))));
               
               declare
                  H : Ring_Element := N (I) * T;
               begin
                  
                  pragma Assume (if not Contains (N (N'First..NN), H) then
                    NN < N'Last);
                  pragma Assume (if not Contains (N (N'First..NN), H) then
                    NL < L'Last);
                     
                  if not Contains (N (N'First..NN), H) then
                     
                     pragma Assert (N (N'First) = Identity);
                     pragma Assert (NN + 1 >= N'First);
                     pragma Assert (NN < N'Last);
                     -- WORKING HERE:
                     -- NN := NN + 1;
                     -- N (NN) := H;
                     Add_Element (N, NN, H); -- Add the element to the growing group
                     pragma Assert (NN >= N'First);
                     pragma Assert (NN <= N'Last);
                     pragma Assert (N (N'First) = Identity);
                     
                     -- pragma Assert (NL + 1 >= L'First);
                     -- pragma Assert (NL < L'Last);
                     
                     -- NL := NL + 1;
                     -- pragma Assert (NL >= L'First);
                     -- pragma Assert (NL <= L'Last);
                     -- L (NL) := H;
                     
                     Add_Element (L, NL, H); -- Add the element to the candidate list
                     
                     pragma Assert (N (N'First) = Identity);
                     pragma Assert (Has_Identity (Group (N (N'First .. NN))));
                  end if;
               end;
            end loop;
         end;
      end loop;
      
      pragma Assume (All_Elements_Have_Inverses (Group (N (N'First .. NN))));
      pragma Assume (Is_Closed_On_Multiplication (Group (N (N'First .. NN))));
      
      return Group (N (N'First .. NN));
   end Build_Group;

   function Build_Group (E : Ring_Element) return Group
   is
      G : Group (1..1) := (others => Identity);
   begin
      pragma Assert (Is_Identity (G(1), G));
      return Build_Group (G, E);
   end;
   
end Make_Group;
