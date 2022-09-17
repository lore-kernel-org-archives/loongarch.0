Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16C5A63A
	for <loongarch@lists.linux.dev>; Sat, 17 Sep 2022 10:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1663408814;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SCkLSP0E4yxXlnFgQrKphv334iYRQIwNmCq8vrighrE=;
	b=bGSZjm7ETotLvN7Jkg9HR9eunhCwEKYLHNKKQ2Rb9isFdpMFXPWUecnJKJpcVxtb3DuYfk
	AIKBaxsBic1vEzSMjYotEo6s8Ej5I9k4FHXuOLBwuL8KXdH1UYsaKn/S/gU+CxggEw9+SI
	2cM1tIkFfcur6MYilb9bBZGjWbnE3s0=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-652-AUt70-ClMkGn97jgXvWoxQ-1; Sat, 17 Sep 2022 06:00:11 -0400
X-MC-Unique: AUt70-ClMkGn97jgXvWoxQ-1
Received: by mail-ej1-f71.google.com with SMTP id xj11-20020a170906db0b00b0077b6ecb23fcso7736042ejb.5
        for <loongarch@lists.linux.dev>; Sat, 17 Sep 2022 03:00:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=SCkLSP0E4yxXlnFgQrKphv334iYRQIwNmCq8vrighrE=;
        b=v4fJvYapYHl0ictDzlV4uoYClMsm/bMnjLLCLlhrs14UL0kYl/ggdjEX7T/JhMFCPY
         3NoAOEoT9FWAvB3iRM3SHiIf6q3pEIeT4R8QZuq7sbu2Ef/IXM732uuVI27ftI5JP2G5
         OePOVMZkn5cP5EQHULPs919IP4Wlrb9ctTJLrKBMuZn/Tw7kkq51aYyZXjSN/QgWLazi
         Fi5OgN5S6e+18JPOYfo1PzYGAIl0Z35K7nY8mw8ZfBxyw4THLwxaa/O86wvhnM0mZjex
         w2F3akW/VVEa+b8xRj1AZrah4JHYtZ7SJtUiF0GLYY7aUG2lNBIKqqdDaJlTQ9rvQrUh
         PiJA==
X-Gm-Message-State: ACrzQf3ScSl/hYrNmAkqDzS3I+gv4GZUAsI0/9Ju1foqRDdWYH5Kkcla
	bBp5J/lFg+E8+tR1bivVX5Fgp8BaJD5pp+EBQv3L2gB+BjI2c9EpNPLGxg5mXXzukIqbVPQmxE3
	2vQJCHG6o38ZJR9Jwso+g
X-Received: by 2002:aa7:d315:0:b0:44e:6647:9dae with SMTP id p21-20020aa7d315000000b0044e66479daemr7168778edq.280.1663408810457;
        Sat, 17 Sep 2022 03:00:10 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4T08btJRM8tjbkuSclLPEK5zBDHbsD6cG4vTOxt5rh4g4XMjMbhikELcnrODmfgTROgquMkw==
X-Received: by 2002:aa7:d315:0:b0:44e:6647:9dae with SMTP id p21-20020aa7d315000000b0044e66479daemr7168764edq.280.1663408810249;
        Sat, 17 Sep 2022 03:00:10 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id ky17-20020a170907779100b0073bf84be798sm11985183ejc.142.2022.09.17.03.00.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Sep 2022 03:00:09 -0700 (PDT)
Message-ID: <80b46671-6d01-f2a2-7b9b-cb4c27cc87c6@redhat.com>
Date: Sat, 17 Sep 2022 12:00:09 +0200
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH V3] LoongArch: Add ACPI-based generic laptop driver
To: Huacai Chen <chenhuacai@loongson.cn>, Arnd Bergmann <arnd@arndb.de>,
 Huacai Chen <chenhuacai@kernel.org>, "Rafael J . Wysocki"
 <rjw@rjwysocki.net>, Len Brown <lenb@kernel.org>,
 Robert Moore <robert.moore@intel.com>, Mark Gross <markgross@kernel.org>
Cc: loongarch@lists.linux.dev, linux-arch@vger.kernel.org,
 linux-acpi@vger.kernel.org, Xuefeng Li <lixuefeng@loongson.cn>,
 Jianmin Lv <lvjianmin@loongson.cn>, Jiaxun Yang <jiaxun.yang@flygoat.com>
References: <20220917065250.1671718-1-chenhuacai@loongson.cn>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220917065250.1671718-1-chenhuacai@loongson.cn>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi again,

On 9/17/22 08:52, Huacai Chen wrote:
> From: Jianmin Lv <lvjianmin@loongson.cn>
> 
> This add ACPI-based generic laptop driver for Loongson-3. Some of the
> codes are derived from drivers/platform/x86/thinkpad_acpi.c.
> 
> Signed-off-by: Jianmin Lv <lvjianmin@loongson.cn>
> Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
> ---
> V2: Fix problems pointed out by Arnd.
> V3: Use platform driver instead of acpi driver.

A couple more notes which I noticed just after sending my previous email:

> +#define ACPI_LAPTOP_VERSION "1.0"
> +#define ACPI_LAPTOP_NAME "loongson-laptop"
> +#define ACPI_LAPTOP_DESC "Loongson Laptop/all-in-one ACPI Driver"
> +#define ACPI_LAPTOP_FILE ACPI_LAPTOP_NAME "_acpi"
> +#define ACPI_LAPTOP_DRVR_NAME ACPI_LAPTOP_FILE
> +#define ACPI_LAPTOP_ACPI_EVENT_PREFIX "loongson"

