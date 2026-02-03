Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92D382C08D1;
	Tue,  3 Feb 2026 09:19:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770110343; cv=none; b=aXnBu7g6jAmnp6o0wNkPXqZE5CpvT6U3ezUzZd/VbZCcbkcIH2BPJhTdnHGPCqbKLPaEnC2/HfdS0JLqx4VQmcYswCGTZ80m7QyvoyzNKb4CkdnO5cpzBN4d3PanubSqaW9rcw3oTaU7Kx0sM5o8H2iT44j8AoAFuc5eEADUO20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770110343; c=relaxed/simple;
	bh=EL5/CWhuVKlSmqggE8w0nVImAy4Hf9oadRPQy0z32XU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TU1grx5qHyzW4qZ1tRR/gSO/jRJp/UqjRw4P2b6K4qRRD733gIQ+nO1Ee/DylvFBWERPhvwlpAp1cNuU3RPfDaXhnZxgNJdEa/CfA12pwTogvVBoUIO/LeCIIgJuU2vOb3KmRtSxLNCYP8JCfeSJBBUsySdK8zJLIncG/Wl4c1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PuXzui41; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PuXzui41"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770110342; x=1801646342;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=EL5/CWhuVKlSmqggE8w0nVImAy4Hf9oadRPQy0z32XU=;
  b=PuXzui41sAFEpX4RLgNhH5euniT4J9QyLzgUKyBbjx2mbjVLqByOq9PN
   wqzSOZf+loz/kpHyPu9L/9qulMwBSi5I0XWGNoHZm0pM+SagVrb7Kk8Lg
   cy32lQuHnxvxITbrofpZjElTCHXac+w2gTt6fal2V/EjfneQDEeKGSssC
   2L4yg7UVJ/UeEzDl2ulKegFs8ePbyXEbyeOCx4H3+tal8zrpS2EIwnB76
   6WnK2C0Fc7WY5qUBgxmAvN//UZL3kls5akcRXfxSmwjQuiBkPUOY8GQz1
   7eie4bs2H5slq7uL1kKpBgkCbZpxri8f3Em/7fajHklmPEcAjsvSqLXr1
   g==;
X-CSE-ConnectionGUID: 8AG2FbftSvmu4eqy2cjNrw==
X-CSE-MsgGUID: jQZVv6sBSF+xhSMx8txe3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11690"; a="88697932"
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; 
   d="scan'208";a="88697932"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2026 01:19:01 -0800
X-CSE-ConnectionGUID: vRkcvnMZTSGwT/dXivMC5w==
X-CSE-MsgGUID: GJOaJvlfRVKSKluBmYXX5Q==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 03 Feb 2026 01:18:57 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vnCYh-00000000gUa-2P0g;
	Tue, 03 Feb 2026 09:18:55 +0000
Date: Tue, 3 Feb 2026 17:18:08 +0800
From: kernel test robot <lkp@intel.com>
To: Tianyang Zhang <zhangtianyang@loongson.cn>, chenhuacai@kernel.org,
	kernel@xen0n.name, corbet@lwn.net, alexs@kernel.org,
	si.yanteng@linux.dev, tglx@linutronix.de, jiaxun.yang@flygoat.com,
	maobibo@loongson.cn
Cc: oe-kbuild-all@lists.linux.dev, loongarch@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Tianyang Zhang <zhangtianyang@loongson.cn>,
	Liupu Wang <wangliupu@loongson.cn>
Subject: Re: [PATCH v10 4/4] irqchip/irq-loongarch-ir:Add Redirect irqchip
 support
Message-ID: <202602031759.6a4E6Hm4-lkp@intel.com>
References: <20260202091041.2278271-5-zhangtianyang@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260202091041.2278271-5-zhangtianyang@loongson.cn>

Hi Tianyang,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tip/irq/core]
[also build test WARNING on linus/master v6.19-rc8 next-20260202]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Tianyang-Zhang/Docs-LoongArch-Add-Advanced-Extended-Redirect-IRQ-model-description/20260202-171607
base:   tip/irq/core
patch link:    https://lore.kernel.org/r/20260202091041.2278271-5-zhangtianyang%40loongson.cn
patch subject: [PATCH v10 4/4] irqchip/irq-loongarch-ir:Add Redirect irqchip support
config: loongarch-randconfig-r072-20260203 (https://download.01.org/0day-ci/archive/20260203/202602031759.6a4E6Hm4-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 15.2.0
smatch version: v0.5.0-8994-gd50c5a4c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602031759.6a4E6Hm4-lkp@intel.com/

smatch warnings:
drivers/irqchip/irq-loongarch-ir.c:206 redirect_table_alloc() warn: unsigned 'index' is never less than zero.
drivers/irqchip/irq-loongarch-ir.c:206 redirect_table_alloc() warn: error code type promoted to positive: 'index'

vim +/index +206 drivers/irqchip/irq-loongarch-ir.c

   192	
   193	static int redirect_table_alloc(int node, u32 nr_irqs)
   194	{
   195		struct redirect_table *ird_table = &irde_descs[node].ird_table;
   196		unsigned int index, order = 0;
   197	
   198		if (nr_irqs > 1) {
   199			nr_irqs = __roundup_pow_of_two(nr_irqs);
   200			order = ilog2(nr_irqs);
   201		}
   202	
   203		guard(raw_spinlock_irqsave)(&ird_table->lock);
   204	
   205		index = bitmap_find_free_region(ird_table->bitmap, IRD_ENTRIES, order);
 > 206		if (index < 0) {
   207			pr_err("No redirect entry to use\n");
   208			return -EINVAL;
   209		}
   210	
   211		return index;
   212	}
   213	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
