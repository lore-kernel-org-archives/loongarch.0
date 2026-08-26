Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6879B3D75D7
	for <loongarch@lists.linux.dev>; Wed, 26 Aug 2026 23:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787785539; cv=none; b=iYHPFGt/AWLJ7+kcC/Hkw6VBJAoBhyPfeK50WjThG9RJXdCL3ds0r1J2+yALQFbDVr7cRtVflZEQuca7sFR6g18PLBpvFoTMrcTxJZ2hd64VQHKSOoZQpEsk8Mq15SEFBmI3hrL/8zawUiZliK+/Ssv4VmCWt2Q5jvFAFf2H1y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787785539; c=relaxed/simple;
	bh=tI28fyZgaxj3QeLG5gsP33C411QZoueUpyjlmbF4icU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=SMnpeqhgcUMcAvqNmAoX7PUvhFHcA1UZ9nAmg16Em29HkdujhSp+gb8T3ZvGhegvSUMXSOohc+KGWrGagFuXEBZJdR1AVbvBg5G+40j5CLNig9OUvkQJtlJI3GN2+vV1+p70PUXftlpRU8+L9HlXnEX3zvKnqD9muvorxslRK6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=eh2E+nf/; arc=none smtp.client-ip=209.85.214.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="eh2E+nf/"
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cfa4e4684bso33247025ad.2
        for <loongarch@lists.linux.dev>; Wed, 26 Aug 2026 16:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787785535; x=1788390335; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=lK9hNNEVcV137VJifUj1j8FlSQZ8ZR6EJrURDAfa97I=;
        b=eh2E+nf/DxGTO4kAEQBN5maEyR0slWObEeBKlNIdi3RbClp+RpiRPnM3L6d7Wf0I3s
         MnQSq4OySDCxQrsTNWmSKhbl0iMlzvTxujTybX2PAXSbvg1NF69OyPvp9HVBHH8mie7c
         r04GYlvXAzFnN6feyHtt6pgn6vZLWM/YIohiD0thMlf3Z6//ZU9aDpSu3c4m0kjYETGF
         rql6oqryqwr+H+z5UwKEBIy1WebaNkbxmsG6RNBM/idZ0tW+OZ/JrZeM7HUAHdRz2L7T
         4YPyTU9PRZ3SOBcvurXwinEZSsBMnW8PZgd6/+qfy5IWJnS+ruab+4/L+ZxQGSRX2DzF
         vRdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787785535; x=1788390335;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lK9hNNEVcV137VJifUj1j8FlSQZ8ZR6EJrURDAfa97I=;
        b=EIcohIE9nsQxkNVMq+WfcmjSYcmieZ93PhOkkGoGrtEp5h5gK+ClrTEhd/OlcL2hSg
         zVY6ZR/r2iMfObEdCjTr4nfnCDn12yRaOl5wAPQFoFEVrDBYzq0BPUDLF1AI3CdOsM4Y
         NtHMLXGC7d/vc5itwXZwS4/ZmThL7dBC5J/Gi7CtwNf3usOS7VYqIGJSQLF9rNP4BXXh
         ANfCES2v7tcjlZoMRTcNkZF3fZNliRbYD5ow5A/z3vVh5dUis3XyBcs8KFpWaSFxatua
         rh8OGPkFcWpdQfRTb6c4Li7IdmKVLcslwkgLEg7+qr1ubSQdqN/0GOPzcQV8iSJtDapB
         E56A==
X-Forwarded-Encrypted: i=1; AHgh+Rp0wiJy6ZlIPAFBrmWYy3lVOZdN+R8MeWXNkF8VroNg0gBh/75RtrWqBQP9EisW4JTSXagAai4IJrM=@lists.linux.dev
X-Gm-Message-State: AFuF++mOmhJeXgeuX5s4H8bHwVR+LzRLBlL8Q6CX2w1cw6Tolkbxhyqi
	S6boOWdw74sxNTg9qm7tqe3uJg4qg1no+OQJu2oFvnrWb1lgi/2WNgqNf/BHQfhfZ6VIWUXjNJ3
	9wThYRA==
X-Received: from plblc16.prod.google.com ([2002:a17:902:fa90:b0:2ce:9b92:ec60])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:d4c7:b0:2ca:6d87:cda0
 with SMTP id d9443c01a7336-2d7079fa6d5mr157756405ad.6.1787785534676; Wed, 26
 Aug 2026 16:05:34 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 26 Aug 2026 16:05:06 -0700
In-Reply-To: <20260826230511.972824-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260826230511.972824-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.887.g758fc8c411-goog
Message-ID: <20260826230511.972824-16-seanjc@google.com>
Subject: [PATCH 15/20] KVM: selftests: Use TEST_EXTRA region in x86's smaller
 MAXPHYADDR test
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

Use the TEST_EXTRA region/memslot for x86's smaller MAXPHYADDR test instead
of a custom memslot, so that the primary vm_phy_pages_alloc() APIs can be
reworked to take a region type instead of a raw memslot.

For all intents and purposes, no functional change intended, as
vm_add_extra_mem_region() is barely more than a wrapper for
vm_userspace_mem_region_add().

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 .../selftests/kvm/x86/smaller_maxphyaddr_emulation_test.c  | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/kvm/x86/smaller_maxphyaddr_emulation_test.c b/tools/testing/selftests/kvm/x86/smaller_maxphyaddr_emulation_test.c
index 3dca85e95478..b21798a385ca 100644
--- a/tools/testing/selftests/kvm/x86/smaller_maxphyaddr_emulation_test.c
+++ b/tools/testing/selftests/kvm/x86/smaller_maxphyaddr_emulation_test.c
@@ -62,9 +62,10 @@ int main(int argc, char *argv[])
 	TEST_ASSERT(rc, "KVM_CAP_EXIT_ON_EMULATION_FAILURE is unavailable");
 	vm_enable_cap(vm, KVM_CAP_EXIT_ON_EMULATION_FAILURE, 1);
 
-	vm_userspace_mem_region_add(vm, VM_MEM_SRC_ANONYMOUS,
-				    MEM_REGION_GPA, MEM_REGION_SLOT,
-				    MEM_REGION_SIZE / PAGE_SIZE, 0);
+	vm_override_mem_region(vm, MEM_REGION_TEST_EXTRA, VM_MEM_SRC_ANONYMOUS,
+			       MEM_REGION_GPA, MEM_REGION_SLOT,
+			       MEM_REGION_SIZE / PAGE_SIZE);
+
 	gpa = vm_phy_pages_alloc(vm, MEM_REGION_SIZE / PAGE_SIZE,
 				 MEM_REGION_GPA, MEM_REGION_SLOT);
 	TEST_ASSERT(gpa == MEM_REGION_GPA, "Failed vm_phy_pages_alloc");
-- 
2.55.0.887.g758fc8c411-goog

