Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ED371684BD
	for <loongarch@lists.linux.dev>; Mon, 17 Jun 2024 14:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718635788; cv=none; b=r90/RvYkW7J83FCbKD53V3fN7dzkfCk6k39+hwtJ+0sCppFpd1ciV2fekZx0+1lEXIdeDx3um969mC4Pihbs3grivqQhREzIkaXrYpVcQmgo8s7sFDw5paxZ8UnJ5effLmDZ9gD5vpcayipYgqNAen06UJwxl1RjXJBsTe5IghM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718635788; c=relaxed/simple;
	bh=A1ObqteLnr4rsOexDfLBNOVS8Jb8YVaqD08pge4odro=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Ex9+Cs/V+D/JEPck7yYgCQ40vvcdNlX6RkHljGQ1Z3M6wDFXja4fKcHpgeEDxh7HW98ZlQgA7XOBTFzHdb1MwNjAaRHdpLi+Xe8zqQ8EbKS59/6eZlc3mAsSkA7/w7g5oU2ipMOLaQUmCbDFqjl+4Pm/eYtdFYL0P8DFaZhzxOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RwFlL6le; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RwFlL6le"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-1f682664703so57636205ad.1
        for <loongarch@lists.linux.dev>; Mon, 17 Jun 2024 07:49:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1718635786; x=1719240586; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=W+xAYhKOZltGRZcPSGvAJLT2O5rAH3PpppLSl+wsonY=;
        b=RwFlL6letMr0EEcBv0lo8pcBnMGCNRJ20mDZY47Br2HZqsxU4PqnNcvcq8QJb2KSEI
         JViukoN+AifVLSsAQ3kOwZjK4bejoJKwUf9fE1O3fG0RglhxmeI3+Ul3wjNy47meCb1w
         WyDAg8PVzXTwsVgmxpMa3oo/m2pWm1iv14CFTEIWqCDWshCjRrrwfEsj0z1XyMAwuDIM
         /6dhVG2AWwqOd08dgYq/+qTz2Sr42kAPSS67AxLVUpN+WpP62xtLqkya+2lG/fd5Rg9I
         29qt0QgVzpah2db3vBVnGHREuF5s4R1v18L9pNMJrcbBwFdf5Ag6VA8f26txlBdfbhL1
         8TUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718635786; x=1719240586;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W+xAYhKOZltGRZcPSGvAJLT2O5rAH3PpppLSl+wsonY=;
        b=KNj44NJj4PNV04+yl1iml7VcMdI7kOwgq9b9hRH5IVgr7OCLZV4D/D6Fz+jy3//D4I
         3FLA27cvMhXC1zZBKPG3IktxdPumOp2Wiw+8Zvpq3vV6T/CgCyfC0V9KKcP/FCWdrLdD
         KeuO9bXf0kusmQfvoj/p4X6fHpgdc2lm0Bs9hN9wB/zLiUmeDEofVO2nYjzZyihbnE08
         f/1XJnIxc4z1JiAfcDic6pAwy3fNAX9Bu/TxBVBCIgUSR3p4aQT8XiPzZL/tkLcfGIVw
         rjH55xxjDwJIv27i9ZLsyFRyxWEeXnpcGZnQHj2hNItuUnQikaikYpfrBQr0TiP3rx4m
         ueTg==
X-Forwarded-Encrypted: i=1; AJvYcCWFUfNivzFhHQ997bguTkaibY7aJQoTYncr3Q9U8nuKud6PnfG9kcNPs/bqMoJxAhzuX/IXZeBqOimbtxupaTwRvWodVwSLkB7e
X-Gm-Message-State: AOJu0Yze7RaLgUTU9mI98K7vauy3vcZq64j+KZdu9eYolox5WstavIyR
	8r/7lkN2V9rUPGJH58yRTILmsC2yyutMrhzTgJtKexYOWomTOH0hswcyqNQvmh9Cg1C4FNSmVJd
	tDg==
