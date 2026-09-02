Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 799F64AE12B
	for <loongarch@lists.linux.dev>; Wed,  2 Sep 2026 16:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788367317; cv=none; b=BaVVxrNuqzykI8dBAlAHRBdKZiPVwAydaorGQlD2O6csJTJwj8twq9x/eXfuxwgG56MKsYd051sstQnZQdpPJl2c8EQC9FVTELu2XMaSK1MEv/TBHaFnF8KKpx3towSjRGow/TBJOVxk2gApRkgSHaAz3DffCmhsEs0vtIA0Q4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788367317; c=relaxed/simple;
	bh=OA10wlnKKQ7EEM6YlvfJ4xQQrgVCfQ10w2yj5EgWY/0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=uVQuVBSRA1fcZodFImvkVLPcxd8n3vc2F1fVCKHHaPMAr7bMhPY5SztwiX50sefE+KuCoPv36VcTtK7w1jKRJbDZf5vj3kLWNsr7YR9aXiB2Ph+FlqfON6C+GIr6FQ4rlHyzwqDHH56bhytKNnT/wiqkTGnthEzXJMy9pcEO/ME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rtZY6NOi; arc=none smtp.client-ip=209.85.215.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rtZY6NOi"
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-ca8aee88725so1989151a12.3
        for <loongarch@lists.linux.dev>; Wed, 02 Sep 2026 09:41:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788367304; x=1788972104; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=NSZqPcNxcDapPNldInB7JTSEZaOXSqhsga2ZRaSmlrM=;
        b=rtZY6NOidTPC0HnUKYESlDZMMIUkHY+r8nKKkFlzG58qDkLWXqMQybXPzRSyTVJWIa
         4wQa8pfwOYfghJiNQzUep7JxF+km0WYW2MmdrbxxUztODTuvpPGPR2ksfJVU1DaQPSUi
         P4uxHQ0i0dE9i6O9/Ihu1A18Sd2QLLgtk7T8LChIPJCMh2PwM3hqjQTaWR1JTo/9LpQA
         Q8uhtTsoMk/B2GRlpaZW75z3Xvp3vS1Gww5B02HVDDBXB4G4huq+78T+aft5d3Ffmc8L
         nUaacpDIc4Xk9Q9EVhjUrc37jbNpFAG82OcygdXRe0nBPF4yFqEOWYoAUdmvGKtsFyz6
         T8BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788367304; x=1788972104;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NSZqPcNxcDapPNldInB7JTSEZaOXSqhsga2ZRaSmlrM=;
        b=QXETCttNduWrr8XCdwJs2tyxYl46YT6yShrF84A5OOMoRBt/809m0KixeOSwfNtAxC
         OkNzFudfBWYlTExbbGTlrea3hpiSH0kwLeseKHGcb6cHL0kWWvwWardU7TVJTMn9JPfH
         gUwui5wfhGLRbDVgmGvmoK2o/gF2bBZdCvH3aKUXSQ79JQEjC2V29hG7W1H3OztrRs/o
         mVrQZ87xSuWAI/u2LudVollrYua04q2N+d0Lhs4eDOuHL+9paUTsf67yui59CbJJwNoB
         yfaLqH/v0X+YBjkK53zFciKDe0AEy0ITTU+IkPGvkaPAcKCZS4gBx6+wxsNeaDuA9ABw
         D1bQ==
X-Forwarded-Encrypted: i=1; AKwUvBxWqtlokUYCibLgbO8WviUaQUfrATUYmZvKfztPfkvmAyQZlan/AOXkOdSM4FnKMTyymD+V5r403qw=@lists.linux.dev
X-Gm-Message-State: AFuF++lJ0xy/X+4U0LnykP6HtOzFZ1qpq1Yj+FKQ3v3GY7Ki6qRs7Hsn
	/R9KRv+7uVHXtL7e8ZAcQ6EqNcQmckwNnRPtgGm1/avWBixwWAS1S3ViIBzFJ/RBUwnlHwZJfTt
	0CUEm6w==
X-Received: from pfbgv8.prod.google.com ([2002:a05:6a00:4e88:b0:853:9149:8801])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:238b:b0:85c:c8db:8e4b
 with SMTP id d2e1a72fcca58-85ed23dea9emr8785308b3a.6.1788367303872; Wed, 02
 Sep 2026 09:41:43 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed,  2 Sep 2026 09:41:19 -0700
In-Reply-To: <20260902164123.2546762-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260902164123.2546762-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.966.g6673acef38-goog
Message-ID: <20260902164123.2546762-17-seanjc@google.com>
Subject: [PATCH v2 16/20] KVM: selftests: Use TEST_EXTRA region in set memory
 region test
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

Use the TEST_EXTRA region/memslot in the "set memory region" test instead
of a custom memslot, so that the primary vm_phy_pages_alloc() APIs can be
reworked to take a region type instead of a raw memslot.

For all intents and purposes, no functional change intended, as
vm_override_mem_region() is barely more than a wrapper for
vm_userspace_mem_region_add().

Tested-by: Itaru Kitayama <itaru.kitayama@fujitsu.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/set_memory_region_test.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/kvm/set_memory_region_test.c b/tools/testing/selftests/kvm/set_memory_region_test.c
index dffe9654f45b..9d21594e2f81 100644
--- a/tools/testing/selftests/kvm/set_memory_region_test.c
+++ b/tools/testing/selftests/kvm/set_memory_region_test.c
@@ -116,9 +116,9 @@ static struct kvm_vm *spawn_vm(struct kvm_vcpu **vcpu, pthread_t *vcpu_thread,
 
 	vm = vm_create_with_one_vcpu(vcpu, guest_code);
 
-	vm_userspace_mem_region_add(vm, VM_MEM_SRC_ANONYMOUS_THP,
-				    MEM_REGION_GPA, MEM_REGION_SLOT,
-				    MEM_REGION_SIZE / getpagesize(), 0);
+	vm_override_mem_region(vm, MEM_REGION_TEST_EXTRA, VM_MEM_SRC_ANONYMOUS_THP,
+			       MEM_REGION_GPA, MEM_REGION_SLOT,
+			       MEM_REGION_SIZE / getpagesize());
 
 	/*
 	 * Allocate and map two pages so that the GPA accessed by guest_code()
-- 
2.55.0.966.g6673acef38-goog

