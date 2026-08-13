Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26CAB43F8AC
	for <loongarch@lists.linux.dev>; Thu, 13 Aug 2026 08:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786609530; cv=none; b=G0Boow8Kd6EP2c6GRnJT3/Uoxixb1UWnJ3RbRqOeQ8DfHDb+Jahx7wBFaf9zWdoP42ZxZlTo+K/fZA1nHzB8jhKkdSItCG4szwjASTdDdsQS63VaIgRdgkRP2hItZt84FtqgFNXcfM8H+u4J3ZRyJ6EHUh+9ub+8fcArwAIcDRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786609530; c=relaxed/simple;
	bh=Y7BNuimeXVlYaDMHh3fzsGLBMK1P1hlUmyGXEMhzoEU=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cd1RULK5oR2MSCpys3ZxKcPoMjhMjqCdEZAbcDTuagCe4K9ygcy7ZuJPKoMyZ9lavPrZ8pe6BuV1cd3QuqNR6ARzk5aNz7MKzNueJEYXVE2TYRSGGjEvJbkZi4Q1LSaSlHURP/CsK3R+prE4WmdZJPR1I0LEiNGYVFtlmbKcuTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=QGcCufHM; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="QGcCufHM"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4953de5be0aso12988775e9.0
        for <loongarch@lists.linux.dev>; Thu, 13 Aug 2026 01:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1786609526; x=1787214326; darn=lists.linux.dev;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:date:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Am6SCPk8v8GLDWCWFlAXnJrEZnAx8ooip6YoSLmy0cA=;
        b=QGcCufHMditjRXubxYbUKy5NwNopucpJ/AnzkLr+PjgenK8uFMaV7W2SsYdBS1ZZPw
         DlRaEvl11eKWYkCtw2H2y/ZQ75tdwLMsHgUduPfkF1XHQFfumc89hfAln4Nu/vz0CdMv
         LU+KJhOAAWUpdfOw/A/RkDoloXQJYQyQi7qaZxBpKfBl3hFGflHJvhAZ3GwPcLDdQ22G
         XJUCrM60/kZC1b8XL720ZdbUKoujq5b3sMKe2LQw2YJdQOlDsJbtG/9p+zQ+GtNFaMvL
         mN3Knf8zJic+62xRZkNFrcVsQZ7OOxP77H7TxoHUC6KbDGEJ3oeitW1a+/ZZvavUlZ8z
         0cZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786609526; x=1787214326;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Am6SCPk8v8GLDWCWFlAXnJrEZnAx8ooip6YoSLmy0cA=;
        b=VI8RBeY0zJJY1H7qxdI50qcvQaJOZQEpm3cCK45B+M48WyDuGkLM35awzQA1Bj0MOK
         nLRqcwyrcueky1qVwilxRO+CzOuwNuaEwcTxPqmhnHaP9roea6kvzWYC39XzTy6eE0jf
         RimTPcBZleIz8BjDdvkwbtbuBS99qqEh4N3yX3lQlooQesDaKRqfccEWQjPr8mmtdOZd
         60vhi6UJtl7hRz0p6Q98n/PoC1Tb9ebGvdvXEBVv/C9QJCM21KPKVy8PA7zIzHGSaPAU
         cUU3vFxSufEFvb8JVRNOVSeox0EK5z57FBuaT5YVD9rpNLojbs+w+EXv+DuG7+LzOE3L
         Ihtg==
X-Forwarded-Encrypted: i=1; AHgh+Rq6e3aPtPRF4OuGEU2mvqNV0Hxjs/f4h6DCIT0m2AeiWJDGezkogILu7mPFsUTU1CiI1zAI3BEF4OE=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx2xPSB6K1bQ/r3k7Lg2b5f9TO8OxIgVgnrxbXqmibEeUSs8Rs9
	rTErwX6P/P9YBfPl/oS+cPgF1D8UG4ZfgT7rxHLSMk78M9IbdqrqFfaLk/8QPHmjYUk=
