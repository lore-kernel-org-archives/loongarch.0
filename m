Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B897F30AACB;
	Sun, 12 Apr 2026 08:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775984320; cv=none; b=ZMWWzBdPp5k1u9cg9ATluLy8wUUbh2veYWtwhG9OxU0VHeky3e8dDiWkQmqEiKrrmiGOs8LWzXnnkAZBJThddmg/ndk5fydYzV+0jlMgWAcga7BNJUAYI/Kv+m2ExlqN1tA5/bF99H7/Anwn55u0n6z8VX1RJfq6F+o0Zed3oF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775984320; c=relaxed/simple;
	bh=qAklJoEYJxBKynj6v5uLBsR7nKGmayAGzI7yNf5ztC4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hH63Cqz9HSvJDoLTYUWD0y+0B4vlCEmBpoe+iai4GkJeoiGA6SIhX20prpJBpK/0pPczt2s6gsiCJKtxgHLh3dVIhD+O0vOzvliWbM41EIx4Y55v+r9b1P6Y5k9pDedP1bNCqH4wYr7IrCrEVaJNQ+7ZIQWxK3KSSw64c8xuhSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mtGahJYF; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mtGahJYF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775984317; x=1807520317;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qAklJoEYJxBKynj6v5uLBsR7nKGmayAGzI7yNf5ztC4=;
  b=mtGahJYFoQSrEX2zrxTAWCv9nUDgo3qHI9MeRnn9Kl/urjDrBxX8p+Tm
   nEV8v8nLOR+582Lk8NLluew6qaPadSkN/DRUNpnJx1PsWDK5XDe9MbNU4
   oDOEz+ecKnlu2f2s024DRtsC/mW5q1+ykVMIM56IFm7WhH398AlqFzloE
   nKYctN9ruSkgwnygNJJxDnW2OsTD/kBK8nMyBhdxu8Xfq4N1sqVhdbMEI
   Cj8r35IVQy7NyoO2lLifc7FXXcSgzI9Iy/cpWFqKFnQDU1patEi1VSbaY
   KLOxctwaOARcOZUOT4o9JN1lZoMHHDoh2G3TTVY10pTk3OY2oiWgPaxKi
   Q==;
X-CSE-ConnectionGUID: SQGh3qOVR/CWVWf6dzLYXg==
X-CSE-MsgGUID: P/y7SlmLTWKCQ6Hoz4UtgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="76966096"
X-IronPort-AV: E=Sophos;i="6.23,175,1770624000"; 
   d="scan'208";a="76966096"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2026 01:58:36 -0700
X-CSE-ConnectionGUID: igqHwTjDTuyouqBLMnwEhQ==
X-CSE-MsgGUID: OxobqrGqQ92PpZVC57tJog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,175,1770624000"; 
   d="scan'208";a="226342364"
Received: from lkp-server01.sh.intel.com (HELO 3eaaf1a74b89) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 12 Apr 2026 01:58:34 -0700
Received: from kbuild by 3eaaf1a74b89 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wBqeF-0000000023V-1K90;
	Sun, 12 Apr 2026 08:58:31 +0000
Date: Sun, 12 Apr 2026 16:58:25 +0800
From: kernel test robot <lkp@intel.com>
To: Yuqian Yang <yangyuqian@uniontech.com>,
	Huacai Chen <chenhuacai@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, WANG Xuerui <kernel@xen0n.name>,
	Cheng Nie <niecheng1@uniontech.com>,
	Wentao Guan <guanwentao@uniontech.com>,
	Dandan Zhang <zhangdandan@uniontech.com>, loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yuqian Yang <yangyuqian@uniontech.com>
Subject: Re: [PATCH] loongarch: improve logging of disabling KASLR.
Message-ID: <202604121652.1axNYwys-lkp@intel.com>
References: <E4B91143DC525DC6+20260403063008.94237-1-yangyuqian@uniontech.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E4B91143DC525DC6+20260403063008.94237-1-yangyuqian@uniontech.com>

