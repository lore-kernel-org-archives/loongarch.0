Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A95A225777;
	Fri, 20 Jun 2025 13:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750425622; cv=none; b=L9HKvBL4enzUxZgWAYBUDQ0mX8Yk+pOYCkiHUiVKNhdAnjdT8vtsRBcG1JTmKuJDMiafNbcicZC04wezqbKrzSJ24NJ3oIb9VePwGp7/67+WcuFkQpLAjavgSi1EL6YfzIXtOk9Ai9j7TMFKNCs1YxPZeFVtNvHy3dovieblrfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750425622; c=relaxed/simple;
	bh=u6th+w4Q2jkKTNrfNmNBg9rKGJcl9ked0gLE4aa35cY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W/zTRqt2db2SKklWGLTnKQxSQNYDwmAGFSMjBZcI5RmmPBR0ILXCqWRZ16xw2qAnXRCTui4aOb4RjWSZcWRrEWq1dIdFOQgN6eHXGXe1ctYzrAgYKiUbvdDdK4gtcJVbaGa3UzPMGrWteeq03zxDXfG9QHWpoXho41jAWkFqJQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EYcF3WFZ; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EYcF3WFZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750425621; x=1781961621;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=u6th+w4Q2jkKTNrfNmNBg9rKGJcl9ked0gLE4aa35cY=;
  b=EYcF3WFZWSjckcDB00obBo4QcoZaXkX7uUY+hvyWrdTore+6mZdh9EVy
   tALaFgMAoQ1AzqOTJE90Oc3strOlGTmRkbNZ8FtEBqG4zCYejlF4LaaFd
   ueWedOgCL8iBS0RbucNVqaTbFdEWkdyJKPYu0bRj8Lf2XR3m13/zJtDID
   GoRSqYRsLKhRK0FnMHz4I97nF0u+zTKf5cM8J4eTFAaL48G64/Lc9IjU3
   j5t4HosnwJreL6xTKBOU1QestwsbnyBU3BLXxIsV8vGCqva5Fcivxeh51
   og3f+u/l/1g8b9zCDTKO/c8dlKE8sE+7c83/lGcpgfUM26uE3nrW+okfo
   Q==;
X-CSE-ConnectionGUID: R022fa+STyuRvd++aJt9SA==
X-CSE-MsgGUID: elFmYACUQqy3EHoTMD5/dQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="52389505"
X-IronPort-AV: E=Sophos;i="6.16,251,1744095600"; 
   d="scan'208";a="52389505"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2025 06:20:21 -0700
X-CSE-ConnectionGUID: LuxuQ+cpRGypSVUA8fIw9Q==
X-CSE-MsgGUID: Xky0WJI1SV2iBqP0gQ5liw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,251,1744095600"; 
   d="scan'208";a="154929550"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 20 Jun 2025 06:20:18 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uSbfE-000Ln3-1x;
	Fri, 20 Jun 2025 13:20:16 +0000
Date: Fri, 20 Jun 2025 21:20:11 +0800
From: kernel test robot <lkp@intel.com>
To: Binbin Zhou <zhoubinbin@loongson.cn>,
	Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Ulf Hansson <ulf.hansson@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev, linux-mmc@vger.kernel.org,
	wanghongliang@loongson.cn
Subject: Re: [PATCH v3 2/4] mmc: loongson2: Add Loongson-2K SD/SDIO
 controller driver
Message-ID: <202506202031.TNchn822-lkp@intel.com>
References: <abfe54473135df478db14b5ef0e1773326455f21.1750216134.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <abfe54473135df478db14b5ef0e1773326455f21.1750216134.git.zhoubinbin@loongson.cn>

Hi Binbin,

kernel test robot noticed the following build errors:

[auto build test ERROR on 187715cfd12932a528ff3a3952648e2b55381d4c]

url:    https://github.com/intel-lab-lkp/linux/commits/Binbin-Zhou/dt-bindings-mmc-Add-Loongson-2K-SD-SDIO-eMMC-controller-binding/20250618-160908
base:   187715cfd12932a528ff3a3952648e2b55381d4c
patch link:    https://lore.kernel.org/r/abfe54473135df478db14b5ef0e1773326455f21.1750216134.git.zhoubinbin%40loongson.cn
patch subject: [PATCH v3 2/4] mmc: loongson2: Add Loongson-2K SD/SDIO controller driver
config: microblaze-randconfig-r133-20250620 (https://download.01.org/0day-ci/archive/20250620/202506202031.TNchn822-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 8.5.0
reproduce: (https://download.01.org/0day-ci/archive/20250620/202506202031.TNchn822-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506202031.TNchn822-lkp@intel.com/

All errors (new ones prefixed by >>):

   microblaze-linux-ld: drivers/mmc/host/loongson2-mmc.o: in function `loongson2_mmc_set_ios':
>> .tmp_gl_loongson2-mmc.o:(.text+0xec8): undefined reference to `__udivdi3'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
