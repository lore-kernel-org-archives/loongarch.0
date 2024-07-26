Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6869A175563
	for <loongarch@lists.linux.dev>; Fri, 26 Jul 2024 23:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722038002; cv=none; b=hl6XjzIkdl7JGPY4rQwC9SS5W67bagZPUatcR2PYnxvKwuWWVsgTzYC3BRWe4D7BV6LYdk3da3iP8lIF/u0T/7ugQFO2nsGBQxfmFQ9STtBd6AbBf+nK0AV7WG5otXvU1kcT3ifVNdMzMAN5vXJMq9OFoU0NdO2fH7luOEvn15k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722038002; c=relaxed/simple;
	bh=btA5HWQO+KsQDU5pHR0Xwi+Zt3luZJSHGiywErewvig=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=fJeDGQwq/tGin9feu2wXN1uIHGu0WCs67P3erHgfDuaWssp3FDedlk+GDSJIyN5g1vdPQJQeLM+VLNTSoeVFcdId9jFIG+6ZqviBeTk0I8l2rdrdi+VccNO89n7EPHivYdCtX54uz+0Y4e7c7Pcj8Ct+BeKdIdXMRzHeLDfWVwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=0RRc+rpG; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="0RRc+rpG"
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-66480c1a6b5so7092687b3.1
        for <loongarch@lists.linux.dev>; Fri, 26 Jul 2024 16:53:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722038000; x=1722642800; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=khS3+Cji6+1mvvdZyBUq0wqzq89EmN0cfXvMph1EjiU=;
        b=0RRc+rpGxkhtDFzGUXXA1pGmNdSm6lwdHEty8cKaM6cs66MzIZkIiSg3s4imWMNgz/
         BEYLEh8zDyIGgwNes/tWCEpK+e05TOyZjEjgkkXNFZplO5ZwDIwLZDAMrBtkOL97R/C4
         5CTPuDMnjPAdcj3uLvWTutKwtWN9WjkuUuBOYDRsIxND5Xud80fnHuMioYRYBKyClZES
         1WUzZly3p5MOYtNHgdh4cgQNwvrjb1Px6+NNef/pKH0l9SGHwUE2J2YImz1UDib0qIoE
         sBetmeCRX5Kbrrg3fg1rjuk4Z49Lz9sSiL1/KfsEYgZyLUBOlP442UrQI2pEGlZlpBgC
         ETIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722038000; x=1722642800;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=khS3+Cji6+1mvvdZyBUq0wqzq89EmN0cfXvMph1EjiU=;
        b=iUqpPRFtsvIUt8uURyJjjJxNKSHwF/5AvhwzZhd7hOnjfH39euIdtSfKW9uI3EVpQO
         uxDn5HQxLBP9LlPU6sjgjprnJqD6w4mHs4xKomiQUobf1eGEYGR5WTTXj0i5YF4LO4Ih
         dw536YcwAiCXpdhJblxFakU7vU1nEoKmzJb2OqIpnPkXOv/FsA6J8hdQverTBbaukDDl
         TYnn9G3wZOI4g0u5v1pfsNvdm8ZWs8FaZoOMs03CH+okJoecfR95rrWFvqy8vYa65g8P
         1Dcn4kj+32CStvn73vgat6PQZBJXJfk8s2HkIEMNeLmiRXqjMLNv2DOYJyno0Sk5CcMP
         wppw==
X-Forwarded-Encrypted: i=1; AJvYcCWc0vzVH43XK/814oQ0ZrXUDZgpsbDjogbO2rmzHpcyikz0ntMr0l+zcIaH0W+DayujfIplxwFXGZ3FMvvJVy6j0X+kAjIOA9Tw
X-Gm-Message-State: AOJu0YwNLYhlOowU2FohrZGRpS5BjA0S/QBlaLopyLWfQKFwk8gct5jK
	oZ+B4E0NALynQNW/74mBLJDTzhBxYrqdfnyTCnvzoEys7URw5TX0pdHUagCQtvaAgCfqGkMM7qs
	qJg==
X-Google-Smtp-Source: AGHT+IHn8ljNba0QNoBWKfaXu8Wx8VTGIoZ1RPeW8pDsltrF/Hl6Iy7/rU4VvDeHaG7eZvfgbbZBLlqPjFc=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:690c:806:b0:64a:8aec:617c with SMTP id
 00721157ae682-679fffd3e35mr362617b3.0.1722038000511; Fri, 26 Jul 2024
 16:53:20 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 26 Jul 2024 16:51:30 -0700
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240726235234.228822-22-seanjc@google.com>
Subject: [PATCH v12 21/84] KVM: nVMX: Rely on kvm_vcpu_unmap() to track
 validity of eVMCS mapping
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	David Matlack <dmatlack@google.com>, David Stevens <stevensd@chromium.org>
Content-Type: text/plain; charset="UTF-8"

Remove the explicit evmptr12 validity check when deciding whether or not
to unmap the eVMCS pointer, and instead rely on kvm_vcpu_unmap() to play
nice with a NULL map->hva, i.e. to do nothing if the map is invalid.

Note, vmx->nested.hv_evmcs_map is zero-allocated along with the rest of
vcpu_vmx, i.e. the map starts out invalid/NULL.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/nested.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/arch/x86/kvm/vmx/nested.c b/arch/x86/kvm/vmx/nested.c
index 2392a7ef254d..a34b49ea64b5 100644
--- a/arch/x86/kvm/vmx/nested.c
+++ b/arch/x86/kvm/vmx/nested.c
@@ -231,11 +231,8 @@ static inline void nested_release_evmcs(struct kvm_vcpu *vcpu)
 	struct kvm_vcpu_hv *hv_vcpu = to_hv_vcpu(vcpu);
 	struct vcpu_vmx *vmx = to_vmx(vcpu);
 
-	if (nested_vmx_is_evmptr12_valid(vmx)) {
-		kvm_vcpu_unmap(vcpu, &vmx->nested.hv_evmcs_map, true);
-		vmx->nested.hv_evmcs = NULL;
-	}
-
+	kvm_vcpu_unmap(vcpu, &vmx->nested.hv_evmcs_map, true);
+	vmx->nested.hv_evmcs = NULL;
 	vmx->nested.hv_evmcs_vmptr = EVMPTR_INVALID;
 
 	if (hv_vcpu) {
-- 
2.46.0.rc1.232.g9752f9e123-goog

