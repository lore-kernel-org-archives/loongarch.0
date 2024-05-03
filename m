Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB63F1586FE
	for <loongarch@lists.linux.dev>; Fri,  3 May 2024 18:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714760261; cv=none; b=rHTmiv7qYQaGV8f3STPWrjTkijs2/l8x0oB+Dg0vA4fgd0KSpCaab0SXIS7RtPWiR0gjdPMXhc+RNoLOih1movpN9STZj746nmqcjoVEtPVC8XsoNdevMwLU3zXWn9gTlxOnXa7Mx+Ai+he1SY9Bn845mtW3iJXMC5Gm8s17Kio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714760261; c=relaxed/simple;
	bh=xBGFTYdyUOnHArOcW3JXAxjXjjvPLqJKxAY8xK+n/W4=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=dlNLJe64OqSynX93MWI1Pgnddn2QjZXSEl+N1DL42IR9DPEAG/IAycENHYXiMU3sOcfqy8LcR7ZCSrGVqEalv0SYZQwnV6+uqoA96eGILHr5FMjh3VoZb/FJRe0kGBZURmqgncBnj7BimCnPSh0xG+b9Gq6X8LZdxnUJg+JHsHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=M8zYmgK7; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="M8zYmgK7"
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-61bea0c36bbso90160177b3.2
        for <loongarch@lists.linux.dev>; Fri, 03 May 2024 11:17:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1714760258; x=1715365058; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=u5lOataUl4CqNIE0BOfGoSKjtAnehJHFOaimjTGPj/Y=;
        b=M8zYmgK7H8ZR3tH/Pd0Tnc+JzKUQ97DEi0kb5Q37krknML7LsvxpO09KYlhFcH1JBQ
         PQn7Vr3FXexo0V77a0UvJCCF2NZK46J9a7bpZM75TtIqnPh/SvN+OsOOVAypwGQMT02C
         flyZYr8KREbaUxACYLCvIVHDuzLczTf+H2glW8opNT0nTRUBEUExW3uiYKuODiSIIlgY
         C1YVt6fpiQ1qht2IeX78zhMPFpBZ9Q/h1rwXN126ynnPbi4zNrNcQrRBzf4SUi/xNcvW
         OlpCffX3eoYPft7m6p9/aYnJWaO/r4ZmOYBGLYC8SqkUI/M0T1UFNTeMdV8bfdCAT6TJ
         Smcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714760258; x=1715365058;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=u5lOataUl4CqNIE0BOfGoSKjtAnehJHFOaimjTGPj/Y=;
        b=RBjCc2p50NVu6vad8/l75AIQIXrv3P1LqdDSr8J/NZM5xlEKYY2vwZ26UcbkE+klRc
         2l8haPt18WJ1rM8eggJJ2mKpErO5AG4VhdG8+9mFd859urRTilUZIc9Aag9lefzWlxSu
         f5x8ik0UrMin85JJGj37b4YVMDLlbJKgRZ6v0MOZuOGHuooFo241CSif5VTFrS75T1sx
         G6JOvBGUMD9/zsvVmyOMCXnPKFlAb0V7SrJtDdvUU2Excw8cUaUKRvXCnA9cmfL5fS8l
         niIQLbxJEjDkuKbZn5bGEs4NVJIuZK7/S91lgXHdptIv6qcsh6QVpwhspCXVFsVgJd9n
         0f4A==
X-Forwarded-Encrypted: i=1; AJvYcCWk1Lw2lXOGQGgvrhDgKKbg9whFG9UCyvNavyCIP8ys3YhqYzRAKeTmMfmVIJuPU3vo2iqTxw7yQXVuBJquwf+wYsDJZuPWOe2O
X-Gm-Message-State: AOJu0Yys6YgMt9QO9jX1ZR4jyhY+UGeX8r7DjFH3myvi8xzN2yicDtQn
	u5nBJ5cvclpAZSkQ/GBaxp7nIlXk3ONOTyDvLa1Gw6/maImNlBtJ3tpC7Y2V3ViR76vVeX2FUSI
	w1M2kGXe7yg==
