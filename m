Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF64310F9
	for <loongarch@lists.linux.dev>; Mon, 18 Sep 2023 05:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1695015428;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Y6uwQw2TQzRDCyynk3SluHNCszt0yuiUGbPEkJxyENg=;
	b=AO1p/gpySITLVlB7xfkyF4Qdri+I0hDBDY0Lo0g6XvK24gKrm0k0zFlpCXC0x82lVapmn6
	zt7i+mKaxMoIcAf9QEaXNLGCG8T9AJANOt4LBMS3k2HFfdsg1b43WPAn0CTSQEOUE75qKO
	iZq0Gb8AR0l22gC6Pdttq6Thnvku/QQ=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-473-rB2Bx4BuNm-6_QWkgZ6UNA-1; Mon, 18 Sep 2023 01:37:07 -0400
X-MC-Unique: rB2Bx4BuNm-6_QWkgZ6UNA-1
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-1c563506047so7584225ad.1
        for <loongarch@lists.linux.dev>; Sun, 17 Sep 2023 22:37:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695015426; x=1695620226;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y6uwQw2TQzRDCyynk3SluHNCszt0yuiUGbPEkJxyENg=;
        b=ZmTQHvVVXtmDzKBurkqWzTpDDzqvzItnXVicE4u5m5TWn7tXF6PChBTuhnBForcjUu
         dhf+Iz8/zmL8ItuFal39bJll1KhYPsEf3kyWhF0w+eYCQToUVXuGlVb3HCyInq3ikrqy
         61Qy98WvWQ4ZA2KlpunVvoRcXa7oTb2kXk1+KmGEVv6oCgo+6Kn0VIi5oH8utO3/cvxE
         AVJuDf6vKFTPfSS7UVLGeVZgRrHbeAQdKww/RMUi36NFi52QYTh1ojX5A54vhF9x4FDv
         IdLMCtMK5QVvGbZNg8N7Mg/+ceoViUMLRwy4v2lbmayb9UCY1lqJn4XGJ3ErabAiBVrU
         OcHQ==
X-Gm-Message-State: AOJu0YxMsfJjOA65wDEfd8ycFDmluCIjDSXTuAvBPXmUKAkJsmoR3Mgc
	dLJQkF6lRHtBXzXfQAj2QRG/60TWCnbAna8q8MAQX5HsEaAcEiesCmHPNNRal/Ats4E/8krMCED
	ui2dH7TgLEOW0dyXCVcrI
X-Received: by 2002:a17:902:ab12:b0:1c3:df77:3159 with SMTP id ik18-20020a170902ab1200b001c3df773159mr7962021plb.50.1695015426138;
        Sun, 17 Sep 2023 22:37:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG4LA6vy59tdBGF7Ljgoach/YoGNT9CDJsVEh22V2F8alWKcyjdRZQRbNbCFRoo5eBTb6guIw==
X-Received: by 2002:a17:902:ab12:b0:1c3:df77:3159 with SMTP id ik18-20020a170902ab1200b001c3df773159mr7962003plb.50.1695015425836;
        Sun, 17 Sep 2023 22:37:05 -0700 (PDT)
Received: from ?IPV6:2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5? ([2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5])
        by smtp.gmail.com with ESMTPSA id n5-20020a170902e54500b001b9d95945afsm7488399plf.155.2023.09.17.22.37.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 17 Sep 2023 22:37:05 -0700 (PDT)
Message-ID: <add60819-1d36-9b96-7bfa-148907dc44ce@redhat.com>
Date: Mon, 18 Sep 2023 15:36:58 +1000
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [RFC PATCH v2 19/35] ACPI: Move acpi_bus_trim_one() before
 acpi_scan_hot_remove()
To: James Morse <james.morse@arm.com>, linux-pm@vger.kernel.org,
 loongarch@lists.linux.dev, linux-acpi@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org,
 kvmarm@lists.linux.dev
Cc: x86@kernel.org, Salil Mehta <salil.mehta@huawei.com>,
 Russell King <linux@armlinux.org.uk>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>, jianyong.wu@arm.com,
 justin.he@arm.com
