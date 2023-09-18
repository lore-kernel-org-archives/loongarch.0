Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 600A74A29
	for <loongarch@lists.linux.dev>; Mon, 18 Sep 2023 05:12:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1695013937;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RvD4w7PAsOCgYRxHcY6j9ap1d1nMri/tShexuoBxwd4=;
	b=XiXQe0Tq2Q7TzAKV8sGV5Gt4DLnRaGOD+pew9f8/0l/9wA2cJbOERJQY9++spBTaq6/zso
	cCSSTWbyJ8+YdSeYSQoU9exUcTgI8vra3HkLT9wfZAwSxPGWhJ7tXgvdoHN3P+t4liydbc
	9W9+6k790ArsLwBBdE1RQTfOYD9XC6Q=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-640-NGDQ83XGMz-mg-3KzgWxqA-1; Mon, 18 Sep 2023 01:12:15 -0400
X-MC-Unique: NGDQ83XGMz-mg-3KzgWxqA-1
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-1c4375c1406so18555455ad.1
        for <loongarch@lists.linux.dev>; Sun, 17 Sep 2023 22:12:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695013935; x=1695618735;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RvD4w7PAsOCgYRxHcY6j9ap1d1nMri/tShexuoBxwd4=;
        b=Rs25ko7ix3XUMOS0bNrkueCiG9FWkLQt2Ggp/t4Phppr1i5sc+HDRXH6nCAzP7ku2I
         oG/PqThOrr0UltGvcBoM2+kvWLXloPCRfhiXnx3z8K2HM+VeU+oUqIxt3VyIJ5/p7PRY
         10riFC+k8BSKPvjLaflm//NcmjsTBjGy3SGSkRe9RDTXUHJxdfSMi7KLkOLr3M7IxflM
         RZ5DHwPg/pUdDpPmwp4FJ69M6SLhFUDIoZLmVOcAXQdQ3haRFw4PAm3YZz62e7HbLB/9
         RdQnncfFHs3/nPa9wAvmdms81LkIP7JjsyOenbsFFpbDNt3aOSZaUtH+EWlKyz2iIVPC
         Vyag==
X-Gm-Message-State: AOJu0Yzxy6rFSnSGxnBug++gUih6NTmJPYuvDtoT/EJF7i5wGYZetoVf
	9dHsgPrCJOghYeyyeGhu03i4Sna+PS6IUlPxAJA+I6HypeiU5jcaWKB6F6MOrouGen6JiRw4YwM
	fzyN4gToYAKKoPZBcDxg2
X-Received: by 2002:a17:902:eaca:b0:1c4:7c4:b2e9 with SMTP id p10-20020a170902eaca00b001c407c4b2e9mr6684098pld.43.1695013934902;
        Sun, 17 Sep 2023 22:12:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH/7pnXIEKKH9Y4xbdbZZMMMlJPYbU0PFmQT4cuwBEhJkBJkFtdh/KKkgvjoRXAdFFzPtKhhA==
X-Received: by 2002:a17:902:eaca:b0:1c4:7c4:b2e9 with SMTP id p10-20020a170902eaca00b001c407c4b2e9mr6684091pld.43.1695013934621;
        Sun, 17 Sep 2023 22:12:14 -0700 (PDT)
Received: from ?IPV6:2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5? ([2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5])
        by smtp.gmail.com with ESMTPSA id l3-20020a170903244300b001b80d399730sm3243326pls.242.2023.09.17.22.12.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 17 Sep 2023 22:12:14 -0700 (PDT)
Message-ID: <82ce8528-49ae-3937-4020-0666fe416c0a@redhat.com>
Date: Mon, 18 Sep 2023 15:12:06 +1000
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [RFC PATCH v2 16/35] ACPI: processor: Register CPUs that are
 online, but not described in the DSDT
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
 <20230913163823.7880-17-james.morse@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20230913163823.7880-17-james.morse@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 9/14/23 02:38, James Morse wrote:
> ACPI has two descriptions of CPUs, one in the MADT/APIC table, the other
> in the DSDT. Both are required. (ACPI 6.5's 8.4 "Declaring Processors"
> says "Each processor in the system must be declared in the ACPI
> namespace"). Having two descriptions allows firmware authors to get
> this wrong.
> 
> If CPUs are described in the MADT/APIC, they will be brought online
> early during boot. Once the register_cpu() calls are moved to ACPI,
> they will be based on the DSDT description of the CPUs. When CPUs are
> missing from the DSDT description, they will end up online, but not
> registered.
> 
> Add a helper that runs after acpi_init() has completed to register
> CPUs that are online, but weren't found in the DSDT. Any CPU that
> is registered by this code triggers a firmware-bug warning and kernel
> taint.
> 
> Qemu TCG only describes the first CPU in the DSDT, unless cpu-hotplug
> is configured.
> 
> Signed-off-by: James Morse <james.morse@arm.com>
> ---
>   drivers/acpi/acpi_processor.c | 19 +++++++++++++++++++
>   1 file changed, 19 insertions(+)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>

> diff --git a/drivers/acpi/acpi_processor.c b/drivers/acpi/acpi_processor.c
> index b4bde78121bb..a01e315aa16a 100644
> --- a/drivers/acpi/acpi_processor.c
> +++ b/drivers/acpi/acpi_processor.c
> @@ -790,6 +790,25 @@ void __init acpi_processor_init(void)
>   	acpi_pcc_cpufreq_init();
>   }
>   
> +static int __init acpi_processor_register_missing_cpus(void)
> +{
> +	int cpu;
> +
> +	if (acpi_disabled)
> +		return 0;
> +
> +	for_each_online_cpu(cpu) {
> +		if (!get_cpu_device(cpu)) {
> +			pr_err_once(FW_BUG "CPU %u has no ACPI namespace description!\n", cpu);
> +			add_taint(TAINT_FIRMWARE_WORKAROUND, LOCKDEP_STILL_OK);
> +			arch_register_cpu(cpu);
> +		}
> +	}
> +
> +	return 0;
> +}
> +subsys_initcall_sync(acpi_processor_register_missing_cpus);
> +
>   #ifdef CONFIG_ACPI_PROCESSOR_CSTATE
>   /**
>    * acpi_processor_claim_cst_control - Request _CST control from the platform.

