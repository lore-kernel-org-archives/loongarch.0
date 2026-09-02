Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EEEE4AE8C6
	for <loongarch@lists.linux.dev>; Wed,  2 Sep 2026 16:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788367317; cv=none; b=Nv+EsO1r57OGjFFN16iVMofvY2NVPvcpBUGBOBG6xsaCkG7ZXAeaHbFq5frIWMJQg11l2hqFpUFPVauSmWhNXJtbuC5xdrZ4gjka43LzkQ92rO+yd9JbeM+4M7U/4OA6CAHsUJmWxaLmqvYYSwLToCezOZPRq2iTYb29cz3uor0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788367317; c=relaxed/simple;
	bh=BYNjpqJdDEiFH15FqFu/4Cv42zLdUdvinzoK67AQzOc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=qUwoYlYPO0Pxp4M8gtrCTmIBAblkRjjPLTpWg+c0HhwK2pmMQkmfafHllU121Eqh6U0RvhMYP8TY55Sh16hjk+VkQpjYwOXxAJ3KxQAKMVkqtA8O3A0UUcwLa3RAC4GK7wBjpTwU4kHvdKMfMrWUz193B9+xxxsPckCug6u4tDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mxJVkVjN; arc=none smtp.client-ip=209.85.216.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mxJVkVjN"
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-398ba5404d2so1882961a91.1
        for <loongarch@lists.linux.dev>; Wed, 02 Sep 2026 09:41:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788367308; x=1788972108; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+EtjgHzhg5y+gaNAA1nW+ZiKB252Rwdo4nHhOvgia1M=;
        b=mxJVkVjN57Yfy3e8mOkvC7gWs6Ffr0UG4/+2WK/0yS9DBU3/oKiU2taLNELQaSygU7
         7JHaKSrFHP426YtYhf8AxL3vv5q5n5QvYsR4uFo79uP0/iWrx439Zd1JS+164GrojJy/
         UXhha17W/sszbmxdlEW5t9VBCCdNBCZWMbiBeG7Sk4iWK0d0L3wPhVX1AbiiyDj9me2F
         1Z1JcMWEVgBepaqJAif4+tM8f7r8WYOG5oJsL/B/9f2EbZN4uJ9DTvfkv2RkHQfbzYuU
         Z4XKDp6h5bpwyzPpmoh5LhCUht+UJ6+0k5Ntb9lm1quDOD3VAsZSwawncFbiJ0fLBpmp
         cXCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788367308; x=1788972108;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+EtjgHzhg5y+gaNAA1nW+ZiKB252Rwdo4nHhOvgia1M=;
        b=XJYfJgLh9wjs3kMZpc8L9miozjS3VDzXyGIJ3MGf9L2QqFpj0zEN4izBY0SZhozfbI
         omPzMOO9R7C5AejhfxHogcpoQrulPPV6UZHttgsuTWC2h+2BbRSip1KEi/yBGWXtYgdQ
         NS9lX+y0l0XxqiYg7ybjCMQA8Owbks0VEJd70DYTafjlyKvurAnYTYs/oLTj6Q4ts518
         rN19pwrbfi4Mmixx370Dt2WP7d7aNVCM9NQrUDCcGejlhi6WdkujhJrCWSq3ak2g/KJc
         DqOmF5jBuOmIctkEGOcrCGk7WQzNTeoIJB4La0+0+a+zP9+tjOZEw9Iwy5LE/frODDLN
         v2lw==
X-Forwarded-Encrypted: i=1; AKwUvBy+SgRHSrCFUEkKzMFrEQEGr+KNqyeUlUXcHMq3yuR7Rk2I5hr0Zo2VgCbqafIs8Yyiu5eJORLcOpA=@lists.linux.dev
X-Gm-Message-State: AFuF++mmJKc6pyDCFaSyABL+cxelC3xT9I2drMj9qBGMVPNXNZbgxXpO
	z40snU+5jZLrMbCNObClWH08zOJEhg3TGmff9XvCTVk7g4l/grLGD3FgCiNIWel3+4+W5kBBb4j
	mkochFQ==
X-Received: from pjqz14.prod.google.com ([2002:a17:90a:b10e:b0:390:9239:a6dc])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4c4e:b0:398:ba56:b926
 with SMTP id 98e67ed59e1d1-39aee16f658mr8856203a91.25.1788367307392; Wed, 02
 Sep 2026 09:41:47 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed,  2 Sep 2026 09:41:22 -0700
