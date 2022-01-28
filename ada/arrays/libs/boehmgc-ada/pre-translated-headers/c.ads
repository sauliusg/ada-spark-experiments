--  This file is translated by "headmaster" version 0.30-e83b81d (devel).
--  The original C header's license should be applied to this file.
--  All conditional-directives are expanded for the exclusive use of your
--    environment, it is not recommended to commit this file to any repository.
-------------------------------------------------------------------------------
with System;
package C is
   pragma Preelaborate;
   --  type void (<>) is limited private;
   type bool is new Boolean;
   pragma Convention (C, bool);
   type signed_char is new Short_Short_Integer;
   pragma Convention (C, signed_char);
   type unsigned_char is mod 2 ** signed_char'Size;
   pragma Convention (C, unsigned_char);
   type signed_short is new Short_Integer;
   pragma Convention (C, signed_short);
   type unsigned_short is mod 2 ** signed_short'Size;
   pragma Convention (C, unsigned_short);
   type signed_int is new Integer;
   pragma Convention (C, signed_int);
   type unsigned_int is mod 2 ** signed_int'Size;
   pragma Convention (C, unsigned_int);
   type signed_long is new Long_Integer;
   pragma Convention (C, signed_long);
   type unsigned_long is mod 2 ** signed_long'Size;
   pragma Convention (C, unsigned_long);
   type signed_long_long is new Long_Long_Integer;
   pragma Convention (C, signed_long_long);
   type unsigned_long_long is mod 2 ** signed_long_long'Size;
   pragma Convention (C, unsigned_long_long);
   type float is new Standard.Float;
   pragma Convention (C, float);
   type double is new Long_Float;
   pragma Convention (C, double);
   type long_double is new Long_Long_Float;
   pragma Convention (C, long_double);
   --  type Float32 is ...
   --  type Float64 is ...
   --  type Float128 is ...
   --  type Float32x is ...
   --  type Float64x is ...
   --  type Decimal32 is ...
   --  type Decimal64 is ...
   --  type Decimal128 is ...
   type float_imaginary is new float;
   pragma Convention (C, float_imaginary);
   type double_imaginary is new double;
   pragma Convention (C, double_imaginary);
   type long_double_imaginary is new long_double;
   pragma Convention (C, long_double_imaginary);
   --  type Float32_imaginary is ...
   --  type Float32x_imaginary is ...
   --  type Float64_imaginary is ...
   --  type Float64x_imaginary is ...
   --  type Float128_imaginary is ...
   type float_complex is record
      Re, Im : float'Base;
   end record;
   pragma Complex_Representation (float_complex);
   pragma Convention (C, float_complex);
   type double_complex is record
      Re, Im : double'Base;
   end record;
   pragma Complex_Representation (double_complex);
   pragma Convention (C, double_complex);
   type long_double_complex is record
      Re, Im : long_double'Base;
   end record;
   pragma Complex_Representation (long_double_complex);
   pragma Convention (C, long_double_complex);
   --  type Float32_complex is ...
   --  type Float32x_complex is ...
   --  type Float64_complex is ...
   --  type Float64x_complex is ...
   --  type Float128_complex is ...
   type char is new Character;
   type int128_t is record
      Lo, Hi : unsigned_long_long;
   end record;
   pragma Convention (C_Pass_By_Copy, int128_t);
   type uint128_t is record
      Lo, Hi : unsigned_long_long;
   end record;
   pragma Convention (C_Pass_By_Copy, uint128_t);
   subtype builtin_va_list is System.Address;
   type ptrdiff_t is new signed_long;
   type size_t is new unsigned_long;
   type wchar_t is new signed_int;
   subtype void_ptr is System.Address;
   type void_ptr_ptr is access all void_ptr;
   for void_ptr_ptr'Storage_Size use 0;
   pragma No_Strict_Aliasing (void_ptr_ptr);
   pragma Convention (C, void_ptr_ptr);
   subtype void_const_ptr is System.Address;
   type unsigned_char_ptr is access all unsigned_char;
   for unsigned_char_ptr'Storage_Size use 0;
   pragma No_Strict_Aliasing (unsigned_char_ptr);
   pragma Convention (C, unsigned_char_ptr);
   type signed_int_array is array (size_t range <>) of aliased signed_int;
   pragma Convention (C, signed_int_array);
   type signed_long_ptr is access all signed_long;
   for signed_long_ptr'Storage_Size use 0;
   pragma No_Strict_Aliasing (signed_long_ptr);
   pragma Convention (C, signed_long_ptr);
   type unsigned_long_ptr is access all unsigned_long;
   for unsigned_long_ptr'Storage_Size use 0;
   pragma No_Strict_Aliasing (unsigned_long_ptr);
   pragma Convention (C, unsigned_long_ptr);
   type unsigned_long_const_ptr is access constant unsigned_long;
   for unsigned_long_const_ptr'Storage_Size use 0;
   pragma No_Strict_Aliasing (unsigned_long_const_ptr);
   pragma Convention (C, unsigned_long_const_ptr);
   type char_ptr is access all char;
   for char_ptr'Storage_Size use 0;
   pragma No_Strict_Aliasing (char_ptr);
   pragma Convention (C, char_ptr);
   type char_const_ptr is access constant char;
   for char_const_ptr'Storage_Size use 0;
   pragma No_Strict_Aliasing (char_const_ptr);
   pragma Convention (C, char_const_ptr);
   type char_array is array (size_t range <>) of aliased char;
   pragma Convention (C, char_array);
   function "=" (Left, Right : System.Address) return Boolean
      renames System."=";
   function Shift_Left (Left : signed_char; Right : Natural)
      return signed_char;
   function Shift_Right_Arithmetic (Left : signed_char; Right : Natural)
      return signed_char;
   function Shift_Left (Left : unsigned_char; Right : Natural)
      return unsigned_char;
   function Shift_Right (Left : unsigned_char; Right : Natural)
      return unsigned_char;
   function Shift_Left (Left : signed_short; Right : Natural)
      return signed_short;
   function Shift_Right_Arithmetic (Left : signed_short; Right : Natural)
      return signed_short;
   function Shift_Left (Left : unsigned_short; Right : Natural)
      return unsigned_short;
   function Shift_Right (Left : unsigned_short; Right : Natural)
      return unsigned_short;
   function Shift_Left (Left : signed_int; Right : Natural)
      return signed_int;
   function Shift_Right_Arithmetic (Left : signed_int; Right : Natural)
      return signed_int;
   function Shift_Left (Left : unsigned_int; Right : Natural)
      return unsigned_int;
   function Shift_Right (Left : unsigned_int; Right : Natural)
      return unsigned_int;
   function Shift_Left (Left : signed_long; Right : Natural)
      return signed_long;
   function Shift_Right_Arithmetic (Left : signed_long; Right : Natural)
      return signed_long;
   function Shift_Left (Left : unsigned_long; Right : Natural)
      return unsigned_long;
   function Shift_Right (Left : unsigned_long; Right : Natural)
      return unsigned_long;
   function Shift_Left (Left : signed_long_long; Right : Natural)
      return signed_long_long;
   function Shift_Right_Arithmetic (Left : signed_long_long; Right : Natural)
      return signed_long_long;
   function Shift_Left (Left : unsigned_long_long; Right : Natural)
      return unsigned_long_long;
   function Shift_Right (Left : unsigned_long_long; Right : Natural)
      return unsigned_long_long;
   pragma Import (Intrinsic, Shift_Left);
   pragma Import (Intrinsic, Shift_Right);
   pragma Import (Intrinsic, Shift_Right_Arithmetic);
   LP64 : constant := 1;
   STDC_PREDEF_H : constant := 1;
   ATOMIC_ACQUIRE : constant := 2;
   ATOMIC_ACQ_REL : constant := 4;
   ATOMIC_CONSUME : constant := 1;
   ATOMIC_HLE_ACQUIRE : constant := 65536;
   ATOMIC_HLE_RELEASE : constant := 131072;
   ATOMIC_RELAXED : constant := 0;
   ATOMIC_RELEASE : constant := 3;
   ATOMIC_SEQ_CST : constant := 5;
   qqBIGGEST_ALIGNMENTqq : constant := 16;
   qqBYTE_ORDERqq : constant := 1234;
   subtype qqCHAR16_TYPEqq is unsigned_short;
   subtype qqCHAR32_TYPEqq is unsigned_int;
   qqCHAR_BITqq : constant := 8;
   qqDBL_DECIMAL_DIGqq : constant := 17;
   qqDBL_DENORM_MINqq : constant := 16#0.40000000000000000#e-268;
   qqDBL_DIGqq : constant := 15;
   qqDBL_EPSILONqq : constant := 16#0.10000000000000000#e-12;
   qqDBL_HAS_DENORMqq : constant := 1;
   qqDBL_HAS_INFINITYqq : constant := 1;
   qqDBL_HAS_QUIET_NANqq : constant := 1;
   qqDBL_MANT_DIGqq : constant := 53;
   qqDBL_MAX_10_EXPqq : constant := 308;
   qqDBL_MAX_EXPqq : constant := 1024;
   qqDBL_MAXqq : constant := 16#0.fffffffffffff8000#e+256;
   qqDBL_MIN_10_EXPqq : constant := -307;
   qqDBL_MIN_EXPqq : constant := -1021;
   qqDBL_MINqq : constant := 16#0.40000000000000000#e-255;
   --  qqDEC128_EPSILONqq (decimal)
   qqDEC128_MANT_DIGqq : constant := 34;
   qqDEC128_MAX_EXPqq : constant := 6145;
   --  qqDEC128_MAXqq (decimal)
   qqDEC128_MIN_EXPqq : constant := -6142;
   --  qqDEC128_MINqq (decimal)
   --  qqDEC128_SUBNORMAL_MINqq (decimal)
   --  qqDEC32_EPSILONqq (decimal)
   qqDEC32_MANT_DIGqq : constant := 7;
   qqDEC32_MAX_EXPqq : constant := 97;
   --  qqDEC32_MAXqq (decimal)
   qqDEC32_MIN_EXPqq : constant := -94;
   --  qqDEC32_MINqq (decimal)
   --  qqDEC32_SUBNORMAL_MINqq (decimal)
   --  qqDEC64_EPSILONqq (decimal)
   qqDEC64_MANT_DIGqq : constant := 16;
   qqDEC64_MAX_EXPqq : constant := 385;
   --  qqDEC64_MAXqq (decimal)
   qqDEC64_MIN_EXPqq : constant := -382;
   --  qqDEC64_MINqq (decimal)
   --  qqDEC64_SUBNORMAL_MINqq (decimal)
   qqDECIMAL_BID_FORMATqq : constant := 1;
   qqDECIMAL_DIGqq : constant := 21;
   qqDEC_EVAL_METHODqq : constant := 2;
   qqELFqq : constant := 1;
   qqFINITE_MATH_ONLYqq : constant := 0;
   qqFLOAT_WORD_ORDERqq : constant := 1234;
   qqFLT_DECIMAL_DIGqq : constant := 9;
   qqFLT_DENORM_MINqq : constant := 16#0.80000000000000000#e-37;
   qqFLT_DIGqq : constant := 6;
   qqFLT_EPSILONqq : constant := 16#0.20000000000000000#e-5;
   qqFLT_EVAL_METHODqq : constant := 0;
   qqFLT_HAS_DENORMqq : constant := 1;
   qqFLT_HAS_INFINITYqq : constant := 1;
   qqFLT_HAS_QUIET_NANqq : constant := 1;
   qqFLT_MANT_DIGqq : constant := 24;
   qqFLT_MAX_10_EXPqq : constant := 38;
   qqFLT_MAX_EXPqq : constant := 128;
   qqFLT_MAXqq : constant := 16#0.ffffff00000000000#e+32;
   qqFLT_MIN_10_EXPqq : constant := -37;
   qqFLT_MIN_EXPqq : constant := -125;
   qqFLT_MINqq : constant := 16#0.40000000000000000#e-31;
   qqFLT_RADIXqq : constant := 2;
   qqFXSRqq : constant := 1;
   qqGCC_ASM_FLAG_OUTPUTSqq : constant := 1;
   GCC_ATOMIC_BOOL_LOCK_FREE : constant := 2;
   GCC_ATOMIC_CHAR16_T_LOCK_FREE : constant := 2;
   GCC_ATOMIC_CHAR32_T_LOCK_FREE : constant := 2;
   GCC_ATOMIC_CHAR_LOCK_FREE : constant := 2;
   GCC_ATOMIC_INT_LOCK_FREE : constant := 2;
   GCC_ATOMIC_LLONG_LOCK_FREE : constant := 2;
   GCC_ATOMIC_LONG_LOCK_FREE : constant := 2;
   GCC_ATOMIC_POINTER_LOCK_FREE : constant := 2;
   GCC_ATOMIC_SHORT_LOCK_FREE : constant := 2;
   GCC_ATOMIC_TEST_AND_SET_TRUEVAL : constant := 1;
   GCC_ATOMIC_WCHAR_T_LOCK_FREE : constant := 2;
   GCC_HAVE_DWARF2_CFI_ASM : constant := 1;
   GCC_HAVE_SYNC_COMPARE_AND_SWAP_1 : constant := 1;
   GCC_HAVE_SYNC_COMPARE_AND_SWAP_16 : constant := 1;
   GCC_HAVE_SYNC_COMPARE_AND_SWAP_2 : constant := 1;
   GCC_HAVE_SYNC_COMPARE_AND_SWAP_4 : constant := 1;
   GCC_HAVE_SYNC_COMPARE_AND_SWAP_8 : constant := 1;
   GCC_IEC_559 : constant := 2;
   GCC_IEC_559_COMPLEX : constant := 2;
   qqGNUC_MINORqq : constant := 5;
   qqGNUC_PATCHLEVELqq : constant := 0;
   qqGNUC_STDC_INLINEqq : constant := 1;
   qqGNUCqq : constant := 6;
   GXX_ABI_VERSION : constant := 1010;
   --  __INT16_C (function macro)
   qqINT16_MAXqq : constant := 32767;
   subtype qqINT16_TYPEqq is signed_short;
   --  __INT32_C (function macro)
   qqINT32_MAXqq : constant := 2147483647;
   subtype qqINT32_TYPEqq is signed_int;
   --  __INT64_C (has # or ##)
   qqINT64_MAXqq : constant := 9223372036854775807;
   subtype qqINT64_TYPEqq is signed_long;
   --  __INT8_C (function macro)
   qqINT8_MAXqq : constant := 127;
   subtype qqINT8_TYPEqq is signed_char;
   --  __INTMAX_C (has # or ##)
   qqINTMAX_MAXqq : constant := 9223372036854775807;
   subtype qqINTMAX_TYPEqq is signed_long;
   qqINTPTR_MAXqq : constant := 9223372036854775807;
   subtype qqINTPTR_TYPEqq is signed_long;
   qqINT_FAST16_MAXqq : constant := 9223372036854775807;
   subtype qqINT_FAST16_TYPEqq is signed_long;
   qqINT_FAST32_MAXqq : constant := 9223372036854775807;
   subtype qqINT_FAST32_TYPEqq is signed_long;
   qqINT_FAST64_MAXqq : constant := 9223372036854775807;
   subtype qqINT_FAST64_TYPEqq is signed_long;
   qqINT_FAST8_MAXqq : constant := 127;
   subtype qqINT_FAST8_TYPEqq is signed_char;
   qqINT_LEAST16_MAXqq : constant := 32767;
   subtype qqINT_LEAST16_TYPEqq is signed_short;
   qqINT_LEAST32_MAXqq : constant := 2147483647;
   subtype qqINT_LEAST32_TYPEqq is signed_int;
   qqINT_LEAST64_MAXqq : constant := 9223372036854775807;
   subtype qqINT_LEAST64_TYPEqq is signed_long;
   qqINT_LEAST8_MAXqq : constant := 127;
   subtype qqINT_LEAST8_TYPEqq is signed_char;
   qqINT_MAXqq : constant := 2147483647;
   qqLDBL_DENORM_MINqq : constant := 16#0.80000000000000000#e-4111;
   qqLDBL_DIGqq : constant := 18;
   qqLDBL_EPSILONqq : constant := 16#0.20000000000000000#e-15;
   qqLDBL_HAS_DENORMqq : constant := 1;
   qqLDBL_HAS_INFINITYqq : constant := 1;
   qqLDBL_HAS_QUIET_NANqq : constant := 1;
   qqLDBL_MANT_DIGqq : constant := 64;
   qqLDBL_MAX_10_EXPqq : constant := 4932;
   qqLDBL_MAX_EXPqq : constant := 16384;
   qqLDBL_MAXqq : constant := 16#0.ffffffffffffffff0#e+4096;
   qqLDBL_MIN_10_EXPqq : constant := -4931;
   qqLDBL_MIN_EXPqq : constant := -16381;
   qqLDBL_MINqq : constant := 16#0.40000000000000000#e-4095;
   qqLONG_LONG_MAXqq : constant := 9223372036854775807;
   qqLONG_MAXqq : constant := 9223372036854775807;
   qqLP64qq : constant := 1;
   qqMMXqq : constant := 1;
   qqNO_INLINEqq : constant := 1;
   qqORDER_BIG_ENDIANqq : constant := 4321;
   qqORDER_LITTLE_ENDIANqq : constant := 1234;
   qqORDER_PDP_ENDIANqq : constant := 3412;
   PRAGMA_REDEFINE_EXTNAME : constant := 1;
   qqPTRDIFF_MAXqq : constant := 9223372036854775807;
   subtype qqPTRDIFF_TYPEqq is signed_long;
   --  __REGISTER_PREFIX__ (empty)
   qqSCHAR_MAXqq : constant := 127;
   SEG_FS : constant := 1;
   SEG_GS : constant := 1;
   qqSHRT_MAXqq : constant := 32767;
   qqSIG_ATOMIC_MAXqq : constant := 2147483647;
   qqSIG_ATOMIC_MINqq : constant := -2147483648;
   subtype qqSIG_ATOMIC_TYPEqq is signed_int;
   qqSIZEOF_DOUBLEqq : constant := 8;
   qqSIZEOF_FLOAT128qq : constant := 16;
   qqSIZEOF_FLOAT80qq : constant := 16;
   qqSIZEOF_FLOATqq : constant := 4;
   qqSIZEOF_INT128qq : constant := 16;
   qqSIZEOF_INTqq : constant := 4;
   qqSIZEOF_LONG_DOUBLEqq : constant := 16;
   qqSIZEOF_LONG_LONGqq : constant := 8;
   qqSIZEOF_LONGqq : constant := 8;
   qqSIZEOF_POINTERqq : constant := 8;
   qqSIZEOF_PTRDIFF_Tqq : constant := 8;
   qqSIZEOF_SHORTqq : constant := 2;
   qqSIZEOF_SIZE_Tqq : constant := 8;
   qqSIZEOF_WCHAR_Tqq : constant := 4;
   qqSIZEOF_WINT_Tqq : constant := 4;
   qqSIZE_MAXqq : constant := 18446744073709551615;
   subtype qqSIZE_TYPEqq is unsigned_long;
   qqSSE2_MATHqq : constant := 1;
   qqSSE2qq : constant := 1;
   qqSSE3qq : constant := 1;
   qqSSE_MATHqq : constant := 1;
   qqSSEqq : constant := 1;
   qqSSSE3qq : constant := 1;
   qqSTDC_HOSTEDqq : constant := 1;
   qqSTDC_NO_THREADSqq : constant := 1;
   qqSTDC_UTF_16qq : constant := 1;
   qqSTDC_UTF_32qq : constant := 1;
   --  __UINT16_C (function macro)
   qqUINT16_MAXqq : constant := 65535;
   subtype qqUINT16_TYPEqq is unsigned_short;
   --  __UINT32_C (has # or ##)
   qqUINT32_MAXqq : constant := 4294967295;
   subtype qqUINT32_TYPEqq is unsigned_int;
   --  __UINT64_C (has # or ##)
   qqUINT64_MAXqq : constant := 18446744073709551615;
   subtype qqUINT64_TYPEqq is unsigned_long;
   --  __UINT8_C (function macro)
   qqUINT8_MAXqq : constant := 255;
   subtype qqUINT8_TYPEqq is unsigned_char;
   --  __UINTMAX_C (has # or ##)
   qqUINTMAX_MAXqq : constant := 18446744073709551615;
   subtype qqUINTMAX_TYPEqq is unsigned_long;
   qqUINTPTR_MAXqq : constant := 18446744073709551615;
   subtype qqUINTPTR_TYPEqq is unsigned_long;
   qqUINT_FAST16_MAXqq : constant := 18446744073709551615;
   subtype qqUINT_FAST16_TYPEqq is unsigned_long;
   qqUINT_FAST32_MAXqq : constant := 18446744073709551615;
   subtype qqUINT_FAST32_TYPEqq is unsigned_long;
   qqUINT_FAST64_MAXqq : constant := 18446744073709551615;
   subtype qqUINT_FAST64_TYPEqq is unsigned_long;
   qqUINT_FAST8_MAXqq : constant := 255;
   subtype qqUINT_FAST8_TYPEqq is unsigned_char;
   qqUINT_LEAST16_MAXqq : constant := 65535;
   subtype qqUINT_LEAST16_TYPEqq is unsigned_short;
   qqUINT_LEAST32_MAXqq : constant := 4294967295;
   subtype qqUINT_LEAST32_TYPEqq is unsigned_int;
   qqUINT_LEAST64_MAXqq : constant := 18446744073709551615;
   subtype qqUINT_LEAST64_TYPEqq is unsigned_long;
   qqUINT_LEAST8_MAXqq : constant := 255;
   subtype qqUINT_LEAST8_TYPEqq is unsigned_char;
   --  __USER_LABEL_PREFIX__ (empty)
   qqVERSIONqq : constant char_array (0 .. 5) := "6.5.0" & char'Val (0);
   qqWCHAR_MAXqq : constant := 2147483647;
   qqWCHAR_MINqq : constant := -2147483648;
   subtype qqWCHAR_TYPEqq is signed_int;
   qqWINT_MAXqq : constant := 4294967295;
   qqWINT_MINqq : constant := 0;
   subtype qqWINT_TYPEqq is unsigned_int;
   amd64 : constant := 1;
   qqamd64qq : constant := 1;
   qqcode_model_smallqq : constant := 1;
   core2 : constant := 1;
   qqcore2qq : constant := 1;
   qqgnu_linuxqq : constant := 1;
   --  __has_include (has __has_include__ or __has_include_next__)
   --  __has_include_next (has __has_include__ or __has_include_next__)
   defined_qqlinux : constant := 1;
   qqlinuxqq : constant := 1;
   qqunix : constant := 1;
   qqunixqq : constant := 1;
   x86_64 : constant := 1;
   qqx86_64qq : constant := 1;
   defined_linux : constant := 1;
   unix : constant := 1;
   function builtin_alloca (a1 : size_t) return char_ptr;
   pragma Import (Intrinsic, builtin_alloca, "__builtin_alloca");
   function builtin_bswap16 (a1 : unsigned_short) return unsigned_short;
   pragma Import (Intrinsic, builtin_bswap16, "__builtin_bswap16");
   function builtin_bswap32 (a1 : unsigned_int) return unsigned_int;
   pragma Import (Intrinsic, builtin_bswap32, "__builtin_bswap32");
   function builtin_bswap64 (a1 : unsigned_long_long)
      return unsigned_long_long;
   pragma Import (Intrinsic, builtin_bswap64, "__builtin_bswap64");
   procedure builtin_bzero (a1 : access char; a2 : size_t);
   pragma Import (Intrinsic, builtin_bzero, "__builtin_bzero");
   function builtin_extract_return_addr (a1 : access char) return char_ptr;
   pragma Import (Intrinsic, builtin_extract_return_addr,
      "__builtin_extract_return_addr");
   function builtin_fabsf (a1 : float) return float;
   pragma Import (Intrinsic, builtin_fabsf, "__builtin_fabsf");
   function builtin_fabs (a1 : double) return double;
   pragma Import (Intrinsic, builtin_fabs, "__builtin_fabs");
   function builtin_fabsl (a1 : long_double) return long_double;
   pragma Import (Intrinsic, builtin_fabsl, "__builtin_fabsl");
   function builtin_flt_rounds return signed_int;
   pragma Import (Intrinsic, builtin_flt_rounds, "__builtin_flt_rounds");
   function builtin_frame_address (a1 : unsigned_int) return char_ptr;
   pragma Import (Intrinsic, builtin_frame_address,
      "__builtin_frame_address");
   function builtin_huge_valf return float;
   pragma Import (Intrinsic, builtin_huge_valf, "__builtin_huge_valf");
   function builtin_huge_val return double;
   pragma Import (Intrinsic, builtin_huge_val, "__builtin_huge_val");
   function builtin_huge_vall return long_double;
   pragma Import (Intrinsic, builtin_huge_vall, "__builtin_huge_vall");
   function builtin_inff return float;
   pragma Import (Intrinsic, builtin_inff, "__builtin_inff");
   function builtin_inf return double;
   pragma Import (Intrinsic, builtin_inf, "__builtin_inf");
   function builtin_infl return long_double;
   pragma Import (Intrinsic, builtin_infl, "__builtin_infl");
   function builtin_llabs (a1 : signed_long_long) return signed_long_long;
   pragma Import (Intrinsic, builtin_llabs, "__builtin_llabs");
   function builtin_memcmp (a1 : access char; a2 : access char; a3 : size_t)
      return signed_int;
   pragma Import (Intrinsic, builtin_memcmp, "__builtin_memcmp");
   function builtin_memset (a1 : access char; a2 : signed_int; a3 : size_t)
      return char_ptr;
   pragma Import (Intrinsic, builtin_memset, "__builtin_memset");
   function builtin_memcpy_chk (a1 : access char; a2 : access constant char;
      a3 : size_t; a4 : size_t) return char_ptr;
   pragma Import (Intrinsic, builtin_memcpy_chk, "__builtin___memcpy_chk");
   function builtin_memmove_chk (a1 : access char; a2 : access constant char;
      a3 : size_t; a4 : size_t) return char_ptr;
   pragma Import (Intrinsic, builtin_memmove_chk, "__builtin___memmove_chk");
   function builtin_memset_chk (a1 : access char; a2 : signed_int;
      a3 : size_t; a4 : size_t) return char_ptr;
   pragma Import (Intrinsic, builtin_memset_chk, "__builtin___memset_chk");
   function builtin_nanf (a1 : access constant char) return float;
   pragma Import (Intrinsic, builtin_nanf, "__builtin_nanf");
   function builtin_nan (a1 : access constant char) return double;
   pragma Import (Intrinsic, builtin_nan, "__builtin_nan");
   function builtin_nanl (a1 : access constant char) return long_double;
   pragma Import (Intrinsic, builtin_nanl, "__builtin_nanl");
   function builtin_return_address (a1 : unsigned_int) return char_ptr;
   pragma Import (Intrinsic, builtin_return_address,
      "__builtin_return_address");
   function builtin_stpcpy_chk (a1 : access char; a2 : access constant char;
      a3 : size_t) return char_ptr;
   pragma Import (Intrinsic, builtin_stpcpy_chk, "__builtin___stpcpy_chk");
   function builtin_stpncpy_chk (a1 : access char; a2 : access constant char;
      a3 : size_t; a4 : size_t) return char_ptr;
   pragma Import (Intrinsic, builtin_stpncpy_chk, "__builtin___stpncpy_chk");
   function builtin_strcat_chk (a1 : access char; a2 : access constant char;
      a3 : size_t) return char_ptr;
   pragma Import (Intrinsic, builtin_strcat_chk, "__builtin___strcat_chk");
   function builtin_strcpy_chk (a1 : access char; a2 : access constant char;
      a3 : size_t) return char_ptr;
   pragma Import (Intrinsic, builtin_strcpy_chk, "__builtin___strcpy_chk");
   function builtin_strncat_chk (a1 : access char; a2 : access constant char;
      a3 : size_t; a4 : size_t) return char_ptr;
   pragma Import (Intrinsic, builtin_strncat_chk, "__builtin___strncat_chk");
   function builtin_strncpy_chk (a1 : access char; a2 : access constant char;
      a3 : size_t; a4 : size_t) return char_ptr;
   pragma Import (Intrinsic, builtin_strncpy_chk, "__builtin___strncpy_chk");
end C;
