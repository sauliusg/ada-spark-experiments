package body Robot_Controller is

   -- Goal : Position := Sense;       -- This raises Program_Error.
   
   ---------------------------------------------------------------------
   
   function Sense return Position is
   begin
      return (1, 2);
   end Sense;
   
   ---------------------------------------------------------------------
   
   Goal : Position := Sense;       -- This complies OK with GNAT.
   
begin  -- Robot_Controller
   Goal := Sense;                  -- The function has been elaborated.
end Robot_Controller;
