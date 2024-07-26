Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE6C5188CBA
	for <loongarch@lists.linux.dev>; Fri, 26 Jul 2024 23:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722038085; cv=none; b=pCE7T5rRDTkO2zjn3wpd5FdcWkggj56l4nH6CWWi1JzKVSgrw+yT+SqCYvGZ+Rol7dTrEaPrMIFtASdQeCrwJuDbvOmuRwJojQrodcmOEHLQ9/p93DMEvRwc+TrFq6wjYjEJfh0DPXwVuGzpfWfgI2lv1QvnM8Swu2OF8gjrZLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722038085; c=relaxed/simple;
	bh=cf98YpKAzSnKSydcfMP082/xfk70ScQmPGu4ud3+tiY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=IRY+OYt311lZvco0HwxOfPWC2nxSQrZKp7jX4fe5b1oo4F8oGibRK+TTcZb3hseXwoZw8wTdX2+r0wqpPkETDMbajZMhRcofSyMe5hGdAkC26t6xxMH14mv+/tsWR/ED2856e4bQfujsRNVipoXBRhCJ+/FeNTU7sGNtRDCRH6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PRqQD76D; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PRqQD76D"
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-e02a4de4f4eso434382276.1
        for <loongarch@lists.linux.dev>; Fri, 26 Jul 2024 16:54:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722038083; x=1722642883; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=6xYXr8Us14FXXKODtWRB0Ht9lxWZb28t4tAXkZ5fXOk=;
        b=PRqQD76D6blWHarpN7TKFrPtPY07fFwV8/tus8pWrf5hhVuN8GGQ/EujA9bbFH/3Uj
         PraWJ7hYARpvz0bH39UOb8UIAqBkwFO/8Ri0scL01K//3UqgsVDAqYyUiPCujuJPx7uF
         35z9rZFwpNnZYDAn4GFCjxgzTQuBq5fxSZOAzVu6xJcdMB3+3PO9ReuTV8CDprmaJqvP
         e/y5oDM8jos097hm21nVmUOVIz6EoncNHGY4G5SwWApJbyjFEUu89BxXyFZNH8sJ1TWG
         TfFEUYEvDNXoApwD6qejbpGwJqGhRtfaqYnYEaVvsvH2ceMR8Mp+GyfsqA4surf+56EW
         C/QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722038083; x=1722642883;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6xYXr8Us14FXXKODtWRB0Ht9lxWZb28t4tAXkZ5fXOk=;
        b=VXh3fSepBRb6PJGKMNCmSEdRcWvf/02vq93ZGy5mZQiJ0+ky0357Q/cWntavy8grMK
         EqkfXoZgatrXZHum6na6UMyRUlsoUliMxAF4J24PSa5nXrc7amQ2zXW5gr36Jv8vK6Jn
         zoEd5/f6vf7uHhWDJW/7ZOwvxfyYEIM335a5OnV81a45OzHYo5cgxE4GVXth5Iq/Joc8
         nzGsewlx9DSPwzFwCU/Mk8zxW22pQxHeMRUVEciou/lc0OEHy55+G9LgffT93s9Sbhbs
         3N2SmnK13eRYegZVUyyJpv2Ut7ELVoxIiF+zx9pJEhy6apLbFRDQESTvWIJme/iXEgtT
         YsZg==
X-Forwarded-Encrypted: i=1; AJvYcCUbUTgobpxSyP5l1BTlWGDsRZ/SC32KUuGrVSWQwC+Ze+UpHJIYl21cJZwd+bvIQ89JbSsAN+IoFgKo91GOcorkulsNA95B9vie
X-Gm-Message-State: AOJu0Ywblic6D8fDri2/r1Pw+Y7CdTG6mUUx+SjVZqlRHNU8m+277j+3
	k5SCIQQS78D0w27bxjh0lEs2TvT7/sO59NKMoXPf9AHF3ASulLG4/zWrTWlS5t5Ae7flAaSoDen
	LqQ==
X-Google-Smtp-Source: AGHT+IE8wacjAGm1xSlUK/1K8X0GxeW+L1fXTQ/Y1AQI/5HhDGzzQTYAcJk3V2f1As7zQmLQNuyAyAYHMio=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:8c02:0:b0:e05:f1ad:a139 with SMTP id
 3f1490d57ef6-e0b545c6203mr2068276.11.1722038082801; Fri, 26 Jul 2024 16:54:42
 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 26 Jul 2024 16:52:09 -0700
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240726235234.228822-61-seanjc@google.com>
Subject: [PATCH v12 60/84] KVM: PPC: Use __kvm_faultin_pfn() to handle page
 faults on Book3s Radix
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

Replace Book3s Radix's homebrewed (read: copy+pasted) fault-in logic with
__kvm_faultin_pfn(), which functionally does pretty much the exact same
thing.

Note, when the code was written, KVM indeed didn't do fast GUP without
"!atomic && !async", but that has long since changed (KVM tries fast GUP
for all writable mappings).

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/powerpc/kvm/book3s_64_mmu_radix.c | 29 +++++---------------------
 1 file changed, 5 insertions(+), 24 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_64_mmu_radix.c b/arch/powerpc/kvm/book3s_64_mmu_radix.c
index 8304b6f8fe45..14891d0a3b73 100644
--- a/arch/powerpc/kvm/book3s_64_mmu_radix.c
+++ b/arch/powerpc/kvm/book3s_64_mmu_radix.c
@@ -829,40 +829,21 @@ int kvmppc_book3s_instantiate_page(struct kvm_vcpu *vcpu,
 	unsigned long mmu_seq;
 	unsigned long hva, gfn = gpa >> PAGE_SHIFT;
 	bool upgrade_write = false;
-	bool *upgrade_p = &upgrade_write;
 	pte_t pte, *ptep;
 	unsigned int shift, level;
 	int ret;
 	bool large_enable;
+	kvm_pfn_t pfn;
 
 	/* used to check for invalidations in progress */
 	mmu_seq = kvm->mmu_invalidate_seq;
 	smp_rmb();
 
-	/*
-	 * Do a fast check first, since __gfn_to_pfn_memslot doesn't
-	 * do it with !atomic && !async, which is how we call it.
-	 * We always ask for write permission since the common case
-	 * is that the page is writable.
-	 */
 	hva = gfn_to_hva_memslot(memslot, gfn);
-	if (!kvm_ro && get_user_page_fast_only(hva, FOLL_WRITE, &page)) {
-		upgrade_write = true;
-	} else {
-		unsigned long pfn;
-
-		/* Call KVM generic code to do the slow-path check */
-		pfn = __gfn_to_pfn_memslot(memslot, gfn, false, NULL,
-					   writing, upgrade_p);
-		if (is_error_noslot_pfn(pfn))
-			return -EFAULT;
-		page = NULL;
-		if (pfn_valid(pfn)) {
-			page = pfn_to_page(pfn);
-			if (PageReserved(page))
-				page = NULL;
-		}
-	}
+	pfn = __kvm_faultin_pfn(memslot, gfn, writing ? FOLL_WRITE : 0,
+				&upgrade_write, &page);
+	if (is_error_noslot_pfn(pfn))
+		return -EFAULT;
 
 	/*
 	 * Read the PTE from the process' radix tree and use that
-- 
2.46.0.rc1.232.g9752f9e123-goog

