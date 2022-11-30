Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B62F5801
	for <loongarch@lists.linux.dev>; Wed, 30 Nov 2022 20:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1669840342; x=1701376342;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tUXXdUxbyL1XhGdlXtjhkDQSLX/WQBuwUckCuNgvEI8=;
  b=EuOdY6zjyKs9uCMvc73Cs59gAdj1fNJvvqyt0JtRHZOVk7d2eTdphNMi
   6zq8H1GmuSfU7ZDCdpxLxA5uJWfiwLWX5iUA0ZqiiSrVlO/OcjluXPowI
   +zd2FgmnyGXlZXos5+8jbid1e7zuk5NuTQRWyvfe3hNWGxeabF/44wBp4
   ig/etHqH6ggxv5WcX/TjLnPXDvw9wFRikmByCdxc9vEXFbf4SZuS4CKiw
   areyI3/+rNssalR3uizp2EEnjzWmvERl2Y7IQv29FHwE2pi6+XexvKJzT
   8OWLAGODHN7pcNp5jkt7m8sgnTFlB2+anpiQyWxbZE6sOC/FEhc87n8km
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10547"; a="313135100"
X-IronPort-AV: E=Sophos;i="5.96,207,1665471600"; 
   d="scan'208";a="313135100"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2022 12:32:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10547"; a="786612376"
X-IronPort-AV: E=Sophos;i="5.96,207,1665471600"; 
   d="scan'208";a="786612376"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga001.fm.intel.com with ESMTP; 30 Nov 2022 12:32:15 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1p0Tkb-002Szl-0T;
	Wed, 30 Nov 2022 22:32:13 +0200
Date: Wed, 30 Nov 2022 22:32:12 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Wolfram Sang <wsa@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	linux-i2c@vger.kernel.org, loongarch@lists.linux.dev,
	devicetree@vger.kernel.org, Huacai Chen <chenhuacai@loongson.cn>,
	WANG Xuerui <kernel@xen0n.name>, Arnd Bergmann <arnd@arndb.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Jianmin Lv <lvjianmin@loongson.cn>
Subject: Re: [PATCH V4 2/5] i2c: gpio: Add support on ACPI-based system
Message-ID: <Y4e9zDmxohmf5Go8@smile.fi.intel.com>
References: <cover.1669777792.git.zhoubinbin@loongson.cn>
 <05a28866877347f2aaed34288ad76963905e2f33.1669777792.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <05a28866877347f2aaed34288ad76963905e2f33.1669777792.git.zhoubinbin@loongson.cn>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Nov 30, 2022 at 01:55:52PM +0800, Binbin Zhou wrote:
> Add support for the ACPI-based device registration, so that the driver
> can be also enabled through ACPI table.

...

The of.h is left with this patch. Is it still needed?

...

> +/* Get i2c-gpio props from DT or ACPI table */

properties

> +static void i2c_gpio_get_props(struct device *dev,

_properties

> +				struct i2c_gpio_platform_data *pdata)

-- 
With Best Regards,
Andy Shevchenko


