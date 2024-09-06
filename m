Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11DEE1B59A;
	Fri,  6 Sep 2024 02:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725588655; cv=none; b=kRJzXkU8r7g18SfmyrZ43QGi7qn4QwmnvbIqJXIXKVfcBvMcNPFpZ999bRNRjxdx/YVnSBA3VeY5jkWXhJQY8yhk4KI/urBjOGMxE+7Dqo0iryj8Vn+zTzZK32lIYbfc4snv4sK3SAy43Tugzb36upOPxS0BO8YB9Ehrex3flLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725588655; c=relaxed/simple;
	bh=W8KoadrplDrlWaPO6SKv737olVsqznXqeSpUJ319C44=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dt7j/fxr0s4D+LeEP4K7RA5vRs5CNV7UGhgFjq3AOqjHt6ZV8D8miC9Q6RcDauTpyRZSMc7IXQOsll/6Nr5jL0uwaOQaHyqvMLBf4iZp7FhKaAzR/6HOQMVhl5etQGH3ArHJdJkK47UPtOvdqiN03ADNGtNzy1l+iYIGhHCGYqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jc9B7Ubl; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jc9B7Ubl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725588654; x=1757124654;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=W8KoadrplDrlWaPO6SKv737olVsqznXqeSpUJ319C44=;
  b=jc9B7Ubl9mjwRVeJ/5l8h88XfDD4D6iDiiIz5fFQa19HSNT3suyS78Nb
   qjR1JeiLPe3P50sXrMuPnRNqL0PhX5Uq0Cq7qwhZPdlfQul/DqvyvKtTj
   iagDaksSR51j1oNWEFx2nXI8DNwA5rfeorSmrvaLxqOc8jA7yzNO/HsAY
   AFztby+pSExv78P+j0j7hp+yJEVP8dFQ/E1/YJNtPpBwfozHFCtEcZ3+A
   g62C2u2wyIAfWSq+x57au+Mfx77crwgsTdVpxrC8SbUzJOix0xzdS1/cn
   IjOEiW91WOvzH5peHy9zWkkFzN7OTTkiWxxn+kDqXSiAVUgGfjc4UuggZ
   w==;
X-CSE-ConnectionGUID: f+3nBLF5TEuniozNI9rpIA==
X-CSE-MsgGUID: 6oIMRqUhRVG1O1l+GIqwdw==
X-IronPort-AV: E=McAfee;i="6700,10204,11186"; a="13400085"
X-IronPort-AV: E=Sophos;i="6.10,206,1719903600"; 
   d="scan'208";a="13400085"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2024 19:10:53 -0700
X-CSE-ConnectionGUID: QONY7BeUSTWpIgSQppYk+w==
X-CSE-MsgGUID: EcoPKMgeShu0xysBKNWvVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,206,1719903600"; 
   d="scan'208";a="65858381"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 05 Sep 2024 19:10:50 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1smOQx-000AVE-2W;
	Fri, 06 Sep 2024 02:10:47 +0000
Date: Fri, 6 Sep 2024 10:10:47 +0800
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
Subject: Re: [PATCH v1 04/10] ASoC: codecs: Add uda1342 codec driver
Message-ID: <202409060936.0UeDj3S7-lkp@intel.com>
References: <3fd0c3a04f5f3bd293168732db457f6854db706e.1725518229.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3fd0c3a04f5f3bd293168732db457f6854db706e.1725518229.git.zhoubinbin@loongson.cn>

Hi Binbin,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 097a44db5747403b19d05a9664e8ec6adba27e3b]

