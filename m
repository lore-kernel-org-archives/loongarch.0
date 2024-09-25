Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6799514A4C1;
	Wed, 25 Sep 2024 04:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727237945; cv=none; b=OBR0icJDCFO8ydJUx51WxQv2vb3WZgYTF+BHq17ezqvcXuctVyxH17fSX3cgc2n1qw9rx6zXpsfO/B2BotDPww9Hf9ycIHwxosFB1qkK8hftjDG+lT66lJWN5v0k38FCJauxWi3EWZlYOfgKhgAlNe1bKMGmYx2wbgVKvKImXbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727237945; c=relaxed/simple;
	bh=lS+NkfW/fPJVCVEP9QZFeM8NSHU7s7NyFWgEgQ6rUrk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ACh34r54lrYAqJ5ZVn6O4OjXyPoaCAcRLDt29un866CKYYnN3BN9TrCF89Cze/kDS+JTQGGzYIaJGTmFY0BXroF0c5TePh2gIl5frjZIobDzIcdLtrGvn7VY7m/BXSNB216zOwjfEqpIVxaxE7igmLyzlRthXRQiVlaUkTF5wW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CCTFUbYc; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CCTFUbYc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727237944; x=1758773944;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lS+NkfW/fPJVCVEP9QZFeM8NSHU7s7NyFWgEgQ6rUrk=;
  b=CCTFUbYcK48ocL49uhXQmy11e2r3PKrff6ejg2ZaHfYT1fONxTe1gIzD
   /oMP3WqIfiN1JOS29yS3INOh0R8xe40Umvx96TgYKO3wb3iTGdJ0dMzqC
   b1xdQV+qusDztXAml/4z7SAmyoKNdxfFwOor7j2O3Jsz/Y5LuNBe7dZgO
   T832JTLyg96J2N3OOOKs/bzBjq7VwWI0lhujNhMB+KBLRAzMvIaDNVDzw
   9YtXrG70TqWuTuMeXp1uV8Tyu3xrlaqHNwUMEBHhIFzlNM9bYBRCi4DYL
   44E5IMt8XfBivWtzxrftSCjV01mCGsVCINDS2dlxuDP9cNhodqk2hQJ4d
   Q==;
X-CSE-ConnectionGUID: xtMdMbXOTMKCj0GNH3rnWg==
X-CSE-MsgGUID: KXZ2dfm8Tte3XiBNHmNmlg==
X-IronPort-AV: E=McAfee;i="6700,10204,11205"; a="26215369"
X-IronPort-AV: E=Sophos;i="6.10,256,1719903600"; 
   d="scan'208";a="26215369"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2024 21:19:03 -0700
X-CSE-ConnectionGUID: 6NdU+laSRBSdbMAEKH5Liw==
X-CSE-MsgGUID: ImcSjgIFQA6RYk9dsdE7cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,256,1719903600"; 
   d="scan'208";a="71644054"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 24 Sep 2024 21:18:57 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1stJUN-000J7t-0E;
	Wed, 25 Sep 2024 04:18:55 +0000
Date: Wed, 25 Sep 2024 12:18:44 +0800
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
Message-ID: <202409251242.gyf8pdxt-lkp@intel.com>
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
config: alpha-kismet-CONFIG_SND_SOC_LOONGSON_CARD-CONFIG_SND_SOC_LOONGSON_I2S_PLATFORM-0-0 (https://download.01.org/0day-ci/archive/20240925/202409251242.gyf8pdxt-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20240925/202409251242.gyf8pdxt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409251242.gyf8pdxt-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for SND_SOC_LOONGSON_CARD when selected by SND_SOC_LOONGSON_I2S_PLATFORM
   WARNING: unmet direct dependencies detected for SND_SOC_LOONGSON_CARD
     Depends on [n]: SOUND [=y] && SND [=y] && SND_SOC [=y] && (LOONGARCH || COMPILE_TEST [=n])
     Selected by [y]:
     - SND_SOC_LOONGSON_I2S_PLATFORM [=y] && SOUND [=y] && SND [=y] && SND_SOC [=y] && OF [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