X-Gm-Gg: AR+sD11LbYk4EKdZ4vtK/oChQAeYnS6FqC8hhlBRqXqQmD6E1vE8SLVmzyDgwoq9Pk4
	te24j2N9BWlpb2BuMUVzzIY9neTGTSdyZr/SF2qgDck6PHZeHmx8H+hX5/SdIIKxhsapKB8qPYf
	rGhCfkzRlSUQxjQ1CaOXFbqqR482nQvgvGaCcder/ZF3SM4MDm1/dUuNT8jeS4Whg+uUbogvQpX
	MK0YSIEqwXSS9RGiB248M6Gy+rER53XHBoexfK4F/8EGD912d/GIGy1i65hu33XcndKC243NRT+
	sDoc9t1ZJgGLTV0VjMjbUAfz5q85C7zqCZGTtByf2lUu60H32R4o70yDnKj17Wx8s/sehTZPraB
	xb+NCGyxbGNq4W02ij222mz0vX7AD/4N0ZNSMXZsEIoIkukO9wq9s+Amcq2cNwvzyfuueMDrH0J
	2XuImskOuXMFvMSN8VhQaoVS1ZNkmDMz2XoqaWylehBMC6OsMVWehjbl+z3F4TPDRqKdMsQ+/w9
	HSVC3Vln8SN
X-Received: by 2002:a05:600c:5489:b0:493:f318:3bc6 with SMTP id 5b1f17b1804b1-49982199212mr46034725e9.13.1786609526347;
        Thu, 13 Aug 2026 01:25:26 -0700 (PDT)
Received: from r1chard ([61.222.76.173])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3931efaaae5sm1964641a91.0.2026.08.13.01.25.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 01:25:25 -0700 (PDT)
From: Richard Lyu <richard.lyu@suse.com>
X-Google-Original-From: Richard Lyu <r1chard@r1chard>
Date: Thu, 13 Aug 2026 16:25:21 +0800
To: Ard Biesheuvel <ardb@kernel.org>
Cc: linux-efi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>, loongarch@lists.linux.dev
Subject: Re: [PATCH 2/3] efi: Pass EFI boot memmap struct address to core
 kernel
Message-ID: <an1_cb5w02aii7ir@r1chard>
References: <20260813074506.643472-5-ardb@kernel.org>
 <20260813074506.643472-7-ardb@kernel.org>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20260813074506.643472-7-ardb@kernel.org>
User-Agent: Mutt/2.2.16 (2025-11-22)

