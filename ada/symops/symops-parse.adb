separate (Symops)

procedure Parse (Text : in String; S : out Symop) is 
   
   Pos : Integer := Text'First;
   
   subtype Character_Set is Ada.Strings.Maps.Character_Set;
   
   procedure Expect (Text : in String; 
                     Expected_Characters : in Character_Set) is
   begin
      if Pos <= Text'Last and then 
        Is_In (Text (Pos), Expected_Characters) then
         Pos := Pos + 1;
      end if;
   end;
   
   procedure Expect (Text : in String;
                     Expected_Characters : in String) is
   begin
      Expect (Text, To_Set (Expected_Characters));
   end;   
   
begin
   S := (
         (1.0, 0.0, 0.0, 0.0),
         (0.0, 1.0, 0.0, 0.0),
         (0.0, 0.0, 1.0, 0.0),
         (0.0, 0.0, 0.0, 1.0)
        );
   
   Expect (Text, "-+xXyYzY0123456789");
   
end Parse; -- Symops
