Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C65083CD5;
	Tue, 24 Sep 2024 21:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727213808; cv=none; b=u4CUaCPaHFAO6D18uq07Ae54LJVmC5An8jBUf4CubheWJN6N4Du7koxuHbnjtZci7YI1ES+g9Yem6/OjJm9723S/0c4NSwvDkTvXEpruv7dTZi6qBJrHuvu5DAy7mpGUmBJ/4PUAdQgAjTsCOGyUM8om2bsNaNAyvPEBB5kwMzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727213808; c=relaxed/simple;
	bh=Z65PsAKwI1GgVgDDn6er4XvhvS+mdH1KyI7xlqoSGII=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u7XX0RvWtaJ1IZLwJ4cEbLJ/9Fr+qUl0f93UaRb6RAZkFoGlEwvDzoTiVvrTfv156SoyeHMY72WlDot128lrZ+fsqPhHbD4a+BHxhAMPu0rskLc/pIpVijZ4nI0JEn9+WHLsP2CNNRhhSHm/qLzV5ozizzQxMIIIi+dL+Vicf4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OpToGHe/; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OpToGHe/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727213807; x=1758749807;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Z65PsAKwI1GgVgDDn6er4XvhvS+mdH1KyI7xlqoSGII=;
  b=OpToGHe/KAvXfU8H35EnGGe0K6Pqn+k09V2NGYEOvaYUZSiU98HC5tIi
   cnWb/v2Rp/JSs45unp2O67b0f0bk0TA2r8FnOpYfaMZZD9HqXDfNi+5/w
   fdTZMuNKG+9qx5gADcIZgDf08aoFwLjuoNy4vb2MhHlatJQyQ5wSSQ2g2
   OGxURrz16ln/ALvOiv+kaxkkUY0EI1hFE0F9LIyfR/hYxfwAC331z+6ws
   p9Cj792NblWnUNzqdvIIHBycXn81T2kOghoEfuJtShq0BxCz6BgbD2BQ3
   8/DA7Bp/2dtBgVN8yzZXnpDZ9fVLLRA4oa8SqoncakBD1i+NmIsrsR1uL
   Q==;
X-CSE-ConnectionGUID: sbjg15roQp2gyT0Sj3Yh4g==
X-CSE-MsgGUID: RyvjcT8rQwmUsbfQ/ydZaA==
X-IronPort-AV: E=McAfee;i="6700,10204,11205"; a="26330484"
X-IronPort-AV: E=Sophos;i="6.10,255,1719903600"; 
   d="scan'208";a="26330484"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2024 14:36:45 -0700
X-CSE-ConnectionGUID: Vamjv89xSvqqWhS7/4X3TA==
X-CSE-MsgGUID: 6y+Hcj66SNeL6isxIORLQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,255,1719903600"; 
   d="scan'208";a="94889792"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 24 Sep 2024 14:36:41 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1stDD4-000IrZ-28;
	Tue, 24 Sep 2024 21:36:38 +0000
Date: Wed, 25 Sep 2024 05:36:34 +0800
From: kernel test robot <lkp@intel.com>
To: Julian Vetter <jvetter@kalrayinc.com>, Arnd Bergmann <arnd@arndb.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-csky@vger.kernel.org, loongarch@lists.linux.dev,
	Yann Sionneau <ysionneau@kalrayinc.com>,
	Julian Vetter <jvetter@kalrayinc.com>
Subject: Re: [PATCH v5 1/5] Consolidate __memcpy_{to,from}io and __memset_io
 into iomap_copy.c
Message-ID: <202409250555.Ey0vV3Df-lkp@intel.com>
References: <20240924121432.798655-2-jvetter@kalrayinc.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240924121432.798655-2-jvetter@kalrayinc.com>

Hi Julian,

kernel test robot noticed the following build errors:

