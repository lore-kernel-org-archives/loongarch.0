Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793804102;
	b=DAEDMd5iBFp9/JKHDkGYOO1ol05G0FkrYg3wLzRR+rMGJ+OLaW/BerH6BiBV3wgwtnQi
	 Vx4UyLwi6fd/bjLYAOo3gjT/6vslycq2xUBELUtINAEfrYwquzPxaZWMRACnvknsRXDkD
	 xTfJ/MSRNY9c42A0rH9bw1kCOB2LlchvaggQNHGMusvAuNEH81pAaPjUmep/EhWUmno2w
	 q53z165DBWTN3nhu6ZRbX3mHlI+uTH8t137xhMjATXnSdQkiKlOIcOxkWkFHDE3hUWb0y
	 /XUDEkDtFzQlC3rmTwSJkQ92zVx6Jpnbx5/AfgrDpvkbaJqlE67yP7wjAKVM8y5db7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793804102;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:From:In-Reply-To:X-Mimecast-Spam-Score:
	 X-Mimecast-MFC-PROC-ID:X-Mimecast-Originator:Content-Language:
	 Content-Type:Content-Transfer-Encoding;
	bh=T/LFH12Z4WZEglTbKhXQW4K9eV4VYPQ2vTkGE/YeZdw=;
	b=ufiqdH8wMvdfqxwhG8olxGwGr4844sipN5Tnukbrk5JUQu3w4XlOjNpL97Kr+UGFDuH/
	 XgnCSi38SavLUr+F+S8QC1CCqrcUHOIybCJzTW9NYbF9Ee1zgaE07lWnhDxa8mwnW4UrF
	 rR4iCZ3+u1EHuTI29QTi9277OzRZ0s8lKNJx/qExQfwmm/ODplcwR8sXYs4Io4Rgo7zFn
	 8eXC5EbGspAxYM0atEYzuwNigkutV/ckwm5QhPu8ZJTpfls4YIBbiKP55KcsWjETQBwbe
	 I1o8dz2lO4L7hilbSPBGMCCdpYSrzV5jR3/jVbgoAQy7IqO5atGJ60aIhwMaak3gGRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=iv1lPNlz;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33FFC606A31B
	for <loongarch@lists.linux.dev>; Wed,  4 Nov 2026 14:55:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33FFC606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=iv1lPNlz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793804101;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=T/LFH12Z4WZEglTbKhXQW4K9eV4VYPQ2vTkGE/YeZdw=;
	b=iv1lPNlzqdRQKqVS0gds5uZzd8y0ySIgpkJmYDBeUZxI/rFKzbZtfS5BadY0nykY8zg2YI
	ysNCDr7RpUJ7d2x3UEIybTos9bcYhVaJUl6n7Xvg9hU5E9W21WHLWfN/SAClLQ8JSO+ejC
	rZkWnWyjS27XAgeylB+bmn5KGSI6JH8=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-138-DkvVoPV8Mb2SQaa4YJ-AXg-1; Wed, 04 Nov 2026 09:54:59 -0500
X-MC-Unique: DkvVoPV8Mb2SQaa4YJ-AXg-1
X-Mimecast-MFC-AGG-ID: DkvVoPV8Mb2SQaa4YJ-AXg_1793804099
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b0a9de9c2aso130585a91.2
        for <loongarch@lists.linux.dev>; Wed, 04 Nov 2026 06:54:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793804098; x=1794408898;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T/LFH12Z4WZEglTbKhXQW4K9eV4VYPQ2vTkGE/YeZdw=;
        b=I30SOd2O9/pR9/GzZp4avm1FbPlhNjM5zq1nvtuSce4h/c3ov6yC6t6mvafQeSofv8
         krL94Ar1sg2q0npM2BuSMZRcc/ExOrWm+rCNevLvFm+Fw6h/6vXzK0S9hLMpjIvPXVT0
         KO0Tbuyig6TFTVfZT+WK4KKp3dHVmPmhEhIFj2u9dWpYGo1pZSRwqSVuNYZ1k9dHOhw1
         MWcF3xZ8N6zfKCEK5OfoOxqRjNX+7bHcnmG+taBOl21Qyg+bg2Rhp+1vA48Tg5hpiTL1
         thrwdSJIECyLGj5gun0BKGp3YS9tm8kWzuloa7DBlkjGqXLDKxloqPkAZZs6ZiDL8RWl
         gxvQ==
