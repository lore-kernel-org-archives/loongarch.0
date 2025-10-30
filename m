Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C7B2375741
	for <loongarch@lists.linux.dev>; Thu, 30 Oct 2025 20:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761855009; cv=none; b=sjLTmtyRRE1COT+wLATV1R4lZhoLhv1I7vl8bh/7ZcRR87Mzov6OplteJrXnB9WS2yEMUzZdXAPQP6PjU8j04e1GfHESxThclV3g7mzRAvylyyC4Yci9b0+xozhbC2DrkFws362vvumxkJ8ZF7sUmOHVZN/0u5mu9Kgo/IYqnwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761855009; c=relaxed/simple;
	bh=MUDH20eIOuOTsz0KS9uuqL90AQHBBTqkmMlPBeDR0dg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=T//l0+40z6HovReWtdOH5YU2w1NekZU6V7l25VdocAAvpMMZV3S/Eb/Av8lP+ICdMHCndY8hPzuRPzHMGcq4TXC/3q4yrZ9SvzUWpI+GxYTRfc0QaAFKYHCg9LcxcIIG3vFlLBNHUAHBAX3n39zxP2bGmsXNMONPlm4mID/SL/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=3Nd5CoHe; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="3Nd5CoHe"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-b63038a6350so1675641a12.0
        for <loongarch@lists.linux.dev>; Thu, 30 Oct 2025 13:10:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761855007; x=1762459807; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=TnV5Uo4WEDSyHqNRydChmPWwv04NNnacTlgMSv81cvQ=;
        b=3Nd5CoHeItZGRm7DOBKuDtrJVtAJjhbPMXsbdHY9zoPZdc+j5R/BdFXK4bkWcBnMzK
         iwpvAP/zsvxs8ul1OMze+b01Bbxnq6HyKl6NjBeI2XQj+Q+gY/vQOuFIbzYLaV6+k4Ks
         ySdkgOIuaIg0itHWf8IHmtKahW0rV427n6G9xYt+h94YBBQiUFiqK+6RtA09wrXYN7SF
         OVviFkTBZIUhQun0btCRNygOdXpD0tioc1A4NGQSRztDQ+qoiAhX14sMaMZpEjRdxNr8
         Wfaq+q5Z9ormV3Zy6qZn1hwo0o20J/58CIs6R8aefyskrnEsxE8zvaSrbXj9fzRGtjWt
         nArg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761855007; x=1762459807;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TnV5Uo4WEDSyHqNRydChmPWwv04NNnacTlgMSv81cvQ=;
        b=dqr8NmsOgrrnxPlPT1QcLYUDivmIAHm5wVs1nPhqb8CLfL29z6FZ6OuxATOboS3n2X
         Tt+ZLESSQYC4yQ4IUdASiC/wKo01sMn9bBBOfp+elgSBhi6dB98SbEH4egtVg0FDuLz9
         uYtiILuxZm0MtP1RL0q2+V1ydK3ketJME70a63Jy2wN39t+Azi0m4yvHVj8N5uUwN6FC
         zS4y/4r/qdYN5KH14e3UEJVWv0/LIkpk/o6jq+BIiXGiq6qGIN420PYnedwHBUYvs+SM
         BaZ/grTebHUL+xyMp4MtzidkTkJxQgah5Pi0hb+U723qmAu42+8TAbpWNyHIeo/difwx
         17Hw==
X-Forwarded-Encrypted: i=1; AJvYcCVMBYnvNihIdt9ny0DCaTuRzkQtY8zcMp1t3xuzPLGk4ES42pfd1NoncC2ftIAvGsWHmyB9cgdj3Gs=@lists.linux.dev
X-Gm-Message-State: AOJu0YyDlIxzKRW1AKz3pfv9GeD+5ruTefk2Qun1TqvkZPmf3QGsrwAp
	KGc4eBqqvn82ErjURp/X+A0hwBvRWB1+1GtHU6FHz0g/QV8kdTa8BOdrcPncgoBc/r1rKzMcWWn
	vs8fM5A==
X-Google-Smtp-Source: AGHT+IFGhHo2Di0bU/Eld4A49PARSXoqPeeyu/ySpV1D9gJIOdjNn1G+WqeVqdSQrN5R+YSZ+ehbNpIGVJQ=
X-Received: from plow8.prod.google.com ([2002:a17:903:1b08:b0:267:cd3d:3446])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:f54c:b0:295:134:9ae5
 with SMTP id d9443c01a7336-29519b9f27cmr11657375ad.24.1761855006488; Thu, 30
 Oct 2025 13:10:06 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 30 Oct 2025 13:09:26 -0700
