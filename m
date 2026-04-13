Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8247D3A9DB0;
	Mon, 13 Apr 2026 08:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776069047; cv=none; b=Pyc9bhuPYt2x/Rn44Rb83i1N0fEI2wF8QWW6KnxelvnRzDHLdr9S1hYnMGhbFKWXVWRd1OhwAh/slUL9h/05CNrDF492rMvSFKFd7BQodipF9QSY+mvYFTaiO7A4IFlt9KQ2XKUHn6cgi/ImnQ5PVT/8ne/dwTm/JJB0Uwa6HhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776069047; c=relaxed/simple;
	bh=Bk6n3cDG7N/QZBuF+JciihGMJtuW6ENtBQFlDKbL1eI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nBFmMIiywIilpPx2YAPfO6uDTexI7yDiLjpovLaEtLyBLespvdpvNyyD9SgL7IVq/nA8/hXJtXoa8riDoylhFn+UxGLM+utl439EXFjQZkVo7bxVNCpMUH7D+zEf+BJuNlrB86ZtelmQXROJKXDyqBAscmzCclz0eaDs6a4kHQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PbsvF6N7; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PbsvF6N7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776069045; x=1807605045;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Bk6n3cDG7N/QZBuF+JciihGMJtuW6ENtBQFlDKbL1eI=;
  b=PbsvF6N7kpoEq7N94AG460XUWRSQmq34x3tDOrrJUw8Zt/Esq8SU4vjM
   HdvUsYo0PXoFW/OZHA1fu2ZAnJFJ1UouLvNqQ5PV1hBDbmWbPsYhtr4ti
   xi08vhXEgkRF117d2VlrH+aYihbqcSNxMXiac55/XbOYoW3uw22bE3jFY
   MUaqd1xig7ummv1p3wqtbfud0kcFwt7l210QBlryF5zd4GXadKNW/uQKB
   dBK5k3h4oU7SFd94c5mglX2t/ZwXefAfgMUcVwwdqkKcCOXmTsE+NbRb8
   ZCxoc0IRkoJxBniIyV2vzuW3m7G3qB2MVh+8RrKy85ZcxgXw+BgRomzzn
   g==;
X-CSE-ConnectionGUID: 4N/H4/9ESaurQIZRIggmUQ==
X-CSE-MsgGUID: vCRyBySnS1+jDItph56Q7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11757"; a="76959733"
X-IronPort-AV: E=Sophos;i="6.23,176,1770624000"; 
   d="scan'208";a="76959733"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2026 01:30:45 -0700
X-CSE-ConnectionGUID: 5dp/TgfGT/Cqe6X4QGrV7A==
X-CSE-MsgGUID: LFdLwAHyTdOECebqDNDCow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,176,1770624000"; 
   d="scan'208";a="226559285"
Received: from lkp-server01.sh.intel.com (HELO 7b0b59b3a0d4) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 13 Apr 2026 01:30:42 -0700
Received: from kbuild by 7b0b59b3a0d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wCCgm-000000000DO-1Afr;
	Mon, 13 Apr 2026 08:30:37 +0000
Date: Mon, 13 Apr 2026 16:29:23 +0800
From: kernel test robot <lkp@intel.com>
To: Yuqian Yang <yangyuqian@uniontech.com>,
	Huacai Chen <chenhuacai@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	WANG Xuerui <kernel@xen0n.name>,
	Cheng Nie <niecheng1@uniontech.com>,
	Wentao Guan <guanwentao@uniontech.com>,
	Dandan Zhang <zhangdandan@uniontech.com>, loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yuqian Yang <yangyuqian@uniontech.com>
