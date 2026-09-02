Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 785604ACC75
	for <loongarch@lists.linux.dev>; Wed,  2 Sep 2026 16:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788367304; cv=none; b=p4f98lxoN47HfqzzbKmZlReDKaqlzkXIWDdvWBPjh2yuWFPbFM05MyxpDIueVXxL73y0wrN7SQ93LQTpsl4MfoQ8cVGdK4w0sS+H9KPnaWIawBjjYEz4sVq3WYyMgQoAfpPZwkXV3gEXWXnWF0xoAAL3WpcyOaBZ83F/dgnLapU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788367304; c=relaxed/simple;
	bh=fpdNJ79zoAmUsOtk7XW36TEbPPOshE53uv70BhTJk1g=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=J0Jr8ejc05Z/wWPnFiET/JgM3Ik3nrVZIe4eMsom8kyFppjobeGuHhtXLEegf7Y4wuyeWMnjIkF+lP7gkl5UFcyhSDB33YsDogMf9GaxnNTrCEGkB3p+o/3EhoYTwnE+INlkbe844484HsrJT3ETf0bm5/2Gt7olyQqV4vw5Ubw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PueBHgn+; arc=none smtp.client-ip=209.85.215.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PueBHgn+"
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc39363cc88so1111199a12.0
        for <loongarch@lists.linux.dev>; Wed, 02 Sep 2026 09:41:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788367297; x=1788972097; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=nUBJYSRlpoGNr9NmdwArWEE9moAAM62vGLNGWV3DD18=;
        b=PueBHgn+jSIikEaAoPT37onkbgdjAZkrBTfFwU5oimUYqnuVgHKZ2QJwRLQF0/oBKD
         a84Pq6P8u61NDaKzdDm6fAaUcIhJp8p/mr/Y2HJsFkaDYynrYxeMv8dxNvutFIHWTQ/D
         pT/FGL4mQp3avM8jNQkab45Itu4IgBZQTcljgYZEkUhjj4dQketXCLgHVmwWwdXruZz2
         oL+RHsAHp2Rt/nbdXt8+kKHhmuBrLWJAKCxpL5R9ATCFQ3Ubtwek7+jgyZy6rQvAVOYS
         XF/fLAJtNIGllqUaKCy6w1usPKI6irMpgTS3o8Ki8R5+YYMqizd6qVmHjgL0So8wamAr
         UZLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788367297; x=1788972097;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nUBJYSRlpoGNr9NmdwArWEE9moAAM62vGLNGWV3DD18=;
        b=edfAnbELbNfyNsmp9odpU3KSWYk3ds/fJ1i14y4FBHqKOxe5jhCvoM9UMlIuz9w7mZ
         4c4pfARaRcdmPSOWC/1xeEmJCWmS/r+3+FM18C5Z23SZH1jCnOSi37fRQEMLaWiRv9ws
         8l4HDE608KbfPL9J6s3NLasfUYP1LdSMpvlARRYWNG7h9apyMBcCpFkPwfY0kllVuMvg
         9EWP2skjO5wv8wDC4EOuOvdIXMoJEAAprmdfkJchiNwdozH3vXV7jLikSv0doUBLEb0a
         D3qM2a/ekW71EgE5BYGuQH8NROfiaRF8TICqpdHbSt1hD3aIVZgkyBt0KJ7r6uizysbl
         /nFw==
X-Forwarded-Encrypted: i=1; AKwUvBznuZztSBrBFe0ostJbTJFlSoXCh2rzwOSmOlCnBkn82KOYbfuUflZFxq1qnynhQ+4sb0IBZfZlB9c=@lists.linux.dev
X-Gm-Message-State: AFuF++nKSmPNO+SpuU8xhp7hv9pRA+PxPvf4wRi30wspCuQIMeanLG65
	w5B2TAFoOYJiQjQJM4IAvBCa1ucVnUGp+A1uZCdIfHDg1ObLjGix8aa84p2WEbVlxiqO9uaaZjS
	TOTJPBg==
X-Received: from pgnd15.prod.google.com ([2002:a63:734f:0:b0:cc4:3a7b:365b])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:3944:b0:3d3:af85:eb98
 with SMTP id adf61e73a8af0-3d9af3efa11mr10754332637.26.1788367296882; Wed, 02
 Sep 2026 09:41:36 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed,  2 Sep 2026 09:41:13 -0700
In-Reply-To: <20260902164123.2546762-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260902164123.2546762-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.966.g6673acef38-goog
Message-ID: <20260902164123.2546762-11-seanjc@google.com>
Subject: [PATCH v2 10/20] KVM: selftests: Add a wrapper API to allocate
 multiple page table pages
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

Add vm_alloc_page_table_pages() and use it throughout arch code to replace
open coded equivalents.

No functional change intended.

Reviewed-by: Itaru Kitayama <itaru.kitayama@fujitsu.com>
Tested-by: Itaru Kitayama <itaru.kitayama@fujitsu.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/include/kvm_util.h    | 9 +++++++--
 tools/testing/selftests/kvm/lib/arm64/processor.c | 4 +---
 tools/testing/selftests/kvm/lib/riscv/processor.c | 4 +---
 tools/testing/selftests/kvm/lib/s390/processor.c  | 8 ++------
 4 files changed, 11 insertions(+), 14 deletions(-)

