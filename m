Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08B2D61FFE;
	Sat, 11 Oct 2025 01:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760145176; cv=none; b=imGWl7y1j/homp316ZDgxiw8p9PXUmINDnHlB8ddSux3PEjcrO03Aoihuf67kPeS6VpFkquglRVLixeA65uMMARwAPyVTaOC2xV8Z3+ABFY+DS7TP9FGgfJFfWRELZAgwlMtnLzpkvrXztE1FryyfZCfe6eW+L16v4MQOGCOzEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760145176; c=relaxed/simple;
	bh=ucy6YOJRmqBcirVEuFy4wQRT/WtafEtff4nZW2czQcg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=reSbKGe0/vxjTIVDU0h0Y7k8DYA0zYTcuokezoe4kdiWMgWZNq3KktejbTNM0RkrcROQ8QQ/1QW51y8h5+OAngwZ+ki4wV+Ar/qQjvNkWKwLJRw8VkDTWpdWiJdwrMpRLNAW4SAxU5fpKVdhykMmjfb4R/wyFfhUkK6IIxqT4ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WIuoc4kk; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WIuoc4kk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760145175; x=1791681175;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ucy6YOJRmqBcirVEuFy4wQRT/WtafEtff4nZW2czQcg=;
  b=WIuoc4kkyuFmKgdu7Yy5HlvHfC3Yddmgzv3Md+WhqIj2ByoAjHJdJ2Dl
   BgoE5hcaI7WtR1Je9BL/jivG8MYTl50uLLgT5xdI3Miuga35kKPxSuRqx
   teOKRmx+MNT3SLR7r61z4Rh5ED6vIER27I55Er3NQbNvzry7Ik3BbkxkC
   uAAkKAc9XFzFMEtJDIGPS/cZYZbeEJ34syPEavE95ozuTVsc0gD2bpdd6
   KdieSKHc9z8TMc3ejynfG5YnRH4Nn4gReXxEWbz+mPZzWLRjCjadxw4QO
   2I4l6rZWBgjAA1D1tlxjQ1Yr8Xn2wLlV1NBzmZFvyMewz4I8n8OAiQPfS
   Q==;
X-CSE-ConnectionGUID: dDwz1fxJT/+BwzX6VUTvbA==
X-CSE-MsgGUID: OmLwWTP2TWmw+bxfEGQefw==
X-IronPort-AV: E=McAfee;i="6800,10657,11578"; a="66220398"
X-IronPort-AV: E=Sophos;i="6.19,220,1754982000"; 
   d="scan'208";a="66220398"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2025 18:12:55 -0700
X-CSE-ConnectionGUID: zxk79Xh6Qi2s7rWg5gOvQg==
X-CSE-MsgGUID: 5w6Sct5DSYWT4cqH8YS1Dg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,220,1754982000"; 
   d="scan'208";a="204783189"
Received: from lkp-server01.sh.intel.com (HELO 6a630e8620ab) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 10 Oct 2025 18:12:50 -0700
Received: from kbuild by 6a630e8620ab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v7OAC-0003Mv-11;
	Sat, 11 Oct 2025 01:12:48 +0000
Date: Sat, 11 Oct 2025 09:12:23 +0800
From: kernel test robot <lkp@intel.com>
To: Tianyang Zhang <zhangtianyang@loongson.cn>, chenhuacai@kernel.org,
	kernel@xen0n.name, corbet@lwn.net, alexs@kernel.org,
	si.yanteng@linux.dev, tglx@linutronix.de, jiaxun.yang@flygoat.com,
	peterz@infradead.org, wangliupu@loongson.cn, lvjianmin@loongson.cn,
	maobibo@loongson.cn, siyanteng@cqsoftware.com.cn,
	gaosong@loongson.cn, yangtiezhu@loongson.cn
Cc: oe-kbuild-all@lists.linux.dev, loongarch@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Tianyang Zhang <zhangtianyang@loongson.cn>
Subject: Re: [PATCH v5 2/2] irqchip/irq-loongarch-ir:Add Redirect irqchip
 support
Message-ID: <202510110810.nIsLpJni-lkp@intel.com>
References: <20251010022845.140234-3-zhangtianyang@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251010022845.140234-3-zhangtianyang@loongson.cn>

