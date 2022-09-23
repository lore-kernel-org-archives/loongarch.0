Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8A5015B0
	for <loongarch@lists.linux.dev>; Fri, 23 Sep 2022 02:27:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663900051; x=1695436051;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=EeOgxiuny3VNGnlzzeQqLXhBftKvebsU3Y2OekHhnE4=;
  b=mjhlR8YIMZhIyoKcyhou5o8DoBfzz1EtHYB0n31iVO+eedTtX9/wAA4J
   9jYNuWtHFxUJmGjfZU91XANIA7Yrc+di0fKjQ2mdWDhZ/W9n39uw5fI8u
   nBMmfbqmpjW0kwIGgL7YEhrEa12DLxhYK55p9DHip0B4NzPJ+LSAXeenH
   UkY7UpdvXzDqWlCq8jA5E+gUgviMG+A/EmN6qtIeJxIFDxIT2Tbh/fIlD
   W00N42peFWwAdpsFLycOYFO8U7r12pAdNeudLalqDxfkjR66WTELFJ5bZ
   AwJ75yzSSBSfOYlPD4qk7/QhDUT/3b+YPS+dcUJAQvevoa5pTqr2A6x/c
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10478"; a="301369555"
X-IronPort-AV: E=Sophos;i="5.93,337,1654585200"; 
   d="scan'208";a="301369555"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2022 19:27:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,337,1654585200"; 
   d="scan'208";a="709136697"
Received: from lkp-server01.sh.intel.com (HELO c0a60f19fe7e) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 22 Sep 2022 19:27:25 -0700
Received: from kbuild by c0a60f19fe7e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1obYPU-0005DO-33;
	Fri, 23 Sep 2022 02:27:24 +0000
Date: Fri, 23 Sep 2022 10:26:55 +0800
From: kernel test robot <lkp@intel.com>
To: Binbin Zhou <zhoubinbin@loongson.cn>,
	Wolfram Sang <wsa-dev@sang-engineering.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	linux-i2c@vger.kernel.org
Cc: kbuild-all@lists.01.org, loongarch@lists.linux.dev,
	linux-acpi@vger.kernel.org, WANG Xuerui <kernel@xen0n.name>,
	Jianmin Lv <lvjianmin@loongson.cn>,
	Binbin Zhou <zhoubinbin@loongson.cn>,
	Huacai Chen <chenhuacai@loongson.cn>
Subject: Re: [PATCH 4/5] i2c: Add driver for Loongson-2K/LS7A I2C controller
Message-ID: <202209231036.KnY4wKcL-lkp@intel.com>
References: <ba10e9fd6deb70a2c59d5c02f30a8abbe8aa825e.1663835855.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ba10e9fd6deb70a2c59d5c02f30a8abbe8aa825e.1663835855.git.zhoubinbin@loongson.cn>

Hi Binbin,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on wsa/i2c/for-next]
[also build test ERROR on linus/master v6.0-rc6 next-20220921]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Binbin-Zhou/i2c-ls2x-Add-support-for-the-Loongson-2K-LS7A-I2C/20220922-194252
base:   https://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-next
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20220923/202209231036.KnY4wKcL-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/df754cf9cc58fc815223d6126fa1c86717cd3465
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Binbin-Zhou/i2c-ls2x-Add-support-for-the-Loongson-2K-LS7A-I2C/20220922-194252
        git checkout df754cf9cc58fc815223d6126fa1c86717cd3465
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash drivers/i2c/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   drivers/i2c/busses/i2c-ls2x.c: In function 'i2c_stop':
>> drivers/i2c/busses/i2c-ls2x.c:45:33: error: implicit declaration of function 'writeb' [-Werror=implicit-function-declaration]
      45 | #define i2c_writeb(val, addr)   writeb(val, dev->base + addr)
         |                                 ^~~~~~
   drivers/i2c/busses/i2c-ls2x.c:60:9: note: in expansion of macro 'i2c_writeb'
      60 |         i2c_writeb(LS2X_I2C_CMD_STOP, LS2X_I2C_CR_REG);
         |         ^~~~~~~~~~
>> drivers/i2c/busses/i2c-ls2x.c:44:33: error: implicit declaration of function 'readb' [-Werror=implicit-function-declaration]
      44 | #define i2c_readb(addr)         readb(dev->base + addr)
         |                                 ^~~~~
   drivers/i2c/busses/i2c-ls2x.c:63:9: note: in expansion of macro 'i2c_readb'
      63 |         i2c_readb(LS2X_I2C_SR_REG);
         |         ^~~~~~~~~
   cc1: some warnings being treated as errors


vim +/writeb +45 drivers/i2c/busses/i2c-ls2x.c

    43	
  > 44	#define i2c_readb(addr)		readb(dev->base + addr)
  > 45	#define i2c_writeb(val, addr)	writeb(val, dev->base + addr)
    46	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
