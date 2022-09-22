Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A33E58B04
	for <loongarch@lists.linux.dev>; Thu, 22 Sep 2022 20:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663877443; x=1695413443;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4wPYIpP5fl9HNix/HS+JwgtdO4tM5jfm3yXBBYEadV4=;
  b=Z1XAbdGNRgdCq25SXhI+zWeKb9RIg3Ts+sLZ4jZGMizU9cvWMGAWaTox
   ZeKXydfQA9N2NW4cYO5yGQ5wNqh1yAeHF/soI85o33Aex/f3nE6WHFyh5
   2HEGAN1L7FzvPpqfh2nw6N6ycAD1IRJj9I2lxGOGRi2sXaV1Tk8i0w73p
   H0IofgPFqkDGjdg52Di4/5YsSo1KmBLehUobaReTdOqwkclyrvGB1OWC3
   X0fGLOUWVxBnVulHE6Z9GGGtWTqlB0OeqI5Q3dDCgGRh/PF/0zc6XXzcL
   UiLJ9NJJ/PK6z5du/qvV6AZ5Hg2YWdT0+M8TInrNzv+xKGHpgT9U4yn+r
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10478"; a="301295958"
X-IronPort-AV: E=Sophos;i="5.93,337,1654585200"; 
   d="scan'208";a="301295958"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2022 13:10:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,337,1654585200"; 
   d="scan'208";a="597592029"
Received: from lkp-server01.sh.intel.com (HELO c0a60f19fe7e) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 22 Sep 2022 13:10:40 -0700
Received: from kbuild by c0a60f19fe7e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1obSWt-0004vg-2d;
	Thu, 22 Sep 2022 20:10:39 +0000
Date: Fri, 23 Sep 2022 04:10:20 +0800
From: kernel test robot <lkp@intel.com>
To: Binbin Zhou <zhoubinbin@loongson.cn>,
	Wolfram Sang <wsa-dev@sang-engineering.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	linux-i2c@vger.kernel.org
Cc: kbuild-all@lists.01.org, loongarch@lists.linux.dev,
	linux-acpi@vger.kernel.org, WANG Xuerui <kernel@xen0n.name>,
	Jianmin Lv <lvjianmin@loongson.cn>,
	Binbin Zhou <zhoubinbin@loongson.cn>,
	Huacai Chen <chenhuacai@loongson.cn>
Subject: Re: [PATCH 2/5] i2c: gpio: Add support on ACPI-based system
Message-ID: <202209230422.se6Sxqnq-lkp@intel.com>
References: <74988d34ceae9bf239c138a558778cd999beb77c.1663835855.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <74988d34ceae9bf239c138a558778cd999beb77c.1663835855.git.zhoubinbin@loongson.cn>

