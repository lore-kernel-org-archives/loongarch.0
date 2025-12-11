Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC68F2DCF47;
	Thu, 11 Dec 2025 23:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765495140; cv=none; b=kvd9c9Kc8dIy4t1sVUXNOgSWlyD+7qkQe6S77RvoPXYOmwTAdmt51To+T2PeEAFMp0aLTLJfo4Unl//3Kic5SRBuPAv1fSfna6TzQsCMFE32z9xUA1psA1/wP1qs0OsiKIlPYVZNnjMU/4ceuJWOXI3hv8jmv/gbzzwpzh28e04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765495140; c=relaxed/simple;
	bh=oGgLwpC58UPbF1rt7SX/cKJaKFq1u2fGauyH2JjWcjQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kUs763amhIm8+EDHLqoadEVWect/ox2EE3plKlzHowefCGkxll1Szd/r4Cz50mxj6TDYTIkKsmhuddkhvWju4SlMAYd+OsjeWTi/fnWyNOKw4aWQUsfnatQB7RkltENZkMMPJbjE4e5Bmf26qwfOJTGKAtKT58c6wsJUicMsp4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FsNZ0/3b; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FsNZ0/3b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765495139; x=1797031139;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=oGgLwpC58UPbF1rt7SX/cKJaKFq1u2fGauyH2JjWcjQ=;
  b=FsNZ0/3bmdaTEsLOCFXbzF+tCjjKmgSzLABcGfplYEJK3DlEXTIn9+Wh
   4J/3H6iyAQ/GPULjHlwXdoDcR/muebJQQDBudajx/GqFINRUz2W7nvTvX
   T3ooqIfstNOdl3Ro90Qb/llQK3l0UszQQ67DBNDsbTREyYo65BoLkXL7Q
   5aH87myqMEjPZBtTfsE+at+bu9xxbuvAz598GisMx6hgB7JXNbiccNGI+
   gp0P7j4hCpXlaoLWRcEvHP4bkIkCJKADq4i1QhSwTN1I8h3eAEToRVZxu
   ThMwEXAUZeA1KaeoNPUlNO9ee6kZY63pM5hl+PfG9VM+DqtFSpqXwXU6u
   Q==;
X-CSE-ConnectionGUID: 7VklNka8TtK/Vf26ySZKfg==
X-CSE-MsgGUID: b3LcxOAnTDy9u2HbpaUCZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="71111175"
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="71111175"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2025 15:18:59 -0800
X-CSE-ConnectionGUID: sFbrYc4HS72LNag77CDiyw==
X-CSE-MsgGUID: r2haberhT1+ttEY1DTlvJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="201399473"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 11 Dec 2025 15:18:54 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTpvv-000000005Br-2j0f;
	Thu, 11 Dec 2025 23:18:51 +0000
Date: Fri, 12 Dec 2025 07:18:46 +0800
From: kernel test robot <lkp@intel.com>
To: Tianyang Zhang <zhangtianyang@loongson.cn>, chenhuacai@kernel.org,
	kernel@xen0n.name, corbet@lwn.net, alexs@kernel.org,
	si.yanteng@linux.dev, tglx@linutronix.de, jiaxun.yang@flygoat.com,
	peterz@infradead.org, wangliupu@loongson.cn, lvjianmin@loongson.cn,
	maobibo@loongson.cn, siyanteng@cqsoftware.com.cn,
	gaosong@loongson.cn, yangtiezhu@loongson.cn
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	loongarch@lists.linux.dev, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Tianyang Zhang <zhangtianyang@loongson.cn>
Subject: Re: [PATCH] irqchip/irq-loongarch-ir:Add Redirect irqchip support
Message-ID: <202512120915.PyiiMOEa-lkp@intel.com>
References: <20251211091910.5140-3-zhangtianyang@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251211091910.5140-3-zhangtianyang@loongson.cn>

Hi Tianyang,

kernel test robot noticed the following build errors:

