Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 836BD449B03
	for <loongarch@lists.linux.dev>; Fri,  4 Sep 2026 13:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788528726; cv=none; b=mpNUXvM0pIbktmW5RLy/etNInYilCBXsc2v5EYaBQDcpthdaLRPDsV6jhhDeVhd33cvd7S8cf/+cWIZ/Lh1zAz+ldSg8HXqlVUgYFnC6QyD6wVopxXFzVsu9OAwVQfRmeKUlu07LfcDw8n1160ksO58ENs/kP0vAuhw2q1zOfFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788528726; c=relaxed/simple;
	bh=C7z5V731jarmZubJ2K9Qx2K4A5sVH5GDaEe3NpPUqZ0=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References; b=VAhbNkYSjgQ9jwQcXWVGHBqamaeAqTP267QgB8BJXv1IwAJ3QFN52vigv/oDSqVHt0YrblvCxAMSjP++Y6iROYM2o6rvXrQLIWkUVELf1RZzFwUhZ44h5hvO31wVNOa+HRr6Bm6kE2jS3WHgo3jiCZGGk/ia/Qy/MzshQN046N4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pTBSHS7Y; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pTBSHS7Y"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cbb8b54fcf8so1350075a12.0
        for <loongarch@lists.linux.dev>; Fri, 04 Sep 2026 06:32:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788528724; x=1789133524; darn=lists.linux.dev;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=gE9P4GObqZliYweF8gHdbLVlqBxBO1frIJ8W7HGnk/w=;
        b=pTBSHS7YYJskY4ZNJgEixXXjRpx2Zn9V0SRyg5OUE0OjaMdR7+i3dMIdLfPuyH/t3W
         8F6xpBZz+2ZZ2DT2m6V5rLR4C1W6/GG9AokceDi36CgvQQhwP4nx6VIY8Jrc25eK2BoN
         9ZLNh9A/Vfvho5U+i21jSuX9CmbUNGMi30YHnvOcQsdD1gX35NzKQssEvGfkT+8nYtyP
         GesGbzuInGs+InBMNXzyLBUKFfLIfVs6c9pOjvRRNUfm1XWCMfryUCp1ViDJ/DXY+flb
         oW1CSnuQy3+a7nOuEcGZ2GkenacnufKPtC4IBFRgn0zhuT6ONzxE35MAkrnpJSjIWVoV
         Uajg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788528724; x=1789133524;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gE9P4GObqZliYweF8gHdbLVlqBxBO1frIJ8W7HGnk/w=;
        b=bHa9TI64Fwu74hM/5VNrnVUTA8K1YTtaM2OZsUr1NZOblBGsZKgSFgWwNP+A2Yqcgm
         8prmtD6fKsHMt3b/Berx7K2yZGHP2IWRu5D4jPOXULE4dQORTsAToDQZoFpmIla2qK7J
         KMQslY91cwW52ufVgxecq161agMrhMVwUvlBMFeP8OKsrqaemBx+anmgS3fJSREyyMFN
         fN0W/NiZo49aFpJp35X0kgsEdGxhRNINKiy8QOYoP2SKcX0msLrTG/UN03typ4tyRiRh
         YJRm6hyMo/Dkr1PB3wIhtpvbgnVPSEeFPlTfSLSDshJ31/jQuOyhdvtwPkaxv7ReLT21
         g0Lg==
X-Forwarded-Encrypted: i=1; AKwUvByZryipwVv30fnpV216LmPGGfu/ZwN2I+mLHMYKjQ+8iSvCmE/t5mOghp5krzmkg2HdNBcQCXjcvZs=@lists.linux.dev
X-Gm-Message-State: AFuF++nW1B0JnxnbLA+LPpjHalLrgyZpE/9Wn555EsOfSLSWGMR6Iymz
	hJ5YUADS0lfXIxsHsXbpD3xr3KPxWq2nkGkZUz4T8Gnah5dxz2G+9iwQ
X-Gm-Gg: AYBFou2Lx9FUs0FESQzVDuQrgCT2y2eSe5ryUZXazBtMyNOz3AtDX5wkM3AgYuno8Am
	GLMGSmFNVMrSuiZx6NTGUeVPiKd8Pd2dmgCmxlyaIACkzXmJyXE0CFmVI2EIf7E6vUFGDFrCJSD
	/NlYUP2zOhnhn1diZZOn0eoC/iyA02Fu6Sg2loPsBbRrUt8HLwW/YmmdLpJVCFU8BVjP+OW3Vfh
	EE3h/dX6huX3/epZWsh3aOpp+GKc99X6jN9ZlBVVf/RsFyWv8yp7trQtKE8gRRR832EMa1YLKnv
	tmEA0JRH/69XJj+2heOr8zeEk4E32viUoAuKpR9JF63PqVfmWwWmxQS4cgiq7k20zeUxn16w7dw
	YixqS6WYeEsbf3244B7bblYAe3DW+p/VW63gzOGemyAfm4rvVYrXPlQx2bq5o528ej20/ZIb/OM
	HJES+QleHv6XXP+JYjLDLvWLHUxOwrPPB78dQ7SwmT/Pr9Fs4rb/HSpl4da9ZY6AWP1NTmnhVYC
	DdIoeWgl0vmTd01YzNoNn1P3Zo46qGyEKG40JPk+8TU
