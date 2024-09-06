Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 455771401C;
	Fri,  6 Sep 2024 01:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725584920; cv=none; b=KzZDiYs3q1qcrKUnTprJQhIiby25uAYsB+Z3hfcyxqfFrRQh2O8ecjs4+3hvtW83ZLqgLAsU2S6oVEWQ2yqP6VTFqxkGr+PXQxzhlUk1u1qNVKlroleUfT1Z1jGGKRJ8ENxRreJP2Z6DJo3agjOzu/Z7Z3tC4rmSyJDELLa0gKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725584920; c=relaxed/simple;
	bh=9pan4tYDMpwflzlvEiNlU/CmxyFNsYISO5mIYewLskk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FvvPOV0IjIG4GFGOSNeFqify9CYPtfciDD9VTzrENItiS7pUDsBTMUJQkagkKvjNiVZDBZuIuWLBWk71v64gXSEzzVyXQD0EUE1rk7ezyG5WrMjL1FeZOXt9+fJ0mSm9aSB5/E9zJxbJh7xP0vVuRn8Um1++IXuTOJ2ERex7uOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qq4qQnaM; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qq4qQnaM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725584918; x=1757120918;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9pan4tYDMpwflzlvEiNlU/CmxyFNsYISO5mIYewLskk=;
  b=Qq4qQnaMgUQWYQrM17L+z6rW88oZRj29CS/gXeXS2vhUMmNArg5YeY+q
   shKstTEIe8LEETi3aMgMBV6J9Y5KqzjisRtBLEFDa+LrCiSHg1FXQ92Mr
   X/sH9HGhcHsTrHfWA97aNQbMhs8EK9KRX0wQ5D3DAxplIZsDoUABRMKid
   Werf88kA6h5MMRS7bIRh7TxiJcAdsxjEb+v+dMqZSdXMOkCrH1vlMnZ/2
   kOMp1QTE2sk5yOmUx0nzw9sCEFFFDQCD6Ew3H9oexdCozveE0OcRoSjmm
   i/FpRx2h7ZK9EJQqhgJFNzBzd8HhXA3hMT5V9Ymlt8n813Dx5wtFMosX1
   g==;
X-CSE-ConnectionGUID: 6Fbg9Yb7T8uxDF9N1OHsrw==
X-CSE-MsgGUID: 4RitijyyQFm/PVn66b54jw==
X-IronPort-AV: E=McAfee;i="6700,10204,11186"; a="28217710"
X-IronPort-AV: E=Sophos;i="6.10,206,1719903600"; 
   d="scan'208";a="28217710"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2024 18:08:37 -0700
X-CSE-ConnectionGUID: k5u21ZQISRWcbhEsxyoPNQ==
X-CSE-MsgGUID: JD0YrFvqRuCa+UruNd9DCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,206,1719903600"; 
   d="scan'208";a="65850260"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 05 Sep 2024 18:08:34 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1smNSh-000ATX-2t;
	Fri, 06 Sep 2024 01:08:31 +0000
Date: Fri, 6 Sep 2024 09:08:18 +0800
From: kernel test robot <lkp@intel.com>
To: Binbin Zhou <zhoubinbin@loongson.cn>,
	Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: oe-kbuild-all@lists.linux.dev, devicetree@vger.kernel.org,
	linux-sound@vger.kernel.org, Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev
Subject: Re: [PATCH v1 08/10] ASoC: loongson: Add I2S controller driver as
 platform device
Message-ID: <202409060840.Rm0gPgE4-lkp@intel.com>
References: <282dadefdaac7917fd681a6e84a5f0f07d0557bc.1725518229.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <282dadefdaac7917fd681a6e84a5f0f07d0557bc.1725518229.git.zhoubinbin@loongson.cn>

Hi Binbin,

kernel test robot noticed the following build errors:

[auto build test ERROR on 097a44db5747403b19d05a9664e8ec6adba27e3b]

url:    https://github.com/intel-lab-lkp/linux/commits/Binbin-Zhou/ASoC-dt-bindings-Add-Everest-ES8323-Codec/20240905-150958
base:   097a44db5747403b19d05a9664e8ec6adba27e3b
patch link:    https://lore.kernel.org/r/282dadefdaac7917fd681a6e84a5f0f07d0557bc.1725518229.git.zhoubinbin%40loongson.cn
patch subject: [PATCH v1 08/10] ASoC: loongson: Add I2S controller driver as platform device
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20240906/202409060840.Rm0gPgE4-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240906/202409060840.Rm0gPgE4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409060840.Rm0gPgE4-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> sound/soc/loongson/loongson_i2s_pci.c:157:1: warning: data definition has no type or storage class
     157 | module_pci_driver(loongson_i2s_driver);
         | ^~~~~~~~~~~~~~~~~
>> sound/soc/loongson/loongson_i2s_pci.c:157:1: error: type defaults to 'int' in declaration of 'module_pci_driver' [-Wimplicit-int]
>> sound/soc/loongson/loongson_i2s_pci.c:157:1: error: parameter names (without types) in function declaration [-Wdeclaration-missing-parameter-type]
>> sound/soc/loongson/loongson_i2s_pci.c:149:26: warning: 'loongson_i2s_driver' defined but not used [-Wunused-variable]
     149 | static struct pci_driver loongson_i2s_driver = {
         |                          ^~~~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for SND_SOC_LOONGSON_I2S_PCI
   Depends on [n]: SOUND [=m] && SND [=m] && SND_SOC [=m] && (LOONGARCH || COMPILE_TEST [=y]) && PCI [=n]
   Selected by [m]:
   - SND_SOC_LOONGSON_CARD [=m] && SOUND [=m] && SND [=m] && SND_SOC [=m] && (LOONGARCH || COMPILE_TEST [=y])


vim +/loongson_i2s_driver +149 sound/soc/loongson/loongson_i2s_pci.c

d84881e06836dc1 Yingkun Meng 2023-06-15  148  
d84881e06836dc1 Yingkun Meng 2023-06-15 @149  static struct pci_driver loongson_i2s_driver = {
d84881e06836dc1 Yingkun Meng 2023-06-15  150  	.name = "loongson-i2s-pci",
d84881e06836dc1 Yingkun Meng 2023-06-15  151  	.id_table = loongson_i2s_ids,
d84881e06836dc1 Yingkun Meng 2023-06-15  152  	.probe = loongson_i2s_pci_probe,
d84881e06836dc1 Yingkun Meng 2023-06-15  153  	.driver = {
d84881e06836dc1 Yingkun Meng 2023-06-15  154  		.pm = pm_sleep_ptr(&loongson_i2s_pm),
d84881e06836dc1 Yingkun Meng 2023-06-15  155  	},
d84881e06836dc1 Yingkun Meng 2023-06-15  156  };
d84881e06836dc1 Yingkun Meng 2023-06-15 @157  module_pci_driver(loongson_i2s_driver);
d84881e06836dc1 Yingkun Meng 2023-06-15  158  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