[auto build test ERROR on arnd-asm-generic/master]
[also build test ERROR on soc/for-next akpm-mm/mm-nonmm-unstable arm64/for-next/core linus/master v6.11 next-20240924]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Julian-Vetter/Consolidate-__memcpy_-to-from-io-and-__memset_io-into-iomap_copy-c/20240924-202154
base:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/asm-generic.git master
patch link:    https://lore.kernel.org/r/20240924121432.798655-2-jvetter%40kalrayinc.com
patch subject: [PATCH v5 1/5] Consolidate __memcpy_{to,from}io and __memset_io into iomap_copy.c
config: arm-am200epdkit_defconfig (https://download.01.org/0day-ci/archive/20240925/202409250555.Ey0vV3Df-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240925/202409250555.Ey0vV3Df-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409250555.Ey0vV3Df-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   lib/iomap_copy.c: In function '__memcpy_fromio':
>> lib/iomap_copy.c:89:26: error: implicit declaration of function 'IS_ALIGNED' [-Wimplicit-function-declaration]
      89 |         while (count && !IS_ALIGNED((unsigned long)from, NATIVE_STORE_SIZE)) {
         |                          ^~~~~~~~~~
   lib/iomap_copy.c: In function '__memset_io':
>> lib/iomap_copy.c:159:26: warning: left shift count >= width of type [-Wshift-count-overflow]
     159 |                 qc |= qc << 32;
         |                          ^~


vim +/IS_ALIGNED +89 lib/iomap_copy.c

    84	
    85	
    86	#ifndef __memcpy_fromio
    87	void __memcpy_fromio(void *to, const volatile void __iomem *from, size_t count)
    88	{
  > 89		while (count && !IS_ALIGNED((unsigned long)from, NATIVE_STORE_SIZE)) {
    90			*(u8 *)to = __raw_readb(from);
    91			from++;
    92			to++;
    93			count--;
    94		}
    95	
    96		while (count >= NATIVE_STORE_SIZE) {
    97	#ifdef CONFIG_64BIT
    98				put_unaligned(__raw_readq(from), (uintptr_t *)to);
    99	#else
   100				put_unaligned(__raw_readl(from), (uintptr_t *)to);
   101	#endif
   102	
   103			from += NATIVE_STORE_SIZE;
   104			to += NATIVE_STORE_SIZE;
   105			count -= NATIVE_STORE_SIZE;
   106		}
   107	
   108		while (count) {
   109			*(u8 *)to = __raw_readb(from);
   110			from++;
   111			to++;
   112			count--;
   113		}
   114	}
   115	EXPORT_SYMBOL(__memcpy_fromio);
   116	#endif
   117	
   118	#ifndef __memcpy_toio
   119	void __memcpy_toio(volatile void __iomem *to, const void *from, size_t count)
   120	{
   121		while (count && !IS_ALIGNED((unsigned long)to, NATIVE_STORE_SIZE)) {
   122			__raw_writeb(*(u8 *)from, to);
   123			from++;
   124			to++;
   125			count--;
   126		}
   127	
   128		while (count >= NATIVE_STORE_SIZE) {
   129	#ifdef CONFIG_64BIT
   130				__raw_writeq(get_unaligned((uintptr_t *)from), to);
   131	#else
   132				__raw_writel(get_unaligned((uintptr_t *)from), to);
   133	#endif
   134	
   135			from += NATIVE_STORE_SIZE;
   136			to += NATIVE_STORE_SIZE;
   137			count -= NATIVE_STORE_SIZE;
   138		}
   139	
   140		while (count) {
   141			__raw_writeb(*(u8 *)from, to);
   142			from++;
   143			to++;
   144			count--;
   145		}
   146	}
   147	EXPORT_SYMBOL(__memcpy_toio);
   148	#endif
   149	
   150	#ifndef __memset_io
   151	void __memset_io(volatile void __iomem *dst, int c, size_t count)
   152	{
   153		uintptr_t qc = (u8)c;
   154	
   155		qc |= qc << 8;
   156		qc |= qc << 16;
   157	
   158		if (IS_ENABLED(CONFIG_64BIT))
 > 159			qc |= qc << 32;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
