Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 754BE29617D
	for <loongarch@lists.linux.dev>; Fri, 17 Oct 2025 00:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760661204; cv=none; b=UYJrPO85fx6hzUDYuDzv3EXFaspNOGjYVesGnvU/uWsXIpZqn92Q7E2Fr3msVngy3oHp0RvjzDNNy7kKaRaAh8SOxbOG7t6mSqIJHAOPOHWqGHrKTeuyQROwnsqlwdcoRqZ23/8/SAARJ3YfWPhls5hHTvJvWjkItL0/ADZ910E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760661204; c=relaxed/simple;
	bh=yaQKyTxksrTJX2fl14PtTN0UzNHo3LiOiMMysefNVFI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=K5SYj4y4cEnV1J8NBjpVAVUQc5ZOfLfhHAbmiJCezc7Ydwy41cPcNXKqFFMZpUi93jwZg3unCedyYR0ngp8dWMdde053BR5sBYqMiIiTKVi9E6kUlKt9mfO3zwTt3gAfl5Xg6uDamo3pAQCANQmtt8asL6tmir4mYR2rPKX2n0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gn50R/3x; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gn50R/3x"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-33bcb7796d4so677239a91.0
        for <loongarch@lists.linux.dev>; Thu, 16 Oct 2025 17:33:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760661202; x=1761266002; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=6nFGgJBVWEpkJy+c6A8c/BAOcJuYsJfcEhqI0sTwd+k=;
        b=gn50R/3xyVgZhj34xX2yZOfBeagnVYksqSRG8/jNcFb065Q1zXmDBrPWEpJzwoJThV
         TvXn2Prh7OsrmREDnFa+ynKM0yK0dvtqU92AaZG42+mIGYn/hkCFjVEUjwGIQHyrTAOK
         pJ0guSHJhuzZAHTHkMUb3KhvzLAEgwWR3x5mVvjAUx2Gm2wHWbn3Zo/9A24GdSmg7e7/
         i8xEZHhVg7mWXsCWCdotUvYusRBuNM0kdErP1clMC2GtC9wxRvY/HL9iTE2DQxi8/6UJ
         pOTV9LkVz5W86bmBEYD4rwbiNJCYMZrm+GMEn59a3jaoZe0Fe6jC+e3EUPKP5RqmtlwA
         yaGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760661202; x=1761266002;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6nFGgJBVWEpkJy+c6A8c/BAOcJuYsJfcEhqI0sTwd+k=;
        b=OYkrftTosWYfq0UO9yk9HnaL1UU86EiH1f1Shm4g2CRYPbzFsdXZ13mIs/NsIE/Atu
         P9ARpqfxQFh187CRmtAwZoioZqKIWH1Qo0aX20AwNZwyafONlHDXobLOQqBkBPwZUsiE
         3qGYUBdC7bGV87c4iWowKIv9J78RE2ZCB5rGCMBSl1DLWfi0t81VFTZYOjhDef7Zz4bS
         CCG+yk7sX/r2+5t469XtqQRmRkDHktuIAx3UduQtHakpdmKrbQif7lN40zhM7bHUOc6z
         zFZq1IyaS9RpbXgEX2zNyQfr4+ZUDrmryWEoZVJ6YptsWyHcCU4yvEHLdDvGFxYJO/Iy
         naWQ==
X-Forwarded-Encrypted: i=1; AJvYcCWd1ia0h+Nm0cM0I4KswWQqEhE8sQb8PV10Os+xhmKn5IIP7Xcz2itXoKmLGDDMKRfkzbaYl56RS0I=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz29rHV8HdKnUPo4VNWhgAhtbmrDLj50CYar7WB2zkiuvNNmoNa
	EE2npR0Vj6+n6S3eHsN13TgO5JKdbGaXkFgjRm7XwzgBk5+W/a5yuVf1hWiSnANP5F+rbgEWHpO
	C/XlmgQ==
X-Google-Smtp-Source: AGHT+IGwUk2DKc/Clop/mYKkbeytMt0iZD/Bzj0bONucI419CZOE9/NPfh2luTSi9dr6fi1GHUAnQKjomOI=
X-Received: from pjnu19.prod.google.com ([2002:a17:90a:8913:b0:329:ec3d:72ad])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4fc6:b0:330:6d5e:f17e
 with SMTP id 98e67ed59e1d1-33bcf8faaeamr1865014a91.24.1760661201850; Thu, 16
 Oct 2025 17:33:21 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 16 Oct 2025 17:32:37 -0700
In-Reply-To: <20251017003244.186495-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20251017003244.186495-1-seanjc@google.com>
X-Mailer: git-send-email 2.51.0.858.gf9c4a03a3a-goog
Message-ID: <20251017003244.186495-20-seanjc@google.com>
Subject: [PATCH v3 19/25] KVM: TDX: Assert that mmu_lock is held for write
 when removing S-EPT entries
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Sean Christopherson <seanjc@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, "Kirill A. Shutemov" <kas@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, x86@kernel.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>, 
	Kai Huang <kai.huang@intel.com>, Michael Roth <michael.roth@amd.com>, 
	Yan Zhao <yan.y.zhao@intel.com>, Vishal Annapurve <vannapurve@google.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Ackerley Tng <ackerleytng@google.com>, 
	Binbin Wu <binbin.wu@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"

Unconditionally assert that mmu_lock is held for write when removing S-EPT
entries, not just when removing S-EPT entries triggers certain conditions,
e.g. needs to do TDH_MEM_TRACK or kick vCPUs out of the guest.
Conditionally asserting implies that it's safe to hold mmu_lock for read
when those paths aren't hit, which is simply not true, as KVM doesn't
support removing S-EPT entries under read-lock.

Only two paths lead to remove_external_spte(), and both paths asserts that
mmu_lock is held for write (tdp_mmu_set_spte() via lockdep, and
handle_removed_pt() via KVM_BUG_ON()).

Deliberately leave lockdep assertions in the "no vCPUs" helpers to document
that wait_for_sept_zap is guarded by holding mmu_lock for write.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/tdx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
index e517ad3d5f4f..f6782b0ffa98 100644
--- a/arch/x86/kvm/vmx/tdx.c
+++ b/arch/x86/kvm/vmx/tdx.c
@@ -1711,8 +1711,6 @@ static void tdx_track(struct kvm *kvm)
 	if (unlikely(kvm_tdx->state != TD_STATE_RUNNABLE))
 		return;
 
-	lockdep_assert_held_write(&kvm->mmu_lock);
-
 	err = tdh_mem_track(&kvm_tdx->td);
 	if (unlikely(tdx_operand_busy(err))) {
 		/* After no vCPUs enter, the second retry is expected to succeed */
@@ -1758,6 +1756,8 @@ static void tdx_sept_remove_private_spte(struct kvm *kvm, gfn_t gfn,
 	gpa_t gpa = gfn_to_gpa(gfn);
 	u64 err, entry, level_state;
 
+	lockdep_assert_held_write(&kvm->mmu_lock);
+
 	/*
 	 * HKID is released after all private pages have been removed, and set
 	 * before any might be populated. Warn if zapping is attempted when
-- 
2.51.0.858.gf9c4a03a3a-goog

