package Robot_Controller is
   
   type Position is 
      record
         X : Integer := 0;
         Y : Integer := 0;
      end record;
   
   function Sense return Position;

end Robot_Controller;
