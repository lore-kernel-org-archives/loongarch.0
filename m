Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 159F7219EB;
	Fri, 30 Jan 2026 08:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769762028; cv=none; b=lHWG15JJqRMcer4c09G/+Mqk9PJl+zEYi5fDffRZv0eEp5nOw8b2hZwaYeJpSpRpHLeUqe66pWBsqlwEdoxP0/ykAGgYKHK9pTMR7s39S1nY6/w5c70cTrsYcJYJOnglAzFrZcCSStgvSkmLjUKczRr3PJw0Z/81MukuFcLRNOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769762028; c=relaxed/simple;
	bh=QN+OPSonoef9UutoCXs4rECIiEyhiNWsf+fuEBAlWS8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e1Aqs6SVlswKvA5GiKW0Ym1L+GzOwWHUDJJtFLe4jh2DEtZt73hJGpjyRJYem2gNrdDKPyfvK3pzkHQ70o4DOxVwLxkWYQP74MHSuQllCb74KQ6c7pv78YI0BiqlUbFnax61rIvWuQe9H2kAz/h9bCcOih4ahkD2t7GHm+UtHqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=etquA7O0; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="etquA7O0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769762027; x=1801298027;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QN+OPSonoef9UutoCXs4rECIiEyhiNWsf+fuEBAlWS8=;
  b=etquA7O08RUIQV/vCQO7T1cI0AvVlrVzKU8z1Fn1dtvwYWsna1WFKP37
   iFkr/qfi5bwq6uOiCpBoX+/E61FkOU5nSaSZJ44bxxv6jWFn1doca9jpb
   OfLiWnHA4DAWl1kJQNKRnk/apgm3wGRyu+rpz38O2Vs1rjAH+midxESN9
   Pjxcmtttb+ElKl3PraUe7jZ9d7r9eKozNYlAIkJ3uQwYc0zxDkke4uhwj
   rn7WA/aT5x+G4XkA3PHSpUdPTTL25k3M/uKwaF2lq/q00utUGYN/DKiul
   BRirM9CvTbj/LaI6G5M+3VXAKERQqgIjbOTM6kwfNbItmhIKM7RvXLyfZ
   g==;
X-CSE-ConnectionGUID: +JtfPct1TQONQjUOXLt9WQ==
X-CSE-MsgGUID: NrUHPPJsSmu5PGYn7uXWNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="71047013"
X-IronPort-AV: E=Sophos;i="6.21,262,1763452800"; 
   d="scan'208";a="71047013"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2026 00:33:46 -0800
X-CSE-ConnectionGUID: O7AUWrRjQIa2S9bgfJ80aQ==
X-CSE-MsgGUID: oj7A5hQSSBant5Y7HErgxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,262,1763452800"; 
   d="scan'208";a="239526989"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 30 Jan 2026 00:33:43 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vljwh-00000000cNc-2QQQ;
	Fri, 30 Jan 2026 08:33:39 +0000
Date: Fri, 30 Jan 2026 16:33:37 +0800
From: kernel test robot <lkp@intel.com>
To: Tianyang Zhang <zhangtianyang@loongson.cn>, chenhuacai@kernel.org,
	kernel@xen0n.name, corbet@lwn.net, alexs@kernel.org,
	si.yanteng@linux.dev, tglx@linutronix.de, jiaxun.yang@flygoat.com,
	maobibo@loongson.cn
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	loongarch@lists.linux.dev, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Tianyang Zhang <zhangtianyang@loongson.cn>,
	Liupu Wang <wangliupu@loongson.cn>
Subject: Re: [PATCH v9 4/4] irqchip/irq-loongarch-ir:Add Redirect irqchip
 support
Message-ID: <202601301601.EonMu52D-lkp@intel.com>
References: <20260130025941.2140582-5-zhangtianyang@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260130025941.2140582-5-zhangtianyang@loongson.cn>

Hi Tianyang,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tip/irq/core]
[also build test WARNING on linus/master v6.19-rc7 next-20260129]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Tianyang-Zhang/Docs-LoongArch-Add-Advanced-Extended-Redirect-IRQ-model-description/20260130-110249
base:   tip/irq/core
patch link:    https://lore.kernel.org/r/20260130025941.2140582-5-zhangtianyang%40loongson.cn
patch subject: [PATCH v9 4/4] irqchip/irq-loongarch-ir:Add Redirect irqchip support
config: loongarch-allnoconfig (https://download.01.org/0day-ci/archive/20260130/202601301601.EonMu52D-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260130/202601301601.EonMu52D-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601301601.EonMu52D-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/irqchip/irq-loongarch-ir.c:203:6: warning: variable 'order' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
     203 |         if (nr_irqs > 1) {
         |             ^~~~~~~~~~~
   drivers/irqchip/irq-loongarch-ir.c:211:19: note: uninitialized use occurs here
     211 |                                         IRD_ENTRIES, order);
         |                                                      ^~~~~
   drivers/irqchip/irq-loongarch-ir.c:203:2: note: remove the 'if' if its condition is always true
     203 |         if (nr_irqs > 1) {
         |         ^~~~~~~~~~~~~~~~
   drivers/irqchip/irq-loongarch-ir.c:201:27: note: initialize the variable 'order' to silence this warning
     201 |         unsigned int index, order;
         |                                  ^
         |                                   = 0
   1 warning generated.


vim +203 drivers/irqchip/irq-loongarch-ir.c

   197	
   198	static int redirect_table_alloc(int node, u32 nr_irqs)
   199	{
   200		struct redirect_table *ird_table = &irde_descs[node].ird_table;
   201		unsigned int index, order;
   202	
 > 203		if (nr_irqs > 1) {
   204			nr_irqs = __roundup_pow_of_two(nr_irqs);
   205			order = ilog2(nr_irqs);
   206		}
   207	
   208		guard(raw_spinlock_irqsave)(&ird_table->lock);
   209	
   210		index = bitmap_find_free_region(ird_table->bitmap,
   211						IRD_ENTRIES, order);
   212		if (index < 0) {
   213			pr_err("No redirect entry to use\n");
   214			return -ENOMEM;
   215		}
   216	
   217		return index;
   218	}
   219	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
