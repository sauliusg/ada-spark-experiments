separate (Symops)

procedure Parse (Text : in String; S : out Symop) is 
   
   Pos : Integer := Text'First;
   
   subtype Character_Set is Ada.Strings.Maps.Character_Set;
   
   procedure Expect (Text : in String; Ch_Set : in Character_Set) is
   begin
      null;
   end;
   
   procedure Expect (Text : in String; Ch_Set : in String) is
   begin
      Expect (Text, To_Set (Ch_Set));
   end;   
   
begin
   S := (
         (1.0, 0.0, 0.0, 0.0),
         (0.0, 1.0, 0.0, 0.0),
         (0.0, 0.0, 1.0, 0.0),
         (0.0, 0.0, 0.0, 1.0)
        );
   
   Expect (Text, "-+xXyYzY");
   
end Parse; -- Symops