Do you really need / use all these defines ?

> +static const struct acpi_device_id loongson_htk_device_ids[] = {
> +	{LOONGSON_ACPI_HKEY_HID, 0},
> +	{"", 0},
> +};

You will want to put a:

MODULE_DEVICE_TABLE(acpi, loongson_htk_device_ids);

line here for proper automatic loading when build as a module.

> +
> +static struct platform_driver loongson_hotkey_driver = {
> +	.probe		= loongson_hotkey_probe,
> +	.driver		= {
> +		.name	= "loongson-hotkey",
> +		.owner	= THIS_MODULE,
> +		.pm	= pm_ptr(&loongson_hotkey_pm),
> +		.acpi_match_table = ACPI_PTR(loongson_htk_device_ids),

Since you unconditionally define loongson_htk_device_ids above;
and since you have a "depends on ACPI" in your Kconfig, you can drop
the ACPI_PTR() here, just use loongson_htk_device_ids directly.

> +static int __init generic_acpi_laptop_init(void)
> +{
> +	bool ec_found;
> +	int i, ret, status;
> +
> +	if (acpi_disabled)
> +		return -ENODEV;
> +
> +	/* The EC device is required */
> +	ec_found = acpi_dev_found(LOONGSON_ACPI_EC_HID);
> +	if (!ec_found)
> +		return -ENODEV;
> +
> +	/* Enable SCI for EC */
> +	acpi_write_bit_register(ACPI_BITREG_SCI_ENABLE, 1);
> +
> +	generic_inputdev = input_allocate_device();
> +	if (!generic_inputdev) {
> +		pr_err("Unable to allocate input device\n");
> +		return -ENOMEM;
> +	}
> +
> +	/* Prepare input device, but don't register */
> +	generic_inputdev->name =
> +		"Loongson Generic Laptop/All-in-one Extra Buttons";
> +	generic_inputdev->phys = ACPI_LAPTOP_DRVR_NAME "/input0";
> +	generic_inputdev->id.bustype = BUS_HOST;
> +	generic_inputdev->dev.parent = NULL;
> +
> +	/* Init subdrivers */
> +	for (i = 0; i < ARRAY_SIZE(generic_sub_drivers); i++) {
> +		ret = generic_subdriver_init(&generic_sub_drivers[i]);
> +		if (ret < 0) {
> +			input_free_device(generic_inputdev);
> +			return ret;
> +		}
> +	}

I see above that you have only 1 subdriver. Do you expect there to be
more in the future ?  If not then it would be better to just completely
remove the subdriver abstraction and simply do everything directly
from the main probe/remove functions (see below).

> +
> +	ret = input_register_device(generic_inputdev);
> +	if (ret < 0) {
> +		input_free_device(generic_inputdev);
> +		pr_err("Unable to register input device\n");
> +		return ret;
> +	}
> +
> +	input_device_registered = 1;
> +
> +	if (acpi_evalf(hotkey_handle, &status, "ECBG", "d")) {
> +		pr_info("Loongson Laptop used, init brightness is 0x%x\n", status);
> +		ret = laptop_backlight_register();
> +		if (ret < 0)
> +			pr_err("Loongson Laptop: laptop-backlight device register failed\n");
> +	}
> +
> +	return 0;
> +}

All of generic_acpi_laptop_init should be done from loongson_hotkey_probe()
and instead of using global variables all data you need should be in a struct
and that struct should be alloc-ed from loongson_hotkey_probe() and then tied
to the platform_device using platform_set_drvdata() and retreived on remove
using platform_get_drvdata() and on suspend/resume using dev_get_drvdata().

> +static void __exit generic_acpi_laptop_exit(void)
> +{
> +	if (generic_inputdev) {
> +		if (input_device_registered)
> +			input_unregister_device(generic_inputdev);
> +		else
> +			input_free_device(generic_inputdev);
> +	}
> +}

This should be done from a remove function which then gets set as the
remove callback in loongson_hotkey_driver.

I see at a quick glance that you based this driver on thinkpad_acpi.c
but that is a very old driver which does a bunch of things in old,
deprecated ways which are hard to fix for userspace API compatibility
reasons.

Now a days we try to avoid global variables and also custom 
module_init()/module_exit() functions.

> +module_init(generic_acpi_laptop_init);
> +module_exit(generic_acpi_laptop_exit);

Once the work of these 2 functions is done from loongson_hotkey_driver.probe /
loongson_hotkey_driver.remove, you can replace this with:

module_platform_driver(loongson_hotkey_driver);

> +
> +MODULE_ALIAS("platform:acpi-laptop");

This is not necessary, what you need for autoloading is the:

MODULE_DEVICE_TABLE(acpi, loongson_htk_device_ids);

mentioned above.

> +MODULE_AUTHOR("Jianmin Lv <lvjianmin@loongson.cn>");
> +MODULE_AUTHOR("Huacai Chen <chenhuacai@loongson.cn>");
> +MODULE_DESCRIPTION(ACPI_LAPTOP_DESC);

You only use the ACPI_LAPTOP_DESC #define once, please just
put its contents directly here.

> +MODULE_VERSION(ACPI_LAPTOP_VERSION);

Modules having there own versioning separate from the kernel
is something from the past. Please drop the MODULE_VERSION() line
and the ACPI_LAPTOP_VERSION #define.

> +MODULE_LICENSE("GPL");

Regards,

Hans

