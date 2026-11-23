Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795419636;
	b=KLQAxolMzMK20J+UU/xoLigU18v2GFUiL4SlhKvqQnMt+fKg1YjWnf5qScZajtaVCDsD
	 fYVZhjR7lAiQ9BAiFe/YVS+QOfFhTSG0XqXMuxV3QV+4nN/UEsJPRZP9jM6C3T7oJtjI1
	 rGp0AczY9BldudSylrFPui0UY+ffwkE22Lsvr4ECFxwaJ5aBJ03WVMhX2NUHCM0Yv8zr0
	 Gljgmg/W+vcUtRM2C9QsPHkWN7HEHuUkSDLfTzB6c/R2U4+7CqewgjWvGUcXuIkgVnQCh
	 di3SlXrFEEqFRzQC9GaasJAEuu/wbBD3XcBzdnyIk0FIHEZzgQ8QDwIfPwgzuCWjZVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795419636;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:From:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=0OSpOlJ5QU7jjdI5ogSU6KcCruhdHca3yQivXfMqClg=;
	b=3YMMzYATKuf92nJsuuKD54gsEga/1AHIJoCYPH8rKoHwygjRm706kwB98NoagyDxUx9M
	 E3iB6UkNr/vdd/gpJ93UJmrDKxdnr6HhhGhWP/rDhgFvm+QNVvBJmPUMDG343mNItWfTe
	 M7ERRJ+B8AUnDtSQtbsI8UoQt/LRxcVqOd55KOkBgojh4b1+RVlS4TRy3J4dxQGTKPLT8
	 jMikHxOQ+Y+0bk96icS+tJOQfSl3DrPMaI3P7/licnaNFeqj+kGavywD+prbN+VhLb90/
	 aIEZgBkcObx5yX3GBISrhGu2NglZyMRDi/97WFQWGlKJmtT9LC8yb/61NOOZF9dmckw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fd56S2lJ;
	arc=none smtp.remote-ip=74.125.227.131
Received: from mail-pj2-f3.google.com (mail-pj2-f3.google.com [74.125.227.131])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A0B2606A31F
	for <loongarch@lists.linux.dev>; Mon, 23 Nov 2026 07:40:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A0B2606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fd56S2lJ
Received: by mail-pj2-f3.google.com with SMTP id 98e67ed59e1d1-3adc0ac3566so709069a91.1
        for <loongarch@lists.linux.dev>; Sun, 22 Nov 2026 23:40:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795419635; x=1796024435; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0OSpOlJ5QU7jjdI5ogSU6KcCruhdHca3yQivXfMqClg=;
        b=fd56S2lJFljsyT+gKD2lEqCNaSpEfSUjnn9IgdoNKbRtz2dEGB9987grS0eiqQFc3w
         hBbrJm9SWvjhnMK2lYQC3SoRdqaAyQQXRD+0scI4BFndoQLeIIlbRCZEHy8j0LwLYtcU
         v70Sfj71p3ui5vMIuX3kxbV853h8GQhDR2B3Do+6ic5EXwuG701tpQ+qHndlNRhFVAwA
         nJSCK/loGqUYl6HofAVEFWdOz3QMt83AqTYsQBs0/rmD96L9ncKJoYHsXrCvvtV98oSU
         Z4xg14uTzbYLUsbRdMjJobkz6f8MeIDc7yfx96X1S65m7q0Hb9ldJHeT295o5xpIqmYc
         wtgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795419635; x=1796024435;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0OSpOlJ5QU7jjdI5ogSU6KcCruhdHca3yQivXfMqClg=;
        b=KM4UIcuHyb9hGkmJNYNQv9y+VBL6YTsypflNljmk2vHMoD4/NQWO1Q6BRpcV4PUJEd
         /7F0SOt8RauO//drfLlydxUs5LbCTgMG0Wdw8dJWW2IMz8/wlJ7FAWPjxFtmCjq0W9Yy
         Q/Q/vkudN8yxmKTE90JY52gCZKm/ZK6nv9fVbaMPJeMsS4DXL6THQQc4TAT2Go/5muCP
         4BGWo4w2MqceB0spSbcYcu2Y5fb03wgmVZo2tdQyaWqbid9klMVmEC7nkVjAHN719nc7
         az7mOmK+D0p65+O6Vmcd73W1+pmKCdmVw1kQcuO91ahddOWLBimEhhXlH/9nzTCJK8IN
         AUWw==
