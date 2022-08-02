Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7388D7F
	for <loongarch@lists.linux.dev>; Tue,  2 Aug 2022 19:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1659467973; x=1691003973;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nz50+w4dK5p6Z3tRjI+NPVS2mMKz+Ao0KIEo27hMUKk=;
  b=UuX5t01CM3CPQfTNWDMzoTcg8Xp2l30m8+9Y8T1mL4XkV7OTHzWivEfb
   VRqAK/rmjunyVBj/vQbofQJqHhVPkU84bgfpPAgZSn7DtHLHgDUwiqfM2
   husGeKjEwqfomgRhtxcYEEJYfh0VedZC1Im2CxBsIQAFVT4WqZwlRmSCh
   Y6/DipHkzwBCOBpl/PfrjGvNfG7Gy7RWbq9HJzAn/++wsNeADtFV75cc7
   kxigPIaZ5jwONHZW4lh3vtKZOGpb0GXAz2oVMnDpt+zLU0OQxVaZQi5YA
   N243ZGJPLg7MlpyVCo/WQeZGmTbef/YdgbnwluWvnUVo6OHYy8rR/J5s6
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10427"; a="287060103"
X-IronPort-AV: E=Sophos;i="5.93,211,1654585200"; 
   d="scan'208";a="287060103"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2022 12:19:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,211,1654585200"; 
   d="scan'208";a="602552591"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 02 Aug 2022 12:19:30 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oIxQP-000GL1-1y;
	Tue, 02 Aug 2022 19:19:29 +0000
Date: Wed, 3 Aug 2022 03:18:54 +0800
From: kernel test robot <lkp@intel.com>
To: Qing Zhang <zhangqing@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>
Cc: kbuild-all@lists.01.org, loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
	hejinyang@loongson.cn
Subject: Re: [PATCH 3/3] LoongArch: Add stacktrace support
Message-ID: <202208030339.bOMzIpUt-lkp@intel.com>
References: <20220728140519.5420-3-zhangqing@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220728140519.5420-3-zhangqing@loongson.cn>

