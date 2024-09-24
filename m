Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FEA338DE0;
	Tue, 24 Sep 2024 17:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727199100; cv=none; b=RFnPU2rV2J8bVhdo/ocMGdcq314ojeVpXISPRMKAu694ySmMoFt0pxzH3Rq94Naj66VgIDEgeFrBkbsNd2fTpaVHdW77+GrtbfPQFcTTDowX4WhxOmtRdGZOhPV+susZji1P8lwwosK+bvZ7mcNMZ4c+nNETH2sVjqbCPKxvgOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727199100; c=relaxed/simple;
	bh=jbG4i0ioHmRW91jsva1/2DTSCYPyp3hpl7h+4EgbRfE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dA2N8Xg9m8dMkwpZT5aaVfdIQkJxjZ6HKHub8NGwhmITMv3oCeY2KV5FTDTAScuC+4+92e7BngLV4HL9Wh8XIxIiU3EWtiHUX2MjsiqAQ39Iaqo+GUMSbLx+58JMNZsz/Ov8PZiE+9hHt2UfEAHW/cxYWqDsGSQ4fLD9CagcRdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=brE1PhzN; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="brE1PhzN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727199098; x=1758735098;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jbG4i0ioHmRW91jsva1/2DTSCYPyp3hpl7h+4EgbRfE=;
  b=brE1PhzNJE3msoI9fG0YNSv53raZZfzovT3DBsMJ3rgS9FLDQwkbPy1L
   7VUnLcD5HfGbTGQU94KEyNyDtLCEwqZkOfpgsw8AWDPy1FONb+xDWI5yQ
   pgcYiELKbdfEypZ4vyCRRtrRFKhobDKCUQR3b+bnRhbkUW6lSNKly7CxI
   oPxcshxrZtkl8C25VVZaMt3Tv+laBLL1FW7NTNO6JmSNQo3CdZIC9Ysdq
   GUG1SCujKZkUPqGPDKowq0CrXJe/MccQHHGvB6SCtkMBVHne0GWCPOpt2
   oDtJGxBWdx0maS5sW4SrVdSZVFd+C3sSWtLQ6OFtkDlXjJAi8H+U5U6sp
   Q==;
X-CSE-ConnectionGUID: Fs8nn4VGTYy4tVeka8calA==
X-CSE-MsgGUID: 1WNBKrZHTxqilb7RBeAh4g==
X-IronPort-AV: E=McAfee;i="6700,10204,11205"; a="30100583"
X-IronPort-AV: E=Sophos;i="6.10,255,1719903600"; 
   d="scan'208";a="30100583"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2024 10:31:37 -0700
X-CSE-ConnectionGUID: UWXqYtLdSsuCnmkjbw+MKA==
X-CSE-MsgGUID: t1eWJ//TRfKvBeb+rsVkMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,255,1719903600"; 
   d="scan'208";a="94820042"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 24 Sep 2024 10:31:32 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1st9Np-000Ie1-2D;
	Tue, 24 Sep 2024 17:31:29 +0000
Date: Wed, 25 Sep 2024 01:31:04 +0800
From: kernel test robot <lkp@intel.com>
To: Binbin Zhou <zhoubinbin@loongson.cn>,
	Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Weidong Wang <wangweidong.a@awinic.com>,
	Prasad Kumpatla <quic_pkumpatl@quicinc.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Shuming Fan <shumingf@realtek.com>
Subject: Re: [PATCH v2 4/9] ASoC: codecs: Add uda1342 codec driver
Message-ID: <202409250031.jLVR7xNR-lkp@intel.com>
References: <c69743ea929fed210128de765967ea045ebd6b27.1727056789.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c69743ea929fed210128de765967ea045ebd6b27.1727056789.git.zhoubinbin@loongson.cn>

Hi Binbin,

kernel test robot noticed the following build warnings:

[auto build test WARNING on broonie-sound/for-next]
[also build test WARNING on robh/for-next linus/master v6.11 next-20240924]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Binbin-Zhou/ASoC-dt-bindings-Add-Everest-ES8323-Codec/20240924-150942
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/c69743ea929fed210128de765967ea045ebd6b27.1727056789.git.zhoubinbin%40loongson.cn
patch subject: [PATCH v2 4/9] ASoC: codecs: Add uda1342 codec driver
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20240925/202409250031.jLVR7xNR-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 8663a75fa2f31299ab8d1d90288d9df92aadee88)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240925/202409250031.jLVR7xNR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409250031.jLVR7xNR-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from sound/soc/codecs/uda1342.c:14:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:25:
   In file included from include/linux/kernel_stat.h:8:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     548 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     561 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from sound/soc/codecs/uda1342.c:14:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:25:
   In file included from include/linux/kernel_stat.h:8:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from sound/soc/codecs/uda1342.c:14:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:25:
   In file included from include/linux/kernel_stat.h:8:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:585:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     585 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     595 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     605 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   In file included from sound/soc/codecs/uda1342.c:14:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:21:
   In file included from include/linux/mm.h:2228:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   sound/soc/codecs/uda1342.c:48:20: warning: unused function 'uda1342_reset' [-Wunused-function]
      48 | static inline void uda1342_reset(struct uda1342_priv *uda1342)
         |                    ^~~~~~~~~~~~~
>> sound/soc/codecs/uda1342.c:205:26: warning: unused variable 'uda1342_deemph' [-Wunused-const-variable]
     205 | static const char *const uda1342_deemph[] = {"None", "32Khz", "44.1Khz", "48Khz"};
         |                          ^~~~~~~~~~~~~~
>> sound/soc/codecs/uda1342.c:206:26: warning: unused variable 'uda1342_mixmode' [-Wunused-const-variable]
     206 | static const char *const uda1342_mixmode[] = {"Differential", "Analog1", "Analog2", "Both"};
         |                          ^~~~~~~~~~~~~~~
   sound/soc/codecs/uda1342.c:208:38: warning: variable 'uda1342_snd_controls' is not needed and will not be emitted [-Wunneeded-internal-declaration]
     208 | static const struct snd_kcontrol_new uda1342_snd_controls[] = {
         |                                      ^~~~~~~~~~~~~~~~~~~~
   11 warnings generated.


vim +/uda1342_deemph +205 sound/soc/codecs/uda1342.c

   204	
 > 205	static const char *const uda1342_deemph[] = {"None", "32Khz", "44.1Khz", "48Khz"};
 > 206	static const char *const uda1342_mixmode[] = {"Differential", "Analog1", "Analog2", "Both"};
   207	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
