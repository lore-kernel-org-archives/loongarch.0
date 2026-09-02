Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E18604AC14F
	for <loongarch@lists.linux.dev>; Wed,  2 Sep 2026 16:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788367290; cv=none; b=l4wxrmt0Hh+ieBeOm1san91faXpUImu5QW51W3yh2ws6yJuaPDQRjgHUHSQc61+KWx9Woz9s5teNL0qZYletno6LE6O24HZNTW3cRc3/6VYbfR9VEW/sXJhyrhRe3IWv6fNUAUZ668tqHSTyY+YMRC71cdg61s9bmdxFtpurXoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788367290; c=relaxed/simple;
	bh=6OUAEUlWmcz77q9dlKCMKeUAOSbdrXQdyWwvAi7CqFQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=cA6OZ5HOzbcstw6BXAOU/z5h+n927G+jTv6SzF4KXbpSZhkNaFXeh9siIXfpzacLBtRjPe9XJiu/VVfRnLcF24rCMZeMtAbjosp/cbtIc9wR3D8cVGSmSreArsIyiWxMGYtuDYSB0zlZZo19+vo61V0RZJvSd9Zv8V0AE/dAFRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ahgR3hbp; arc=none smtp.client-ip=209.85.210.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ahgR3hbp"
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-84f0d3ab2f4so520267b3a.1
        for <loongarch@lists.linux.dev>; Wed, 02 Sep 2026 09:41:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788367287; x=1788972087; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=d/SeKhrpZbiLYnD0BJegQFxELS2UQb8EJmQMNb/zwWY=;
        b=ahgR3hbpOmxctvQOa9j2SEuuI1TWNfi8qrBIQFKfjC8O5xpsdjYw7vUCBecVoluIpt
         6ukOXzWVwajKtXR2ZVZaFJpb6Jl2NecCoTB+8VZ4orHMsa7OAXdXY1iiLMUG7xf80FBG
         ScAjXFXVTBVTDbWazNGFvq7SO3BKSMs1c7W3RIg94GZ6EzQr1ZDwArJGAu7esxShOkB6
         bIF0LgwzwxoH6vaDt5ld91oYe2Kg2fyteQD8vU2Ce0pfIoI/vBt6OKr9ScjmNrpKY7L9
         ENumacxCRioQMDbyI82ImfRD6I8czcsyz+cJHlbib0naBFfsrCnm1iVoLSVE7HFr0Ihi
         VZxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788367287; x=1788972087;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=d/SeKhrpZbiLYnD0BJegQFxELS2UQb8EJmQMNb/zwWY=;
        b=fxt54giG7hXlt0gvLov0fFRain3n4sM3WUW6HFJ4WMj/NKjmzp8qdaWHPk1ePNNk24
         VIu9i0gSdm8XUpglU+/edqNqsfbZD8UbC8urWO71slaOz478qXybNABrgwGk5INEYsad
         YPv3RmbJpQIoLNH26r90jPKgaLA8R/xDSJzn+9lBVp84pgH4bu6+P21bTeIXVlwtt8rc
         Cd0STrSd2uhZTRZ5fqwueYmkz9O5fZLCn8ScwigVwGQapdOfM6QjtfL+OsgsdQdi4Z6z
         w5APOKuh+fTJXr7B4VCIXT2H62zUqMeTz/XOW2+pLagKJRifNvQlyQqMCQbIPxJPKSf2
         +MjQ==
X-Forwarded-Encrypted: i=1; AKwUvBw+KEx1h3EW7gRTIflZr/uqaePLVONsO6UF7bM0l4B6dntCsBu+5t3DK6GfVed5WvfgQ7R1SWbLBWo=@lists.linux.dev
X-Gm-Message-State: AFuF++ksOL4xwGIfosku9o6fq6EhGy0ol4Re8tychxqXK3c7UDnmnRVE
	Xky4a5o6L15jfrH49w+lJeZqjD64pTi1X+81YNuQxmEJPcnY2PuAzcJytpn+pkarnUjkgsv75et
	X/xn1gg==
X-Received: from pffj5-n2.prod.google.com ([2002:a05:6a00:c2c5:20b0:853:9828:ce3b])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:ad0d:b0:82f:38df:681c
 with SMTP id d2e1a72fcca58-85ed7744a8emr9789737b3a.6.1788367286625; Wed, 02
 Sep 2026 09:41:26 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed,  2 Sep 2026 09:41:05 -0700
In-Reply-To: <20260902164123.2546762-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260902164123.2546762-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.966.g6673acef38-goog
Message-ID: <20260902164123.2546762-3-seanjc@google.com>
Subject: [PATCH v2 02/20] KVM: selftests: Use the common minimum GPA for page
 tables on LoongArch
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

Use the common minimum GPA for page tables (0x180000) on LoongArch instead
of LoongArch's custom minimum of 0x200000, so that LoongArch can use
vm_alloc_page_table() instead of open coding a rough equivalent.  There are
no known reasons why LoongArch can't use a lower, less-aligned minimum.
The more-aligned value was originally selected to support huge pages for
the guest, but that only requires the address of the final allocation to be
aligned, the addresses of page table pages is irrelevant on that front.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/lib/loongarch/processor.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/tools/testing/selftests/kvm/lib/loongarch/processor.c b/tools/testing/selftests/kvm/lib/loongarch/processor.c
index 47bbde3e205a..057a77713542 100644
--- a/tools/testing/selftests/kvm/lib/loongarch/processor.c
+++ b/tools/testing/selftests/kvm/lib/loongarch/processor.c
@@ -9,7 +9,6 @@
 #include "processor.h"
 #include "ucall_common.h"
 
-#define LOONGARCH_PAGE_TABLE_PHYS_MIN		0x200000
 #define LOONGARCH_GUEST_STACK_VADDR_MIN		0x200000
 
 static gpa_t invalid_pgtable[4];
@@ -57,7 +56,7 @@ void virt_arch_pgd_alloc(struct kvm_vm *vm)
 	child = table = 0;
 	for (i = 0; i < vm->mmu.pgtable_levels; i++) {
 		invalid_pgtable[i] = child;
-		table = vm_phy_page_alloc(vm, LOONGARCH_PAGE_TABLE_PHYS_MIN,
+		table = vm_phy_page_alloc(vm, KVM_GUEST_PAGE_TABLE_MIN_PADDR,
 				vm->memslots[MEM_REGION_PT]);
 		TEST_ASSERT(table, "Fail to allocate page tale at level %d\n", i);
 		virt_set_pgtable(vm, table, child);
-- 
2.55.0.966.g6673acef38-goog

