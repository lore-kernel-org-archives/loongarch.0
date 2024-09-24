Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7C7C101DE;
	Tue, 24 Sep 2024 21:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727213211; cv=none; b=TmMYu2LyRDDB6k4lRncVHjLUMueXJlLSruNSXyE2Opi9YyrcCe3Nr7ZaD5ALu8Mh9ShrsimObsd569M92uZjJVF+XCm5u0a3BCN2MsfiOlUp9DZRfiTW5m52ffVgzTgw1KKUxTOA+0Gk9+wLe/iAGn0QXob1FcDS0jP8cB6koh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727213211; c=relaxed/simple;
	bh=XQhbHPNAG/zsIJVKawyKlQTLP+nsHVY3KM1TS0rfOa0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AXtoPDtzjnmHxvWJ6aRLVxnOf3/QTqGIDY+vfw9iAg/ym68N/Hups462bQy0KYiapULMG1GEoOuynv61wZbaF15VE6b4zPzK/eTvPuM/urIgka+jV6eLBlP/ZmDC+4Ry1kRjoOchM7/47SzBJ/bU22T5brEDLb9bUGsZAXQI26I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U1+qZPKO; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U1+qZPKO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727213209; x=1758749209;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XQhbHPNAG/zsIJVKawyKlQTLP+nsHVY3KM1TS0rfOa0=;
  b=U1+qZPKOOP1FpJYoxqylj6d0uvqN7suBlOdjZo8f24wGkZGwylFyVYW5
   tV1dPe37mIKFjHb5KQGlpRt6rB4icpeD4ARXheYmZ3dgV0fcXgT5qaArM
   N9dS/WGirS8XKqH458qB0uFL4AAGZcdtLOIstHhXtCNbLIuFQYxXanthI
   YCt+vfBIKRYTCDgWNpBXk4XBQ+NF93eGGvS23Df6cTY0ZAVmPFX0uOEJu
   mJWFjpT97PmQRNuayfDxQhSSIs17bXzqYFejThHqY7yJKMKbyyBVvbhsj
   Gw1FDzjXCvXnC9lpBSDubOiHlqejkmadsGojvLIYzwYanESYY5u5+12Ah
   w==;
X-CSE-ConnectionGUID: /w64LLgLTL+cOfPCTSPviw==
X-CSE-MsgGUID: h6l1ne0lRjm4Uj78Hy6hlw==
X-IronPort-AV: E=McAfee;i="6700,10204,11205"; a="26421470"
X-IronPort-AV: E=Sophos;i="6.10,255,1719903600"; 
   d="scan'208";a="26421470"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2024 14:26:47 -0700
X-CSE-ConnectionGUID: j3qg5jAPS0KvAZmgypfb6Q==
X-CSE-MsgGUID: s10Fk9+KTbW8kNRfs4PSKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,255,1719903600"; 
   d="scan'208";a="94887996"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 24 Sep 2024 14:26:40 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1stD3O-000IrF-1T;
	Tue, 24 Sep 2024 21:26:38 +0000
Date: Wed, 25 Sep 2024 05:26:21 +0800
From: kernel test robot <lkp@intel.com>
To: Binbin Zhou <zhoubinbin@loongson.cn>,
	Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Weidong Wang <wangweidong.a@awinic.com>,
	Prasad Kumpatla <quic_pkumpatl@quicinc.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Shuming Fan <shumingf@realtek.com>
Subject: Re: [PATCH v2 7/9] ASoC: loongson: Add I2S controller driver as
 platform device
Message-ID: <202409250533.AEodmhZc-lkp@intel.com>
References: <fd3989d15546502b47f580e6a2c3a59cb628ce93.1727056789.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fd3989d15546502b47f580e6a2c3a59cb628ce93.1727056789.git.zhoubinbin@loongson.cn>

Hi Binbin,

kernel test robot noticed the following build warnings:

[auto build test WARNING on broonie-sound/for-next]
[also build test WARNING on linus/master next-20240924]
[cannot apply to robh/for-next v6.11]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Binbin-Zhou/ASoC-dt-bindings-Add-Everest-ES8323-Codec/20240924-150942
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/fd3989d15546502b47f580e6a2c3a59cb628ce93.1727056789.git.zhoubinbin%40loongson.cn
patch subject: [PATCH v2 7/9] ASoC: loongson: Add I2S controller driver as platform device
config: alpha-kismet-CONFIG_SND_SOC_LOONGSON_CARD-CONFIG_SND_SOC_LOONGSON_I2S_PCI-0-0 (https://download.01.org/0day-ci/archive/20240925/202409250533.AEodmhZc-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20240925/202409250533.AEodmhZc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409250533.AEodmhZc-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for SND_SOC_LOONGSON_CARD when selected by SND_SOC_LOONGSON_I2S_PCI
   WARNING: unmet direct dependencies detected for SND_SOC_LOONGSON_CARD
     Depends on [n]: SOUND [=y] && SND [=y] && SND_SOC [=y] && (LOONGARCH || COMPILE_TEST [=n])
     Selected by [y]:
     - SND_SOC_LOONGSON_I2S_PCI [=y] && SOUND [=y] && SND [=y] && SND_SOC [=y] && PCI [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