In-Reply-To: <20251030200951.3402865-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20251030200951.3402865-1-seanjc@google.com>
X-Mailer: git-send-email 2.51.1.930.gacf6e81ea2-goog
Message-ID: <20251030200951.3402865-4-seanjc@google.com>
Subject: [PATCH v4 03/28] KVM: TDX: Drop PROVE_MMU=y sanity check on
 to-be-populated mappings
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
	Kai Huang <kai.huang@intel.com>, Binbin Wu <binbin.wu@linux.intel.com>, 
	Michael Roth <michael.roth@amd.com>, Yan Zhao <yan.y.zhao@intel.com>, 
	Vishal Annapurve <vannapurve@google.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	Ackerley Tng <ackerleytng@google.com>
Content-Type: text/plain; charset="UTF-8"

Drop TDX's sanity check that a mirror EPT mapping isn't zapped between
creating said mapping and doing TDH.MEM.PAGE.ADD, as the check is
simultaneously superfluous and incomplete.  Per commit 2608f1057601
("KVM: x86/tdp_mmu: Add a helper function to walk down the TDP MMU"), the
justification for introducing kvm_tdp_mmu_gpa_is_mapped() was to check
that the target gfn was pre-populated, with a link that points to this
snippet:

 : > One small question:
 : >
 : > What if the memory region passed to KVM_TDX_INIT_MEM_REGION hasn't been pre-
 : > populated?  If we want to make KVM_TDX_INIT_MEM_REGION work with these regions,
 : > then we still need to do the real map.  Or we can make KVM_TDX_INIT_MEM_REGION
 : > return error when it finds the region hasn't been pre-populated?
 :
 : Return an error.  I don't love the idea of bleeding so many TDX details into
 : userspace, but I'm pretty sure that ship sailed a long, long time ago.

But that justification makes little sense for the final code, as the check
on nr_premapped after TDH.MEM.PAGE.ADD will detect and return an error if
KVM attempted to zap a S-EPT entry (tdx_sept_zap_private_spte() will fail
on TDH.MEM.RANGE.BLOCK due lack of a valid S-EPT entry).  And as evidenced
by the "is mapped?" code being guarded with CONFIG_KVM_PROVE_MMU=y, KVM is
NOT relying on the check for general correctness.

The sanity check is also incomplete in the sense that mmu_lock is dropped
between the check and TDH.MEM.PAGE.ADD, i.e. will only detect KVM bugs that
zap SPTEs in a very specific window (note, this also applies to the check
on nr_premapped).

Removing the sanity check will allow removing kvm_tdp_mmu_gpa_is_mapped(),
which has no business being exposed to vendor code, and more importantly
will pave the way for eliminating the "pre-map" approach entirely in favor
of doing TDH.MEM.PAGE.ADD under mmu_lock.

Reviewed-by: Ira Weiny <ira.weiny@intel.com>
Reviewed-by: Kai Huang <kai.huang@intel.com>
Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/tdx.c | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
index 326db9b9c567..4c3014befe9f 100644
--- a/arch/x86/kvm/vmx/tdx.c
+++ b/arch/x86/kvm/vmx/tdx.c
@@ -3181,20 +3181,6 @@ static int tdx_gmem_post_populate(struct kvm *kvm, gfn_t gfn, kvm_pfn_t pfn,
 	if (ret < 0)
 		goto out;
 
-	/*
-	 * The private mem cannot be zapped after kvm_tdp_map_page()
-	 * because all paths are covered by slots_lock and the
-	 * filemap invalidate lock.  Check that they are indeed enough.
-	 */
-	if (IS_ENABLED(CONFIG_KVM_PROVE_MMU)) {
-		scoped_guard(read_lock, &kvm->mmu_lock) {
-			if (KVM_BUG_ON(!kvm_tdp_mmu_gpa_is_mapped(vcpu, gpa), kvm)) {
-				ret = -EIO;
-				goto out;
-			}
-		}
-	}
-
 	ret = 0;
 	err = tdh_mem_page_add(&kvm_tdx->td, gpa, pfn_to_page(pfn),
 			       src_page, &entry, &level_state);
-- 
2.51.1.930.gacf6e81ea2-goog

