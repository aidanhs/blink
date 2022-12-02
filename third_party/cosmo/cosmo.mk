#-*-mode:makefile-gmake;indent-tabs-mode:t;tab-width:8;coding:utf-8-*-┐
#───vi: set et ft=make ts=8 tw=8 fenc=utf-8 :vi───────────────────────┘

.PRECIOUS: third_party/cosmo/%.gz
third_party/cosmo/%.gz: third_party/cosmo/%.gz.sha256
	curl -so $@ https://justine.lol/cosmotests/$(notdir $@)
	$(VM) build/bootstrap/sha256sum.com $<

.PRECIOUS: third_party/cosmo/%.com.dbg
third_party/cosmo/%.com.dbg: third_party/cosmo/%.com.dbg.gz
	gzip -dc <$< >$@
	chmod +x $@

.PRECIOUS: third_party/cosmo/%.com
third_party/cosmo/%.com: third_party/cosmo/%.com.gz third_party/cosmo/%.com.dbg
	gzip -dc <$< >$@
	chmod +x $@

o/$(MODE)/third_party/cosmo/%.com.ok: third_party/cosmo/%.com o/$(MODE)/blink/blink
	@mkdir -p $(@D)
	o/$(MODE)/blink/blink $<
	@touch $@

o/$(MODE)/third_party/cosmo:									\
		o/$(MODE)/third_party/cosmo/intrin_test.com.ok					\
		o/$(MODE)/third_party/cosmo/lockscale_test.com.ok				\
		o/$(MODE)/third_party/cosmo/palignr_test.com.ok					\
		o/$(MODE)/third_party/cosmo/pmulhrsw_test.com.ok				\
		o/$(MODE)/third_party/cosmo/mulaw_test.com.ok					\
		o/$(MODE)/third_party/cosmo/nanosleep_test.com.ok				\
		o/$(MODE)/third_party/cosmo/palandprintf_test.com.ok				\
		o/$(MODE)/third_party/cosmo/pshuf_test.com.ok					\
		o/$(MODE)/third_party/cosmo/popcnt_test.com.ok					\
		o/$(MODE)/third_party/cosmo/kprintf_test.com.ok					\
		o/$(MODE)/third_party/cosmo/memmem_test.com.ok					\
		o/$(MODE)/third_party/cosmo/memcmp_test.com.ok					\
		o/$(MODE)/third_party/cosmo/memory_test.com.ok					\
		o/$(MODE)/third_party/cosmo/memrchr_test.com.ok					\
		o/$(MODE)/third_party/cosmo/parsecidr_test.com.ok				\
		o/$(MODE)/third_party/cosmo/parsecontentlength_test.com.ok			\
		o/$(MODE)/third_party/cosmo/parseforwarded_test.com.ok				\
		o/$(MODE)/third_party/cosmo/parsehoststxt_test.com.ok				\
		o/$(MODE)/third_party/cosmo/parsehttpdatetime_test.com.ok			\
		o/$(MODE)/third_party/cosmo/parsehttpmessage_test.com.ok			\
		o/$(MODE)/third_party/cosmo/parsehttprange_test.com.ok				\
		o/$(MODE)/third_party/cosmo/parseip_test.com.ok					\
		o/$(MODE)/third_party/cosmo/parseresolvconf_test.com.ok				\
		o/$(MODE)/third_party/cosmo/parseurl_test.com.ok				\
		o/$(MODE)/third_party/cosmo/pascalifydnsname_test.com.ok			\
		o/$(MODE)/third_party/cosmo/pcmpstr_test.com.ok					\
		o/$(MODE)/third_party/cosmo/pingpong_test.com.ok				\
		o/$(MODE)/third_party/cosmo/prototxt_test.com.ok				\
		o/$(MODE)/third_party/cosmo/rand64_test.com.ok					\
		o/$(MODE)/third_party/cosmo/qsort_test.com.ok					\
		o/$(MODE)/third_party/cosmo/readansi_test.com.ok				\
		o/$(MODE)/third_party/cosmo/regex_test.com.ok					\
		o/$(MODE)/third_party/cosmo/renameat_test.com.ok				\
		o/$(MODE)/third_party/cosmo/resolvehostsreverse_test.com.ok			\
		o/$(MODE)/third_party/cosmo/resolvehoststxt_test.com.ok				\
		o/$(MODE)/third_party/cosmo/reverse_test.com.ok					\
		o/$(MODE)/third_party/cosmo/rgb2ansi_test.com.ok				\
		o/$(MODE)/third_party/cosmo/rngset_test.com.ok					\
		o/$(MODE)/third_party/cosmo/round_test.com.ok					\
		o/$(MODE)/third_party/cosmo/roundup2log_test.com.ok				\
		o/$(MODE)/third_party/cosmo/sad16x8n_test.com.ok				\
		o/$(MODE)/third_party/cosmo/scalevolume_test.com.ok				\
		o/$(MODE)/third_party/cosmo/secp384r1_test.com.ok				\
		o/$(MODE)/third_party/cosmo/putenv_test.com.ok					\
		o/$(MODE)/third_party/cosmo/servicestxt_test.com.ok				\
		o/$(MODE)/third_party/cosmo/setitimer_test.com.ok				\
		o/$(MODE)/third_party/cosmo/setlocale_test.com.ok				\
		o/$(MODE)/third_party/cosmo/sigsetjmp_test.com.ok				\
		o/$(MODE)/third_party/cosmo/sin_test.com.ok					\
		o/$(MODE)/third_party/cosmo/sincos_test.com.ok					\
		o/$(MODE)/third_party/cosmo/sinh_test.com.ok					\
		o/$(MODE)/third_party/cosmo/sizetol_test.com.ok					\
		o/$(MODE)/third_party/cosmo/sleb128_test.com.ok					\
		o/$(MODE)/third_party/cosmo/snprintf_test.com.ok				\
		o/$(MODE)/third_party/cosmo/alu_test.com.ok					\
		o/$(MODE)/third_party/cosmo/bsu_test.com.ok					\
		o/$(MODE)/third_party/cosmo/divmul_test.com.ok					\
		o/$(MODE)/third_party/cosmo/test_suite_ecp.com.ok				\
		o/$(MODE)/third_party/cosmo/dll_test.com.ok					\
		o/$(MODE)/third_party/cosmo/asmdown_test.com.ok					\
		o/$(MODE)/third_party/cosmo/argon2_test.com.ok					\
		o/$(MODE)/third_party/cosmo/counter_test.com.ok					\
		o/$(MODE)/third_party/cosmo/pthread_mutex_lock_test.com.ok			\
		o/$(MODE)/third_party/cosmo/pthread_spin_lock_test.com.ok
	@mkdir -p $(@D)
	@touch $@

