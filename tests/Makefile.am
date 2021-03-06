if BUILD_TESTS
noinst_PROGRAMS = \
	gem_stress \
	$(TESTS_progs) \
	$(TESTS_progs_M) \
	$(HANG) \
	$(NULL)

if HAVE_NOUVEAU
NOUVEAU_TESTS_M = \
	prime_nv_test \
	prime_nv_pcopy
NOUVEAU_TESTS = \
	prime_nv_api
endif

TESTS_progs_M = \
	gem_basic \
	gem_cacheing \
	gem_cpu_concurrent_blit \
	gem_cs_tlb \
	gem_dummy_reloc_loop \
	gem_exec_bad_domains \
	gem_exec_nop \
	gem_fence_thrash \
	gem_flink \
	gem_gtt_concurrent_blit \
	gem_mmap_gtt \
	gem_partial_pwrite_pread \
	gem_ringfill \
	gem_set_tiling_vs_blt \
	gem_tiled_partial_pwrite_pread \
	$(NOUVEAU_TESTS_M) \
	kms_flip \
	$(NULL)

TESTS_progs = \
	getversion \
	getclient \
	getstats \
	gem_exec_big \
	gem_exec_blt \
	gem_exec_faulting_reloc \
	gem_readwrite \
	gem_lut_handle \
	gem_exec_lut_handle \
	gem_mmap \
	gem_mmap_offset_exhaustion \
	gem_hangcheck_forcewake \
	gem_pin \
	gem_pwrite \
	gem_pread_after_blit \
	gem_set_tiling_vs_gtt \
	gem_set_tiling_vs_pwrite \
	gem_tiled_pread \
	gem_tiled_pread_pwrite \
	gem_tiled_swapping \
	gem_linear_blits \
	gem_vmap_blits \
	gem_threaded_access_tiled \
	gem_seqno_wrap \
	gem_tiled_blits \
	gem_tiled_fence_blits \
	gem_largeobject \
	gem_bad_length \
	gem_fenced_exec_thrash \
	gem_gtt_speed \
	gem_gtt_cpu_tlb \
	gem_cs_prefetch \
	gem_cpu_reloc \
	gen3_render_linear_blits \
	gen3_render_tiledx_blits \
	gen3_render_tiledy_blits \
	gen3_render_mixed_blits \
	gen3_mixed_blits \
	gem_render_linear_blits \
	gem_render_tiled_blits \
	gem_storedw_loop_render \
	gem_storedw_loop_blt \
	gem_storedw_loop_bsd \
	gem_storedw_batches_loop \
	gem_double_irq_loop \
	gem_ring_sync_loop \
	gem_pipe_control_store_loop \
	gem_unfence_active_buffers \
	gem_unref_active_buffers \
	gem_reloc_overflow \
	gem_reloc_vs_gpu \
	drm_vma_limiter \
	drm_vma_limiter_cpu \
	drm_vma_limiter_gtt \
	drm_vma_limiter_cached \
	sysfs_rc6_residency \
	sysfs_rps \
	gem_wait_render_timeout \
	gem_ctx_create \
	gem_ctx_bad_destroy \
	gem_ctx_exec \
	gem_ctx_bad_exec \
	gem_ctx_basic \
	gem_reg_read \
	gem_tiling_max_stride \
	$(NOUVEAU_TESTS) \
	prime_self_import \
	prime_udl \
	$(NULL)

# IMPORTANT: The ZZ_ tests need to be run last!
# ... and make can't deal with inlined comments ...
TESTS_scripts_M = \
	$(NULL)

TESTS_scripts = \
	test_rte_check
	debugfs_reader \
	debugfs_emon_crash \
	sysfs_l3_parity \
	sysfs_edid_timing \
	module_reload \
	ZZ_hangman \
	$(NULL)

# This target contains testcases which support automagic subtest enumeration
# from the piglit testrunner with --list-subtests and running individual
# subtests with --run-subtest <testname>
multi_kernel_tests = \
	$(TESTS_progs_M) \
	$(TESTS_scripts_M) \
	$(NULL)

single_kernel_tests = \
	$(TESTS_progs) \
	$(TESTS_scripts) \
	$(NULL)

kernel_tests = \
	$(single_kernel_tests) \
	$(multi_kernel_tests) \
	$(NULL)

TESTS = \
	$(NULL)

test:
	@whoami | grep root || ( echo ERROR: not running as root; exit 1 )
	@./check_drm_clients
	@make TESTS="${kernel_tests}" check

list-single-tests:
	@echo TESTLIST
	@echo ${single_kernel_tests}
	@echo END TESTLIST

list-multi-tests:
	@echo TESTLIST
	@echo ${multi_kernel_tests}
	@echo END TESTLIST

HANG = \
	gem_bad_batch \
	gem_hang \
	gem_bad_blit \
	gem_bad_address \
	gem_non_secure_batch \
	$(NULL)

EXTRA_PROGRAMS = $(TESTS_progs) $(TESTS_progs_M) $(HANG)
EXTRA_DIST = $(TESTS_scripts) $(TESTS_scripts_M) drm_lib.sh check_drm_clients debugfs_wedged
CLEANFILES = $(EXTRA_PROGRAMS)

AM_CFLAGS = $(DRM_CFLAGS) $(CWARNFLAGS) \
	-I$(srcdir)/.. \
	-I$(srcdir)/../lib
LDADD = ../lib/libintel_tools.la $(PCIACCESS_LIBS) $(DRM_LIBS) 

testdisplay_SOURCES = \
	testdisplay.c \
	testdisplay.h \
	testdisplay_hotplug.c \
	$(NULL)

TESTS_progs += testdisplay
LDADD += $(CAIRO_LIBS) $(LIBUDEV_LIBS) $(GLIB_LIBS)
AM_CFLAGS += $(CAIRO_CFLAGS) $(LIBUDEV_CFLAGS) $(GLIB_CFLAGS)

gem_fence_thrash_CFLAGS = $(AM_CFLAGS) $(THREAD_CFLAGS)
gem_fence_thrash_LDADD = $(LDADD) -lpthread
gem_threaded_access_tiled_LDADD = $(LDADD) -lpthread

gem_wait_render_timeout_LDADD = $(LDADD) -lrt
kms_flip_LDADD = $(LDADD) -lrt

gem_ctx_basic_LDADD = $(LDADD) -lpthread

prime_nv_test_CFLAGS = $(AM_CFLAGS) $(DRM_NOUVEAU_CFLAGS)
prime_nv_test_LDADD = $(LDADD) $(DRM_NOUVEAU_LIBS)
prime_nv_api_CFLAGS = $(AM_CFLAGS) $(DRM_NOUVEAU_CFLAGS)
prime_nv_api_LDADD = $(LDADD) $(DRM_NOUVEAU_LIBS)
prime_nv_pcopy_CFLAGS = $(AM_CFLAGS) $(DRM_NOUVEAU_CFLAGS)
prime_nv_pcopy_LDADD = $(LDADD) $(DRM_NOUVEAU_LIBS)
endif
