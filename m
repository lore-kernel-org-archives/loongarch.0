Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F16C257B
	for <loongarch@lists.linux.dev>; Sat, 20 Aug 2022 13:42:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1661002961; x=1692538961;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=iexoknRdZO8MIYIKYXuEtw0U6bQsXW3zlgVWn9jTCco=;
  b=f9Ni/sR1cjCJjlbaWyBJoZUzJDoIpIsL2/CphIFPhXjErPX/YG/TBAHt
   bVIeylF3YUNe6GLr3Lm2+PT3nlUZIN7uBAvli+GBffq+aiEZ3uGk/+8WZ
   Z7x1UfWHXZe5mKXMQMeG7UZfc6c+ga5+vUGQLpt3HI42vTfGt7RygPLS3
   kRECjH2LaG7iT7+qpMyTXkLbFPRNFJaMC2OzKC3xqgrojUUZZJ0L1cpwk
   IjMcoSEjw3AQR8oLbaITUy1zxSRuYG29Pi1x3J+toCSjQYWoeBeYi5Ag3
   wdo6mtBiZOA2Ni4Mznlea4ogVbth2/dbWfMopNhF6bwVhGM1vs122k1UU
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10445"; a="272935007"
X-IronPort-AV: E=Sophos;i="5.93,251,1654585200"; 
   d="scan'208";a="272935007"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2022 06:42:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,251,1654585200"; 
   d="scan'208";a="676731705"
Received: from lkp-server01.sh.intel.com (HELO 44b6dac04a33) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 20 Aug 2022 06:42:30 -0700
Received: from kbuild by 44b6dac04a33 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oPOk9-0002jR-1o;
	Sat, 20 Aug 2022 13:42:29 +0000
Date: Sat, 20 Aug 2022 21:41:43 +0800
From: kernel test robot <lkp@intel.com>
To: Tiezhu Yang <yangtiezhu@loongson.cn>,
	Huacai Chen <chenhuacai@kernel.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>
Cc: kbuild-all@lists.01.org, bpf@vger.kernel.org, loongarch@lists.linux.dev
Subject: Re: [PATCH bpf-next v1 3/4] LoongArch: Add BPF JIT support
Message-ID: <202208202131.KsF0Aoos-lkp@intel.com>
References: <1660996260-11337-4-git-send-email-yangtiezhu@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1660996260-11337-4-git-send-email-yangtiezhu@loongson.cn>

Hi Tiezhu,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.0-rc1 next-20220819]
[cannot apply to bpf-next/master bpf/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Tiezhu-Yang/Add-BPF-JIT-support-for-LoongArch/20220820-195351
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 50cd95ac46548429e5bba7ca75cc97d11a697947
config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20220820/202208202131.KsF0Aoos-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/ebe9a0ace4f1fb110c43c347808c81cb07dfeb9b
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Tiezhu-Yang/Add-BPF-JIT-support-for-LoongArch/20220820-195351
        git checkout ebe9a0ace4f1fb110c43c347808c81cb07dfeb9b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=loongarch SHELL=/bin/bash arch/loongarch/net/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> arch/loongarch/net/bpf_jit.c:194:6: warning: no previous prototype for 'build_epilogue' [-Wmissing-prototypes]
     194 | void build_epilogue(struct jit_ctx *ctx)
         |      ^~~~~~~~~~~~~~


vim +/build_epilogue +194 arch/loongarch/net/bpf_jit.c

   193	
 > 194	void build_epilogue(struct jit_ctx *ctx)
   195	{
   196		__build_epilogue(ctx, false);
   197	}
   198	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
