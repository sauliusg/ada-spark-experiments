with Text_IO; use Text_IO;
with Permutation_Matrices; use Permutation_Matrices;

procedure Permmat with SPARK_Mode is
   
   P : Permutation_Matrix := Unity (5);
   
begin
   
   declare
      L : Integer := Length (P);
      P_Element_Bits : Integer := P'Size / (Length (P) ** 2);
   begin
      Put_Line (L'Image);
      Put_Line (P'Size'Image);
      Put_Line (P_Element_Bits'Image);
   end;
   
end;
