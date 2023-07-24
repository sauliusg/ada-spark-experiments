with Ada.Text_IO;         use Ada.Text_IO;
with Integer_Matrices;    use Integer_Matrices;
with Integer_Matrix_File; use Integer_Matrix_File;
with Lazy_Check_TU;       use Lazy_Check_TU;

with Ada.Command_Line;    use Ada.Command_Line;

procedure IMat_Check_TU is
   
begin
   
   for I in 1 .. Argument_Count loop
      declare
         File_Name : String := Argument (I);
         M : Integer_Matrix := Load_Integer_Matrix (File_Name);
      begin
         
         if Is_Total_Unimodular (M) then
            Put ("yes");
         else
            Put ("no");
         end if;
         
         Put (ASCII.HT);
         Put_Matrix_Line (M);
         New_Line;
      end;
   end loop;
   
end;
