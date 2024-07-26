Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AABD1176AB3
	for <loongarch@lists.linux.dev>; Fri, 26 Jul 2024 23:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722038005; cv=none; b=ErwLEToSql8be0roF7VbK/e1aqGxgbTg/KOWZ57DrShBZR6mpBl5No3BZ8bWvr1QFvRzKQbeSQhIzBe7/Jt3QK2hXm1y8y7SsV+JyfuD0QbGGVdqEq8dstLIYXNPTSRcNE+fAamo4k6TMSpvAOKTG7DKbSlzHGH5p+PRoFEnVns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722038005; c=relaxed/simple;
	bh=Zgha2xAFcY7KucmW/flV9fGS6Q5hSOiwMmi0KjWZqtM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=JwDpoF3pq7hzC3KU336OTa5HJA5yY/nT1F4VlRDRpbhpcXEv6pwaJ7uPCbcH7QgKn/F4GD47Ar05GAM/yUmS3pFqV9rPPJkhbCUsX5w4d0Lgbj6SjW6RiFQBQBRX8Wm+GQnCLAoRQ3I1Fwcelh/6QlP96M7lYG9LOMOqRiyqsP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=17plIFqw; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="17plIFqw"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-70d2ab42082so1262551b3a.0
        for <loongarch@lists.linux.dev>; Fri, 26 Jul 2024 16:53:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722038003; x=1722642803; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=nY4qfmLxHYNbNwSwtMKIrsjqMbHvtDgV5qSHM3zuSO0=;
        b=17plIFqwoT2/zakWvifCnYIfTEQZUQrvVovozn1H6Xj8ZH7PT6Vk3ej82HToNMXllx
         9TbZLO7Al/7eXDxu2FnQqHKYC7uczVGdFtDDRNVMCeJLJYB7R7cISfM+RiBMZjU79saz
         7ivVNILXw/wu1gn1aGqrpEQnro00QJ8WZFFvnp/bNPtheCX/nmYkGpG6+PQB/8pxdYS9
         +KnZS07hmwHhdwWr/98zZcYpSMyhbuWs6kvC8B+eOxRIs7cbkcxsXevT7aUiUfp84VBe
         puIhe57ynKT6T2OmsTWlTqPHpERMlQOce/1JZgEYZ8EpED/D5nQ9tFlEi7XJnALbct3N
         urWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722038003; x=1722642803;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nY4qfmLxHYNbNwSwtMKIrsjqMbHvtDgV5qSHM3zuSO0=;
        b=GZnuxeQ87sNtF/cK0MpeYmY6MShr1OiMbqdVfqUmo1QLHts44VlDPn9glc/FOyF58i
         FLlVJOhzy8M3kkUtLkEOv5eQVZPOe66VX4GM8Q43D3rig4D9ke9R4MKphf+PmvUth6nY
         0T1Q6AFE8icmjEOXH6PIC7E0R6PhPznkkuyWEPwEkHj4oDFOyjIPTFWsVxBsMIm9bCdd
         S5IZAjX/TerDG2/OsfvDG45yWg+4Qm8Oj5RIC+de9ifLT2G6btdIiCAa27ZyCt15gmzy
         xNhAUxgw0QbkfN16dSFcSRhNmXsS4e51SZkSh7GPtzG/Nd6O6B3pZ3AjxjEMqlRV3n8V
         VWHw==
X-Forwarded-Encrypted: i=1; AJvYcCWVca7FHcYEW5xGshkp0P3sXGcpbibjGJSWNzGzAIS1dGsXrKjwfjryqy2ehsXLrNUuyIqsiZiDLp5DIuYCEHdQjISJ2P3/2762
X-Gm-Message-State: AOJu0Yyw3zlmZC1HWiejsdD8gj+B5GyPSzxiXLuIr4/GN0+KIemxCa1k
	H37eNsLzOO1Ftwx9kj7fp6wTw29cNXLAqfcl388JAZK4Rl8E6EbAKY2FV1lBVjSxicscpKMfGLa
	6ow==
