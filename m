Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A33A2D7DCE;
	Sat, 11 Apr 2026 00:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775867503; cv=none; b=QiA2fHwDkdwm/zvInRMByJZ2oYlzecwSm6YBHcPrkL/gOUcbRvX+rJR4ydsjxkJnt3MOET5i8bR0kJJ05f50hxLumeVOp4nUvqI8gEzAAoKc8kogZNhthjEgxt3XgB/ankF2X0uoyiKD3j5X2OKxW0JXd7O68qKbYFjOfuPZG6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775867503; c=relaxed/simple;
	bh=dVDQNOGwtDFVlDJtIVCvFSoT4S89W4qmZQOGM/EHZxE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O3fMwTfmZLz/edgRGvWcd8ITExbRox4QlUCms4qW811f7HEzUFinDdGgNrz7REdGO1wTbZGcvFkTR8T/eYYyhiNeBdiO3IHmapILIIBwGNrKqxSndIl8LG7hEYVDP20oZmeYWfMSOu2xCPoSuZ/9RBs7r3Qa97CeL9SIIlq29MU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZWuo4Njl; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZWuo4Njl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775867502; x=1807403502;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dVDQNOGwtDFVlDJtIVCvFSoT4S89W4qmZQOGM/EHZxE=;
  b=ZWuo4NjlQaCJqyAzix2Z5Zzm0Zt+ZSJUWzw2OqNV+FNC41q9Zt/gycK8
   zh/eG3TPX08eUiEy/0ZRqrDxgpJrIopaYqO2V0BP5XXIPzn2yKgbuTZCb
   IeUFKfOI3um6AxvzJVjE+hmm101CCVx8fNrcHZZvrfey+i1E4bBRtR1Vy
   Ns0vxPQks4y1tThp3S08Acq1cK8VjgwMu+A9N4vx3v1IHrMA8qz3usctd
   LrAc3w6NROAPpuT290vx+j5iNuvOInXN49/QtDCB5b/8IlbxXTaBzQg28
   wNT+5BS04QWyOawcOU7E3cM3kEftt2/szylQ8jQ70eveG3P/6JupHLJkc
   Q==;
X-CSE-ConnectionGUID: swfqCQy/TkmHRMxq9b5phw==
X-CSE-MsgGUID: BCY8vuWQSI+1GequY4jf+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="94467957"
X-IronPort-AV: E=Sophos;i="6.23,172,1770624000"; 
   d="scan'208";a="94467957"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2026 17:31:40 -0700
X-CSE-ConnectionGUID: mfdpzJpeQdW45ctNkNwMTQ==
X-CSE-MsgGUID: JTzVCBYWS++fDNQuxIrmOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,172,1770624000"; 
   d="scan'208";a="226524924"
Received: from lkp-server01.sh.intel.com (HELO 3eaaf1a74b89) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 10 Apr 2026 17:31:38 -0700
Received: from kbuild by 3eaaf1a74b89 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wBMG7-000000000UL-1RBI;
	Sat, 11 Apr 2026 00:31:35 +0000
Date: Sat, 11 Apr 2026 08:31:10 +0800
From: kernel test robot <lkp@intel.com>
To: Huacai Chen <chenhuacai@loongson.cn>,
	Huacai Chen <chenhuacai@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, loongarch@lists.linux.dev,
	Xuefeng Li <lixuefeng@loongson.cn>, Guo Ren <guoren@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] LoongArch: Show CPU vulnerabilites correctly
Message-ID: <202604110810.YFUm5KE1-lkp@intel.com>
References: <20260409122348.2438400-1-chenhuacai@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260409122348.2438400-1-chenhuacai@loongson.cn>

Hi Huacai,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v7.0-rc7 next-20260410]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Huacai-Chen/LoongArch-Show-CPU-vulnerabilites-correctly/20260411-011556
base:   linus/master
patch link:    https://lore.kernel.org/r/20260409122348.2438400-1-chenhuacai%40loongson.cn
patch subject: [PATCH] LoongArch: Show CPU vulnerabilites correctly
config: loongarch-randconfig-001-20260411 (https://download.01.org/0day-ci/archive/20260411/202604110810.YFUm5KE1-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260411/202604110810.YFUm5KE1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604110810.YFUm5KE1-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/loongarch/kernel/cpu-probe.c:407:36: warning: 'struct device_attribute' declared inside parameter list will not be visible outside of this definition or declaration
     407 |                             struct device_attribute *attr, char *buf)
         |                                    ^~~~~~~~~~~~~~~~
>> arch/loongarch/kernel/cpu-probe.c:406:9: warning: no previous prototype for 'cpu_show_spectre_v1' [-Wmissing-prototypes]
     406 | ssize_t cpu_show_spectre_v1(struct device *dev,
         |         ^~~~~~~~~~~~~~~~~~~


vim +407 arch/loongarch/kernel/cpu-probe.c

   405	
 > 406	ssize_t cpu_show_spectre_v1(struct device *dev,
 > 407				    struct device_attribute *attr, char *buf)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
