Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6633D4AA408
	for <loongarch@lists.linux.dev>; Wed,  2 Sep 2026 16:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788367299; cv=none; b=boTkdHCDoBLlKKm7YMzApRXMdDkECfflTMW4VlfYGHTYc3u2v+LbfYVzUsZ8JAl0jEBtacM9Iv30sBMg22ii+AEIsboScu8oH+8pvlb/rNmuhimRKCnqPxSOghK3DoVtTx6+fTB3opHduIR/HsGuJrIF17SLYsRKV4ca/pNSA/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788367299; c=relaxed/simple;
	bh=1FneJM9N+iD2yZ+x4/1fexUijXDgNuTpisnHzVWEp+8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=pAjuezUv7F2DQ3+TU0gplEYCXW2eWoAYBTzDGa7+ntkLqcQYWFv7CWwTB6PkEYDa/lTpnv87fBD1qJMMe36E+86h5yLPwdtKZIQOcY1vToIB4UIUuZzL2C6BtO9c5pGOqcFu30LVdTCY+6+C+NkXklZr3aAYwFf+9qBBqptgdcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uF4Z7dyw; arc=none smtp.client-ip=209.85.210.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uF4Z7dyw"
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-84a67b16217so2213104b3a.3
        for <loongarch@lists.linux.dev>; Wed, 02 Sep 2026 09:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788367294; x=1788972094; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=xxl3R2RxR/fdY+CE5Gsyx1FXrQJglfzt8OPnA5rO56k=;
        b=uF4Z7dywB53xapEmRIJrkA3U9sJHXjNEr/cS9Mc11F12tdDjCoHVEINkU5YfBaNL/t
         +l+0B/+At6pXjHZPAoR8U7JMQjYYUb29S7+iuD/KzGM/GW2cjKewGhphytCSaGCZBiVl
         3HgLVbpUsn/TQYwjY0zUeGaPvVXadrcXev49I5kyV/fhPUDtdtAY9MAjZOCdVUQiww4z
         4en8gnBYozpwvymySWzWOsnISR+yN7qv3Eub+NLO0lH0iyNTuNLPDSL/mrli21o1wQck
         UFVGPHztknGm8glIjyLwapJhm4ymxhK7StufaL2zIfiYdfn3ofw7mkNON0i6hmZLC5ln
         wtMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788367294; x=1788972094;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xxl3R2RxR/fdY+CE5Gsyx1FXrQJglfzt8OPnA5rO56k=;
        b=O4QtJryAXAQGfksL8S4iPNNbFFWBLCztSko8k+l2dM9sNUhGokyt3Mp3I51g+YPpTi
         VEOUOXhjnIkEFai7q8bRPlxvxN6Rq6W97rHuStMsMAd4bdrvMDHmS3T+IzbiCpJN3a4T
         ahomm/pqUj5bio6tKRJkHvK/Ls9QtEgKaEwyWtPHjWCrOiadU+WHwdXk1OdhxI1e7ITf
         DYyBZhC3qan7JSX3VwHAyxccqdGKMUPfsjiQPoJpD0kecY3KzZv7kUww+v5xr8aMsWAu
         jSX/ZuZnC6TqGDyjaKJb1bgl8Ry1oMmDY4dGvKLNxM1pe74eS2mzSekQZ0411qePd8Ob
         rHzA==
X-Forwarded-Encrypted: i=1; AKwUvBxpV66PS75LzQA0CoaS4h0DTgJfNtqz0MivzjXwtWdN1eKQB0o+JrIxZ3xHLncbCSiRPiPTgpp7PkY=@lists.linux.dev
X-Gm-Message-State: AFuF++kRN8keS+hCAw6zW9ScocwjkC3rkfcyU79tI6eg+TflZsNvwXzt
	NdLD20lr0jXJl4aN3d5aMoN9CCYZJQveXwj7IQtHTxn7FgIXZgNcjIQ8SgsTYPBmXCuaqvAV2SQ
	BXkeJDw==
X-Received: from pfmy23.prod.google.com ([2002:aa7:8057:0:b0:847:7f5d:6b90])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:4fce:b0:845:e9e8:645c
 with SMTP id d2e1a72fcca58-85ed7d1ddf1mr9648289b3a.6.1788367293421; Wed, 02
 Sep 2026 09:41:33 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed,  2 Sep 2026 09:41:10 -0700
