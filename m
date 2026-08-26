Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 749D63B058E
	for <loongarch@lists.linux.dev>; Wed, 26 Aug 2026 23:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787785522; cv=none; b=ijoCvM1qhz2MUn6GAfoAcP5y9g2ZwLMFG07LAiIa8TWhT730U0MbMLTxd9drPWFrxu9jJ0gHNKRC+DyoAf3YzahCATnG1DV5NXSK0N/sefqACSjTBsCEhQvjbLc3z9Moj7NhmhQPZU3qrdOSFzMJIIFlkKu+Y9w4LaqINrkMqtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787785522; c=relaxed/simple;
	bh=ihEFNvdsKZLFllAnEFHRtIRIdEUMLnHYDqRmMESDYIE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=HxO5D3vmZdT1DpjD49KTEAfHeZoZrQoNaPeLviNZKnKMmuP5Sa4kzO6Pc4T+z7ldYZX95n8teA7tu6L+2AhM6IFuJeE3vpXz4yDvrADj/aAltCb7MTG6J0DybqNATeRd/AReGCvFCQIhW5AeqVfYNZauK8wquEdzPlO91+jtVLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PfpY1HM/; arc=none smtp.client-ip=209.85.215.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PfpY1HM/"
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cb6cf425e86so1899309a12.1
        for <loongarch@lists.linux.dev>; Wed, 26 Aug 2026 16:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787785519; x=1788390319; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=7O76V/eNZATQNVf7YqKvmEoyxMF4aKASfVXbmkJmYVA=;
        b=PfpY1HM/jhwTJHop1Gka6MV8B9XLq46Dg5bxIWqEBtVHgkoYesa6pztaq+NRSJCyIb
         fQxOkUB8saVSqEGEI9Gx3YDCGJwbaaBExfrMMkIof6kIsICot18x4ohJ5lEWlx0eIs6S
         +FgqqHBJj/uqlpCVmcom5B76xRbqyq1H+XKRLM1sTIwpQxBo7HFkHR/wU1qCI954z2xG
         eTqMa0DmAw8RNvV0ijhBHwP/WX8xDDpTLVtWCCsZvZ7R7SY7ch1tvFBeCQlIQlhzwE7C
         OlD2+4DaDd+5iQTASCpwsrL0RlMJCEcKphB/mVK95vs89MZtu60cFQxdS+AlLHt/Srdm
         Nqkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787785519; x=1788390319;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7O76V/eNZATQNVf7YqKvmEoyxMF4aKASfVXbmkJmYVA=;
        b=h+7cDzkPmjM53Y9ovVial/h1KvwvGsnFvxlFW3XP+/PSCVi0csmDxbhXXF85uRVfb0
         GzmPTN8EcJduuL4Mux/vsH0H+2U4TFMz++m9ypzKx7c7CrjNtHTnWrxM19gslY5sNDBd
         P3/ojDj8RHwyBau11K0rstJZxVbJhoJvZX5acgZigEdti3iIxqATIX5L+bwGF9VLmBLR
         s42xxUMzXsKF9pzNKS5EwTKRRnqd22poAgGCDiJke9QX9UMgWw0Ko9BWUUbDftBVvP7D
         VjYTDveSqZ9K33QJ1oYYT8aUXJbKSQFWkGmtpHs8ycSuf4a35NSoAEtYh/a++j7XGQNT
         H6lw==
X-Forwarded-Encrypted: i=1; AHgh+RqzUXTQRG3GuYbbRYlKFQkOyeGeIfvCvm2Yx8rqAxDiZ8yJPz3SOCWJ1GCeUl4oOdGv4bwmBIRP1eE=@lists.linux.dev
X-Gm-Message-State: AFuF++njPFNKSjCXQoBnG/V3/cJCxuk7OyO9RuMYm1RXZuR9i46XQSVo
	gmG2hhkPHzEc9p054iZFIh9wSVcNVYR19Zu7gf/vUSz9DULnT7pueBjJAQD7lnfHi0NQDLFZAgD
	a8eRHVg==
X-Received: from pgby7-n2.prod.google.com ([2002:a05:6a02:6507:20b0:cbe:9dc7:9ee8])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:6f03:b0:3cd:9f0b:f788
 with SMTP id adf61e73a8af0-3cf83d1ef40mr22810769637.12.1787785518656; Wed, 26
 Aug 2026 16:05:18 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 26 Aug 2026 16:04:54 -0700
In-Reply-To: <20260826230511.972824-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260826230511.972824-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.887.g758fc8c411-goog
Message-ID: <20260826230511.972824-4-seanjc@google.com>
Subject: [PATCH 03/20] KVM: selftests: Use vm_alloc_page_table() to allocate
 LoongArch page tables
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
	linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, 
	Ritesh Harjani <ritesh.list@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Now that KVM_GUEST_PAGE_TABLE_MIN_PADDR == LOONGARCH_PAGE_TABLE_PHYS_MIN,
use the common vm_alloc_page_table() instead of open coding the same.

Opportunistically drop the assert that the allocation succeeded, as the
allocator itself guarantees success.

For all intents and purposes, no functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/lib/loongarch/processor.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/tools/testing/selftests/kvm/lib/loongarch/processor.c b/tools/testing/selftests/kvm/lib/loongarch/processor.c
index 47bbde3e205a..fcd41bc6fbda 100644
--- a/tools/testing/selftests/kvm/lib/loongarch/processor.c
+++ b/tools/testing/selftests/kvm/lib/loongarch/processor.c
@@ -9,7 +9,6 @@
 #include "processor.h"
 #include "ucall_common.h"
 
-#define LOONGARCH_PAGE_TABLE_PHYS_MIN		0x200000
 #define LOONGARCH_GUEST_STACK_VADDR_MIN		0x200000
 
 static gpa_t invalid_pgtable[4];
@@ -57,9 +56,7 @@ void virt_arch_pgd_alloc(struct kvm_vm *vm)
 	child = table = 0;
 	for (i = 0; i < vm->mmu.pgtable_levels; i++) {
 		invalid_pgtable[i] = child;
-		table = vm_phy_page_alloc(vm, LOONGARCH_PAGE_TABLE_PHYS_MIN,
-				vm->memslots[MEM_REGION_PT]);
-		TEST_ASSERT(table, "Fail to allocate page tale at level %d\n", i);
+		table = vm_alloc_page_table(vm);
 		virt_set_pgtable(vm, table, child);
 		child = table;
 	}
-- 
2.55.0.887.g758fc8c411-goog

