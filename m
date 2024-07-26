Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 912A818A944
	for <loongarch@lists.linux.dev>; Fri, 26 Jul 2024 23:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722038093; cv=none; b=kWJ5c+s5HOKN8zvW+aVSqPOhw+xQDLWp86jdl47MsqXS8iuBWQRtvM64yErbt6EURCqEeJ/hZxRrxeI+eqpLd2I65SezkwYB66agQvlHhzSfFyk4bdfG46R27b2Sb3/Eb/EVD1wDqQdO2SOQD0RQqriq0fBm1sYHIaHMQ7fq+5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722038093; c=relaxed/simple;
	bh=+UZ8VYtUvtsljZmzMl/1tyQmxGJndr+FFAuTaMIEbgA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ECkzB6gLsdxqi7R+A5Zg+w77vspWfbt8UXYlLuobOBlCD6gkOksM/AfTVH2uQb5NfPFCq5gfl5/9AbJIa1mqfb11q1AyYbEXbkrp1Rdy5OeHl3aEz4AyrRmT6k1KNBCKdkiQoKTkqOvilk6hOcyp/35N6E8N5qlj/VAAjb2BI7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YUtaUK7J; arc=none smtp.client-ip=209.85.219.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YUtaUK7J"
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-e0335450936so475814276.1
        for <loongarch@lists.linux.dev>; Fri, 26 Jul 2024 16:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722038090; x=1722642890; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=XEv6FisOGr6vpV2eziQMsIEoEavMf3RHPa1v90mbDdU=;
        b=YUtaUK7J+zkmHP9+RfEBBD4ity/Zdl4pCQbzevtUy2vhSVqX5gdpjqlAEGpVd8MuiU
         AByVnIgdThgcsTg0ZiiqefiJ1sS98RfU/rRByAIQS9PweHX3HGce1UDChFIY8kB9RnM/
         3ixyPlwaTF+KQLQCRMgCpsINYmlsYMe3snWAAK7lQXWYiPhw33AxbNSHbfw1GiW7vyYz
         GoKNiaC+i5lqfQ8MlZTdwVfEFrx3a8g4lnvWWto410uqvKFNSnaMqOQFiV32EtYvK9TY
         nxakEzYgnrqnGO68xdOzkOVjkKZckBK6Bkwoz7PM1mNeYTY1x6VVM0d7OjyNuczWBH0P
         MO3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722038090; x=1722642890;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XEv6FisOGr6vpV2eziQMsIEoEavMf3RHPa1v90mbDdU=;
        b=LSXzH5pY1iZqsFZwQ2gpXMBs00ls/jYr3Il+oIK7O+FKaIVD6oMxc81h3AawqUKJJL
         xUW/C5jovjLt56mwXqzHEC3yQNs3SsAtehnwj2Q7oq7GbBQZ7+4CWUyet/Skq5QTUKlY
         2hL/dkNoR2A+to0wsfdkK4GqtV5bVFfs6KYYlXFXeRQcV9M3D6XNI2Iy/9rUczKRinOZ
         ouvKUhX1i8gOw6eKmNLQmLSR7sKu/8VLm1qD079yYie+75u3pbzM/ynPmZlxYTV4+u3K
         sfBo+m7GsjLuiOpGD3geADd4FGy5dzOeya65mam1sR/GedPgOFei2WnOhGRjWhY3WPhk
         W0rA==
X-Forwarded-Encrypted: i=1; AJvYcCVduh9VGm3mglFLSqY++YAgjDmgjn/Vmsh2p+jvj6nbsmTCTKE7NEoOs7sRaQ/8fqtwi2gZKTX/99vMFv4fQwPbYfpvPrkduoYk
X-Gm-Message-State: AOJu0Yw+PIOPJO6lqFCaDpInzEtOAQHI5EusjC6bPv7MEzsKBII3hM85
	De6G6mefJ/ffNtLG/b+e3W/KgBo6gxxmQDo2zOkc5g+HCyjr3BWr4um4iJtfbLk+AnSRSxQC+zT
	qdg==
X-Google-Smtp-Source: AGHT+IEFsToK4Mtfkt/isyLtzSbxuiJaEYiedQjj5sFCo8o3/vbFtfyZ9L8therJfArRWUvkwGk/K/B8SPA=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6902:1002:b0:e05:6961:6db3 with SMTP id
 3f1490d57ef6-e0b54503b59mr2236276.9.1722038090539; Fri, 26 Jul 2024 16:54:50
 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 26 Jul 2024 16:52:13 -0700
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240726235234.228822-65-seanjc@google.com>
Subject: [PATCH v12 64/84] KVM: LoongArch: Mark "struct page" pfns dirty only
 in "slow" page fault path
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

Mark pages/folios dirty only the slow page fault path, i.e. only when
mmu_lock is held and the operation is mmu_notifier-protected, as marking a
page/folio dirty after it has been written back can make some filesystems
unhappy (backing KVM guests will such filesystem files is uncommon, and
the race is minuscule, hence the lack of complaints).

See the link below for details.

Link: https://lore.kernel.org/all/cover.1683044162.git.lstoakes@gmail.com
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/loongarch/kvm/mmu.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/arch/loongarch/kvm/mmu.c b/arch/loongarch/kvm/mmu.c
index 2634a9e8d82c..364dd35e0557 100644
--- a/arch/loongarch/kvm/mmu.c
+++ b/arch/loongarch/kvm/mmu.c
@@ -608,13 +608,13 @@ static int kvm_map_page_fast(struct kvm_vcpu *vcpu, unsigned long gpa, bool writ
 		if (kvm_pte_young(changed))
 			kvm_set_pfn_accessed(pfn);
 
-		if (kvm_pte_dirty(changed)) {
-			mark_page_dirty(kvm, gfn);
-			kvm_set_pfn_dirty(pfn);
-		}
 		if (page)
 			put_page(page);
 	}
+
+	if (kvm_pte_dirty(changed))
+		mark_page_dirty(kvm, gfn);
+
 	return ret;
 out:
 	spin_unlock(&kvm->mmu_lock);
@@ -915,12 +915,14 @@ static int kvm_map_page(struct kvm_vcpu *vcpu, unsigned long gpa, bool write)
 	else
 		++kvm->stat.pages;
 	kvm_set_pte(ptep, new_pte);
-	spin_unlock(&kvm->mmu_lock);
 
-	if (prot_bits & _PAGE_DIRTY) {
-		mark_page_dirty_in_slot(kvm, memslot, gfn);
+	if (writeable)
 		kvm_set_pfn_dirty(pfn);
-	}
+
+	spin_unlock(&kvm->mmu_lock);
+
+	if (prot_bits & _PAGE_DIRTY)
+		mark_page_dirty_in_slot(kvm, memslot, gfn);
 
 	kvm_release_pfn_clean(pfn);
 out:
-- 
2.46.0.rc1.232.g9752f9e123-goog

