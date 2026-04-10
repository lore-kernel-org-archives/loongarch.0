Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57564344031;
	Fri, 10 Apr 2026 22:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775859933; cv=none; b=B1dqc4eGGIf7ZglqCYFHSCpniUzANiJ45ZRqyczXobwc+w0e9OnaOZP1szPlaDWYV89NJp5zfw7QmfZtMCohuIKi1sUzIG5KddxhYTNz/PwPpmufAClAmDenn+cfs8oBCczUBWO/Zbzder/j7rqoLoPU56CPSbBebZFZX+mmRvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775859933; c=relaxed/simple;
	bh=tXKOOaxHQjXaFcat9J2PSum//1VkTRthZogEF5a4lmU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hGgAlmOYgHzexA7iFpn9RjTPUGQYjNp2mZ70aRXSZv4I20F2EalZcK4YiPMW+K8585cHPo2jx95nWvoJzHjuPqRO9EV4DIp0UFt8rbA9yPb3JKk4tHaRtgmT+DsOyfetmarXLoAdK656KuY/oxOPEDN6f+1QxO+K6LRb9VhD6/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fqq8J0hJ; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fqq8J0hJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775859931; x=1807395931;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tXKOOaxHQjXaFcat9J2PSum//1VkTRthZogEF5a4lmU=;
  b=fqq8J0hJasHYZD3jktwDBHhpoJFqVJegqhXM/ztr8wEw4PHNjY9231Yy
   8UqLarm1KEjPuKsnQgyUnH4FiYMYVtJQIX+KDPzpK4gaT5OTgYp1RrmXZ
   82C+l2GfNRRgqAVjUQYEF1bcjKw6RMprhLi7Dq1+0fb5Fe5hlg0vObfb0
   tl1gHJ4ubKGwKxpPEJVi440VneOzi7cQc8tRAG3Bp/3Z6mp1vvkkA+hIk
   5KlDHuYxL4M+fJK9uHAc/bvAFwlFzvJwOkU9ieS0ffLH4Hof34UrqMRNC
   3++kMvMuy5OgxOgtZUaJ0wUfGtja1FUaFOQBtDUw2H1oiOvZjrUxxImyX
   A==;
X-CSE-ConnectionGUID: OjJIKjRXRC65fcZbvFio7w==
X-CSE-MsgGUID: jx34DYMwR9abWDccWa3z5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="76054990"
X-IronPort-AV: E=Sophos;i="6.23,172,1770624000"; 
   d="scan'208";a="76054990"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2026 15:25:21 -0700
X-CSE-ConnectionGUID: XwOgQgB5QR+0SvPR3cf/PA==
X-CSE-MsgGUID: BRLUpCshTsWQOTC2h5mRfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,172,1770624000"; 
   d="scan'208";a="229471007"
Received: from lkp-server01.sh.intel.com (HELO 3eaaf1a74b89) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 10 Apr 2026 15:25:18 -0700
Received: from kbuild by 3eaaf1a74b89 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wBKHr-000000000Hl-339B;
	Fri, 10 Apr 2026 22:25:15 +0000
Date: Sat, 11 Apr 2026 06:25:14 +0800
From: kernel test robot <lkp@intel.com>
To: Huacai Chen <chenhuacai@loongson.cn>,
	Huacai Chen <chenhuacai@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	loongarch@lists.linux.dev, Xuefeng Li <lixuefeng@loongson.cn>,
	Guo Ren <guoren@kernel.org>, Xuerui Wang <kernel@xen0n.name>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] LoongArch: Show CPU vulnerabilites correctly
Message-ID: <202604110604.ckBnAnTg-lkp@intel.com>
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
config: loongarch-allnoconfig (https://download.01.org/0day-ci/archive/20260411/202604110604.ckBnAnTg-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project ae825cb8cea7f3ac8e5e4096f22713845cf5e501)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260411/202604110604.ckBnAnTg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604110604.ckBnAnTg-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/loongarch/kernel/cpu-probe.c:407:15: warning: declaration of 'struct device_attribute' will not be visible outside of this function [-Wvisibility]
     407 |                             struct device_attribute *attr, char *buf)
         |                                    ^
>> arch/loongarch/kernel/cpu-probe.c:406:9: warning: no previous prototype for function 'cpu_show_spectre_v1' [-Wmissing-prototypes]
     406 | ssize_t cpu_show_spectre_v1(struct device *dev,
         |         ^
   arch/loongarch/kernel/cpu-probe.c:406:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     406 | ssize_t cpu_show_spectre_v1(struct device *dev,
         | ^
         | static 
   2 warnings generated.


vim +407 arch/loongarch/kernel/cpu-probe.c

   405	
 > 406	ssize_t cpu_show_spectre_v1(struct device *dev,
 > 407				    struct device_attribute *attr, char *buf)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
