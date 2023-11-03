with Ada.Text_IO;         use Ada.Text_IO;
with Integer_Matrices;    use Integer_Matrices;
with Integer_Matrix_File; use Integer_Matrix_File;
with Lazy_Check_TU;       use Lazy_Check_TU;

with Ada.Command_Line;    use Ada.Command_Line;

procedure IMat_Check_TU is
   
   File : File_Type;
   
   Empty_Line : Boolean := False;

begin
   
   for I in 1 .. Argument_Count loop
      Open (File, In_File, Argument (I));
      Empty_Line := False;
      while not End_Of_File (File) loop
         declare
            M : Integer_Matrix := Load_Integer_Matrix (File);
         begin
            if Empty_Line then
               New_Line;
            end if;
         
            if Is_Total_Unimodular (M) then
               Put ("yes");
            else
               Put ("no");
            end if;
         
            Put (ASCII.HT);
            Put_Matrix_Line (M);
            New_Line;
            Skip_To_Next_Matrix (File, Empty_Line);
         end;
      end loop;
      Close (File);
      if I < Argument_Count then
         New_Line;
      end if;
   end loop;
   
end;