X-Google-Smtp-Source: AGHT+IGi/6BGSqLUvb7wYnWHXOlhd9obpauunW/BcufWuEVmkE7H211A4Dm9y03t3pfp70UoCYU1Se1aO50snA==
X-Received: from dmatlack-n2d-128.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1309])
 (user=dmatlack job=sendgmr) by 2002:a05:6902:729:b0:dcc:c57c:8873 with SMTP
 id l9-20020a056902072900b00dccc57c8873mr1104781ybt.9.1714760258668; Fri, 03
 May 2024 11:17:38 -0700 (PDT)
Date: Fri,  3 May 2024 11:17:31 -0700
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.45.0.rc1.225.g2a3ae87e7f-goog
Message-ID: <20240503181734.1467938-1-dmatlack@google.com>
Subject: [PATCH v3 0/3] KVM: Set vcpu->preempted/ready iff scheduled out while running
From: David Matlack <dmatlack@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	James Morse <james.morse@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, David Hildenbrand <david@redhat.com>, 
	Sean Christopherson <seanjc@google.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	David Matlack <dmatlack@google.com>
Content-Type: text/plain; charset="UTF-8"

This series changes KVM to mark a vCPU as preempted/ready if-and-only-if
it's scheduled out while running. i.e. Do not mark a vCPU
preempted/ready if it's scheduled out during a non-KVM_RUN ioctl() or
when userspace is doing KVM_RUN with immediate_exit=true.

This is a logical extension of commit 54aa83c90198 ("KVM: x86: do not
set st->preempted when going back to user space"), which  stopped
marking a vCPU as preempted when returning to userspace. But if userspace
invokes a KVM vCPU ioctl() that gets preempted, the vCPU will be marked
preempted/ready. This is arguably incorrect behavior since the vCPU was
not actually preempted while the guest was running, it was preempted
while doing something on behalf of userspace.

In practice, this avoids KVM dirtying guest memory via the steal time
page after userspace has paused vCPUs, e.g. for Live Migration, which
allows userspace to collect the final dirty bitmap before or in parallel
with saving vCPU state without having to worry about saving vCPU state
triggering writes to guest memory.

Patch 1 introduces vcpu->wants_to_run to allow KVM to detect when a vCPU
is in its core run loop.

Patch 2 renames immediated_exit to immediated_exit__unsafe within KVM to
ensure that any new references get extra scrutiny.

Patch 3 perform leverages vcpu->wants_to_run to contrain when
vcpu->preempted and vcpu->ready are set.

v3:
 - Use READ_ONCE() to read immediate_exit [Sean]
 - Replace use of immediate_exit with !wants_to_run to avoid TOCTOU [Sean]
 - Hide/Rename immediate_exit in KVM to harden against TOCTOU bugs [Sean]

v2: https://lore.kernel.org/kvm/20240307163541.92138-1-dmatlack@google.com/
 - Drop Google-specific "PRODKERNEL: " shortlog prefix [me]

v1: https://lore.kernel.org/kvm/20231218185850.1659570-1-dmatlack@google.com/

David Matlack (3):
  KVM: Introduce vcpu->wants_to_run
  KVM: Ensure new code that references immediate_exit gets extra
    scrutiny
  KVM: Mark a vCPU as preempted/ready iff it's scheduled out while
    running

 arch/arm64/kvm/arm.c       |  2 +-
 arch/loongarch/kvm/vcpu.c  |  2 +-
 arch/mips/kvm/mips.c       |  2 +-
 arch/powerpc/kvm/powerpc.c |  2 +-
 arch/riscv/kvm/vcpu.c      |  2 +-
 arch/s390/kvm/kvm-s390.c   |  2 +-
 arch/x86/kvm/x86.c         |  4 ++--
 include/linux/kvm_host.h   |  1 +
 include/uapi/linux/kvm.h   | 15 ++++++++++++++-
 virt/kvm/kvm_main.c        |  5 ++++-
 10 files changed, 27 insertions(+), 10 deletions(-)


base-commit: 296655d9bf272cfdd9d2211d099bcb8a61b93037
-- 
2.45.0.rc1.225.g2a3ae87e7f-goog