Subject: Re: [PATCH] loongarch: improve logging of disabling KASLR.
Message-ID: <202604130224.WAbBNHnS-lkp@intel.com>
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
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20260413/202604130224.WAbBNHnS-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260413/202604130224.WAbBNHnS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604130224.WAbBNHnS-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/loongarch/kernel/relocate.c:144:11: error: expected ')'
     144 |                 pr_info(message, "nokaslr", "built-in");
         |                         ^
   arch/loongarch/kernel/relocate.c:144:3: note: to match this '('
     144 |                 pr_info(message, "nokaslr", "built-in");
         |                 ^
   include/linux/printk.h:584:2: note: expanded from macro 'pr_info'
     584 |         printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |         ^
   include/linux/printk.h:511:26: note: expanded from macro 'printk'
     511 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                          ^
   include/linux/printk.h:482:3: note: expanded from macro 'printk_index_wrap'
     482 |                 __printk_index_emit(_fmt, NULL, NULL);                  \
         |                 ^
   include/linux/printk.h:435:27: note: expanded from macro '__printk_index_emit'
     435 |                 if (__builtin_constant_p(_fmt) && __builtin_constant_p(_level)) { \
         |                                         ^
>> arch/loongarch/kernel/relocate.c:144:11: error: expected ')'
     144 |                 pr_info(message, "nokaslr", "built-in");
         |                         ^
   arch/loongarch/kernel/relocate.c:144:3: note: to match this '('
     144 |                 pr_info(message, "nokaslr", "built-in");
         |                 ^
   include/linux/printk.h:584:2: note: expanded from macro 'pr_info'
     584 |         printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |         ^
   include/linux/printk.h:511:26: note: expanded from macro 'printk'
     511 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                          ^
   include/linux/printk.h:482:3: note: expanded from macro 'printk_index_wrap'
     482 |                 __printk_index_emit(_fmt, NULL, NULL);                  \
         |                 ^
   include/linux/printk.h:444:32: note: expanded from macro '__printk_index_emit'
     444 |                                 .fmt = __builtin_constant_p(_fmt) ? (_fmt) : NULL, \
         |                                                            ^
>> arch/loongarch/kernel/relocate.c:144:11: error: expected ')'
     144 |                 pr_info(message, "nokaslr", "built-in");
         |                         ^
   arch/loongarch/kernel/relocate.c:144:3: note: to match this '('
     144 |                 pr_info(message, "nokaslr", "built-in");
         |                 ^
   include/linux/printk.h:584:2: note: expanded from macro 'pr_info'
     584 |         printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |         ^
   include/linux/printk.h:511:26: note: expanded from macro 'printk'
     511 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                          ^
   include/linux/printk.h:482:3: note: expanded from macro 'printk_index_wrap'
     482 |                 __printk_index_emit(_fmt, NULL, NULL);                  \
         |                 ^
   include/linux/printk.h:444:41: note: expanded from macro '__printk_index_emit'
     444 |                                 .fmt = __builtin_constant_p(_fmt) ? (_fmt) : NULL, \
         |                                                                     ^
>> arch/loongarch/kernel/relocate.c:144:11: error: expected ')'
     144 |                 pr_info(message, "nokaslr", "built-in");
         |                         ^
   arch/loongarch/kernel/relocate.c:144:3: note: to match this '('
     144 |                 pr_info(message, "nokaslr", "built-in");
         |                 ^
   include/linux/printk.h:584:2: note: expanded from macro 'pr_info'
     584 |         printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |         ^
   include/linux/printk.h:511:26: note: expanded from macro 'printk'
     511 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                          ^
   include/linux/printk.h:483:10: note: expanded from macro 'printk_index_wrap'
     483 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                        ^
   arch/loongarch/kernel/relocate.c:150:11: error: expected ')'
     150 |                 pr_info(message, "nokaslr", "boot");
         |                         ^
   arch/loongarch/kernel/relocate.c:150:3: note: to match this '('
     150 |                 pr_info(message, "nokaslr", "boot");
         |                 ^
   include/linux/printk.h:584:2: note: expanded from macro 'pr_info'
     584 |         printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |         ^
   include/linux/printk.h:511:26: note: expanded from macro 'printk'
     511 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                          ^
   include/linux/printk.h:482:3: note: expanded from macro 'printk_index_wrap'
     482 |                 __printk_index_emit(_fmt, NULL, NULL);                  \
         |                 ^
   include/linux/printk.h:435:27: note: expanded from macro '__printk_index_emit'
     435 |                 if (__builtin_constant_p(_fmt) && __builtin_constant_p(_level)) { \
         |                                         ^
   arch/loongarch/kernel/relocate.c:150:11: error: expected ')'
     150 |                 pr_info(message, "nokaslr", "boot");
         |                         ^
   arch/loongarch/kernel/relocate.c:150:3: note: to match this '('
     150 |                 pr_info(message, "nokaslr", "boot");
         |                 ^
   include/linux/printk.h:584:2: note: expanded from macro 'pr_info'
     584 |         printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |         ^
   include/linux/printk.h:511:26: note: expanded from macro 'printk'
     511 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                          ^
   include/linux/printk.h:482:3: note: expanded from macro 'printk_index_wrap'
     482 |                 __printk_index_emit(_fmt, NULL, NULL);                  \
         |                 ^
   include/linux/printk.h:444:32: note: expanded from macro '__printk_index_emit'
     444 |                                 .fmt = __builtin_constant_p(_fmt) ? (_fmt) : NULL, \
         |                                                            ^
   arch/loongarch/kernel/relocate.c:150:11: error: expected ')'
     150 |                 pr_info(message, "nokaslr", "boot");
         |                         ^
   arch/loongarch/kernel/relocate.c:150:3: note: to match this '('
     150 |                 pr_info(message, "nokaslr", "boot");
         |                 ^
   include/linux/printk.h:584:2: note: expanded from macro 'pr_info'
     584 |         printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |         ^
   include/linux/printk.h:511:26: note: expanded from macro 'printk'
     511 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                          ^
   include/linux/printk.h:482:3: note: expanded from macro 'printk_index_wrap'
     482 |                 __printk_index_emit(_fmt, NULL, NULL);                  \
         |                 ^
   include/linux/printk.h:444:41: note: expanded from macro '__printk_index_emit'
     444 |                                 .fmt = __builtin_constant_p(_fmt) ? (_fmt) : NULL, \
         |                                                                     ^
   arch/loongarch/kernel/relocate.c:150:11: error: expected ')'
     150 |                 pr_info(message, "nokaslr", "boot");
         |                         ^
   arch/loongarch/kernel/relocate.c:150:3: note: to match this '('
     150 |                 pr_info(message, "nokaslr", "boot");
         |                 ^
   include/linux/printk.h:584:2: note: expanded from macro 'pr_info'
     584 |         printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |         ^
   include/linux/printk.h:511:26: note: expanded from macro 'printk'
     511 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                          ^
   include/linux/printk.h:483:10: note: expanded from macro 'printk_index_wrap'
     483 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                        ^
   arch/loongarch/kernel/relocate.c:173:11: error: expected ')'
     173 |                 pr_info(message, "resume=", "built-in");
         |                         ^
   arch/loongarch/kernel/relocate.c:173:3: note: to match this '('
     173 |                 pr_info(message, "resume=", "built-in");
         |                 ^
   include/linux/printk.h:584:2: note: expanded from macro 'pr_info'
     584 |         printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |         ^
   include/linux/printk.h:511:26: note: expanded from macro 'printk'
     511 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                          ^
   include/linux/printk.h:482:3: note: expanded from macro 'printk_index_wrap'
     482 |                 __printk_index_emit(_fmt, NULL, NULL);                  \
         |                 ^
   include/linux/printk.h:435:27: note: expanded from macro '__printk_index_emit'
     435 |                 if (__builtin_constant_p(_fmt) && __builtin_constant_p(_level)) { \


vim +144 arch/loongarch/kernel/relocate.c

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
