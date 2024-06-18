Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76169178377
	for <loongarch@lists.linux.dev>; Tue, 18 Jun 2024 21:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718746906; cv=none; b=DJ86lmc2PobpAFSAORWu3LE4fY+H6Rlhhx2z1+4QKXO1elmPA3NYOi7xS7NPISoPIs3DRFkVl7T5QaIGiOBpFsaWGIz0djiD2KNp7cqRm93QfgLvqj6SBWUpCsyXgBVLCmyYz5PTrWgkdJH009QumnEjubZ8l+E7tjvFI1RO+xs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718746906; c=relaxed/simple;
	bh=43VvnWy8bJ3u6vF+ooepWW/K9kvnbb1owJCIeyrqbls=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=tDkyMqY418PeV9w9gqTztrWgjqOPZezEDNjkvc4WKxBuXJtPwhVNbk+hfXt8NcXzcKqkPJJsXw2vdXbYCctEsdCYvF/1WxGe+hfy4aU8r/oJKjoxWBGM5iiLqNOQjBoY8pMPcZ4cd5qYAjQ2yRpTfvjHMQnhJXCMNl9H24K0mPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PNAF6SvK; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PNAF6SvK"
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-62fd1655e12so128271047b3.1
        for <loongarch@lists.linux.dev>; Tue, 18 Jun 2024 14:41:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1718746904; x=1719351704; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=hTMwIVse9Tqfg6lD3BDUhww1E0hJCsQTGAtbBvKYeBQ=;
        b=PNAF6SvKq2wRWQT/Q/axkJFSz0UfyYqp2vodJzV0r/uC+ex3+5f00t4ibUq/TNb60K
         54UEYlm8LTgzGWTiI0pZD6ytIWHA6XdHVSB32vOsoE1ZQBpVQE1p2tos6yEqnaqwJ7MW
         Ukq8g3/nmJ7LIHR48+JIqo4JokIt2ri/hSrnnPmagr65lpiypMs0xyHPTrjAfXZxpMgc
         t1qLci4iu4gr6zvJeGC5i5u4UtNzPuurMOCdxdGk00c7lQ3mcb49Blda+5Vm1P9DDExG
         JcnEWQ2mSo3lnpFN6F39r9C+EeL2b/XusuKCpZljX1IF5fi6K6vBj/4bpyWBXyoo5FBA
         1n4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718746904; x=1719351704;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hTMwIVse9Tqfg6lD3BDUhww1E0hJCsQTGAtbBvKYeBQ=;
        b=fI2AChUCtmWEbPePijQTGKP1zGvSt9a46ctvm0EShe1l3y81HMzlGznCISBjzF3PbW
         p02Ws/awQFhOly9GOMc3siERyVWIlOJ62ZLalG8L2HilfA7cUTA/cUl4ao6Yyk/zIipk
         jJ/17Q8xc0bXSBhLOONO5hEU4pVYMGbwYUPtR3nL1bj7oRgstNfZnDEjvLxw1mhyDmpR
         3x1Q6ryjBzQcbwdQC4uh+slfqM9LhXFa0UNIBHXQ2yjHYXa6p75Gc0XZtYNFpDxFU844
         UbxQsf76lHA4D/sHhLPbCOVPcTntLh16XHZYyyXPyQT+mTbgc4rDAzXc/hZF2QIel/w/
         znGw==
X-Forwarded-Encrypted: i=1; AJvYcCVvzhH8hHHZLRefIi1vD54x/37qdCuwwOh//NUQZHNza13LHPmQqz3cCXQ4eGT+Z5reWP98MPCuFPIATfsx3CITuG2OKPKjY79Z
X-Gm-Message-State: AOJu0Yz3vAnhY2GZtYZd/5UhBfnkImCfP9zpyDX0I3rBIG6zVZEtKB+8
	eMPZXl2g7W+d+JMegzio+p4oXkyqE4bihYwGUfArX7YTeWEy7GalPXXtKTLDgo1ynUsUhegnv/e
	ZZg==
X-Google-Smtp-Source: AGHT+IEl94B6cPOfd/EKE0+8juuGqXNbimkkhvSQIWkIC7nhtL6RuCNxJoDH3on4HivHNvWvDQFbNJTKAmY=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6902:1003:b0:e02:bd4f:def2 with SMTP id
 3f1490d57ef6-e02be20b2ccmr339129276.11.1718746904451; Tue, 18 Jun 2024
 14:41:44 -0700 (PDT)
Date: Tue, 18 Jun 2024 14:41:24 -0700
In-Reply-To: <20240503181734.1467938-1-dmatlack@google.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240503181734.1467938-1-dmatlack@google.com>
X-Mailer: git-send-email 2.45.2.627.g7a2c4fd464-goog
Message-ID: <171874683295.1901599.10170158200177384059.b4-ty@google.com>
Subject: Re: [PATCH v3 0/3] KVM: Set vcpu->preempted/ready iff scheduled out
 while running
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	David Matlack <dmatlack@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	James Morse <james.morse@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, David Hildenbrand <david@redhat.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="utf-8"

On Fri, 03 May 2024 11:17:31 -0700, David Matlack wrote:
> This series changes KVM to mark a vCPU as preempted/ready if-and-only-if
> it's scheduled out while running. i.e. Do not mark a vCPU
> preempted/ready if it's scheduled out during a non-KVM_RUN ioctl() or
> when userspace is doing KVM_RUN with immediate_exit=true.
> 
> This is a logical extension of commit 54aa83c90198 ("KVM: x86: do not
> set st->preempted when going back to user space"), which  stopped
> marking a vCPU as preempted when returning to userspace. But if userspace
> invokes a KVM vCPU ioctl() that gets preempted, the vCPU will be marked
> preempted/ready. This is arguably incorrect behavior since the vCPU was
> not actually preempted while the guest was running, it was preempted
> while doing something on behalf of userspace.
> 
> [...]

Applied to kvm-x86 generic, with minor changelog tweaks (me thinks you've been
away from upstream too long ;-) ).  Thanks!

[1/3] KVM: Introduce vcpu->wants_to_run
      https://github.com/kvm-x86/linux/commit/a6816314af57
[2/3] KVM: Ensure new code that references immediate_exit gets extra scrutiny
      https://github.com/kvm-x86/linux/commit/4b23e0c199b2
[3/3] KVM: Mark a vCPU as preempted/ready iff it's scheduled out while running
      https://github.com/kvm-x86/linux/commit/118964562969

--
https://github.com/kvm-x86/linux/tree/next