Hi Yuqian,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v7.0-rc7 next-20260410]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yuqian-Yang/loongarch-improve-logging-of-disabling-KASLR/20260412-053808
base:   linus/master
patch link:    https://lore.kernel.org/r/E4B91143DC525DC6%2B20260403063008.94237-1-yangyuqian%40uniontech.com
patch subject: [PATCH] loongarch: improve logging of disabling KASLR.
config: loongarch-randconfig-002-20260412 (https://download.01.org/0day-ci/archive/20260412/202604121652.1axNYwys-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260412/202604121652.1axNYwys-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604121652.1axNYwys-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/asm-generic/bug.h:31,
                    from arch/loongarch/include/asm/bug.h:60,
                    from include/linux/bug.h:5,
                    from include/linux/instrumented.h:10,
                    from include/linux/atomic/atomic-instrumented.h:17,
                    from include/linux/atomic.h:82,
                    from include/asm-generic/bitops/atomic.h:5,
                    from arch/loongarch/include/asm/bitops.h:38,
                    from include/linux/bitops.h:67,
                    from include/linux/bitmap.h:8,
                    from include/linux/nodemask.h:91,
                    from include/linux/list_lru.h:12,
                    from include/linux/fs/super_types.h:7,
                    from include/linux/fs/super.h:5,
                    from include/linux/fs.h:5,
                    from arch/loongarch/include/asm/elf.h:9,
                    from include/linux/elf.h:6,
                    from arch/loongarch/kernel/relocate.c:8:
   arch/loongarch/kernel/relocate.c: In function 'kaslr_disabled':
>> arch/loongarch/kernel/relocate.c:144:25: error: expected ')' before 'message'
     144 |                 pr_info(message, "nokaslr", "built-in");
         |                         ^~~~~~~
   include/linux/printk.h:483:25: note: in definition of macro 'printk_index_wrap'
     483 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/linux/printk.h:584:9: note: in expansion of macro 'printk'
     584 |         printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   include/linux/printk.h:584:26: note: in expansion of macro 'pr_fmt'
     584 |         printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |                          ^~~~~~
   arch/loongarch/kernel/relocate.c:144:17: note: in expansion of macro 'pr_info'
     144 |                 pr_info(message, "nokaslr", "built-in");
         |                 ^~~~~~~
   include/linux/printk.h:483:24: note: to match this '('
     483 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                        ^
   include/linux/printk.h:511:26: note: in expansion of macro 'printk_index_wrap'
     511 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                          ^~~~~~~~~~~~~~~~~
   include/linux/printk.h:584:9: note: in expansion of macro 'printk'
     584 |         printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   arch/loongarch/kernel/relocate.c:144:17: note: in expansion of macro 'pr_info'
     144 |                 pr_info(message, "nokaslr", "built-in");
         |                 ^~~~~~~
   arch/loongarch/kernel/relocate.c:150:25: error: expected ')' before 'message'
     150 |                 pr_info(message, "nokaslr", "boot");
         |                         ^~~~~~~
   include/linux/printk.h:483:25: note: in definition of macro 'printk_index_wrap'
     483 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/linux/printk.h:584:9: note: in expansion of macro 'printk'
     584 |         printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   include/linux/printk.h:584:26: note: in expansion of macro 'pr_fmt'
     584 |         printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |                          ^~~~~~
   arch/loongarch/kernel/relocate.c:150:17: note: in expansion of macro 'pr_info'
     150 |                 pr_info(message, "nokaslr", "boot");
         |                 ^~~~~~~
   include/linux/printk.h:483:24: note: to match this '('
     483 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                        ^
   include/linux/printk.h:511:26: note: in expansion of macro 'printk_index_wrap'
     511 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                          ^~~~~~~~~~~~~~~~~
   include/linux/printk.h:584:9: note: in expansion of macro 'printk'
     584 |         printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   arch/loongarch/kernel/relocate.c:150:17: note: in expansion of macro 'pr_info'
     150 |                 pr_info(message, "nokaslr", "boot");
         |                 ^~~~~~~
   arch/loongarch/kernel/relocate.c:186:25: error: expected ')' before 'message'
     186 |                 pr_info(message, "kexec_file", "boot");
         |                         ^~~~~~~
   include/linux/printk.h:483:25: note: in definition of macro 'printk_index_wrap'
     483 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/linux/printk.h:584:9: note: in expansion of macro 'printk'
     584 |         printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   include/linux/printk.h:584:26: note: in expansion of macro 'pr_fmt'
     584 |         printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |                          ^~~~~~
   arch/loongarch/kernel/relocate.c:186:17: note: in expansion of macro 'pr_info'
     186 |                 pr_info(message, "kexec_file", "boot");
         |                 ^~~~~~~
   include/linux/printk.h:483:24: note: to match this '('
     483 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                        ^
   include/linux/printk.h:511:26: note: in expansion of macro 'printk_index_wrap'
     511 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                          ^~~~~~~~~~~~~~~~~
   include/linux/printk.h:584:9: note: in expansion of macro 'printk'
     584 |         printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   arch/loongarch/kernel/relocate.c:186:17: note: in expansion of macro 'pr_info'
     186 |                 pr_info(message, "kexec_file", "boot");
         |                 ^~~~~~~
   arch/loongarch/kernel/relocate.c:140:27: warning: unused variable 'message' [-Wunused-variable]
     140 |         const char *const message = "KASLR is disabled by %s in %s cmdline.\n";
         |                           ^~~~~~~


vim +144 arch/loongarch/kernel/relocate.c

   > 8	#include <linux/elf.h>
     9	#include <linux/kernel.h>
    10	#include <linux/printk.h>
    11	#include <linux/panic_notifier.h>
    12	#include <linux/start_kernel.h>
    13	#include <asm/bootinfo.h>
    14	#include <asm/early_ioremap.h>
    15	#include <asm/inst.h>
    16	#include <asm/io.h>
    17	#include <asm/sections.h>
    18	#include <asm/setup.h>
    19	
    20	#define RELOCATED(x) ((void *)((long)x + reloc_offset))
    21	#define RELOCATED_KASLR(x) ((void *)((long)x + random_offset))
    22	
    23	static unsigned long reloc_offset;
    24	
    25	static inline void __init relocate_relative(void)
    26	{
    27		Elf64_Rela *rela, *rela_end;
    28		rela = (Elf64_Rela *)&__rela_dyn_begin;
    29		rela_end = (Elf64_Rela *)&__rela_dyn_end;
    30	
    31		for ( ; rela < rela_end; rela++) {
    32			Elf64_Addr addr = rela->r_offset;
    33			Elf64_Addr relocated_addr = rela->r_addend;
    34	
    35			if (rela->r_info != R_LARCH_RELATIVE)
    36				continue;
    37	
    38			relocated_addr = (Elf64_Addr)RELOCATED(relocated_addr);
    39			*(Elf64_Addr *)RELOCATED(addr) = relocated_addr;
    40		}
    41	
    42	#ifdef CONFIG_RELR
    43		u64 *addr = NULL;
    44		u64 *relr = (u64 *)&__relr_dyn_begin;
    45		u64 *relr_end = (u64 *)&__relr_dyn_end;
    46	
    47		for ( ; relr < relr_end; relr++) {
    48			if ((*relr & 1) == 0) {
    49				addr = (u64 *)(*relr + reloc_offset);
    50				*addr++ += reloc_offset;
    51			} else {
    52				for (u64 *p = addr, r = *relr >> 1; r; p++, r >>= 1)
    53					if (r & 1)
    54						*p += reloc_offset;
    55				addr += 63;
    56			}
    57		}
    58	#endif
    59	}
    60	
    61	static inline void __init relocate_absolute(long random_offset)
    62	{
    63		void *begin, *end;
    64		struct rela_la_abs *p;
    65	
    66		begin = RELOCATED_KASLR(&__la_abs_begin);
    67		end   = RELOCATED_KASLR(&__la_abs_end);
    68	
    69		for (p = begin; (void *)p < end; p++) {
    70			long v = p->symvalue;
    71			uint32_t lu12iw, ori;
    72	#ifdef CONFIG_64BIT
    73			uint32_t lu32id, lu52id;
    74	#endif
    75			union loongarch_instruction *insn = (void *)p->pc;
    76	
    77			lu12iw = (v >> 12) & 0xfffff;
    78			ori    = v & 0xfff;
    79	#ifdef CONFIG_64BIT
    80			lu32id = (v >> 32) & 0xfffff;
    81			lu52id = v >> 52;
    82	#endif
    83	
    84			insn[0].reg1i20_format.immediate = lu12iw;
    85			insn[1].reg2i12_format.immediate = ori;
    86	#ifdef CONFIG_64BIT
    87			insn[2].reg1i20_format.immediate = lu32id;
    88			insn[3].reg2i12_format.immediate = lu52id;
    89	#endif
    90		}
    91	}
    92	
    93	#ifdef CONFIG_RANDOMIZE_BASE
    94	static inline __init unsigned long rotate_xor(unsigned long hash,
    95						      const void *area, size_t size)
    96	{
    97		size_t i, diff;
    98		const typeof(hash) *ptr = PTR_ALIGN(area, sizeof(hash));
    99	
   100		diff = (void *)ptr - area;
   101		if (size < diff + sizeof(hash))
   102			return hash;
   103	
   104		size = ALIGN_DOWN(size - diff, sizeof(hash));
   105	
   106		for (i = 0; i < size / sizeof(hash); i++) {
   107			/* Rotate by odd number of bits and XOR. */
   108			hash = (hash << ((sizeof(hash) * 8) - 7)) | (hash >> 7);
   109			hash ^= ptr[i];
   110		}
   111	
   112		return hash;
   113	}
   114	
   115	static inline __init unsigned long get_random_boot(void)
   116	{
   117		unsigned long hash = 0;
   118		unsigned long entropy = random_get_entropy();
   119	
   120		/* Attempt to create a simple but unpredictable starting entropy. */
   121		hash = rotate_xor(hash, linux_banner, strlen(linux_banner));
   122	
   123		/* Add in any runtime entropy we can get */
   124		hash = rotate_xor(hash, &entropy, sizeof(entropy));
   125	
   126		return hash;
   127	}
   128	
   129	static int __init nokaslr(char *p)
   130	{
   131		/* The real check is handled in kaslr_disabled() below. */
   132		return 0;
   133	}
   134	early_param("nokaslr", nokaslr);
   135	
   136	static inline __init bool kaslr_disabled(void)
   137	{
   138		char *str;
   139		const char *builtin_cmdline = CONFIG_CMDLINE;
   140		const char *const message = "KASLR is disabled by %s in %s cmdline.\n";
   141	
   142		str = strstr(builtin_cmdline, "nokaslr");
   143		if (str == builtin_cmdline || (str > builtin_cmdline && *(str - 1) == ' ')) {
 > 144			pr_info(message, "nokaslr", "built-in");
   145			return true;
   146		}
   147	
   148		str = strstr(boot_command_line, "nokaslr");
   149		if (str == boot_command_line || (str > boot_command_line && *(str - 1) == ' ')) {
   150			pr_info(message, "nokaslr", "boot");
   151			return true;
   152		}
   153	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