X-Google-Smtp-Source: AGHT+IEDL3RYLk4OeAsEDZAk7iTpL6KxgWNxcYgbSYbE6r72h4dXDgdaAGDiBFZLFIRvvkU38q9sG0Dlcoo=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:f98e:b0:1f3:2e40:579f with SMTP id
 d9443c01a7336-1f862a0d09bmr1636285ad.11.1718635786428; Mon, 17 Jun 2024
 07:49:46 -0700 (PDT)
Date: Mon, 17 Jun 2024 07:49:45 -0700
In-Reply-To: <20240615025930.1408266-1-maobibo@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240615025930.1408266-1-maobibo@loongson.cn>
Message-ID: <ZnBNCYZHuflw83jq@google.com>
Subject: Re: [PATCH] LoongArch: KVM: Delay secondary mmu tlb flush before
 guest entry
From: Sean Christopherson <seanjc@google.com>
To: Bibo Mao <maobibo@loongson.cn>
Cc: Tianrui Zhao <zhaotianrui@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	WANG Xuerui <kernel@xen0n.name>, kvm@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Sat, Jun 15, 2024, Bibo Mao wrote:
> diff --git a/arch/loongarch/include/asm/kvm_host.h b/arch/loongarch/include/asm/kvm_host.h
> index c87b6ea0ec47..98078e01dd55 100644
> --- a/arch/loongarch/include/asm/kvm_host.h
> +++ b/arch/loongarch/include/asm/kvm_host.h
> @@ -30,6 +30,7 @@
>  #define KVM_PRIVATE_MEM_SLOTS		0
>  
>  #define KVM_HALT_POLL_NS_DEFAULT	500000
> +#define KVM_REQ_TLB_FLUSH_GPA		KVM_ARCH_REQ(0)
>  
>  #define KVM_GUESTDBG_SW_BP_MASK		\
>  	(KVM_GUESTDBG_ENABLE | KVM_GUESTDBG_USE_SW_BP)
> @@ -190,6 +191,7 @@ struct kvm_vcpu_arch {
>  
>  	/* vcpu's vpid */
>  	u64 vpid;
> +	unsigned long flush_gpa;

Side topic, GPAs should really use "gpa_t" instead of "unsigned long", otherwise
32-bit kernels running on CPUs with 64-bit physical addresses will fail miserably
(which may or may not be a problem in practice for LoongArch).

> diff --git a/arch/loongarch/kvm/tlb.c b/arch/loongarch/kvm/tlb.c
> index 02535df6b51f..55f7f3621e38 100644
> --- a/arch/loongarch/kvm/tlb.c
> +++ b/arch/loongarch/kvm/tlb.c
> @@ -21,12 +21,9 @@ void kvm_flush_tlb_all(void)
>  	local_irq_restore(flags);
>  }
>  
> +/* Called with irq disabled */

Rather than add a comment, add:

	lockdep_assert_irqs_disabled()

in the function.

>  void kvm_flush_tlb_gpa(struct kvm_vcpu *vcpu, unsigned long gpa)
>  {
> -	unsigned long flags;
> -
> -	local_irq_save(flags);
>  	gpa &= (PAGE_MASK << 1);
>  	invtlb(INVTLB_GID_ADDR, read_csr_gstat() & CSR_GSTAT_GID, gpa);
> -	local_irq_restore(flags);
>  }
> diff --git a/arch/loongarch/kvm/vcpu.c b/arch/loongarch/kvm/vcpu.c
> index 9e8030d45129..ae9ae88c11db 100644
> --- a/arch/loongarch/kvm/vcpu.c
> +++ b/arch/loongarch/kvm/vcpu.c
> @@ -51,6 +51,16 @@ static int kvm_check_requests(struct kvm_vcpu *vcpu)
>  	return RESUME_GUEST;
>  }
>  
> +/* Check pending request with irq disabled */

Same thing here.
