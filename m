Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4B462375B
	for <loongarch@lists.linux.dev>; Mon, 25 Sep 2023 23:05:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1695683099;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=swf/1TRyjsvwDIsd/YLqft6nJR4VSEYvlPbm2UeV+EA=;
	b=ACE2clBYMwPwRN/Udi+a+n/5AYXneaa8jPFe5vInkIA2kLbzxvsPZMb7IaSxVY7Xgh/7WG
	1fqG8bCiFBABXHTAuK3ALLjdPwTQBa8I2RTTXUHx/+n1tA7hqGwQdVxcER9dKX/w8Cnysq
	S0BnsfydmkrxD36Wpr0MVGJjBHBC02c=
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com
 [209.85.161.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-690--RlSGI-qMiC-5foLVLY6_w-1; Mon, 25 Sep 2023 19:04:57 -0400
X-MC-Unique: -RlSGI-qMiC-5foLVLY6_w-1
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-57be2b97298so2330523eaf.3
        for <loongarch@lists.linux.dev>; Mon, 25 Sep 2023 16:04:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695683097; x=1696287897;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=swf/1TRyjsvwDIsd/YLqft6nJR4VSEYvlPbm2UeV+EA=;
        b=kDLONCMsxBh2BMrtqTZQX0Exfym324Gb+2k3Arng7i56WBXZ6bH2IrbcNLW+98sbbk
         TwY4/DDL03G588Tyt7HbpYR9S/yAQ/h2K9WKhymkzquHDWIB+Gi+QTLtWlPiY37yx7M9
         nvDjKKz5lqLnDBy5TFz/fmSZSepWyD2jqF3HwIc9J34m7BlmJs5bpzXVamxM7O3DSl8y
         +PBF/YWDKVT4LjLzExU7vVq4lEtN1Bjo7Lx3QEZY1uRBg2ZJplUOQbshPIIlFZZzrXLH
         JK19exp7q2e12TF5a+85j8eKquWyjPhGxCIg+/M8/TDS91st1tVLESjmUf+kqVGKUxCT
         TT9A==
X-Gm-Message-State: AOJu0YxlBzRijo+ixwCwtT0tS4LxCNvbIUtIm+U+3KF1EYxqjc4jzoaW
	KhqlFthE1feCuC+0cDUlKOLMhuxu7KIUW1wqMPTHSxwyU+lpvpQuE7eCZ4X4rpEQjnADlXkDeSm
	wvzpSKbMCJmGnlKBD/qIX
X-Received: by 2002:a05:6358:2823:b0:135:47e8:76e2 with SMTP id k35-20020a056358282300b0013547e876e2mr11329989rwb.4.1695683096760;
        Mon, 25 Sep 2023 16:04:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFX7uksuEOetyapsty6ZE6ocFLTtk0JAOhDOymew1I5gw+0mo4tG1qOgOieTX36CWp+dKzNwQ==
X-Received: by 2002:a05:6358:2823:b0:135:47e8:76e2 with SMTP id k35-20020a056358282300b0013547e876e2mr11329948rwb.4.1695683096324;
        Mon, 25 Sep 2023 16:04:56 -0700 (PDT)
Received: from ?IPV6:2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5? ([2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5])
        by smtp.gmail.com with ESMTPSA id z27-20020a637e1b000000b00563e1ef0491sm8538475pgc.8.2023.09.25.16.04.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Sep 2023 16:04:55 -0700 (PDT)
Message-ID: <dd4dee9e-4d75-e1e6-04c8-82d84b28fd35@redhat.com>
Date: Tue, 26 Sep 2023 09:04:46 +1000
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] cpu-hotplug: provide prototypes for arch CPU registration
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Thomas Gleixner <tglx@linutronix.de>
Cc: linux-acpi@vger.kernel.org, James Morse <james.morse@arm.com>,
 loongarch@lists.linux.dev, linux-arch@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>, jianyong.wu@arm.com,
 justin.he@arm.com, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 Salil Mehta <salil.mehta@huawei.com>, "H. Peter Anvin" <hpa@zytor.com>,
 Peter Zijlstra <peterz@infradead.org>, linux-ia64@vger.kernel.org
