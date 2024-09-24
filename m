Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26BC81FDD;
	Tue, 24 Sep 2024 15:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727193519; cv=none; b=L+oB3O+lLaC+yjYG599nA4tGjYx+HJ18blZUCKisvCfNXXy89NrpFzdMwP96epFPLDP4LtskPEwSCR2Zsc0E7gOyoOpNIK1fcg9KWRGk9QFAsCpmRKjVEBH6VKJY7Q/Ib4D4K09V9vrotGMcvh0Hz740eOsSGXWdPdb9fglmLIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727193519; c=relaxed/simple;
	bh=RKUpJDBsixSrkb2ItQ1xJv7LC2iLPJ3uky1a70WOo1I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aBy3Eu9hesPcVVuwQn5D24nMnUGTcE8Xz7yG1DItciPaOyPaQlmDhv18SdjE8G+HLFA5LpSdBZNSDrosRVMRqSWGRQZm07PjbfacYXwOI598LC6UWWrD9LqghIm5CN34IRBgR19H395Ght1vohXYiT2rScljMb1v/U9bHNDueWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Lx+0p7q3; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Lx+0p7q3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727193517; x=1758729517;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RKUpJDBsixSrkb2ItQ1xJv7LC2iLPJ3uky1a70WOo1I=;
  b=Lx+0p7q3hxunj68L8yC1Nw9Nr5Ncw+Z1fanm8zxinYHHa+YOHZXrxluI
   IuXpCALXfOEN2XVoBKAnmPMD8rdB0xxu4ztpUldswld2IdJ/FO1CePtVb
   Ms7uFFiw/0S8KlhrNAGhJYeG+BPEDXFpd2yddXDqMkJhQDzOd2VR53sfW
   fa4+qkxp22PzdNaT/kcKTXpclB7CKO9pMOigk2q98TOvnFECtAjAKMSCp
   bUWaFCRLh+bw1hRax2p/MIK8XhzyhWKCdb1UIbcw1XST5ishBdMYg5ClM
   RAEVolHhPPtg9f17mMdX3UtDR9QVWxnAItKqv60819sPZfrLo+JMBOPXU
   w==;
X-CSE-ConnectionGUID: NiFp/xbpT9yO/yuOG2d1JA==
X-CSE-MsgGUID: 9u1ZtQTXRXyZDHzN0wcF+w==
X-IronPort-AV: E=McAfee;i="6700,10204,11205"; a="26062144"
X-IronPort-AV: E=Sophos;i="6.10,255,1719903600"; 
   d="scan'208";a="26062144"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2024 08:58:32 -0700
X-CSE-ConnectionGUID: B+7wsJYpQ86JQvsMxw5GKQ==
X-CSE-MsgGUID: ZteXiXlRQ1yEGZLq6XVHHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,255,1719903600"; 
   d="scan'208";a="71347528"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 24 Sep 2024 08:58:25 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1st7vi-000IW3-2K;
	Tue, 24 Sep 2024 15:58:22 +0000
Date: Tue, 24 Sep 2024 23:58:15 +0800
From: kernel test robot <lkp@intel.com>
To: Binbin Zhou <zhoubinbin@loongson.cn>,
	Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-sound@vger.kernel.org,
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
Subject: Re: [PATCH v2 4/9] ASoC: codecs: Add uda1342 codec driver
Message-ID: <202409242348.1aLlK9i6-lkp@intel.com>
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
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20240924/202409242348.1aLlK9i6-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240924/202409242348.1aLlK9i6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409242348.1aLlK9i6-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/codecs/uda1342.c:206:26: warning: 'uda1342_mixmode' defined but not used [-Wunused-const-variable=]
     206 | static const char *const uda1342_mixmode[] = {"Differential", "Analog1", "Analog2", "Both"};
         |                          ^~~~~~~~~~~~~~~
>> sound/soc/codecs/uda1342.c:205:26: warning: 'uda1342_deemph' defined but not used [-Wunused-const-variable=]
     205 | static const char *const uda1342_deemph[] = {"None", "32Khz", "44.1Khz", "48Khz"};
         |                          ^~~~~~~~~~~~~~


vim +/uda1342_mixmode +206 sound/soc/codecs/uda1342.c

   204	
 > 205	static const char *const uda1342_deemph[] = {"None", "32Khz", "44.1Khz", "48Khz"};
 > 206	static const char *const uda1342_mixmode[] = {"Differential", "Analog1", "Analog2", "Both"};
   207	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
