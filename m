Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5689F43F0B4
	for <loongarch@lists.linux.dev>; Thu, 13 Aug 2026 08:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786609562; cv=none; b=MltqoUvRJnGNSjnp2gG5mxvb/STFCQbrQHbFDECOL3rT+NqBMjuWQ/w8WPAEHlPZDAAeC76AIgZtSTRYpVMnofJPwCyZFPMwv/9E9E1nfEpampN9cM4F4QRwgqJG1sLAQ7yxxXkKCUunF+mGJR0RgAEBqiklP4V4zit6KcNG6p8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786609562; c=relaxed/simple;
	bh=KA2ruE16PN9H+yf8WYCIc8Pu9NRx0u91ZqkzR5Q/MQ8=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aheIWuHlavRqPdA60/5C3xZMH0l6SflIZNI9ZoYbWJkeF1GBlviSZdrsS62/lUApt8ACF90qin80Rl+y6tYYlj046dGkEmXAIiOsYlmEfPdCbbnNWfP9m5VfjCOiwWZteswE7gAk4NN9XgPujcZmKEPfAkAw8GvW1qqga095TaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=bS1lV0RO; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="bS1lV0RO"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-49556f97a9dso11162935e9.1
        for <loongarch@lists.linux.dev>; Thu, 13 Aug 2026 01:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1786609558; x=1787214358; darn=lists.linux.dev;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:date:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=+SYyR6EQQIsM2Vg2lfNRN1vzD/kfGQIxnSaF9qwESjU=;
        b=bS1lV0ROpdpdhycoqQH5Z4/qSE9xbonLHRfIFlHpxEBY7FKB+mn/w5r3y413R/hQ6j
         3om5Mu45KuKpkPw6cNb5U2/b5kwOuK0AupDSd0h9BpW8vuCsjTyKCCdjiDLvyDmX75G4
         wqYm8rr6RWc9OHtDUXzpMxb6SuUIGCZ/b7beQA3Zkq7on6qnzMhC8SuP49VL7hrvevbP
         OASiPxtTaQxPRTWeLkQWoy0Zsnb5NdXW3hYYNQ1rMf7ahzxS4+2iSI6rMeIPkBahR0/G
         SSLKwka4dquwzg1yiVKKSKBilVZ54nSYrohlXbci1qdwvyLrbvJo6yMzmDE57/v2QgPi
         OQvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786609558; x=1787214358;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+SYyR6EQQIsM2Vg2lfNRN1vzD/kfGQIxnSaF9qwESjU=;
        b=OPNNgT/hR7njmuAXM7cIuz7UGywHewUKD+7sqvjAgR80APGdQh5DbuqSB+SXTrI3o3
         bz7zQoRGf6IkysrJKG0Ro0KSL7GeK5UusW4m84ymhBIYI4r/Kidb036HRxviTL0xJNO6
         vj7I4isbOLAgU+nI1wgiOPDeHMDgskiRhz322smXPFcnMsbPp09WjW7q/0hhq+p+KAyv
         6Pgno81LgKI3wxVz/ThUOdfDKSHjRDYgqyP3uhq7YX7/GkPaLg00hWb1lCce6Mey44sr
         cKMfGP5TWzhMseSalB4PINw/6mvJ9ePu14C1lrY7Y8VUqFRFzZHowBLQzfD9xznzbxMx
         0S2g==
X-Forwarded-Encrypted: i=1; AHgh+RrUYz/xgTq8yhnGgImXag2DrJNJVc+UE7Kkc3cH3cU4Sck/WvA19kYsoWFVHxNrfGfYA7AgCq+Xbkc=@lists.linux.dev
X-Gm-Message-State: AOJu0YzisMMAwx63weGuQdJgMyhlDU4FPKUdTkTAGuZDpqYLvtHOaZyF
	zlAmUnQyZLue8aGXoNzrfBr6gVowEuK9zvYHl1bnxevOyId6Q8OwHzTu2T0Q4xf9FAk=
X-Gm-Gg: AR+sD12EdTqlJK5Qt74N/pysCRHFpUpqup8zmaAcAXthnXUNVIcun108w0nF9jQrXyU
	RpAFFc1vCyFRKQ1HpLcEQDVlHmDqUTM2HipuvRIlfkI2ufid8Lcmri6dRNvJc+J4Ji3fONIEDjq
	vYZtz/yO/CNXZyqOHeCJybtz4ti2htvkh/ulET1KF6DZCrkTxlffDDhNLik2z3oGkqw3ORVe2D7
	WOpc9aTxaoTwhZeoKj4Sbr5fVfeYI2F3GibqsIYcvO81a9R7tMuNqSS+kzF6Wf1hLlcdqShwp58
	YwSyhw4mFEAP1qO08PC1kIDhV2ggUv3eHp3Ouo0MN/0shGdqPuzlgSvz9J7VDr3tL0QsxRySRgo
	Oy+MjNg3Jtr2Kw3QU8uk/n/Qthf1je2PwKO46XjeWupiQ0kmVNlkutOBY2ozH7ez1FHKl99MHP1
	xb4LKmZgqKBY57II++S2UDmkJkhTsPepu/VZN8O+MN9lr+3uLR1fyojOD46Ek3QcK+yP10+96Jc
	TTJdfw=
