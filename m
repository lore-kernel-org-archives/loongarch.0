Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9838D17C9
	for <loongarch@lists.linux.dev>; Wed, 12 Jun 2024 01:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718155130; cv=none; b=OPoP/NoyOyksG32JsRlT9i+B0l0vDKXO63/upYHtpf/b8v4pWfZsgNX6JIAizBQ7ZqdiKByK6CEZ1hnHPvo1Bc3z5UAs/jxkVX3MyF+JMVvKkodC769PHNG7Ni3qJ8hb1+ydmnA2m7IUJEj/RoRUSaUMlpCINolRfavfb5FJ0JE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718155130; c=relaxed/simple;
	bh=NRQ5vxw0MkZ7yLnvDJPYGw9jB/h83t9zD3AKH0/y8IA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=HGlxpZu1wyDWF+s9r6dljviYOp0E85+3O5HYQaMXZFRZdPAuqorO2KjkEYkiKOM3ONkAVcsCrUehIQ2KjWb2Y72s3rSm+sxC+bDc6v+wMfHeNENjeLRu65W+HuTueoV7cYG2t8hbRlFvrKV7gzsLXNQyomUSDOy32Rd9MEgwKPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=m/Zqi2+k; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="m/Zqi2+k"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-1f6810e43e0so3092805ad.0
        for <loongarch@lists.linux.dev>; Tue, 11 Jun 2024 18:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1718155128; x=1718759928; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=gH/VrRThVAqNqdnAJ8qqfFFTLj74e8FaAJgriK6mdbo=;
        b=m/Zqi2+k7bLHuSlQ32NNPNLilxaves0nt2M8c5YAI0k15st7SzrQ2CukHedQvzsATE
         rE0P54E8k43sHSaD2vvvnfYo/DfDdAUL4Mps6m5t9SknqNEY5HW/HH3VYCfuoG4wTaAx
         f/XARRU2O2kUoBtLoGOjBPm9J5AnZwCut9DU//67DF1wC9/JU4a/6UIQb0VppUP0TAhF
         UzTOqxmVQYF3fq6CsBJHUayTWk5RFGCX6cXlggWQLK4WmT5DSNhuHD3hdMd9cUCyYOze
         XgjluVSrjavccHYBYQC1fn17sklyMhk7tYOlcmDj458/x/tY57HeD0haF3/Fm4sddYXx
         zuCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718155128; x=1718759928;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gH/VrRThVAqNqdnAJ8qqfFFTLj74e8FaAJgriK6mdbo=;
        b=FKbvWvuF3zZ37Mzdyso+FE3CsEa/OERl1VqiccX3BL9J8//R69kbPkVc7e9sx/vzW2
         qvhibUrk19/Fy9f7/6gW7kHjGPq2nzd/kO/ab0Yb01sIRT3vzFTVwIdzcuVTp7TUJss2
         oJZWdbcR4omKypL38kr12+8U2Ai5Jpp4nJ64RTEJoq1D0ayS0igb/cGYwF2jupbAOv5T
         1Cumlh2SQTY8KqvaEjDFGGxm3L+UADN/wu07OyLUuSrz4yfhoh4+bIbxcXFXLzn5ksnL
         DnAulVZPYkZvxrYNrbSZWfaBuLtdYDcnevAqLc3IWesIImY5aJmLO/fcRX0OomU8LoxI
         tkSw==
X-Forwarded-Encrypted: i=1; AJvYcCX+8V1Upq6/uCXmGL/5R+JCs5LTv5T9sp1KU2Ytj2BEqLlOLBajm60ZdGWVOxfEIeQLlugh2nGXSAB8Km+OwzC5edRRsnAwCK3H
X-Gm-Message-State: AOJu0YyIq1ZhSYmggOiX92y7X2ZWLfwlNc+pyQFKa/UcJTV2PwcHLAdx
	HRCot51pvzRm+obpGkTlzS0KnQ9X56TWNCIJ81cghoiQEAAzeA05xvi7/xgHYsixCHqHIbFPCqg
	DGw==
X-Google-Smtp-Source: AGHT+IFA7Nf2gM73IakGhMLgjpKn7tnJ0y7JJoAyUgWaeTxteQw7ecnDkGCPi06xyYh6rqY8tUOLbz5+Rl4=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:ce82:b0:1f7:516:4235 with SMTP id
 d9443c01a7336-1f83b1af087mr431195ad.6.1718155127840; Tue, 11 Jun 2024
 18:18:47 -0700 (PDT)
Date: Tue, 11 Jun 2024 18:18:27 -0700
In-Reply-To: <20240522014013.1672962-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240522014013.1672962-1-seanjc@google.com>
X-Mailer: git-send-email 2.45.2.505.gda0bf45e8d-goog
Message-ID: <171813751765.307375.7908491276602596005.b4-ty@google.com>
Subject: Re: [PATCH v2 0/6] KVM: Fold kvm_arch_sched_in() into kvm_arch_vcpu_load()
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Tue, 21 May 2024 18:40:07 -0700, Sean Christopherson wrote:
> Drop kvm_arch_sched_in() and instead add and use kvm_vcpu.scheduled_out
> to communicate to kvm_arch_vcpu_load() that the vCPU is being scheduling
> back in.
> 
> While fiddling with an idea for optimizing state management on AMD CPUs,
> I wanted to skip re-saving certain host state when a vCPU is scheduled back
> in, as the state (theoretically) shouldn't change for the task while it's
> scheduled out.  Actually doing that was annoying and unnecessarily brittle
> due to having a separate API for the kvm_sched_in() case (the state save
> needed to be in kvm_arch_vcpu_load() for the common path).
> 
> [...]

Applied to kvm-x86 generic, thanks!

[1/6] KVM: Add a flag to track if a loaded vCPU is scheduled out
      https://github.com/kvm-x86/linux/commit/d1ae567fb8b5
[2/6] KVM: VMX: Move PLE grow/shrink helpers above vmx_vcpu_load()
      https://github.com/kvm-x86/linux/commit/5d9c07febb86
[3/6] KVM: x86: Fold kvm_arch_sched_in() into kvm_arch_vcpu_load()
      https://github.com/kvm-x86/linux/commit/8fbb696a8f53
[4/6] KVM: Delete the now unused kvm_arch_sched_in()
      https://github.com/kvm-x86/linux/commit/2a27c4314007
[5/6] KVM: x86: Unconditionally set l1tf_flush_l1d during vCPU load
      https://github.com/kvm-x86/linux/commit/ef2e18ef3750
[6/6] KVM: x86: Drop now-superflous setting of l1tf_flush_l1d in vcpu_run()
      https://github.com/kvm-x86/linux/commit/3dee3b187499

--
https://github.com/kvm-x86/linux/tree/next