On 2026/08/13 09:45, Ard Biesheuvel wrote:
>The EFI stub already passes a struct efi_boot_memmap populated with the
>information of the EFI memory map as a configuration table, and so
>passing the physical address, size, descriptor size and descriptor
>version via 4 different DT properties is kind of redundant.
>
>Instead, pass the physical address of this struct in memory so that the
>kernel can just retrieve the values directly.
>
>Unfortunately, the scheme with four separate properties is boot ABI for
>Xen, and so this needs to remain supported. But for the EFI stub itself,
>this is just an internal ABI that can be modified.
>
>Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
>---
> Documentation/arch/arm/uefi.rst    | 10 +----
> drivers/firmware/efi/fdtparams.c   | 39 ++++++++++++++++---
> drivers/firmware/efi/libstub/fdt.c | 40 ++------------------
> 3 files changed, 37 insertions(+), 52 deletions(-)
>
>diff --git a/Documentation/arch/arm/uefi.rst b/Documentation/arch/arm/uefi.rst
>index 2b7ad9bd7cd2..c19cf3720f27 100644
>--- a/Documentation/arch/arm/uefi.rst
>+++ b/Documentation/arch/arm/uefi.rst
>@@ -54,17 +54,9 @@ Name                        Type     Description
> ==========================  ======   ===========================================
> linux,uefi-system-table     64-bit   Physical address of the UEFI System Table.
>
>-linux,uefi-mmap-start       64-bit   Physical address of the UEFI memory map,
>+linux,uefi-boot-memmap      64-bit   Physical address of a struct efi_boot_memmap
>                                      populated by the UEFI GetMemoryMap() call.
>
>-linux,uefi-mmap-size        32-bit   Size in bytes of the UEFI memory map
>-                                     pointed to in previous entry.
>-
>-linux,uefi-mmap-desc-size   32-bit   Size in bytes of each entry in the UEFI
>-                                     memory map.
>-
>-linux,uefi-mmap-desc-ver    32-bit   Version of the mmap descriptor format.
>-
> kaslr-seed                  64-bit   Entropy used to randomize the kernel image
>                                      base address location.
>
>diff --git a/drivers/firmware/efi/fdtparams.c b/drivers/firmware/efi/fdtparams.c
>index b815d2a754ee..a54a76a6aaeb 100644
>--- a/drivers/firmware/efi/fdtparams.c
>+++ b/drivers/firmware/efi/fdtparams.c
>@@ -10,22 +10,30 @@
>
> #include <linux/unaligned.h>
>
>+#include <asm/early_ioremap.h>
>+
> enum {
> 	SYSTAB,
>+	MEMMAP,
>+#ifdef CONFIG_XEN
> 	MMBASE,
> 	MMSIZE,
> 	DCSIZE,
> 	DCVERS,
>+#endif
>
> 	PARAMCOUNT
> };
>
> static __initconst const char name[][22] = {
> 	[SYSTAB] = "System Table         ",
>+	[MEMMAP] = "Boot Memory Map      ",
>+#ifdef CONFIG_XEN
> 	[MMBASE] = "MemMap Address       ",
> 	[MMSIZE] = "MemMap Size          ",
> 	[DCSIZE] = "MemMap Desc. Size    ",
> 	[DCVERS] = "MemMap Desc. Version ",
>+#endif
> };
>
> static __initconst const struct {
>@@ -49,10 +57,7 @@ static __initconst const struct {
> 		.path = "/chosen",
> 		.params = {	//  <-----------26----------->
> 			[SYSTAB] = "linux,uefi-system-table",
>-			[MMBASE] = "linux,uefi-mmap-start",
>-			[MMSIZE] = "linux,uefi-mmap-size",
>-			[DCSIZE] = "linux,uefi-mmap-desc-size",
>-			[DCVERS] = "linux,uefi-mmap-desc-ver",
>+			[MEMMAP] = "linux,uefi-boot-memmap",
> 		}
> 	}
> };
>@@ -84,17 +89,20 @@ static int __init efi_get_fdt_prop(const void *fdt, int node, const char *pname,
> u64 __init efi_get_fdt_params(struct efi_memory_map_data *mm)
> {
> 	const void *fdt = initial_boot_params;
>-	unsigned long systab;
>+	unsigned long systab, memmap;
> 	int i, j, node;
> 	struct {
> 		void	*var;
> 		int	size;
> 	} target[] = {
> 		[SYSTAB] = { &systab,		sizeof(systab) },
>+		[MEMMAP] = { &memmap,		sizeof(memmap) },
>+#ifdef CONFIG_XEN
> 		[MMBASE] = { &mm->phys_map,	sizeof(mm->phys_map) },
> 		[MMSIZE] = { &mm->size,		sizeof(mm->size) },
> 		[DCSIZE] = { &mm->desc_size,	sizeof(mm->desc_size) },
> 		[DCVERS] = { &mm->desc_version,	sizeof(mm->desc_version) },
>+#endif
> 	};
>
> 	BUILD_BUG_ON(ARRAY_SIZE(target) != ARRAY_SIZE(name));
>@@ -115,6 +123,9 @@ u64 __init efi_get_fdt_params(struct efi_memory_map_data *mm)
> 		for (j = 0; j < ARRAY_SIZE(target); j++) {
> 			const char *pname = dt_params[i].params[j];
>
>+			if (pname[0] == '\0')
>+				continue;
>+
> 			if (!efi_get_fdt_prop(fdt, node, pname, name[j],
> 					      target[j].var, target[j].size))
> 				continue;
>@@ -123,8 +134,24 @@ u64 __init efi_get_fdt_params(struct efi_memory_map_data *mm)
> 			pr_err("Can't find property '%s' in DT!\n", pname);
> 			return 0;
> 		}
>-		if (dt_params[i].paravirt)
>+		if (IS_ENABLED(CONFIG_XEN) && dt_params[i].paravirt) {
> 			set_bit(EFI_PARAVIRT, &efi.flags);
>+		} else {
>+			struct efi_boot_memmap *bm;
>+
>+			bm = early_memremap_ro(memmap, sizeof(*bm));
>+			if (!bm) {
>+				pr_err("Cannot remap EFI boot memory map\n");
>+				return 0;
>+			}
>+
>+			mm->phys_map		= memmap + sizeof(*bm);
>+			mm->size		= bm->map_size;
>+			mm->desc_size		= bm->desc_size;
>+			mm->desc_version	= bm->desc_ver;
>+
>+			early_memunmap(bm, sizeof(*bm));
>+		}
> 		return systab;
> 	}
> notfound:
>diff --git a/drivers/firmware/efi/libstub/fdt.c b/drivers/firmware/efi/libstub/fdt.c
>index 23b3543d3041..417b1344bdd8 100644
>--- a/drivers/firmware/efi/libstub/fdt.c
>+++ b/drivers/firmware/efi/libstub/fdt.c
>@@ -32,7 +32,6 @@ static efi_status_t update_fdt(void *orig_fdt, unsigned long orig_fdt_size,
> {
> 	int node, num_rsv;
> 	int status;
>-	fdt32_t fdt_val32;
> 	fdt64_t fdt_val64;
>
> 	/* Do some checks on provided FDT, if it exists: */
>@@ -102,21 +101,7 @@ static efi_status_t update_fdt(void *orig_fdt, unsigned long orig_fdt_size,
>
> 	fdt_val64 = cpu_to_fdt64(U64_MAX); /* placeholder */
>
>-	status = fdt_setprop_var(fdt, node, "linux,uefi-mmap-start", fdt_val64);
>-	if (status)
>-		goto fdt_set_fail;
>-
>-	fdt_val32 = cpu_to_fdt32(U32_MAX); /* placeholder */
>-
>-	status = fdt_setprop_var(fdt, node, "linux,uefi-mmap-size", fdt_val32);
>-	if (status)
>-		goto fdt_set_fail;
>-
>-	status = fdt_setprop_var(fdt, node, "linux,uefi-mmap-desc-size", fdt_val32);
>-	if (status)
>-		goto fdt_set_fail;
>-
>-	status = fdt_setprop_var(fdt, node, "linux,uefi-mmap-desc-ver", fdt_val32);
>+	status = fdt_setprop_var(fdt, node, "linux,uefi-boot-memmap", fdt_val64);
> 	if (status)
> 		goto fdt_set_fail;
>
>@@ -148,33 +133,14 @@ static efi_status_t update_fdt_memmap(void *fdt, struct efi_boot_memmap *map)
> {
> 	int node = fdt_path_offset(fdt, "/chosen");
> 	fdt64_t fdt_val64;
>-	fdt32_t fdt_val32;
> 	int err;
>
> 	if (node < 0)
> 		return EFI_LOAD_ERROR;
>
>-	fdt_val64 = cpu_to_fdt64((unsigned long)map->map);
>-
>-	err = fdt_setprop_inplace_var(fdt, node, "linux,uefi-mmap-start", fdt_val64);
>-	if (err)
>-		return EFI_LOAD_ERROR;
>-
>-	fdt_val32 = cpu_to_fdt32(map->map_size);
>-
>-	err = fdt_setprop_inplace_var(fdt, node, "linux,uefi-mmap-size", fdt_val32);
>-	if (err)
>-		return EFI_LOAD_ERROR;
>-
>-	fdt_val32 = cpu_to_fdt32(map->desc_size);
>-
>-	err = fdt_setprop_inplace_var(fdt, node, "linux,uefi-mmap-desc-size", fdt_val32);
>-	if (err)
>-		return EFI_LOAD_ERROR;
>-
>-	fdt_val32 = cpu_to_fdt32(map->desc_ver);
>+	fdt_val64 = cpu_to_fdt64((unsigned long)map);
>
>-	err = fdt_setprop_inplace_var(fdt, node, "linux,uefi-mmap-desc-ver", fdt_val32);
>+	err = fdt_setprop_inplace_var(fdt, node, "linux,uefi-boot-memmap", fdt_val64);
> 	if (err)
> 		return EFI_LOAD_ERROR;
>
>-- 
>2.47.3
>
>

Reviewed-by: Richard Lyu <richard.lyu@suse.com>

