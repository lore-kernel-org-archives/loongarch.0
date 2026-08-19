Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4120471D04
	for <loongarch@lists.linux.dev>; Wed, 19 Aug 2026 11:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787140209; cv=none; b=LQOtwlYIONeeh+Uay1T/dsOK5KYtlJlYZFhslHgFDeRmuNowHHU4r+JsNvWDqsbvQRHwQVXpHdDMvJ0zNCa6AS8J20jZQJWer79VFxfHHVHLay/KYYEBhhyuA1WcuUZ1Xrg3MRh3ddac34U33vNKjCXeA3jpGE/mGkm3R5P47kc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787140209; c=relaxed/simple;
	bh=dLbO/KZ9p8AfNKJwP2FWUdac1cvSGmTwIke+Nm9losM=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WevsrvVhYsit3rdiibKAw3mtHPr4P4gLr6wtmOuQ6xLt/kmbpmCvBIPnxYmbkRXR3NqtRbOawDeYFKco6KNQ1Nl2lNCi7/qBoAmo57fJcpwEYpzvjjLWsW6U4jQ5O/aPqFB3x7hLhTrbE/aVBXjSw38J0xvKj/2l29o9Mixmnrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CpwRwZMV; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CpwRwZMV"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-39da69c5ba3so9370281fa.1
        for <loongarch@lists.linux.dev>; Wed, 19 Aug 2026 04:50:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787140204; x=1787745004; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qb8vbO35I9ReDoy08LYZaOcpJWIqiGdFJcRUGNTu904=;
        b=CpwRwZMVfwK7nfCjOYB+wwUFh8+JKyIom0nUsJu8nPzORQDki9N3jQLY/mX84h8OWA
         G0YEfLx1tM8gh9P8zOvoc8ApL+PPlorTXCKxSL0J70I8a7mHb/fLOosjGeFtL5/gd6nF
         c2naStS3/7SUggfcG3Mx1ao8/D13qzuNYjBRWgT6tvPmbxGbPPRBJ+LxLNblUzHWv2/4
         MvsOrj8k9f7Y9bhg/Cg7Lg9PbI3jsOL7L8HjHtkjqNGiu4CFWvnz7geVmGtYcvrKttAF
         7I0dKt98RzrXUa+sZbpAf9T0tWy+p4kP8JRxN6Kq50pQZumSfLom+6gqBqpqimxMJe1b
         jxAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787140204; x=1787745004;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qb8vbO35I9ReDoy08LYZaOcpJWIqiGdFJcRUGNTu904=;
        b=Ax6/c+1zlwXzydmIBfmbbhIhL43Z0CyDLZOfitlMW8PdAjAmbBFVcHj2ZiXF53fMmO
         1z6x7GrPwrzI5NXBkPAEMWeMOKjNh/ueYuZsCv/PbvT2asUT59t8sKv6kFyZv5upEHEl
         7kXZhe3ojtFugtjPsOFrpApYqZdsDJ2MYDCnurPnnADOSHL9QjodZkQ42Zm5zH7UVH+M
         po974ZbqgKLHKeOuvHfNlass7g9XER8akrztNG92XujlMikdR/b9HLZfpea+UWDPd+DR
         NLigYiWjaR0BxzSf1w4j7WxHRT77PFzj1EuSF2HXQrdlJmA4CCRefkVJ3scTDvE5gQb5
         Of0A==
X-Forwarded-Encrypted: i=1; AHgh+RrAxr7dU+fkM6rK7FhfcvTE+nJRdPfFWJMdoHIIi6cSyJZ8h4JGIC7aL1thoTAT860DSqkfNvD8YWk=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz+6YcxiNPV94f8H9lL3aQaqdAd5FGeuq/CLMmN51UMY9kDfM7J
	SBdBytUJGVNDuQ0Sl+K3Lz5Okwc8UKjUkSBV1aKApEN4gMJgO5jNHbTU
