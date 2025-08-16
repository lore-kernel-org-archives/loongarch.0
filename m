Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30B681E5B78;
	Sat, 16 Aug 2025 05:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755322717; cv=none; b=DgxdbbKph0OAYGQGaP6dVvJAg1kD0RQb+6zL3vSPjf4AIe6zMc4J0Y57VpqxTu12qXUpDWuYKhC0QFlZE24NHXS+aNtnEqE6t37usC05akSEm02rZNMs7r8l3IM6AgWY+u5dkjoNOp4lTvOUgpi13hrVuGChLxYa/HmiMOd8onw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755322717; c=relaxed/simple;
	bh=RmFXkF27XLwgOi3sq9GPdq023gAeh1eLeY2QmR9xnAo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RN7OYWnJ7GrlC+kua5cuhPBxsKsEUiYsNhiToNf7WmkH6YBMhSA9fM+XGdy0OTn8WXO/ffK5U2b7bq3SeX9FG9MJaQE+IirbTiZovQsqX0KHGWjnap8ZYG2jgROwt6tgpKc2SVoKMVyCap2j+ukclj3ogFtRDcgjsKWhExUg9bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mBIFwdpl; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mBIFwdpl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755322715; x=1786858715;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RmFXkF27XLwgOi3sq9GPdq023gAeh1eLeY2QmR9xnAo=;
  b=mBIFwdplLqbMFRAA0XJPbLCUj9RiUKDA3bT8jeVcFns9coYZ+2vkNtS8
   nYlvA8ShBl4BqAPWjyBvuLRugd5JxxcQjjB4fpxNIa4Hj8YDqvv0r2Rjb
   2zKaAuSe8a/qJPddxZQBkeQcXOM4W85uRCjgITF512lzrTT1Xosio55Pt
   5mCP+MLErQRU8ymDQmkOIxKcddHOggvuEFJ2/3e1M/CWdMH5kHY2d5jIf
   ngGpwIYgp45Rrl/KaTYsUl1z08AqnEx7q+u3pQf+2OqvMlIkUaJb7QvxA
   aSXJ7sW4P9Y2iTJBersFrsE1Arjk3bqh/xhZJRe12MZgxseWxjR9ZxVG3
   w==;
X-CSE-ConnectionGUID: sUDckE9kSN+Ex6Re6EwjTA==
X-CSE-MsgGUID: xiV4XlzJSlmNBwm/PKnIgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11523"; a="61472916"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="61472916"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2025 22:38:34 -0700
X-CSE-ConnectionGUID: ok76rYeETKqqt5ErORr8TQ==
X-CSE-MsgGUID: RlIhM0uUTo2qwLWtC+kHcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="167544025"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 15 Aug 2025 22:38:32 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1un9cY-000CcO-0Y;
	Sat, 16 Aug 2025 05:38:27 +0000
Date: Sat, 16 Aug 2025 13:37:33 +0800
From: kernel test robot <lkp@intel.com>
To: Youling Tang <youling.tang@linux.dev>,
	Huacai Chen <chenhuacai@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, WANG Xuerui <kernel@xen0n.name>,
	Baoquan He <bhe@redhat.com>, kexec@lists.infradead.org,
	loongarch@lists.linux.dev, linux-kernel@vger.kernel.org,
	youling.tang@linux.dev, Youling Tang <tangyouling@kylinos.cn>
Subject: Re: [PATCH 2/6] LoongArch: Add kexec_file support
Message-ID: <202508161329.M5Axl1XA-lkp@intel.com>
References: <20250811092659.14903-3-youling.tang@linux.dev>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250811092659.14903-3-youling.tang@linux.dev>

Hi Youling,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.17-rc1 next-20250815]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Youling-Tang/LoongArch-Add-struct-loongarch_image_header-for-kernel-image/20250811-174725
base:   linus/master
patch link:    https://lore.kernel.org/r/20250811092659.14903-3-youling.tang%40linux.dev
patch subject: [PATCH 2/6] LoongArch: Add kexec_file support
config: loongarch-randconfig-r121-20250816 (https://download.01.org/0day-ci/archive/20250816/202508161329.M5Axl1XA-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 15.1.0
reproduce: (https://download.01.org/0day-ci/archive/20250816/202508161329.M5Axl1XA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508161329.M5Axl1XA-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/loongarch/kernel/kexec_image.c:19:
>> arch/loongarch/include/asm/image.h:40:22: warning: 'loongarch_pe_machtype' defined but not used [-Wunused-const-variable=]
      40 | static const uint8_t loongarch_pe_machtype[6] = {'P', 'E', 0x0, 0x0, 0x64, 0x62};
         |                      ^~~~~~~~~~~~~~~~~~~~~

sparse warnings: (new ones prefixed by >>)
>> arch/loongarch/kernel/kexec_image.c:63:22: sparse: sparse: cast to restricted __le64
   arch/loongarch/kernel/kexec_image.c:64:23: sparse: sparse: cast to restricted __le64

vim +/loongarch_pe_machtype +40 arch/loongarch/include/asm/image.h

    38	
    39	static const uint8_t loongarch_image_pe_sig[2] = {'M', 'Z'};
  > 40	static const uint8_t loongarch_pe_machtype[6] = {'P', 'E', 0x0, 0x0, 0x64, 0x62};
    41	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
