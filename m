Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A30B2F4A;
	Fri,  6 Sep 2024 06:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725603575; cv=none; b=AcAXKX/1zPo88QOcqMuXQ99mSUgDzuxq4RrgyVE8tDnjeJDW82iKLyyBudZq/jNlUV/TYdLeFEPnsXLIwICacw47ARGj4emN2PUCwYDYC0ICcA0ksdEcQWmcWeQD6XT+Vq/4AAyWxk+BNWRgWg3+RZhD7mb/oBZs71tXxDoCEpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725603575; c=relaxed/simple;
	bh=831UncUWZ3oaS4W+PiWNkt0Cc0LIJ95Zae6HcMcBaPo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FJDxSq4gtrddW59o/hqe/Kl7JTHxHtCrD6VW+EVFh/nOFyefDOi/Cv8cmaH2n/4andkWStkj7LhxkRjKQlAFMc++xq/vLIOJNXFg10L6ExNwZQfSjsLZBrQtL2i+DE7Ppd7u9wel4UwXjo42cdYMiIhm7zQBSo8AUE1hUAXnl+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QfkN9vlO; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QfkN9vlO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725603573; x=1757139573;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=831UncUWZ3oaS4W+PiWNkt0Cc0LIJ95Zae6HcMcBaPo=;
  b=QfkN9vlONdM3Qy3wAbTVEwCkLcFs2RNysEutzCvbTgSil6So4vZjteTZ
   /JlJ5jkT+vn7Ghynk/LWijsV72/9jVHqh07kGj4ttYz7JELBolppLb4Qg
   hCF5h8kdXAxeO1+GfVJvC5m8JSXeIYuRvDY5zs4wFtC6WiEVpjRw+eAD1
   wUMKrJwps6wMg+A8Zul8BkQkIQrIuidQcClxjoJb7OB7SqQgYdipuMjag
   dZCfJJnpBbL3GAmDx2cNBPhoWt4pEh4KyA0OsaEWsIFhXsthagkF0FBta
   IssryvviCv40dBqlPQLzoFNM8IF7NmZpOoCKwm1djYKlZFigzcJ/ochLx
   Q==;
X-CSE-ConnectionGUID: hid0rwbCQESnKZ8/SLonyg==
X-CSE-MsgGUID: 3jsSL/UYQM+2qWdqd6i07Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11186"; a="24225147"
X-IronPort-AV: E=Sophos;i="6.10,207,1719903600"; 
   d="scan'208";a="24225147"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2024 23:19:32 -0700
X-CSE-ConnectionGUID: HjbrCDkSRYCrpW2OYslynw==
X-CSE-MsgGUID: djT8ieuJTmifr9cWJv/QeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,207,1719903600"; 
   d="scan'208";a="70660743"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 05 Sep 2024 23:19:28 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1smSJa-000AkH-18;
	Fri, 06 Sep 2024 06:19:26 +0000
Date: Fri, 6 Sep 2024 14:18:56 +0800
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
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, devicetree@vger.kernel.org,
	linux-sound@vger.kernel.org, Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev
Subject: Re: [PATCH v1 08/10] ASoC: loongson: Add I2S controller driver as
 platform device
Message-ID: <202409061419.RBYUF8ou-lkp@intel.com>
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

kernel test robot noticed the following build warnings:

[auto build test WARNING on 097a44db5747403b19d05a9664e8ec6adba27e3b]

url:    https://github.com/intel-lab-lkp/linux/commits/Binbin-Zhou/ASoC-dt-bindings-Add-Everest-ES8323-Codec/20240905-150958
base:   097a44db5747403b19d05a9664e8ec6adba27e3b
patch link:    https://lore.kernel.org/r/282dadefdaac7917fd681a6e84a5f0f07d0557bc.1725518229.git.zhoubinbin%40loongson.cn
patch subject: [PATCH v1 08/10] ASoC: loongson: Add I2S controller driver as platform device
config: i386-kismet-CONFIG_SND_SOC_LOONGSON_I2S_PCI-CONFIG_SND_SOC_LOONGSON_CARD-0-0 (https://download.01.org/0day-ci/archive/20240906/202409061419.RBYUF8ou-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20240906/202409061419.RBYUF8ou-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409061419.RBYUF8ou-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for SND_SOC_LOONGSON_I2S_PCI when selected by SND_SOC_LOONGSON_CARD
   WARNING: unmet direct dependencies detected for SND_SOC_LOONGSON_I2S_PCI
     Depends on [n]: SOUND [=y] && SND [=y] && SND_SOC [=y] && (LOONGARCH || COMPILE_TEST [=y]) && PCI [=n]
     Selected by [y]:
     - SND_SOC_LOONGSON_CARD [=y] && SOUND [=y] && SND [=y] && SND_SOC [=y] && (LOONGARCH || COMPILE_TEST [=y])

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
