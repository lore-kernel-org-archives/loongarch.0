Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D14C01E5B70;
	Fri, 25 Apr 2025 07:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745564748; cv=none; b=oZrNtrRUMwmjhPv1e/3/kxWSqeBA1VXuxCZpl0ntvZ4NJbGjJb5AHJDBX1bgnn62ApNVCWtN42TQJ/XfPK3xE+toNuprt0sbK6DKobGn7WETRRSFlKQp1D+VrazKZYy8LAHHB+WKu22pFLk6wq8FEi185J7yEZ6h5yIOc1zNnPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745564748; c=relaxed/simple;
	bh=N9+UJn6y4cFBdFcoyH2JNE8g1T9WsgLzOAr9war2gvE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hZeMIMB+euvjLbDmqrkizWjEZ2xqbPQN+5wD4w9XcKkRHHf3VmhJ3lYa7+nJesN7VOEQCU1raIq4oGnlJosGCPrBp1xvmhYnCfomKmCI7oT3TVzpXv6U4UjyVGYm8KHm3T9e9FIxxEpAcxYl7Gb5230GXRESpCkH3bBGk2BhURw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hinBbkYT; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hinBbkYT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745564746; x=1777100746;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=N9+UJn6y4cFBdFcoyH2JNE8g1T9WsgLzOAr9war2gvE=;
  b=hinBbkYToU10EJnDLAtL6//UlFmC8HUqYaF1fZ/3X4fDfFEZueiXfdWD
   VEBgf5NLawA+tPG/nU/jLYyK09ZytGBLgBDJcsn+C1al7yymz8vdzaqXA
   BapL7BXsiakgf7CtfN0UKCGVsJzV/pERC/YhmwxGtROIFXImrKQ5rWkXR
   JxB5HxC/+FKGA6pRbzjumqOi30p3NZt0NEgCKdzj3Cn6Sq6Ptmwt90URd
   zdzOSaX6rPRbZKJXTTlljeZnEvQ4aRxVYApH3TQa7BOkWo1G3lQA11TwS
   zm4SjkHeFDfM93OBH053/1CBan1SvC1fHhYcasXCFd4LiEm9b0fH3Su+j
   A==;
X-CSE-ConnectionGUID: hUN+NcrgREK6HFmOWif+Cw==
X-CSE-MsgGUID: QhL2aHsASbKE5DZmoP6OmA==
X-IronPort-AV: E=McAfee;i="6700,10204,11413"; a="49877222"
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; 
   d="scan'208";a="49877222"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2025 00:05:46 -0700
X-CSE-ConnectionGUID: 5XZttJ3MSH6P0E+RUKkd/w==
X-CSE-MsgGUID: wlvduCpeStiokvFAcP1zww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; 
   d="scan'208";a="163789917"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 25 Apr 2025 00:05:44 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u8D81-0004uH-0o;
	Fri, 25 Apr 2025 07:05:41 +0000
Date: Fri, 25 Apr 2025 15:05:15 +0800
From: kernel test robot <lkp@intel.com>
To: Bibo Mao <maobibo@loongson.cn>, Tianrui Zhao <zhaotianrui@loongson.cn>,
	Huacai Chen <chenhuacai@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, WANG Xuerui <kernel@xen0n.name>,
	kvm@vger.kernel.org, loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] LoongArch: KVM: Add parameter exception code with
 exception handler
Message-ID: <202504251458.EJKsZMLH-lkp@intel.com>
References: <20250424064625.3928278-2-maobibo@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250424064625.3928278-2-maobibo@loongson.cn>

Hi Bibo,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 9d7a0577c9db35c4cc52db90bc415ea248446472]