In-Reply-To: <20260902164123.2546762-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260902164123.2546762-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.966.g6673acef38-goog
Message-ID: <20260902164123.2546762-8-seanjc@google.com>
Subject: [PATCH v2 07/20] KVM: selftests: Make the single-page allocator APIs
 static inline
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>
Cc: Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Atish Patra <atish.patra@linux.dev>, 
	Alexandre Ghiti <alex@ghiti.fr>, David Hildenbrand <david@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm@vger.kernel.org, loongarch@lists.linux.dev, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Itaru Kitayama <itaru.kitayama@fujitsu.com>, 
	Nicholas Piggin <npiggin@gmail.com>, Ritesh Harjani <ritesh.list@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Move the single-page allocator APIs to kvm_util.h as inline functions, as
the are trivial wrappers, and unlike __vm_phy_pages_alloc(), are expected
to remain that way for the foreseeable future.

No functional change intended.

Tested-by: Itaru Kitayama <itaru.kitayama@fujitsu.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/include/kvm_util.h | 14 ++++++++++++--
 tools/testing/selftests/kvm/lib/kvm_util.c     | 11 -----------
 2 files changed, 12 insertions(+), 13 deletions(-)

diff --git a/tools/testing/selftests/kvm/include/kvm_util.h b/tools/testing/selftests/kvm/include/kvm_util.h
index 4732b9528812..d9d39a8894e2 100644
--- a/tools/testing/selftests/kvm/include/kvm_util.h
+++ b/tools/testing/selftests/kvm/include/kvm_util.h
@@ -990,12 +990,10 @@ void kvm_gsi_routing_write(struct kvm_vm *vm, struct kvm_irq_routing *routing);
 
 const char *exit_reason_str(unsigned int exit_reason);
 
-gpa_t vm_phy_page_alloc(struct kvm_vm *vm, gpa_t min_gpa, u32 memslot);
 gpa_t ____vm_phy_pages_alloc(struct kvm_vm *vm, size_t nr_pages, gpa_t min_gpa,
 			     u32 memslot, bool protected, bool naturally_aligned);
 gpa_t __vm_phy_pages_alloc(struct kvm_vm *vm, size_t nr_pages, gpa_t min_gpa,
 			   u32 memslot, bool protected);
-gpa_t vm_alloc_page_table(struct kvm_vm *vm);
 
 static inline gpa_t vm_phy_pages_alloc(struct kvm_vm *vm, size_t nr_pages,
 				       gpa_t min_gpa, u32 memslot)
@@ -1009,6 +1007,18 @@ static inline gpa_t vm_phy_pages_alloc(struct kvm_vm *vm, size_t nr_pages,
 				    vm_arch_has_protected_memory(vm));
 }
 
+static inline gpa_t vm_phy_page_alloc(struct kvm_vm *vm, gpa_t min_gpa,
+				      u32 memslot)
+{
+	return vm_phy_pages_alloc(vm, 1, min_gpa, memslot);
+}
+
+static inline gpa_t vm_alloc_page_table(struct kvm_vm *vm)
+{
+	return vm_phy_page_alloc(vm, KVM_GUEST_PAGE_TABLE_MIN_PADDR,
+				 vm->memslots[MEM_REGION_PT]);
+}
+
 /*
  * ____vm_create() does KVM_CREATE_VM and little else.  __vm_create() also
  * loads the test binary into guest memory and creates an IRQ chip (x86 only).
diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
index 896da440659e..ce0d8fba4624 100644
--- a/tools/testing/selftests/kvm/lib/kvm_util.c
+++ b/tools/testing/selftests/kvm/lib/kvm_util.c
@@ -2086,17 +2086,6 @@ gpa_t __vm_phy_pages_alloc(struct kvm_vm *vm, size_t nr_pages, gpa_t min_gpa,
 	return ____vm_phy_pages_alloc(vm, nr_pages, min_gpa, memslot, protected, false);
 }
 
-gpa_t vm_phy_page_alloc(struct kvm_vm *vm, gpa_t min_gpa, u32 memslot)
-{
-	return vm_phy_pages_alloc(vm, 1, min_gpa, memslot);
-}
-
-gpa_t vm_alloc_page_table(struct kvm_vm *vm)
-{
-	return vm_phy_page_alloc(vm, KVM_GUEST_PAGE_TABLE_MIN_PADDR,
-				 vm->memslots[MEM_REGION_PT]);
-}
-
 /*
  * Address Guest Virtual to Host Virtual
  *
-- 
2.55.0.966.g6673acef38-goog

