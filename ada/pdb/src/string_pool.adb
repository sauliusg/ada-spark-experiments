with Ada.Strings; use Ada.Strings;

package body String_Pool is
   
   procedure Add (S : in String; Pos : out Integer) is
   begin
      for I in String_Pool'Range loop
         if String_Pool (I) /= null and then String_Pool (I).all = S then
            Pos := I;
            return;
         end if;
         if String_Pool (I) = null then 
            String_Pool (I) := new String'(S);
            Pos := I;
            return;
         end if;
      end loop;
      raise CONSTRAINT_ERROR;
   end;
   
   procedure Add (S : in String) is
      Dummy : Integer;
   begin
      Add (S, Dummy);
   end;
   
   function Lookup (S : String) return Integer is
   begin
      for I in String_Pool'Range loop
         if S = String_Pool (I).all then
            return I;
         end if;
      end loop;
      raise CONSTRAINT_ERROR;
   end Lookup;
   
   function Contains (S : String) return Boolean is
   begin
      for I in String_Pool'Range loop
         if S = String_Pool (I).all then
            return True;
         end if;
      end loop;
      return False;
   end;
   
   function Get_String (I : Integer) return String is
      (String_Pool (I).all);
      
end String_Pool;
