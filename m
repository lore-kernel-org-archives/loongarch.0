Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2818432B9B8;
	Thu, 20 Nov 2025 10:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763635079; cv=none; b=GslaZBnRm66aOxA60AEZMfGJ3dzysrrMxk9KO9NGQbUqBHOCIjNUpyb+p4B9v9HbY+roZQDVGnj46joUNVdpRsrddHEIrMdIiwA29DY5WTEzq5JlNqPfsKQ731JVI/6OwlSd7SI/s8TWW1HbEPXqQ78EGAplenet35PqEARqhR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763635079; c=relaxed/simple;
	bh=AlKHnfMCe0Kx2+6ZKR/hBQWuTE5pstZT7QpjoJG+8Oo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nIzy29qn3Zgh67MQ1qoOjqUEY3bGj+85PFI8Dmj1WKMdNB8t6QQ0IsEYJvplLTf6q8gI04dN93/WM/UDo8ctbVXdIuTrLsN/MulL4OFQELOyJ+jwFJBTaZSfEqOi6qKU+7vPnJb65+fPjzlCtVNXSkMkrLtmlS8qvekhBglUWG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EReMv6Nx; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EReMv6Nx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763635078; x=1795171078;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=AlKHnfMCe0Kx2+6ZKR/hBQWuTE5pstZT7QpjoJG+8Oo=;
  b=EReMv6Nx/tRfcvuGS71HBJGdFwNghLpMIP1tTWGnBk66kBxrq+wFiODI
   K3Pqnu8TSZKYaI35Um5IlacgsHPZoNb0mWadqXC9xUybgGNXWN+Z8qzTT
   BqtGGu2QC3Y7sGlXTXRGmZSedVkS34KsJBurVOtCFKjxMOv4tqMXpRsDP
   HpzNFSfnIcPWnsBsKORjrqF0ZPEjn64+am2QnejyovoCIeQrAA4s7I3LZ
   zD1lwwK4diRmEV0ycmEv3v9UUfVxi7kIo0vnZZa/HCpkospv7stC/6TSH
   g7+LA5SpVgjBadrbwEtsVtb8SDUvg1shZ+7yhxig+HFKEJvJf/KjL16+5
   g==;
X-CSE-ConnectionGUID: kdO2bJk6R1aDiMDRf+amjQ==
X-CSE-MsgGUID: T073l9L+SiC9iqLjOpgPsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="65401705"
X-IronPort-AV: E=Sophos;i="6.19,317,1754982000"; 
   d="scan'208";a="65401705"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2025 02:37:57 -0800
X-CSE-ConnectionGUID: X5dmoaLPT8m6OOrOofxYTg==
X-CSE-MsgGUID: lLEwymFWSsCD5rjgFeJBrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,317,1754982000"; 
   d="scan'208";a="191589579"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 20 Nov 2025 02:37:54 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vM22y-0003rb-1x;
	Thu, 20 Nov 2025 10:37:52 +0000
Date: Thu, 20 Nov 2025 18:37:12 +0800
From: kernel test robot <lkp@intel.com>
To: George Guo <dongtai.guo@linux.dev>, Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	loongarch@lists.linux.dev, linux-kernel@vger.kernel.org,
	George Guo <dongtai.guo@linux.dev>
Subject: Re: [PATCH 2/2] LoongArch: Enable 128-bit atomics cmpxchg support
Message-ID: <202511201828.xfphUVkJ-lkp@intel.com>
References: <20251120-2-v1-2-705bdc440550@linux.dev>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251120-2-v1-2-705bdc440550@linux.dev>

Hi George,

kernel test robot noticed the following build errors:

[auto build test ERROR on 8b690556d8fe074b4f9835075050fba3fb180e93]