X-Received: by 2002:a05:600c:3e8e:b0:499:79ba:ed92 with SMTP id 5b1f17b1804b1-499821d0652mr48629115e9.13.1786609558388;
        Thu, 13 Aug 2026 01:25:58 -0700 (PDT)
Received: from r1chard ([61.222.76.173])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3931cefe5fdsm2416153a91.13.2026.08.13.01.25.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 01:25:57 -0700 (PDT)
From: Richard Lyu <richard.lyu@suse.com>
X-Google-Original-From: Richard Lyu <r1chard@r1chard>
Date: Thu, 13 Aug 2026 16:25:52 +0800
To: Ard Biesheuvel <ardb@kernel.org>
Cc: linux-efi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>, loongarch@lists.linux.dev
Subject: Re: [PATCH 3/3] efi: Make the 'linux,uefi-boot-memmap' DT property
 optional
Message-ID: <an1_kKjIWebhWVT5@r1chard>
References: <20260813074506.643472-5-ardb@kernel.org>
 <20260813074506.643472-8-ardb@kernel.org>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20260813074506.643472-8-ardb@kernel.org>
User-Agent: Mutt/2.2.16 (2025-11-22)

On 2026/08/13 09:45, Ard Biesheuvel wrote:
>The 'linux,uefi-boot-memmap DT property' is redundant in principle,
>given that it carries a physical address that is also passed via a EFI
>config table entry.
>
>However, if SetVirtualAddressMap() has been called, the address of the
>config table array has been translated to virtual, and so the memory map
>is needed to translate it back to physical before it can be located.
>
>This means that passing the linux,uefi-boot-memmap DT property is only
>needed if SetVirtualAddressMap() has been called, which is a terrible
>idea anyway, and if it has not been called, the config table array can
>simply be parsed to look for LINUX_EFI_BOOT_MEMMAP_TABLE_GUID, and the
>address taken from there.
>
>So permit this, and make the boot memmap property optional.
>
>Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
>---
> drivers/firmware/efi/fdtparams.c | 42 ++++++++++++++++++--
> 1 file changed, 38 insertions(+), 4 deletions(-)
>
>diff --git a/drivers/firmware/efi/fdtparams.c b/drivers/firmware/efi/fdtparams.c
>index a54a76a6aaeb..89ffccf35fd7 100644
>--- a/drivers/firmware/efi/fdtparams.c
>+++ b/drivers/firmware/efi/fdtparams.c
>@@ -89,14 +89,15 @@ static int __init efi_get_fdt_prop(const void *fdt, int node, const char *pname,
> u64 __init efi_get_fdt_params(struct efi_memory_map_data *mm)
> {
> 	const void *fdt = initial_boot_params;
>-	unsigned long systab, memmap;
>+	unsigned long systab, memmap = 0;
> 	int i, j, node;
> 	struct {
> 		void	*var;
> 		int	size;
>+		int	optional;
> 	} target[] = {
> 		[SYSTAB] = { &systab,		sizeof(systab) },
>-		[MEMMAP] = { &memmap,		sizeof(memmap) },
>+		[MEMMAP] = { &memmap,		sizeof(memmap), 1 },
> #ifdef CONFIG_XEN
> 		[MMBASE] = { &mm->phys_map,	sizeof(mm->phys_map) },
> 		[MMSIZE] = { &mm->size,		sizeof(mm->size) },
>@@ -131,14 +132,47 @@ u64 __init efi_get_fdt_params(struct efi_memory_map_data *mm)
> 				continue;
> 			if (!j)
> 				goto notfound;
>-			pr_err("Can't find property '%s' in DT!\n", pname);
>-			return 0;
>+			if (!target[j].optional) {
>+				pr_err("Can't find property '%s' in DT!\n", pname);
>+				return 0;
>+			}
> 		}
> 		if (IS_ENABLED(CONFIG_XEN) && dt_params[i].paravirt) {
> 			set_bit(EFI_PARAVIRT, &efi.flags);
> 		} else {
> 			struct efi_boot_memmap *bm;
>
>+			if (!memmap) {
>+				unsigned long tables, nr_tables;
>+				efi_system_table_t *st;
>+				efi_config_table_t *tbl;
>+
>+				st = early_memremap_ro(systab, sizeof(*st));
>+				if (!st) {
>+					pr_err("Cannot remap EFI system table\n");
>+					return 0;
>+				}
>+
>+				tables		= st->tables;
>+				nr_tables	= st->nr_tables;
>+
>+				early_memunmap(st, sizeof(*st));
>+
>+				tbl = early_memremap_ro(tables, sizeof(*tbl) * nr_tables);
>+				if (!tbl) {
>+					pr_err("Cannot remap EFI config table array\n");
>+					return 0;
>+				}
>+
>+				for (int i = 0; i < nr_tables; i++) {
>+					if (!efi_guidcmp(tbl[i].guid, LINUX_EFI_BOOT_MEMMAP_GUID)) {
>+						memmap = (unsigned long)tbl[i].table;
>+						break;
>+					}
>+				}
>+				early_memunmap(tbl, sizeof(*tbl) * nr_tables);
>+			}
>+
> 			bm = early_memremap_ro(memmap, sizeof(*bm));
> 			if (!bm) {
> 				pr_err("Cannot remap EFI boot memory map\n");
>-- 
>2.47.3
>
>

Reviewed-by: Richard Lyu <richard.lyu@suse.com>
