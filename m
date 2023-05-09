Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAC8519919;
	Tue,  9 May 2023 20:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683665573; x=1715201573;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Qb7JnGYGX/q0kXPU2rhDE3PwsSlBsEq5dhBfzcKgApM=;
  b=i3PHbBadZy2H0g8SxYX0ucuOcRtd7uTB2v4DdfB12sV6MzelfQgktc41
   Vd03eIZQoQ9SN+QdBx6ZNdVQgpvGFvV/AZjNj2GOSPBgTkbr/2qiIgNuD
   MGlA1g8gzy0dqh/UTabLKF40tekgXJiuADrmdSuoINjISw1WJ9TTW+F6N
   rerhIO993JNuWY4ZjztysRbdy7lIvbgy5QKu5wiWm2/dSlGQAHjZCo+v6
   h8UvQx6/VfvwsS0F4nMBKQBlkxBsCPVF/2QW7SZae/X9o6fuoZ63X1eJP
   hAJKC+tig8YnaBiIQcAyahG3uzA0qejFlex8HHNh8KzkDwkqhWGg4Ww1z
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="350081850"
X-IronPort-AV: E=Sophos;i="5.99,262,1677571200"; 
   d="scan'208";a="350081850"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2023 13:52:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="649486667"
X-IronPort-AV: E=Sophos;i="5.99,262,1677571200"; 
   d="scan'208";a="649486667"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 09 May 2023 13:52:50 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pwUKH-0002UO-0a;
	Tue, 09 May 2023 20:52:49 +0000
Date: Wed, 10 May 2023 04:51:57 +0800
From: kernel test robot <lkp@intel.com>
To: Youling Tang <tangyouling@loongson.cn>,
	Huacai Chen <chenhuacai@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Jonathan Corbet <corbet@lwn.net>,
	Peter Zijlstra <peterz@infradead.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Jason Baron <jbaron@akamai.com>, WANG Xuerui <kernel@xen0n.name>,
	Zhangjin Wu <falcon@tinylab.org>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev
Subject: Re: [PATCH] LoongArch: Add jump-label implementation
Message-ID: <202305100412.gazWW71q-lkp@intel.com>
References: <1683617390-18015-1-git-send-email-tangyouling@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1683617390-18015-1-git-send-email-tangyouling@loongson.cn>

Hi Youling,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.4-rc1 next-20230509]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Youling-Tang/LoongArch-Add-jump-label-implementation/20230509-153154
base:   linus/master
patch link:    https://lore.kernel.org/r/1683617390-18015-1-git-send-email-tangyouling%40loongson.cn
patch subject: [PATCH] LoongArch: Add jump-label implementation
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20230510/202305100412.gazWW71q-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/369827734136be509a0c817517fed12548d9c41f
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Youling-Tang/LoongArch-Add-jump-label-implementation/20230509-153154
        git checkout 369827734136be509a0c817517fed12548d9c41f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=loongarch olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=loongarch prepare

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305100412.gazWW71q-lkp@intel.com/

All errors (new ones prefixed by >>):

   scripts/genksyms/parse.y: warning: 9 shift/reduce conflicts [-Wconflicts-sr]
   scripts/genksyms/parse.y: warning: 5 reduce/reduce conflicts [-Wconflicts-rr]
   scripts/genksyms/parse.y: note: rerun with option '-Wcounterexamples' to generate conflict counterexamples
   In file included from include/linux/cpumask.h:16,
                    from arch/loongarch/include/asm/processor.h:9,
                    from arch/loongarch/include/asm/thread_info.h:15,
                    from arch/loongarch/include/asm/ptrace.h:10,
                    from arch/loongarch/include/asm/inst.h:10,
                    from arch/loongarch/include/asm/jump_label.h:13,
                    from include/linux/jump_label.h:112,
                    from include/linux/dynamic_debug.h:6,
                    from include/linux/printk.h:564,
                    from include/asm-generic/bug.h:22,
                    from arch/loongarch/include/asm/bug.h:59,
                    from include/linux/bug.h:5,
                    from include/linux/fortify-string.h:5,
                    from include/linux/string.h:254,
                    from include/linux/uuid.h:11,
                    from include/linux/mod_devicetable.h:14,
                    from scripts/mod/devicetable-offsets.c:3:
   include/linux/numa.h: In function 'phys_to_target_node':
