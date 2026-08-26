Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3BAA3C4542
	for <loongarch@lists.linux.dev>; Wed, 26 Aug 2026 23:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787785545; cv=none; b=Vh/axf3iQYLpJC4scrpL4y37sRhG3FOSU0SRvqnPIISJBUoS3snF7wtqWI4vC4SfzJ49Q4fCUARvKNd+s2CcDWKXL5TJJzLMgFfqUIeT/2mGbybE1shRvELjGDw6oBBcX/J2wFuA6AxUw/2MUxecOwYKR6JchWCVBMXhbsuP9nY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787785545; c=relaxed/simple;
	bh=lKXQlA+oesJrtxD7c4frkF+V9E3fuZX9xGPyHMdrXvs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=MU0mIanWmx5Zq/+7ZofECVfRKga1ypnzUmIwSF2YcVyy5HTuMHgtk4RMNNuIKzYA0msExgp//a8hF03qt/+C0aatINZH9hzFu8HAaa3z17S8s/qjZfbolKccjiz4lIXMXNUuslAulnESK+AzNPrhO0/oCtEYNyTT1NbgcmUI7pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ORdFqVKD; arc=none smtp.client-ip=209.85.210.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ORdFqVKD"
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-84e1da97175so2098760b3a.0
        for <loongarch@lists.linux.dev>; Wed, 26 Aug 2026 16:05:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787785538; x=1788390338; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=heZN2DuvfOxZirlVdynH6v1916EkfGJKRv4e6fIVLjM=;
        b=ORdFqVKDcZ1C531QJKUhNHNOw4b3PMIa2lW1C1WcS+x1uL+BiqXjNZV7CWbM+c08Ar
         2ow41vypLvRQhkRbj6apOyAL5unbc5+RnuI6DNgoBPEe5vW2hlR5grsw5WGKpxiFBGWt
         QLL6K6WTmCE1eS4g2aGx7e1rXufl1wnZHn1GdplnctyqmIgW+e9GkI4tDrDfzi6mYBIW
         Bj3LZ+nXVjchGQts6TTGQEL2D9c19zB0RNrN99BxEVvx93Js69MUVbh4ivKBPA19IJwY
         u7cGJP/py8fG5GXUfWKH+nGOv1Sf1FQHUQz6KLucibuALoJXBDEf+X8dnuwj9UHRT7rJ
         Z4XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787785538; x=1788390338;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=heZN2DuvfOxZirlVdynH6v1916EkfGJKRv4e6fIVLjM=;
        b=M7g/ErN97JKvWPgBD6BIXosK8M+/e7bQo7LX1R3r7P8MGhfIASxuwN9aflHkh+R0xr
         825wb+9945LHv0/UL1t9jsNy0kjAmo1PGB9kL6+leKen4g2JY3Dss2ufjKbGDo+0WrLQ
         +jjJlYcEY+7PNf9CyY/KQV9w1AypFX1LbykOxoT1fKK5zSt3M2Evr8uGn6u22Ut1/TM3
         ccFDBIFDD5m3uK3SVmp7CM82JD/0uS2qJorrpKiOApIXf9wOr7ODHftwxn9D3jyUDXdH
         YlaAl4A0UsC3b1qbwN6QPLX9QV8rVbrJyrkR75iCXiAtXvah0MaGJD2hM38CJKiCGisY
         vfGA==
X-Forwarded-Encrypted: i=1; AHgh+Roei+bXr2bEXWhDiOHn3nGJ9thvS9TP5jCrNGzez5xNrQW2SqCl/r6Mk9E/hf9fjwPgkAfGCjETVGs=@lists.linux.dev
X-Gm-Message-State: AFuF++kjoFrhaWICg1icKIWqNREGHzNudFNNbLK2YP0sVzKD9G1oKg8G
	PKeZ7VVbe+u/EyfQnNTNrQBbOCfr3cyYWYQQCw7XuTkqwsuS0wlVSo1Po9xaoUUOZ6s0D2HYJOV
	viGfe9A==
X-Received: from pgce14.prod.google.com ([2002:a05:6a02:1ce:b0:c9e:3c0b:5818])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:2013:b0:3d1:3c2:85b6
 with SMTP id adf61e73a8af0-3d103c28dfdmr4039415637.5.1787785538103; Wed, 26
 Aug 2026 16:05:38 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 26 Aug 2026 16:05:09 -0700
In-Reply-To: <20260826230511.972824-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260826230511.972824-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.887.g758fc8c411-goog
Message-ID: <20260826230511.972824-19-seanjc@google.com>
Subject: [PATCH 18/20] KVM: selftests: Use TEST_ASSERT(), not assert(), in vm_get_mem_region()
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

Use a proper selftests TEST_ASSERT() in vm_get_mem_region() so that bad
input is guaranteed to fail the test, and with the standard error message
format.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/include/kvm_util.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/include/kvm_util.h b/tools/testing/selftests/kvm/include/kvm_util.h
index 783f060faf9e..a0cd1b6598d4 100644
--- a/tools/testing/selftests/kvm/include/kvm_util.h
+++ b/tools/testing/selftests/kvm/include/kvm_util.h
@@ -198,7 +198,8 @@ memslot2region(struct kvm_vm *vm, u32 memslot);
 static inline struct userspace_mem_region *vm_get_mem_region(struct kvm_vm *vm,
 							     enum kvm_mem_region_type type)
 {
-	assert(type < NR_MEM_REGIONS);
+	TEST_ASSERT(type < NR_MEM_REGIONS,
+		    "Invalid memory region type '%u'", type);
 	return memslot2region(vm, vm->memslots[type]);
 }
 
-- 
2.55.0.887.g758fc8c411-goog

