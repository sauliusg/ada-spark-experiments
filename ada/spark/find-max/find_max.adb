with Text_IO; use Text_IO;

procedure Find_Max with Spark_Mode is
   
   type Element is new Integer;
   
   type Array_Of_Element is array (1..7) of Element;
   
   function Max (A : Array_Of_Element) return Element 
     with
     Post => (for all E of A => E <= Max'Result)
   is
      M : Element := A (A'First);
   begin
      for E of A loop
         if M < E then
            M := E;
         end if;
      end loop;
      return M;
   end;
   
   A : Array_Of_Element := (1, 2, 4, 8, 3, 2, 1);
   
   procedure Put (A : Array_Of_Element) is
   begin
      Put("(");
      for E of A loop
         Put (E'Image);
         Put (" ");
      end loop;
      Put (")");
   end;
   
begin
   
   Put (A);
   New_Line;
   
   Put (Max (A)'Image);
   New_Line;
   
end;  
