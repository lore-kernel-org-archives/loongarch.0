Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FA4D4ADD80
	for <loongarch@lists.linux.dev>; Wed,  2 Sep 2026 16:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788367310; cv=none; b=AEXzLEE5sGY0HM6fJ9sIYQUY2Eq7Ti+Wzt51IgEOTUe5LomSBxv+Sf4PwKMXKwI4RohK3cgBFNg3TO+RoyC/Fm4HQXMKZRDjojcaeu8I8y/iqdNdbCBJTtaklgRFX9URKYbxD1HE7KR1XmC19es8DFP0Fs5tSHL8PjXSC26zTw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788367310; c=relaxed/simple;
	bh=wQtFJanLpI1WY9EHCIE3kdyq790UPQV+51nbUuKlkgo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Cs1OXZmes0UU+Eo7umPV+wDb+IBtoWEMKTLQxM2Eexupq7qLN6yHBhbRYEYDOe/VZGdg/yJhySIYEPHW3tg39+qyUAaGJ3UmzhG3D9fSf5kP1h8zEXsVWFvF+VnnNo/O8q0/D7XDigxQAw0h2rjwINLIbh3iI4CjfYqEFoRWQXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VrCdhiD6; arc=none smtp.client-ip=209.85.216.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VrCdhiD6"
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38dc085b0a7so2564469a91.2
        for <loongarch@lists.linux.dev>; Wed, 02 Sep 2026 09:41:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788367301; x=1788972101; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=SeJnYNm/30DDrGtlzlyhX4F8Ff+qodk8muwORsydLHQ=;
        b=VrCdhiD6oUv9SDQsrJY3E74loJ74djVwPqX5e0n48ZjxunLTcZa6iMuky3dVSvLLE+
         qkVtydROHH2uds5bEERRhxJHmMsHt1AovkLUJMvLZOlM8AtYwaOcEEYToUmT4pJtdK9D
         1+JOkE81Cs/v645jXYzShw7OS4ztUeGDfDL2vOTa/EWCbTRj4nq1wO8cd54QrFiGjhL2
         ztKA+m6hkWnrD/n89InWScYDuC9+xKKVn4oj+sA0x+UWC/l8sBwosU1wFHNQvEKKRjQQ
         vsenxNu5mJ1OOR6vc3wmpN1e+yGNALGf77jEGf/R7D5WFESK3qIGHXkj77iUoCgE9zTj
         stzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788367301; x=1788972101;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SeJnYNm/30DDrGtlzlyhX4F8Ff+qodk8muwORsydLHQ=;
        b=aMCWabjfSNZyQ5CIlYgfHuCINr6TZ2/qxSZvk0c5a/FKWtePD0t5TP/30jHKZscA5X
         mFTY9Cn0YrTkTJ6NXOR0sQTRh2wbcYPEMft3Oc94fNxktPS8Z17kqGz9Zovo++qQah10
         EhI9aKP3TWsc0eEfCYn6nI7yvIb+ZxZG325vj/02wHxPSUr71PRd94Bakd9aYkadOhDT
         yE5CjlKsistQfGPAlHZ76W9tN2eF5lJUAnrvuPOuoXd+YdFkokia2GzYBn/Em46Wm/I7
         iyYHvcNDznnQWm8tt+8QtFdot9SK/cZlXE5LHuVrh3KgE35QIl+0MD+b9C+tDQnJbwdM
         S8qA==
X-Forwarded-Encrypted: i=1; AKwUvByFMcx1phafvzoWAbU5zjUIJ01bixolic8oVcvxChBrPE3OvhLIrJXZJsnisKZt8BL4TKZV033gA/o=@lists.linux.dev
X-Gm-Message-State: AFuF++mHnwTo2DF2YhOoZgJa5xU+kLP9qV48JplMkdgVulu4t58Bk6En
	5Rw/8mDfoBPf+lpmhHa3Nq+BtGsha+vIq0jPHcYRu5CGCsnnATGpA866fdNuVSCjdEuQ/H9kwtD
	U1KMqIg==
X-Received: from pjan2.prod.google.com ([2002:a17:90a:1602:b0:398:9c5e:d8f2])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4ac9:b0:398:9bd5:490c
 with SMTP id 98e67ed59e1d1-39aee0b498dmr7421235a91.19.1788367300525; Wed, 02
 Sep 2026 09:41:40 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed,  2 Sep 2026 09:41:16 -0700
In-Reply-To: <20260902164123.2546762-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260902164123.2546762-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.966.g6673acef38-goog
Message-ID: <20260902164123.2546762-14-seanjc@google.com>
Subject: [PATCH v2 13/20] KVM: selftests: Add TEST_EXTRA memory region type
 for "special" memslots
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

And another memory region type to deal with extra, one-off memory regions,
and use the new type to manage x86's SMRAM memslot, as another step towards
taking the region type instead of the raw memslot in the physical page
allocator APIs.

Alternatively, SMRAM setup could simply use the quad-underscore API to
continue passing in the memslot, but a surprising number of tests use an
"extra" memslot for a variety of reasons.  I.e. allocating memory from one
(and exactly one) extra memslot isn't all that rare, and so should be
treated as normal behavior, not as something extraordinary, as
quad-underscore functions typically suggest.

Opportunistically add comments to document the intended usage of the types,
as the difference between DATA, TEST_DATA, and TEST_EXTRA in particular
isn't exactly obvious.

