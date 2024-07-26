Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C31A18E76B
	for <loongarch@lists.linux.dev>; Fri, 26 Jul 2024 23:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722038104; cv=none; b=kmtgDeVW+DAPq2/Z+KgL6R1RRutCijXETDiwIDR2K1C0fMo+2LwXP12ZIrc+aH0TsOl45/5TFqAXxl0oBLJLwujqxgBs6gx9GBG56nw6oMDfG9NJAZfqMwcgw5ug2e7C4Rfu1+zv5PK0znwloCYpNnTyQl5oZx9T4OQ8mpBek2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722038104; c=relaxed/simple;
	bh=GCYK8yipXNmlvS7D1ztDicsVoHNyQK/UowKPkS/Qbso=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=n8aynBFm3v6PU75HHbeWhAf+gXU/aPwgcVpG0JnYUOTe/czlc5u9TFqEYgrk5TTtptb7dpvu45OowWVlge1RsZV33qWQbuTKSTE9c/l1fT2b+S2sz+NyetaU/jL3igLpqt4GN4shrQcITwBLE9Lm/CRH3wIk0WB2Yuie2AZNAsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kw3AoV8J; arc=none smtp.client-ip=209.85.219.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kw3AoV8J"
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-e035f7b5976so760603276.0
        for <loongarch@lists.linux.dev>; Fri, 26 Jul 2024 16:55:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722038102; x=1722642902; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=xPTfQtMbnGzpFXQRYDpT9MKKQAxP5DVy80mpAp/3DnI=;
        b=kw3AoV8JPHQ6rF8mdGUfplOvH84dd1vjavbXQMvgUMzvtOzDxmUQzNISsznXl7j4b/
         UpzRjsOOcp3CvMG4NbpVLf+a+1F8NYnl7yRk9K0PjO8EJZ+RmBjebcU0VM8hqrhHbOC0
         8tt9DPWuv8th5VibwDW6rTLodvzdMnzAvsVDag3IO1H9t6rypLYtB2OZjAdjjLURxE/R
         gEEoLcMa2xiskNkinGvf6+MPwx2BlzzhufY59naSfDQyFdoJAuzvLFF7uvqxn0Fip4B0
         +fTJaJMOSrB20AtLzrOZH7q5r59XlCZGEpIn/uaDRuOiVCSPpAQ5GlLDcewaZVReqRDo
         p8XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722038102; x=1722642902;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xPTfQtMbnGzpFXQRYDpT9MKKQAxP5DVy80mpAp/3DnI=;
        b=tGzXnueRlw4jVL5dl99vEkprlnqe5adzxy8ryQfN8440E9JKiG0cKAdvkJ7gc537NO
         bIScT8rWpCKVV9tSf0i6fN8HRV2w90N6y5T70fAOmBKDOprK1pflFjRQRmJYDgCpptpx
         jroouWcX4XKcX6uPrusjDBelYfMYYwir6O2tVMwO84nlaGFnVsWSCjX7Y1RJo65p28Bl
         Sz/ThAZQoF8uzlCzQYEUVs/ZMLQdYU3MPxG1XONiRJMPfHbjTCVxYT1+2GTs1zHKQv34
         Mcjjb5S688KQ/qCsO2KBpAiXzJRvHv3Ku6c2iY2byhkxMSobZPdKJoTM76J/Ccve34AM
         Y4mQ==
X-Forwarded-Encrypted: i=1; AJvYcCWBsaq0pPtjCcGt8eHhGwlNsAtd7O+aMnePMcVzRHrrujsW34poNYv3qwVYj8c7qlkyiwCeFh4ypcg8agT2Rhcw5iAcIs5Io+0c
X-Gm-Message-State: AOJu0YyfKCqRmizaIQD/rfEV24BdsUppm59Arw+AMU9i/DRsR93rKfjn
	7HOb2TJiUKL6bQ34qR1YXNmwWbUIZiThUMzqZE03kW3j9BxLkWwm5vdBoeXiAFI36Z7pinxI6xk
	tIA==
X-Google-Smtp-Source: AGHT+IEEWasWSJ9byHCocPT0rn5wdP9A8yl8cF0t65kc5fqEIfuaFnuVC5T09t/hlGHF+EVf0JUp5RZPIP4=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6902:c0a:b0:e05:a890:5aaa with SMTP id
 3f1490d57ef6-e0b555474d7mr20378276.1.1722038101719; Fri, 26 Jul 2024 16:55:01
 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 26 Jul 2024 16:52:18 -0700
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240726235234.228822-70-seanjc@google.com>
Subject: [PATCH v12 69/84] KVM: MIPS: Mark "struct page" pfns accessed only in
 "slow" page fault path
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

Mark pages accessed only in the slow page fault path in order to remove
an unnecessary user of kvm_pfn_to_refcounted_page().  Marking pages
accessed in the primary MMU during KVM page fault handling isn't harmful,
but it's largely pointless and likely a waste of a cycles since the
primary MMU will call into KVM via mmu_notifiers when aging pages.  I.e.
KVM participates in a "pull" model, so there's no need to also "push"
updates.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/mips/kvm/mmu.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/arch/mips/kvm/mmu.c b/arch/mips/kvm/mmu.c
index 4da9ce4eb54d..f1e4b618ec6d 100644
--- a/arch/mips/kvm/mmu.c
+++ b/arch/mips/kvm/mmu.c
@@ -484,8 +484,6 @@ static int _kvm_mips_map_page_fast(struct kvm_vcpu *vcpu, unsigned long gpa,
 	struct kvm *kvm = vcpu->kvm;
 	gfn_t gfn = gpa >> PAGE_SHIFT;
 	pte_t *ptep;
-	kvm_pfn_t pfn = 0;	/* silence bogus GCC warning */
-	bool pfn_valid = false;
 	int ret = 0;
 
 	spin_lock(&kvm->mmu_lock);
@@ -498,12 +496,9 @@ static int _kvm_mips_map_page_fast(struct kvm_vcpu *vcpu, unsigned long gpa,
 	}
 
 	/* Track access to pages marked old */
-	if (!pte_young(*ptep)) {
+	if (!pte_young(*ptep))
 		set_pte(ptep, pte_mkyoung(*ptep));
-		pfn = pte_pfn(*ptep);
-		pfn_valid = true;
-		/* call kvm_set_pfn_accessed() after unlock */
-	}
+
 	if (write_fault && !pte_dirty(*ptep)) {
 		if (!pte_write(*ptep)) {
 			ret = -EFAULT;
@@ -512,7 +507,6 @@ static int _kvm_mips_map_page_fast(struct kvm_vcpu *vcpu, unsigned long gpa,
 
 		/* Track dirtying of writeable pages */
 		set_pte(ptep, pte_mkdirty(*ptep));
-		pfn = pte_pfn(*ptep);
 		mark_page_dirty(kvm, gfn);
 	}
 
@@ -523,8 +517,6 @@ static int _kvm_mips_map_page_fast(struct kvm_vcpu *vcpu, unsigned long gpa,
 
 out:
 	spin_unlock(&kvm->mmu_lock);
-	if (pfn_valid)
-		kvm_set_pfn_accessed(pfn);
 	return ret;
 }
 
-- 
2.46.0.rc1.232.g9752f9e123-goog

