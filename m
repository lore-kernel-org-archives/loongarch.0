Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7A2E22A4E9
	for <loongarch@lists.linux.dev>; Fri, 17 Oct 2025 00:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760661176; cv=none; b=FjrDvPXibY/7qyAseoBqT07cw58S2BR4OfAYSO+NcKeUTCXACQ25lJ54KcPOVp12ibHtA+7rVybGPvvW7Q4wc/LsGdOcJywjhB6DuWlt+IUMRvP3zhQ2wGbCyBNF8YOC2yY4pnFPEdO2Oz0AWsHVV/Wq/0RX4iw1jc0Y3K56FYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760661176; c=relaxed/simple;
	bh=sDhYqOoM0kA/BE6wjd9QATnXbbERuSw/zd8xDCYAeAE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=jCkhi9v7sqXYsk7CtJNVGZsdBvdxZEcpQ6pFQ/pBNfCNbSsM+aw3IkKqkZ54Rw+vmHaM8LQRRwMX3sxGW9qzAj+HCDsKLvi2+6X5BTm4T5a13+gCCS478cpw0ozbVS1pbh1p0A5mcZok1AO5xoHu23BTQH9f5PAE1D3zXrpx/40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=za5U2qP7; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="za5U2qP7"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-33428befbbaso1593448a91.0
        for <loongarch@lists.linux.dev>; Thu, 16 Oct 2025 17:32:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760661174; x=1761265974; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=ufVneY39YrbdCfRZpp0jVK1n9RSn66wnVA9SJtGGBdY=;
        b=za5U2qP7fWhSjZpIj5tnd/eqdFIHts7cUhzyH9iiWc7jdvosyZmQVB/2bNyvtjJNJ4
         wnKVU1vGvj7JbRoJ9/xIM4fmcj7fCTpwhyX357dkKUFnIgKZq6ssJ38D9V2x6tnMahJn
         9iB48Wc2WrjPu3e1RToymEAONnjPBCnuZ+9mAkqKXGu2vvSKvp3aosurocavQLWMSfwk
         4g4WTbKfVXhU/oqUgoIN8Xo8BKvRWEZp4vrTMf7S5yBrqZKrr23PshqzvIYjfVK/BhGP
         Bn2ZN70Wg8jWa46PGSQHJ27FCL3X4xo7G43YsXLjNCBWRSKXbNZu+ShjD4O5O7PKu2NP
         ln5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760661174; x=1761265974;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ufVneY39YrbdCfRZpp0jVK1n9RSn66wnVA9SJtGGBdY=;
        b=fiVZ66NIRnKF45rzYIaBCRRbmFiyHlvoa6F0qFswCORpvjfRLyc8WtrqqWqF3JZeHR
         EZMo0iSbGP1TRPmV3McrYJ0IA6jKx7QAvBSUNa2bL/J+/Zb4kiZTD/oQE4HJbfzcIbKO
         f2rCQsztUhqWjmfOX3ZsgECJB/U71qRY1WMuEdFxLrS/MW3jc7g64JdU0ThIg9z25H5I
         sg11GYKwuw7T14y6DGbS8QCJvrCO+8u3YCW1ez57p8PPiTRn5PceAL6zFrqJwJLaXznX
         q6gtJyTTo7BXOPuJ51dhKr2YkjTzNy22wDTGBLqIMXWr6IQ8V/vF2OxbCS1HAdLmUT0o
         oEyA==
X-Forwarded-Encrypted: i=1; AJvYcCUvWv9OzrA+f9fufUZEaQrlzKJ7iz4ufJe28L7in+F/MQuhLgTrhmtfecONudHq1p15nAWZ2KqFDjA=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx6vQ8rl5gLOMpmvfzLHtFirF2WyiDJmTZvZjbSyOG8RRBxPJuG
	3zHXgz/3EyJUqHHR2ywlVd+b/IYLNAgD5cnLeyTWX7Jm4eOaoXftOc4iVwLM5ge6etVg0mjvjOR
	K09uF2w==
X-Google-Smtp-Source: AGHT+IGBsD40M1TCHpceHuTvrzQu31EsWCpow7sShvAnQiEKP0H9VSo9B6k/+Ftt8wsphMd8FgX3xhZLFrA=
X-Received: from pjop7.prod.google.com ([2002:a17:90a:9307:b0:33b:aa58:175c])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2fd0:b0:32d:601d:f718
 with SMTP id 98e67ed59e1d1-33bcf8f9c16mr1675095a91.31.1760661173675; Thu, 16
 Oct 2025 17:32:53 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 16 Oct 2025 17:32:21 -0700
In-Reply-To: <20251017003244.186495-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20251017003244.186495-1-seanjc@google.com>
X-Mailer: git-send-email 2.51.0.858.gf9c4a03a3a-goog
Message-ID: <20251017003244.186495-4-seanjc@google.com>
Subject: [PATCH v3 03/25] KVM: TDX: Drop PROVE_MMU=y sanity check on
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
	Kai Huang <kai.huang@intel.com>, Michael Roth <michael.roth@amd.com>, 
	Yan Zhao <yan.y.zhao@intel.com>, Vishal Annapurve <vannapurve@google.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Ackerley Tng <ackerleytng@google.com>, 
	Binbin Wu <binbin.wu@linux.intel.com>
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
2.51.0.858.gf9c4a03a3a-goog