X-Forwarded-Encrypted: i=1; AKwUvBzlSj/7WG8aJppNfzJ1FZ8O0N8oaMHYprn9FdvewyJP83st9o2BtqkciW0lrz0eOdnHGb6LeX+Tlvc=@lists.linux.dev
X-Gm-Message-State: APuU4Z960daqbJrh9NXJ6XUBVttn1uGfpwmPellzpbfuf3sLvS4bqwrh
	2lKnR7NcLP7jOeBvx9io3pqswFybsQ027yN0vM+D6coAbdXFEM1duzDYv36mYOcrqS5WXq+YNgQ
	VCBh7z8+NB+uBplp/EXvf8g0H4C87dIWq+7ud8HDfcEp049YhzHiI2OoXiOOqoA==
X-Gm-Gg: AYBFou3Usd7AyGVLKr1xjxxmKy0GlUvh9d79mcEfcnvB+jt5Jq7Zk9xjOBOC4rsYYqv
	RxnL35zFGEkU+cl7mLl5b7hj28s+cs//rQVctg9Dd9Jesxb+Knc39owQnwgqwJHYnvmuaYiWtyd
	fDeS1PzPJy4ZxOIHVCQpd6D826pcJyvvZlJMGAJmjdZsCBwS0kPN76azq99jsGaa94I+XIWMe0H
	0FYzrL04bpw7shV5gEHkv5G6+x+oFX+vGZSeVf40x+5TYWzqdslYsQe1B2ZXEVpCinxWlKF0HPm
	E+MVFNs8d+oj+mNCFHQwU6GH25hjH/0eitJeHnhhark1xW3wFwMe+Ob+KGaUdGxzCWRF33f35zd
	ZEdorP0wnZD4zi4YyC7XHvkBYq28F3KqWfGlHfYU5GLInmseabAD9206qjMwCdnCu3dIaomaXYW
	8TgCOrtTaZRteKFOXJmkhVIYQzAbYnp6+LStkqlyJL57Q=
X-Received: by 2002:a17:90b:48cd:b0:3b0:a970:caad with SMTP id 98e67ed59e1d1-3b0a970ce14mr563071a91.28.1793804098453;
        Wed, 04 Nov 2026 06:54:58 -0800 (PST)
X-Received: by 2002:a17:90b:48cd:b0:3b0:a970:caad with SMTP id 98e67ed59e1d1-3b0a970ce14mr563055a91.28.1793804097848;
        Wed, 04 Nov 2026 06:54:57 -0800 (PST)
Received: from ?IPV6:2401:4900:1f28:63e0:edae:927e:c670:b679? ([2401:4900:1f28:63e0:edae:927e:c670:b679])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b096994650sm2176379a91.2.2026.11.04.06.54.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 06:54:57 -0800 (PST)
Message-ID: <99670aa8-a33c-4a36-b8dd-66b02c6b6159@redhat.com>
Date: Wed, 4 Nov 2026 20:24:47 +0530
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/8] efi: Pass KHO state to the next kernel in a
 configuration table
To: George Guo <dongtai.guo@linux.dev>, rppt@kernel.org,
 pasha.tatashin@soleen.com, pratyush@kernel.org, chenhuacai@kernel.org,
 ardb@kernel.org, shuah@kernel.org
Cc: ilias.apalodimas@linaro.org, akpm@linux-foundation.org,
 baoquan.he@linux.dev, ruirui.yang@linux.dev, guodongtai@kylinos.cn,
 kernel@xen0n.name, graf@amazon.com, liukexin@kylinos.cn,
 loongarch@lists.linux.dev, linux-kernel@vger.kernel.org,
 kexec@lists.infradead.org, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, linux-efi@vger.kernel.org
References: <20261029172956.20791-1-dongtai.guo@linux.dev>
 <20261029172956.20791-2-dongtai.guo@linux.dev>
From: Mukesh Pilaniya <mpilaniy@redhat.com>
In-Reply-To: <20261029172956.20791-2-dongtai.guo@linux.dev>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: AYhlSBmGiroRSeJuJpg-rer6TKcbpEh9d_ANLs1UmGE_1793804099
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi George,

