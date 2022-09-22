Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA0C633DC
	for <loongarch@lists.linux.dev>; Thu, 22 Sep 2022 12:26:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663849599; x=1695385599;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rRzrFuSbypaKoQ4WmMLMh3HJzLzM0ipVb1Qj4EUhvAI=;
  b=nbShiTDSpzczOZJ1g0OuA8aK3XrIrbW6WBkJ59Hq5V/4em+aYevo0dNG
   yc2N3Awvo+mK/Y74QQwH3V/vSgsDnigETznFciFRtfcqBqNl9ZqbL1Z+6
   SpfKhhMk6qveNUQoL0oJtbu45i4pEoLqmB+tQ4cImMW5/KVl6sa1NvmiR
   BN/+VUbMxo2Qybp3By+uzIW+VM8meirgAU9TisNBEsJR4Kqdcgs4xXdvA
   tf1D4H4qUhBVm0wvT1VWS5MsnDrGxwgmlQPs5Fc/5PqwCqf+YMAgssMl4
   6Li8dnj6+fcQhAehmAkGO0xJpK2iJwmwsz+njFGD4+jXa/QSOeadPd1P2
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10478"; a="298998372"
X-IronPort-AV: E=Sophos;i="5.93,335,1654585200"; 
   d="scan'208";a="298998372"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2022 05:26:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,335,1654585200"; 
   d="scan'208";a="682194504"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga008.fm.intel.com with ESMTP; 22 Sep 2022 05:26:36 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id BDC94238; Thu, 22 Sep 2022 15:26:54 +0300 (EEST)
Date: Thu, 22 Sep 2022 15:26:54 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Wolfram Sang <wsa@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-i2c@vger.kernel.org, loongarch@lists.linux.dev,
	linux-acpi@vger.kernel.org, WANG Xuerui <kernel@xen0n.name>,
	Jianmin Lv <lvjianmin@loongson.cn>,
	Huacai Chen <chenhuacai@loongson.cn>
Subject: Re: [PATCH 2/5] i2c: gpio: Add support on ACPI-based system
Message-ID: <YyxUjuP1TxEzoxvG@black.fi.intel.com>
References: <cover.1663835855.git.zhoubinbin@loongson.cn>
 <74988d34ceae9bf239c138a558778cd999beb77c.1663835855.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <74988d34ceae9bf239c138a558778cd999beb77c.1663835855.git.zhoubinbin@loongson.cn>

Hi,

On Thu, Sep 22, 2022 at 07:39:55PM +0800, Binbin Zhou wrote:
> Add support for the ACPI-based device registration so that the driver
> can be also enabled through ACPI table.
> 
> Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> ---
>  drivers/i2c/busses/i2c-gpio.c | 41 ++++++++++++++++++++++++++++++++++-
>  1 file changed, 40 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-gpio.c b/drivers/i2c/busses/i2c-gpio.c
> index b1985c1667e1..ccea37e755e6 100644
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

I think this would work with the DT description too as it is using
device_property_xxx() so I wonder if you can just do:

	i2c_gpio_get_props(dev, pdata);

instead of

 	if (np) {
 		of_i2c_gpio_get_props(np, pdata);
	} else if (ACPI_COMPANION(dev)) {
		acpi_i2c_gpio_get_props(dev, pdata);

> +
>  static struct gpio_desc *i2c_gpio_get_desc(struct device *dev,
>  					   const char *con_id,
>  					   unsigned int index,
> @@ -363,6 +382,8 @@ static int i2c_gpio_probe(struct platform_device *pdev)
>  	struct device *dev = &pdev->dev;
>  	struct device_node *np = dev->of_node;
>  	enum gpiod_flags gflags;
> +	acpi_status status;
> +	unsigned long long id;
>  	int ret;
>  
>  	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> @@ -375,6 +396,8 @@ static int i2c_gpio_probe(struct platform_device *pdev)
>  
>  	if (np) {
>  		of_i2c_gpio_get_props(np, pdata);
> +	} else if (ACPI_COMPANION(dev)) {
> +		acpi_i2c_gpio_get_props(dev, pdata);
>  	} else {
>  		/*
>  		 * If all platform data settings are zero it is OK
> @@ -445,7 +468,14 @@ static int i2c_gpio_probe(struct platform_device *pdev)
>  	adap->dev.parent = dev;
>  	adap->dev.of_node = np;
>  
> -	adap->nr = pdev->id;
> +	if (ACPI_COMPANION(dev)) {
> +		status = acpi_evaluate_integer(ACPI_HANDLE(dev),
> +						"_UID", NULL, &id);
> +		if (ACPI_SUCCESS(status) && (id >= 0))
> +			adap->nr = id;

Unrelated change? And if not then same comment about why you need the
static number in the first place ;-)
