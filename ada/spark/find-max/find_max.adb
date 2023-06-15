with Text_IO; use Text_IO;

procedure Find_Max with Spark_Mode is
   
   type Element is new Integer;
   
   type Array_Of_Element is array (Positive range <>) of Element;
   
   function Max (A : Array_Of_Element) return Element 
     with
     Pre => A'Length > 0,
     Post => (for all E of A => E <= Max'Result)
   is
      M : Element;
   begin
      M := A (A'First);
      for I in A'Range loop
         pragma Loop_Invariant (for all J in A'First .. I - 1 => M >= A(J));
         if M < A(I) then
            M := A(I);
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