X-Google-Smtp-Source: AGHT+IH3GR1gDSsaIiyxz/X29dplakZOpWNN6FppUWgXRDWsCZD6dFhJbJXFL2hO7f6rIpjA8QVwSQZzxjA=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6a00:6f1c:b0:70d:138a:bee8 with SMTP id
 d2e1a72fcca58-70ece533146mr8919b3a.0.1722038002674; Fri, 26 Jul 2024 16:53:22
 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 26 Jul 2024 16:51:31 -0700
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240726235234.228822-23-seanjc@google.com>
Subject: [PATCH v12 22/84] KVM: nVMX: Drop pointless msr_bitmap_map field from
 struct nested_vmx
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	David Matlack <dmatlack@google.com>, David Stevens <stevensd@chromium.org>
Content-Type: text/plain; charset="UTF-8"

Remove vcpu_vmx.msr_bitmap_map and instead use an on-stack structure in
the one function that uses the map, nested_vmx_prepare_msr_bitmap().

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/nested.c | 8 ++++----
 arch/x86/kvm/vmx/vmx.h    | 2 --
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/arch/x86/kvm/vmx/nested.c b/arch/x86/kvm/vmx/nested.c
index a34b49ea64b5..372d005e09e7 100644
--- a/arch/x86/kvm/vmx/nested.c
+++ b/arch/x86/kvm/vmx/nested.c
@@ -621,7 +621,7 @@ static inline bool nested_vmx_prepare_msr_bitmap(struct kvm_vcpu *vcpu,
 	int msr;
 	unsigned long *msr_bitmap_l1;
 	unsigned long *msr_bitmap_l0 = vmx->nested.vmcs02.msr_bitmap;
-	struct kvm_host_map *map = &vmx->nested.msr_bitmap_map;
+	struct kvm_host_map msr_bitmap_map;
 
 	/* Nothing to do if the MSR bitmap is not in use.  */
 	if (!cpu_has_vmx_msr_bitmap() ||
@@ -644,10 +644,10 @@ static inline bool nested_vmx_prepare_msr_bitmap(struct kvm_vcpu *vcpu,
 			return true;
 	}
 
-	if (kvm_vcpu_map(vcpu, gpa_to_gfn(vmcs12->msr_bitmap), map))
+	if (kvm_vcpu_map(vcpu, gpa_to_gfn(vmcs12->msr_bitmap), &msr_bitmap_map))
 		return false;
 
-	msr_bitmap_l1 = (unsigned long *)map->hva;
+	msr_bitmap_l1 = (unsigned long *)msr_bitmap_map.hva;
 
 	/*
 	 * To keep the control flow simple, pay eight 8-byte writes (sixteen
@@ -711,7 +711,7 @@ static inline bool nested_vmx_prepare_msr_bitmap(struct kvm_vcpu *vcpu,
 	nested_vmx_set_intercept_for_msr(vmx, msr_bitmap_l1, msr_bitmap_l0,
 					 MSR_IA32_FLUSH_CMD, MSR_TYPE_W);
 
-	kvm_vcpu_unmap(vcpu, &vmx->nested.msr_bitmap_map, false);
+	kvm_vcpu_unmap(vcpu, &msr_bitmap_map, false);
 
 	vmx->nested.force_msr_bitmap_recalc = false;
 
diff --git a/arch/x86/kvm/vmx/vmx.h b/arch/x86/kvm/vmx/vmx.h
index 42498fa63abb..889c6c42ee27 100644
--- a/arch/x86/kvm/vmx/vmx.h
+++ b/arch/x86/kvm/vmx/vmx.h
@@ -204,8 +204,6 @@ struct nested_vmx {
 	struct kvm_host_map virtual_apic_map;
 	struct kvm_host_map pi_desc_map;
 
-	struct kvm_host_map msr_bitmap_map;
-
 	struct pi_desc *pi_desc;
 	bool pi_pending;
 	u16 posted_intr_nv;
-- 
2.46.0.rc1.232.g9752f9e123-goog

