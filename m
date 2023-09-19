Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 760AC1380
	for <loongarch@lists.linux.dev>; Tue, 19 Sep 2023 00:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1695085173;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bw0RCNykMdY7RZsWbJdeZUErCRZgRpcPnJGa7EHVzz4=;
	b=Bue/mVDEQh5rS75zAHcFn62FGRisryxKB+eFsVOY5DHkB5Rn90Qrhg6T3qfHPQWrBJ+0/6
	nwMHdLyucp5Gf99kgIG7tmXbWhYaEsNkYhtY/cUc2IBB17g8PXM2BTVi0wrgNJLiFH6Ne5
	TFDnDSq4Dr/qnf6dvkvFyQUqePS9dYU=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-336-ua0kEeS1NyCphM9r3bE1Dg-1; Mon, 18 Sep 2023 20:59:32 -0400
X-MC-Unique: ua0kEeS1NyCphM9r3bE1Dg-1
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-1c395534687so44373435ad.1
        for <loongarch@lists.linux.dev>; Mon, 18 Sep 2023 17:59:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695085171; x=1695689971;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bw0RCNykMdY7RZsWbJdeZUErCRZgRpcPnJGa7EHVzz4=;
        b=lK78vMkYiRjg3s43q47uqJ9CPU39V3c55uLyKfFiBWsVE1P7fp1ZgryGS0X8NE3D5N
         vf2lrxiYVZc1K4hJ/ue2rnSmziNIGgXHfNtoh2NUHaFgjOla/ld1qc5qhQIDlA7qVKKK
         4dNB2tv0+pJXJelUdPJ1ImxRzWaLNofZqBZ1BYqlMgiGzjdBbBqvK6CfhQ71S39e817Q
         S2OvJ9Nf7AeRrH4me0XufSw3Gvp+oGXqpN+Wx2YSXNSLGvtNUS5Pi82PwhvB26LGw/X1
         lhLLuo+rb2RsNpfi1yDTMfhLPubfBuedWmI6mlcrsS757o6d0JVM4am9gkmEwueeqheo
         6F4Q==
X-Gm-Message-State: AOJu0Yyj4nsECSlcM63718gzbJJoCg6qlkYXs0DjgWvVuGxGzMlrzD4D
	kYkudStx/pFcBVhrtPql+AjZYOcaI9/5tA2MbYh5qsfuDC7atZOS+TsCJdnafApFz107+E0JzYr
	LLbIEhO0B2IApJkFbzkn+
X-Received: by 2002:a17:903:187:b0:1c1:eb8b:79a6 with SMTP id z7-20020a170903018700b001c1eb8b79a6mr9666417plg.24.1695085170968;
        Mon, 18 Sep 2023 17:59:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE7eI2cxEHhh6ECmh24LHvZfT00fTv4NRQgrtlQ6ac1SnBZhOS9meGvuMTt0rEbyYbfdT98tw==
X-Received: by 2002:a17:903:187:b0:1c1:eb8b:79a6 with SMTP id z7-20020a170903018700b001c1eb8b79a6mr9666399plg.24.1695085170570;
        Mon, 18 Sep 2023 17:59:30 -0700 (PDT)
Received: from ?IPV6:2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5? ([2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5])
        by smtp.gmail.com with ESMTPSA id kg14-20020a170903060e00b001c41e1e9ca7sm8040575plb.215.2023.09.18.17.59.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Sep 2023 17:59:30 -0700 (PDT)
Message-ID: <8be3a9dc-8f59-9ef9-3662-95814e177125@redhat.com>
Date: Tue, 19 Sep 2023 10:59:23 +1000
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [RFC PATCH v2 24/35] drivers: base: Implement weak
 arch_unregister_cpu()
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
 <20230913163823.7880-25-james.morse@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20230913163823.7880-25-james.morse@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 9/14/23 02:38, James Morse wrote:
