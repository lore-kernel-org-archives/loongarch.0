Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BCE41C2330
	for <loongarch@lists.linux.dev>; Wed, 29 May 2024 18:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717005927; cv=none; b=qGRaADkRKQHa2Jq1txcxJv5Q7GmG7p4qU+BRuv9KxOeHqgrp/nhS3BEvgj2FQRlxTAQUbLnnYW/4vZifMYSS84tVi3Hs8mYrtLBEDC58ssZqZjws9aW3Jc0heTfTOy3xsOMLNJR6JXe4cW9/Y2k1/qYYETb+WpsPQ7la+LHXMHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717005927; c=relaxed/simple;
	bh=LSBrwS6oby84HQacrqjfwftAjZHXaXKkGHYxsFQ9F2c=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=SR+VMrFNAMwRzuecPnDKeYXOgy1EUu02Lrui92nx7tIZuV9HBs8Elp5cjD4rHii87JMmUBgwUeNfvk1pf8Xw8HsKoIGntGBTVRNp67rY9hBCe3SLzJBT7/zsxPC9lx2ek2f/e2wDIAA0XkBG7JueTtpS60ohRYTmh4bqNrt3DPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uqfwiQpY; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uqfwiQpY"
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-62a2aec8521so35470417b3.0
        for <loongarch@lists.linux.dev>; Wed, 29 May 2024 11:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717005923; x=1717610723; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=K/D/1FA4Uw1YrzG6+cN1+7larQcduYYAcSD+7tGLFpU=;
        b=uqfwiQpYaCS26bVASVOtaTeX4K4swgsyOjK8VnjVL9veOuBCHacPb1k0kSEq0N0SaL
         TB7fHf9Qf18FBzvKR/KOnmx2YsGXrobJZt0SJ5cbVEbugqDIeC3BkNGVtVyEntra77kK
         S1kdhxBb3kAzeZI9UWKVajoRGWu/L0b+K4cCFxHVWqevD/u0evHA8j3Pk0rg/mclm6Fr
         qB4XNE9oWU/WqWIqBl4RrzqjSr/JPvKEvY24kM8V/p8ia68N4BCHIpEaBanPNTiJvTvZ
         4314z85IQqefoZ+Qywt/dU46XQqSkisQmEV5wAjj/oSNXRU6DnKSRBJGjz41OqN00Hlv
         +rzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717005923; x=1717610723;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K/D/1FA4Uw1YrzG6+cN1+7larQcduYYAcSD+7tGLFpU=;
        b=ePSQY9cl3Ny+ZjRhrkqcMhUr6uiRDu+vxmCaSs6EAOEPCic1FqgW5rymP9i/nvXNIs
         Hs2zYl5Td3nPxkp4pBCOtUQI6fGuFe/focqD7oFuc1koZ/b2E3jR2ob1pCZM0qM3dp3g
         PLVLdBB+Gb/vTh2NW4afYjTuAX+j/bGTzaaflNX9HuK1z2cmsVSt+6RqKLNRq2ADGStI
         hXzwRKeh7/ibVOy6vzPD7sm0aGlLVXnvkEfOsUyR6dKQ9So1JlalYcfrXUxqTXchPA0c
         Fub4rM/V/e3nW9zVTZ80EcAGBSDzfAkorHsi+sC+gRh7qQiYmIPa+v9O+/eATTlNlEoP
         5hmw==
X-Forwarded-Encrypted: i=1; AJvYcCVqlVZ/U0YucPo+WGKrGMm1GTNf5z5FNhMXQ2a1JQreILJOH56gnCEWvFo02gXfZHxVRlQ/fNf/+GS+So7virpu759VskEtkltA
X-Gm-Message-State: AOJu0Yy7D31IRObDVqIae/4rcE5uIMeAa3zFwVNP3gtwAvG9JRUiVzV+
	tzoe1oSSLD7g1TOXjjq1jUeh7rrCgS3/jum44sk+hGwQTZGOO8ha1VO5IXF9PonuCuHMU5Hq1OY
	vd1+0FrN6fSEnl6dkKA==
X-Google-Smtp-Source: AGHT+IFSnjz7OFMOWeVI0MI1apHPovJ16H+bOSMdUdDO7KbUX1eLZ6QqkPj6sVplMDT0O6FTB3I8hMUTstLZ6+/c
X-Received: from jthoughton.c.googlers.com ([fda3:e722:ac3:cc00:14:4d90:c0a8:2a4f])
 (user=jthoughton job=sendgmr) by 2002:a05:690c:6010:b0:61a:e7f7:a4cc with
 SMTP id 00721157ae682-62a08dd7631mr39296497b3.4.1717005922981; Wed, 29 May
 2024 11:05:22 -0700 (PDT)
