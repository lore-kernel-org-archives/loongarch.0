Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96328263F4A;
	Sun, 12 Apr 2026 04:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775969010; cv=none; b=IYHic1V3lmG2GjeKXq1tZLxlnjWbNsujZpv9CJO1eq3I4+TwDKqerwaR0m0S3Nnd4lFA+EVJ0lu9aGVUANO2HXGkQOXCLf1RzfklRw7z0QqW7+XvERi72IbauVu1UQd4JqPYYJg8YeA3vArfynbw0CKJTaTIL+T1gDwUFafUVcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775969010; c=relaxed/simple;
	bh=t2e6GoeBZxAdwRTYjOc+qKQ5MV3GG9O7pTKbTqQPnlc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XkiWhC8cClXwWgS3Urs/yJvcNJlvYFj9PJMY6ZipyHvWQuOiMh8pUgUb+QWAf/FrmiOH2q/7toYTy1tQr+YujaqkK0y87RwHLBZNaKLJkntbR7o64GkS8fFhocBlC4zhPT/A8jR8zJmyVzyhBnJM2eiebtMR29TpOFAvT09esEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BpA2EEh7; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BpA2EEh7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775969009; x=1807505009;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=t2e6GoeBZxAdwRTYjOc+qKQ5MV3GG9O7pTKbTqQPnlc=;
  b=BpA2EEh7uFmYCv277us6v50IqjdHKx39Smf0uRYAj8t9do8jZCG0hP/v
   iGS6nLYag7Hf/B7GEM8Vj+/F9HdVsMfyD0Air9iRQW9xqhx5+0HgYZCXX
   lg88I5/vciWXSh+8998AG59KxI5TdhA9joc5yHNY1/A6c0XNoJCugf4H4
   JP5ZdsyylLHiSZ2r0hovhRtVhjcbuEx65Vw0bfh9WxR9wzfcVkJ230J1U
   Y22DEZVfdVb+zsFjj5thiZBpKBEMs+Nx1QRN44mnk0yRQjlQ8AYQSxHb3
   x7RFxY7DFaKsHxJw4KXurpxbnHjxx3QBYTfbdmwRQjzPgsr3W3hOGyZX5
   g==;
X-CSE-ConnectionGUID: tke1Xmh/SZOLCVo5qoJ6SQ==
X-CSE-MsgGUID: Z8lso2NSTz21gWK+GV+mPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="77010637"
X-IronPort-AV: E=Sophos;i="6.23,174,1770624000"; 
   d="scan'208";a="77010637"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2026 21:43:28 -0700
X-CSE-ConnectionGUID: AhHCkktOQKuM4yW0Y3P6lw==
X-CSE-MsgGUID: s5cpn+QbQUmRo0Fi0vGZ6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,174,1770624000"; 
   d="scan'208";a="229726387"
Received: from lkp-server01.sh.intel.com (HELO 3eaaf1a74b89) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 11 Apr 2026 21:43:25 -0700
Received: from kbuild by 3eaaf1a74b89 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wBmfL-000000001s5-0G8g;
	Sun, 12 Apr 2026 04:43:23 +0000
Date: Sun, 12 Apr 2026 12:42:39 +0800
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
Message-ID: <202604121225.WqIkc3ZK-lkp@intel.com>
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

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v7.0-rc7 next-20260410]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yuqian-Yang/loongarch-improve-logging-of-disabling-KASLR/20260412-053808
base:   linus/master
patch link:    https://lore.kernel.org/r/E4B91143DC525DC6%2B20260403063008.94237-1-yangyuqian%40uniontech.com
patch subject: [PATCH] loongarch: improve logging of disabling KASLR.
config: loongarch-randconfig-002-20260412 (https://download.01.org/0day-ci/archive/20260412/202604121225.WqIkc3ZK-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260412/202604121225.WqIkc3ZK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604121225.WqIkc3ZK-lkp@intel.com/

All warnings (new ones prefixed by >>):

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
   arch/loongarch/kernel/relocate.c:144:25: error: expected ')' before 'message'
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
>> arch/loongarch/kernel/relocate.c:140:27: warning: unused variable 'message' [-Wunused-variable]
     140 |         const char *const message = "KASLR is disabled by %s in %s cmdline.\n";
         |                           ^~~~~~~


vim +/message +140 arch/loongarch/kernel/relocate.c

   135	
   136	static inline __init bool kaslr_disabled(void)
   137	{
   138		char *str;
   139		const char *builtin_cmdline = CONFIG_CMDLINE;
 > 140		const char *const message = "KASLR is disabled by %s in %s cmdline.\n";
   141	
   142		str = strstr(builtin_cmdline, "nokaslr");
   143		if (str == builtin_cmdline || (str > builtin_cmdline && *(str - 1) == ' ')) {
   144			pr_info(message, "nokaslr", "built-in");
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
