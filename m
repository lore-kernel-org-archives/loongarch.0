Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9895563AB;
	Fri, 10 Feb 2023 18:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676052176; x=1707588176;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Ga/44LVjbV6mU/2wo9st/9uoyErb7dNgMErkJHuhkWU=;
  b=Kbo0oGIVxgymS5rZBeD7jZBZUpYwiwptx7IkQ2j5De4b6lMYpP2UxNms
   a7jmp1378mVgz+FIB18i7t7tx46OnF1s+ovLD4/JQSc6mScKY597BCP7H
   +dYfksZ5SXuACYZlsUGqdQqRSQeXoE3BqqVTgtQx198/qGcb1jxNQjeAv
   zb1aDjZuisAvAPga39YO1QZG9hIc8cCllYc9GUgCe3RtYhDhccY9DShN+
   PLxCRUY8ovBOiGwhWTraRI1g0JKXSOQLST2Z6BlHzyG7DZGw07FKCbAqm
   fpK+OxMR7Z+3+kpnXBD+JEMZUvmlHB01qNdJUN5dkbR2TRoqTqaX1UVYp
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10617"; a="329116701"
X-IronPort-AV: E=Sophos;i="5.97,287,1669104000"; 
   d="scan'208";a="329116701"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2023 10:01:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10617"; a="997007731"
X-IronPort-AV: E=Sophos;i="5.97,287,1669104000"; 
   d="scan'208";a="997007731"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 10 Feb 2023 10:01:42 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pQXiP-0005xM-39;
	Fri, 10 Feb 2023 18:01:41 +0000
Date: Sat, 11 Feb 2023 02:01:40 +0800
From: kernel test robot <lkp@intel.com>
To: Youling Tang <tangyouling@loongson.cn>,
	Huacai Chen <chenhuacai@kernel.org>, Xi Ruoyao <xry111@xry111.site>,
	Jinyang He <hejinyang@loongson.cn>
Cc: oe-kbuild-all@lists.linux.dev, Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 4/5] LoongArch: Add support for kernel relocation
Message-ID: <202302110150.tIuRIiTp-lkp@intel.com>
References: <1676018856-26520-5-git-send-email-tangyouling@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1676018856-26520-5-git-send-email-tangyouling@loongson.cn>

Hi Youling,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.2-rc7 next-20230210]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Youling-Tang/LoongArch-Use-la-pcrel-instead-of-la-abs-when-it-s-trivially-possible/20230210-165022
patch link:    https://lore.kernel.org/r/1676018856-26520-5-git-send-email-tangyouling%40loongson.cn
patch subject: [PATCH v4 4/5] LoongArch: Add support for kernel relocation
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20230211/202302110150.tIuRIiTp-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/26dc7750408c7f232632db44fab905df7b48d83c
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Youling-Tang/LoongArch-Use-la-pcrel-instead-of-la-abs-when-it-s-trivially-possible/20230210-165022
        git checkout 26dc7750408c7f232632db44fab905df7b48d83c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=loongarch olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=loongarch SHELL=/bin/bash arch/loongarch/kernel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302110150.tIuRIiTp-lkp@intel.com/

Note: functions only called from assembly code should be annotated with the asmlinkage attribute
All warnings (new ones prefixed by >>):

>> arch/loongarch/kernel/relocate.c:21:13: warning: no previous prototype for 'relocate_kernel' [-Wmissing-prototypes]
      21 | void __init relocate_kernel(void)
         |             ^~~~~~~~~~~~~~~


vim +/relocate_kernel +21 arch/loongarch/kernel/relocate.c

    20	
  > 21	void __init relocate_kernel(void)
    22	{
    23		reloc_offset = (unsigned long)_text - VMLINUX_LOAD_ADDRESS;
    24	
    25		if (reloc_offset) {
    26			Elf64_Rela *rela, *rela_end;
    27			rela = (Elf64_Rela *)&__rela_dyn_start;
    28			rela_end = (Elf64_Rela *)&__rela_dyn_end;
    29	
    30			for ( ; rela < rela_end; rela++) {
    31				Elf64_Addr addr = rela->r_offset;
    32				Elf64_Addr relocated_addr = rela->r_addend;
    33	
    34				if (rela->r_info != R_LARCH_RELATIVE)
    35					continue;
    36	
    37				if (relocated_addr >= VMLINUX_LOAD_ADDRESS)
    38					relocated_addr =
    39						(Elf64_Addr)RELOCATED(relocated_addr);
    40	
    41				*(Elf64_Addr *)RELOCATED(addr) = relocated_addr;
    42			}
    43		}
    44	}
    45	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
