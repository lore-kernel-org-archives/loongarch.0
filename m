Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 713394C84
	for <loongarch@lists.linux.dev>; Wed, 22 May 2024 01:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716342018; cv=none; b=upJuvP9tjhIOaJQzZXZuwUr9mi/glilLS/wb/lvsjG4vVBg+6qoMY67PAvXq0Ch3CqZp8GcwWSRqd+sA5QiMTIhpEnAHdCQfeB5C8C6CI8r4aQDhiu5wo65PjyxfnMn3tWOEA4+chfLtXvgqktRidlym6yMY27rDz9yFUnV4rRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716342018; c=relaxed/simple;
	bh=U8u9ZX67H1rnYv/prrk0VhN0vNHEl9qh4LwcmqvwAWs=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=fsqBkV1D+Zd5IM1HCZNoaKA2CNGvgymg8Mxr3sRiQprCP5hzJwGHmgrUjaUdXdmDOUwZQ1YMMHtQ41l8mus4aONwd4TcwNr6lqiO2nc6HkOuR7nQ4GloKr0uuSxM+kOa3ycYPtlN+ayPGZU7sRYssdtdZXEGQYcQ8ybXJfW5cqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jwmVoW8E; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jwmVoW8E"
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-dee902341c0so15031561276.3
        for <loongarch@lists.linux.dev>; Tue, 21 May 2024 18:40:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1716342016; x=1716946816; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zcj+niLGOsOBGFG/wxz5ssr64Z9mR+IM9s4JveywwVo=;
        b=jwmVoW8EA0tV6NLmsFFc6C+Yx/JcqaiwTaZZWCXqNi0Iycn5RDNt5K6SDZw7kNj6zU
         DDJa4h+fzjo7M+smzEjFr9k2ycb+nwDYw9HHGnZQBvp8TkxTZ/p4ej+GZc8UhYZpsZ9c
         BmLKMAh+8I0FpCYnvfSl9Lb/k8o/NlgCrfOOANzLE7k6YrqdRhZqwppQ6apKWhMa40TY
         YJdT2ao+tqDPoy2AqJRsooF5majxbsGobbb84qFIyUzg97mWS+5qpZvAwtYcDxGaQTt9
         1HvyUtcwYldkjtkcqoDGqj1cNNav2CTsNLq4JmeFX1jzZGmdHY57/lBQEhJHJ9EULdrQ
         8wDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716342016; x=1716946816;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zcj+niLGOsOBGFG/wxz5ssr64Z9mR+IM9s4JveywwVo=;
        b=CVekqAran1JWjbqCUolpAhCDcdJFTM/Uxh6xyVKPuv5FXpJCaCyi4klppVxJzCh1uo
         BZ6U3QbWHHAOOcd6gS/9Q+Xt5qzJ8ikIW6Z4OXvgIlQpyGBo1hsZQ6XUZbW6QiYsTpKP
         XPJQSZQu+yxinrWtrgYfM2XmE4Ws9OQNTPmsvttlVF2jbDogFjfmYVrydyx7n8oOxdWC
         jga05qXLJBITQyCbddPVopwhq7HHWMpuFT/E7YTcB3/3qdIX4nE/36eIIKBevwJHzOHm
         aNPJ7pqY+zOdwmW6nbuawCfURiUKPushcW06dXN042auh76cck5SNqh3Ff0IZ30c5UTP
         ZaLw==
X-Forwarded-Encrypted: i=1; AJvYcCUuSAUmR0tceWwLFtH9p0Dy3+E/A8MUR6/g3vwyGSwOwkBVEp1QIc/l/NE78nfm0ROLviIp+chi1mIxaUPG55VUk/1ixiF0d1Tz
X-Gm-Message-State: AOJu0Yy6yLAtTner8FR616qjHaQi8/yrvYaq1MVvg9fr9zKEp4TmB4X3
	tQ8b3amO145knnUurN2VDUP2PY44Hc/fG4b1APKY7GqTTFbg15WSQrZakRF3Qx9QRcKyUzI41Sm
	nnA==
