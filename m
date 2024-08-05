Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFDAC14A609;
	Mon,  5 Aug 2024 09:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722848615; cv=none; b=l97i/rLcedAClJOwjFOUhNsbHt5D+3eOh+hxOceST9IX7YTnITBxA6DbogCAS6dRVm3sOGXE+VH3LKcqsUNPk8wmdDpUug3z082rRE21cT/Mz8wBFaNKhcgSxIqNKxpa9WJjVqbR7JzdZz6SYjr8ogiGXUMpVo2dBs2JD8MF8n4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722848615; c=relaxed/simple;
	bh=yK6i8cyC5igw8vftsB7CAJmBq3CmbKdfNlHCDnUYX0U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hiDuFYFcSVp9ylrCUOqvTNE1rg76ZDtS5z7wc78vIenR/C7uMBgOt5cvU+1NvevzAgT14ZxlAU7S5AbYbaa4GLr6qVJLUMnikgZtXdm9W10WXn+Y/UaPuSjKJ0w6Ai/MVmRXRlSjsSAMwDhcr4aPncHegDLhmU5oiFQ4v3j8Ksg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RY21xRkB; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RY21xRkB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722848614; x=1754384614;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yK6i8cyC5igw8vftsB7CAJmBq3CmbKdfNlHCDnUYX0U=;
  b=RY21xRkBeJaoHZICOZlid/pNzB7eQCkWus93M8CRUYIlgmVWF1gMtGMK
   exlTK3FCE4wfrEQg/FzQ9sWlJMxAchVgGTrKZB7DxgcpeVxKsPnyRzN6k
   tNryX1TJd/iVx7Ngkl/hXY2cYV1zKrEpM9Gy8m2DwxTsxLu7gKV7uXBjP
   RUYIvjADQ2wY64v/VKgNt73IbPFhEHf9niU11Y4Xb0vMwk3+gWDpYfI9X
   Q207HkX2qgTSbMzwpAIWeeY47oHQb/kZvU4NV9XZnIED/xuFa7+cOsDtu
   zlQPpOsKKr+r2U26WHd76CD+lhS65HHap8WLtgT6F5c/Em8fzIXO/21eg
   g==;
X-CSE-ConnectionGUID: XGTVxNphT/CpKPJaTVRVew==
X-CSE-MsgGUID: TNQEV4mOQO6KDuTdsArr4w==
X-IronPort-AV: E=McAfee;i="6700,10204,11154"; a="20467308"
X-IronPort-AV: E=Sophos;i="6.09,264,1716274800"; 
   d="scan'208";a="20467308"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2024 02:03:33 -0700
X-CSE-ConnectionGUID: vXaic2RLTaqL5H1O9BcFXw==
X-CSE-MsgGUID: COf8G/JNRS2PogOUEoj1Xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,264,1716274800"; 
   d="scan'208";a="60469933"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 05 Aug 2024 02:03:31 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1satcb-0001rE-0H;
	Mon, 05 Aug 2024 09:03:20 +0000
Date: Mon, 5 Aug 2024 17:03:02 +0800
From: kernel test robot <lkp@intel.com>
To: Tiezhu Yang <yangtiezhu@loongson.cn>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Huacai Chen <chenhuacai@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] objtool: Handle secondary stack related
 instructions
Message-ID: <202408051602.NqvBpTsv-lkp@intel.com>
References: <20240805032700.16038-3-yangtiezhu@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240805032700.16038-3-yangtiezhu@loongson.cn>

Hi Tiezhu,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.11-rc2 next-20240802]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Tiezhu-Yang/objtool-LoongArch-Decode-secondary-stack-instruction/20240805-113316
base:   linus/master
patch link:    https://lore.kernel.org/r/20240805032700.16038-3-yangtiezhu%40loongson.cn
patch subject: [PATCH v2 2/3] objtool: Handle secondary stack related instructions
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20240805/202408051602.NqvBpTsv-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240805/202408051602.NqvBpTsv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408051602.NqvBpTsv-lkp@intel.com/

All errors (new ones prefixed by >>):

   scripts/genksyms/parse.y: warning: 9 shift/reduce conflicts [-Wconflicts-sr]
   scripts/genksyms/parse.y: warning: 5 reduce/reduce conflicts [-Wconflicts-rr]
   scripts/genksyms/parse.y: note: rerun with option '-Wcounterexamples' to generate conflict counterexamples
>> check.c:3009:22: error: use of undeclared identifier 'CFI_FP'
    3009 |                                 if (cfa->base == CFI_FP && cfa->offset == 0) {
         |                                                  ^
   1 error generated.
   make[5]: *** [tools/build/Makefile.build:105: tools/objtool/check.o] Error 1
   make[5]: *** Waiting for unfinished jobs....
   make[4]: *** [Makefile:70: tools/objtool/objtool-in.o] Error 2
   make[3]: *** [Makefile:72: objtool] Error 2
   make[2]: *** [Makefile:1360: tools/objtool] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:224: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:224: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