X-Gm-Gg: AR+sD10Slhn1ezdT8ZZGwtLs4MUsSMzCbibx9HDjXzi6aJiZtB6e25rYoWcqZawH2dE
	RuQSmjmlAEA6ApIrkTu2NRarBSulmna2EYb5APlRT8gemgj64Hz9LBo+AoVCfzJyyUYt2tnQfuW
	KHBNroSquwrbvjb9/QNNMi6hWZr4DGec8bEA8hkpB3IhzLc+1X8mi0vka14LOeVOhCsfYMHHaW9
	pNG6jWcK91Af63aRdnNl44xtTpllv+7BKqwNTgBjngTdijSCrq0IgzDxFUp4IWjuOPIFfTfJub7
	JK4k4tuYwlKe3ESC2kBn0C28bq1M/MbjfXFkyeBFmiADFVdLAgay51MuZSnj0D/7mPQ2L7vtBaI
	cFsO1IDOMCSWZSlamtfZJ2rTWX44917nvJJcYkTWQ6TR+7HyHcS3CohMTV55CkxoVJiywaxvMil
	ifX2GaXqUlZ8L7Gm9W4nbrubGFYkYLvK4ipW2zVUzAYNuNG66ei0tFDfUVgJxVOUWUyLz1MJpP4
	aQaYW7IF5eu6eAUMlY=
X-Received: by 2002:a05:651c:3135:b0:39b:48c1:8cd4 with SMTP id 38308e7fff4ca-3a18996bd7dmr7858151fa.7.1787140203900;
        Wed, 19 Aug 2026 04:50:03 -0700 (PDT)
Received: from pc636 (host-95-193-137-165.mobileonline.telia.com. [95.193.137.165])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a18a8e8579sm4123321fa.0.2026.08.19.04.50.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 04:50:03 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@pc636>
Date: Wed, 19 Aug 2026 13:49:58 +0200
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Adrian =?utf-8?Q?Barna=C5=9B?= <abarnas@google.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Alexandre Ghiti <alex@ghiti.fr>, Andy Lutomirski <luto@kernel.org>,
	Borislav Petkov <bp@alien8.de>,
	Brendan Jackman <brendan.jackman@linux.dev>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	David Hildenbrand <david@kernel.org>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Len Brown <lenb@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <pjw@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	"H. Peter Anvin" <hpa@zytor.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	Vasily Gorbik <gor@linux.ibm.com>, WANG Xuerui <kernel@xen0n.name>,
	Will Deacon <will@kernel.org>, x86@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, linux-pm@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	loongarch@lists.linux.dev
Subject: Re: [PATCH 3/6] mm/vmalloc: constify vm parameter of
 get_vm_area_page_order()
Message-ID: <aoWYZk7xNfjwuzQ_@pc636>
References: <20260816-execmem-set-vm-perms-v0-2-v1-0-90944a3ad43f@kernel.org>
 <20260816-execmem-set-vm-perms-v0-2-v1-3-90944a3ad43f@kernel.org>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260816-execmem-set-vm-perms-v0-2-v1-3-90944a3ad43f@kernel.org>

On Sun, Aug 16, 2026 at 01:59:26PM +0300, Mike Rapoport (Microsoft) wrote:
> get_vm_area_page_order() and vm_area_page_order() do not need to modify
> struct vm_struct passed to them.
> 
> Constify the parameter.
> 
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> ---
>  mm/vmalloc.c | 4 ++--
>  mm/vmalloc.h | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index 6822f0fe9583..fc7993db4152 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -3124,7 +3124,7 @@ EXPORT_SYMBOL(vm_map_ram);
>  
>  static struct vm_struct *vmlist __initdata;
>  
> -static inline unsigned int vm_area_page_order(struct vm_struct *vm)
> +static inline unsigned int vm_area_page_order(const struct vm_struct *vm)
>  {
>  #ifdef CONFIG_HAVE_ARCH_HUGE_VMALLOC
>  	return vm->page_order;
> @@ -3133,7 +3133,7 @@ static inline unsigned int vm_area_page_order(struct vm_struct *vm)
>  #endif
>  }
>  
> -unsigned int get_vm_area_page_order(struct vm_struct *vm)
> +unsigned int get_vm_area_page_order(const struct vm_struct *vm)
>  {
>  	return vm_area_page_order(vm);
>  }
> diff --git a/mm/vmalloc.h b/mm/vmalloc.h
> index 8866ddcff668..211869f36509 100644
> --- a/mm/vmalloc.h
> +++ b/mm/vmalloc.h
> @@ -12,7 +12,7 @@ void __init vmalloc_init(void);
>  int __must_check vmap_pages_range_noflush(unsigned long addr, unsigned long end,
>  		pgprot_t prot, struct page **pages,
>  		unsigned int page_shift, gfp_t gfp_mask);
> -unsigned int get_vm_area_page_order(struct vm_struct *vm);
> +unsigned int get_vm_area_page_order(const struct vm_struct *vm);
>  #else
>  static inline void vmalloc_init(void) {}
>  
> 
> -- 
> 2.53.0
> 
LGTM:

Reviewed-by: Uladzislau Rezki (Sony) <urezki@gmail.com>

--
Uladzislau Rezki