Date: Wed, 29 May 2024 18:05:09 +0000
In-Reply-To: <20240529180510.2295118-1-jthoughton@google.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240529180510.2295118-1-jthoughton@google.com>
X-Mailer: git-send-email 2.45.1.288.g0e0cd299f1-goog
Message-ID: <20240529180510.2295118-7-jthoughton@google.com>
Subject: [PATCH v4 6/7] KVM: arm64: Relax locking for kvm_test_age_gfn and kvm_age_gfn
From: James Houghton <jthoughton@google.com>
To: Andrew Morton <akpm@linux-foundation.org>, Paolo Bonzini <pbonzini@redhat.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Ankit Agrawal <ankita@nvidia.com>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Bibo Mao <maobibo@loongson.cn>, 
	Catalin Marinas <catalin.marinas@arm.com>, David Matlack <dmatlack@google.com>, 
	David Rientjes <rientjes@google.com>, Huacai Chen <chenhuacai@kernel.org>, 
	James Houghton <jthoughton@google.com>, James Morse <james.morse@arm.com>, 
	Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Oliver Upton <oliver.upton@linux.dev>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Raghavendra Rao Ananta <rananta@google.com>, Ryan Roberts <ryan.roberts@arm.com>, 
	Sean Christopherson <seanjc@google.com>, Shaoqin Huang <shahuang@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Will Deacon <will@kernel.org>, Yu Zhao <yuzhao@google.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-mm@kvack.org, 
	linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
	loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Replace the MMU write locks for read locks.

Grabbing the read lock instead of the write lock is safe because the
only requirement we have is that the stage-2 page tables do not get
deallocated while we are walking them. The stage2_age_walker() callback
is safe to race with itself; update the comment to reflect the
synchronization change.

Signed-off-by: James Houghton <jthoughton@google.com>
---
 arch/arm64/kvm/hyp/pgtable.c | 9 ++++-----
 arch/arm64/kvm/mmu.c         | 8 ++++----
 2 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtable.c
index 9e2bbee77491..eabb07c66a07 100644
--- a/arch/arm64/kvm/hyp/pgtable.c
+++ b/arch/arm64/kvm/hyp/pgtable.c
@@ -1319,10 +1319,8 @@ static int stage2_age_walker(const struct kvm_pgtable_visit_ctx *ctx,
 	data->young = true;
 
 	/*
-	 * stage2_age_walker() is always called while holding the MMU lock for
-	 * write, so this will always succeed. Nonetheless, this deliberately
-	 * follows the race detection pattern of the other stage-2 walkers in
-	 * case the locking mechanics of the MMU notifiers is ever changed.
+	 * This walk may not be exclusive; the PTE is permitted to change
+	 * from under us.
 	 */
 	if (data->mkold && !stage2_try_set_pte(ctx, new))
 		return -EAGAIN;
@@ -1345,7 +1343,8 @@ bool kvm_pgtable_stage2_test_clear_young(struct kvm_pgtable *pgt, u64 addr,
 	struct kvm_pgtable_walker walker = {
 		.cb		= stage2_age_walker,
 		.arg		= &data,
-		.flags		= KVM_PGTABLE_WALK_LEAF,
+		.flags		= KVM_PGTABLE_WALK_LEAF |
+				  KVM_PGTABLE_WALK_SHARED,
 	};
 
 	WARN_ON(kvm_pgtable_walk(pgt, addr, size, &walker));
diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 8337009dde77..40e7427462a7 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1775,7 +1775,7 @@ bool kvm_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
 	u64 size = (range->end - range->start) << PAGE_SHIFT;
 	bool young = false;
 
-	write_lock(&kvm->mmu_lock);
+	read_lock(&kvm->mmu_lock);
 
 	if (!kvm->arch.mmu.pgt)
 		goto out;
@@ -1785,7 +1785,7 @@ bool kvm_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
 						    size, true);
 
 out:
-	write_unlock(&kvm->mmu_lock);
+	read_unlock(&kvm->mmu_lock);
 	return young;
 }
 
@@ -1794,7 +1794,7 @@ bool kvm_test_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
 	u64 size = (range->end - range->start) << PAGE_SHIFT;
 	bool young = false;
 
-	write_lock(&kvm->mmu_lock);
+	read_lock(&kvm->mmu_lock);
 
 	if (!kvm->arch.mmu.pgt)
 		goto out;
@@ -1804,7 +1804,7 @@ bool kvm_test_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
 						    size, false);
 
 out:
-	write_unlock(&kvm->mmu_lock);
+	read_unlock(&kvm->mmu_lock);
 	return young;
 }
 
-- 
2.45.1.288.g0e0cd299f1-goog

