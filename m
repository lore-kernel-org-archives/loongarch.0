Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D44D2178395;
	Thu, 23 Jan 2025 17:12:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737652370; cv=none; b=J9bbN0ybT1gnkSGkBtAz14arTlyf3R+6S2kwxweUp7pamNBvtLhsdjwU2PH/KqcWK2n+cFfYlabxusrFCgZravzUMy2xjWrofMNefNuomGuyRMOnApB2cksq8vFmwchq1WAu8mZ90qC3JpXfzCJdrbagTezze49F+6lk+AVURTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737652370; c=relaxed/simple;
	bh=rDXm5sDl2r4l01cOX4A8xd7ltWj9yMuNU2uwB3Qo2C0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uzL+OcWoHiRSsRxcjgJTodTLD7z1kyTuiFSIfnWV3NB1p7DbZe5pzOB7yUYxsP0kgoWPsFV999Yab0D/YjV8OJt4uYokaSK5B8Sg4J4coS12VaPO7ecYTwiL6X5RcBA5vf6PBJHHHbvvRts1uXvJWMDRjLGQ6WY5LF4nTw/xrsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XwXu+MDj; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XwXu+MDj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737652368; x=1769188368;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rDXm5sDl2r4l01cOX4A8xd7ltWj9yMuNU2uwB3Qo2C0=;
  b=XwXu+MDjwa61hm2D+o6n9a+KNLFxiWvXA/Kipe/dti4jFA6Y6+SdMe8K
   uxk9wQ5nHHGbTbz6I5I1rDa5OOMkTYgABZJpC8FpP+0ejY8/2HNrTO6d0
   idXxShJ9KNMIAhL/gbcoUa70qYLEecMk6DCiFpa4k167MrKRPjwg/wvAN
   V6nFAgtI+6Kt2j6U55F5lv5h4LvXXrBv1QGKEHNQjPNGERYKlZTKMsBFh
   cQIHhWBOAGf+u9ypdKyNQMmJGPxTTop7P77Dl5ECvCkwjf5do5yLD8Kz2
   pbsKwdPS7NaVWb5OUrtAENk3MFMxZ9kgWJB/pMcYiKIxpR3VKYoqKn+Uu
   w==;
X-CSE-ConnectionGUID: 84UM1Hn9S6C/nDgdFbfU2Q==
X-CSE-MsgGUID: whT4/v9DSrm0nryh6YHiAA==
X-IronPort-AV: E=McAfee;i="6700,10204,11324"; a="55711494"
X-IronPort-AV: E=Sophos;i="6.13,229,1732608000"; 
   d="scan'208";a="55711494"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2025 09:12:47 -0800
X-CSE-ConnectionGUID: j+JYnxesRNeJ8vKamkYjAg==
X-CSE-MsgGUID: 7krEaXifSqiNZvh20tZZyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,229,1732608000"; 
   d="scan'208";a="107329231"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 23 Jan 2025 09:12:44 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tb0kz-000bQp-02;
	Thu, 23 Jan 2025 17:12:41 +0000
Date: Fri, 24 Jan 2025 01:12:24 +0800
From: kernel test robot <lkp@intel.com>
To: Charlie Jenkins <charlie@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Andy Lutomirski <luto@kernel.org>,
	Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev,
	Charlie Jenkins <charlie@rivosinc.com>
Subject: Re: [PATCH 3/4] loongarch: entry: Migrate ret_from_fork() to C
Message-ID: <202501240042.hEXt9u9r-lkp@intel.com>
References: <20250122-riscv_optimize_entry-v1-3-4ee95559cfd0@rivosinc.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250122-riscv_optimize_entry-v1-3-4ee95559cfd0@rivosinc.com>

Hi Charlie,

kernel test robot noticed the following build errors:

[auto build test ERROR on ffd294d346d185b70e28b1a28abe367bbfe53c04]