Hi Qing,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on linus/master]
[also build test WARNING on v5.19 next-20220728]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Qing-Zhang/LoongArch-Add-guess-unwinder-support/20220728-220739
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 6e7765cb477a9753670d4351d14de93f1e9dbbd4
config: loongarch-randconfig-s043-20220801 (https://download.01.org/0day-ci/archive/20220803/202208030339.bOMzIpUt-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/intel-lab-lkp/linux/commit/32ef6acf6f5ecfadda21be77cbebb07b1c69e56a
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Qing-Zhang/LoongArch-Add-guess-unwinder-support/20220728-220739
        git checkout 32ef6acf6f5ecfadda21be77cbebb07b1c69e56a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=loongarch SHELL=/bin/bash kernel/locking/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

sparse warnings: (new ones prefixed by >>)
   kernel/locking/lockdep.c:110:1: sparse: sparse: symbol '__pcpu_scope_lockdep_recursion' was not declared. Should it be static?
>> kernel/locking/lockdep.c:118:13: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   kernel/locking/lockdep.c:118:13: sparse:     expected void *ptr
   kernel/locking/lockdep.c:118:13: sparse:     got unsigned int [noderef] __percpu *
>> kernel/locking/lockdep.c:118:13: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   kernel/locking/lockdep.c:118:13: sparse:     expected void *ptr
   kernel/locking/lockdep.c:118:13: sparse:     got unsigned int [noderef] __percpu *
>> kernel/locking/lockdep.c:118:13: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   kernel/locking/lockdep.c:118:13: sparse:     expected void *ptr
   kernel/locking/lockdep.c:118:13: sparse:     got unsigned int [noderef] __percpu *
>> kernel/locking/lockdep.c:118:13: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   kernel/locking/lockdep.c:118:13: sparse:     expected void *ptr
   kernel/locking/lockdep.c:118:13: sparse:     got unsigned int [noderef] __percpu *
>> kernel/locking/lockdep.c:118:13: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   kernel/locking/lockdep.c:118:13: sparse:     expected void *ptr
   kernel/locking/lockdep.c:118:13: sparse:     got unsigned int [noderef] __percpu *
>> kernel/locking/lockdep.c:118:13: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   kernel/locking/lockdep.c:118:13: sparse:     expected void *ptr
   kernel/locking/lockdep.c:118:13: sparse:     got unsigned int [noderef] __percpu *
>> kernel/locking/lockdep.c:118:13: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   kernel/locking/lockdep.c:118:13: sparse:     expected void *ptr
   kernel/locking/lockdep.c:118:13: sparse:     got unsigned int [noderef] __percpu *
>> kernel/locking/lockdep.c:118:13: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   kernel/locking/lockdep.c:118:13: sparse:     expected void *ptr
   kernel/locking/lockdep.c:118:13: sparse:     got unsigned int [noderef] __percpu *
>> kernel/locking/lockdep.c:118:13: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   kernel/locking/lockdep.c:118:13: sparse:     expected void *ptr
   kernel/locking/lockdep.c:118:13: sparse:     got unsigned int [noderef] __percpu *
>> kernel/locking/lockdep.c:118:13: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   kernel/locking/lockdep.c:118:13: sparse:     expected void *ptr
   kernel/locking/lockdep.c:118:13: sparse:     got unsigned int [noderef] __percpu *
>> kernel/locking/lockdep.c:118:13: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   kernel/locking/lockdep.c:118:13: sparse:     expected void *ptr
   kernel/locking/lockdep.c:118:13: sparse:     got unsigned int [noderef] __percpu *
>> kernel/locking/lockdep.c:118:13: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   kernel/locking/lockdep.c:118:13: sparse:     expected void *ptr
   kernel/locking/lockdep.c:118:13: sparse:     got unsigned int [noderef] __percpu *
>> kernel/locking/lockdep.c:118:13: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   kernel/locking/lockdep.c:118:13: sparse:     expected void *ptr
   kernel/locking/lockdep.c:118:13: sparse:     got unsigned int [noderef] __percpu *
>> kernel/locking/lockdep.c:118:13: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   kernel/locking/lockdep.c:118:13: sparse:     expected void *ptr
   kernel/locking/lockdep.c:118:13: sparse:     got unsigned int [noderef] __percpu *
>> kernel/locking/lockdep.c:118:13: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   kernel/locking/lockdep.c:118:13: sparse:     expected void *ptr
   kernel/locking/lockdep.c:118:13: sparse:     got unsigned int [noderef] __percpu *
>> kernel/locking/lockdep.c:118:13: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   kernel/locking/lockdep.c:118:13: sparse:     expected void *ptr
   kernel/locking/lockdep.c:118:13: sparse:     got unsigned int [noderef] __percpu *
>> kernel/locking/lockdep.c:118:13: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   kernel/locking/lockdep.c:118:13: sparse:     expected void *ptr
   kernel/locking/lockdep.c:118:13: sparse:     got unsigned int [noderef] __percpu *
>> kernel/locking/lockdep.c:118:13: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   kernel/locking/lockdep.c:118:13: sparse:     expected void *ptr
   kernel/locking/lockdep.c:118:13: sparse:     got unsigned int [noderef] __percpu *
>> kernel/locking/lockdep.c:118:13: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   kernel/locking/lockdep.c:118:13: sparse:     expected void *ptr
   kernel/locking/lockdep.c:118:13: sparse:     got unsigned int [noderef] __percpu *
>> kernel/locking/lockdep.c:118:13: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   kernel/locking/lockdep.c:118:13: sparse:     expected void *ptr
   kernel/locking/lockdep.c:118:13: sparse:     got unsigned int [noderef] __percpu *
>> kernel/locking/lockdep.c:118:13: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   kernel/locking/lockdep.c:118:13: sparse:     expected void *ptr
   kernel/locking/lockdep.c:118:13: sparse:     got unsigned int [noderef] __percpu *
>> kernel/locking/lockdep.c:118:13: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   kernel/locking/lockdep.c:118:13: sparse:     expected void *ptr
   kernel/locking/lockdep.c:118:13: sparse:     got unsigned int [noderef] __percpu *
>> kernel/locking/lockdep.c:118:13: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   kernel/locking/lockdep.c:118:13: sparse:     expected void *ptr
   kernel/locking/lockdep.c:118:13: sparse:     got unsigned int [noderef] __percpu *
>> kernel/locking/lockdep.c:118:13: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   kernel/locking/lockdep.c:118:13: sparse:     expected void *ptr
   kernel/locking/lockdep.c:118:13: sparse:     got unsigned int [noderef] __percpu *
>> kernel/locking/lockdep.c:118:13: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   kernel/locking/lockdep.c:118:13: sparse:     expected void *ptr
   kernel/locking/lockdep.c:118:13: sparse:     got unsigned int [noderef] __percpu *
>> kernel/locking/lockdep.c:118:13: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   kernel/locking/lockdep.c:118:13: sparse:     expected void *ptr
   kernel/locking/lockdep.c:118:13: sparse:     got unsigned int [noderef] __percpu *
>> kernel/locking/lockdep.c:118:13: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   kernel/locking/lockdep.c:118:13: sparse:     expected void *ptr
   kernel/locking/lockdep.c:118:13: sparse:     got unsigned int [noderef] __percpu *
>> kernel/locking/lockdep.c:118:13: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   kernel/locking/lockdep.c:118:13: sparse:     expected void *ptr
   kernel/locking/lockdep.c:118:13: sparse:     got unsigned int [noderef] __percpu *
>> kernel/locking/lockdep.c:118:13: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   kernel/locking/lockdep.c:118:13: sparse:     expected void *ptr
   kernel/locking/lockdep.c:118:13: sparse:     got unsigned int [noderef] __percpu *
>> kernel/locking/lockdep.c:118:13: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   kernel/locking/lockdep.c:118:13: sparse:     expected void *ptr
   kernel/locking/lockdep.c:118:13: sparse:     got unsigned int [noderef] __percpu *
>> kernel/locking/lockdep.c:118:13: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   kernel/locking/lockdep.c:118:13: sparse:     expected void *ptr
   kernel/locking/lockdep.c:118:13: sparse:     got unsigned int [noderef] __percpu *
>> kernel/locking/lockdep.c:118:13: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   kernel/locking/lockdep.c:118:13: sparse:     expected void *ptr
   kernel/locking/lockdep.c:118:13: sparse:     got unsigned int [noderef] __percpu *
>> kernel/locking/lockdep.c:118:13: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   kernel/locking/lockdep.c:118:13: sparse:     expected void *ptr
   kernel/locking/lockdep.c:118:13: sparse:     got unsigned int [noderef] __percpu *
>> kernel/locking/lockdep.c:118:13: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   kernel/locking/lockdep.c:118:13: sparse:     expected void *ptr
   kernel/locking/lockdep.c:118:13: sparse:     got unsigned int [noderef] __percpu *
>> kernel/locking/lockdep.c:118:13: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   kernel/locking/lockdep.c:118:13: sparse:     expected void *ptr
   kernel/locking/lockdep.c:118:13: sparse:     got unsigned int [noderef] __percpu *
>> kernel/locking/lockdep.c:118:13: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   kernel/locking/lockdep.c:118:13: sparse:     expected void *ptr
   kernel/locking/lockdep.c:118:13: sparse:     got unsigned int [noderef] __percpu *
>> kernel/locking/lockdep.c:118:13: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   kernel/locking/lockdep.c:118:13: sparse:     expected void *ptr
   kernel/locking/lockdep.c:118:13: sparse:     got unsigned int [noderef] __percpu *
>> kernel/locking/lockdep.c:118:13: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   kernel/locking/lockdep.c:118:13: sparse:     expected void *ptr
   kernel/locking/lockdep.c:118:13: sparse:     got unsigned int [noderef] __percpu *
>> kernel/locking/lockdep.c:118:13: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   kernel/locking/lockdep.c:118:13: sparse:     expected void *ptr
   kernel/locking/lockdep.c:118:13: sparse:     got unsigned int [noderef] __percpu *
>> kernel/locking/lockdep.c:118:13: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   kernel/locking/lockdep.c:118:13: sparse:     expected void *ptr
   kernel/locking/lockdep.c:118:13: sparse:     got unsigned int [noderef] __percpu *
>> kernel/locking/lockdep.c:118:13: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   kernel/locking/lockdep.c:118:13: sparse:     expected void *ptr
   kernel/locking/lockdep.c:118:13: sparse:     got unsigned int [noderef] __percpu *
>> kernel/locking/lockdep.c:118:13: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   kernel/locking/lockdep.c:118:13: sparse:     expected void *ptr
   kernel/locking/lockdep.c:118:13: sparse:     got unsigned int [noderef] __percpu *
>> kernel/locking/lockdep.c:118:13: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   kernel/locking/lockdep.c:118:13: sparse:     expected void *ptr
   kernel/locking/lockdep.c:118:13: sparse:     got unsigned int [noderef] __percpu *
>> kernel/locking/lockdep.c:118:13: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   kernel/locking/lockdep.c:118:13: sparse:     expected void *ptr
   kernel/locking/lockdep.c:118:13: sparse:     got unsigned int [noderef] __percpu *

vim +118 kernel/locking/lockdep.c

4d004099a668c4 Peter Zijlstra 2020-10-02  112  
0afda3a888dccf Peter Zijlstra 2021-01-06  113  static __always_inline bool lockdep_enabled(void)
4d004099a668c4 Peter Zijlstra 2020-10-02  114  {
4d004099a668c4 Peter Zijlstra 2020-10-02  115  	if (!debug_locks)
4d004099a668c4 Peter Zijlstra 2020-10-02  116  		return false;
4d004099a668c4 Peter Zijlstra 2020-10-02  117  
d48e3850030623 Peter Zijlstra 2020-10-26 @118  	if (this_cpu_read(lockdep_recursion))
4d004099a668c4 Peter Zijlstra 2020-10-02  119  		return false;
4d004099a668c4 Peter Zijlstra 2020-10-02  120  
4d004099a668c4 Peter Zijlstra 2020-10-02  121  	if (current->lockdep_recursion)
4d004099a668c4 Peter Zijlstra 2020-10-02  122  		return false;
4d004099a668c4 Peter Zijlstra 2020-10-02  123  
4d004099a668c4 Peter Zijlstra 2020-10-02  124  	return true;
4d004099a668c4 Peter Zijlstra 2020-10-02  125  }
4d004099a668c4 Peter Zijlstra 2020-10-02  126  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
