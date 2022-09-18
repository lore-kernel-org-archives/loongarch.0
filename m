Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 708F8656
	for <loongarch@lists.linux.dev>; Sun, 18 Sep 2022 07:38:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663486718; x=1695022718;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WsB3/ShV3FI/8cLSVqJ3Gx16WtcHCb1HN64rmJh99OI=;
  b=mh9AEUxGu8sPUGaks4dHQDOXW4JoUG4XQkDf9KQ8l3NazuGAz46ZVU2D
   N51Y9zXIR6YTh728knxgFspFGR7bKxeIFB6x8+yKbbXQHtT5p9jK6QgSG
   UH49dmk0GcUADnP90pVjiqygAg7lNCymEHeLhtAeTvUwv03t6VC58bUOT
   RzFRCOJGxhOi8ThIQzWDUiVKL4VUKgghRF0xS8djSLxtRi/zfNg+jWSTo
   1vDdQNmGnnb/IKNt/57diq1IUy1rttZd9NaDow1vTUDrq5zUoZwS2ofhz
   Sgg0I3QSTnaGo3gAkLCGPcVjjNuQdpUK1q+phLQ/EM9MywAN3Syh5FMby
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10473"; a="363170941"
X-IronPort-AV: E=Sophos;i="5.93,325,1654585200"; 
   d="scan'208";a="363170941"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2022 00:38:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,325,1654585200"; 
   d="scan'208";a="651315171"
Received: from lkp-server01.sh.intel.com (HELO c0a60f19fe7e) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 18 Sep 2022 00:38:22 -0700
Received: from kbuild by c0a60f19fe7e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oZosf-00010J-1x;
	Sun, 18 Sep 2022 07:38:21 +0000
Date: Sun, 18 Sep 2022 15:38:12 +0800
From: kernel test robot <lkp@intel.com>
To: Huacai Chen <chenhuacai@loongson.cn>, Arnd Bergmann <arnd@arndb.de>,
	Huacai Chen <chenhuacai@kernel.org>,
	"Rafael J . Wysocki" <rjw@rjwysocki.net>,
	Len Brown <lenb@kernel.org>, Robert Moore <robert.moore@intel.com>,
	Erik Kaneda <erik.kaneda@intel.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Mark Gross <markgross@kernel.org>
Cc: kbuild-all@lists.01.org, loongarch@lists.linux.dev,
	linux-arch@vger.kernel.org, linux-acpi@vger.kernel.org,
	Xuefeng Li <lixuefeng@loongson.cn>,
	Jianmin Lv <lvjianmin@loongson.cn>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: Re: [PATCH V3] LoongArch: Add ACPI-based generic laptop driver
Message-ID: <202209181507.gIRt7LRP-lkp@intel.com>
References: <20220917065250.1671718-1-chenhuacai@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220917065250.1671718-1-chenhuacai@loongson.cn>

Hi Huacai,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on soc/for-next]
[also build test ERROR on linus/master v6.0-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Huacai-Chen/LoongArch-Add-ACPI-based-generic-laptop-driver/20220917-145525
base:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git for-next
config: loongarch-defconfig (https://download.01.org/0day-ci/archive/20220918/202209181507.gIRt7LRP-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/3ebe2785d58311650d0f98635c9817e0c2c12f91
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Huacai-Chen/LoongArch-Add-ACPI-based-generic-laptop-driver/20220917-145525
        git checkout 3ebe2785d58311650d0f98635c9817e0c2c12f91
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=loongarch SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   loongarch64-linux-ld: drivers/platform/loongarch/generic-laptop.o: in function `.L133':
>> generic-laptop.c:(.init.text+0x40c): undefined reference to `acpi_video_get_backlight_type'

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