X-Received: by 2002:a17:90b:3a50:b0:38e:4cb:51f with SMTP id 98e67ed59e1d1-39b26101576mr10859346a91.11.1788528723581;
        Fri, 04 Sep 2026 06:32:03 -0700 (PDT)
Received: from pve-server ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339a534d25sm7083483eec.5.2026.09.04.06.31.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 06:32:02 -0700 (PDT)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Sean Christopherson <seanjc@google.com>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>
Cc: Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, Atish Patra <atish.patra@linux.dev>, Alexandre Ghiti <alex@ghiti.fr>, David Hildenbrand <david@kernel.org>, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, kvm@vger.kernel.org, loongarch@lists.linux.dev, kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, Itaru Kitayama <itaru.kitayama@fujitsu.com>, Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2 04/20] KVM: selftests: Rename "num" param to "nr_pages" for physical page allocators
In-Reply-To: <20260902164123.2546762-5-seanjc@google.com>
Date: Fri, 04 Sep 2026 19:00:16 +0530
Message-ID: <ecf9ta8n.ritesh.list@gmail.com>
References: <20260902164123.2546762-1-seanjc@google.com> <20260902164123.2546762-5-seanjc@google.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>

Sean Christopherson <seanjc@google.com> writes:

> Rename the "num" param in the physical page allocator APIs to "nr_pages" to
> make the unit and role of the param more obvious.
>
> Opportunistically rework the function comment to drop the superfluous
> kerneldoc style, and to very explicitly call out that success is guaranteed.
>
> No functional change intended.
>
> Tested-by: Itaru Kitayama <itaru.kitayama@fujitsu.com>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  .../testing/selftests/kvm/include/kvm_util.h  |  6 ++--
>  tools/testing/selftests/kvm/lib/kvm_util.c    | 35 ++++++-------------
>  2 files changed, 14 insertions(+), 27 deletions(-)
>
> diff --git a/tools/testing/selftests/kvm/include/kvm_util.h b/tools/testing/selftests/kvm/include/kvm_util.h
> index 5a7a455b5387..95bc0a78d2bc 100644
> --- a/tools/testing/selftests/kvm/include/kvm_util.h
> +++ b/tools/testing/selftests/kvm/include/kvm_util.h
> @@ -991,11 +991,11 @@ void kvm_gsi_routing_write(struct kvm_vm *vm, struct kvm_irq_routing *routing);
>  const char *exit_reason_str(unsigned int exit_reason);
>  
>  gpa_t vm_phy_page_alloc(struct kvm_vm *vm, gpa_t min_gpa, u32 memslot);
> -gpa_t __vm_phy_pages_alloc(struct kvm_vm *vm, size_t num, gpa_t min_gpa,
> +gpa_t __vm_phy_pages_alloc(struct kvm_vm *vm, size_t nr_pages, gpa_t min_gpa,
>  			   u32 memslot, bool protected);
>  gpa_t vm_alloc_page_table(struct kvm_vm *vm);
>  
> -static inline gpa_t vm_phy_pages_alloc(struct kvm_vm *vm, size_t num,
> +static inline gpa_t vm_phy_pages_alloc(struct kvm_vm *vm, size_t nr_pages,
>  				       gpa_t min_gpa, u32 memslot)
>  {
>  	/*
> @@ -1003,7 +1003,7 @@ static inline gpa_t vm_phy_pages_alloc(struct kvm_vm *vm, size_t num,
>  	 * protected memory, as the majority of memory for such VMs is
>  	 * protected, i.e. using shared memory is effectively opt-in.
>  	 */
> -	return __vm_phy_pages_alloc(vm, num, min_gpa, memslot,
> +	return __vm_phy_pages_alloc(vm, nr_pages, min_gpa, memslot,
>  				    vm_arch_has_protected_memory(vm));
>  }
>  
> diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
> index 9ddc047d5c27..b071d77dd301 100644
> --- a/tools/testing/selftests/kvm/lib/kvm_util.c
> +++ b/tools/testing/selftests/kvm/lib/kvm_util.c
> @@ -2025,33 +2025,20 @@ const char *exit_reason_str(unsigned int exit_reason)
>  }
>  
>  /*
> - * Physical Contiguous Page Allocator
> + * Allocate contiguous (guest) physical pages in a given memory region, at or
> + * the minimum specific GPA.  If the memory is protected/private, also add the

at or "above" the minimum ...

Otherwise looks good. Feel free to add:
Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
