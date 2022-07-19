Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AEF353A7
	for <loongarch@lists.linux.dev>; Tue, 19 Jul 2022 22:41:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1658270500; x=1689806500;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7N1iYcEDM/OdyYxj8fxUgd4WfHVXHkgo3W/YAmVkyYI=;
  b=SusSWmgdHaZqUUmrteL7xfPT8f3lPTUlKQkAlZuvgwUH/zRoi0qaKxOC
   hxEOe3FSXZKy87JUKSca8NawfOJtSfJCBXOlrLFCEJT6HkdK3geqOTm7X
   1pZCAavp1yZ2d8eoS7xJJHA4jNAB7rn+29/O96rQbmPRZQxZhrfbEZ5TK
   vKR0N0J3mFMuwS9Fc29cDaggDsZMLvx0JV1SWR1RMW02YRvlHlhucvcM2
   Uv9C5TUbOHXre7oaWxQSqdTLs4IQku66LSrXBH2lJHR2TxIPkBPPxUsqS
   e+L7KiQkhvKssbjAf5xb+7ewJ3/xKKaD9D2Thf7SPzlRqm54V4S73rQU0
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10413"; a="287781015"
X-IronPort-AV: E=Sophos;i="5.92,285,1650956400"; 
   d="scan'208";a="287781015"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2022 15:41:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,285,1650956400"; 
   d="scan'208";a="740058933"
Received: from lkp-server02.sh.intel.com (HELO ff137eb26ff1) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 19 Jul 2022 15:41:37 -0700
Received: from kbuild by ff137eb26ff1 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1oDvuK-0006BO-Hs;
	Tue, 19 Jul 2022 22:41:36 +0000
Date: Wed, 20 Jul 2022 06:40:53 +0800
From: kernel test robot <lkp@intel.com>
To: Jianmin Lv <lvjianmin@loongson.cn>,
	Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>
Cc: kbuild-all@lists.01.org, linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev, Hanjun Guo <guohanjun@huawei.com>,
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Huacai Chen <chenhuacai@loongson.cn>
Subject: Re: [PATCH V16 14/14] irqchip / ACPI: Introduce ACPI_IRQ_MODEL_LPIC
 for LoongArch
Message-ID: <202207200630.T1WXKo7g-lkp@intel.com>
References: <1658153621-40445-15-git-send-email-lvjianmin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1658153621-40445-15-git-send-email-lvjianmin@loongson.cn>

Hi Jianmin,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on rafael-pm/linux-next]
[also build test ERROR on linus/master v5.19-rc7 next-20220719]
[cannot apply to tip/irq/core]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jianmin-Lv/irqchip-Add-LoongArch-related-irqchip-drivers/20220718-222340
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git linux-next
config: loongarch-randconfig-c003-20220718 (https://download.01.org/0day-ci/archive/20220720/202207200630.T1WXKo7g-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/f8e9b95288022d4cbe61fbd94cffee6821fbfb7d
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Jianmin-Lv/irqchip-Add-LoongArch-related-irqchip-drivers/20220718-222340
        git checkout f8e9b95288022d4cbe61fbd94cffee6821fbfb7d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=loongarch SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   loongarch64-linux-ld: drivers/irqchip/irq-loongarch-cpu.o: in function `lpic_get_gsi_domain_id':
>> irq-loongarch-cpu.c:(.text+0x10): undefined reference to `pch_lpc_handle'
>> loongarch64-linux-ld: irq-loongarch-cpu.c:(.text+0x14): undefined reference to `pch_lpc_handle'
>> loongarch64-linux-ld: irq-loongarch-cpu.c:(.text+0x14): undefined reference to `pch_lpc_handle'
>> loongarch64-linux-ld: irq-loongarch-cpu.c:(.text+0x68): undefined reference to `liointc_handle'
   loongarch64-linux-ld: irq-loongarch-cpu.c:(.text+0x6c): undefined reference to `liointc_handle'
   loongarch64-linux-ld: irq-loongarch-cpu.c:(.text+0x6c): undefined reference to `liointc_handle'
   loongarch64-linux-ld: drivers/irqchip/irq-loongarch-cpu.o: in function `eiointc_parse_madt':
   irq-loongarch-cpu.c:(.init.text+0x10): undefined reference to `eiointc_acpi_init'
   loongarch64-linux-ld: drivers/irqchip/irq-loongarch-cpu.o: in function `liointc_parse_madt':
   irq-loongarch-cpu.c:(.init.text+0x24): undefined reference to `liointc_acpi_init'
   loongarch64-linux-ld: drivers/irqchip/irq-loongson-pch-pic.o: in function `lpcintc_parse_madt':
   irq-loongson-pch-pic.c:(.init.text+0x14): undefined reference to `pch_lpc_acpi_init'
   loongarch64-linux-ld: drivers/video/fbdev/efifb.o: in function `depth_show':
   efifb.c:(.text+0x48): undefined reference to `screen_info'
   loongarch64-linux-ld: efifb.c:(.text+0x4c): undefined reference to `screen_info'
   loongarch64-linux-ld: efifb.c:(.text+0x4c): undefined reference to `screen_info'
   loongarch64-linux-ld: drivers/video/fbdev/efifb.o: in function `height_show':
   efifb.c:(.text+0x94): undefined reference to `screen_info'
   loongarch64-linux-ld: efifb.c:(.text+0x98): undefined reference to `screen_info'
   loongarch64-linux-ld: drivers/video/fbdev/efifb.o:efifb.c:(.text+0x98): more undefined references to `screen_info' follow

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
