Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795428962;
	b=gsaQKhfTTNhaluFBEplNaM9gFIMW/nihI4QW8Zw27kBeKpAFQHkWkUc9TpK2fhCd7VDM
	 wTUlWGBwUsdiZ0DsusuatiRQzFLdiU4OeJenP4jJkbNrzvWVIylaWJF64iuLi7mFV8M5r
	 ph1YDpE96k8XIxE4/bQwOqwbo+d0eI7P8AolrjGYGklp2jtOBbbwAPn991DIOPXSuLw02
	 CRW4Ab+8vNjEMhfenwx3wioSwANmNvUC3M9MQ9QPqphr6ZJh5mzT3jw9NO22LijljXYtS
	 654/TdTEifcUdcAEUKgviK3IfTL0FJ1HIm4uL5gvKyuDPYPnLBD4gaLF76LdhN4+45A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795428962;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=0DxMPatdCEt9/VYUlPYYRHPra3qkaiERqTWnPhb3ioE=;
	b=phx1HI8kRfofhP0VUmzO/9vEwOMr3XmX85FnXKqJa0Mynb+yDOPx5OqSQLWHhn6wntS6
	 u3njcPJTWseIT/y2FPgmS64TIuC+XNWGTb15zr+mkTNVX3B6eNq6OskINDrioTuZBi1cZ
	 bKVaqzEBDa/58ZMBJDKFJeprNLyrqXxf8DhrlLAXa/yKRjt0SWD/Z1Ei3dI6akIR83DP1
	 LUB6i3i52Y1juwhcRdROFSNUEHeWbjnm/mX9IHCLTwdKv8APz0ADwMZFf3Zh4e5Gw2V1i
	 vjB5vBZGz/QTX4I6moLKmX7O5G21rDspGSgxQfl+vDHRy0toANfO6Tk1CChnxm+PIRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lpxXboh5;
	arc=none smtp.remote-ip=198.175.65.18
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BE59606A31E
	for <loongarch@lists.linux.dev>; Mon, 23 Nov 2026 10:16:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9BE59606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lpxXboh5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795428961; x=1826964961;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hp4GFFoZW+a6qMWtPZqjgSKmC8CMUxHdLaWQu+RTjjU=;
  b=lpxXboh5wrJ8TAr26IvTGyHYXO92d5WwP12TqRSweWo9yWURSBZSXQE+
   B+8Jmu2OXia+N/aGt9UXmvQPj423XDCFWJC6Xa6yFOXWNicMo6uusdiSm
   amvhkmtCXIlAgqRNseUVNdqtzzvAEEDnVoRgzpFtTdOwXWEXKtM6S8woj
   n/+b5T5iNXm0dHFgi0lHqrA+9e+D041D7cUh09kscNcFX/fF4swAN3e3J
   zAOmklnLN+MQPWn6JxSU8C1bTDjuatp6cMrWzjcHMO5ZwbqDtdfUxqnzN
   /hRJADxl8e1HjoQhUh9LtMU7w0gZdrnKMON57Cs+qTMjjefnmrXjR6ufS
   A==;
X-CSE-ConnectionGUID: tIw/qan9SdSsg+B4YzS94A==
X-CSE-MsgGUID: XFCoZtW/R/Gr2J75aTMdGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11974"; a="4248234"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="4248234"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 02:16:01 -0800
X-CSE-ConnectionGUID: OLPJ2fQCQcyFBG8a1W+/Xg==
X-CSE-MsgGUID: SiLegplNRSCR0yUUHTYpmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="11622989"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.204])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 02:15:59 -0800
Date: Mon, 23 Nov 2026 12:15:56 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Luo Qiu <luoqiu@kylinsec.com.cn>
Cc: Jianmin Lv <lvjianmin@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>,
	Yao Zi <ziyao@disroot.org>,
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
	Zixing Liu <liushuyu@aosc.io>, loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] platform/loongarch: laptop: Fix backlight device
 lifetime on unload
Message-ID: <awQSXIASqC_MdC5u@ashevche-desk.local>
References: <9F3855F1130E2878+20261121131820.6759-1-luoqiu@kylinsec.com.cn>
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9F3855F1130E2878+20261121131820.6759-1-luoqiu@kylinsec.com.cn>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Sat, Nov 21, 2026 at 09:18:20PM +0800, Luo Qiu wrote:
> The driver registers a platform backlight device during module init but
> discards the returned pointer. Consequently, the device is never
> unregistered when the module is removed, leaving its ops callbacks
> pointing into freed module text. After module removal, reading the
> backlight's actual_brightness attribute can call the stale callback and
> crash the kernel. Registration failures are also silently ignored.
> 
> Store the returned pointer, use it for resume, and unregister it on
> module exit. Check and report backlight registration failures.

...

> static int loongson_hotkey_resume(struct device *dev)
>  {
>  	int status = 0;
>  	struct key_entry ke;
> -	struct backlight_device *bd;
>  
> -	bd = backlight_device_get_by_type(BACKLIGHT_PLATFORM);
> -	if (bd) {
> -		loongson_laptop_backlight_update(bd) ?
> +	if (backlight_dev) {
> +		loongson_laptop_backlight_update(backlight_dev) ?
>  		pr_warn("Loongson_backlight: resume brightness failed") :
> -		pr_info("Loongson_backlight: resume brightness %d\n", bd->props.brightness);

> +		pr_info("Loongson_backlight: resume brightness %d\n",
> +				backlight_dev->props.brightness);

Indentation is broken here.

>  	}

...

> static int laptop_backlight_register(void)
>  {
>  	int status = 0, ret;
>  	struct backlight_properties props;
> +	struct backlight_device *bd;
>  
>  	memset(&props, 0, sizeof(props));


>  	props.power = BACKLIGHT_POWER_ON;
>  	props.type = BACKLIGHT_PLATFORM;
>  
> -	backlight_device_register("loongson_laptop",
> +	bd = backlight_device_register("loongson_laptop",
>  				NULL, NULL, &backlight_laptop_ops, &props);

...and here.

> +	if (IS_ERR(bd))
> +		return PTR_ERR(bd);
>  
> +	backlight_dev = bd;
>  
>  	return 0;
>  }

-- 
With Best Regards,
Andy Shevchenko


