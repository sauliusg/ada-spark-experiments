procedure Types is
   
   type Node;
   
   type Node_Access is access Node;
   
   type Node is record
      Name: String(1..30);
      Next: Node_Access;
   end record;
   
begin
   null;
end;