Hi Tianyang,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tip/irq/core]
[also build test WARNING on linus/master v6.17 next-20251010]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Tianyang-Zhang/Docs-LoongArch-Add-Advanced-Extended-Redirect-IRQ-model-description/20251010-131542
base:   tip/irq/core
patch link:    https://lore.kernel.org/r/20251010022845.140234-3-zhangtianyang%40loongson.cn
patch subject: [PATCH v5 2/2] irqchip/irq-loongarch-ir:Add Redirect irqchip support
config: loongarch-randconfig-r121-20251011 (https://download.01.org/0day-ci/archive/20251011/202510110810.nIsLpJni-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251011/202510110810.nIsLpJni-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510110810.nIsLpJni-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/irqchip/irq-loongarch-ir.c:130:34: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void [noderef] __iomem *reg_addr @@     got void * @@
   drivers/irqchip/irq-loongarch-ir.c:130:34: sparse:     expected void [noderef] __iomem *reg_addr
   drivers/irqchip/irq-loongarch-ir.c:130:34: sparse:     got void *
>> drivers/irqchip/irq-loongarch-ir.c:130:34: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void [noderef] __iomem *reg_addr @@     got void * @@
   drivers/irqchip/irq-loongarch-ir.c:130:34: sparse:     expected void [noderef] __iomem *reg_addr
   drivers/irqchip/irq-loongarch-ir.c:130:34: sparse:     got void *
   drivers/irqchip/irq-loongarch-ir.c:123:34: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void [noderef] __iomem *reg_addr @@     got void * @@
   drivers/irqchip/irq-loongarch-ir.c:123:34: sparse:     expected void [noderef] __iomem *reg_addr
   drivers/irqchip/irq-loongarch-ir.c:123:34: sparse:     got void *
   drivers/irqchip/irq-loongarch-ir.c:159:9: sparse: sparse: context imbalance in 'invalid_enqueue' - wrong count at exit
   drivers/irqchip/irq-loongarch-ir.c:188:12: sparse: sparse: context imbalance in 'redirect_table_alloc' - wrong count at exit
   drivers/irqchip/irq-loongarch-ir.c:116:34: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void [noderef] __iomem *reg_addr @@     got void * @@
   drivers/irqchip/irq-loongarch-ir.c:116:34: sparse:     expected void [noderef] __iomem *reg_addr
   drivers/irqchip/irq-loongarch-ir.c:116:34: sparse:     got void *
   drivers/irqchip/irq-loongarch-ir.c:116:34: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void [noderef] __iomem *reg_addr @@     got void * @@
   drivers/irqchip/irq-loongarch-ir.c:116:34: sparse:     expected void [noderef] __iomem *reg_addr
   drivers/irqchip/irq-loongarch-ir.c:116:34: sparse:     got void *
   drivers/irqchip/irq-loongarch-ir.c:123:34: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void [noderef] __iomem *reg_addr @@     got void * @@
   drivers/irqchip/irq-loongarch-ir.c:123:34: sparse:     expected void [noderef] __iomem *reg_addr
   drivers/irqchip/irq-loongarch-ir.c:123:34: sparse:     got void *
   drivers/irqchip/irq-loongarch-ir.c:123:34: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void [noderef] __iomem *reg_addr @@     got void * @@
   drivers/irqchip/irq-loongarch-ir.c:123:34: sparse:     expected void [noderef] __iomem *reg_addr
   drivers/irqchip/irq-loongarch-ir.c:123:34: sparse:     got void *
   drivers/irqchip/irq-loongarch-ir.c:116:34: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void [noderef] __iomem *reg_addr @@     got void * @@
   drivers/irqchip/irq-loongarch-ir.c:116:34: sparse:     expected void [noderef] __iomem *reg_addr
   drivers/irqchip/irq-loongarch-ir.c:116:34: sparse:     got void *

vim +130 drivers/irqchip/irq-loongarch-ir.c

   127	
   128	static inline u32 redirect_read_reg32(int node, int reg)
   129	{
 > 130		void __iomem *reg_addr = REDIRECT_REG(reg, node);
   131	
   132		return readl(reg_addr);
   133	}
   134	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