X-Forwarded-Encrypted: i=1; AL+hErEV4ftFzhyd5/DEnXGfVfgAoVwolXIi9blpVJWe8k2E3QwXO+Q46i2cHr6U7QgytnOENnqBiuZswdA=@lists.linux.dev
X-Gm-Message-State: APuU4Z9WA4y7zdI6ll76FF47VCKPiSEjGVVGQNJEkO2FJ/U6tHTmZL4c
	zU6SX/+h0g2paMUtuNKVjbpN4BY89BWs3GLYwwoWYDAwTdXreJkwWMlA
X-Gm-Gg: AZFdTZfp6RV20cqErM3JjHZvmbTb2IjIa0nBg3bteec+sXfc7MJGNbQckNCbghwvU3j
	IvzoOD/nvJe49w7OhiVvKO0hSd1giX9Nxp0bScmENgsLuxtJYHmrH0uvUfINkt+vMcqdhVfoq23
	nyLpe2T5uv0OZtHq8K7XPy2ND91eNTjuALg4eg95pL+TbyF1S/l5Kpg9rZnEF+iTKXdcdNFKKBD
	NPck+e4+nzivv+9Y6m4skMIhB+RWBR66z2dO6DIPonjBSsMp8sGRDp1Fku2jOBDHMjZOvfUxvj3
	kzcdUybMfLC1kxm5ti7INFEYyamzrsaOu8IYx4CH9YB9WdW/nj0chBujN3IibgU3uxij8pkYpHb
	5HC26L/cUr+Yq1J4AvHUoGgPy7mGeCqEJORKnWo4C1kUG6usqX1zecFysGDJvvFIqIfmIo+QpzP
	030ZkKVxThEnuIEed0g5cXhck7Ai1XBBTP6tnF/aXTWSjOtriUAnxJMCYqMJMH0poWANin1+r4Y
	lgC6llKk9fFPuW4YEyUzMc+k/QEga8T5vGZj6nhgOCHJq42mzGr6e28vQNE8W4Wwhu2qEE9dQND
	UvQh9dCu9txnJOyH2Ram3cniJ0o+KIXvtSp6
X-Received: by 2002:a17:90b:2f8c:b0:3b4:1997:3495 with SMTP id 98e67ed59e1d1-3b41c9613bbmr9155015a91.57.1795419634749;
        Sun, 22 Nov 2026 23:40:34 -0800 (PST)
Received: from [10.125.112.22] ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad8ef99sm17103994a91.12.2026.11.22.23.40.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Nov 2026 23:40:34 -0800 (PST)
Message-ID: <a3ebfc1c-9c98-44a1-96e2-4d92daed4ba4@gmail.com>
Date: Mon, 23 Nov 2026 15:40:19 +0800
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
Subject: Re: [PATCH v9 1/8] riscv: build crash_mem ranges from memblock
 instead of resource tree
From: Wandun <chenwandun1@gmail.com>
To: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu
Cc: catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com,
 chenhuacai@kernel.org, kernel@xen0n.name, alex@ghiti.fr, tglx@kernel.org,
 mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org,
 hpa@zytor.com, saravanak@kernel.org, akpm@linux-foundation.org,
 pasha.tatashin@soleen.com, pratyush@kernel.org, ruirui.yang@linux.dev,
 robin.murphy@arm.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, loongarch@lists.linux.dev,
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 kexec@lists.infradead.org, linux-mm@kvack.org, iommu@lists.linux.dev,
 robh@kernel.org, baoquan.he@linux.dev, rppt@kernel.org,
 m.szyprowski@samsung.com
References: <20261021083011.2170525-1-chenwandun1@gmail.com>
 <20261021083011.2170525-2-chenwandun1@gmail.com>
