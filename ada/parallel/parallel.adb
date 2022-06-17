pragma Ada_2022;

with Text_IO; use Text_IO;

procedure Parallel is
   
begin
   parallel do
     Put_Line ("This is one parallel thread");
   and
     Put_Line ("This is another parallel thread");
   and
     Put_Line ("This is yet another parallel thread");
   end do;
end Parallel;
