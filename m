Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EDB31E480;
	Sat, 11 Oct 2025 15:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760196493; cv=none; b=qoAlteT1Y3y0bc24FXsq1szXzUyjmvOEzI3hVoKiNBElzNfWvpN53iRM9ttnnsm/3YvX/hBYuIJPUXZhv7t+4mpSRqb+2nJ4nY1C7RKcw4mRdUTxu94wC4A0+JezkWAqc/RCeynxR+R02Zk1yC8U0V3bzUnbn9XtinSGxRC7ZK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760196493; c=relaxed/simple;
	bh=usBYVE1eZfyEMfHqr2yt6OEMuGPOwPvlMQfsDnwCZTQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G26zwbHH3/Ymzau8mX5IL1tj+aDAIKMUCwQoN4bZUANuIq4TY5zOvQK4LOUvMHiZCaj446cRMh6Jl4KVTwQaKqJzpfTVck9BvEgoSsLRoyerteXJnyusBp5EwonBQtLdqvLr2rAv8jqhZU/YDY6SV0OSh6SEVdqNm6ObYVL8BDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XdkhUp9i; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XdkhUp9i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760196491; x=1791732491;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=usBYVE1eZfyEMfHqr2yt6OEMuGPOwPvlMQfsDnwCZTQ=;
  b=XdkhUp9iuR4d2v00WgX5dH+5vd+rC+cHFfZK5OsWYzkaDNYf6r8tRc5A
   EeaVlAX22vZ2JoXDEvTUF02CNoaFjIeVxbxl0XdZ5kIbrEsn1Q5JcIIqL
   V4KhE1MYhjt+JFL800HqLgDs+Vm7pcGWmKQRg+h3X2qzj0q0vF6gW2ckI
   GWhuO/5ccv6JmpQBCpZMGsBnV6iIuqMZM6R+Fiwiwk3I4jwIgJBvEub4u
   0CG+Uq8Ht0iyqtMEq2HzhcLaedp1gHjmU8kaB/MEzFH9zwaakDOz/1ReH
   cu+IrY06ugtAw+1iiHV8JHtTBh/ZCGi4wHAE3ImkYtjO1xNZqNNKTvGYL
   w==;
X-CSE-ConnectionGUID: WPVS3GH5SFm9sdunyYQzaw==
X-CSE-MsgGUID: /GqMqoTiSwapucbxkrU8ig==
X-IronPort-AV: E=McAfee;i="6800,10657,11579"; a="62274598"
X-IronPort-AV: E=Sophos;i="6.19,221,1754982000"; 
   d="scan'208";a="62274598"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2025 08:28:11 -0700
X-CSE-ConnectionGUID: ImVrFSK0SdyMf7mwIE/Jfg==
X-CSE-MsgGUID: BrYeQkKdSQq6l+eImZFbBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,221,1754982000"; 
   d="scan'208";a="185465265"
Received: from lkp-server01.sh.intel.com (HELO 6a630e8620ab) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 11 Oct 2025 08:28:06 -0700
Received: from kbuild by 6a630e8620ab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v7bVr-0003ph-2D;
	Sat, 11 Oct 2025 15:28:03 +0000
Date: Sat, 11 Oct 2025 23:27:14 +0800
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
Subject: Re: [PATCH v5 2/2] irqchip/irq-loongarch-ir:Add Redirect irqchip
 support
Message-ID: <202510112232.3mPdCFd1-lkp@intel.com>
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
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20251011/202510112232.3mPdCFd1-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251011/202510112232.3mPdCFd1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510112232.3mPdCFd1-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/irqchip/irq-loongarch-ir.c:498:6: warning: variable 'ret' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     498 |         if (!redirect_domain) {
         |             ^~~~~~~~~~~~~~~~
   drivers/irqchip/irq-loongarch-ir.c:525:9: note: uninitialized use occurs here
     525 |         return ret;
         |                ^~~
   drivers/irqchip/irq-loongarch-ir.c:498:2: note: remove the 'if' if its condition is always false
     498 |         if (!redirect_domain) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~
     499 |                 pr_err("Unable to alloc redirect domain\n");
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     500 |                 goto out_free_fwnode;
         |                 ~~~~~~~~~~~~~~~~~~~~~
     501 |         }
         |         ~
   drivers/irqchip/irq-loongarch-ir.c:491:6: warning: variable 'ret' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     491 |         if (!fwnode) {
         |             ^~~~~~~
   drivers/irqchip/irq-loongarch-ir.c:525:9: note: uninitialized use occurs here
     525 |         return ret;
         |                ^~~
   drivers/irqchip/irq-loongarch-ir.c:491:2: note: remove the 'if' if its condition is always false
     491 |         if (!fwnode) {
         |         ^~~~~~~~~~~~~~
     492 |                 pr_err("Unable to alloc redirect domain handle\n");
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     493 |                 goto fail;
         |                 ~~~~~~~~~~
     494 |         }
         |         ~
   drivers/irqchip/irq-loongarch-ir.c:488:9: note: initialize the variable 'ret' to silence this warning
     488 |         int ret, node;
         |                ^
         |                 = 0
   2 warnings generated.


vim +498 drivers/irqchip/irq-loongarch-ir.c

   484	
   485	int __init redirect_acpi_init(struct irq_domain *parent)
   486	{
   487		struct fwnode_handle *fwnode;
   488		int ret, node;
   489	
   490		fwnode = irq_domain_alloc_named_fwnode("redirect");
   491		if (!fwnode) {
   492			pr_err("Unable to alloc redirect domain handle\n");
   493			goto fail;
   494		}
   495	
   496		redirect_domain = irq_domain_create_hierarchy(parent, 0, IRD_ENTRIES, fwnode,
   497							      &redirect_domain_ops, irde_descs);
 > 498		if (!redirect_domain) {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
