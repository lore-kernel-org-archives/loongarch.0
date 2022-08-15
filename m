Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CC427E
	for <loongarch@lists.linux.dev>; Mon, 15 Aug 2022 17:58:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1660586330; x=1692122330;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GoWX3NVW176iA4DRV5DnnuWj5qZvqeRzOQoj6JSiaI4=;
  b=I8trxM/3j8dTeVxjpCf6TLl+UA+fdTW39q2CLGl4ZMv6JVs4+jQq4fvp
   N4X9JJRZIgyGRXrzGD/g+FJLh6tMF2mGvJ4smVnAb7vnL7WsR+JUH4GFK
   zMqMctqF3WfKLO0Y2/cY9H+KGK4t+g41HxFxujSO2m7w1hLeuTaDvTHDD
   oRAx4ZWnqF+sBw8yh8AzaP7bOw7Mu2xBfm1h0i5urdT1pAd7dLLTPEBqd
   SW7huwlqkB28+NSCw49T+MEtydYzW8c1Is7am78Muy2y2EUlhsd9IuGJu
   VkcHCIN7QaGjsk/mQ2pKqWJ/bm28Jr4cHkbUcELerwjaQwY6mqzEfxH8g
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10440"; a="356029381"
X-IronPort-AV: E=Sophos;i="5.93,238,1654585200"; 
   d="scan'208";a="356029381"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2022 10:58:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,238,1654585200"; 
   d="scan'208";a="749015252"
Received: from lkp-server02.sh.intel.com (HELO 3d2a4d02a2a9) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 15 Aug 2022 10:58:38 -0700
Received: from kbuild by 3d2a4d02a2a9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oNeMH-00019B-1p;
	Mon, 15 Aug 2022 17:58:37 +0000
Date: Tue, 16 Aug 2022 01:58:14 +0800
From: kernel test robot <lkp@intel.com>
To: Huacai Chen <chenhuacai@loongson.cn>, Arnd Bergmann <arnd@arndb.de>,
	Huacai Chen <chenhuacai@kernel.org>,
	"Rafael J . Wysocki" <rjw@rjwysocki.net>,
	Len Brown <lenb@kernel.org>, Robert Moore <robert.moore@intel.com>,
	Erik Kaneda <erik.kaneda@intel.com>
Cc: kbuild-all@lists.01.org, loongarch@lists.linux.dev,
	linux-arch@vger.kernel.org, linux-acpi@vger.kernel.org,
	Xuefeng Li <lixuefeng@loongson.cn>,
	Jianmin Lv <lvjianmin@loongson.cn>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: Re: [PATCH 1/2] LoongArch: Add CPU HWMon platform driver
Message-ID: <202208160121.FAZ06e7K-lkp@intel.com>
References: <20220815124803.3332991-1-chenhuacai@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220815124803.3332991-1-chenhuacai@loongson.cn>

Hi Huacai,

I love your patch! Perhaps something to improve:

[auto build test WARNING on soc/for-next]
[also build test WARNING on linus/master v6.0-rc1 next-20220815]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Huacai-Chen/LoongArch-Add-CPU-HWMon-platform-driver/20220815-205142
base:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git for-next
config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20220816/202208160121.FAZ06e7K-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/159dd6fa1dd6a1f121ca589031959f9ef7db640d
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Huacai-Chen/LoongArch-Add-CPU-HWMon-platform-driver/20220815-205142
        git checkout 159dd6fa1dd6a1f121ca589031959f9ef7db640d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=loongarch SHELL=/bin/bash drivers/platform/loongarch/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/platform/loongarch/cpu_hwmon.c:13:5: warning: no previous prototype for 'loongson3_cpu_temp' [-Wmissing-prototypes]
      13 | int loongson3_cpu_temp(int cpu)
         |     ^~~~~~~~~~~~~~~~~~


vim +/loongson3_cpu_temp +13 drivers/platform/loongarch/cpu_hwmon.c

    12	
  > 13	int loongson3_cpu_temp(int cpu)
    14	{
    15		u32 reg;
    16	
    17		reg = iocsr_read32(LOONGARCH_IOCSR_CPUTEMP) & 0xff;
    18	
    19		return (int)((s8)reg) * 1000;
    20	}
    21	EXPORT_SYMBOL(loongson3_cpu_temp);
    22	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