In-Reply-To: <20260902164123.2546762-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260902164123.2546762-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.966.g6673acef38-goog
Message-ID: <20260902164123.2546762-20-seanjc@google.com>
Subject: [PATCH v2 19/20] KVM: selftests: Automatically pick min_gpa for
 allocations based on region type
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

Automatically choose the minimum GPA for physical page allocations based on
the region type instead of sprinkling the logic over various wrappers and
tests.  All usage falls into three categories: (a) don't care, just use the
bare minimum GPA, (b) page tables, use a slightly higher min to keep low
memory available, (c) custom memslot, use the base of the memslot.  I.e.
there isn't a strong need to allow completely custom minimums.

Opportunistically move the vGIC LPI stress test's "gpa_base" variable into
setup_memslot() as the only reason it was a global variable was so that it
could be passed as the minimum GPA for allocations from the extra memslot.

Tested-by: Itaru Kitayama <itaru.kitayama@fujitsu.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 .../selftests/kvm/arm64/vgic_lpi_stress.c     | 13 +++----
 .../testing/selftests/kvm/include/kvm_util.h  | 12 +++---
 tools/testing/selftests/kvm/lib/kvm_util.c    | 38 ++++++++++++++++---
 .../testing/selftests/kvm/lib/x86/processor.c |  3 +-
 .../selftests/kvm/set_memory_region_test.c    |  2 +-
 .../x86/smaller_maxphyaddr_emulation_test.c   |  2 +-
 6 files changed, 45 insertions(+), 25 deletions(-)

diff --git a/tools/testing/selftests/kvm/arm64/vgic_lpi_stress.c b/tools/testing/selftests/kvm/arm64/vgic_lpi_stress.c
index a45c0849a47a..45a87ba5a737 100644
--- a/tools/testing/selftests/kvm/arm64/vgic_lpi_stress.c
+++ b/tools/testing/selftests/kvm/arm64/vgic_lpi_stress.c
@@ -23,7 +23,6 @@
 #define GIC_LPI_OFFSET	8192
 
 static size_t nr_iterations = 1000;
-static gpa_t gpa_base;
 
 static struct kvm_vm *vm;
 static struct kvm_vcpu **vcpus;
@@ -143,6 +142,7 @@ static void guest_code(size_t nr_lpis)
 
 static void setup_memslot(void)
 {
+	gpa_t gpa_base;
 	size_t pages;
 	size_t sz;
 
@@ -191,28 +191,25 @@ static void setup_test_data(void)
 	gpa_t cmdq_base;
 
 	test_data.device_table = vm_phy_pages_alloc(vm, pages_per_64k,
-						    gpa_base,
 						    MEM_REGION_TEST_EXTRA);
 
 	test_data.collection_table = vm_phy_pages_alloc(vm, pages_per_64k,
-							gpa_base,
 							MEM_REGION_TEST_EXTRA);
 
-	cmdq_base = vm_phy_pages_alloc(vm, pages_per_64k, gpa_base,
-				       MEM_REGION_TEST_EXTRA);
+	cmdq_base = vm_phy_pages_alloc(vm, pages_per_64k, MEM_REGION_TEST_EXTRA);
 	virt_map(vm, cmdq_base, cmdq_base, pages_per_64k);
 	test_data.cmdq_base = cmdq_base;
 	test_data.cmdq_base_va = (void *)cmdq_base;
 
 	test_data.itt_tables = vm_phy_pages_alloc(vm, pages_per_64k * nr_devices,
-						  gpa_base, MEM_REGION_TEST_EXTRA);
+						  MEM_REGION_TEST_EXTRA);
 
 	test_data.lpi_prop_table = vm_phy_pages_alloc(vm, pages_per_64k,
-						      gpa_base, MEM_REGION_TEST_EXTRA);
+						      MEM_REGION_TEST_EXTRA);
 	configure_lpis();
 
 	test_data.lpi_pend_tables = vm_phy_pages_alloc(vm, pages_per_64k * nr_cpus,
-						       gpa_base, MEM_REGION_TEST_EXTRA);
+						       MEM_REGION_TEST_EXTRA);
 
 	sync_global_to_guest(vm, test_data);
 }
