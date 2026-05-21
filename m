Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15F7739DBC2;
	Thu, 21 May 2026 11:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779361662; cv=none; b=WgbvVi0MieDgjlNmUf6kpUcjlliZ2V6hetZTJzPLRgPa/odocwfiNp2bGt7PBuvRvxfAYE8ItN6D0GWLZpJVvnmDIAsWU6d5xJmCX93z0TT5+eJwv43MGrrmYWnulOU8SG15PP5sVuUNQIeJgfoEdiVwklu4ZwQSaf8lW1k457o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779361662; c=relaxed/simple;
	bh=kDRm16nwRIkaYjsNe49GrSPXrMFfA/EVhmvIrllEkgY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V4rRtnj/kqQtcDP1FG187E/xduQhUXmPFwVmIsq2dQaJQyOZT6SvAJv6EHKAUeyfbjrylqAzHgM27jeHpTa1ESxIHdAysQjh+ZHfe/3dzFGB8kwRDV1Ua40hM/LbxpZlA/csjUkbROmvWhXUqNR29E5fRB2MeT6xOCHIwz/niEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=goKgBxRc; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="goKgBxRc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779361661; x=1810897661;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kDRm16nwRIkaYjsNe49GrSPXrMFfA/EVhmvIrllEkgY=;
  b=goKgBxRcSubNQgHqj1TbOnaN7mrYnu18DQBeF115XSwDrddIoD0PRK5g
   A2m8moUPvYXSI4ObXN4oSvOeftlVlloz0F7nvwCh+kjcrd9P92VNcuklm
   SZi9O08343USPYo2c8wKtOQ5g3RzVQ+KEPNdTUHnhwI0cMh1Oee7NY7h0
   lFWFlBkVKN/EHibDzgnLOFCENrBgJGWkmLxdt5n9Fzosanu8Qz+HXd7Pw
   gHOWQ/AZKqNNlgiLaPQSoGOmL9HtReQr0cT0vTlNmm55DRlQWuC0j4sTY
   kWGX7OyuUJa9CfsdusnnAyat4GZM5oeCblDdfLrg4BreMmmCrUAq49svp
   A==;
X-CSE-ConnectionGUID: 0rFrK08YRjaIMgYEmpL1iQ==
X-CSE-MsgGUID: ZZch8VKnStWy31hpUobpnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="80332373"
X-IronPort-AV: E=Sophos;i="6.23,246,1770624000"; 
   d="scan'208";a="80332373"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2026 04:07:37 -0700
X-CSE-ConnectionGUID: XrLePS9uRVKYbpu2v+BWGQ==
X-CSE-MsgGUID: 4L2zKOdVQFi1Y8ngIii1pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,246,1770624000"; 
   d="scan'208";a="239488455"
Received: from lkp-server01.sh.intel.com (HELO fdb68b0ce653) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 21 May 2026 04:07:34 -0700
Received: from kbuild by fdb68b0ce653 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wQ1FT-000000000Ar-3J4q;
	Thu, 21 May 2026 11:07:31 +0000
Date: Thu, 21 May 2026 19:06:59 +0800
From: kernel test robot <lkp@intel.com>
To: George Guo <dongtai.guo@linux.dev>, Huacai Chen <chenhuacai@kernel.org>,
	loongarch@lists.linux.dev
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	WANG Xuerui <kernel@xen0n.name>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-kernel@vger.kernel.org,
	George Guo <guodongtai@kylinos.cn>, Kexin Liu <liukexin@kylinos.cn>
Subject: Re: [PATCH 1/1] LoongArch: Add missing linux/mm.h include in asm/io.h
Message-ID: <202605211925.DbDvQ6ii-lkp@intel.com>
References: <20260521063310.52926-1-dongtai.guo@linux.dev>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260521063310.52926-1-dongtai.guo@linux.dev>

Hi George,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v7.1-rc4 next-20260520]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/George-Guo/LoongArch-Add-missing-linux-mm-h-include-in-asm-io-h/20260521-143448
base:   linus/master
patch link:    https://lore.kernel.org/r/20260521063310.52926-1-dongtai.guo%40linux.dev
patch subject: [PATCH 1/1] LoongArch: Add missing linux/mm.h include in asm/io.h
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20260521/202605211925.DbDvQ6ii-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260521/202605211925.DbDvQ6ii-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605211925.DbDvQ6ii-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/rq-offsets.c:5:
   In file included from kernel/sched/sched.h:28:
   In file included from include/linux/cgroup_api.h:1:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:45:
   In file included from include/linux/slab.h:264:
   In file included from include/linux/kasan.h:21:
   In file included from arch/loongarch/include/asm/kasan.h:10:
   In file included from arch/loongarch/include/asm/io.h:16:
>> include/linux/mm.h:882:2: error: call to undeclared function 'kfree'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     882 |         kfree(vma->numab_state);
         |         ^
   In file included from kernel/sched/rq-offsets.c:5:
   In file included from kernel/sched/sched.h:28:
   In file included from include/linux/cgroup_api.h:1:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:45:
>> include/linux/slab.h:513:6: error: conflicting types for 'kfree'
     513 | void kfree(const void *objp);
         |      ^
   include/linux/mm.h:882:2: note: previous implicit declaration is here
     882 |         kfree(vma->numab_state);
         |         ^
   2 errors generated.
   make[3]: *** [scripts/Makefile.build:184: kernel/sched/rq-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1375: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +/kfree +882 include/linux/mm.h

^1da177e4c3f4152 Linus Torvalds 2005-04-16  874  
ef6a22b70f6d9044 Mel Gorman     2023-03-01  875  #ifdef CONFIG_NUMA_BALANCING
ef6a22b70f6d9044 Mel Gorman     2023-03-01  876  static inline void vma_numab_state_init(struct vm_area_struct *vma)
ef6a22b70f6d9044 Mel Gorman     2023-03-01  877  {
ef6a22b70f6d9044 Mel Gorman     2023-03-01  878  	vma->numab_state = NULL;
ef6a22b70f6d9044 Mel Gorman     2023-03-01  879  }
ef6a22b70f6d9044 Mel Gorman     2023-03-01  880  static inline void vma_numab_state_free(struct vm_area_struct *vma)
ef6a22b70f6d9044 Mel Gorman     2023-03-01  881  {
ef6a22b70f6d9044 Mel Gorman     2023-03-01 @882  	kfree(vma->numab_state);
ef6a22b70f6d9044 Mel Gorman     2023-03-01  883  }
ef6a22b70f6d9044 Mel Gorman     2023-03-01  884  #else
ef6a22b70f6d9044 Mel Gorman     2023-03-01  885  static inline void vma_numab_state_init(struct vm_area_struct *vma) {}
ef6a22b70f6d9044 Mel Gorman     2023-03-01  886  static inline void vma_numab_state_free(struct vm_area_struct *vma) {}
ef6a22b70f6d9044 Mel Gorman     2023-03-01  887  #endif /* CONFIG_NUMA_BALANCING */
ef6a22b70f6d9044 Mel Gorman     2023-03-01  888  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
