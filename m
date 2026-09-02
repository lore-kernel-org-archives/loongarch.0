Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AEFD387375
	for <loongarch@lists.linux.dev>; Wed,  2 Sep 2026 18:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788372323; cv=none; b=KZwTxYEG5II0PGD/ghG2YgzQxdPS5wSQQEzG81Nz4mVEuuSC1sZBYFcdrHVslqvDLao69UUqostfm2IAXiC8ADMkYxJoly4fmgeLlGeiq+c4+KubvrF/xxQT5/BqcdebIss0NRsNM2e4BDbWY2vxBSE8PjC0GCv6f+kKl7ZFRf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788372323; c=relaxed/simple;
	bh=YdqSsfXweYukjRzVRqCbG8U6cCS12JCA8Eln1yuWlpg=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References:
	 MIME-Version:Content-Type; b=BEz7eN7EGYnvfsePdkOF41VM3QIeWFlyJ8ZZmjDmzO3ExLzYDDQ/F8GJcwUCywkPpDjUhdHH9ufsPCTj+hecPbzvHuAI0jVlMPduDXGNmCb/6sEuK6oDvrXfxlD9OxMK72tPR7nl6+i5+JuoUuWTm3p7Xdzde1kCExmHRI+hQHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rY+5mQ0j; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rY+5mQ0j"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-38ea87caafeso1373378a91.3
        for <loongarch@lists.linux.dev>; Wed, 02 Sep 2026 11:05:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788372321; x=1788977121; darn=lists.linux.dev;
        h=content-type:mime-version:references:message-id:date:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mIy9w1/7l+YPH2gFOr27PV6p4ska6UcSUlBoAUwTOLk=;
        b=rY+5mQ0jlYK6f5WIBAwuYl6INY72Y39kJcofql/tmBsiiLpXtElagE5iPp5y6iLkpH
         JDoCuuLg1wpI+ZCOpVlUjvKbIWyH3Hu5m1RRugaEPz2tdiLw4YOmLhf8RBq+6fM2u2N5
         yUjnbH+o+X8QZP6KmnKkkBjc8JR4mSSJU7uepbuInUjJA3MNKSBRHZrJkiniXIb7EQc2
         9p75b1phJnTGnX+xaMqb9q+bsyyiHJ/+oyhR+m7Ia/q4U2lVI+JwUqbahKEb5eeXJyUP
         UaJHTDrZ0Gz2jA39cFWXH471e/qSfViCPsJgOk301rR/ML+Cgv2vMXR5lZFhejnYqX33
         W2RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788372321; x=1788977121;
        h=content-type:mime-version:references:message-id:date:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mIy9w1/7l+YPH2gFOr27PV6p4ska6UcSUlBoAUwTOLk=;
        b=tMy6gtvKGY4R9RbG/EEGjOTN/6FFEZZwGPrEysEPY+h1yjaV0nlh9ZSFmZWImHYDT7
         Nh9RcmfbcJ2gY9IStjZOg9hf11ZYKhZFIiC7u/pi6S1jFg5UJQozadBW6/JyVup5eD37
         bFYcsogICq8rohIotPVCcz51qQ+2q3LNf3uf3fUFJ6sTGeYfoKgZtfnVTFItF35DcUAL
         buYjtJh7mb/A8EeIzjsRx8x5N3JOaM0vzNW53dIccz9eUtGhbBPFJYWkejzeaU7J7N/W
         5YS1zX86+vR0WXcn6YxTwyspj26EDpbGgT+PjOOvg1TlQLr7K4qTeevqRjmdpSEmClg3
         88Zw==
X-Forwarded-Encrypted: i=1; AKwUvBxtxc2EQXvTig7dRyNJwRop/5Zx0nbsnQTh36CwTfe0S9DLj4HMJ6zUcuWYG6/rBR0qyN2yyA0R3Nc=@lists.linux.dev
X-Gm-Message-State: AFuF++mCi+yfAQvmlNnpmNmrn637DVo7BEIGrwKe+fgkzTEIFXJzzp8M
	X5Yy+R2pPSGPNqyfE1z3MQUDk+IxmmX8Dnaj2zw5LmCObVuuSeQYy7fs
X-Gm-Gg: AYBFou0K6exGBhQM7jTKTnCzmAjnMcm6C/WUsLRwUBSFiM69mvjUduKRb4LkjO3LXkb
	quXaUfkDoFQrKVda2tvZ1zhRMApCnTvWFqzfznhPvSn8+XRKJOWNT2r9ywl3oJKLMZ0LCPWQhS8
	lxI03WAQdd6R8ML07Lcw68GHkQyrXcgVEZux6LewADrijvwNII8DoswWxlQTlvWs9yRUT59A945
	q22RzsS8n9dkI0NysJvyDgeHXb5+KmHx7ncAjmEGWE0MSq2loIVp2b/+OcC8Hzxs+ZBfPixo89s
	0kN7kpnnkaNFWZRiqVWfOeJCEYp0RJMV7F9G94OQB7fFXTWtsp2Lv7OKk+rwxTGsVxKuSwGiXp6
	ZD+tQu+Tp8Ygf80rNyPbDzZkQESNbsClfkBOPo1R7/khQi/+bO8fD4jMswvi5z9hgAkn/zDyNac
	XiDRqeqAlXDfoNw/n2wNaiABpdDYi61+qRvbsI6L8oSWZENxYNL64H4v1TIiu46hSM//hCYau/q
	iQ9y2DGFMkrl4yJWP3rByfQps9XS43WEwgA36r8/Gv7
X-Received: by 2002:a17:90b:4b89:b0:398:c3ca:1ebc with SMTP id 98e67ed59e1d1-39aee105a46mr9138561a91.18.1788372321290;
        Wed, 02 Sep 2026 11:05:21 -0700 (PDT)
Received: from pve-server ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32f07b79cf9sm9808273eec.18.2026.09.02.11.05.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 11:05:20 -0700 (PDT)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Sean Christopherson <seanjc@google.com>, Gautam Menghani <gautam@linux.ibm.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Fuad Tabba <fuad.tabba@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Atish Patra <atish.patra@linux.dev>, Alexandre Ghiti <alex@ghiti.fr>, 
	David Hildenbrand <david@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm@vger.kernel.org, loongarch@lists.linux.dev, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, 
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 00/20] KVM: selftests: PPC pre-enabling
In-Reply-To: <aphioo_KTboUCtZd@google.com>
Date: Wed, 02 Sep 2026 23:29:06 +0530
Message-ID: <h5k7ttzp.ritesh.list@gmail.com>
References: <20260826230511.972824-1-seanjc@google.com> <aphhKDm7Vx7G5ivr@Gautams-MacBook-Pro.local> <aphioo_KTboUCtZd@google.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Sean Christopherson <seanjc@google.com> writes:

> On Wed, Sep 02, 2026, Gautam Menghani wrote:
>> 
>> + linuxppc-dev
>
> Ah, shoot, I *just* posted v2.  I'll add linuxppc-dev to that cover letter.
>
> https://lore.kernel.org/all/20260902164123.2546762-1-seanjc@google.com

Thanks Sean for sharing these changes.

Thought of sharing an interim update:
I have rebased PPC KVM selftests support on top of this series and the
initial tests ran fine. I am currently looking info few findings though
- but will soon rebase those changes on top of your v2, review that &
update the results.


-ritesh