References: <E1qkoRr-0088Q8-Da@rmk-PC.armlinux.org.uk>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <E1qkoRr-0088Q8-Da@rmk-PC.armlinux.org.uk>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Russell,

On 9/26/23 02:28, Russell King (Oracle) wrote:
> Provide common prototypes for arch_register_cpu() and
> arch_unregister_cpu(). These are called by acpi_processor.c, with
> weak versions, so the prototype for this is already set. It is
> generally not necessary for function prototypes to be conditional
> on preprocessor macros.
> 
> Some architectures (e.g. Loongarch) are missing the prototype for this,
> and rather than add it to Loongarch's asm/cpu.h, lets do the job once
> for everyone.
> 
> Since this covers everyone, remove the now unnecessary prototypes in
> asm/cpu.h, and we also need to remove the 'static' from one of ia64's
> arch_register_cpu() definitions.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
> Changes since RFC v2:
>   - drop ia64 changes, as ia64 has already been removed.
> 
>   arch/x86/include/asm/cpu.h  | 2 --
>   arch/x86/kernel/topology.c  | 2 +-
>   include/linux/cpu.h         | 2 ++
>   3 files changed, 3 insertions(+), 3 deletions(-)
> 

In Linux 6.6.rc3, the prototypes are still existing in arch/ia64/include/asm/cpu.h.
They may have been dropped in other ia64 or x86 git repository, which this patch
bases on.

In the commit message, 'static' from one of ia64's arch_register_cpu() definitions
is removed, but there is no changes related to ia64 in this patch. I guess that's
probably x86?

> diff --git a/arch/x86/include/asm/cpu.h b/arch/x86/include/asm/cpu.h
> index 3a233ebff712..25050d953eee 100644
> --- a/arch/x86/include/asm/cpu.h
> +++ b/arch/x86/include/asm/cpu.h
> @@ -28,8 +28,6 @@ struct x86_cpu {
>   };
>   
>   #ifdef CONFIG_HOTPLUG_CPU
> -extern int arch_register_cpu(int num);
> -extern void arch_unregister_cpu(int);
>   extern void soft_restart_cpu(void);
>   #endif
>   
> diff --git a/arch/x86/kernel/topology.c b/arch/x86/kernel/topology.c
> index ca004e2e4469..0bab03130033 100644
> --- a/arch/x86/kernel/topology.c
> +++ b/arch/x86/kernel/topology.c
> @@ -54,7 +54,7 @@ void arch_unregister_cpu(int num)
>   EXPORT_SYMBOL(arch_unregister_cpu);
>   #else /* CONFIG_HOTPLUG_CPU */
>   
> -static int __init arch_register_cpu(int num)
> +int __init arch_register_cpu(int num)
>   {
>   	return register_cpu(&per_cpu(cpu_devices, num).cpu, num);
>   }

I think arch/ia64/kernel/topology.c may need same change, as stated in the commit log.
In linux 6.6.rc3, 'static' exists in arch/ia64/kernel/topology.c::arch_register_cpu().
Again, your patch may have been based on other git repository.

> diff --git a/include/linux/cpu.h b/include/linux/cpu.h
> index 0abd60a7987b..eb768a866fe3 100644
> --- a/include/linux/cpu.h
> +++ b/include/linux/cpu.h
> @@ -80,6 +80,8 @@ extern __printf(4, 5)
>   struct device *cpu_device_create(struct device *parent, void *drvdata,
>   				 const struct attribute_group **groups,
>   				 const char *fmt, ...);
> +extern int arch_register_cpu(int cpu);
> +extern void arch_unregister_cpu(int cpu);
>   #ifdef CONFIG_HOTPLUG_CPU
>   extern void unregister_cpu(struct cpu *cpu);
>   extern ssize_t arch_cpu_probe(const char *, size_t);

Thanks,
Gavin