Content-Language: en-US
In-Reply-To: <20261021083011.2170525-2-chenwandun1@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 10/21/26 16:30, Wandun Chen wrote:
> From: Wandun Chen <chenwandun@lixiang.com>
> 
> Replace walk_system_ram_res() with for_each_mem_range(). A later patch
> introduces MEMBLOCK_NODUMP in memblock, the reserved-memory regions
> marked with MEMBLOCK_NODUMP can be excluded from the vmcore by walking
> memblock.
> 
> for_each_mem_range() iterates memblock.memory, which is freed after
> init unless ARCH_KEEP_MEMBLOCK is selected. riscv needs ARCH_KEEP_MEMBLOCK
> to filter reserved memory from the vmcore, so extend its condition
> (ACPI || KEXEC) with CRASH_DUMP. arm64 and loongarch already select
> ARCH_KEEP_MEMBLOCK unconditionally.


Hi Paul, Palmer, Albert,

A gentle ping on this patch.

Mike has requested a RISC-V maintainer Ack before taking the revised
series through the kexec tree. Could you please take a look when you
have a chance?

Thanks,
Wandun

> 
> Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
> Tested-by: Meijing Zhao <zhaomeijing@lixiang.com>
> Acked-by: Baoquan He <baoquan.he@linux.dev>
> ---
>  arch/riscv/Kconfig                     |  2 +-
>  arch/riscv/kernel/machine_kexec_file.c | 31 ++++++++++----------------
>  2 files changed, 13 insertions(+), 20 deletions(-)
> 
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index e7891a2a89da..e21d0bab77ee 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -58,7 +58,7 @@ config RISCV
>  	select ARCH_HAS_UBSAN
>  	select ARCH_HAS_VDSO_ARCH_DATA
>  	select ARCH_HAVE_NMI_SAFE_CMPXCHG
> -	select ARCH_KEEP_MEMBLOCK if ACPI || KEXEC
> +	select ARCH_KEEP_MEMBLOCK if ACPI || KEXEC || CRASH_DUMP
>  	select ARCH_MHP_MEMMAP_ON_MEMORY_ENABLE	if 64BIT && MMU
>  	select ARCH_OPTIONAL_KERNEL_RWX if ARCH_HAS_STRICT_KERNEL_RWX
>  	select ARCH_OPTIONAL_KERNEL_RWX_DEFAULT
> diff --git a/arch/riscv/kernel/machine_kexec_file.c b/arch/riscv/kernel/machine_kexec_file.c
> index 26cd2a8bd0cd..808e872f4063 100644
> --- a/arch/riscv/kernel/machine_kexec_file.c
> +++ b/arch/riscv/kernel/machine_kexec_file.c
> @@ -37,39 +37,32 @@ int arch_kimage_file_post_load_cleanup(struct kimage *image)
>  }
>  
>  #ifdef CONFIG_CRASH_DUMP
> -static int get_nr_ram_ranges_callback(struct resource *res, void *arg)
> -{
> -	unsigned int *nr_ranges = arg;
> -
> -	(*nr_ranges)++;
> -	return 0;
> -}
> -
>  unsigned int arch_get_system_nr_ranges(void)
>  {
>  	unsigned int nr_ranges = 2 + crashk_cma_cnt; /* For exclusion of crashkernel region */
> +	u64 i;
> +	phys_addr_t start, end;
>  
> -	walk_system_ram_res(0, -1, &nr_ranges, get_nr_ram_ranges_callback);
> +	for_each_mem_range(i, &start, &end)
> +		nr_ranges++;
>  
>  	return nr_ranges;
>  }
>  
> -static int prepare_elf64_ram_headers_callback(struct resource *res, void *arg)
> +int arch_crash_populate_cmem(struct crash_mem *cmem)
>  {
> -	struct crash_mem *cmem = arg;
> +	u64 i;
> +	phys_addr_t start, end;
>  
> -	cmem->ranges[cmem->nr_ranges].start = res->start;
> -	cmem->ranges[cmem->nr_ranges].end = res->end;
> -	cmem->nr_ranges++;
> +	for_each_mem_range(i, &start, &end) {
> +		cmem->ranges[cmem->nr_ranges].start = start;
> +		cmem->ranges[cmem->nr_ranges].end = end - 1;
> +		cmem->nr_ranges++;
> +	}
>  
>  	return 0;
>  }
>  
> -int arch_crash_populate_cmem(struct crash_mem *cmem)
> -{
> -	return walk_system_ram_res(0, -1, cmem, prepare_elf64_ram_headers_callback);
> -}
> -
>  static char *setup_kdump_cmdline(struct kimage *image, char *cmdline,
>  				 unsigned long cmdline_len)
>  {

