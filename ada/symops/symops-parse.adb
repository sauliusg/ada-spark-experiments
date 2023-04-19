separate (Symops)

procedure Parse (Text : in String; S : out Symop) is 
begin
   S := (
         (1.0, 0.0, 0.0, 0.0),
         (0.0, 1.0, 0.0, 0.0),
         (0.0, 0.0, 1.0, 0.0),
         (0.0, 0.0, 0.0, 1.0)
        );
end Parse; -- Symops