o/$(MODE)/third_party/cosmo/emulates:								\
		o/$(MODE)/aarch64/third_party/cosmo/intrin_test.com.emulates			\
		o/$(MODE)/aarch64/third_party/cosmo/palandprintf_test.com.emulates		\
		o/$(MODE)/aarch64/third_party/cosmo/divmul_test.com.emulates			\
		o/$(MODE)/aarch64/third_party/cosmo/test_suite_ecp.com.emulates			\
		o/$(MODE)/aarch64/third_party/cosmo/lockscale_test.com.emulates			\
		o/$(MODE)/aarch64/third_party/cosmo/palignr_test.com.emulates			\
		o/$(MODE)/aarch64/third_party/cosmo/pmulhrsw_test.com.emulates			\
		o/$(MODE)/aarch64/third_party/cosmo/pshuf_test.com.emulates			\
		o/$(MODE)/aarch64/third_party/cosmo/alu_test.com.emulates			\
		o/$(MODE)/aarch64/third_party/cosmo/bsu_test.com.emulates			\
		o/$(MODE)/aarch64/third_party/cosmo/pthread_mutex_lock2_test.com.emulates	\
		o/$(MODE)/aarch64/third_party/cosmo/pthread_mutex_lock_test.com.emulates	\
		o/$(MODE)/aarch64/third_party/cosmo/pthread_spin_lock_test.com.emulates		\
		o/$(MODE)/mips64/third_party/cosmo/intrin_test.com.emulates			\
		o/$(MODE)/mips64/third_party/cosmo/palandprintf_test.com.emulates		\
		o/$(MODE)/mips64/third_party/cosmo/divmul_test.com.emulates			\
		o/$(MODE)/mips64/third_party/cosmo/test_suite_ecp.com.emulates			\
		o/$(MODE)/mips64/third_party/cosmo/lockscale_test.com.emulates			\
		o/$(MODE)/mips64/third_party/cosmo/palignr_test.com.emulates			\
		o/$(MODE)/mips64/third_party/cosmo/pmulhrsw_test.com.emulates			\
		o/$(MODE)/mips64/third_party/cosmo/pshuf_test.com.emulates			\
		o/$(MODE)/mips64/third_party/cosmo/pthread_mutex_lock2_test.com.emulates	\
		o/$(MODE)/mips64/third_party/cosmo/pthread_mutex_lock_test.com.emulates		\
		o/$(MODE)/mips64/third_party/cosmo/pthread_spin_lock_test.com.emulates		\
		o/$(MODE)/mips64el/third_party/cosmo/intrin_test.com.emulates			\
		o/$(MODE)/mips64el/third_party/cosmo/palandprintf_test.com.emulates		\
		o/$(MODE)/mips64el/third_party/cosmo/divmul_test.com.emulates			\
		o/$(MODE)/mips64el/third_party/cosmo/test_suite_ecp.com.emulates		\
		o/$(MODE)/mips64el/third_party/cosmo/lockscale_test.com.emulates		\
		o/$(MODE)/mips64el/third_party/cosmo/palignr_test.com.emulates			\
		o/$(MODE)/mips64el/third_party/cosmo/pmulhrsw_test.com.emulates			\
		o/$(MODE)/mips64el/third_party/cosmo/pshuf_test.com.emulates			\
		o/$(MODE)/mips64el/third_party/cosmo/pthread_mutex_lock2_test.com.emulates	\
		o/$(MODE)/mips64el/third_party/cosmo/pthread_mutex_lock_test.com.emulates	\
		o/$(MODE)/mips64el/third_party/cosmo/pthread_spin_lock_test.com.emulates	\
		o/$(MODE)/s390x/third_party/cosmo/intrin_test.com.emulates			\
		o/$(MODE)/s390x/third_party/cosmo/palandprintf_test.com.emulates		\
		o/$(MODE)/s390x/third_party/cosmo/divmul_test.com.emulates			\
		o/$(MODE)/s390x/third_party/cosmo/test_suite_ecp.com.emulates			\
		o/$(MODE)/s390x/third_party/cosmo/lockscale_test.com.emulates			\
		o/$(MODE)/s390x/third_party/cosmo/palignr_test.com.emulates			\
		o/$(MODE)/s390x/third_party/cosmo/pmulhrsw_test.com.emulates			\
		o/$(MODE)/s390x/third_party/cosmo/pshuf_test.com.emulates			\
		o/$(MODE)/s390x/third_party/cosmo/alu_test.com.emulates				\
		o/$(MODE)/s390x/third_party/cosmo/pthread_mutex_lock2_test.com.emulates		\
		o/$(MODE)/s390x/third_party/cosmo/pthread_mutex_lock_test.com.emulates		\
		o/$(MODE)/s390x/third_party/cosmo/pthread_spin_lock_test.com.emulates		\
		o/$(MODE)/powerpc64le/third_party/cosmo/intrin_test.com.emulates		\
		o/$(MODE)/powerpc64le/third_party/cosmo/palandprintf_test.com.emulates		\
		o/$(MODE)/powerpc64le/third_party/cosmo/divmul_test.com.emulates		\
		o/$(MODE)/powerpc64le/third_party/cosmo/test_suite_ecp.com.emulates		\
		o/$(MODE)/powerpc64le/third_party/cosmo/lockscale_test.com.emulates		\
		o/$(MODE)/powerpc64le/third_party/cosmo/palignr_test.com.emulates		\
		o/$(MODE)/powerpc64le/third_party/cosmo/pmulhrsw_test.com.emulates		\
		o/$(MODE)/powerpc64le/third_party/cosmo/pshuf_test.com.emulates			\
		o/$(MODE)/powerpc64le/third_party/cosmo/pthread_mutex_lock2_test.com.emulates	\
		o/$(MODE)/powerpc64le/third_party/cosmo/pthread_mutex_lock_test.com.emulates	\
		o/$(MODE)/powerpc64le/third_party/cosmo/pthread_spin_lock_test.com.emulates
	@mkdir -p $(@D)
	@touch $@