> Add arch_unregister_cpu() to allow the ACPI machinery to call
> unregister_cpu(). This is enough for arm64, riscv and loongarch, but
> needs to be overridden by x86 and ia64 who need to do more work.
> 
> CC: Jean-Philippe Brucker <jean-philippe@linaro.org>
> Signed-off-by: James Morse <james.morse@arm.com>
> ---
> Changes since v1:
>   * Added CONFIG_HOTPLUG_CPU ifdeffery around unregister_cpu
> ---
>   arch/ia64/include/asm/cpu.h      | 4 ----
>   arch/loongarch/include/asm/cpu.h | 6 ------
>   arch/x86/include/asm/cpu.h       | 1 -
>   drivers/base/cpu.c               | 9 ++++++++-
>   4 files changed, 8 insertions(+), 12 deletions(-)
> 

I agree with Jonathan this patch needs to come early. Maybe move this
before the following one:

[RFC PATCH v2 19/35] ACPI: Move acpi_bus_trim_one() before acpi_scan_hot_remove()

> diff --git a/arch/ia64/include/asm/cpu.h b/arch/ia64/include/asm/cpu.h
> index a3e690e685e5..642d71675ddb 100644
> --- a/arch/ia64/include/asm/cpu.h
> +++ b/arch/ia64/include/asm/cpu.h
> @@ -15,8 +15,4 @@ DECLARE_PER_CPU(struct ia64_cpu, cpu_devices);
>   
>   DECLARE_PER_CPU(int, cpu_state);
>   
> -#ifdef CONFIG_HOTPLUG_CPU
> -extern void arch_unregister_cpu(int);
> -#endif
> -
>   #endif /* _ASM_IA64_CPU_H_ */
> diff --git a/arch/loongarch/include/asm/cpu.h b/arch/loongarch/include/asm/cpu.h
> index b8568e637420..48b9f7168bcc 100644
> --- a/arch/loongarch/include/asm/cpu.h
> +++ b/arch/loongarch/include/asm/cpu.h
> @@ -128,10 +128,4 @@ enum cpu_type_enum {
>   #define LOONGARCH_CPU_HYPERVISOR	BIT_ULL(CPU_FEATURE_HYPERVISOR)
>   #define LOONGARCH_CPU_PTW		BIT_ULL(CPU_FEATURE_PTW)
>   
> -#if !defined(__ASSEMBLY__)
> -#ifdef CONFIG_HOTPLUG_CPU
> -void arch_unregister_cpu(int cpu);
> -#endif
> -#endif /* ! __ASSEMBLY__ */
> -
>   #endif /* _ASM_CPU_H */
> diff --git a/arch/x86/include/asm/cpu.h b/arch/x86/include/asm/cpu.h
> index f349c94510e8..91867a6a9f8e 100644
> --- a/arch/x86/include/asm/cpu.h
> +++ b/arch/x86/include/asm/cpu.h
> @@ -24,7 +24,6 @@ static inline void prefill_possible_map(void) {}
>   #endif /* CONFIG_SMP */
>   
>   #ifdef CONFIG_HOTPLUG_CPU
> -extern void arch_unregister_cpu(int);
>   extern void soft_restart_cpu(void);
>   #endif
>   
> diff --git a/drivers/base/cpu.c b/drivers/base/cpu.c
> index 677f963e02ce..c709747c4a18 100644
> --- a/drivers/base/cpu.c
> +++ b/drivers/base/cpu.c
> @@ -531,7 +531,14 @@ int __weak arch_register_cpu(int cpu)
>   {
>   	return register_cpu(&per_cpu(cpu_devices, cpu), cpu);
>   }
> -#endif
> +
> +#ifdef CONFIG_HOTPLUG_CPU
> +void __weak arch_unregister_cpu(int num)
> +{
> +	unregister_cpu(&per_cpu(cpu_devices, num));
> +}
> +#endif /* CONFIG_HOTPLUG_CPU */
> +#endif /* CONFIG_GENERIC_CPU_DEVICES */
>   

It seems conflicting with its declaration in include/linux/cpu.h. Besides,
the function is still needed by drivers/acpi/acpi_processor.c::acpi_processor_make_not_present()
even both CONFIG_HOTPLUG_CPU and CONFIG_GENERIC_CPU_DEVICES are disabled?

>   static void __init cpu_dev_register_generic(void)
>   {

Thanks,
Gavin

