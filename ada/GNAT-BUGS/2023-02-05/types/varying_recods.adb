procedure Varying_Recods is
   
   type Node (Capacity : Natural) is record
      Length : Natural := 0;
      Name: String(1 .. Capacity);
   end record;
   
begin
   null;
end;
