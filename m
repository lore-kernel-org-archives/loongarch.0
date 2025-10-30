Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49576384B8C
	for <loongarch@lists.linux.dev>; Thu, 30 Oct 2025 20:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761855036; cv=none; b=ccKtBkrwmNxMKAGTNNlA2lQDRTsfugLOsROxSr0Na/+7m7Y4CNJraFt8BvEHRjxNDstMNVkj836B0wX+gUkaSysjjiMr6YtM0pOTAmwofBYEFfWpMXflhJmzy56S+yW7yg+2S7W6TB45/gVpTPGhk8cwfnLsr8MCP25/4URdB+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761855036; c=relaxed/simple;
	bh=hZ6oGgJsAxLyizwY2nBkXOfX86m8d4LnroP9LBDe0vw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=iEQ9BLl7V/ToY2oibDHvkymeuEzcZXid7d3PC0fqMG4wzsiAEqHgYgJVHT/Q6sALPilQJY6snR/Q116yM+IxWKTDtPmrjKIqks0A+m4BlUGFjz9e2Uzy93WB75P/7IeDa5ag8JTsEbOoG2b8P4lQr6gciLaR0k/OXAxLmB1kHTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VwL6JdH/; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VwL6JdH/"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-3403e994649so3115337a91.3
        for <loongarch@lists.linux.dev>; Thu, 30 Oct 2025 13:10:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761855035; x=1762459835; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=2Qp65v2XVpj2mbgYoCIcn74lwhNS3G3VX8VrR6k2zs8=;
        b=VwL6JdH//+lE9XX5P7eUeSIU/r0WSf43+pTnlJSE06/cu3zW/nIxQUD0vToiLp6wPR
         IUNiGiVAU4rv4fdgEgHqY2vizn04NMSnyBYAs5Vd3fSwoZUhMmr4mx17SAdgGRvK86c1
         FXn0urU0YKIrE4xLoxXZPL524E0kHE4WaDyMmHzf3A/qZXC2R53mrIOONTXFlUf/JdWW
         vTYNdZ7CfoBu04gWYdcVCGnivU22Sy5jI1GoLEYGq73kDmqIznaBnz4NSFXWyWv52iRN
         e0bEk0PXzRVuStidLEjXnzanBZn5jyY1N6TwH+58d8W/KwkT6nZJdP7iekji1Aryk2Ap
         ixHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761855035; x=1762459835;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2Qp65v2XVpj2mbgYoCIcn74lwhNS3G3VX8VrR6k2zs8=;
        b=SsnBQ3Fe4GKNYmymvjCRxOscLRFJPVxsxN81ReBPBp8579C6GTVQDZW4g5T/8vnwOC
         uJuzJ+2XwUj/bhOnduNxJqWAlHOqBCZ5t59/HOPAjWL4noRKn39NxqAMq4aGjY24n37t
         AfDil4aVhiYhKHgDIq5gIduDp8giTypDUwZmYE6RHaa2IbL/bUTGci0FjiJnNZkoc0TP
         Vs9fqwUNDh1swFIlztjDoa+tOABsuKtuyNG7067d/7RTaPzWceN1NfeYr2csr/fXCNFo
         QYE1Ve9ptwjYiPX1CvRbYMQj2mG1JGrFj18H/+BsDSkvgq29aNrctTIwlRIjqdRI0uRn
         R0yg==
X-Forwarded-Encrypted: i=1; AJvYcCUuVJqicke8d5iNkVvGdhtaEgxiQ183MyBHUhzMx1vv2G7fJjwwLTF3QDEVVIRt1EMGnA+V62JbM28=@lists.linux.dev
X-Gm-Message-State: AOJu0YzcfwAoDIClsWyBWEP2xz0YFWL0fa7618PN/qSVJ48e+Y7xOEPi
	LE9xtGvNPmV6GjqigRZ1NRrfMWduPMweHwrpQRZU34dRw09Ye7zTe8sIvH/SWPyPIAG55mgk0Db
	YMdbUwQ==
X-Google-Smtp-Source: AGHT+IHtEBN2FzRvx/PBMIz+g6mN5JL6fejVbo3/Jj6z8BZ8mwuwi1S8UZTxug0dqnAA2vI1WFCMGP+gtTc=
X-Received: from pjph23.prod.google.com ([2002:a17:90a:9c17:b0:340:2aef:8b01])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3842:b0:335:2eef:4ca8
 with SMTP id 98e67ed59e1d1-34083088cfamr1279023a91.33.1761855034597; Thu, 30
 Oct 2025 13:10:34 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 30 Oct 2025 13:09:37 -0700
In-Reply-To: <20251030200951.3402865-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20251030200951.3402865-1-seanjc@google.com>
X-Mailer: git-send-email 2.51.1.930.gacf6e81ea2-goog
Message-ID: <20251030200951.3402865-15-seanjc@google.com>
Subject: [PATCH v4 14/28] KVM: TDX: Use atomic64_dec_return() instead of a
 poor equivalent
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

Use atomic64_dec_return() when decrementing the number of "pre-mapped"
S-EPT pages to ensure that the count can't go negative without KVM
noticing.  In theory, checking for '0' and then decrementing in a separate
operation could miss a 0=>-1 transition.  In practice, such a condition is
impossible because nr_premapped is protected by slots_lock, i.e. doesn't
actually need to be an atomic (that wart will be addressed shortly).

Don't bother trying to keep the count non-negative, as the KVM_BUG_ON()
ensures the VM is dead, i.e. there's no point in trying to limp along.

Reviewed-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
Reviewed-by: Ira Weiny <ira.weiny@intel.com>
Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/tdx.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
index db64a9e8c6a5..99db19e02cf1 100644
--- a/arch/x86/kvm/vmx/tdx.c
+++ b/arch/x86/kvm/vmx/tdx.c
@@ -1726,10 +1726,9 @@ static int tdx_sept_zap_private_spte(struct kvm *kvm, gfn_t gfn,
 		tdx_no_vcpus_enter_stop(kvm);
 	}
 	if (tdx_is_sept_zap_err_due_to_premap(kvm_tdx, err, entry, level)) {
-		if (KVM_BUG_ON(!atomic64_read(&kvm_tdx->nr_premapped), kvm))
+		if (KVM_BUG_ON(atomic64_dec_return(&kvm_tdx->nr_premapped) < 0, kvm))
 			return -EIO;
 
-		atomic64_dec(&kvm_tdx->nr_premapped);
 		return 0;
 	}
 
@@ -3161,8 +3160,7 @@ static int tdx_gmem_post_populate(struct kvm *kvm, gfn_t gfn, kvm_pfn_t pfn,
 		goto out;
 	}
 
-	if (!KVM_BUG_ON(!atomic64_read(&kvm_tdx->nr_premapped), kvm))
-		atomic64_dec(&kvm_tdx->nr_premapped);
+	KVM_BUG_ON(atomic64_dec_return(&kvm_tdx->nr_premapped) < 0, kvm);
 
 	if (arg->flags & KVM_TDX_MEASURE_MEMORY_REGION) {
 		for (i = 0; i < PAGE_SIZE; i += TDX_EXTENDMR_CHUNKSIZE) {
-- 
2.51.1.930.gacf6e81ea2-goog

