Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41EDB2D1F7E;
	Sat, 20 Dec 2025 15:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766242816; cv=none; b=LGr1KKnBUqrXi+OoAcZ5Yw30WEDAB1uXLcLNiJakmdRbRBGke/mIBQFOFizZS7608Skzk+cR8fgo/JE3lWRmEDPcppL//GW7JPGebqU+ap/xG3Cz8CP0tdAZVvZ0gckcj2k57lrkWy1+7CLy4GrnDES2Lzf6/3NyFgLTGXSWD20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766242816; c=relaxed/simple;
	bh=rGGeCKDnFHL0GTnnxjGkPdlPCh8x4R1AJTq8uQ540Vs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rz6q9AK4eRNOPBcD7OsRxzLk9Q2p/I2JproCvi2MTWj4USbOKllnMF6pkXY87sQQ77un4OBxXt3Vs7UNEZ+RG4zZXx0hUktrBlrBoP0M0CmSUFgwF3zU7Wdh7xQIQbFa7hKpQYT2cWer+03dPyxhCxbPwweHmg/FQ5BReEYse6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QF0k9o1b; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QF0k9o1b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766242816; x=1797778816;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rGGeCKDnFHL0GTnnxjGkPdlPCh8x4R1AJTq8uQ540Vs=;
  b=QF0k9o1b/2B/gp/iT1195Mjmz6pUKfspYKz8A3KSIIm+B6cEWHiyGzXQ
   kTlloscDIUOmduFQ/xDMeb7yZX6c479b1dmKm+L4LsFSw85vdDX01W7CI
   7BC42dpFGxvwMQs8x5t2ALxfP97FQT9YdRibKYHD0XGXmwY/hZVa0F130
   uv9CmEao6i+yhTSn/cop2o5Zaph8CJtMWN4n7KULANFxFNAAmwlQScT4X
   NNFDpX9skP9PU/OzKz5vOH9t0wh2YrVat7vvJU7dHbvjl2bx8fsOHWJIA
   MuefHsAhjJvj1Zwnbh01aDAdoBjL8IxjkbWuoJnB9o24e8ldy36is8iw3
   w==;
X-CSE-ConnectionGUID: nEdNYBfXSPS9egVlPFiR5Q==
X-CSE-MsgGUID: Qhj2BEdpSAOSPQ013WlfQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11648"; a="72034850"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="72034850"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2025 07:00:15 -0800
X-CSE-ConnectionGUID: ysKCsu1NS7yg8Gtmsb+gbA==
X-CSE-MsgGUID: mUb9l548SkiLudHURCvl3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="198359998"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 20 Dec 2025 07:00:12 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWyRF-000000004hf-0nvW;
	Sat, 20 Dec 2025 15:00:09 +0000
Date: Sat, 20 Dec 2025 22:59:31 +0800
From: kernel test robot <lkp@intel.com>
To: yuan linyu <yuanlinyu@honor.com>,
	Alexander Potapenko <glider@google.com>,
	Marco Elver <elver@google.com>, Dmitry Vyukov <dvyukov@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>, kasan-dev@googlegroups.com,
	loongarch@lists.linux.dev
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	linux-kernel@vger.kernel.org, yuan linyu <yuanlinyu@honor.com>
Subject: Re: [PATCH v2 2/2] kfence: allow change number of object by early
 parameter
Message-ID: <202512202213.aA8qY41g-lkp@intel.com>
References: <20251218063916.1433615-3-yuanlinyu@honor.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251218063916.1433615-3-yuanlinyu@honor.com>

Hi yuan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]
[also build test WARNING on drm-misc/drm-misc-next linus/master v6.19-rc1 next-20251219]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/yuan-linyu/LoongArch-kfence-avoid-use-CONFIG_KFENCE_NUM_OBJECTS/20251218-144322
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20251218063916.1433615-3-yuanlinyu%40honor.com
patch subject: [PATCH v2 2/2] kfence: allow change number of object by early parameter
config: i386-buildonly-randconfig-001-20251219 (https://download.01.org/0day-ci/archive/20251220/202512202213.aA8qY41g-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251220/202512202213.aA8qY41g-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512202213.aA8qY41g-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/kfence/core.c:997:16: warning: variable 'nr_pages_covered' set but not used [-Wunused-but-set-variable]
     997 |         unsigned long nr_pages_covered, covered_size;
         |                       ^
   1 warning generated.


vim +/nr_pages_covered +997 mm/kfence/core.c

   991	
   992	static int kfence_init_late(void)
   993	{
   994		unsigned long nr_pages_meta = KFENCE_METADATA_SIZE / PAGE_SIZE;
   995		unsigned long addr = (unsigned long)__kfence_pool;
   996		unsigned long free_size = __kfence_pool_size;
 > 997		unsigned long nr_pages_covered, covered_size;
   998		int err = -ENOMEM;
   999	
  1000		kfence_alloc_covered_order = ilog2(__kfence_num_objects) + 2;
  1001		kfence_alloc_covered_mask = (1 << kfence_alloc_covered_order) - 1;
  1002		covered_size =  PAGE_ALIGN(KFENCE_COVERED_SIZE);
  1003		nr_pages_covered = (covered_size / PAGE_SIZE);
  1004	#ifdef CONFIG_CONTIG_ALLOC
  1005		struct page *pages;
  1006	
  1007		pages = alloc_contig_pages(__kfence_pool_pages, GFP_KERNEL, first_online_node,
  1008					   NULL);
  1009		if (!pages)
  1010			return -ENOMEM;
  1011	
  1012		__kfence_pool = page_to_virt(pages);
  1013		pages = alloc_contig_pages(nr_pages_covered, GFP_KERNEL, first_online_node,
  1014					   NULL);
  1015		if (!pages)
  1016			goto free_pool;
  1017		alloc_covered = page_to_virt(pages);
  1018		pages = alloc_contig_pages(nr_pages_meta, GFP_KERNEL, first_online_node,
  1019					   NULL);
  1020		if (pages)
  1021			kfence_metadata_init = page_to_virt(pages);
  1022	#else
  1023		if (__kfence_pool_pages > MAX_ORDER_NR_PAGES ||
  1024		    nr_pages_meta > MAX_ORDER_NR_PAGES) {
  1025			pr_warn("KFENCE_NUM_OBJECTS too large for buddy allocator\n");
  1026			return -EINVAL;
  1027		}
  1028	
  1029		__kfence_pool = alloc_pages_exact(__kfence_pool_size, GFP_KERNEL);
  1030		if (!__kfence_pool)
  1031			return -ENOMEM;
  1032	
  1033		alloc_covered = alloc_pages_exact(covered_size, GFP_KERNEL);
  1034		if (!alloc_covered)
  1035			goto free_pool;
  1036		kfence_metadata_init = alloc_pages_exact(KFENCE_METADATA_SIZE, GFP_KERNEL);
  1037	#endif
  1038	
  1039		if (!kfence_metadata_init)
  1040			goto free_cover;
  1041	
  1042		memzero_explicit(kfence_metadata_init, KFENCE_METADATA_SIZE);
  1043		addr = kfence_init_pool();
  1044		if (!addr) {
  1045			kfence_init_enable();
  1046			kfence_debugfs_init();
  1047			return 0;
  1048		}
  1049	
  1050		pr_err("%s failed\n", __func__);
  1051		free_size = __kfence_pool_size - (addr - (unsigned long)__kfence_pool);
  1052		err = -EBUSY;
  1053	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