url:    https://github.com/intel-lab-lkp/linux/commits/George-Guo/LoongArch-Add-128-bit-atomic-cmpxchg-support/20251120-160152
base:   8b690556d8fe074b4f9835075050fba3fb180e93
patch link:    https://lore.kernel.org/r/20251120-2-v1-2-705bdc440550%40linux.dev
patch subject: [PATCH 2/2] LoongArch: Enable 128-bit atomics cmpxchg support
config: loongarch-allnoconfig (https://download.01.org/0day-ci/archive/20251120/202511201828.xfphUVkJ-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9e9fe08b16ea2c4d9867fb4974edf2a3776d6ece)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251120/202511201828.xfphUVkJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511201828.xfphUVkJ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/slub.c:766:9: error: immediate must be a multiple of 4 in the range [-32768, 32764]
     766 |         return try_cmpxchg_freelist(&slab->freelist_counter.full, &old.full, new.full);
         |                ^
   mm/slab.h:22:32: note: expanded from macro 'try_cmpxchg_freelist'
      22 | # define try_cmpxchg_freelist           try_cmpxchg128
         |                                         ^
   include/linux/atomic/atomic-instrumented.h:4956:2: note: expanded from macro 'try_cmpxchg128'
    4956 |         raw_try_cmpxchg128(__ai_ptr, __ai_oldp, __VA_ARGS__); \
         |         ^
   include/linux/atomic/atomic-arch-fallback.h:326:9: note: expanded from macro 'raw_try_cmpxchg128'
     326 |         ___r = raw_cmpxchg128((_ptr), ___o, (_new)); \
         |                ^
   include/linux/atomic/atomic-arch-fallback.h:141:24: note: expanded from macro 'raw_cmpxchg128'
     141 | #define raw_cmpxchg128 arch_cmpxchg128
         |                        ^
   arch/loongarch/include/asm/cmpxchg.h:244:2: note: expanded from macro 'arch_cmpxchg128'
     244 |         __cmpxchg128_asm("ll.d", "sc.d", ptr, o, n);                    \
         |         ^
   arch/loongarch/include/asm/cmpxchg.h:137:3: note: expanded from macro '__cmpxchg128_asm'
     137 |         "     " st "  $t0, $t1, %2                           \n"        \
         |          ^
   <inline asm>:7:23: note: instantiated into assembly here
       7 |      sc.d  $t0, $t1, $a2, 0                           
         |                       ^
>> mm/slub.c:766:9: error: immediate must be a multiple of 4 in the range [-32768, 32764]
     766 |         return try_cmpxchg_freelist(&slab->freelist_counter.full, &old.full, new.full);
         |                ^
   mm/slab.h:22:32: note: expanded from macro 'try_cmpxchg_freelist'
      22 | # define try_cmpxchg_freelist           try_cmpxchg128
         |                                         ^
   include/linux/atomic/atomic-instrumented.h:4956:2: note: expanded from macro 'try_cmpxchg128'
    4956 |         raw_try_cmpxchg128(__ai_ptr, __ai_oldp, __VA_ARGS__); \
         |         ^
   include/linux/atomic/atomic-arch-fallback.h:326:9: note: expanded from macro 'raw_try_cmpxchg128'
     326 |         ___r = raw_cmpxchg128((_ptr), ___o, (_new)); \
         |                ^
   include/linux/atomic/atomic-arch-fallback.h:141:24: note: expanded from macro 'raw_cmpxchg128'
     141 | #define raw_cmpxchg128 arch_cmpxchg128
         |                        ^
   arch/loongarch/include/asm/cmpxchg.h:244:2: note: expanded from macro 'arch_cmpxchg128'
     244 |         __cmpxchg128_asm("ll.d", "sc.d", ptr, o, n);                    \
         |         ^
   arch/loongarch/include/asm/cmpxchg.h:137:3: note: expanded from macro '__cmpxchg128_asm'
     137 |         "     " st "  $t0, $t1, %2                           \n"        \
         |          ^
   <inline asm>:7:23: note: instantiated into assembly here
       7 |      sc.d  $t0, $t1, $a3, 0                           
         |                       ^
>> mm/slub.c:766:9: error: immediate must be a multiple of 4 in the range [-32768, 32764]
     766 |         return try_cmpxchg_freelist(&slab->freelist_counter.full, &old.full, new.full);
         |                ^
   mm/slab.h:22:32: note: expanded from macro 'try_cmpxchg_freelist'
      22 | # define try_cmpxchg_freelist           try_cmpxchg128
         |                                         ^
   include/linux/atomic/atomic-instrumented.h:4956:2: note: expanded from macro 'try_cmpxchg128'
    4956 |         raw_try_cmpxchg128(__ai_ptr, __ai_oldp, __VA_ARGS__); \
         |         ^
   include/linux/atomic/atomic-arch-fallback.h:326:9: note: expanded from macro 'raw_try_cmpxchg128'
     326 |         ___r = raw_cmpxchg128((_ptr), ___o, (_new)); \
         |                ^
   include/linux/atomic/atomic-arch-fallback.h:141:24: note: expanded from macro 'raw_cmpxchg128'
     141 | #define raw_cmpxchg128 arch_cmpxchg128
         |                        ^
   arch/loongarch/include/asm/cmpxchg.h:244:2: note: expanded from macro 'arch_cmpxchg128'
     244 |         __cmpxchg128_asm("ll.d", "sc.d", ptr, o, n);                    \
         |         ^
   arch/loongarch/include/asm/cmpxchg.h:137:3: note: expanded from macro '__cmpxchg128_asm'
     137 |         "     " st "  $t0, $t1, %2                           \n"        \
         |          ^
   <inline asm>:7:23: note: instantiated into assembly here
       7 |      sc.d  $t0, $t1, $a5, 0                           
         |                       ^
>> mm/slub.c:766:9: error: immediate must be a multiple of 4 in the range [-32768, 32764]
     766 |         return try_cmpxchg_freelist(&slab->freelist_counter.full, &old.full, new.full);
         |                ^
   mm/slab.h:22:32: note: expanded from macro 'try_cmpxchg_freelist'
      22 | # define try_cmpxchg_freelist           try_cmpxchg128
         |                                         ^
   include/linux/atomic/atomic-instrumented.h:4956:2: note: expanded from macro 'try_cmpxchg128'
    4956 |         raw_try_cmpxchg128(__ai_ptr, __ai_oldp, __VA_ARGS__); \
         |         ^
   include/linux/atomic/atomic-arch-fallback.h:326:9: note: expanded from macro 'raw_try_cmpxchg128'
     326 |         ___r = raw_cmpxchg128((_ptr), ___o, (_new)); \
         |                ^
   include/linux/atomic/atomic-arch-fallback.h:141:24: note: expanded from macro 'raw_cmpxchg128'
     141 | #define raw_cmpxchg128 arch_cmpxchg128
         |                        ^
   arch/loongarch/include/asm/cmpxchg.h:244:2: note: expanded from macro 'arch_cmpxchg128'
     244 |         __cmpxchg128_asm("ll.d", "sc.d", ptr, o, n);                    \
         |         ^
   arch/loongarch/include/asm/cmpxchg.h:137:3: note: expanded from macro '__cmpxchg128_asm'
     137 |         "     " st "  $t0, $t1, %2                           \n"        \
         |          ^
   <inline asm>:7:23: note: instantiated into assembly here
       7 |      sc.d  $t0, $t1, $t3, 0                           
         |                       ^
   4 errors generated.


vim +766 mm/slub.c

881db7fb03a77a Christoph Lameter 2011-06-01  756  
6801be4f2653e5 Peter Zijlstra    2023-05-31  757  static inline bool
6801be4f2653e5 Peter Zijlstra    2023-05-31  758  __update_freelist_fast(struct slab *slab,
6801be4f2653e5 Peter Zijlstra    2023-05-31  759  		      void *freelist_old, unsigned long counters_old,
6801be4f2653e5 Peter Zijlstra    2023-05-31  760  		      void *freelist_new, unsigned long counters_new)
6801be4f2653e5 Peter Zijlstra    2023-05-31  761  {
6801be4f2653e5 Peter Zijlstra    2023-05-31  762  #ifdef system_has_freelist_aba
6801be4f2653e5 Peter Zijlstra    2023-05-31  763  	freelist_aba_t old = { .freelist = freelist_old, .counter = counters_old };
6801be4f2653e5 Peter Zijlstra    2023-05-31  764  	freelist_aba_t new = { .freelist = freelist_new, .counter = counters_new };
6801be4f2653e5 Peter Zijlstra    2023-05-31  765  
6801be4f2653e5 Peter Zijlstra    2023-05-31 @766  	return try_cmpxchg_freelist(&slab->freelist_counter.full, &old.full, new.full);
6801be4f2653e5 Peter Zijlstra    2023-05-31  767  #else
6801be4f2653e5 Peter Zijlstra    2023-05-31  768  	return false;
6801be4f2653e5 Peter Zijlstra    2023-05-31  769  #endif
6801be4f2653e5 Peter Zijlstra    2023-05-31  770  }
6801be4f2653e5 Peter Zijlstra    2023-05-31  771  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
