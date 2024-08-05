Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EBF214F9F1
	for <loongarch@lists.linux.dev>; Mon,  5 Aug 2024 23:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722901986; cv=none; b=FA6rJo9uGdh0riv6RjfBO6TAZcfhYm7BrlL4srbaPutvwMcTyRI6qyHaS4m9mwbMm1fY1+EPaa5k7qjVmTuxNq/6HeOR6kxMGoA3jc461TcErwIw2ELOwh0YbnKOrMW4wkxzkr4RO8iev0U06VNoe4cKBL5gtyeBAW2vu5xUaoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722901986; c=relaxed/simple;
	bh=XE64EO9QsKUjNS+RxiZtVEDU63XJXco52ktIOyCusQg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=IfKtKcE2Qo2XBoE3tW+lVejtFw6txpGFR/ZiX1cmmUF8YN3KC9fhVijjsI7DFWmwmNi1YoTkYGEPMK46WwD1Xoiy25T31Q5CtJX/Kq45N9FKuC4OwRadZnkGQwVAIxXjehzswrJyuVJFlZy2oGmBdghCMD/OK7uMalE4d0YSep0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=T2pOljBt; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="T2pOljBt"
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-666010fb35cso5218267b3.0
        for <loongarch@lists.linux.dev>; Mon, 05 Aug 2024 16:53:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722901982; x=1723506782; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=8tNxfozveIy4KhK+t6BTSFuKqZ3CnwWBfLDeoqvVNkU=;
        b=T2pOljBtwUyz1Oo9FHySrT2DnYTzLDXNeZ8dbCiLQqL9bhcboYvIu4Rr/eAPDwpsgw
         B2mcAplYIXgYn8NxbW7fTrAJUpgRTjB0je0ZqbJB54jGPCqwAox92o9apSnaurEFBBJV
         Iizpe6c7DCVzRCw6zLfeEDf1PCexgqF0pTmBOo7mvxE33HE8+VyXis++tyEv2Aih6zV1
         CumRcH+4ayx9iUW0z+bD0WMBUkejvMiU0F6yyTpq+RTDz/+rA3yLsaUSUKCvdJ5hrMYo
         NX9gMHW7AMq48wgXNsnQaB7Y3h1SuOrGo3FaAdTDQD9xr4WVvlX84kqjYY6VWgkkaREx
         rBfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722901982; x=1723506782;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8tNxfozveIy4KhK+t6BTSFuKqZ3CnwWBfLDeoqvVNkU=;
        b=jq0MRNyN26cAab0tfGW2v9ppWRvnBCZsoKtG7WYFZ4+I5M/Y+UctPUZK13fsLZ2v1L
         3vv5Z2gle5JZR2tBUPtqiRuml85/LXSpeF0qq44iPW0VFwv+30jbOouCALqWc64x08tA
         /0QMJqwarDgjy4wP4R8TIFCcVpaw22D7pOb9T9WVE51b7xZfQ45jqF0t2G2Pk6BxJpeb
         6/al9vvdvD/YrhjzC5x/j76TC/EsF7bDm2lZxr2Rj5fNez5oksk4gquZTQL9wfBWwKBR
         PdjjqR1WaVSTBdIKiagzB0dsjdhOvcVM1uD1p9t2oWckMxxdSCzS8gOfZCDtZ1VKaiDa
         5oHQ==
X-Forwarded-Encrypted: i=1; AJvYcCVTWFMmKL8NgR8e4st41sY1npcEsuG1OSg5WBmeWq1JstxTF7zAMy8TA7cx5/ApQ2jdBGviDI35EacU3xeWnU201oJXnbZmeFcB
X-Gm-Message-State: AOJu0YzCHw4zL6HWgqrS4qp80EO2eauSGCFwAIPlFkd9VWBlOJ2aUF+c
	0ahRyy440XAKhJuW6MtD/jFJM0FLbyAskgdXxDoA7K6Rp5DzLSXiS7DwQ3TE+Z1LytaeErwYjss
	r6A==
X-Google-Smtp-Source: AGHT+IHjgF0Ca8ethUSfrozdkFUFp0o0AUPtEhLPgrNZWa8lbUZ7qZQp3Z7lR+cNHb6EVM2g/AygpE/k1/Q=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:690c:f16:b0:691:a38c:a61d with SMTP id
 00721157ae682-691a39bf26cmr3721507b3.3.1722901982364; Mon, 05 Aug 2024
 16:53:02 -0700 (PDT)
Date: Mon, 5 Aug 2024 16:53:01 -0700
In-Reply-To: <ZrFfvjy_-Tyx4xUV@linux.dev>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com> <20240726235234.228822-55-seanjc@google.com>
 <ZrFfgzRbiqT-Zi2O@linux.dev> <ZrFfvjy_-Tyx4xUV@linux.dev>
Message-ID: <ZrFl3faiGHQ5oLjf@google.com>
Subject: Re: [PATCH v12 54/84] KVM: arm64: Mark "struct page" pfns
 accessed/dirty before dropping mmu_lock
From: Sean Christopherson <seanjc@google.com>
To: Oliver Upton <oliver.upton@linux.dev>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	David Matlack <dmatlack@google.com>, David Stevens <stevensd@chromium.org>, 
	Fuad Tabba <tabba@google.com>
Content-Type: text/plain; charset="us-ascii"

On Mon, Aug 05, 2024, Oliver Upton wrote:
> > > ---
> > >  arch/arm64/kvm/mmu.c | 10 ++++++----
> > >  1 file changed, 6 insertions(+), 4 deletions(-)
> > > 
> > > diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> > > index 22ee37360c4e..ce13c3d884d5 100644
> > > --- a/arch/arm64/kvm/mmu.c
> > > +++ b/arch/arm64/kvm/mmu.c
> > > @@ -1685,15 +1685,17 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
> > >  	}
> > >  
> > >  out_unlock:
> > > +	if (writable && !ret)
> > > +		kvm_set_pfn_dirty(pfn);
> > 
> > I'm guessing you meant kvm_release_pfn_dirty() here, because this leaks
> > a reference.

Doh, I did indeed.  Alternatively, this could be:

	if (writable && !ret)
		kvm_set_pfn_dirty(pfn);

	kvm_release_pfn_clean(pfn);

It won't matter in the end, because this just becomes:

	kvm_release_faultin_page(kvm, page, !!ret, writable);

So I guess the question is if you prefer to make the switch to an if-else in this
path, or more implicitly in the conversion to kvm_release_faultin_page().

I made the same goof for RISC-V, perhaps to prove that I too can copy+paste arm64's
MMU code ;-)