url:    https://github.com/intel-lab-lkp/linux/commits/Charlie-Jenkins/riscv-entry-Convert-ret_from_fork-to-C/20250123-065957
base:   ffd294d346d185b70e28b1a28abe367bbfe53c04
patch link:    https://lore.kernel.org/r/20250122-riscv_optimize_entry-v1-3-4ee95559cfd0%40rivosinc.com
patch subject: [PATCH 3/4] loongarch: entry: Migrate ret_from_fork() to C
config: loongarch-allnoconfig (https://download.01.org/0day-ci/archive/20250124/202501240042.hEXt9u9r-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250124/202501240042.hEXt9u9r-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501240042.hEXt9u9r-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/loongarch/kernel/process.c: In function 'ret_from_kernel_thread':
>> arch/loongarch/kernel/process.c:76:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
      76 | {
         | ^
   arch/loongarch/kernel/process.c:105:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     105 | {
         | ^
   arch/loongarch/kernel/process.c:110:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     110 | {
         | ^
   arch/loongarch/kernel/process.c:114:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     114 | {
         | ^
   arch/loongarch/kernel/process.c:151:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     151 | {
         | ^
   arch/loongarch/kernel/process.c:160:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     160 | {
         | ^
   arch/loongarch/kernel/process.c:169:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     169 | {
         | ^
   arch/loongarch/kernel/process.c:234:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     234 | {
         | ^
   arch/loongarch/kernel/process.c:257:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     257 | {
         | ^
   arch/loongarch/kernel/process.c:279:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     279 | {
         | ^
   arch/loongarch/kernel/process.c:296:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     296 | {
         | ^
   arch/loongarch/kernel/process.c:317:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     317 | {
         | ^
   arch/loongarch/kernel/process.c:338:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     338 | {
         | ^
   In file included from include/asm-generic/percpu.h:7,
                    from arch/loongarch/include/asm/percpu.h:184,
                    from include/linux/irqflags.h:19,
                    from include/linux/spinlock.h:59,
                    from include/linux/sched.h:2171,
                    from include/linux/ratelimit.h:6,
                    from include/linux/dev_printk.h:16,
                    from include/linux/device.h:15,
                    from include/linux/node.h:18,
                    from include/linux/cpu.h:17,
                    from arch/loongarch/kernel/process.c:13:
>> arch/loongarch/kernel/process.c:345:43: error: storage class specified for parameter 'backtrace_csd'
     345 | static DEFINE_PER_CPU(call_single_data_t, backtrace_csd);
         |                                           ^~~~~~~~~~~~~
   include/linux/percpu-defs.h:104:44: note: in definition of macro 'DEFINE_PER_CPU_SECTION'
     104 |         __PCPU_ATTRS(sec) __typeof__(type) name
         |                                            ^~~~
   arch/loongarch/kernel/process.c:345:8: note: in expansion of macro 'DEFINE_PER_CPU'
     345 | static DEFINE_PER_CPU(call_single_data_t, backtrace_csd);
         |        ^~~~~~~~~~~~~~
>> arch/loongarch/kernel/process.c:345:43: error: section attribute not allowed for 'backtrace_csd'
     345 | static DEFINE_PER_CPU(call_single_data_t, backtrace_csd);
         |                                           ^~~~~~~~~~~~~
   include/linux/percpu-defs.h:104:44: note: in definition of macro 'DEFINE_PER_CPU_SECTION'
     104 |         __PCPU_ATTRS(sec) __typeof__(type) name
         |                                            ^~~~
   arch/loongarch/kernel/process.c:345:8: note: in expansion of macro 'DEFINE_PER_CPU'
     345 | static DEFINE_PER_CPU(call_single_data_t, backtrace_csd);
         |        ^~~~~~~~~~~~~~
>> arch/loongarch/kernel/process.c:346:23: error: storage class specified for parameter 'backtrace_csd_busy'
     346 | static struct cpumask backtrace_csd_busy;
         |                       ^~~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/process.c:349:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     349 | {
         | ^
   arch/loongarch/kernel/process.c:355:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     355 | {
         | ^
   arch/loongarch/kernel/process.c:379:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     379 | {
         | ^
   arch/loongarch/kernel/process.c:385:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     385 | {
         | ^
>> arch/loongarch/kernel/process.c:70:35: error: old-style parameter declarations in prototyped function definition
      70 | void noinstr __no_stack_protector ret_from_kernel_thread(struct task_struct *prev,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~
>> arch/loongarch/kernel/process.c:402: error: expected '{' at end of input


vim +76 arch/loongarch/kernel/process.c

803b0fc5c3f2baa Huacai Chen     2022-05-31  @13  #include <linux/cpu.h>
803b0fc5c3f2baa Huacai Chen     2022-05-31   14  #include <linux/init.h>
803b0fc5c3f2baa Huacai Chen     2022-05-31   15  #include <linux/kernel.h>
803b0fc5c3f2baa Huacai Chen     2022-05-31   16  #include <linux/errno.h>
5c881018646d666 Charlie Jenkins 2025-01-22   17  #include <linux/entry-common.h>
803b0fc5c3f2baa Huacai Chen     2022-05-31   18  #include <linux/sched.h>
803b0fc5c3f2baa Huacai Chen     2022-05-31   19  #include <linux/sched/debug.h>
803b0fc5c3f2baa Huacai Chen     2022-05-31   20  #include <linux/sched/task.h>
803b0fc5c3f2baa Huacai Chen     2022-05-31   21  #include <linux/sched/task_stack.h>
edffa33c7bb5a73 Qing Zhang      2023-02-25   22  #include <linux/hw_breakpoint.h>
803b0fc5c3f2baa Huacai Chen     2022-05-31   23  #include <linux/mm.h>
803b0fc5c3f2baa Huacai Chen     2022-05-31   24  #include <linux/stddef.h>
803b0fc5c3f2baa Huacai Chen     2022-05-31   25  #include <linux/unistd.h>
803b0fc5c3f2baa Huacai Chen     2022-05-31   26  #include <linux/export.h>
803b0fc5c3f2baa Huacai Chen     2022-05-31   27  #include <linux/ptrace.h>
803b0fc5c3f2baa Huacai Chen     2022-05-31   28  #include <linux/mman.h>
803b0fc5c3f2baa Huacai Chen     2022-05-31   29  #include <linux/personality.h>
803b0fc5c3f2baa Huacai Chen     2022-05-31   30  #include <linux/sys.h>
803b0fc5c3f2baa Huacai Chen     2022-05-31   31  #include <linux/completion.h>
803b0fc5c3f2baa Huacai Chen     2022-05-31   32  #include <linux/kallsyms.h>
803b0fc5c3f2baa Huacai Chen     2022-05-31   33  #include <linux/random.h>
803b0fc5c3f2baa Huacai Chen     2022-05-31   34  #include <linux/prctl.h>
803b0fc5c3f2baa Huacai Chen     2022-05-31   35  #include <linux/nmi.h>
803b0fc5c3f2baa Huacai Chen     2022-05-31   36  
803b0fc5c3f2baa Huacai Chen     2022-05-31   37  #include <asm/asm.h>
803b0fc5c3f2baa Huacai Chen     2022-05-31   38  #include <asm/bootinfo.h>
803b0fc5c3f2baa Huacai Chen     2022-05-31   39  #include <asm/cpu.h>
803b0fc5c3f2baa Huacai Chen     2022-05-31   40  #include <asm/elf.h>
c718a0bad75ccef Bibo Mao        2023-09-20   41  #include <asm/exec.h>
803b0fc5c3f2baa Huacai Chen     2022-05-31   42  #include <asm/fpu.h>
bd3c5798484aa9a Qi Hu           2023-09-06   43  #include <asm/lbt.h>
803b0fc5c3f2baa Huacai Chen     2022-05-31   44  #include <asm/io.h>
803b0fc5c3f2baa Huacai Chen     2022-05-31   45  #include <asm/irq.h>
803b0fc5c3f2baa Huacai Chen     2022-05-31   46  #include <asm/irq_regs.h>
803b0fc5c3f2baa Huacai Chen     2022-05-31   47  #include <asm/loongarch.h>
803b0fc5c3f2baa Huacai Chen     2022-05-31   48  #include <asm/pgtable.h>
803b0fc5c3f2baa Huacai Chen     2022-05-31   49  #include <asm/processor.h>
803b0fc5c3f2baa Huacai Chen     2022-05-31   50  #include <asm/reg.h>
5c881018646d666 Charlie Jenkins 2025-01-22   51  #include <asm/switch_to.h>
49232773d8233ed Qing Zhang      2022-08-06   52  #include <asm/unwind.h>
803b0fc5c3f2baa Huacai Chen     2022-05-31   53  #include <asm/vdso.h>
803b0fc5c3f2baa Huacai Chen     2022-05-31   54  
09f33601bf940f9 Huacai Chen     2022-12-10   55  #ifdef CONFIG_STACKPROTECTOR
09f33601bf940f9 Huacai Chen     2022-12-10   56  #include <linux/stackprotector.h>
09f33601bf940f9 Huacai Chen     2022-12-10   57  unsigned long __stack_chk_guard __read_mostly;
09f33601bf940f9 Huacai Chen     2022-12-10   58  EXPORT_SYMBOL(__stack_chk_guard);
09f33601bf940f9 Huacai Chen     2022-12-10   59  #endif
09f33601bf940f9 Huacai Chen     2022-12-10   60  
803b0fc5c3f2baa Huacai Chen     2022-05-31   61  /*
803b0fc5c3f2baa Huacai Chen     2022-05-31   62   * Idle related variables and functions
803b0fc5c3f2baa Huacai Chen     2022-05-31   63   */
803b0fc5c3f2baa Huacai Chen     2022-05-31   64  
803b0fc5c3f2baa Huacai Chen     2022-05-31   65  unsigned long boot_option_idle_override = IDLE_NO_OVERRIDE;
803b0fc5c3f2baa Huacai Chen     2022-05-31   66  EXPORT_SYMBOL(boot_option_idle_override);
803b0fc5c3f2baa Huacai Chen     2022-05-31   67  
5c881018646d666 Charlie Jenkins 2025-01-22   68  asmlinkage void restore_and_ret(void);
5c881018646d666 Charlie Jenkins 2025-01-22   69  asmlinkage void ret_from_fork_asm(void);
5c881018646d666 Charlie Jenkins 2025-01-22  @70  void noinstr __no_stack_protector ret_from_kernel_thread(struct task_struct *prev,
5c881018646d666 Charlie Jenkins 2025-01-22   71  							 struct pt_regs *regs,
5c881018646d666 Charlie Jenkins 2025-01-22   72  							 int (*fn)(void *),
5c881018646d666 Charlie Jenkins 2025-01-22   73  							 void *fn_arg)
803b0fc5c3f2baa Huacai Chen     2022-05-31   74  
803b0fc5c3f2baa Huacai Chen     2022-05-31   75  void start_thread(struct pt_regs *regs, unsigned long pc, unsigned long sp)
803b0fc5c3f2baa Huacai Chen     2022-05-31  @76  {
803b0fc5c3f2baa Huacai Chen     2022-05-31   77  	unsigned long crmd;
803b0fc5c3f2baa Huacai Chen     2022-05-31   78  	unsigned long prmd;
803b0fc5c3f2baa Huacai Chen     2022-05-31   79  	unsigned long euen;
803b0fc5c3f2baa Huacai Chen     2022-05-31   80  
803b0fc5c3f2baa Huacai Chen     2022-05-31   81  	/* New thread loses kernel privileges. */
803b0fc5c3f2baa Huacai Chen     2022-05-31   82  	crmd = regs->csr_crmd & ~(PLV_MASK);
803b0fc5c3f2baa Huacai Chen     2022-05-31   83  	crmd |= PLV_USER;
803b0fc5c3f2baa Huacai Chen     2022-05-31   84  	regs->csr_crmd = crmd;
803b0fc5c3f2baa Huacai Chen     2022-05-31   85  
803b0fc5c3f2baa Huacai Chen     2022-05-31   86  	prmd = regs->csr_prmd & ~(PLV_MASK);
803b0fc5c3f2baa Huacai Chen     2022-05-31   87  	prmd |= PLV_USER;
803b0fc5c3f2baa Huacai Chen     2022-05-31   88  	regs->csr_prmd = prmd;
803b0fc5c3f2baa Huacai Chen     2022-05-31   89  
803b0fc5c3f2baa Huacai Chen     2022-05-31   90  	euen = regs->csr_euen & ~(CSR_EUEN_FPEN);
803b0fc5c3f2baa Huacai Chen     2022-05-31   91  	regs->csr_euen = euen;
803b0fc5c3f2baa Huacai Chen     2022-05-31   92  	lose_fpu(0);
bd3c5798484aa9a Qi Hu           2023-09-06   93  	lose_lbt(0);
c2396651309eba2 Xi Ruoyao       2024-01-17   94  	current->thread.fpu.fcsr = boot_cpu_data.fpu_csr0;
803b0fc5c3f2baa Huacai Chen     2022-05-31   95  
803b0fc5c3f2baa Huacai Chen     2022-05-31   96  	clear_thread_flag(TIF_LSX_CTX_LIVE);
803b0fc5c3f2baa Huacai Chen     2022-05-31   97  	clear_thread_flag(TIF_LASX_CTX_LIVE);
bd3c5798484aa9a Qi Hu           2023-09-06   98  	clear_thread_flag(TIF_LBT_CTX_LIVE);
803b0fc5c3f2baa Huacai Chen     2022-05-31   99  	clear_used_math();
803b0fc5c3f2baa Huacai Chen     2022-05-31  100  	regs->csr_era = pc;
803b0fc5c3f2baa Huacai Chen     2022-05-31  101  	regs->regs[3] = sp;
803b0fc5c3f2baa Huacai Chen     2022-05-31  102  }
803b0fc5c3f2baa Huacai Chen     2022-05-31  103  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
