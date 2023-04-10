Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 097F415AE;
	Mon, 10 Apr 2023 01:37:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681090627; x=1712626627;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kM3MVlxT3U4OwC09SKYW+x+Zuer/Bey+4Mm+quIUoZI=;
  b=b232ZjDR2kbXrLer8y0oe+8gbWhGJeVfgOSajqgMQy7HEO1oK3AonP0u
   aCfe3GshMDgAZnhwHnPHBBGl3BFjOW1hIM+FTGMvx+3A2papS6hF6fetN
   VQFcgU+KK8H0duP5HexmlvvT2GN7uKTmWbp6PYRh4jlR8w4C/+ebv9V6T
   0DErPdcRlpy8ZaaWd0tS95n2/cUAiaRyo9EYpIJU3iqmLxvi+CuI6EHcI
   2fMpeVLe18Byu35vxj1Jjg7kFEWgZ0SHXEkqwgTmesiB1AQwCF20fVzGc
   iLN9GwZDWaGzURJQd+vlH3scTTvRNwPZ0HuwtV2ibOLKiypkPxd4zFKTA
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10675"; a="429551538"
X-IronPort-AV: E=Sophos;i="5.98,332,1673942400"; 
   d="scan'208";a="429551538"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2023 18:37:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10675"; a="688106998"
X-IronPort-AV: E=Sophos;i="5.98,332,1673942400"; 
   d="scan'208";a="688106998"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 09 Apr 2023 18:37:02 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1plgSr-000UuD-17;
	Mon, 10 Apr 2023 01:37:01 +0000
Date: Mon, 10 Apr 2023 09:36:26 +0800
From: kernel test robot <lkp@intel.com>
To: Tianrui Zhao <zhaotianrui@loongson.cn>,
	Paolo Bonzini <pbonzini@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	loongarch@lists.linux.dev, linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
	Mark Brown <broonie@kernel.org>,
	Alex Deucher <alexander.deucher@amd.com>,
	Oliver Upton <oliver.upton@linux.dev>, maobibo@loongson.cn,
	Xi Ruoyao <xry111@xry111.site>, zhaotianrui@loongson.cn
Subject: Re: [PATCH v5 30/30] LoongArch: KVM: Supplement kvm document about
 loongarch-specific part
Message-ID: <202304100944.xF4XkTAE-lkp@intel.com>
References: <20230407020003.3651096-31-zhaotianrui@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230407020003.3651096-31-zhaotianrui@loongson.cn>

Hi Tianrui,

kernel test robot noticed the following build warnings:

[auto build test WARNING on kvm/queue]
[also build test WARNING on linus/master v6.3-rc6 next-20230406]
[cannot apply to kvm/linux-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Tianrui-Zhao/LoongArch-KVM-Add-kvm-related-header-files/20230407-100816
base:   https://git.kernel.org/pub/scm/virt/kvm/kvm.git queue
patch link:    https://lore.kernel.org/r/20230407020003.3651096-31-zhaotianrui%40loongson.cn
patch subject: [PATCH v5 30/30] LoongArch: KVM: Supplement kvm document about loongarch-specific part
reproduce:
        # https://github.com/intel-lab-lkp/linux/commit/a4ea2786cae9b2350b1aed613edcc003ce93cfc2
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Tianrui-Zhao/LoongArch-KVM-Add-kvm-related-header-files/20230407-100816
        git checkout a4ea2786cae9b2350b1aed613edcc003ce93cfc2
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304100944.xF4XkTAE-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/virt/kvm/api.rst:423: WARNING: Literal block ends without a blank line; unexpected unindent.

vim +423 Documentation/virt/kvm/api.rst

   399	
   400	  /* x86 */
   401	  struct kvm_regs {
   402		/* out (KVM_GET_REGS) / in (KVM_SET_REGS) */
   403		__u64 rax, rbx, rcx, rdx;
   404		__u64 rsi, rdi, rsp, rbp;
   405		__u64 r8,  r9,  r10, r11;
   406		__u64 r12, r13, r14, r15;
   407		__u64 rip, rflags;
   408	  };
   409	
   410	  /* mips */
   411	  struct kvm_regs {
   412		/* out (KVM_GET_REGS) / in (KVM_SET_REGS) */
   413		__u64 gpr[32];
   414		__u64 hi;
   415		__u64 lo;
   416		__u64 pc;
   417	  };
   418	
   419	  /* loongarch */
   420	  struct kvm_regs {
   421	        unsigned long gpr[32];
   422	        unsigned long pc;
 > 423	};
   424	
   425	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
