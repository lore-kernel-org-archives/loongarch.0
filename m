Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CA8A383367
	for <loongarch@lists.linux.dev>; Thu, 30 Oct 2025 20:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761855034; cv=none; b=TC6wh/z3sg8DyuImqpIbJTssKLV6SlfCH6iSITAsxW38ruxTm4rPP+NBbGE48tU5cNz3URV8MPcTQs6S3QbcSCuVsnGfZ+d4Up/Xr4mSKH49fQ98McGzKX5n8JU2hOy92fxoabeH8Yz/B7r8IBH6BjyCGNGQF71ZTst5OUoCkvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761855034; c=relaxed/simple;
	bh=XFfT8gaTPEkUKYTdX1NH6w/tGb+C9eg2daMfkI8gFLA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=qnYgtcYDex/usYiqhmcbpDR/tOYP0zGiOTQF9n5AvXzIpmb7L40iqMQD15fCe4rU8gdHPzYUkzH+4wszF1s8OepZLC45Fh+JIObjcRYJk/e8EY9CyNSbtwddQSyQKmpDDuoYGS8UjtMKckvyX9vETMvGuQafVX9p8qC0lV9/vMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cZC7+frV; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cZC7+frV"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-3307af9b55eso1190316a91.2
        for <loongarch@lists.linux.dev>; Thu, 30 Oct 2025 13:10:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761855031; x=1762459831; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=meKFn4T9FN95UHKOhoydSdUPWQIDJ02hjx7Eu38ytY8=;
        b=cZC7+frVxZFzTUxnDx/0btcT71+DicPEdvcNmB5B1SBZqQmtIQCBFvxd/4OlGoP9Rm
         mRs2/iwnRODg/qpJeOibQ+huNPU0zrTn76YN+5Qg6Kw68tOMkFeUA2CxNVnKlVYKe8gC
         LgGnGaqotBLp2/S7R6vOfojvdOu1eBFaLNgw0FEwoZf6BrWkhNh+aDMR49VB1H4Am22/
         xSgTKdhpC61+/05qhvEBzTkNP55LuhxA1x9B8peygd0iHkdPH4XFm9/KA4BwC2sD/xZC
         A2A9WCahaL5FeOw3YkvpsDAiemy1bozBo4Bhyqj239mrKeUbTf9+GblEgmx6MGnNK5Jb
         4Pmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761855031; x=1762459831;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=meKFn4T9FN95UHKOhoydSdUPWQIDJ02hjx7Eu38ytY8=;
        b=VwIWbLpUT+n3W5NKnFhPiG52BWXV5+ymSFnd4syNnQEYCwUoh6JQYByLScGI3h1pax
         WLL6yYiq9j2oGXMByTlspJTfsQGzaPTihwU45fK8lej8Dentx4bUNpG5JuxWUd/DN+Ns
         MdJqrA+wvSAq1O2qE779XehbLydzzk4U5zqBe+VNIKFwyxTPIbdF4Lu+KDLSvjxvyJFW
         GMMSMTyB8JB/rvdNLcVloXUazBOHoL0UrQh3n1/cq1bW2dCBg4VRFhPUpjqkUjpPorQq
         8PrR2SQ9q116EuSD8H6lrGxg0H+ipFikT4+/XM41vXBuSHpnZMxjQ4WKPsHI6E8+PDJ9
         lTGg==
X-Forwarded-Encrypted: i=1; AJvYcCV1belCU8tXZkLElptIg0I23ymi4Mw1GyCMEdsPF9FTqcRJPVingm9RMVfqa6FpnylHcjc2lGM9BWY=@lists.linux.dev
X-Gm-Message-State: AOJu0YwTowyrrj4WQj2pyZAIxiLEs5/Tt33Ayd7dnVuNr3OY4awXkmIS
	d0hPfNBltDY+pIJ7JAfh81/24lqoF5zz1IPKK8ZCCtKdDYYfg3l9cWhMhEB3wuURznS6a/pbj8U
	X0Q9ZoQ==
X-Google-Smtp-Source: AGHT+IFHot6p8Ozw6sPTCEifBtpuZu56mTW8C+szZfak/MuPqOINRZqkxHegGZo0IYVURE2JpMgMqwrtO2U=
X-Received: from pjvl22.prod.google.com ([2002:a17:90a:dd96:b0:340:6aca:917f])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2d92:b0:340:5c38:3a56
 with SMTP id 98e67ed59e1d1-340830a3a7cmr1392650a91.37.1761855030672; Thu, 30
 Oct 2025 13:10:30 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 30 Oct 2025 13:09:36 -0700
In-Reply-To: <20251030200951.3402865-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20251030200951.3402865-1-seanjc@google.com>
X-Mailer: git-send-email 2.51.1.930.gacf6e81ea2-goog
Message-ID: <20251030200951.3402865-14-seanjc@google.com>
Subject: [PATCH v4 13/28] KVM: TDX: Avoid a double-KVM_BUG_ON() in tdx_sept_zap_private_spte()
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

Return -EIO immediately from tdx_sept_zap_private_spte() if the number of
to-be-added pages underflows, so that the following "KVM_BUG_ON(err, kvm)"
isn't also triggered.  Isolating the check from the "is premap error"
if-statement will also allow adding a lockdep assertion that premap errors
are encountered if and only if slots_lock is held.

Reviewed-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>
Reviewed-by: Kai Huang <kai.huang@intel.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/tdx.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
index 658e0407eb21..db64a9e8c6a5 100644
--- a/arch/x86/kvm/vmx/tdx.c
+++ b/arch/x86/kvm/vmx/tdx.c
@@ -1725,8 +1725,10 @@ static int tdx_sept_zap_private_spte(struct kvm *kvm, gfn_t gfn,
 		err = tdh_mem_range_block(&kvm_tdx->td, gpa, tdx_level, &entry, &level_state);
 		tdx_no_vcpus_enter_stop(kvm);
 	}
-	if (tdx_is_sept_zap_err_due_to_premap(kvm_tdx, err, entry, level) &&
-	    !KVM_BUG_ON(!atomic64_read(&kvm_tdx->nr_premapped), kvm)) {
+	if (tdx_is_sept_zap_err_due_to_premap(kvm_tdx, err, entry, level)) {
+		if (KVM_BUG_ON(!atomic64_read(&kvm_tdx->nr_premapped), kvm))
+			return -EIO;
+
 		atomic64_dec(&kvm_tdx->nr_premapped);
 		return 0;
 	}
-- 
2.51.1.930.gacf6e81ea2-goog