On 29/10/26 10:59 pm, George Guo wrote:
> From: George Guo <guodongtai@kylinos.cn>
> 
> KHO has to give the next kernel two addresses: the KHO FDT and the
> bootmem area list. arm64 and riscv put them under /chosen in the boot
> FDT. LoongArch systems booting with EFI and ACPI do not require a boot
> FDT, so KHO needs another way to pass this information.
> 
> Add a Linux EFI configuration table for them, under
> LINUX_EFI_KEXEC_HANDOVER_GUID. It points to a struct linux_efi_kho_data.
> 
>   - On a cold boot, the LoongArch EFI stub installs the table, zeroed.
>     Each kexec'd kernel is given the same EFI system table, so it finds
>     the same table.
> 
>   - In early boot, efi_config_parse_tables() reserves the table so
>     neither the page allocator nor kexec segments use it, and calls
>     kho_populate() if the table holds KHO state.
> 
>   - Provide efi_kho_update() to update the table before kexec. Map the
>     table during boot so updates do not require allocation or mapping
>     at panic time.
> 
>   - efi_kho_table_found() tells architecture code whether the table was
>     found at boot, so it can turn KHO off when the table is missing.
> 
> Only the LoongArch stub installs the table, and only with
> CONFIG_KEXEC_HANDOVER. Elsewhere there is no table and this code does
> nothing.
> 
> Signed-off-by: George Guo <guodongtai@kylinos.cn>
> ---
>  drivers/firmware/efi/efi.c               | 68 ++++++++++++++++++++++++
>  drivers/firmware/efi/libstub/efi-stub.c  | 22 ++++++++
>  drivers/firmware/efi/libstub/efistub.h   |  2 +
>  drivers/firmware/efi/libstub/loongarch.c |  2 +
>  include/linux/efi.h                      | 40 ++++++++++++++
>  5 files changed, 134 insertions(+)
> 
> diff --git a/drivers/firmware/efi/efi.c b/drivers/firmware/efi/efi.c
> index 0327a39d31fa..e409e4a57378 100644
> --- a/drivers/firmware/efi/efi.c
> +++ b/drivers/firmware/efi/efi.c
> @@ -24,6 +24,7 @@
>  #include <linux/initrd.h>
>  #include <linux/io.h>
>  #include <linux/kexec.h>
> +#include <linux/kexec_handover.h>
>  #include <linux/platform_device.h>
>  #include <linux/random.h>
>  #include <linux/reboot.h>
> @@ -62,6 +63,7 @@ unsigned long __ro_after_init efi_rng_seed = EFI_INVALID_TABLE_ADDR;
>  static unsigned long __initdata mem_reserve = EFI_INVALID_TABLE_ADDR;
>  static unsigned long __initdata rt_prop = EFI_INVALID_TABLE_ADDR;
>  static unsigned long __initdata initrd = EFI_INVALID_TABLE_ADDR;
> +static unsigned long efi_kho __initdata = EFI_INVALID_TABLE_ADDR;
>  
>  extern unsigned long primary_display_table;
>  
> @@ -629,6 +631,7 @@ static const efi_config_table_type_t common_tables[] __initconst = {
>  	{EFI_TCG2_FINAL_EVENTS_TABLE_GUID,	&efi.tpm_final_log,	"TPMFinalLog"	},
>  	{EFI_CC_FINAL_EVENTS_TABLE_GUID,	&efi.tpm_final_log,	"CCFinalLog"	},
>  	{LINUX_EFI_MEMRESERVE_TABLE_GUID,	&mem_reserve,		"MEMRESERVE"	},
> +	{LINUX_EFI_KEXEC_HANDOVER_GUID,		&efi_kho,		"KHO"		},
>  	{LINUX_EFI_INITRD_MEDIA_GUID,		&initrd,		"INITRD"	},
>  	{EFI_RT_PROPERTIES_TABLE_GUID,		&rt_prop,		"RTPROP"	},
>  #ifdef CONFIG_OVMF_DEBUG_LOG
> @@ -806,6 +809,23 @@ int __init efi_config_parse_tables(const efi_config_table_t *config_tables,
>  		}
>  	}
>  
> +	if (efi_kho != EFI_INVALID_TABLE_ADDR) {
> +		struct linux_efi_kho_data *kho;
> +
> +		/* Keep the buddy allocator and kexec segments off the table. */
> +		memblock_reserve(efi_kho, sizeof(*kho));
> +
> +		kho = early_memremap(efi_kho, sizeof(*kho));
> +		if (kho) {
> +			if (kho->fdt_addr)
> +				kho_populate((phys_addr_t)kho->fdt_addr, kho->fdt_size,
> +					     (phys_addr_t)kho->bootmem_addr, kho->bootmem_size);
> +			early_memunmap(kho, sizeof(*kho));
> +		} else {
> +			pr_warn("Could not map UEFI KHO table!\n");
This is a Linux EFI configuration table, not a __UEFI KHO table__, so
IMHO; UEFI wording is wrong here.

> +		}
> +	}
> +
>  	if (rt_prop != EFI_INVALID_TABLE_ADDR) {
>  		efi_rt_properties_table_t *tbl;
>  
> @@ -1171,6 +1191,54 @@ static int __init efi_memreserve_root_init(void)
>  }
>  early_initcall(efi_memreserve_root_init);
>  
> +static struct linux_efi_kho_data *efi_kho_table __ro_after_init;
> +
> +/* Did the previous kernel or the EFI stub pass a KHO table? */
> +bool __init efi_kho_table_found(void)
> +{
> +	return efi_kho != EFI_INVALID_TABLE_ADDR;
> +}
> +
> +static int __init efi_kho_table_init(void)
> +{
> +	if (efi_kho == EFI_INVALID_TABLE_ADDR)
> +		return 0;
> +
> +	/* Map it now: the table is also written at panic time. */
> +	efi_kho_table = memremap(efi_kho, sizeof(*efi_kho_table), MEMREMAP_WB);
> +	if (WARN_ON_ONCE(!efi_kho_table))
> +		efi_kho_table = ERR_PTR(-ENOMEM);
> +
> +	return 0;
> +}
> +early_initcall(efi_kho_table_init);
> +
> +/*
> + * Write the KHO addresses the next kernel should use, or zeroes
> + * if it should boot without KHO.
> + */
> +int efi_kho_update(phys_addr_t fdt_addr, u64 fdt_size,
> +		   phys_addr_t bootmem_addr, u64 bootmem_size)
> +{
> +	struct linux_efi_kho_data *kho = efi_kho_table;
> +
> +	/*
> +	 * No table: either the architecture passes the KHO state some other
> +	 * way, or it turned KHO off at boot because the table was missing.
> +	 */
> +	if (!kho)
> +		return 0;
> +	if (IS_ERR(kho))
> +		return PTR_ERR(kho);
> +
> +	kho->fdt_addr		= fdt_addr;
> +	kho->fdt_size		= fdt_size;
> +	kho->bootmem_addr	= bootmem_addr;
> +	kho->bootmem_size	= bootmem_size;
> +
> +	return 0;
> +}
> +
>  #ifdef CONFIG_KEXEC
>  static int update_efi_random_seed(struct notifier_block *nb,
>  				  unsigned long code, void *unused)
> diff --git a/drivers/firmware/efi/libstub/efi-stub.c b/drivers/firmware/efi/libstub/efi-stub.c
> index 42d6073bcd06..0fb0d4041d1c 100644
> --- a/drivers/firmware/efi/libstub/efi-stub.c
> +++ b/drivers/firmware/efi/libstub/efi-stub.c
> @@ -100,6 +100,28 @@ static void install_memreserve_table(void)
>  		efi_err("Failed to install memreserve config table!\n");
>  }
>  
> +void install_kho_table(void)
> +{
> +	struct linux_efi_kho_data *kho;
> +	efi_guid_t kho_table_guid = LINUX_EFI_KEXEC_HANDOVER_GUID;
> +	efi_status_t status;
> +
> +	if (!IS_ENABLED(CONFIG_KEXEC_HANDOVER))
> +		return;
> +
> +	status = efi_bs_call(allocate_pool, EFI_LOADER_DATA, sizeof(*kho), (void **)&kho);
> +	if (status != EFI_SUCCESS) {
> +		efi_err("Failed to allocate KHO config table!\n");
> +		return;
> +	}
> +
> +	*kho = (struct linux_efi_kho_data){};
> +
> +	status = efi_bs_call(install_configuration_table, &kho_table_guid, kho);

> +	if (status != EFI_SUCCESS)
> +		efi_err("Failed to install KHO config table!\n");
When install_configuration_table fails, the pool allocation made
just above using efi_bs_callis never freed, so a page of
EFI_LOADER_DATA is leaked until ExitBootServices, This is a minor leak
so mentioned here for review completeness.

> +}
> +
>  static u32 get_supported_rt_services(void)
>  {
>  	const efi_rt_properties_table_t *rt_prop_table;
> diff --git a/drivers/firmware/efi/libstub/efistub.h b/drivers/firmware/efi/libstub/efistub.h
> index fd91fc15ec81..9e0034c1260a 100644
> --- a/drivers/firmware/efi/libstub/efistub.h
> +++ b/drivers/firmware/efi/libstub/efistub.h
> @@ -1057,6 +1057,8 @@ efi_status_t efi_exit_boot_services(void *handle, void *priv,
>  efi_status_t efi_boot_kernel(void *handle, efi_loaded_image_t *image,
>  			     unsigned long kernel_addr, char *cmdline_ptr);
>  
> +void install_kho_table(void);
> +
>  void *get_fdt(unsigned long *fdt_size);
>  
>  efi_status_t efi_alloc_virtmap(efi_memory_desc_t **virtmap,
> diff --git a/drivers/firmware/efi/libstub/loongarch.c b/drivers/firmware/efi/libstub/loongarch.c
> index 2b0c87dc9908..c2df097771e4 100644
> --- a/drivers/firmware/efi/libstub/loongarch.c
> +++ b/drivers/firmware/efi/libstub/loongarch.c
> @@ -74,6 +74,8 @@ efi_status_t efi_boot_kernel(void *handle, efi_loaded_image_t *image,
>  	efi_status_t status;
>  	u32 desc_ver;
>  
> +	install_kho_table();
> +
>  	status = efi_alloc_virtmap(&priv.runtime_map, &desc_size, &desc_ver);
>  	if (status != EFI_SUCCESS) {
>  		efi_err("Unable to retrieve UEFI memory map.\n");
> diff --git a/include/linux/efi.h b/include/linux/efi.h
> index aa15ff88539b..253e98bf9922 100644
> --- a/include/linux/efi.h
> +++ b/include/linux/efi.h
> @@ -422,6 +422,7 @@ void efi_native_runtime_setup(void);
>  #define LINUX_EFI_COCO_SECRET_AREA_GUID		EFI_GUID(0xadf956ad, 0xe98c, 0x484c,  0xae, 0x11, 0xb5, 0x1c, 0x7d, 0x33, 0x64, 0x47)
>  #define LINUX_EFI_BOOT_MEMMAP_GUID		EFI_GUID(0x800f683f, 0xd08b, 0x423a,  0xa2, 0x93, 0x96, 0x5c, 0x3c, 0x6f, 0xe2, 0xb4)
>  #define LINUX_EFI_UNACCEPTED_MEM_TABLE_GUID	EFI_GUID(0xd5d1de3c, 0x105c, 0x44f9,  0x9e, 0xa9, 0xbc, 0xef, 0x98, 0x12, 0x00, 0x31)
> +#define LINUX_EFI_KEXEC_HANDOVER_GUID		EFI_GUID(0xc941b6c7, 0x7b3f, 0x4af6,  0x9e, 0x50, 0xfc, 0xb3, 0xa8, 0x86, 0x8a, 0x17)
>  
>  #define RISCV_EFI_BOOT_PROTOCOL_GUID		EFI_GUID(0xccd15fec, 0x6f73, 0x4eec,  0x83, 0x95, 0x3e, 0x69, 0xe4, 0xb9, 0x40, 0xbf)
>  
> @@ -1273,6 +1274,45 @@ struct linux_efi_memreserve {
>  
>  void __init efi_arch_mem_reserve(phys_addr_t addr, u64 size);
>  
> +/**
> + * struct linux_efi_kho_data - KHO state passed to the next kernel
> + * @fdt_addr: physical address of the KHO FDT, 0 if there is none
> + * @fdt_size: size of the KHO FDT
> + * @bootmem_addr: physical address of the bootmem area list
> + * @bootmem_size: size of the bootmem area list
> + *
> + * Pointed to by the LINUX_EFI_KEXEC_HANDOVER_GUID configuration table.
> + *
> + * The EFI stub installs this table zeroed on a cold boot. It stays
> + * in place across kexec; the running kernel rewrites it just before
> + * each kexec, and the next kernel reads it during early boot.
This statement is only true for the LoongArch and on arm64/riscv/x86 no
table exists, so the comment describes a kernel-wide invariant that does
not hold.

> + *
> + * The layout is fixed. Changing it requires a new GUID.
> + */
> +struct linux_efi_kho_data {
> +	u64 fdt_addr;
> +	u64 fdt_size;
> +	u64 bootmem_addr;
> +	u64 bootmem_size;
> +};
> +
> +#ifdef CONFIG_EFI
> +bool efi_kho_table_found(void);
> +int efi_kho_update(phys_addr_t fdt_addr, u64 fdt_size,
> +		   phys_addr_t bootmem_addr, u64 bootmem_size);
> +#else
> +static inline bool efi_kho_table_found(void)
> +{
> +	return false;
> +}
> +
> +static inline int efi_kho_update(phys_addr_t fdt_addr, u64 fdt_size,
> +				 phys_addr_t bootmem_addr, u64 bootmem_size)
> +{
> +	return 0;
> +}
> +#endif
> +
>  /*
>   * The LINUX_EFI_MOK_VARIABLE_TABLE_GUID config table can be provided
>   * to the kernel by an EFI boot loader. The table contains a packed

-- 
Regards,
Mukesh Pilaniya

