Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B0C71C68B5
	for <loongarch@lists.linux.dev>; Wed, 29 May 2024 21:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717019750; cv=none; b=FOkb49E0xn98wjM2GMNbDyj4m7/kkGK4xAwOfPuyZH/lmG9zbcub8zWZDktkbAGUG0fUG6BJoQGH2Y7j18RMQUCUplFWR1w14EHu8HlYs4184bA0D1MoFX+qXr0bgIhChd+5XWYsqo89kDpGWZTejjDrXW3R+AxZDPs4MgncqM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717019750; c=relaxed/simple;
	bh=UNxJLMGZl1gnRZO6sW+znZ/L8AD9EkiPEE3WJ3MdUgk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Spz1CJMydRLAbREuG8QYLGXF5EBASqSmF8HKi3A65cKp2VSbWhkajb2xGDZPmLCvl0mubv7+jsnGVttoKwkXzLvWO0Zx6AhcBiVzh7Nu9ZU5IuTwLl8htJa/a+jpLU3QW0hYtmazGe8cIHEcbvVtVehkKDo+d/VtPv+xCLlNuL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pJth+Kmp; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pJth+Kmp"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-66348aafadcso214485a12.1
        for <loongarch@lists.linux.dev>; Wed, 29 May 2024 14:55:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717019749; x=1717624549; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=R0O8RdWVLc2UjPDSDGViR160MauFo82inRxl7GpP6bk=;
        b=pJth+Kmp9Tp18EHtlFFtj9Vg26ksnJp8UWVXGmqWTLNvuZRJ9Vrvh/SNyg7nZvlV7t
         xSxrLkORn7xB9zGOXTbk05++t7LE9++KvgMYLW+dPndLFo4kJC98GkmC8taUhIlXn8WB
         zrmiwhLz2Quk5twwSmd7I2Pp7hLZ2mENf8JGH9lRa/ciby1HyOFPbVB4q3gMHvzIgRyk
         4C5DpVMLcAnT74O2Dh+3KGjUweXOG6Ry9aQJ/9NDr2RlLwUfvnfC+iCMWcGchrOHHSe3
         HAMBdlTfEJuedtbrhnDu4p82mvazx4zppgNiZZYzXDFRqSO3jD+DZCKfAK20tXHqKWCI
         a7mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717019749; x=1717624549;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R0O8RdWVLc2UjPDSDGViR160MauFo82inRxl7GpP6bk=;
        b=ELc8F7l6do7U7FD4ty+Kkv+0dMVHVl7TiNEBi5Yv5ojWy9MASbpWLu8WBVK/jgoaIE
         mR6w25njVS0cyv5IPgF5UrQEsOhyzkjJdiNVj+Ebbd5yPNb10uQQc//J1rDPYk44A9dx
         Ym0+Eg3qliTY8ckImvKj/tKG2IVOAtvn5P0+3a+y0Fpu1cTsdh04fy3UIVb/r3/k5n2q
         z2cv/YFYhP+t8IFRw59IDAmEHKxW2m2UO/KJeOdcgrEA/mo0e0RvXyEM4HLyS+1NBPdG
         4w4TJEq04PGQ5TLdhFeFXjW0Rr/7mQ9drd/SoZdS7t+Yb1z6Sbj3M8IN1AxUDCUJBGmx
         05uA==
X-Forwarded-Encrypted: i=1; AJvYcCUnXUu4dR8FTkI/3QP62BEAsTn9zD8q8cjuSkZ+nq1jhqUErNBikVeL0unyByp4GKHwhA71TLdH9jxrrfiFqfmeucH9Cmg8PHLB
X-Gm-Message-State: AOJu0Yyvkq/be5DiGecYYqwIRhiN6D3jSKoHe/80T4OjRehTGgRGze92
	ya/WP3bS99WZsDTtGHbqvKx5Qd23IXVcrb/A6DLxaGwNmzXXeZ2dsrsYqfLjBnCwZHig2y6yiGr
	/lQ==
X-Google-Smtp-Source: AGHT+IGx3SrykKCWRo4963j21qgI5u7l1D5l4vFz5cSTor42JO4rQICXW/WPSO9JICYG6TRZvTrpM8pyR8k=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6a02:308:b0:65c:f515:1590 with SMTP id
 41be03b00d2f7-6bfdaf2b2f6mr480a12.11.1717019747924; Wed, 29 May 2024 14:55:47
 -0700 (PDT)
Date: Wed, 29 May 2024 14:55:46 -0700
In-Reply-To: <20240529180510.2295118-5-jthoughton@google.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240529180510.2295118-1-jthoughton@google.com> <20240529180510.2295118-5-jthoughton@google.com>
Message-ID: <ZlekYljG7KJwblUj@google.com>
Subject: Re: [PATCH v4 4/7] KVM: Move MMU lock acquisition for
 test/clear_young to architecture
From: Sean Christopherson <seanjc@google.com>
To: James Houghton <jthoughton@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Ankit Agrawal <ankita@nvidia.com>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Bibo Mao <maobibo@loongson.cn>, 
	Catalin Marinas <catalin.marinas@arm.com>, David Matlack <dmatlack@google.com>, 
	David Rientjes <rientjes@google.com>, Huacai Chen <chenhuacai@kernel.org>, 
	James Morse <james.morse@arm.com>, Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Oliver Upton <oliver.upton@linux.dev>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Raghavendra Rao Ananta <rananta@google.com>, 
	Ryan Roberts <ryan.roberts@arm.com>, Shaoqin Huang <shahuang@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Will Deacon <will@kernel.org>, Yu Zhao <yuzhao@google.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-mm@kvack.org, linux-riscv@lists.infradead.org, 
	linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev
Content-Type: text/plain; charset="us-ascii"

On Wed, May 29, 2024, James Houghton wrote:
> For implementation mmu_notifier_{test,clear}_young, the KVM memslot
> walker used to take the MMU lock for us. Now make the architectures
> take it themselves.

Hmm, *forcing* architectures to take mmu_lock is a step backwards.  Rather than
add all of this churn, what about adding CONFIG_KVM_MMU_NOTIFIER_LOCKLESS, e.g.

static __always_inline int kvm_handle_hva_range_no_flush(struct mmu_notifier *mn,
							 unsigned long start,
							 unsigned long end,
							 gfn_handler_t handler)
{
	struct kvm *kvm = mmu_notifier_to_kvm(mn);
	const struct kvm_mmu_notifier_range range = {
		.start		= start,
		.end		= end,
		.handler	= handler,
		.on_lock	= (void *)kvm_null_fn,
		.flush_on_ret	= false,
		.may_block	= false,
		.lockless	= IS_ENABLED(CONFIG_KVM_MMU_NOTIFIER_LOCKLESS),
	};

	return __kvm_handle_hva_range(kvm, &range).ret;
}
