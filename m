Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93D8328EB;
	Fri, 11 Oct 2024 04:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728621780; cv=none; b=GYjIzolxON8aB8iNqsdExlvrbcmsEsd/kjBJavH5jAfqpp1WekENiIP4ukRCHKegeu07yFaL4qgvitP+6bnpp+GplaEjNlDiD7/HQskCMEacGQXrR4esXZHKGEG3i7H+BsHNZRvQrCS+AZuvp5u0Cd+NavCZ2wf8oMOh4lPxyXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728621780; c=relaxed/simple;
	bh=xq2xYxCeEvzyDD2ePxSl33QtiL+L//1dLF/xG9ewvDY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lEYxwvCYENKF749T5gfDOEey/UPjDE62IHuI8Clrq35NEYV9RqjM5D4i0S0RmmrVzVXhwa7H7fjMFqP3A8J6ylv0ZQXbbnkykDTnSA/pnJhdEinl7wxAkHt0wq5gdgbc8c905jxiJisFU8TmRHB725c65qwWs4bovm0pTKJzCS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=atp8cQGB; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="atp8cQGB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728621779; x=1760157779;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xq2xYxCeEvzyDD2ePxSl33QtiL+L//1dLF/xG9ewvDY=;
  b=atp8cQGBnaXZD94EGyNjUFBhGdxLN9wU/slXctT6mftbVYSfAQkimm5L
   GgC8M6hmhJKE/txmuIHMBBWWkk9Jh/ckudzvF7EXkUT67OKtNXdDkCMDQ
   4GSIRGBbuFiS5rg3MyWJNqFPli/ko0fiyRx2xZRfwA/9pDPGioD3YhNE4
   2O8uiKao7jt+uJCN5SPzUemwT8136FbTSn+lDW9yTqiMLa4kiAA3UdXH8
   ZQ4NDXoq+kR0B8V22DuOJwYj3npmQT9HrjrjKa9gwlUMmdsSbuz7R2jM5
   pQ5SCGDOeFTaf3ItLBmxPpDydJyME+22BrCNtmC3+i5kkT8UHwM8FDXwo
   A==;
X-CSE-ConnectionGUID: +s20Rls7TOilnNCq+IYzwg==
X-CSE-MsgGUID: QZuKZKPzQCGTC+7FpSP1Dg==
X-IronPort-AV: E=McAfee;i="6700,10204,11221"; a="27959202"
X-IronPort-AV: E=Sophos;i="6.11,194,1725346800"; 
   d="scan'208";a="27959202"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2024 21:42:58 -0700
X-CSE-ConnectionGUID: pbRcFdqLRZmQX/JmBKPFNg==
X-CSE-MsgGUID: /8q1Oky7SJmnO1TALXDWhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,194,1725346800"; 
   d="scan'208";a="76712344"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 10 Oct 2024 21:42:56 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sz7UL-000Bod-0J;
	Fri, 11 Oct 2024 04:42:53 +0000
Date: Fri, 11 Oct 2024 12:42:35 +0800
From: kernel test robot <lkp@intel.com>
To: Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	David Hildenbrand <david@redhat.com>,
	Barry Song <baohua@kernel.org>, loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com
Subject: Re: [PATCH 2/4] mm/sparse-vmemmap: set pte_init when vmemmap is
 created
Message-ID: <202410111254.kon5pPzX-lkp@intel.com>
References: <20241010035048.3422527-3-maobibo@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241010035048.3422527-3-maobibo@loongson.cn>

Hi Bibo,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 87d6aab2389e5ce0197d8257d5f8ee965a67c4cd]

url:    https://github.com/intel-lab-lkp/linux/commits/Bibo-Mao/LoongArch-Set-pte-entry-with-PAGE_GLOBAL-for-kernel-space/20241010-115120
base:   87d6aab2389e5ce0197d8257d5f8ee965a67c4cd
patch link:    https://lore.kernel.org/r/20241010035048.3422527-3-maobibo%40loongson.cn
patch subject: [PATCH 2/4] mm/sparse-vmemmap: set pte_init when vmemmap is created
config: s390-allnoconfig (https://download.01.org/0day-ci/archive/20241011/202410111254.kon5pPzX-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 70e0a7e7e6a8541bcc46908c592eed561850e416)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241011/202410111254.kon5pPzX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410111254.kon5pPzX-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from mm/sparse-vmemmap.c:21:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from mm/sparse-vmemmap.c:23:
   In file included from include/linux/memblock.h:13:
   In file included from arch/s390/include/asm/dma.h:5:
   In file included from include/linux/io.h:14:
   In file included from arch/s390/include/asm/io.h:93:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     548 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     561 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:37:59: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
         |                                                           ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
     102 | #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
         |                                                      ^
   In file included from mm/sparse-vmemmap.c:23:
   In file included from include/linux/memblock.h:13:
   In file included from arch/s390/include/asm/dma.h:5:
   In file included from include/linux/io.h:14:
   In file included from arch/s390/include/asm/io.h:93:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                                                           ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
     115 | #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
         |                                                      ^
   In file included from mm/sparse-vmemmap.c:23:
   In file included from include/linux/memblock.h:13:
   In file included from arch/s390/include/asm/dma.h:5:
   In file included from include/linux/io.h:14:
   In file included from arch/s390/include/asm/io.h:93:
   include/asm-generic/io.h:585:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     585 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     595 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     605 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:693:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     693 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:701:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     701 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:709:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     709 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:718:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     718 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:727:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     727 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:736:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     736 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
>> mm/sparse-vmemmap.c:187:23: warning: no previous prototype for function 'kernel_pte_init' [-Wmissing-prototypes]
     187 | void __weak __meminit kernel_pte_init(void *addr)
         |                       ^
   mm/sparse-vmemmap.c:187:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     187 | void __weak __meminit kernel_pte_init(void *addr)
         | ^
         | static 
   14 warnings generated.


vim +/kernel_pte_init +187 mm/sparse-vmemmap.c

   186	
 > 187	void __weak __meminit kernel_pte_init(void *addr)
   188	{
   189	}
   190	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
