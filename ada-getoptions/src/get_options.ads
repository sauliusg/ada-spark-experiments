package Get_Options is
   
   type Integer_Parameter_Access is access Integer;
   
   type Option_Value_Kind is
     (
      NONE, STRING_OPT, INTEGER_OPT, FLOAT_OPT, DOUBLE_OPT, NATURAL_OPT,
      POSITIVE_OPT, CHARACTER_OPT, BOOLEAN_OPT
     );
   
   subtype Option_String_Length is Integer range 1 .. 2**30;
   
   -- type Integer_Access_All is access all Integer;
   
   type Option_Value_Type
      (
       Option_Kind : Option_Value_Kind := NONE;
       Value_Length : Option_String_Length := 1
      )
      is record
      case Option_Kind is
         when NONE =>
            null;
         when STRING_OPT =>
            String_Value : String (1 .. Value_Length);
         when INTEGER_OPT =>
            Integer_Value : Integer;
            Integer_Value_Parameter : Integer_Parameter_Access;
         when FLOAT_OPT =>
            Float_Value : Float;
         when DOUBLE_OPT =>
            Double_Value : Long_Float;
         when NATURAL_OPT =>
            Natural_Value : Natural;
         when POSITIVE_OPT =>
            Positive_Value : Positive;
         when CHARACTER_OPT =>
            Character_Value : Character;
         when BOOLEAN_OPT =>
            Boolean_Value : Boolean;
      end case;
   end record;
   
   type Option_Value_Access is access Option_Value_Type;
   
   type Option_Type is record
      Short_Option : Character;
      Long_Option : access String;
      Option_Kind : Option_Value_Kind;
      Value : Option_Value_Access;
      Is_Present : Boolean := False;
   end record;
   
   type Option_Array is array (Positive range <>) of Option_Type;
   
   function Option
     (
      Short_Option, Long_Option : String;
      Option_Kind : Option_Value_Kind
     ) return Option_Type;
   
   function Option
     (
      Short_Option, Long_Option : String;
      Integer_Parameter_Ref : Integer_Parameter_Access
     ) return Option_Type;
   
end Get_Options;