X-Google-Smtp-Source: AGHT+IF8tl2Sd1O1Adb/DEG65NrlAsoUAahexLMaCbbpQeSeG4ZOBg+4u/hLB5lJUUIzwhVDdo9qeU1encA=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6902:20c1:b0:de5:3003:4b64 with SMTP id
 3f1490d57ef6-df4e0a80c05mr82582276.1.1716342016391; Tue, 21 May 2024 18:40:16
 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Tue, 21 May 2024 18:40:07 -0700
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.45.0.215.g3402c0e53f-goog
Message-ID: <20240522014013.1672962-1-seanjc@google.com>
Subject: [PATCH v2 0/6] KVM: Fold kvm_arch_sched_in() into kvm_arch_vcpu_load()
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Sean Christopherson <seanjc@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Drop kvm_arch_sched_in() and instead add and use kvm_vcpu.scheduled_out
to communicate to kvm_arch_vcpu_load() that the vCPU is being scheduling
back in.

While fiddling with an idea for optimizing state management on AMD CPUs,
I wanted to skip re-saving certain host state when a vCPU is scheduled back
in, as the state (theoretically) shouldn't change for the task while it's
scheduled out.  Actually doing that was annoying and unnecessarily brittle
due to having a separate API for the kvm_sched_in() case (the state save
needed to be in kvm_arch_vcpu_load() for the common path).

The other motivation for this is to avoid yet another arch hook, and more
arbitrary ordering, if there's a future need to hook kvm_sched_out() (we've
come close on the x86 side several times).  E.g. kvm_arch_vcpu_put() can
simply check kvm_vcpu.scheduled_out if it needs to something specific for
the vCPU being scheduled out.

v2:
 - Add scheduled_out flag instead of passing a bool to kvm_arch_vcpu_load().
   [Oliver]
 - Tack on patches to clean up x86's setting of l1tf_flush_l1d in
   kvm_arch_sched_load() (the code looked slightly less weird when the flag
   was being set by kvm_arch_sched_in()).

v1: https://lore.kernel.org/all/20240430193157.419425-1-seanjc@google.com

Sean Christopherson (6):
  KVM: Add a flag to track if a loaded vCPU is scheduled out
  KVM: VMX: Move PLE grow/shrink helpers above vmx_vcpu_load()
  KVM: x86: Fold kvm_arch_sched_in() into kvm_arch_vcpu_load()
  KVM: Delete the now unused kvm_arch_sched_in()
  KVM: x86: Unconditionally set l1tf_flush_l1d during vCPU load
  KVM: x86: Drop now-superflous setting of l1tf_flush_l1d in vcpu_run()

 arch/arm64/include/asm/kvm_host.h     |  1 -
 arch/loongarch/include/asm/kvm_host.h |  1 -
 arch/mips/include/asm/kvm_host.h      |  1 -
 arch/powerpc/include/asm/kvm_host.h   |  1 -
 arch/riscv/include/asm/kvm_host.h     |  1 -
 arch/s390/include/asm/kvm_host.h      |  1 -
 arch/x86/include/asm/kvm-x86-ops.h    |  1 -
 arch/x86/include/asm/kvm_host.h       |  2 -
 arch/x86/kvm/pmu.c                    |  6 +-
 arch/x86/kvm/svm/svm.c                | 11 +---
 arch/x86/kvm/vmx/main.c               |  2 -
 arch/x86/kvm/vmx/vmx.c                | 80 +++++++++++++--------------
 arch/x86/kvm/vmx/x86_ops.h            |  1 -
 arch/x86/kvm/x86.c                    | 22 +++-----
 include/linux/kvm_host.h              |  3 +-
 virt/kvm/kvm_main.c                   |  5 +-
 16 files changed, 59 insertions(+), 80 deletions(-)


base-commit: 4aad0b1893a141f114ba40ed509066f3c9bc24b0
-- 
2.45.0.215.g3402c0e53f-goog

