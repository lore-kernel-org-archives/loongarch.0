Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A335D39FCA5;
	Tue,  7 Apr 2026 15:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775575345; cv=none; b=odz51jksSs08aMuydID0HLwj4IQ6xrGlGHghzuDfWpAOZU9sS/8HmE1h5oJvACYQsdAbnZkEw2xyQLQhvdPmNt0TpYtqN7kmRFPrXDtUGP2j7dXxcKYMnEuFtLZOOSfGH7NAkPK7WP/6QqOebfa26ran1lfvJq+VFHiy/OzqP7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775575345; c=relaxed/simple;
	bh=1tJVwajwStaJiW35ZoXT6KUci38I5ZYjNFoqJGCE/po=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K9LBBgBsQDg7hjt6vWr+AeYCP/6lGWsT/KB3r72nuK8eQgUFs/nurqAVp5XCJ4B+fKpKtMjwwSsVDFSL+t5RJQi5amFrCewVG+viMtTQz4bEvWttS5JzEKzCETeodTHcYkL3zCwITSeNIXeafiOtcj4SNCWMXEpKtRyw1ue81n8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UKXvwq+A; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UKXvwq+A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775575337; x=1807111337;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1tJVwajwStaJiW35ZoXT6KUci38I5ZYjNFoqJGCE/po=;
  b=UKXvwq+AHCS3xqhxueSmQp6wnGf1mwHViJebVYoR1kIzx7fxOdIDJuDt
   YLuVpHYpVpjMcYKXv6PiARL8RNBZxBQqm0/eB9Qfs75dwywBtTCAX8rzk
   w7JuUebpDJptRyjcGmxcHmTtJHQa115UnqOZZjLs00q3bXq2UOTvjXDKE
   pGd4sMYs+es+/rVXmKX3pYnNN80FfsYD9iDYAY0ccVWSy2VMHNQKk9140
   0A8F8LCYnQW4KYzbi/uIZ/s6njsZanBsJaVEleTsOv9rgGtjoUW5V0nlV
   nY534aGYqa9XPNbJdjAdKL76MQY9TmSTf45L6iZ1frI2RYaNKCcxjcBnr
   g==;
X-CSE-ConnectionGUID: L8/m3eH4RM+45GiDiCWc2w==
X-CSE-MsgGUID: seCH/zBjTCCoK3O1zc0ESQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11752"; a="76505939"
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; 
   d="scan'208";a="76505939"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2026 08:22:12 -0700
X-CSE-ConnectionGUID: GFvaF7A4SAiTO1Hp3csw9w==
X-CSE-MsgGUID: ATKRYI8HSh25TYy1tIwZFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; 
   d="scan'208";a="227187059"
Received: from lkp-server01.sh.intel.com (HELO d00eb8a6782a) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 07 Apr 2026 08:22:09 -0700
Received: from kbuild by d00eb8a6782a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wA8Fh-000000000jV-3hQl;
	Tue, 07 Apr 2026 15:22:05 +0000
Date: Tue, 7 Apr 2026 23:21:14 +0800
From: kernel test robot <lkp@intel.com>
To: Xi Ruoyao <xry111@xry111.site>, Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	loongarch@lists.linux.dev, Zixing Liu <liushuyu@aosc.io>,
	Mingcong Bai <jeffbai@aosc.io>, Xi Ruoyao <xry111@xry111.site>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Yangyang Lian <lianyangyang@kylinos.cn>,
	Yawei Li <liyawei@loongson.cn>, George Guo <dongtai.guo@linux.dev>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] LoongArch: detect and disable sc.q if erratic
Message-ID: <202604072314.9J2SQEFo-lkp@intel.com>
References: <20260402044732.164294-2-xry111@xry111.site>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260402044732.164294-2-xry111@xry111.site>

Hi Xi,

kernel test robot noticed the following build errors:

[auto build test ERROR on soc/for-next]
[also build test ERROR on linus/master v7.0-rc7 next-20260406]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Xi-Ruoyao/LoongArch-detect-and-disable-sc-q-if-erratic/20260407-193425
base:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git for-next
patch link:    https://lore.kernel.org/r/20260402044732.164294-2-xry111%40xry111.site
patch subject: [PATCH] LoongArch: detect and disable sc.q if erratic
config: loongarch-allnoconfig (https://download.01.org/0day-ci/archive/20260407/202604072314.9J2SQEFo-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project c80443cd37b2e2788cba67ffa180a6331e5f0791)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260407/202604072314.9J2SQEFo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604072314.9J2SQEFo-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/loongarch/kernel/cpu-probe.c:151:23: error: invalid operand for instruction
     151 |                 "move\t%[tmp], $r0\n\t"
         |                                     ^
   <inline asm>:3:22: note: instantiated into assembly here
       3 |         sc.q    $a2, $a0, $a1, 0
         |                                ^
   1 error generated.


vim +151 arch/loongarch/kernel/cpu-probe.c

   134	
   135	/*
   136	 * Some LoongArch has broken sc.q which incorrectly handles the upper word
   137	 * when the lower word is zero. Newer firmware versions (such as the 202602
   138	 * release from Loongson) seem to contain a workaround for this issue.
   139	 *
   140	 * Disable sc.q if erratic to ensure reliability and compatibility.
   141	 */
   142	static bool sc_q_is_sane(void)
   143	{
   144		struct {
   145			long word[2];
   146		} __aligned(16) mem;
   147		register long tmp;
   148	
   149		asm (
   150			"1:ll.d\t$r0, %[mem]\n\t"
 > 151			"move\t%[tmp], $r0\n\t"
   152			"sc.q\t%[tmp], %[one], %[mem]\n\t"
   153			"beqz\t%[tmp], 1b"
   154			: [mem] "=ZB" (mem), [tmp] "=&r" (tmp)
   155			: [one] "r" (1));
   156	
   157		if (mem.word[1] != 1) {
   158			pr_warn_once("Warning: sc.q is erratic on this platform, disabling for both kernel and HWCAP. Please try a firmware update.");
   159			return false;
   160		}
   161	
   162		return true;
   163	}
   164	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