url:    https://github.com/intel-lab-lkp/linux/commits/Bibo-Mao/LoongArch-KVM-Add-parameter-exception-code-with-exception-handler/20250424-144905
base:   9d7a0577c9db35c4cc52db90bc415ea248446472
patch link:    https://lore.kernel.org/r/20250424064625.3928278-2-maobibo%40loongson.cn
patch subject: [PATCH 1/2] LoongArch: KVM: Add parameter exception code with exception handler
config: loongarch-randconfig-001-20250425 (https://download.01.org/0day-ci/archive/20250425/202504251458.EJKsZMLH-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250425/202504251458.EJKsZMLH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504251458.EJKsZMLH-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/loongarch/kvm/exit.c:734: warning: Function parameter or struct member 'ecode' not described in 'kvm_handle_fpu_disabled'


vim +734 arch/loongarch/kvm/exit.c

2737dee1067c2f Bibo Mao     2025-01-13  725  
37cdfc6dbf0416 Tianrui Zhao 2023-10-02  726  /**
37cdfc6dbf0416 Tianrui Zhao 2023-10-02  727   * kvm_handle_fpu_disabled() - Guest used fpu however it is disabled at host
37cdfc6dbf0416 Tianrui Zhao 2023-10-02  728   * @vcpu:	Virtual CPU context.
37cdfc6dbf0416 Tianrui Zhao 2023-10-02  729   *
37cdfc6dbf0416 Tianrui Zhao 2023-10-02  730   * Handle when the guest attempts to use fpu which hasn't been allowed
37cdfc6dbf0416 Tianrui Zhao 2023-10-02  731   * by the root context.
37cdfc6dbf0416 Tianrui Zhao 2023-10-02  732   */
74303fac8d0580 Bibo Mao     2025-04-24  733  static int kvm_handle_fpu_disabled(struct kvm_vcpu *vcpu, int ecode)
37cdfc6dbf0416 Tianrui Zhao 2023-10-02 @734  {
37cdfc6dbf0416 Tianrui Zhao 2023-10-02  735  	struct kvm_run *run = vcpu->run;
37cdfc6dbf0416 Tianrui Zhao 2023-10-02  736  
db1ecca22edf27 Tianrui Zhao 2023-12-19  737  	if (!kvm_guest_has_fpu(&vcpu->arch)) {
db1ecca22edf27 Tianrui Zhao 2023-12-19  738  		kvm_queue_exception(vcpu, EXCCODE_INE, 0);
db1ecca22edf27 Tianrui Zhao 2023-12-19  739  		return RESUME_GUEST;
db1ecca22edf27 Tianrui Zhao 2023-12-19  740  	}
db1ecca22edf27 Tianrui Zhao 2023-12-19  741  
37cdfc6dbf0416 Tianrui Zhao 2023-10-02  742  	/*
37cdfc6dbf0416 Tianrui Zhao 2023-10-02  743  	 * If guest FPU not present, the FPU operation should have been
37cdfc6dbf0416 Tianrui Zhao 2023-10-02  744  	 * treated as a reserved instruction!
37cdfc6dbf0416 Tianrui Zhao 2023-10-02  745  	 * If FPU already in use, we shouldn't get this at all.
37cdfc6dbf0416 Tianrui Zhao 2023-10-02  746  	 */
37cdfc6dbf0416 Tianrui Zhao 2023-10-02  747  	if (WARN_ON(vcpu->arch.aux_inuse & KVM_LARCH_FPU)) {
37cdfc6dbf0416 Tianrui Zhao 2023-10-02  748  		kvm_err("%s internal error\n", __func__);
37cdfc6dbf0416 Tianrui Zhao 2023-10-02  749  		run->exit_reason = KVM_EXIT_INTERNAL_ERROR;
37cdfc6dbf0416 Tianrui Zhao 2023-10-02  750  		return RESUME_HOST;
37cdfc6dbf0416 Tianrui Zhao 2023-10-02  751  	}
37cdfc6dbf0416 Tianrui Zhao 2023-10-02  752  
37cdfc6dbf0416 Tianrui Zhao 2023-10-02  753  	kvm_own_fpu(vcpu);
37cdfc6dbf0416 Tianrui Zhao 2023-10-02  754  
37cdfc6dbf0416 Tianrui Zhao 2023-10-02  755  	return RESUME_GUEST;
37cdfc6dbf0416 Tianrui Zhao 2023-10-02  756  }
71f4fb845874c3 Tianrui Zhao 2023-10-02  757  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
