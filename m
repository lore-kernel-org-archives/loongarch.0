Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8487A2904;
	Sun, 20 Oct 2024 02:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729389918; cv=none; b=BsaBXJ7I0XN+iNz4y/8ode3+UiUI9NgXSEE9fC3a24JohVrSYPZhDEVdcO9+7QtdeJrh5hl9bCkkwroHs9FB+x4PyvjUDU2w7GRN0tkc+gVFbni7l07ob0QHRvOH/hxdAvU/+psde7+PVtfsvDldS3aC5d0Xt4qTRZWCHOByp9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729389918; c=relaxed/simple;
	bh=83M22/fJyGB1tR9/miY2c43dp32t29qIpAheq1Shv50=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T+VN5FyUCUxXkJe5AHuBHhSGdqMdCBm+mVZC0xIZee1R9T1OpN6LpAGLzLwN9kt0dEmSg615F1+M7kYr1X+ecPCZIUsXTZzghA1nfTY0/3xCpKTluJSkRv5o2WEZwSUXPEZeQm9/qU5eVocd8c4rXi00I2MVjaT7ntI0kLwiVXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZjNT0s3o; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZjNT0s3o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729389915; x=1760925915;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=83M22/fJyGB1tR9/miY2c43dp32t29qIpAheq1Shv50=;
  b=ZjNT0s3o9LNPgHnras8k2u8J+pxBplKhaozNEMOaItZpyOCceMsOa/yh
   kz4mziG7D9Ni7Q8zlCoQdaLbO/8dIKKgdabpFzrEMEEmJgjhE0b3HDgoM
   QxPP1u/n7lPE8GLJHze71LcYYq3sB7za/ls8lc69TUsATBC8g9On75zwC
   GaO6I8hGN4k0Puq7xpuYqQ1cV0DISLUOGvzKzYmvV7so2iuPvhrJ7+35C
   PMMkYW1qCwezDCZ2swumaV33juGAxko2b0+x24JzveUivBfKWWJ6+H2CV
   KMO4RMQPls0VSwMKQuvIhBp38SI1F8H/LhKpdqflr0n0RBJ81eXkIJdgq
   Q==;
X-CSE-ConnectionGUID: WVGDQBrxQya5/xISTgEmiQ==
X-CSE-MsgGUID: 6171TOciS921cVEPaCDTDw==
X-IronPort-AV: E=McAfee;i="6700,10204,11230"; a="39517318"
X-IronPort-AV: E=Sophos;i="6.11,217,1725346800"; 
   d="scan'208";a="39517318"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2024 19:05:15 -0700
X-CSE-ConnectionGUID: 3XsXIaETS8iLPcmLmKlhqA==
X-CSE-MsgGUID: mL48R6XcR/2dOcW6NfDUFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,217,1725346800"; 
   d="scan'208";a="79351368"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 19 Oct 2024 19:05:11 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t2LJc-000Pm9-1K;
	Sun, 20 Oct 2024 02:05:08 +0000
Date: Sun, 20 Oct 2024 10:04:41 +0800
From: kernel test robot <lkp@intel.com>
To: Zhao Qunqin <zhaoqunqin@loongson.cn>, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, chenhuacai@kernel.org,
	bp@alien8.de, tony.luck@intel.com, james.morse@arm.com,
	mchehab@kernel.org, rric@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linux-edac@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel@xen0n.name, loongarch@lists.linux.dev,
	Jonathan.Cameron@huawei.com, Zhao Qunqin <zhaoqunqin@loongson.cn>
Subject: Re: [PATCH v6 RESEND 2/2] EDAC: Add EDAC driver for loongson memory
 controller
Message-ID: <202410200949.GpnHSLfV-lkp@intel.com>
References: <20241018014542.27283-3-zhaoqunqin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241018014542.27283-3-zhaoqunqin@loongson.cn>

Hi Zhao,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 61124f42dcaa30f58a8b47a2b69ddb80260677c7]

url:    https://github.com/intel-lab-lkp/linux/commits/Zhao-Qunqin/dt-bindings-EDAC-for-ls3a5000-memory-controller/20241018-094803
base:   61124f42dcaa30f58a8b47a2b69ddb80260677c7
patch link:    https://lore.kernel.org/r/20241018014542.27283-3-zhaoqunqin%40loongson.cn
patch subject: [PATCH v6 RESEND 2/2] EDAC: Add EDAC driver for loongson memory controller
config: arm64-randconfig-r113-20241019 (https://download.01.org/0day-ci/archive/20241020/202410200949.GpnHSLfV-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20241020/202410200949.GpnHSLfV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410200949.GpnHSLfV-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/edac/loongson_edac.c:100:15: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned long long [usertype] *vbase @@     got void [noderef] __iomem * @@
   drivers/edac/loongson_edac.c:100:15: sparse:     expected unsigned long long [usertype] *vbase
   drivers/edac/loongson_edac.c:100:15: sparse:     got void [noderef] __iomem *

vim +100 drivers/edac/loongson_edac.c

    91	
    92	static int edac_probe(struct platform_device *pdev)
    93	{
    94		struct edac_mc_layer layers[2];
    95		struct loongson_edac_pvt *pvt;
    96		struct mem_ctl_info *mci;
    97		u64 *vbase;
    98		int ret;
    99	
 > 100		vbase = devm_platform_ioremap_resource(pdev, 0);
   101		if (IS_ERR(vbase))
   102			return PTR_ERR(vbase);
   103	
   104		/* allocate a new MC control structure */
   105		layers[0].type = EDAC_MC_LAYER_CHANNEL;
   106		layers[0].size = 1;
   107		layers[0].is_virt_csrow = false;
   108		layers[1].type = EDAC_MC_LAYER_SLOT;
   109		layers[1].size = 1;
   110		layers[1].is_virt_csrow = true;
   111		mci = edac_mc_alloc(0, ARRAY_SIZE(layers), layers, sizeof(*pvt));
   112		if (mci == NULL)
   113			return -ENOMEM;
   114	
   115		mci->mc_idx = edac_device_alloc_index();
   116		mci->mtype_cap = MEM_FLAG_RDDR4;
   117		mci->edac_ctl_cap = EDAC_FLAG_NONE;
   118		mci->edac_cap = EDAC_FLAG_NONE;
   119		mci->mod_name = "loongson_edac.c";
   120		mci->ctl_name = "loongson_edac_ctl";
   121		mci->dev_name = "loongson_edac_dev";
   122		mci->ctl_page_to_phys = NULL;
   123		mci->pdev = &pdev->dev;
   124		mci->error_desc.grain = 8;
   125		/* Set the function pointer to an actual operation function */
   126		mci->edac_check = edac_check;
   127	
   128		pvt_init(mci, vbase);
   129		get_dimm_config(mci);
   130	
   131		ret = edac_mc_add_mc(mci);
   132		if (ret) {
   133			edac_dbg(0, "MC: failed edac_mc_add_mc()\n");
   134			edac_mc_free(mci);
   135			return ret;
   136		}
   137		edac_op_state = EDAC_OPSTATE_POLL;
   138	
   139		return 0;
   140	}
   141	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
