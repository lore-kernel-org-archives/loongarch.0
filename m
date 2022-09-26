Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15ACA3D70
	for <loongarch@lists.linux.dev>; Mon, 26 Sep 2022 15:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1664206780; x=1695742780;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bpjB9oa09/n7/0gP0TKZgaDRnnGyZ1buQjAUJvrc8z0=;
  b=bwJCO57Od6SvnnjSZDXZOktPfBhzqCVjRT7/b7xPVi1XrEtXIRw3+CTo
   /KbGuwF2WTtzA3O5ELq/jd8OdCyzefdfGJT8TZb5RpEaSE0RmtlR2VvW+
   vLDbUhTCAdHhcdgK3K99jYviKYt0cFSolFNFHi+H0ntosfRwAxDAwXRbU
   9QqwuzIcBsuHAVL55m4CWbMaY/Uv5yfeXsdgo3mMrqzNzvcLxBTjVgXU6
   80eidJ4yW6XaP12Pb4UYa8r3TXC4qF9Ip1ykb9UIeFC1rKwarj3Uuz52T
   yiOzWrxr7IcgYmVexnITHM7zfS1FoEj65Yc2XfivZd+b66p1OF9Zp08Ye
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10482"; a="365092985"
X-IronPort-AV: E=Sophos;i="5.93,346,1654585200"; 
   d="scan'208";a="365092985"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2022 08:39:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10482"; a="621100753"
X-IronPort-AV: E=Sophos;i="5.93,346,1654585200"; 
   d="scan'208";a="621100753"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga002.jf.intel.com with ESMTP; 26 Sep 2022 08:39:23 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1ocqCX-0080sk-17;
	Mon, 26 Sep 2022 18:39:21 +0300
Date: Mon, 26 Sep 2022 18:39:21 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Wolfram Sang <wsa@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	linux-i2c@vger.kernel.org, loongarch@lists.linux.dev,
	linux-acpi@vger.kernel.org, WANG Xuerui <kernel@xen0n.name>,
	Jianmin Lv <lvjianmin@loongson.cn>,
	Huacai Chen <chenhuacai@loongson.cn>
Subject: Re: [PATCH V2 1/4] i2c: gpio: Add support on ACPI-based system
Message-ID: <YzHHqXUdLR5W/sw+@smile.fi.intel.com>
References: <cover.1664193316.git.zhoubinbin@loongson.cn>
 <f5df899e2218c0cd8cc8782b4a8f157ebb9726bc.1664193316.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f5df899e2218c0cd8cc8782b4a8f157ebb9726bc.1664193316.git.zhoubinbin@loongson.cn>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Sep 26, 2022 at 09:00:04PM +0800, Binbin Zhou wrote:
> Add support for the ACPI-based device registration so that the driver
> can be also enabled through ACPI table.
> 
> Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>

Who is this and why this SoB in the chain?

> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>

...

>  #include <linux/init.h>
>  #include <linux/interrupt.h>
>  #include <linux/module.h>
> +#include <linux/acpi.h>
>  #include <linux/of.h>
>  #include <linux/platform_data/i2c-gpio.h>
>  #include <linux/platform_device.h>

Seems you misinterpret ordering.

Besides that I don't see the needs of acpi.h. The header missed the
mod_devicetable.h (even without this patch), and your code needs property.h.

...

> +static void acpi_i2c_gpio_get_props(struct device *dev,
> +				  struct i2c_gpio_platform_data *pdata)
> +{
> +	u32 reg;
> +
> +	device_property_read_u32(dev, "delay-us", &pdata->udelay);
> +
> +	if (!device_property_read_u32(dev, "timeout-ms", &reg))
> +		pdata->timeout = msecs_to_jiffies(reg);
> +
> +	pdata->sda_is_open_drain =
> +		device_property_read_bool(dev, "sda-open-drain");
> +	pdata->scl_is_open_drain =
> +		device_property_read_bool(dev, "scl-open-drain");
> +	pdata->scl_is_output_only =
> +		device_property_read_bool(dev, "scl-output-only");
> +}

+1 to Mika's objection. Instead, make the common bindings and convert
the driver from OF to be agnostic.

...

>  MODULE_DEVICE_TABLE(of, i2c_gpio_dt_ids);
>  #endif
>  
> +#ifdef CONFIG_ACPI

Please, drop these ifdefferies (including OF one), it's more harmful
than useful.

> +#endif

...

>  		.of_match_table	= of_match_ptr(i2c_gpio_dt_ids),
> +		.acpi_match_table = ACPI_PTR(i2c_gpio_acpi_match),

No ACPI_PTR(), and accordingly no of_match_ptr(). See above.

-- 
With Best Regards,
Andy Shevchenko