[auto build test ERROR on tip/irq/core]
[also build test ERROR on linus/master v6.18 next-20251211]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Tianyang-Zhang/irqchip-irq-loongarch-ir-Add-Redirect-irqchip-support/20251211-172347
base:   tip/irq/core
patch link:    https://lore.kernel.org/r/20251211091910.5140-3-zhangtianyang%40loongson.cn
patch subject: [PATCH] irqchip/irq-loongarch-ir:Add Redirect irqchip support
config: loongarch-allnoconfig (https://download.01.org/0day-ci/archive/20251212/202512120915.PyiiMOEa-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 6ec8c4351cfc1d0627d1633b02ea787bd29c77d8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251212/202512120915.PyiiMOEa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512120915.PyiiMOEa-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/irqchip/irq-loongarch-avec.c:416:6: error: use of undeclared identifier 'cpu_has_redirectint'
     416 |         if (cpu_has_redirectint)
         |             ^~~~~~~~~~~~~~~~~~~
>> drivers/irqchip/irq-loongarch-avec.c:417:10: error: call to undeclared function 'redirect_acpi_init'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     417 |                 return redirect_acpi_init(loongarch_avec.domain);
         |                        ^
   2 errors generated.
--
>> drivers/irqchip/irq-loongarch-ir.c:141:39: error: use of undeclared identifier 'LOONGARCH_IOCSR_REDIRECT_CQH'
     141 |         u32 head = redirect_read_reg32(node, LOONGARCH_IOCSR_REDIRECT_CQH);
         |                                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/irqchip/irq-loongarch-ir.c:143:36: error: use of undeclared identifier 'LOONGARCH_IOCSR_REDIRECT_CQT'
     143 |         *tail = redirect_read_reg32(node, LOONGARCH_IOCSR_REDIRECT_CQT);
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/irqchip/irq-loongarch-ir.c:161:9: error: use of undeclared identifier 'LOONGARCH_IOCSR_REDIRECT_CQT'
     161 |                              LOONGARCH_IOCSR_REDIRECT_CQT);
         |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/irqchip/irq-loongarch-ir.c:235:28: error: incomplete definition of type 'struct avecintc_data'
     235 |         item->gpid->irqnum = adata->vec;
         |                              ~~~~~^
   drivers/irqchip/irq-loongarch-ir.c:187:22: note: forward declaration of 'struct avecintc_data'
     187 | static inline struct avecintc_data *irq_data_get_avec_data(struct irq_data *data)
         |                      ^
   drivers/irqchip/irq-loongarch-ir.c:236:25: error: incomplete definition of type 'struct avecintc_data'
     236 |         item->gpid->dst = adata->cpu;
         |                           ~~~~~^
   drivers/irqchip/irq-loongarch-ir.c:187:22: note: forward declaration of 'struct avecintc_data'
     187 | static inline struct avecintc_data *irq_data_get_avec_data(struct irq_data *data)
         |                      ^
>> drivers/irqchip/irq-loongarch-ir.c:259:2: error: call to undeclared function 'avecintc_sync'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     259 |         avecintc_sync(adata);
         |         ^
>> drivers/irqchip/irq-loongarch-ir.c:415:53: error: use of undeclared identifier 'LOONGARCH_IOCSR_REDIRECT_CFG'
     415 |         redirect_write_reg64(irde->node, CFG_DISABLE_IDLE, LOONGARCH_IOCSR_REDIRECT_CFG);
         |                                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/irqchip/irq-loongarch-ir.c:416:64: error: use of undeclared identifier 'LOONGARCH_IOCSR_REDIRECT_TBR'
     416 |         redirect_write_reg64(irde->node, __pa(irde->ird_table.table), LOONGARCH_IOCSR_REDIRECT_TBR);
         |                                                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/irqchip/irq-loongarch-ir.c:417:38: error: use of undeclared identifier 'LOONGARCH_IOCSR_REDIRECT_CQH'
     417 |         redirect_write_reg32(irde->node, 0, LOONGARCH_IOCSR_REDIRECT_CQH);
         |                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/irqchip/irq-loongarch-ir.c:418:38: error: use of undeclared identifier 'LOONGARCH_IOCSR_REDIRECT_CQT'
     418 |         redirect_write_reg32(irde->node, 0, LOONGARCH_IOCSR_REDIRECT_CQT);
         |                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/irqchip/irq-loongarch-ir.c:420:24: error: use of undeclared identifier 'LOONGARCH_IOCSR_REDIRECT_CQB'
     420 |                              CQB_SIZE_MASK, LOONGARCH_IOCSR_REDIRECT_CQB);
         |                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/irqchip/irq-loongarch-ir.c:475:46: error: use of undeclared identifier 'AVEC_MSG_OFFSET'
     475 |         msi_base_addr = pchmsi_entry->msg_address - AVEC_MSG_OFFSET;
         |                                                     ^~~~~~~~~~~~~~~
>> drivers/irqchip/irq-loongarch-ir.c:485:12: warning: no previous prototype for function 'redirect_acpi_init' [-Wmissing-prototypes]
     485 | int __init redirect_acpi_init(struct irq_domain *parent)
         |            ^
   drivers/irqchip/irq-loongarch-ir.c:485:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     485 | int __init redirect_acpi_init(struct irq_domain *parent)
         | ^
         | static 
   1 warning and 12 errors generated.


vim +/redirect_acpi_init +417 drivers/irqchip/irq-loongarch-avec.c

   413	
   414	static inline int __init acpi_cascade_irqdomain_init(void)
   415	{
   416		if (cpu_has_redirectint)
 > 417			return redirect_acpi_init(loongarch_avec.domain);
   418	
   419		return acpi_table_parse_madt(ACPI_MADT_TYPE_MSI_PIC, pch_msi_parse_madt, 1);
   420	}
   421	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
