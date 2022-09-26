Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 946622F21
	for <loongarch@lists.linux.dev>; Mon, 26 Sep 2022 14:58:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1664204335; x=1695740335;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YEk0P4ViopuG0/B7+FIOXKhKwkUp+jx+G5pu26NtHE8=;
  b=PCE2JdICkyI1eHPUtyYSVFzqxqqNQpqxhi3B3fgldUf+61Nh/fOZ05H9
   L8p5oHpVk8+s7tbakT8h/NfjOhxrXVAA03akEdpUm8rMaIUMYj/vZl3rZ
   M9axeLhdE0kjH3lgRMQIgqbURTKUlytl+RGbteubk2cMdb/18nw2EX6em
   KsGkpKxqrsiDe3o4QH1SzDZ/uMb+MI4n++DIRkcZfRJ/Fp3pgjMWH7WdA
   kRrA/OVtI2PyyuuSuKXEYwPpq3gmReIK/EaZ2zhg2QMEJKfNKYYlb1k7I
   9X15hN6RYrOtpd/JxiTcQOzDwQlwKMfaEzqpcHGeE6vePPB/wJFRWXRSf
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10482"; a="284166414"
X-IronPort-AV: E=Sophos;i="5.93,346,1654585200"; 
   d="scan'208";a="284166414"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2022 07:58:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10482"; a="654292721"
X-IronPort-AV: E=Sophos;i="5.93,346,1654585200"; 
   d="scan'208";a="654292721"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga001.jf.intel.com with ESMTP; 26 Sep 2022 07:58:52 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 7EC1F101; Mon, 26 Sep 2022 17:59:10 +0300 (EEST)
Date: Mon, 26 Sep 2022 17:59:10 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Wolfram Sang <wsa@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-i2c@vger.kernel.org, loongarch@lists.linux.dev,
	linux-acpi@vger.kernel.org, WANG Xuerui <kernel@xen0n.name>,
	Jianmin Lv <lvjianmin@loongson.cn>,
	Huacai Chen <chenhuacai@loongson.cn>
Subject: Re: [PATCH V2 1/4] i2c: gpio: Add support on ACPI-based system
Message-ID: <YzG+Pr+jNIWhWQnp@black.fi.intel.com>
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

[+Rafael and Andy]

Hi,

On Mon, Sep 26, 2022 at 09:00:04PM +0800, Binbin Zhou wrote:
> Add support for the ACPI-based device registration so that the driver
> can be also enabled through ACPI table.
> 
> Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> ---
>  drivers/i2c/busses/i2c-gpio.c | 30 ++++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
> 
> diff --git a/drivers/i2c/busses/i2c-gpio.c b/drivers/i2c/busses/i2c-gpio.c
> index b1985c1667e1..417eb31e0971 100644
> --- a/drivers/i2c/busses/i2c-gpio.c
> +++ b/drivers/i2c/busses/i2c-gpio.c
> @@ -13,6 +13,7 @@
>  #include <linux/init.h>
>  #include <linux/interrupt.h>
>  #include <linux/module.h>
> +#include <linux/acpi.h>
>  #include <linux/of.h>
>  #include <linux/platform_data/i2c-gpio.h>
>  #include <linux/platform_device.h>
> @@ -318,6 +319,24 @@ static void of_i2c_gpio_get_props(struct device_node *np,
>  		of_property_read_bool(np, "i2c-gpio,scl-output-only");
>  }
>  
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

Otherwise this patch looks good but I'm concerned because we have two
kinds of bindings now. The DT one above uses "i2c-gpio,..." and this
ACPI one uses just "..." so the question is where did these come from?
Is there already some existing system out there with these bindings or
they are documented somewhere?

Ideally we would be able to just do:

	pdata->sda_is_open_drain =
		device_property_read_bool(dev, "i2c-gpio,sda-open-drain");

for any firmware description.

> +
>  static struct gpio_desc *i2c_gpio_get_desc(struct device *dev,
>  					   const char *con_id,
>  					   unsigned int index,
> @@ -375,6 +394,8 @@ static int i2c_gpio_probe(struct platform_device *pdev)
>  
>  	if (np) {
>  		of_i2c_gpio_get_props(np, pdata);
> +	} else if (ACPI_COMPANION(dev)) {
> +		acpi_i2c_gpio_get_props(dev, pdata);
>  	} else {
>  		/*
>  		 * If all platform data settings are zero it is OK
> @@ -491,10 +512,19 @@ static const struct of_device_id i2c_gpio_dt_ids[] = {
>  MODULE_DEVICE_TABLE(of, i2c_gpio_dt_ids);
>  #endif
>  
> +#ifdef CONFIG_ACPI
> +static const struct acpi_device_id i2c_gpio_acpi_match[] = {
> +	{"LOON0005"}, /*LoongArch*/
> +	{}
> +};
> +MODULE_DEVICE_TABLE(acpi, i2c_gpio_acpi_match);
> +#endif
> +
>  static struct platform_driver i2c_gpio_driver = {
>  	.driver		= {
>  		.name	= "i2c-gpio",
>  		.of_match_table	= of_match_ptr(i2c_gpio_dt_ids),
> +		.acpi_match_table = ACPI_PTR(i2c_gpio_acpi_match),
>  	},
>  	.probe		= i2c_gpio_probe,
>  	.remove		= i2c_gpio_remove,
> -- 
> 2.31.1