Hi Binbin,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on wsa/i2c/for-next]
[also build test ERROR on linus/master v6.0-rc6 next-20220921]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Binbin-Zhou/i2c-ls2x-Add-support-for-the-Loongson-2K-LS7A-I2C/20220922-194252
base:   https://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-next
config: arc-randconfig-r043-20220922 (https://download.01.org/0day-ci/archive/20220923/202209230422.se6Sxqnq-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/90590b2a30c8afa5bb200812ffa52a3c5bb9da6a
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Binbin-Zhou/i2c-ls2x-Add-support-for-the-Loongson-2K-LS7A-I2C/20220922-194252
        git checkout 90590b2a30c8afa5bb200812ffa52a3c5bb9da6a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   drivers/i2c/busses/i2c-gpio.c: In function 'i2c_gpio_probe':
>> drivers/i2c/busses/i2c-gpio.c:472:26: error: implicit declaration of function 'acpi_evaluate_integer'; did you mean 'acpi_evaluate_object'? [-Werror=implicit-function-declaration]
     472 |                 status = acpi_evaluate_integer(ACPI_HANDLE(dev),
         |                          ^~~~~~~~~~~~~~~~~~~~~
         |                          acpi_evaluate_object
   cc1: some warnings being treated as errors


vim +472 drivers/i2c/busses/i2c-gpio.c

   375	
   376	static int i2c_gpio_probe(struct platform_device *pdev)
   377	{
   378		struct i2c_gpio_private_data *priv;
   379		struct i2c_gpio_platform_data *pdata;
   380		struct i2c_algo_bit_data *bit_data;
   381		struct i2c_adapter *adap;
   382		struct device *dev = &pdev->dev;
   383		struct device_node *np = dev->of_node;
   384		enum gpiod_flags gflags;
   385		acpi_status status;
   386		unsigned long long id;
   387		int ret;
   388	
   389		priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
   390		if (!priv)
   391			return -ENOMEM;
   392	
   393		adap = &priv->adap;
   394		bit_data = &priv->bit_data;
   395		pdata = &priv->pdata;
   396	
   397		if (np) {
   398			of_i2c_gpio_get_props(np, pdata);
   399		} else if (ACPI_COMPANION(dev)) {
   400			acpi_i2c_gpio_get_props(dev, pdata);
   401		} else {
   402			/*
   403			 * If all platform data settings are zero it is OK
   404			 * to not provide any platform data from the board.
   405			 */
   406			if (dev_get_platdata(dev))
   407				memcpy(pdata, dev_get_platdata(dev), sizeof(*pdata));
   408		}
   409	
   410		/*
   411		 * First get the GPIO pins; if it fails, we'll defer the probe.
   412		 * If the SCL/SDA lines are marked "open drain" by platform data or
   413		 * device tree then this means that something outside of our control is
   414		 * marking these lines to be handled as open drain, and we should just
   415		 * handle them as we handle any other output. Else we enforce open
   416		 * drain as this is required for an I2C bus.
   417		 */
   418		if (pdata->sda_is_open_drain)
   419			gflags = GPIOD_OUT_HIGH;
   420		else
   421			gflags = GPIOD_OUT_HIGH_OPEN_DRAIN;
   422		priv->sda = i2c_gpio_get_desc(dev, "sda", 0, gflags);
   423		if (IS_ERR(priv->sda))
   424			return PTR_ERR(priv->sda);
   425	
   426		if (pdata->scl_is_open_drain)
   427			gflags = GPIOD_OUT_HIGH;
   428		else
   429			gflags = GPIOD_OUT_HIGH_OPEN_DRAIN;
   430		priv->scl = i2c_gpio_get_desc(dev, "scl", 1, gflags);
   431		if (IS_ERR(priv->scl))
   432			return PTR_ERR(priv->scl);
   433	
   434		if (gpiod_cansleep(priv->sda) || gpiod_cansleep(priv->scl))
   435			dev_warn(dev, "Slow GPIO pins might wreak havoc into I2C/SMBus bus timing");
   436		else
   437			bit_data->can_do_atomic = true;
   438	
   439		bit_data->setsda = i2c_gpio_setsda_val;
   440		bit_data->setscl = i2c_gpio_setscl_val;
   441	
   442		if (!pdata->scl_is_output_only)
   443			bit_data->getscl = i2c_gpio_getscl;
   444		bit_data->getsda = i2c_gpio_getsda;
   445	
   446		if (pdata->udelay)
   447			bit_data->udelay = pdata->udelay;
   448		else if (pdata->scl_is_output_only)
   449			bit_data->udelay = 50;			/* 10 kHz */
   450		else
   451			bit_data->udelay = 5;			/* 100 kHz */
   452	
   453		if (pdata->timeout)
   454			bit_data->timeout = pdata->timeout;
   455		else
   456			bit_data->timeout = HZ / 10;		/* 100 ms */
   457	
   458		bit_data->data = priv;
   459	
   460		adap->owner = THIS_MODULE;
   461		if (np)
   462			strscpy(adap->name, dev_name(dev), sizeof(adap->name));
   463		else
   464			snprintf(adap->name, sizeof(adap->name), "i2c-gpio%d", pdev->id);
   465	
   466		adap->algo_data = bit_data;
   467		adap->class = I2C_CLASS_HWMON | I2C_CLASS_SPD;
   468		adap->dev.parent = dev;
   469		adap->dev.of_node = np;
   470	
   471		if (ACPI_COMPANION(dev)) {
 > 472			status = acpi_evaluate_integer(ACPI_HANDLE(dev),
   473							"_UID", NULL, &id);
   474			if (ACPI_SUCCESS(status) && (id >= 0))
   475				adap->nr = id;
   476		} else
   477			adap->nr = pdev->id;
   478	
   479		ret = i2c_bit_add_numbered_bus(adap);
   480		if (ret)
   481			return ret;
   482	
   483		platform_set_drvdata(pdev, priv);
   484	
   485		/*
   486		 * FIXME: using global GPIO numbers is not helpful. If/when we
   487		 * get accessors to get the actual name of the GPIO line,
   488		 * from the descriptor, then provide that instead.
   489		 */
   490		dev_info(dev, "using lines %u (SDA) and %u (SCL%s)\n",
   491			 desc_to_gpio(priv->sda), desc_to_gpio(priv->scl),
   492			 pdata->scl_is_output_only
   493			 ? ", no clock stretching" : "");
   494	
   495		i2c_gpio_fault_injector_init(pdev);
   496	
   497		return 0;
   498	}
   499	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