diff --git a/tools/testing/selftests/kvm/include/kvm_util.h b/tools/testing/selftests/kvm/include/kvm_util.h
index d9d39a8894e2..c56f342b16fd 100644
--- a/tools/testing/selftests/kvm/include/kvm_util.h
+++ b/tools/testing/selftests/kvm/include/kvm_util.h
@@ -1013,10 +1013,15 @@ static inline gpa_t vm_phy_page_alloc(struct kvm_vm *vm, gpa_t min_gpa,
 	return vm_phy_pages_alloc(vm, 1, min_gpa, memslot);
 }
 
+static inline gpa_t vm_alloc_page_table_pages(struct kvm_vm *vm, size_t nr_pages)
+{
+	return vm_phy_pages_alloc(vm, nr_pages, KVM_GUEST_PAGE_TABLE_MIN_PADDR,
+				  vm->memslots[MEM_REGION_PT]);
+}
+
 static inline gpa_t vm_alloc_page_table(struct kvm_vm *vm)
 {
-	return vm_phy_page_alloc(vm, KVM_GUEST_PAGE_TABLE_MIN_PADDR,
-				 vm->memslots[MEM_REGION_PT]);
+	return vm_alloc_page_table_pages(vm, 1);
 }
 
 /*
diff --git a/tools/testing/selftests/kvm/lib/arm64/processor.c b/tools/testing/selftests/kvm/lib/arm64/processor.c
index 01325bf4d36f..2dcaa2c4a038 100644
--- a/tools/testing/selftests/kvm/lib/arm64/processor.c
+++ b/tools/testing/selftests/kvm/lib/arm64/processor.c
@@ -115,9 +115,7 @@ void virt_arch_pgd_alloc(struct kvm_vm *vm)
 	if (vm->mmu.pgd_created)
 		return;
 
-	vm->mmu.pgd = vm_phy_pages_alloc(vm, nr_pages,
-					 KVM_GUEST_PAGE_TABLE_MIN_PADDR,
-					 vm->memslots[MEM_REGION_PT]);
+	vm->mmu.pgd = vm_alloc_page_table_pages(vm, nr_pages);
 	vm->mmu.pgd_created = true;
 }
 
diff --git a/tools/testing/selftests/kvm/lib/riscv/processor.c b/tools/testing/selftests/kvm/lib/riscv/processor.c
index ded5429f3448..c175dcd14114 100644
--- a/tools/testing/selftests/kvm/lib/riscv/processor.c
+++ b/tools/testing/selftests/kvm/lib/riscv/processor.c
@@ -69,9 +69,7 @@ void virt_arch_pgd_alloc(struct kvm_vm *vm)
 	if (vm->mmu.pgd_created)
 		return;
 
-	vm->mmu.pgd = vm_phy_pages_alloc(vm, nr_pages,
-					 KVM_GUEST_PAGE_TABLE_MIN_PADDR,
-					 vm->memslots[MEM_REGION_PT]);
+	vm->mmu.pgd = vm_alloc_page_table_pages(vm, nr_pages);
 	vm->mmu.pgd_created = true;
 }
 
diff --git a/tools/testing/selftests/kvm/lib/s390/processor.c b/tools/testing/selftests/kvm/lib/s390/processor.c
index fb9dab92d4d1..33f49d743b5f 100644
--- a/tools/testing/selftests/kvm/lib/s390/processor.c
+++ b/tools/testing/selftests/kvm/lib/s390/processor.c
@@ -20,9 +20,7 @@ void virt_arch_pgd_alloc(struct kvm_vm *vm)
 	if (vm->mmu.pgd_created)
 		return;
 
-	gpa = vm_phy_pages_alloc(vm, PAGES_PER_REGION,
-				   KVM_GUEST_PAGE_TABLE_MIN_PADDR,
-				   vm->memslots[MEM_REGION_PT]);
+	gpa = vm_alloc_page_table_pages(vm, PAGES_PER_REGION);
 	memset(addr_gpa2hva(vm, gpa), 0xff, PAGES_PER_REGION * vm->page_size);
 
 	vm->mmu.pgd = gpa;
@@ -38,9 +36,7 @@ static u64 virt_alloc_region(struct kvm_vm *vm, int ri)
 {
 	u64 taddr;
 
-	taddr = vm_phy_pages_alloc(vm,  ri < 4 ? PAGES_PER_REGION : 1,
-				   KVM_GUEST_PAGE_TABLE_MIN_PADDR,
-				   vm->memslots[MEM_REGION_PT]);
+	taddr = vm_alloc_page_table_pages(vm, ri < 4 ? PAGES_PER_REGION : 1);
 	memset(addr_gpa2hva(vm, taddr), 0xff, PAGES_PER_REGION * vm->page_size);
 
 	return (taddr & REGION_ENTRY_ORIGIN)
-- 
2.55.0.966.g6673acef38-goog

