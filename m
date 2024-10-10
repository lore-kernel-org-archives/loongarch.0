Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B69F1E9065
	for <loongarch@lists.linux.dev>; Thu, 10 Oct 2024 18:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728584716; cv=none; b=nAq5GebvWDVYbIT4anCksL1za/He0SWkDYH7ay4XGFjsf/fOZWs61VOegAe5/rUA85cUcsSW+AggsOi6yRKI+tYyewYVDtGq2Aq4+hsWp5xcADKAeTspQNdAkv9kP39nk7JVxyY3jakVms74KC8VNci5ZYkMB2kevouiCXvJH3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728584716; c=relaxed/simple;
	bh=FKY/uzFyW8/uk7MX2MD3fh26WMEEPHDBpnIM2/GXcs8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ud3jc6zibQDhOXeMSZHlOdjBJhZ7/iFlBk+rsPFDq7FzZH/5g024SMwsLkX1rIEC/hO2M1EUUUdCiRJRdyQnaqE4pcwdCDBmCOnmFHK3BuFEidxRaReYBEA2IE4vcJ/t+MbP5OsqzDdgQAQa5yy5SNL8ocE1RxolBRAcEgL67rY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RajnHFep; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RajnHFep"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-2e2a9577037so1354368a91.1
        for <loongarch@lists.linux.dev>; Thu, 10 Oct 2024 11:25:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584713; x=1729189513; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k3/xcOX0JmpZSdxUAeDWhRU0v4mqVA9cM67JfDYoNsA=;
        b=RajnHFepB0W28VL75SGKGkRd42Lf8qdWmBZdC9500psyoBekMPRKnVhXhMb+qHdhny
         YIfPoeTafIJ9VjBkgZxQcdjfmg5Ltpmcd7bI0X5ayDqmYpSFxdG6YbhyBLHPVYmviQSY
         syECm5d3eu+oEexKXYKnZf+CiT5ZvFryLaCCnE0/LOZ5YuX26F4H+YJ8Wdjx8xC0Sckp
         ffcXKbsBEtnsWHZImjdRdVzWMhMnt8Urbk3kgLLAjKs89GcTrv7pG8UlE4ObCHQ1KqlN
         YdhMagB60PB1k/4puD7YZwy0IsfDV5tI32J0f8E+9MObEOaQ1x8Af55/T69gT9RbuWf8
         aadg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584713; x=1729189513;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=k3/xcOX0JmpZSdxUAeDWhRU0v4mqVA9cM67JfDYoNsA=;
        b=tRHJyhvQNOsXDBq5qY2rE3XXnfP9hvH2ZA7ro7DRPywS6A1xqs4XdWQtEafGuLZK/M
         y6rZW5aFUzmCEI/uheKHaBJv9cPMGF3GMl5aQWtpW1UI9rpsAn+weREfo/lYk1zBpsO2
         WopbLprLIWbAaw/0txSUYxYd17N4gJxIfhrEtisuDjZvK2h3g4EI6Rly+wfwIcZ8yrP5
         TUdjlOAKAla96Ja+8ZgGkHE6qopjXub/9Mr2IOyiRhQqTVQ7e//NJVXixZrBJwTsxFQ8
         0tqZEk6/6RD9DTKOJ9L5F3PfKalWElCxPXqDiJ7JSKchSKhpM92NYYVUZ9UAfWTxb6gQ
         wVEg==
X-Forwarded-Encrypted: i=1; AJvYcCVdIxpDKEkgaxSCqzaWFK4g8AiEVdxDlWP3m5vsCq25zqkSkNJRgEF9ZCSstOS6pZuZcXcz6JIGTIY=@lists.linux.dev
X-Gm-Message-State: AOJu0YznYdD1tjPtaEvJaTX1tQTwJ7Ib9fZ5IWx0zDKWvlHXuFyNYiOU
	J8OTnoJ44c3DVsatn0vByP/01lhVtSBQFzy2NWbSP/PjyGqQk7U8fEhdJrUuyTiPDGog64ccg5n
	iwA==
X-Google-Smtp-Source: AGHT+IEzZdX7U43FtBqfYwOSCvhQrFRs7MoNj08p1am6l1FbD4QaVhgMc/3KfB78OlyTOzXtpjGPG3KIosU=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a17:90a:ea0e:b0:2e2:d843:4880 with SMTP id
 98e67ed59e1d1-2e2f0c82a2fmr30a91.5.1728584713017; Thu, 10 Oct 2024 11:25:13
 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 10 Oct 2024 11:23:12 -0700
In-Reply-To: <20241010182427.1434605-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20241010182427.1434605-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Message-ID: <20241010182427.1434605-11-seanjc@google.com>
Subject: [PATCH v13 10/85] KVM: x86/mmu: Use gfn_to_page_many_atomic() when
 prefetching indirect PTEs
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
	"=?UTF-8?q?Alex=20Benn=C3=A9e?=" <alex.bennee@linaro.org>, Yan Zhao <yan.y.zhao@intel.com>, 
	David Matlack <dmatlack@google.com>, David Stevens <stevensd@chromium.org>, 
	Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Use gfn_to_page_many_atomic() instead of gfn_to_pfn_memslot_atomic() when
prefetching indirect PTEs (direct_pte_prefetch_many() already uses the
"to page" APIS).  Functionally, the two are subtly equivalent, as the "to
pfn" API short-circuits hva_to_pfn() if hva_to_pfn_fast() fails, i.e. is
just a wrapper for get_user_page_fast_only()/get_user_pages_fast_only().

Switching to the "to page" API will allow dropping the @atomic parameter
from the entire hva_to_pfn() callchain.

Tested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/mmu/paging_tmpl.h | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/arch/x86/kvm/mmu/paging_tmpl.h b/arch/x86/kvm/mmu/paging_tmpl.=
h
index fbaae040218b..36b2607280f0 100644
--- a/arch/x86/kvm/mmu/paging_tmpl.h
+++ b/arch/x86/kvm/mmu/paging_tmpl.h
@@ -535,8 +535,8 @@ FNAME(prefetch_gpte)(struct kvm_vcpu *vcpu, struct kvm_=
mmu_page *sp,
 {
 	struct kvm_memory_slot *slot;
 	unsigned pte_access;
+	struct page *page;
 	gfn_t gfn;
-	kvm_pfn_t pfn;
=20
 	if (FNAME(prefetch_invalid_gpte)(vcpu, sp, spte, gpte))
 		return false;
@@ -549,12 +549,11 @@ FNAME(prefetch_gpte)(struct kvm_vcpu *vcpu, struct kv=
m_mmu_page *sp,
 	if (!slot)
 		return false;
=20
-	pfn =3D gfn_to_pfn_memslot_atomic(slot, gfn);
-	if (is_error_pfn(pfn))
+	if (gfn_to_page_many_atomic(slot, gfn, &page, 1) !=3D 1)
 		return false;
=20
-	mmu_set_spte(vcpu, slot, spte, pte_access, gfn, pfn, NULL);
-	kvm_release_pfn_clean(pfn);
+	mmu_set_spte(vcpu, slot, spte, pte_access, gfn, page_to_pfn(page), NULL);
+	kvm_release_page_clean(page);
 	return true;
 }
=20
--=20
2.47.0.rc1.288.g06298d1525-goog

