pragma Ada_2022;

with Text_IO; use Text_IO;

with Prove_Unity_Integers_Are_Group;
use Prove_Unity_Integers_Are_Group;

with Unities; use Unities;

procedure Run_Unimodular_Lemma_Checks is
   
   A : Unity_Integer_Array := (1, -1);
   
begin
   
   Unity_Integers_Are_Group (A);
   Put ("Proved that the " & A'Image & " array elements form a group.");
   
end Run_Unimodular_Lemma_Checks;
