Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8738F4ACC74
	for <loongarch@lists.linux.dev>; Wed,  2 Sep 2026 16:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788367295; cv=none; b=kFJuswKeo5kPILRM0OLFfXGDAuAJAmw8w30/GjnbQF+QBLWQ9COZRagGE4kRckkXXnTs1Sk9sANcv5AXn/8PNILATmL3dqBsoMy2a52DnKv+V+SqLV4bvY/Nxwcq1cJaXtCXO5A47AWfWTbHRI885cg6zAvz9WjO0JJ3lyVxpgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788367295; c=relaxed/simple;
	bh=sdY9q2BfDSeykJcP8/5Cy+uZ5jMK/dC9tNYwEHAyn2Q=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=GNJjZzPzZpMxThL3AYjHbsHExia6kJTODhCrVweQato27n0S+l6SbtL0brLZjexNKf9Uq/USaHIZYL8lMPAB8ddJ9OVedlSSu2ZStOCLMEoybU9vT0psp+qMidUTYBXu2z9CJITm1q/LJs7h9rB1Kzvms2G7uiP1Cmdprai5S5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FQUOiJgZ; arc=none smtp.client-ip=209.85.216.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FQUOiJgZ"
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-396b9ef3070so2245191a91.3
        for <loongarch@lists.linux.dev>; Wed, 02 Sep 2026 09:41:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788367291; x=1788972091; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=wh/M14gjNPKIhJHces0NPAZ6Z3gj1daHrmdTKDJlvdI=;
        b=FQUOiJgZhqypHqL9DeSnc6Z+uhvZ5mpDCNnE9akBBLd6NGP067BBsaim6FPhjQeRZU
         sRxk1Q++yHWHWUqRu37O2sUGMh6mZB6LWgHag4e8xgDLqvcYxdFMwfil7OpHPL+bxryC
         1ui8d+11NcSEnHZOc7eFxd6ov8spDfR3E0Qbr+RKm4W7ldrFzD45ytUmn2ETitukm6T1
         8sL+vGvBnadJXnwlItO2E1eKIRPiUEM34p+mRsu0OiLR9vkY/kgX2rkxZH+vtM0O6s9Y
         7vfVGcDUd8X5hDypf/khXfr3LP5zRynyNt6kLUuW9TrJhPXjB+4sJbE9QFx3vVPDF6hv
         DJ7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788367291; x=1788972091;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wh/M14gjNPKIhJHces0NPAZ6Z3gj1daHrmdTKDJlvdI=;
        b=DQPMppj++fky+8Q4CERwoIs59Dz+Aaedat7mHJCqOgt5RJbpK2ExPI2TSrGSwyTOX4
         G0tCbOWt+d2E1HhmTgwEfQm37rotKcnZ4IRPUXVD1aCdhEdccL4RdZ9KxrVR7OB4Q9MW
         uKUIoRPdT7d23iPcWhD0cdn1eoDs5LVGovKKlXfeOBuH6pgCU7bIYojY1fHWs2NIqdM/
         JF64eOqK5YIWOiMCC2miLN4HqrmewobXyWpUwRAspokIgn7zadacGQHbNZ/T5c2WkdQZ
         sPhmTJde2Q8wpyO73F55ZIxX+xROrxhWe/0/DhJSzSrssNkY+FffUqrLRzBOe4dG/sVp
         DnjA==
X-Forwarded-Encrypted: i=1; AKwUvByFBPk4Rl4y0yVkNWqSWXdKAj91TbqjiteBm/p0R5JI9atoHoLJmLr9lDQXQn2XKzef9UcIYTjNlUM=@lists.linux.dev
X-Gm-Message-State: AFuF++loKMu2VbFReUb6yPzYnKHdEzZ6KWIXAVkPWCdV04cwUhvbOZRv
	m86vo79MoIVDqWxQ5V/PHV7+c59Z0b6MKzjofXCUd+gWtZuttbnjPqGrZRh/0MwzoJy3ae2Jq5m
	yIB5O+g==
X-Received: from pjbbt18.prod.google.com ([2002:a17:90a:f012:b0:396:5f0e:9c23])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4c52:b0:38e:6aa7:68ad
 with SMTP id 98e67ed59e1d1-39aedf7c6aemr8714453a91.5.1788367291013; Wed, 02
 Sep 2026 09:41:31 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed,  2 Sep 2026 09:41:08 -0700
In-Reply-To: <20260902164123.2546762-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260902164123.2546762-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.966.g6673acef38-goog
Message-ID: <20260902164123.2546762-6-seanjc@google.com>
Subject: [PATCH v2 05/20] KVM: selftests: Use goto instead of do-while to
 retry finding unused physical pages
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

From: Nicholas Piggin <npiggin@gmail.com>

Rework the core loop of the physical page allocator to use a goto instead
of do-while loop when retrying with a new base address.  The do-while loop
obviously works, but it obfuscates the success vs. failure paths, and in
general is convoluted.

For all intents and purposes, no functional change intended.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
[Rebased to latest mainline tree]
Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
[sean: separate from alignment change, use enomem label, write changelog]
Tested-by: Itaru Kitayama <itaru.kitayama@fujitsu.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/lib/kvm_util.c | 32 +++++++++++-----------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
index b071d77dd301..bbf6d7684c0c 100644
--- a/tools/testing/selftests/kvm/lib/kvm_util.c
+++ b/tools/testing/selftests/kvm/lib/kvm_util.c
@@ -2049,23 +2049,15 @@ gpa_t __vm_phy_pages_alloc(struct kvm_vm *vm, size_t nr_pages, gpa_t min_gpa,
 	TEST_ASSERT(!protected || region->protected_phy_pages,
 		    "Region doesn't support protected memory");
 
-	base = pg = min_gpa >> vm->page_shift;
-	do {
-		for (; pg < base + nr_pages; ++pg) {
-			if (!sparsebit_is_set(region->unused_phy_pages, pg)) {
-				base = pg = sparsebit_next_set(region->unused_phy_pages, pg);
-				break;
-			}
+	base = min_gpa >> vm->page_shift;
+again:
+	for (pg = base; pg < base + nr_pages; ++pg) {
+		if (!sparsebit_is_set(region->unused_phy_pages, pg)) {
+			base = sparsebit_next_set(region->unused_phy_pages, pg);
+			if (!base)
+				goto enomem;
+			goto again;
 		}
-	} while (pg && pg != base + nr_pages);
-
-	if (pg == 0) {
-		fprintf(stderr, "No guest physical page available, "
-			"min_gpa: 0x%lx page_size: 0x%x memslot: %u\n",
-			min_gpa, vm->page_size, memslot);
-		fputs("---- vm dump ----\n", stderr);
-		vm_dump(stderr, vm, 2);
-		abort();
 	}
 
 	for (pg = base; pg < base + nr_pages; ++pg) {
@@ -2075,6 +2067,14 @@ gpa_t __vm_phy_pages_alloc(struct kvm_vm *vm, size_t nr_pages, gpa_t min_gpa,
 	}
 
 	return base * vm->page_size;
+
+enomem:
+	fprintf(stderr, "No guest physical page available, min_gpa: 0x%lx page_size: 0x%x memslot: %u\n",
+		min_gpa, vm->page_size, memslot);
+	fputs("---- vm dump ----\n", stderr);
+	vm_dump(stderr, vm, 2);
+	abort();
+	__builtin_unreachable();
 }
 
 gpa_t vm_phy_page_alloc(struct kvm_vm *vm, gpa_t min_gpa, u32 memslot)
-- 
2.55.0.966.g6673acef38-goog

