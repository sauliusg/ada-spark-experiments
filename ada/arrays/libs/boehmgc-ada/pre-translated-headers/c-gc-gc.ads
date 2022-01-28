--  This file is translated by "headmaster" version 0.30-e83b81d (devel).
--  The original C header's license should be applied to this file.
--  All conditional-directives are expanded for the exclusive use of your
--    environment, it is not recommended to commit this file to any repository.
-------------------------------------------------------------------------------
with C.stddef;
package C.gc.gc is
   pragma Preelaborate;
   subtype GC_PTR is void_ptr;
   subtype GC_word is unsigned_long;
   subtype GC_word_ptr is unsigned_long_ptr;
   subtype GC_word_const_ptr is unsigned_long_const_ptr;
   subtype GC_signed_word is signed_long;
   function GC_get_version return unsigned_int;
   pragma Import (C, GC_get_version, "GC_get_version");
   GC_gc_no : aliased GC_word;
   pragma Import (C, GC_gc_no, "GC_gc_no");
   function GC_get_gc_no return GC_word;
   pragma Import (C, GC_get_gc_no, "GC_get_gc_no");
   type access_f10bbb0c is access function (a1 : stddef.size_t)
      return void_ptr;
   pragma Convention (C, access_f10bbb0c);
   subtype GC_oom_func is access_f10bbb0c;
   GC_oom_fn : aliased GC_oom_func;
   pragma Import (C, GC_oom_fn, "GC_oom_fn");
   procedure GC_set_oom_fn (a1 : GC_oom_func);
   pragma Import (C, GC_set_oom_fn, "GC_set_oom_fn");
   function GC_get_oom_fn return GC_oom_func;
   pragma Import (C, GC_get_oom_fn, "GC_get_oom_fn");
   type access_151fd588 is access procedure (a1 : GC_word);
   pragma Convention (C, access_151fd588);
   subtype GC_on_heap_resize_proc is access_151fd588;
   GC_on_heap_resize : aliased GC_on_heap_resize_proc;
   pragma Import (C, GC_on_heap_resize, "GC_on_heap_resize");
   procedure GC_set_on_heap_resize (a1 : GC_on_heap_resize_proc);
   pragma Import (C, GC_set_on_heap_resize, "GC_set_on_heap_resize");
   function GC_get_on_heap_resize return GC_on_heap_resize_proc;
   pragma Import (C, GC_get_on_heap_resize, "GC_get_on_heap_resize");
   type enum_c081d20b is (GC_EVENT_START, GC_EVENT_MARK_START,
      GC_EVENT_MARK_END, GC_EVENT_RECLAIM_START, GC_EVENT_RECLAIM_END,
      GC_EVENT_END, GC_EVENT_PRE_STOP_WORLD, GC_EVENT_POST_STOP_WORLD,
      GC_EVENT_PRE_START_WORLD, GC_EVENT_POST_START_WORLD,
      GC_EVENT_THREAD_SUSPENDED, GC_EVENT_THREAD_UNSUSPENDED);
   for enum_c081d20b use (GC_EVENT_START => 0, GC_EVENT_MARK_START => 1,
      GC_EVENT_MARK_END => 2, GC_EVENT_RECLAIM_START => 3,
      GC_EVENT_RECLAIM_END => 4, GC_EVENT_END => 5,
      GC_EVENT_PRE_STOP_WORLD => 6, GC_EVENT_POST_STOP_WORLD => 7,
      GC_EVENT_PRE_START_WORLD => 8, GC_EVENT_POST_START_WORLD => 9,
      GC_EVENT_THREAD_SUSPENDED => 10, GC_EVENT_THREAD_UNSUSPENDED => 11);
   pragma Convention (C, enum_c081d20b);
   subtype GC_EventType is enum_c081d20b;
   type access_0cea1c6d is access procedure (a1 : GC_EventType);
   pragma Convention (C, access_0cea1c6d);
   subtype GC_on_collection_event_proc is access_0cea1c6d;
   procedure GC_set_on_collection_event (a1 : GC_on_collection_event_proc);
   pragma Import (C, GC_set_on_collection_event,
      "GC_set_on_collection_event");
   function GC_get_on_collection_event return GC_on_collection_event_proc;
   pragma Import (C, GC_get_on_collection_event,
      "GC_get_on_collection_event");
   GC_find_leak : aliased signed_int;
   pragma Import (C, GC_find_leak, "GC_find_leak");
   procedure GC_set_find_leak (a1 : signed_int);
   pragma Import (C, GC_set_find_leak, "GC_set_find_leak");
   type access_e83afa7d is access function return signed_int;
   pragma Convention (C, access_e83afa7d);
   function GC_get_find_leak return signed_int;
   pragma Import (C, GC_get_find_leak, "GC_get_find_leak");
   GC_all_interior_pointers : aliased signed_int;
   pragma Import (C, GC_all_interior_pointers, "GC_all_interior_pointers");
   procedure GC_set_all_interior_pointers (a1 : signed_int);
   pragma Import (C, GC_set_all_interior_pointers,
      "GC_set_all_interior_pointers");
   function GC_get_all_interior_pointers return signed_int;
   pragma Import (C, GC_get_all_interior_pointers,
      "GC_get_all_interior_pointers");
   GC_finalize_on_demand : aliased signed_int;
   pragma Import (C, GC_finalize_on_demand, "GC_finalize_on_demand");
   procedure GC_set_finalize_on_demand (a1 : signed_int);
   pragma Import (C, GC_set_finalize_on_demand, "GC_set_finalize_on_demand");
   function GC_get_finalize_on_demand return signed_int;
   pragma Import (C, GC_get_finalize_on_demand, "GC_get_finalize_on_demand");
   GC_java_finalization : aliased signed_int;
   pragma Import (C, GC_java_finalization, "GC_java_finalization");
   procedure GC_set_java_finalization (a1 : signed_int);
   pragma Import (C, GC_set_java_finalization, "GC_set_java_finalization");
   function GC_get_java_finalization return signed_int;
   pragma Import (C, GC_get_java_finalization, "GC_get_java_finalization");
   type access_e823f645 is access procedure;
   pragma Convention (C, access_e823f645);
   subtype GC_finalizer_notifier_proc is access_e823f645;
   GC_finalizer_notifier : aliased GC_finalizer_notifier_proc;
   pragma Import (C, GC_finalizer_notifier, "GC_finalizer_notifier");
   procedure GC_set_finalizer_notifier (a1 : GC_finalizer_notifier_proc);
   pragma Import (C, GC_set_finalizer_notifier, "GC_set_finalizer_notifier");
   function GC_get_finalizer_notifier return GC_finalizer_notifier_proc;
   pragma Import (C, GC_get_finalizer_notifier, "GC_get_finalizer_notifier");
   GC_dont_gc : aliased signed_int;
   pragma Import (C, GC_dont_gc, "GC_dont_gc");
   GC_dont_expand : aliased signed_int;
   pragma Import (C, GC_dont_expand, "GC_dont_expand");
   procedure GC_set_dont_expand (a1 : signed_int);
   pragma Import (C, GC_set_dont_expand, "GC_set_dont_expand");
   function GC_get_dont_expand return signed_int;
   pragma Import (C, GC_get_dont_expand, "GC_get_dont_expand");
   GC_use_entire_heap : aliased signed_int;
   pragma Import (C, GC_use_entire_heap, "GC_use_entire_heap");
   GC_full_freq : aliased signed_int;
   pragma Import (C, GC_full_freq, "GC_full_freq");
   procedure GC_set_full_freq (a1 : signed_int);
   pragma Import (C, GC_set_full_freq, "GC_set_full_freq");
   function GC_get_full_freq return signed_int;
   pragma Import (C, GC_get_full_freq, "GC_get_full_freq");
   GC_non_gc_bytes : aliased GC_word;
   pragma Import (C, GC_non_gc_bytes, "GC_non_gc_bytes");
   procedure GC_set_non_gc_bytes (a1 : GC_word);
   pragma Import (C, GC_set_non_gc_bytes, "GC_set_non_gc_bytes");
   function GC_get_non_gc_bytes return GC_word;
   pragma Import (C, GC_get_non_gc_bytes, "GC_get_non_gc_bytes");
   GC_no_dls : aliased signed_int;
   pragma Import (C, GC_no_dls, "GC_no_dls");
   procedure GC_set_no_dls (a1 : signed_int);
   pragma Import (C, GC_set_no_dls, "GC_set_no_dls");
   function GC_get_no_dls return signed_int;
   pragma Import (C, GC_get_no_dls, "GC_get_no_dls");
   GC_free_space_divisor : aliased GC_word;
   pragma Import (C, GC_free_space_divisor, "GC_free_space_divisor");
   procedure GC_set_free_space_divisor (a1 : GC_word);
   pragma Import (C, GC_set_free_space_divisor, "GC_set_free_space_divisor");
   function GC_get_free_space_divisor return GC_word;
   pragma Import (C, GC_get_free_space_divisor, "GC_get_free_space_divisor");
   GC_max_retries : aliased GC_word;
   pragma Import (C, GC_max_retries, "GC_max_retries");
   procedure GC_set_max_retries (a1 : GC_word);
   pragma Import (C, GC_set_max_retries, "GC_set_max_retries");
   function GC_get_max_retries return GC_word;
   pragma Import (C, GC_get_max_retries, "GC_get_max_retries");
   GC_stackbottom : aliased char_ptr;
   pragma Import (C, GC_stackbottom, "GC_stackbottom");
   GC_dont_precollect : aliased signed_int;
   pragma Import (C, GC_dont_precollect, "GC_dont_precollect");
   procedure GC_set_dont_precollect (a1 : signed_int);
   pragma Import (C, GC_set_dont_precollect, "GC_set_dont_precollect");
   function GC_get_dont_precollect return signed_int;
   pragma Import (C, GC_get_dont_precollect, "GC_get_dont_precollect");
   GC_time_limit : aliased unsigned_long;
   pragma Import (C, GC_time_limit, "GC_time_limit");
   procedure GC_set_time_limit (a1 : unsigned_long);
   pragma Import (C, GC_set_time_limit, "GC_set_time_limit");
   function GC_get_time_limit return unsigned_long;
   pragma Import (C, GC_get_time_limit, "GC_get_time_limit");
   procedure GC_set_pages_executable (a1 : signed_int);
   pragma Import (C, GC_set_pages_executable, "GC_set_pages_executable");
   function GC_get_pages_executable return signed_int;
   pragma Import (C, GC_get_pages_executable, "GC_get_pages_executable");
   procedure GC_set_handle_fork (a1 : signed_int);
   pragma Import (C, GC_set_handle_fork, "GC_set_handle_fork");
   procedure GC_atfork_prepare;
   pragma Import (C, GC_atfork_prepare, "GC_atfork_prepare");
   procedure GC_atfork_parent;
   pragma Import (C, GC_atfork_parent, "GC_atfork_parent");
   procedure GC_atfork_child;
   pragma Import (C, GC_atfork_child, "GC_atfork_child");
   procedure GC_init;
   pragma Import (C, GC_init, "GC_init");
   function GC_is_init_called return signed_int;
   pragma Import (C, GC_is_init_called, "GC_is_init_called");
   function GC_malloc (a1 : stddef.size_t) return void_ptr;
   pragma Import (C, GC_malloc, "GC_malloc");
   function GC_malloc_atomic (a1 : stddef.size_t) return void_ptr;
   pragma Import (C, GC_malloc_atomic, "GC_malloc_atomic");
   function GC_strdup (a1 : access constant char) return char_ptr;
   pragma Import (C, GC_strdup, "GC_strdup");
   function GC_strndup (a1 : access constant char; a2 : stddef.size_t)
      return char_ptr;
   pragma Import (C, GC_strndup, "GC_strndup");
   function GC_malloc_uncollectable (a1 : stddef.size_t) return void_ptr;
   pragma Import (C, GC_malloc_uncollectable, "GC_malloc_uncollectable");
   function GC_malloc_stubborn (a1 : stddef.size_t) return void_ptr;
   pragma Import (C, GC_malloc_stubborn, "GC_malloc_stubborn");
   function GC_memalign (a1 : stddef.size_t; a2 : stddef.size_t)
      return void_ptr;
   pragma Import (C, GC_memalign, "GC_memalign");
   function GC_posix_memalign (a1 : access void_ptr; a2 : stddef.size_t;
      a3 : stddef.size_t) return signed_int;
   pragma Import (C, GC_posix_memalign, "GC_posix_memalign");
   type access_15c277d4 is access procedure (a1 : void_ptr);
   pragma Convention (C, access_15c277d4);
   procedure GC_free (a1 : void_ptr);
   pragma Import (C, GC_free, "GC_free");
   procedure GC_change_stubborn (a1 : void_const_ptr);
   pragma Import (C, GC_change_stubborn, "GC_change_stubborn");
   procedure GC_end_stubborn_change (a1 : void_const_ptr);
   pragma Import (C, GC_end_stubborn_change, "GC_end_stubborn_change");
   type access_336fa8d4 is access function (a1 : void_ptr) return void_ptr;
   pragma Convention (C, access_336fa8d4);
   function GC_base (a1 : void_ptr) return void_ptr;
   pragma Import (C, GC_base, "GC_base");
   function GC_is_heap_ptr (a1 : void_const_ptr) return signed_int;
   pragma Import (C, GC_is_heap_ptr, "GC_is_heap_ptr");
   function GC_size (a1 : void_const_ptr) return stddef.size_t;
   pragma Import (C, GC_size, "GC_size");
   function GC_realloc (a1 : void_ptr; a2 : stddef.size_t) return void_ptr;
   pragma Import (C, GC_realloc, "GC_realloc");
   function GC_expand_hp (a1 : stddef.size_t) return signed_int;
   pragma Import (C, GC_expand_hp, "GC_expand_hp");
   procedure GC_set_max_heap_size (a1 : GC_word);
   pragma Import (C, GC_set_max_heap_size, "GC_set_max_heap_size");
   type access_4b44b147 is access procedure (a1 : void_ptr; a2 : void_ptr);
   pragma Convention (C, access_4b44b147);
   type access_4b44b147_ptr is access all access_4b44b147;
   for access_4b44b147_ptr'Storage_Size use 0;
   pragma No_Strict_Aliasing (access_4b44b147_ptr);
   pragma Convention (C, access_4b44b147_ptr);
   procedure GC_exclude_static_roots (a1 : void_ptr; a2 : void_ptr);
   pragma Import (C, GC_exclude_static_roots, "GC_exclude_static_roots");
   procedure GC_clear_roots;
   pragma Import (C, GC_clear_roots, "GC_clear_roots");
   procedure GC_add_roots (a1 : void_ptr; a2 : void_ptr);
   pragma Import (C, GC_add_roots, "GC_add_roots");
   procedure GC_remove_roots (a1 : void_ptr; a2 : void_ptr);
   pragma Import (C, GC_remove_roots, "GC_remove_roots");
   procedure GC_register_displacement (a1 : stddef.size_t);
   pragma Import (C, GC_register_displacement, "GC_register_displacement");
   procedure GC_debug_register_displacement (a1 : stddef.size_t);
   pragma Import (C, GC_debug_register_displacement,
      "GC_debug_register_displacement");
   procedure GC_gcollect;
   pragma Import (C, GC_gcollect, "GC_gcollect");
   procedure GC_gcollect_and_unmap;
   pragma Import (C, GC_gcollect_and_unmap, "GC_gcollect_and_unmap");
   subtype GC_stop_func is access_e83afa7d;
   function GC_try_to_collect (a1 : GC_stop_func) return signed_int;
   pragma Import (C, GC_try_to_collect, "GC_try_to_collect");
   procedure GC_set_stop_func (a1 : GC_stop_func);
   pragma Import (C, GC_set_stop_func, "GC_set_stop_func");
   function GC_get_stop_func return GC_stop_func;
   pragma Import (C, GC_get_stop_func, "GC_get_stop_func");
   function GC_get_heap_size return stddef.size_t;
   pragma Import (C, GC_get_heap_size, "GC_get_heap_size");
   function GC_get_free_bytes return stddef.size_t;
   pragma Import (C, GC_get_free_bytes, "GC_get_free_bytes");
   function GC_get_unmapped_bytes return stddef.size_t;
   pragma Import (C, GC_get_unmapped_bytes, "GC_get_unmapped_bytes");
   function GC_get_bytes_since_gc return stddef.size_t;
   pragma Import (C, GC_get_bytes_since_gc, "GC_get_bytes_since_gc");
   function GC_get_total_bytes return stddef.size_t;
   pragma Import (C, GC_get_total_bytes, "GC_get_total_bytes");
   procedure GC_get_heap_usage_safe (a1 : access GC_word;
      a2 : access GC_word; a3 : access GC_word; a4 : access GC_word;
      a5 : access GC_word);
   pragma Import (C, GC_get_heap_usage_safe, "GC_get_heap_usage_safe");
   type struct_GC_prof_stats_s;
   type struct_GC_prof_stats_s is record
      heapsize_full : aliased GC_word;
      free_bytes_full : aliased GC_word;
      unmapped_bytes : aliased GC_word;
      bytes_allocd_since_gc : aliased GC_word;
      allocd_bytes_before_gc : aliased GC_word;
      non_gc_bytes : aliased GC_word;
      gc_no : aliased GC_word;
      markers_m1 : aliased GC_word;
      bytes_reclaimed_since_gc : aliased GC_word;
      reclaimed_bytes_before_gc : aliased GC_word;
   end record;
   pragma Convention (C_Pass_By_Copy, struct_GC_prof_stats_s);
   type struct_GC_prof_stats_s_ptr is access all struct_GC_prof_stats_s;
   for struct_GC_prof_stats_s_ptr'Storage_Size use 0;
   pragma No_Strict_Aliasing (struct_GC_prof_stats_s_ptr);
   pragma Convention (C, struct_GC_prof_stats_s_ptr);
   function GC_get_prof_stats (a1 : access struct_GC_prof_stats_s;
      a2 : stddef.size_t) return stddef.size_t;
   pragma Import (C, GC_get_prof_stats, "GC_get_prof_stats");
   function GC_get_memory_use return stddef.size_t;
   pragma Import (C, GC_get_memory_use, "GC_get_memory_use");
   procedure GC_disable;
   pragma Import (C, GC_disable, "GC_disable");
   function GC_is_disabled return signed_int;
   pragma Import (C, GC_is_disabled, "GC_is_disabled");
   procedure GC_enable;
   pragma Import (C, GC_enable, "GC_enable");
   procedure GC_enable_incremental;
   pragma Import (C, GC_enable_incremental, "GC_enable_incremental");
   function GC_incremental_protection_needs return signed_int;
   pragma Import (C, GC_incremental_protection_needs,
      "GC_incremental_protection_needs");
   function GC_collect_a_little return signed_int;
   pragma Import (C, GC_collect_a_little, "GC_collect_a_little");
   function GC_malloc_ignore_off_page (a1 : stddef.size_t) return void_ptr;
   pragma Import (C, GC_malloc_ignore_off_page, "GC_malloc_ignore_off_page");
   function GC_malloc_atomic_ignore_off_page (a1 : stddef.size_t)
      return void_ptr;
   pragma Import (C, GC_malloc_atomic_ignore_off_page,
      "GC_malloc_atomic_ignore_off_page");
   function GC_malloc_atomic_uncollectable (a1 : stddef.size_t)
      return void_ptr;
   pragma Import (C, GC_malloc_atomic_uncollectable,
      "GC_malloc_atomic_uncollectable");
   function GC_debug_malloc_atomic_uncollectable (a1 : stddef.size_t;
      s : access constant char; i : signed_int) return void_ptr;
   pragma Import (C, GC_debug_malloc_atomic_uncollectable,
      "GC_debug_malloc_atomic_uncollectable");
   function GC_debug_malloc (a1 : stddef.size_t; s : access constant char;
      i : signed_int) return void_ptr;
   pragma Import (C, GC_debug_malloc, "GC_debug_malloc");
   function GC_debug_malloc_atomic (a1 : stddef.size_t;
      s : access constant char; i : signed_int) return void_ptr;
   pragma Import (C, GC_debug_malloc_atomic, "GC_debug_malloc_atomic");
   function GC_debug_strdup (a1 : access constant char;
      s : access constant char; i : signed_int) return char_ptr;
   pragma Import (C, GC_debug_strdup, "GC_debug_strdup");
   function GC_debug_strndup (a1 : access constant char; a2 : stddef.size_t;
      s : access constant char; i : signed_int) return char_ptr;
   pragma Import (C, GC_debug_strndup, "GC_debug_strndup");
   function GC_debug_malloc_uncollectable (a1 : stddef.size_t;
      s : access constant char; i : signed_int) return void_ptr;
   pragma Import (C, GC_debug_malloc_uncollectable,
      "GC_debug_malloc_uncollectable");
   function GC_debug_malloc_stubborn (a1 : stddef.size_t;
      s : access constant char; i : signed_int) return void_ptr;
   pragma Import (C, GC_debug_malloc_stubborn, "GC_debug_malloc_stubborn");
   function GC_debug_malloc_ignore_off_page (a1 : stddef.size_t;
      s : access constant char; i : signed_int) return void_ptr;
   pragma Import (C, GC_debug_malloc_ignore_off_page,
      "GC_debug_malloc_ignore_off_page");
   function GC_debug_malloc_atomic_ignore_off_page (a1 : stddef.size_t;
      s : access constant char; i : signed_int) return void_ptr;
   pragma Import (C, GC_debug_malloc_atomic_ignore_off_page,
      "GC_debug_malloc_atomic_ignore_off_page");
   procedure GC_debug_free (a1 : void_ptr);
   pragma Import (C, GC_debug_free, "GC_debug_free");
   function GC_debug_realloc (a1 : void_ptr; a2 : stddef.size_t;
      s : access constant char; i : signed_int) return void_ptr;
   pragma Import (C, GC_debug_realloc, "GC_debug_realloc");
   procedure GC_debug_change_stubborn (a1 : void_const_ptr);
   pragma Import (C, GC_debug_change_stubborn, "GC_debug_change_stubborn");
   procedure GC_debug_end_stubborn_change (a1 : void_const_ptr);
   pragma Import (C, GC_debug_end_stubborn_change,
      "GC_debug_end_stubborn_change");
   function GC_debug_malloc_replacement (a1 : stddef.size_t) return void_ptr;
   pragma Import (C, GC_debug_malloc_replacement,
      "GC_debug_malloc_replacement");
   function GC_debug_realloc_replacement (a1 : void_ptr; a2 : stddef.size_t)
      return void_ptr;
   pragma Import (C, GC_debug_realloc_replacement,
      "GC_debug_realloc_replacement");
   subtype GC_finalization_proc is access_4b44b147;
   subtype GC_finalization_proc_ptr is access_4b44b147_ptr;
   procedure GC_register_finalizer (a1 : void_ptr; a2 : GC_finalization_proc;
      a3 : void_ptr; a4 : access GC_finalization_proc; a5 : access void_ptr);
   pragma Import (C, GC_register_finalizer, "GC_register_finalizer");
   procedure GC_debug_register_finalizer (a1 : void_ptr;
      a2 : GC_finalization_proc; a3 : void_ptr;
      a4 : access GC_finalization_proc; a5 : access void_ptr);
   pragma Import (C, GC_debug_register_finalizer,
      "GC_debug_register_finalizer");
   procedure GC_register_finalizer_ignore_self (a1 : void_ptr;
      a2 : GC_finalization_proc; a3 : void_ptr;
      a4 : access GC_finalization_proc; a5 : access void_ptr);
   pragma Import (C, GC_register_finalizer_ignore_self,
      "GC_register_finalizer_ignore_self");
   procedure GC_debug_register_finalizer_ignore_self (a1 : void_ptr;
      a2 : GC_finalization_proc; a3 : void_ptr;
      a4 : access GC_finalization_proc; a5 : access void_ptr);
   pragma Import (C, GC_debug_register_finalizer_ignore_self,
      "GC_debug_register_finalizer_ignore_self");
   procedure GC_register_finalizer_no_order (a1 : void_ptr;
      a2 : GC_finalization_proc; a3 : void_ptr;
      a4 : access GC_finalization_proc; a5 : access void_ptr);
   pragma Import (C, GC_register_finalizer_no_order,
      "GC_register_finalizer_no_order");
   procedure GC_debug_register_finalizer_no_order (a1 : void_ptr;
      a2 : GC_finalization_proc; a3 : void_ptr;
      a4 : access GC_finalization_proc; a5 : access void_ptr);
   pragma Import (C, GC_debug_register_finalizer_no_order,
      "GC_debug_register_finalizer_no_order");
   procedure GC_register_finalizer_unreachable (a1 : void_ptr;
      a2 : GC_finalization_proc; a3 : void_ptr;
      a4 : access GC_finalization_proc; a5 : access void_ptr);
   pragma Import (C, GC_register_finalizer_unreachable,
      "GC_register_finalizer_unreachable");
   procedure GC_debug_register_finalizer_unreachable (a1 : void_ptr;
      a2 : GC_finalization_proc; a3 : void_ptr;
      a4 : access GC_finalization_proc; a5 : access void_ptr);
   pragma Import (C, GC_debug_register_finalizer_unreachable,
      "GC_debug_register_finalizer_unreachable");
   function GC_register_disappearing_link (a1 : access void_ptr)
      return signed_int;
   pragma Import (C, GC_register_disappearing_link,
      "GC_register_disappearing_link");
   function GC_general_register_disappearing_link (a1 : access void_ptr;
      a2 : void_const_ptr) return signed_int;
   pragma Import (C, GC_general_register_disappearing_link,
      "GC_general_register_disappearing_link");
   function GC_move_disappearing_link (a1 : access void_ptr;
      a2 : access void_ptr) return signed_int;
   pragma Import (C, GC_move_disappearing_link, "GC_move_disappearing_link");
   function GC_unregister_disappearing_link (a1 : access void_ptr)
      return signed_int;
   pragma Import (C, GC_unregister_disappearing_link,
      "GC_unregister_disappearing_link");
   function GC_register_long_link (a1 : access void_ptr; a2 : void_const_ptr)
      return signed_int;
   pragma Import (C, GC_register_long_link, "GC_register_long_link");
   function GC_move_long_link (a1 : access void_ptr; a2 : access void_ptr)
      return signed_int;
   pragma Import (C, GC_move_long_link, "GC_move_long_link");
   function GC_unregister_long_link (a1 : access void_ptr) return signed_int;
   pragma Import (C, GC_unregister_long_link, "GC_unregister_long_link");
   type enum_a39ac617 is (GC_TOGGLE_REF_DROP, GC_TOGGLE_REF_STRONG,
      GC_TOGGLE_REF_WEAK);
   for enum_a39ac617 use (GC_TOGGLE_REF_DROP => 0, GC_TOGGLE_REF_STRONG => 1,
      GC_TOGGLE_REF_WEAK => 2);
   pragma Convention (C, enum_a39ac617);
   subtype GC_ToggleRefStatus is enum_a39ac617;
   type access_e9efdbe8 is access function (a1 : void_ptr)
      return GC_ToggleRefStatus;
   pragma Convention (C, access_e9efdbe8);
   subtype GC_toggleref_func is access_e9efdbe8;
   procedure GC_set_toggleref_func (a1 : GC_toggleref_func);
   pragma Import (C, GC_set_toggleref_func, "GC_set_toggleref_func");
   function GC_get_toggleref_func return GC_toggleref_func;
   pragma Import (C, GC_get_toggleref_func, "GC_get_toggleref_func");
   function GC_toggleref_add (a1 : void_ptr; a2 : signed_int)
      return signed_int;
   pragma Import (C, GC_toggleref_add, "GC_toggleref_add");
   subtype GC_await_finalize_proc is access_15c277d4;
   procedure GC_set_await_finalize_proc (a1 : GC_await_finalize_proc);
   pragma Import (C, GC_set_await_finalize_proc,
      "GC_set_await_finalize_proc");
   function GC_get_await_finalize_proc return GC_await_finalize_proc;
   pragma Import (C, GC_get_await_finalize_proc,
      "GC_get_await_finalize_proc");
   function GC_should_invoke_finalizers return signed_int;
   pragma Import (C, GC_should_invoke_finalizers,
      "GC_should_invoke_finalizers");
   function GC_invoke_finalizers return signed_int;
   pragma Import (C, GC_invoke_finalizers, "GC_invoke_finalizers");
   type access_112934b1 is access procedure (a1 : access char; a2 : GC_word);
   pragma Convention (C, access_112934b1);
   subtype GC_warn_proc is access_112934b1;
   procedure GC_set_warn_proc (a1 : GC_warn_proc);
   pragma Import (C, GC_set_warn_proc, "GC_set_warn_proc");
   function GC_get_warn_proc return GC_warn_proc;
   pragma Import (C, GC_get_warn_proc, "GC_get_warn_proc");
   procedure GC_ignore_warn_proc (a1 : access char; a2 : GC_word);
   pragma Import (C, GC_ignore_warn_proc, "GC_ignore_warn_proc");
   procedure GC_set_log_fd (a1 : signed_int);
   pragma Import (C, GC_set_log_fd, "GC_set_log_fd");
   type access_83661e81 is access procedure (a1 : access constant char);
   pragma Convention (C, access_83661e81);
   subtype GC_abort_func is access_83661e81;
   procedure GC_set_abort_func (a1 : GC_abort_func);
   pragma Import (C, GC_set_abort_func, "GC_set_abort_func");
   function GC_get_abort_func return GC_abort_func;
   pragma Import (C, GC_get_abort_func, "GC_get_abort_func");
   subtype GC_hidden_pointer is GC_word;
   subtype GC_fn_type is access_336fa8d4;
   function GC_call_with_alloc_lock (a1 : GC_fn_type; a2 : void_ptr)
      return void_ptr;
   pragma Import (C, GC_call_with_alloc_lock, "GC_call_with_alloc_lock");
   type struct_GC_stack_base;
   type struct_GC_stack_base is record
      mem_base : aliased void_ptr;
   end record;
   pragma Convention (C_Pass_By_Copy, struct_GC_stack_base);
   type struct_GC_stack_base_ptr is access all struct_GC_stack_base;
   for struct_GC_stack_base_ptr'Storage_Size use 0;
   pragma No_Strict_Aliasing (struct_GC_stack_base_ptr);
   pragma Convention (C, struct_GC_stack_base_ptr);
   type access_7de56a23 is access function (a1 : access struct_GC_stack_base;
      a2 : void_ptr) return void_ptr;
   pragma Convention (C, access_7de56a23);
   subtype GC_stack_base_func is access_7de56a23;
   function GC_call_with_stack_base (a1 : GC_stack_base_func; a2 : void_ptr)
      return void_ptr;
   pragma Import (C, GC_call_with_stack_base, "GC_call_with_stack_base");
   function GC_do_blocking (a1 : GC_fn_type; a2 : void_ptr) return void_ptr;
   pragma Import (C, GC_do_blocking, "GC_do_blocking");
   function GC_call_with_gc_active (a1 : GC_fn_type; a2 : void_ptr)
      return void_ptr;
   pragma Import (C, GC_call_with_gc_active, "GC_call_with_gc_active");
   function GC_get_stack_base (a1 : access struct_GC_stack_base)
      return signed_int;
   pragma Import (C, GC_get_stack_base, "GC_get_stack_base");
   function GC_same_obj (a1 : void_ptr; a2 : void_ptr) return void_ptr;
   pragma Import (C, GC_same_obj, "GC_same_obj");
   function GC_pre_incr (a1 : access void_ptr; a2 : stddef.ptrdiff_t)
      return void_ptr;
   pragma Import (C, GC_pre_incr, "GC_pre_incr");
   function GC_post_incr (a1 : access void_ptr; a2 : stddef.ptrdiff_t)
      return void_ptr;
   pragma Import (C, GC_post_incr, "GC_post_incr");
   function GC_is_visible (a1 : void_ptr) return void_ptr;
   pragma Import (C, GC_is_visible, "GC_is_visible");
   function GC_is_valid_displacement (a1 : void_ptr) return void_ptr;
   pragma Import (C, GC_is_valid_displacement, "GC_is_valid_displacement");
   procedure GC_dump;
   pragma Import (C, GC_dump, "GC_dump");
   procedure GC_dump_regions;
   pragma Import (C, GC_dump_regions, "GC_dump_regions");
   procedure GC_dump_finalization;
   pragma Import (C, GC_dump_finalization, "GC_dump_finalization");
   GC_same_obj_print_proc : aliased access_4b44b147;
   pragma Import (C, GC_same_obj_print_proc, "GC_same_obj_print_proc");
   GC_is_valid_displacement_print_proc : aliased access_15c277d4;
   pragma Import (C, GC_is_valid_displacement_print_proc,
      "GC_is_valid_displacement_print_proc");
   GC_is_visible_print_proc : aliased access_15c277d4;
   pragma Import (C, GC_is_visible_print_proc, "GC_is_visible_print_proc");
   function GC_malloc_many (a1 : stddef.size_t) return void_ptr;
   pragma Import (C, GC_malloc_many, "GC_malloc_many");
   type access_0137cb6c is access function (a1 : access constant char;
      a2 : void_ptr; a3 : stddef.size_t) return signed_int;
   pragma Convention (C, access_0137cb6c);
   subtype GC_has_static_roots_func is access_0137cb6c;
   procedure GC_register_has_static_roots_callback (
      a1 : GC_has_static_roots_func);
   pragma Import (C, GC_register_has_static_roots_callback,
      "GC_register_has_static_roots_callback");
   procedure GC_set_force_unmap_on_gcollect (a1 : signed_int);
   pragma Import (C, GC_set_force_unmap_on_gcollect,
      "GC_set_force_unmap_on_gcollect");
   function GC_get_force_unmap_on_gcollect return signed_int;
   pragma Import (C, GC_get_force_unmap_on_gcollect,
      "GC_get_force_unmap_on_gcollect");
   procedure GC_win32_free_heap;
   pragma Import (C, GC_win32_free_heap, "GC_win32_free_heap");
   --  GC_CHANGE_STUBBORN (function macro)
   GC_DUPLICATE : constant := 1;
   --  GC_END_STUBBORN_CHANGE (function macro)
   --  GC_EXTRAS (unparsible)
   --  GC_EXTRA_PARAMS (unparsible)
   --  GC_FREE (function macro)
   --  GC_GENERAL_REGISTER_DISAPPEARING_LINK (function macro)
   --  GC_H (empty)
   --  GC_HIDE_POINTER (function macro)
   --  GC_INIT (function macro)
   --  GC_INIT_CONF_DONT_EXPAND (empty)
   --  GC_INIT_CONF_FORCE_UNMAP_ON_GCOLLECT (empty)
   --  GC_INIT_CONF_FREE_SPACE_DIVISOR (empty)
   --  GC_INIT_CONF_FULL_FREQ (empty)
   --  GC_INIT_CONF_IGNORE_WARN (empty)
   --  GC_INIT_CONF_INITIAL_HEAP_SIZE (empty)
   --  GC_INIT_CONF_MAXIMUM_HEAP_SIZE (empty)
   --  GC_INIT_CONF_MAX_RETRIES (empty)
   --  GC_INIT_CONF_ROOTS (empty)
   --  GC_INIT_CONF_SUSPEND_SIGNAL (empty)
   --  GC_INIT_CONF_THR_RESTART_SIGNAL (empty)
   --  GC_INIT_CONF_TIME_LIMIT (empty)
   --  GC_MALLOC (function macro)
   --  GC_MALLOC_ATOMIC (function macro)
   --  GC_MALLOC_ATOMIC_IGNORE_OFF_PAGE (function macro)
   --  GC_MALLOC_ATOMIC_UNCOLLECTABLE (function macro)
   --  GC_MALLOC_IGNORE_OFF_PAGE (function macro)
   --  GC_MALLOC_STUBBORN (function macro)
   --  GC_MALLOC_UNCOLLECTABLE (function macro)
   --  GC_NEW (function macro)
   --  GC_NEW_ATOMIC (function macro)
   --  GC_NEW_STUBBORN (function macro)
   --  GC_NEW_UNCOLLECTABLE (function macro)
   --  GC_NEXT (function macro)
   GC_NOT_FOUND : constant := 4;
   GC_NO_MEMORY : constant := 2;
   GC_NO_THREADS : constant := 2;
   --  GC_POST_DECR (function macro)
   --  GC_POST_INCR (function macro)
   --  GC_PRE_INCR (function macro)
   GC_PROTECTS_NONE : constant := 0;
   GC_PROTECTS_POINTER_HEAP : constant := 1;
   GC_PROTECTS_PTRFREE_HEAP : constant := 2;
   GC_PROTECTS_STACK : constant := 8;
   GC_PROTECTS_STATIC_DATA : constant := 4;
   --  GC_PTR_ADD (function macro)
   --  GC_PTR_STORE (function macro)
   --  GC_REALLOC (function macro)
   --  GC_REGISTER_DISPLACEMENT (function macro)
   --  GC_REGISTER_FINALIZER (function macro)
   --  GC_REGISTER_FINALIZER_IGNORE_SELF (function macro)
   --  GC_REGISTER_FINALIZER_NO_ORDER (function macro)
   --  GC_REGISTER_FINALIZER_UNREACHABLE (function macro)
   --  GC_REGISTER_LONG_LINK (function macro)
   --  GC_REVEAL_POINTER (function macro)
   --  GC_STRDUP (function macro)
   --  GC_STRNDUP (function macro)
   GC_SUCCESS : constant := 0;
   GC_TIME_UNLIMITED : constant := 999999;
   GC_UNIMPLEMENTED : constant := 3;
   --  GC_reachable_here (function macro)
end C.gc.gc;
