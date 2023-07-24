with Ada.Text_IO;         use Ada.Text_IO;
with Integer_Matrices;    use Integer_Matrices;
with Integer_Matrix_File; use Integer_Matrix_File;
with Lazy_Inverse;        use Lazy_Inverse;

with Ada.Command_Line;    use Ada.Command_Line;

procedure IMatInv is
   
begin
   
   for I in 1 .. Argument_Count loop
      declare
         File_Name : String := Argument (I);
         M : Integer_Matrix := Load_Integer_Matrix (File_Name);
         Inv : Integer_Matrix
           (
            M'First(1) .. M'Last(1),
            M'First(2) .. M'Last(2)
           );
      begin
         
         pragma Assert (M'First (1) = M'First(2));
         pragma Assert (M'Last (1) = M'Last(2));
         
         Inv := Inverse (M);
         
         Put_Matrix (Inv);
         New_Line;
      end;
   end loop;
   
end;