diff --git a/tools/testing/selftests/kvm/include/kvm_util.h b/tools/testing/selftests/kvm/include/kvm_util.h
index c166fce4599c..43b49d0ad4eb 100644
--- a/tools/testing/selftests/kvm/include/kvm_util.h
+++ b/tools/testing/selftests/kvm/include/kvm_util.h
@@ -1054,11 +1054,10 @@ const char *exit_reason_str(unsigned int exit_reason);
 
 gpa_t ____vm_phy_pages_alloc(struct kvm_vm *vm, size_t nr_pages, gpa_t min_gpa,
 			     u32 memslot, bool protected, bool naturally_aligned);
-gpa_t __vm_phy_pages_alloc(struct kvm_vm *vm, size_t nr_pages, gpa_t min_gpa,
+gpa_t __vm_phy_pages_alloc(struct kvm_vm *vm, size_t nr_pages,
 			   enum kvm_mem_region_type type, bool protected);
 
 static inline gpa_t vm_phy_pages_alloc(struct kvm_vm *vm, size_t nr_pages,
-				       gpa_t min_gpa,
 				       enum kvm_mem_region_type type)
 {
 	/*
@@ -1066,20 +1065,19 @@ static inline gpa_t vm_phy_pages_alloc(struct kvm_vm *vm, size_t nr_pages,
 	 * protected memory, as the majority of memory for such VMs is
 	 * protected, i.e. using shared memory is effectively opt-in.
 	 */
-	return __vm_phy_pages_alloc(vm, nr_pages, min_gpa, type,
+	return __vm_phy_pages_alloc(vm, nr_pages, type,
 				    vm_arch_has_protected_memory(vm));
 }
 
-static inline gpa_t vm_phy_page_alloc(struct kvm_vm *vm, gpa_t min_gpa,
+static inline gpa_t vm_phy_page_alloc(struct kvm_vm *vm,
 				      enum kvm_mem_region_type type)
 {
-	return vm_phy_pages_alloc(vm, 1, min_gpa, type);
+	return vm_phy_pages_alloc(vm, 1, type);
 }
 
 static inline gpa_t vm_alloc_page_table_pages(struct kvm_vm *vm, size_t nr_pages)
 {
-	return vm_phy_pages_alloc(vm, nr_pages, KVM_GUEST_PAGE_TABLE_MIN_PADDR,
-				  MEM_REGION_PT);
+	return vm_phy_pages_alloc(vm, nr_pages, MEM_REGION_PT);
 }
 
 static inline gpa_t vm_alloc_page_table(struct kvm_vm *vm)
diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
index e500d1799151..8b5b330a5889 100644
--- a/tools/testing/selftests/kvm/lib/kvm_util.c
+++ b/tools/testing/selftests/kvm/lib/kvm_util.c
@@ -1473,9 +1473,7 @@ static gva_t ____vm_alloc(struct kvm_vm *vm, size_t sz, gva_t min_gva,
 	u64 pages = (sz >> vm->page_shift) + ((sz % vm->page_size) != 0);
 
 	virt_pgd_alloc(vm);
-	gpa_t gpa = __vm_phy_pages_alloc(vm, pages,
-					   KVM_UTIL_MIN_PFN * vm->page_size,
-					   type, protected);
+	gpa_t gpa = __vm_phy_pages_alloc(vm, pages, type, protected);
 
 	/*
 	 * Find an unused range of virtual page addresses of at least
@@ -2087,11 +2085,39 @@ gpa_t ____vm_phy_pages_alloc(struct kvm_vm *vm, size_t nr_pages, gpa_t min_gpa,
 	__builtin_unreachable();
 }
 
-gpa_t __vm_phy_pages_alloc(struct kvm_vm *vm, size_t nr_pages, gpa_t min_gpa,
+gpa_t __vm_phy_pages_alloc(struct kvm_vm *vm, size_t nr_pages,
 			   enum kvm_mem_region_type type, bool protected)
 {
-	TEST_ASSERT(type < NR_MEM_REGIONS,
-		    "Invalid memory region type '%u'", type);
+	struct userspace_mem_region *region = vm_get_mem_region(vm, type);
+	gpa_t min_gpa;
+
+	TEST_ASSERT(region, "No region for type '%u', memslot '%u'",
+		    type, vm->memslots[type]);
+
+	switch (type) {
+	case MEM_REGION_CODE:
+	case MEM_REGION_DATA:
+	case MEM_REGION_TEST_DATA:
+		/*
+		 * If the region is backed by the default memslot (id=0), use
+		 * selftests' hardcoded minimum PFN, otherwise use the base of
+		 * the custom memory slot that backs the region.
+		 */
+		if (!vm->memslots[type])
+			min_gpa = KVM_UTIL_MIN_PFN * vm->page_size;
+		else
+			min_gpa = region->region.guest_phys_addr;
+		break;
+	case MEM_REGION_PT:
+		min_gpa = KVM_GUEST_PAGE_TABLE_MIN_PADDR;
+		break;
+	case MEM_REGION_TEST_EXTRA:
+		min_gpa = region->region.guest_phys_addr;
+		break;
+	default:
+		TEST_FAIL("Invalid memory region type '%u'", type);
+		break;
+	}
 
 	return ____vm_phy_pages_alloc(vm, nr_pages, min_gpa, vm->memslots[type],
 				      protected, false);
diff --git a/tools/testing/selftests/kvm/lib/x86/processor.c b/tools/testing/selftests/kvm/lib/x86/processor.c
index 39d9ca6ceb1d..479e9a481687 100644
--- a/tools/testing/selftests/kvm/lib/x86/processor.c
+++ b/tools/testing/selftests/kvm/lib/x86/processor.c
@@ -1474,8 +1474,7 @@ void setup_smram(struct kvm_vm *vm, struct kvm_vcpu *vcpu, gpa_t smram_gpa,
 	vm_override_mem_region(vm, MEM_REGION_TEST_EXTRA, VM_MEM_SRC_ANONYMOUS,
 			       smram_gpa, SMRAM_MEMSLOT, SMRAM_PAGES);
 
-	TEST_ASSERT(vm_phy_pages_alloc(vm, SMRAM_PAGES, smram_gpa,
-				       MEM_REGION_TEST_EXTRA) == smram_gpa,
+	TEST_ASSERT(vm_phy_pages_alloc(vm, SMRAM_PAGES, MEM_REGION_TEST_EXTRA) == smram_gpa,
 		    "Could not allocate guest physical addresses for SMRAM");
 
 	memset(addr_gpa2hva(vm, smram_gpa), 0x0, SMRAM_SIZE);
diff --git a/tools/testing/selftests/kvm/set_memory_region_test.c b/tools/testing/selftests/kvm/set_memory_region_test.c
index 160bbe3d7203..bfa5ac8ce029 100644
--- a/tools/testing/selftests/kvm/set_memory_region_test.c
+++ b/tools/testing/selftests/kvm/set_memory_region_test.c
@@ -124,7 +124,7 @@ static struct kvm_vm *spawn_vm(struct kvm_vcpu **vcpu, pthread_t *vcpu_thread,
 	 * Allocate and map two pages so that the GPA accessed by guest_code()
 	 * stays valid across the memslot move.
 	 */
-	gpa = vm_phy_pages_alloc(vm, 2, MEM_REGION_GPA, MEM_REGION_TEST_EXTRA);
+	gpa = vm_phy_pages_alloc(vm, 2, MEM_REGION_TEST_EXTRA);
 	TEST_ASSERT(gpa == MEM_REGION_GPA, "Failed vm_phy_pages_alloc\n");
 
 	virt_map(vm, MEM_REGION_GPA, MEM_REGION_GPA, 2);
diff --git a/tools/testing/selftests/kvm/x86/smaller_maxphyaddr_emulation_test.c b/tools/testing/selftests/kvm/x86/smaller_maxphyaddr_emulation_test.c
index 4e125eb5e0cf..8d1822717abd 100644
--- a/tools/testing/selftests/kvm/x86/smaller_maxphyaddr_emulation_test.c
+++ b/tools/testing/selftests/kvm/x86/smaller_maxphyaddr_emulation_test.c
@@ -67,7 +67,7 @@ int main(int argc, char *argv[])
 			       MEM_REGION_SIZE / PAGE_SIZE);
 
 	gpa = vm_phy_pages_alloc(vm, MEM_REGION_SIZE / PAGE_SIZE,
-				 MEM_REGION_GPA, MEM_REGION_TEST_EXTRA);
+				 MEM_REGION_TEST_EXTRA);
 	TEST_ASSERT(gpa == MEM_REGION_GPA, "Failed vm_phy_pages_alloc");
 	virt_map(vm, MEM_REGION_GVA, MEM_REGION_GPA, 1);
 	hva = addr_gpa2hva(vm, MEM_REGION_GPA);
-- 
2.55.0.966.g6673acef38-goog

