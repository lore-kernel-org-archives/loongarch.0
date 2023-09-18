Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 479034C6C
	for <loongarch@lists.linux.dev>; Mon, 18 Sep 2023 05:03:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1695013387;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hCDoXZnQJiBgGjXOi0ciKhKqeO4OfqPdXpxnEdvp7mI=;
	b=AV4KHs5YbFYMHe/6ShsgeXmv3+JXfTyjpFXM0/0I4go/70Jluhl5XxxMREiOMmwePL0JrQ
	1Cw4lPTte/eZrRhQXCrhQTFDo0R4DK4GbKxLb30+ZHbdyEAONkXqzBSmY84r84YhP2JthG
	euNlLc0SYjoeTHnIdKXuF1a9wzz39uM=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-556-bTchVs63P7itdukMAHGykQ-1; Mon, 18 Sep 2023 01:03:02 -0400
X-MC-Unique: bTchVs63P7itdukMAHGykQ-1
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-68faf55989cso4085205b3a.3
        for <loongarch@lists.linux.dev>; Sun, 17 Sep 2023 22:03:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695013381; x=1695618181;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hCDoXZnQJiBgGjXOi0ciKhKqeO4OfqPdXpxnEdvp7mI=;
        b=LpMbZ8M9Q8yY4cnOj4Jn6G/WnvERu8xjuUozEjWPLmbVEboByBPBGT4oT+kuZ/Ytns
         qdJi1LE6OgGbVby97jlOp86mSW9OA5f5iKr9Jy3h5agdjUumJfGQchdI4juZmMJHVoyN
         CM5E0sKTIbdwzwir4SudlHEPi/WRtNwuc6f7VSzdcHQJVbulufGFU8TqHVP9jAKhBWru
         OROz20Mo7StiM5ioQAgBsE3f4CDmIEcrje6k99JE2LXhlZEJ2nzCxYR860iFT3fxZIqg
         53TT74YeY9mF6/jxwewxypLnMKDqjHbjXKWYD4fLtoXgHG7KChkPxQi2sYQfT946Y+2E
         mcOg==
X-Gm-Message-State: AOJu0YzvzjAV1MeRBFcePeFxwhlOznwJxdouHi/+VfjefY+omlsi+26/
	Crposc+r40FpHUCBV/GEaAtymPbgSbOoUUNEbmZ65ajdV6PQjRcMVyu38exV5Oim6IW7NOUFH08
	x/uQ342R8tjtMS+gEOZ8T
X-Received: by 2002:a05:6a00:2344:b0:68e:43ed:d30b with SMTP id j4-20020a056a00234400b0068e43edd30bmr6879605pfj.21.1695013381109;
        Sun, 17 Sep 2023 22:03:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGqmnfE9QFPe9E5tdKFUUF/pg2T2yxaduIzlP4FnKDLuVWyov/hE0tCEtGqZQwTLT17gzDFFw==
X-Received: by 2002:a05:6a00:2344:b0:68e:43ed:d30b with SMTP id j4-20020a056a00234400b0068e43edd30bmr6879587pfj.21.1695013380748;
        Sun, 17 Sep 2023 22:03:00 -0700 (PDT)
Received: from ?IPV6:2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5? ([2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5])
        by smtp.gmail.com with ESMTPSA id j26-20020aa783da000000b00687a4b70d1esm6322062pfn.218.2023.09.17.22.02.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 17 Sep 2023 22:03:00 -0700 (PDT)
Message-ID: <50571c2f-aa3c-baeb-3add-cd59e0eddc02@redhat.com>
Date: Mon, 18 Sep 2023 15:02:53 +1000
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [RFC PATCH v2 15/35] ACPI: processor: Add support for processors
 described as container packages
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
 <20230913163823.7880-16-james.morse@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20230913163823.7880-16-james.morse@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 9/14/23 02:38, James Morse wrote:
> ACPI has two ways of describing processors in the DSDT. Either as a device
> object with HID ACPI0007, or as a type 'C' package inside a Processor
> Container. The ACPI processor driver probes CPUs described as devices, but
> not those described as packages.
> 
> Duplicate descriptions are not allowed, the ACPI processor driver already
> parses the UID from both devices and containers. acpi_processor_get_info()
> returns an error if the UID exists twice in the DSDT.
> 
> The missing probe for CPUs described as packages creates a problem for
> moving the cpu_register() calls into the acpi_processor driver, as CPUs
> described like this don't get registered, leading to errors from other
> subsystems when they try to add new sysfs entries to the CPU node.
> (e.g. topology_sysfs_init()'s use of topology_add_dev() via cpuhp)
> 
> To fix this, parse the processor container and call acpi_processor_add()
> for each processor that is discovered like this. The processor container
> handler is added with acpi_scan_add_handler(), so no detach call will
> arrive.
> 
> Qemu TCG describes CPUs using packages in a processor container.
> 
> Signed-off-by: James Morse <james.morse@arm.com>
> ---
>   drivers/acpi/acpi_processor.c | 22 ++++++++++++++++++++++
>   1 file changed, 22 insertions(+)
> 

I don't understand the last sentence of the commit log. QEMU
always have "ACPI0007" for the processor devices.

#define ACPI_PROCESSOR_DEVICE_HID      "ACPI0007"
#define ACPI_PROCESSOR_OBJECT_HID      "LNXCPU"

[gshan@gshan q]$ git grep ACPI0007
hw/acpi/cpu.c:                aml_append(dev, aml_name_decl("_HID", aml_string("ACPI0007")));
hw/arm/virt-acpi-build.c:        aml_append(dev, aml_name_decl("_HID", aml_string("ACPI0007")));
hw/riscv/virt-acpi-build.c:            aml_append(dev, aml_name_decl("_HID", aml_string("ACPI0007")));
[gshan@gshan q]$ git grep LNXCPU

> diff --git a/drivers/acpi/acpi_processor.c b/drivers/acpi/acpi_processor.c
> index c0839bcf78c1..b4bde78121bb 100644
> --- a/drivers/acpi/acpi_processor.c
> +++ b/drivers/acpi/acpi_processor.c
> @@ -625,9 +625,31 @@ static struct acpi_scan_handler processor_handler = {
>   	},
>   };
>   
> +static acpi_status acpi_processor_container_walk(acpi_handle handle,
> +						 u32 lvl,
> +						 void *context,
> +						 void **rv)
> +{
> +	struct acpi_device *adev;
> +	acpi_status status;
> +
> +	adev = acpi_get_acpi_dev(handle);
> +	if (!adev)
> +		return AE_ERROR;
> +
> +	status = acpi_processor_add(adev, &processor_device_ids[0]);
> +	acpi_put_acpi_dev(adev);
> +
> +	return status;
> +}
> +
>   static int acpi_processor_container_attach(struct acpi_device *dev,
>   					   const struct acpi_device_id *id)
>   {
> +	acpi_walk_namespace(ACPI_TYPE_PROCESSOR, dev->handle,
> +			    ACPI_UINT32_MAX, acpi_processor_container_walk,
> +			    NULL, NULL, NULL);
> +
>   	return 1;
>   }
>   

Thanks,
Gavin

