Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD2BBB664
	for <loongarch@lists.linux.dev>; Sun, 23 Jun 2024 10:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719137919; cv=none; b=IL7MWAczWVLLaDCIDp1mjNdGfJUEv+k7M+SU+aK0ii4cIV1hlZc5Vm1u6nxjO6JV0rh457Ft0dWpZexL601IBP3lOnJNQJRI3yzZTpDwBavV5sQgjvupT39k7p/XZagmycikID5sbNdduzHLzxXYy39PmRMeL9RgdRBa0hu9Lxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719137919; c=relaxed/simple;
	bh=YvSVXJdBQKWUuhk9Qus9TV4AhCWxwK8gs3Y89XMznTI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BqpbSFx4X5HgWX1koD8RthkxycYXyCycHS0tl2hQjSAGkTsPlFQE6OK7fYZGr6nQPoyWr9b6i8JKeVieJFPfpFNHPIyh0YwGh/NDShddiRLDIMFsS8cQNXOlB3HlrQORqNNXPHqWbNt+ZaBSTQHSnCRzN9eg6AuMd2Gfpd9qN9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gpp7I21V; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gpp7I21V"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F254C2BD10
	for <loongarch@lists.linux.dev>; Sun, 23 Jun 2024 10:18:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719137919;
	bh=YvSVXJdBQKWUuhk9Qus9TV4AhCWxwK8gs3Y89XMznTI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=gpp7I21Vk/LF2bkbXohHJUXdbaUjuIKA26Vck4ESRK2TDVtOdLDWtqN8mxPcxfGxb
	 gzAbsiscGjZSSGHBtaf2Q0aiH3l2caAEOGXNoIkGOmm4XGxtsElE4uKgKRJpWjVTiT
	 lvej8KYHB+Y0YGYPYUnivy8OElXkxPfTYsRoYfyvYKt7llKfW85lQNZHFZdvH3wLEY
	 b0G9twTcDqWZBIvib9qv/iUV0oUMhEvUh8ALp38+9KpterAMFwxojOlhkZF6eCY+xk
	 VfpWxBuoG8JY8YhNaSQrKKignxrrWu2mIn3X3yceHbI3ziIma6QYh1kJJ0Y9Hua8hb
	 hQE9zy1xtU9AQ==
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a689ad8d1f6so422383666b.2
        for <loongarch@lists.linux.dev>; Sun, 23 Jun 2024 03:18:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWDnPVAtwYW849ycrFZq5v2aeBXQ+/DpDUy3BiRBHvzRIEmQY3mBk5+v0CQSUU8NjA4a1aLftuJKpPm3PnEP+pI5j6XgaRTCvK4
X-Gm-Message-State: AOJu0Yw/u5pVBRBLq8OngLMU9nOhlVk++qW1jh6Q7hnNsGHoy4VlGNe7
	VIqqHAJqCsNEUZZNe5eiWm6EbrWEbSyCMCykP7kMmR9adNQoMZYNFLMIR1c4NXd1EOtjoim0yrI
	5GLSD6yV0Irg3aweXkZBR+N76RI0=
X-Google-Smtp-Source: AGHT+IETl9tcGslgNmKwUQFdKXbdPsmbNWyuSxrrYzFXcGEQW2pW/t5Kw9wATH526H1HJQU6acmvH1WEciSIgB/l4d8=
X-Received: by 2002:a17:906:a8d:b0:a6e:fccc:e4a with SMTP id
 a640c23a62f3a-a7245b4a3c3mr96498966b.0.1719137917974; Sun, 23 Jun 2024
 03:18:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240619080940.2690756-1-maobibo@loongson.cn> <20240619080940.2690756-5-maobibo@loongson.cn>
In-Reply-To: <20240619080940.2690756-5-maobibo@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sun, 23 Jun 2024 18:18:27 +0800
X-Gmail-Original-Message-ID: <CAAhV-H74raJ9eEWEHr=aN6LhVvNUyP6TLEDH006M6AnoE8tkPg@mail.gmail.com>
Message-ID: <CAAhV-H74raJ9eEWEHr=aN6LhVvNUyP6TLEDH006M6AnoE8tkPg@mail.gmail.com>
Subject: Re: [PATCH v2 4/6] LoongArch: KVM: Add memory barrier before update
 pmd entry
To: Bibo Mao <maobibo@loongson.cn>
Cc: Tianrui Zhao <zhaotianrui@loongson.cn>, WANG Xuerui <kernel@xen0n.name>, 
	Sean Christopherson <seanjc@google.com>, kvm@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Bibo,

On Wed, Jun 19, 2024 at 4:09=E2=80=AFPM Bibo Mao <maobibo@loongson.cn> wrot=
e:
>
> When updating pmd entry such as allocating new pmd page or splitting
> huge page into normal page, it is necessary to firstly update all pte
> entries, and then update pmd entry.
>
> It is weak order with LoongArch system, there will be problem if other
> vcpus sees pmd update firstly however pte is not updated. Here smp_wmb()
> is added to assure this.
Memory barriers should be in pairs in most cases. That means you may
lose smp_rmb() in another place.

Huacai

>
> Signed-off-by: Bibo Mao <maobibo@loongson.cn>
> ---
>  arch/loongarch/kvm/mmu.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/loongarch/kvm/mmu.c b/arch/loongarch/kvm/mmu.c
> index 1690828bd44b..7f04edfbe428 100644
> --- a/arch/loongarch/kvm/mmu.c
> +++ b/arch/loongarch/kvm/mmu.c
> @@ -163,6 +163,7 @@ static kvm_pte_t *kvm_populate_gpa(struct kvm *kvm,
>
>                         child =3D kvm_mmu_memory_cache_alloc(cache);
>                         _kvm_pte_init(child, ctx.invalid_ptes[ctx.level -=
 1]);
> +                       smp_wmb(); /* make pte visible before pmd */
>                         kvm_set_pte(entry, __pa(child));
>                 } else if (kvm_pte_huge(*entry)) {
>                         return entry;
> @@ -746,6 +747,7 @@ static kvm_pte_t *kvm_split_huge(struct kvm_vcpu *vcp=
u, kvm_pte_t *ptep, gfn_t g
>                 val +=3D PAGE_SIZE;
>         }
>
> +       smp_wmb();
>         /* The later kvm_flush_tlb_gpa() will flush hugepage tlb */
>         kvm_set_pte(ptep, __pa(child));
>
> --
> 2.39.3
>
