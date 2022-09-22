Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0075E2CA2;
	Thu, 22 Sep 2022 18:59:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663873188; x=1695409188;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9hTR12KVYSG4WSUvy2XMfzfpJCVSwEHiEJ4NpOyo/so=;
  b=PlJbaHRq3VOC5WZIGVdzPkd8dgO0WFH9pY0K6x35us+NDPkoWPQepQNX
   kvHzqIKrMk5klrYIhoYVrCcbwEpaN8CgVZIG4iuq0GRQSCUHIDtzpVt3g
   8n4X4102jGxDRRADvj+o1+jj2eg3DywEh/0ttOkaWjDrLzVJmRgghdI1q
   Ygm3cZ5LU1aPRPHjnQcp6e5MTAkzx0dtRxsrSO/5z7UMHVWNZWQMMGfXl
   +SLINNPma1vDr2O7WSne3CUMcSWITau6uerVpmj/DN7KSdDc2VMp40Owl
   mZR93P5xYbeDAay08UzzlVYPzs0fYgTWHe27acHVgq4D8YTje+dxAM6dz
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10478"; a="386687387"
X-IronPort-AV: E=Sophos;i="5.93,337,1654585200"; 
   d="scan'208";a="386687387"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2022 11:59:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,337,1654585200"; 
   d="scan'208";a="597568053"
Received: from lkp-server01.sh.intel.com (HELO c0a60f19fe7e) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 22 Sep 2022 11:59:36 -0700
Received: from kbuild by c0a60f19fe7e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1obRQ7-0004sq-2c;
	Thu, 22 Sep 2022 18:59:35 +0000
Date: Fri, 23 Sep 2022 02:58:59 +0800
From: kernel test robot <lkp@intel.com>
To: Binbin Zhou <zhoubinbin@loongson.cn>,
	Wolfram Sang <wsa-dev@sang-engineering.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	linux-i2c@vger.kernel.org
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	loongarch@lists.linux.dev, linux-acpi@vger.kernel.org,
	WANG Xuerui <kernel@xen0n.name>, Jianmin Lv <lvjianmin@loongson.cn>,
	Binbin Zhou <zhoubinbin@loongson.cn>,
	Huacai Chen <chenhuacai@loongson.cn>
Subject: Re: [PATCH 1/5] i2c: core: Pick i2c bus number from ACPI if present
Message-ID: <202209230228.LIiHRmuw-lkp@intel.com>
References: <be5cd69c7c58d44ca119d4ca692d95a2ae924533.1663835855.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <be5cd69c7c58d44ca119d4ca692d95a2ae924533.1663835855.git.zhoubinbin@loongson.cn>

Hi Binbin,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on wsa/i2c/for-next]
[also build test ERROR on linus/master v6.0-rc6 next-20220921]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Binbin-Zhou/i2c-ls2x-Add-support-for-the-Loongson-2K-LS7A-I2C/20220922-194252
base:   https://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-next
config: hexagon-randconfig-r041-20220922 (https://download.01.org/0day-ci/archive/20220923/202209230228.LIiHRmuw-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 791a7ae1ba3efd6bca96338e10ffde557ba83920)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/749fc796eb66dc42c209c6a5808c6b2a5e47fbb6
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Binbin-Zhou/i2c-ls2x-Add-support-for-the-Loongson-2K-LS7A-I2C/20220922-194252
        git checkout 749fc796eb66dc42c209c6a5808c6b2a5e47fbb6
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/i2c/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/i2c/i2c-core-base.c:1568:12: error: call to undeclared function 'acpi_evaluate_integer'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                   status = acpi_evaluate_integer(ACPI_HANDLE(dev->parent),
                            ^
   drivers/i2c/i2c-core-base.c:1568:12: note: did you mean 'acpi_evaluate_object'?
   include/acpi/acpixf.h:550:8: note: 'acpi_evaluate_object' declared here
                               acpi_evaluate_object(acpi_handle object,
                               ^
   include/acpi/platform/aclinux.h:93:21: note: expanded from macro 'ACPI_EXTERNAL_RETURN_STATUS'
           static ACPI_INLINE prototype {return(AE_NOT_CONFIGURED);}
                              ^
   1 error generated.


vim +/acpi_evaluate_integer +1568 drivers/i2c/i2c-core-base.c

  1540	
  1541	/**
  1542	 * i2c_add_adapter - declare i2c adapter, use dynamic bus number
  1543	 * @adapter: the adapter to add
  1544	 * Context: can sleep
  1545	 *
  1546	 * This routine is used to declare an I2C adapter when its bus number
  1547	 * doesn't matter or when its bus number is specified by an dt alias.
  1548	 * Examples of bases when the bus number doesn't matter: I2C adapters
  1549	 * dynamically added by USB links or PCI plugin cards.
  1550	 *
  1551	 * When this returns zero, a new bus number was allocated and stored
  1552	 * in adap->nr, and the specified adapter became available for clients.
  1553	 * Otherwise, a negative errno value is returned.
  1554	 */
  1555	int i2c_add_adapter(struct i2c_adapter *adapter)
  1556	{
  1557		struct device *dev = &adapter->dev;
  1558		acpi_status status;
  1559		unsigned long long id;
  1560	
  1561		if (dev->of_node) {
  1562			id = of_alias_get_id(dev->of_node, "i2c");
  1563			if (id >= 0) {
  1564				adapter->nr = id;
  1565				return __i2c_add_numbered_adapter(adapter);
  1566			}
  1567		} else if (dev->parent->fwnode) {
> 1568			status = acpi_evaluate_integer(ACPI_HANDLE(dev->parent),
  1569							"_UID", NULL, &id);
  1570			if (ACPI_SUCCESS(status) && (id >= 0)) {
  1571				adapter->nr = id;
  1572				return __i2c_add_numbered_adapter(adapter);
  1573			}
  1574		}
  1575	
  1576		mutex_lock(&core_lock);
  1577		id = idr_alloc(&i2c_adapter_idr, adapter,
  1578			       __i2c_first_dynamic_bus_num, 0, GFP_KERNEL);
  1579		mutex_unlock(&core_lock);
  1580		if (WARN(id < 0, "couldn't get idr"))
  1581			return id;
  1582	
  1583		adapter->nr = id;
  1584	
  1585		return i2c_register_adapter(adapter);
  1586	}
  1587	EXPORT_SYMBOL(i2c_add_adapter);
  1588	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
