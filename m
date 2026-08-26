Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C64D3B777D
	for <loongarch@lists.linux.dev>; Wed, 26 Aug 2026 23:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787785530; cv=none; b=k4+O2m5MQPhhgksmAMrK6b05iDRA1xNdi8LQTZ9EeCL0RJBJMxsRzaLUJJ6NVoyvO/DXWBZCdfj7yqlDZ7P1UFjdTldugUg2uwUmPcuxt+tb5wOaecvE0ROzd58qHphTAqMEoftwoYLEeJaWH3pjgQh+sfPney/wU3J5lMf12LI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787785530; c=relaxed/simple;
	bh=3W6Dy3uU+CoTj5YuDL9UpW6yQwbWSR/ky+isWorLm6M=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=o5tE3Y4GE2RCl29OAsM4zC0Y0ND2Foptl3wQVJzbF4wIZ17vPlmal/rx49IZVARa9Kk2DLIhJuezPSmhY5H0gZwuAMwCpI5j3vQmUrTjSpAWYZLcqu0VVBaZYlVqe7EX2MuZmaWfkwYKIeCwDwzfH+OkbcCVvyk5mPr8G9m7bCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vbV1ACBT; arc=none smtp.client-ip=209.85.210.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vbV1ACBT"
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8486c3411c8so2004030b3a.2
        for <loongarch@lists.linux.dev>; Wed, 26 Aug 2026 16:05:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787785527; x=1788390327; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=O8gpVGaSftwEDfNK3yhe7P+6kzj8cM/DRvM4h41+9U8=;
        b=vbV1ACBTpIp74q1KUVxVKKsvANkmAEUqB5ZXJgdzw2OMQyraAWPAFSp9xXzOin+Uv2
         DXse681z1D+1fIfrqWGygCqhZnuM+eOZ2x7Le1QcD62Yf1Khv4hudn9TLfVtdJa4QW5U
         Z/OOmIxoNt9JfIMVqsKF1HcePagFJMReYR9qjT25DQHMUHDI8CLeASnUnpdyuqa3g5an
         uZY7jsv/Al1TSI+4MW8iJO1AKItmTZ0JWnvBXNY+hIyd9kdrjIabhAj4S/VWgKoYc2PK
         G956a5f46ss21PZ+tUNQsedXv0KWL+8bP0c/AFWt0kdY3GlwMS8plHoQknRJN8sYxqRj
         IQQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787785527; x=1788390327;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=O8gpVGaSftwEDfNK3yhe7P+6kzj8cM/DRvM4h41+9U8=;
        b=gYPLHDIEhvjKpZFzY9AFjy3b4g38AXWJArCeE3tELSH9B7c78Df9dd/99sjfDsF2lH
         QJfw7gi7OQ1kP17sTiqz4EYkFiDME3D7WLbEVdm0F8jy5HueMK9IgybyYgRzAR01FZCc
         P7eZ+czfr+MDRF6enpHjopqPj+ieRxkCKVQVSqbGtw8UhX5zhU70n0w4LSKsk9gnuYz9
         9jmWN/kBLh7OOyxgtredgO6TCIr67IMy5gI9zoD/5+H87G2fFqH/RrBnTQpp6+lyRM/L
         BQerkN0/MuXue9mUwxX9AiObh1Mjk2g5NBkH7TTSxjbhnyzs4sjl+MKDe3QHaBHmxd8Y
         4NzA==
X-Forwarded-Encrypted: i=1; AHgh+Rqvj4p/Lc837tNvxk+DeTRCOeUBW3kgHm6YSWYm+S7nsER9xbKWBQkajk0W+GJwE/c+FHf8MtaSk4E=@lists.linux.dev
X-Gm-Message-State: AFuF++nEUhqFJuQM5ws6zYMfX6+/ql9qsPZx9Dt3rvllDvqrFFfJtrfD
	pw+jGxF3A+wIt51LJQma3qaK0H5bqhK81GZNxAaOE9ffnjZ00Hd8oGTIb9ZmskmMXX+V8Ft4Ksv
	cbZOR8g==
X-Received: from pfpk15.prod.google.com ([2002:aa7:9d0f:0:b0:848:2e0e:62e])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:301e:b0:848:34ad:3d6c
 with SMTP id d2e1a72fcca58-853750ccf97mr20523023b3a.15.1787785527096; Wed, 26
 Aug 2026 16:05:27 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 26 Aug 2026 16:05:00 -0700
In-Reply-To: <20260826230511.972824-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260826230511.972824-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.887.g758fc8c411-goog
Message-ID: <20260826230511.972824-10-seanjc@google.com>
Subject: [PATCH 09/20] KVM: selftests: Use the innermost page allocator API in
 s390's IRQ routing test
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

Use the quad-underscores page allocator in s390's IRQ routing test in
anticipation of dropping the @min_gpa param from the primary APIs.

Note, it's not entirely clear that the test *needs* to use a very magical
@min_gpa, i.e. it's possible a more elegant solution exists.  But that's a
problem for a different day.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/s390/irq_routing.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/s390/irq_routing.c b/tools/testing/selftests/kvm/s390/irq_routing.c
index f3839284ac08..cd26cc1aed80 100644
--- a/tools/testing/selftests/kvm/s390/irq_routing.c
+++ b/tools/testing/selftests/kvm/s390/irq_routing.c
@@ -36,7 +36,7 @@ static void test(void)
 	};
 
 	vm = vm_create_with_one_vcpu(&vcpu, guest_code);
-	mem = vm_phy_pages_alloc(vm, 2, 4096 * 42, 0);
+	mem = ____vm_phy_pages_alloc(vm, 2, 4096 * 42, 0, false, false);
 
 	routing = kvm_gsi_routing_create();
 	routing->nr = 1;
-- 
2.55.0.887.g758fc8c411-goog

