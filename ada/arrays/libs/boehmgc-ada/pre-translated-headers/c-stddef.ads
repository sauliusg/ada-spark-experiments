--  This file is translated by "headmaster" version 0.30-e83b81d (devel).
--  The original C header's license should be applied to this file.
--  All conditional-directives are expanded for the exclusive use of your
--    environment, it is not recommended to commit this file to any repository.
-------------------------------------------------------------------------------
package C.stddef is
   pragma Preelaborate;
   subtype ptrdiff_t is Standard.C.ptrdiff_t;
   subtype size_t is Standard.C.size_t;
   subtype wchar_t is Standard.C.wchar_t;
   C_NULL : constant void_ptr := void_ptr (System'To_Address (0));
   --  _ANSI_STDDEF_H (empty)
   --  _BSD_PTRDIFF_T_ (empty)
   --  _BSD_SIZE_T_ (empty)
   --  _BSD_SIZE_T_DEFINED_ (empty)
   --  _GCC_PTRDIFF_T (empty)
   --  _GCC_SIZE_T (empty)
   --  _GCC_WCHAR_T (empty)
   --  _PTRDIFF_T (empty)
   --  _PTRDIFF_T_ (empty)
   --  _PTRDIFF_T_DECLARED (empty)
   --  _SIZET_ (empty)
   --  _SIZE_T (empty)
   --  _SIZE_T_ (empty)
   --  _SIZE_T_DECLARED (empty)
   --  _SIZE_T_DEFINED (empty)
   --  _SIZE_T_DEFINED_ (empty)
   --  _STDDEF_H (empty)
   --  _STDDEF_H_ (empty)
   --  _SYS_SIZE_T_H (empty)
   --  _T_PTRDIFF (empty)
   --  _T_PTRDIFF_ (empty)
   --  _T_SIZE (empty)
   --  _T_SIZE_ (empty)
   --  _T_WCHAR (empty)
   --  _T_WCHAR_ (empty)
   --  _WCHAR_T (empty)
   --  _WCHAR_T_ (empty)
   --  _WCHAR_T_DECLARED (empty)
   --  _WCHAR_T_DEFINED (empty)
   --  _WCHAR_T_DEFINED_ (empty)
   --  _WCHAR_T_H (empty)
   --  __INT_WCHAR_T_H (empty)
   --  __PTRDIFF_T (empty)
   --  __SIZE_T (empty)
   --  __SIZE_T__ (empty)
   --  __WCHAR_T (empty)
   --  __WCHAR_T__ (empty)
   --  ___int_ptrdiff_t_h (empty)
   --  ___int_size_t_h (empty)
   --  ___int_wchar_t_h (empty)
   --  __size_t (empty)
   --  __size_t__ (empty)
   --  __wchar_t__ (empty)
   --  offsetof (unparsible)
end C.stddef;