Tested-by: Itaru Kitayama <itaru.kitayama@fujitsu.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 .../testing/selftests/kvm/include/kvm_util.h  | 39 ++++++++++++++++---
 tools/testing/selftests/kvm/include/x86/smm.h |  2 +-
 .../testing/selftests/kvm/lib/x86/processor.c |  7 ++--
 3 files changed, 39 insertions(+), 9 deletions(-)

diff --git a/tools/testing/selftests/kvm/include/kvm_util.h b/tools/testing/selftests/kvm/include/kvm_util.h
index c8faa8a02b93..b6b96d6978b2 100644
--- a/tools/testing/selftests/kvm/include/kvm_util.h
+++ b/tools/testing/selftests/kvm/include/kvm_util.h
@@ -82,11 +82,45 @@ struct userspace_mem_regions {
 	DECLARE_HASHTABLE(slot_hash, 9);
 };
 
+/*
+ * Memory region types are passed to various page allocators to communicate
+ * various properties and metadata related to the allocation.  Note, the
+ * descriptions below described the primary usage of each type.  Individual
+ * tests may allocate memory for other purposes.
+ *
+ * By default, all regions except TEST_EXTRA are mapped to memslot '0'.  The
+ * TEXT_EXTRA region is left unmapped as it's intended to be used only for test
+ * specific allocations, i.e. should never be used by core/infrastructure code.
+ * Tests can override the memslot for any or all types, e.g. so that all test
+ * data is allocated from a curated memslot.
+ */
 enum kvm_mem_region_type {
+	/*
+	 * The CODE region is used by lib/elf when loading the test's code into
+	 * guest memory.
+	 */
 	MEM_REGION_CODE,
+	/*
+	 * The DATA region is used to allocate core data structures, e.g. vCPU
+	 * stacks, VM exception tables, x86's TSS, etc.
+	 */
 	MEM_REGION_DATA,
+	/*
+	 * The PT region, a.k.a. Page Table region, is used to allocate page
+	 * table pages.
+	 */
 	MEM_REGION_PT,
+	/*
+	 * The TEST_DATA region is used for allocating test data that is either
+	 * test specific, and/or isn't considered a "core" data structure.
+	 */
 	MEM_REGION_TEST_DATA,
+	/*
+	 * The TEST_EXTRA region is for special snowflakes, where a test wants
+	 * to create and use a one-off memslot, without impacting "normal" test
+	 * data allocations.
+	 */
+	MEM_REGION_TEST_EXTRA,
 	NR_MEM_REGIONS,
 };
 
@@ -129,11 +163,6 @@ struct kvm_vm {
 
 	struct kvm_binary_stats stats;
 
-	/*
-	 * KVM region slots. These are the default memslots used by page
-	 * allocators, e.g., lib/elf uses the memslots[MEM_REGION_CODE]
-	 * memslot.
-	 */
 	u32 memslots[NR_MEM_REGIONS];
 };
 
diff --git a/tools/testing/selftests/kvm/include/x86/smm.h b/tools/testing/selftests/kvm/include/x86/smm.h
index 2d1afa09819b..15faaa060126 100644
--- a/tools/testing/selftests/kvm/include/x86/smm.h
+++ b/tools/testing/selftests/kvm/include/x86/smm.h
@@ -8,7 +8,7 @@
 #define SMRAM_MEMSLOT	((1 << 16) | 1)
 #define SMRAM_PAGES	(SMRAM_SIZE / PAGE_SIZE)
 
-void setup_smram(struct kvm_vm *vm, struct kvm_vcpu *vcpu, u64 smram_gpa,
+void setup_smram(struct kvm_vm *vm, struct kvm_vcpu *vcpu, gpa_t smram_gpa,
 		 const void *smi_handler, size_t handler_size);
 
 void inject_smi(struct kvm_vcpu *vcpu);
diff --git a/tools/testing/selftests/kvm/lib/x86/processor.c b/tools/testing/selftests/kvm/lib/x86/processor.c
index ea5fa59888af..b988eea373ad 100644
--- a/tools/testing/selftests/kvm/lib/x86/processor.c
+++ b/tools/testing/selftests/kvm/lib/x86/processor.c
@@ -1468,11 +1468,12 @@ bool kvm_arch_has_default_irqchip(void)
 	return true;
 }
 
-void setup_smram(struct kvm_vm *vm, struct kvm_vcpu *vcpu, u64 smram_gpa,
+void setup_smram(struct kvm_vm *vm, struct kvm_vcpu *vcpu, gpa_t smram_gpa,
 		 const void *smi_handler, size_t handler_size)
 {
-	vm_userspace_mem_region_add(vm, VM_MEM_SRC_ANONYMOUS, smram_gpa,
-				    SMRAM_MEMSLOT, SMRAM_PAGES, 0);
+	vm_override_mem_region(vm, MEM_REGION_TEST_EXTRA, VM_MEM_SRC_ANONYMOUS,
+			       smram_gpa, SMRAM_MEMSLOT, SMRAM_PAGES);
+
 	TEST_ASSERT(vm_phy_pages_alloc(vm, SMRAM_PAGES, smram_gpa,
 				       SMRAM_MEMSLOT) == smram_gpa,
 		    "Could not allocate guest physical addresses for SMRAM");
-- 
2.55.0.966.g6673acef38-goog

