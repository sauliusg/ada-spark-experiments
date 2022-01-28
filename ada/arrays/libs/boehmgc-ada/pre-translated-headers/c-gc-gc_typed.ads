--  This file is translated by "headmaster" version 0.30-e83b81d (devel).
--  The original C header's license should be applied to this file.
--  All conditional-directives are expanded for the exclusive use of your
--    environment, it is not recommended to commit this file to any repository.
-------------------------------------------------------------------------------
with C.gc.gc;
with C.stddef;
package C.gc.gc_typed is
   pragma Preelaborate;
   subtype GC_bitmap is C.gc.gc.GC_word_ptr;
   subtype GC_descr is C.gc.gc.GC_word;
   function GC_make_descriptor (a1 : access constant C.gc.gc.GC_word;
      a2 : stddef.size_t) return GC_descr;
   pragma Import (C, GC_make_descriptor, "GC_make_descriptor");
   function GC_malloc_explicitly_typed (a1 : stddef.size_t; a2 : GC_descr)
      return void_ptr;
   pragma Import (C, GC_malloc_explicitly_typed,
      "GC_malloc_explicitly_typed");
   function GC_malloc_explicitly_typed_ignore_off_page (a1 : stddef.size_t;
      a2 : GC_descr) return void_ptr;
   pragma Import (C, GC_malloc_explicitly_typed_ignore_off_page,
      "GC_malloc_explicitly_typed_ignore_off_page");
   function GC_calloc_explicitly_typed (a1 : stddef.size_t;
      a2 : stddef.size_t; a3 : GC_descr) return void_ptr;
   pragma Import (C, GC_calloc_explicitly_typed,
      "GC_calloc_explicitly_typed");
   --  GC_BITMAP_SIZE (function macro)
   --  GC_CALLOC_EXPLICITLY_TYPED (function macro)
   --  GC_MALLOC_EXPLICITLY_TYPED (function macro)
   --  GC_TYPED_H (empty)
   GC_WORDSZ : constant := 64;
   --  GC_WORD_LEN (function macro)
   --  GC_WORD_OFFSET (unparsible)
   --  GC_get_bit (function macro)
   --  GC_set_bit (function macro)
end C.gc.gc_typed;