References: <20230913163823.7880-1-james.morse@arm.com>
 <20230913163823.7880-20-james.morse@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20230913163823.7880-20-james.morse@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 9/14/23 02:38, James Morse wrote:
> A subsequent patch will change acpi_scan_hot_remove() to call
> acpi_bus_trim_one() instead of acpi_bus_trim(), meaning it can no longer
> rely on the prototype in the header file.
> 
> Move these functions further up the file.
> No change in behaviour.
> 
> Signed-off-by: James Morse <james.morse@arm.com>
> ---
>   drivers/acpi/scan.c | 76 ++++++++++++++++++++++-----------------------
>   1 file changed, 38 insertions(+), 38 deletions(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>

> diff --git a/drivers/acpi/scan.c b/drivers/acpi/scan.c
> index f898591ce05f..a675333618ae 100644
> --- a/drivers/acpi/scan.c
> +++ b/drivers/acpi/scan.c
> @@ -244,6 +244,44 @@ static int acpi_scan_try_to_offline(struct acpi_device *device)
>   	return 0;
>   }
>   
> +static int acpi_bus_trim_one(struct acpi_device *adev, void *not_used)
> +{
> +	struct acpi_scan_handler *handler = adev->handler;
> +
> +	acpi_dev_for_each_child_reverse(adev, acpi_bus_trim_one, NULL);
> +
> +	adev->flags.match_driver = false;
> +	if (handler) {
> +		if (handler->detach)
> +			handler->detach(adev);
> +
> +		adev->handler = NULL;
> +	} else {
> +		device_release_driver(&adev->dev);
> +	}
> +	/*
> +	 * Most likely, the device is going away, so put it into D3cold before
> +	 * that.
> +	 */
> +	acpi_device_set_power(adev, ACPI_STATE_D3_COLD);
> +	adev->flags.initialized = false;
> +	acpi_device_clear_enumerated(adev);
> +
> +	return 0;
> +}
> +
> +/**
> + * acpi_bus_trim - Detach scan handlers and drivers from ACPI device objects.
> + * @adev: Root of the ACPI namespace scope to walk.
> + *
> + * Must be called under acpi_scan_lock.
> + */
> +void acpi_bus_trim(struct acpi_device *adev)
> +{
> +	acpi_bus_trim_one(adev, NULL);
> +}
> +EXPORT_SYMBOL_GPL(acpi_bus_trim);
> +
>   static int acpi_scan_hot_remove(struct acpi_device *device)
>   {
>   	acpi_handle handle = device->handle;
> @@ -2506,44 +2544,6 @@ int acpi_bus_scan(acpi_handle handle)
>   }
>   EXPORT_SYMBOL(acpi_bus_scan);
>   
> -static int acpi_bus_trim_one(struct acpi_device *adev, void *not_used)
> -{
> -	struct acpi_scan_handler *handler = adev->handler;
> -
> -	acpi_dev_for_each_child_reverse(adev, acpi_bus_trim_one, NULL);
> -
> -	adev->flags.match_driver = false;
> -	if (handler) {
> -		if (handler->detach)
> -			handler->detach(adev);
> -
> -		adev->handler = NULL;
> -	} else {
> -		device_release_driver(&adev->dev);
> -	}
> -	/*
> -	 * Most likely, the device is going away, so put it into D3cold before
> -	 * that.
> -	 */
> -	acpi_device_set_power(adev, ACPI_STATE_D3_COLD);
> -	adev->flags.initialized = false;
> -	acpi_device_clear_enumerated(adev);
> -
> -	return 0;
> -}
> -
> -/**
> - * acpi_bus_trim - Detach scan handlers and drivers from ACPI device objects.
> - * @adev: Root of the ACPI namespace scope to walk.
> - *
> - * Must be called under acpi_scan_lock.
> - */
> -void acpi_bus_trim(struct acpi_device *adev)
> -{
> -	acpi_bus_trim_one(adev, NULL);
> -}
> -EXPORT_SYMBOL_GPL(acpi_bus_trim);
> -
>   int acpi_bus_register_early_device(int type)
>   {
>   	struct acpi_device *device = NULL;

Thanks,
Gavin