>> include/linux/numa.h:41:9: error: implicit declaration of function 'pr_info_once' [-Werror=implicit-function-declaration]
      41 |         pr_info_once("Unknown target node for memory at 0x%llx, assuming node 0\n",
         |         ^~~~~~~~~~~~
   include/linux/cpumask.h: In function 'cpu_max_bits_warn':
>> include/linux/cpumask.h:143:9: error: implicit declaration of function 'WARN_ON_ONCE' [-Werror=implicit-function-declaration]
     143 |         WARN_ON_ONCE(cpu >= bits);
         |         ^~~~~~~~~~~~
   cc1: some warnings being treated as errors
   make[2]: *** [scripts/Makefile.build:114: scripts/mod/devicetable-offsets.s] Error 1
   make[2]: Target 'scripts/mod/' not remade because of errors.
   make[1]: *** [Makefile:1286: prepare0] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:226: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +/pr_info_once +41 include/linux/numa.h

a927bd6ba952d1 Dan Williams 2020-11-21  29  
a927bd6ba952d1 Dan Williams 2020-11-21  30  #ifndef memory_add_physaddr_to_nid
a927bd6ba952d1 Dan Williams 2020-11-21  31  static inline int memory_add_physaddr_to_nid(u64 start)
a927bd6ba952d1 Dan Williams 2020-11-21  32  {
a927bd6ba952d1 Dan Williams 2020-11-21  33  	pr_info_once("Unknown online node for memory at 0x%llx, assuming node 0\n",
a927bd6ba952d1 Dan Williams 2020-11-21  34  			start);
a927bd6ba952d1 Dan Williams 2020-11-21  35  	return 0;
a927bd6ba952d1 Dan Williams 2020-11-21  36  }
a927bd6ba952d1 Dan Williams 2020-11-21  37  #endif
a927bd6ba952d1 Dan Williams 2020-11-21  38  #ifndef phys_to_target_node
a927bd6ba952d1 Dan Williams 2020-11-21  39  static inline int phys_to_target_node(u64 start)
a927bd6ba952d1 Dan Williams 2020-11-21  40  {
a927bd6ba952d1 Dan Williams 2020-11-21 @41  	pr_info_once("Unknown target node for memory at 0x%llx, assuming node 0\n",
a927bd6ba952d1 Dan Williams 2020-11-21  42  			start);
a927bd6ba952d1 Dan Williams 2020-11-21  43  	return 0;
a927bd6ba952d1 Dan Williams 2020-11-21  44  }
a927bd6ba952d1 Dan Williams 2020-11-21  45  #endif
a927bd6ba952d1 Dan Williams 2020-11-21  46  #else /* !CONFIG_NUMA */
b2ca916ce392a9 Dan Williams 2020-02-16  47  static inline int numa_map_to_online_node(int node)
b2ca916ce392a9 Dan Williams 2020-02-16  48  {
b2ca916ce392a9 Dan Williams 2020-02-16  49  	return NUMA_NO_NODE;
b2ca916ce392a9 Dan Williams 2020-02-16  50  }
a927bd6ba952d1 Dan Williams 2020-11-21  51  static inline int memory_add_physaddr_to_nid(u64 start)
a927bd6ba952d1 Dan Williams 2020-11-21  52  {
a927bd6ba952d1 Dan Williams 2020-11-21  53  	return 0;
a927bd6ba952d1 Dan Williams 2020-11-21  54  }
a927bd6ba952d1 Dan Williams 2020-11-21  55  static inline int phys_to_target_node(u64 start)
a927bd6ba952d1 Dan Williams 2020-11-21  56  {
a927bd6ba952d1 Dan Williams 2020-11-21  57  	return 0;
a927bd6ba952d1 Dan Williams 2020-11-21  58  }
b2ca916ce392a9 Dan Williams 2020-02-16  59  #endif
b2ca916ce392a9 Dan Williams 2020-02-16  60  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