url:    https://github.com/intel-lab-lkp/linux/commits/Binbin-Zhou/ASoC-dt-bindings-Add-Everest-ES8323-Codec/20240905-150958
base:   097a44db5747403b19d05a9664e8ec6adba27e3b
patch link:    https://lore.kernel.org/r/3fd0c3a04f5f3bd293168732db457f6854db706e.1725518229.git.zhoubinbin%40loongson.cn
patch subject: [PATCH v1 04/10] ASoC: codecs: Add uda1342 codec driver
config: parisc-randconfig-r071-20240906 (https://download.01.org/0day-ci/archive/20240906/202409060936.0UeDj3S7-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240906/202409060936.0UeDj3S7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409060936.0UeDj3S7-lkp@intel.com/

All warnings (new ones prefixed by >>):

   sound/soc/codecs/uda1342.c: In function 'uda1342_i2c_probe':
>> sound/soc/codecs/uda1342.c:331:13: warning: unused variable 'ret' [-Wunused-variable]
     331 |         int ret;
         |             ^~~
   sound/soc/codecs/uda1342.c: At top level:
>> sound/soc/codecs/uda1342.c:358:12: warning: 'uda1342_resume' defined but not used [-Wunused-function]
     358 | static int uda1342_resume(struct device *dev)
         |            ^~~~~~~~~~~~~~
>> sound/soc/codecs/uda1342.c:349:12: warning: 'uda1342_suspend' defined but not used [-Wunused-function]
     349 | static int uda1342_suspend(struct device *dev)
         |            ^~~~~~~~~~~~~~~
>> sound/soc/codecs/uda1342.c:232:30: warning: 'uda1342_mixer_enum' defined but not used [-Wunused-const-variable=]
     232 | static const struct soc_enum uda1342_mixer_enum[] = {
         |                              ^~~~~~~~~~~~~~~~~~


vim +/ret +331 sound/soc/codecs/uda1342.c

   231	
 > 232	static const struct soc_enum uda1342_mixer_enum[] = {
   233		SOC_ENUM_SINGLE(0x10, 3, 0x04, uda1342_deemph),
   234		SOC_ENUM_SINGLE(0x10, 0, 0x04, uda1342_mixmode),
   235	};
   236	
   237	static const struct snd_kcontrol_new uda1342_snd_controls[] = {
   238		SOC_SINGLE("Master Playback Volume", 0x11, 0, 0x3F, 1),
   239		SOC_SINGLE("Analog1 Volume", 0x12, 0, 0x1F, 1),
   240	};
   241	
   242	/* Common DAPM widgets */
   243	static const struct snd_soc_dapm_widget uda1342_dapm_widgets[] = {
   244		SND_SOC_DAPM_INPUT("VINL1"),
   245		SND_SOC_DAPM_INPUT("VINR1"),
   246		SND_SOC_DAPM_INPUT("VINL2"),
   247		SND_SOC_DAPM_INPUT("VINR2"),
   248	
   249		SND_SOC_DAPM_DAC("DAC", "Playback", 0, 1, 0),
   250		SND_SOC_DAPM_ADC("ADC", "Capture", 0, 9, 0),
   251	
   252		SND_SOC_DAPM_OUTPUT("VOUTL"),
   253		SND_SOC_DAPM_OUTPUT("VOUTR"),
   254	};
   255	
   256	static const struct snd_soc_dapm_route uda1342_dapm_routes[] = {
   257		{ "ADC", NULL, "VINL1" },
   258		{ "ADC", NULL, "VINR1" },
   259		{ "ADC", NULL, "VINL2" },
   260		{ "ADC", NULL, "VINR2" },
   261		{ "VOUTL", NULL, "DAC" },
   262		{ "VOUTR", NULL, "DAC" },
   263	};
   264	
   265	static const struct snd_soc_dai_ops uda1342_dai_ops = {
   266		.startup	= uda1342_startup,
   267		.shutdown	= uda1342_shutdown,
   268		.hw_params	= uda1342_hw_params,
   269		.mute_stream	= uda1342_mute,
   270		.set_sysclk	= uda1342_set_dai_sysclk,
   271		.set_fmt	= uda1342_set_dai_fmt,
   272	};
   273	
   274	static struct snd_soc_dai_driver uda1342_dai = {
   275		.name = "uda1342-hifi",
   276		/* playback capabilities */
   277		.playback = {
   278			.stream_name = "Playback",
   279			.channels_min = 1,
   280			.channels_max = 2,
   281			.rates = SNDRV_PCM_RATE_8000_48000,
   282			.formats = UDA134X_FORMATS,
   283		},
   284		/* capture capabilities */
   285		.capture = {
   286			.stream_name = "Capture",
   287			.channels_min = 1,
   288			.channels_max = 2,
   289			.rates = SNDRV_PCM_RATE_8000_48000,
   290			.formats = UDA134X_FORMATS,
   291		},
   292		/* pcm operations */
   293		.ops = &uda1342_dai_ops,
   294	};
   295	
   296	static int uda1342_soc_probe(struct snd_soc_component *component)
   297	{
   298		struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
   299	
   300		snd_soc_add_component_controls(component, uda1342_snd_controls,
   301					       ARRAY_SIZE(uda1342_snd_controls));
   302		snd_soc_dapm_new_controls(dapm, uda1342_dapm_widgets,
   303					  ARRAY_SIZE(uda1342_dapm_widgets));
   304		snd_soc_dapm_add_routes(dapm, uda1342_dapm_routes,
   305					ARRAY_SIZE(uda1342_dapm_routes));
   306	
   307		return 0;
   308	}
   309	
   310	static const struct snd_soc_component_driver soc_component_dev_uda1342 = {
   311		.probe			= uda1342_soc_probe,
   312		.set_bias_level		= uda1342_set_bias_level,
   313		.suspend_bias_off	= 1,
   314		.idle_bias_on		= 1,
   315		.use_pmdown_time	= 1,
   316		.endianness		= 1,
   317	};
   318	
   319	static const struct regmap_config uda1342_regmap = {
   320		.reg_bits = 8,
   321		.val_bits = 16,
   322		.max_register = 0x21,
   323		.reg_defaults = uda1342_reg_defaults,
   324		.num_reg_defaults = ARRAY_SIZE(uda1342_reg_defaults),
   325		.cache_type = REGCACHE_RBTREE,
   326	};
   327	
   328	static int uda1342_i2c_probe(struct i2c_client *i2c)
   329	{
   330		struct uda1342_priv *uda1342;
 > 331		int ret;
   332	
   333		uda1342 = devm_kzalloc(&i2c->dev, sizeof(*uda1342), GFP_KERNEL);
   334		if (!uda1342)
   335			return -ENOMEM;
   336	
   337		uda1342->regmap = devm_regmap_init_i2c(i2c, &uda1342_regmap);
   338		if (IS_ERR(uda1342->regmap))
   339			return PTR_ERR(uda1342->regmap);
   340	
   341		i2c_set_clientdata(i2c, uda1342);
   342		uda1342->i2c = i2c;
   343	
   344		return devm_snd_soc_register_component(&i2c->dev,
   345						       &soc_component_dev_uda1342,
   346						       &uda1342_dai, 1);
   347	}
   348	
 > 349	static int uda1342_suspend(struct device *dev)
   350	{
   351		struct uda1342_priv *uda1342 = dev_get_drvdata(dev);
   352	
   353		regcache_cache_only(uda1342->regmap, true);
   354	
   355		return 0;
   356	}
   357	
 > 358	static int uda1342_resume(struct device *dev)
   359	{
   360		struct uda1342_priv *uda1342 = dev_get_drvdata(dev);
   361	
   362		regcache_mark_dirty(uda1342->regmap);
   363		regcache_sync(uda1342->regmap);
   364	
   365		return 0;
   366	}
   367	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
