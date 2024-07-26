Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EF75187842
	for <loongarch@lists.linux.dev>; Fri, 26 Jul 2024 23:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722038081; cv=none; b=OAPtsisBOBG4HKGk0xkZhlLFs0fKGC/xNLHoUlQphOgnG3aDQDK29B5fWr12tHths2UXRQCibXKhuDJeZpzLZBwNDILG/ff/MKGcukKOe1MgYYediPCTr94WrfS0q89sHhRz23/dVbVGQk/Y4my6u+FsWZTiNuV1eqrMvN4iTc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722038081; c=relaxed/simple;
	bh=QKdqSeDurXwkoaj80ZjKrbgXs0BzbdNHTlCFTKbvwVA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=mdoGEeaEJlJuQ7DbT7vY32SdLshPJRf4zHLPpSzYn9WClh9/pqRwXKv8uJmo/0j5GGltHFrJIMa8+ldQ7i3j8hXIZFjuZAM6KVSe6YcFqumN6ccKmTCg3PA1JW2OwrTP3OFDMYW+BXSZ8CDRbBJle+OSN1uL3wYISqCVVESdrqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pTre/yDn; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pTre/yDn"
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-672bea19dd3so7035727b3.1
        for <loongarch@lists.linux.dev>; Fri, 26 Jul 2024 16:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722038079; x=1722642879; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=lKpu7mXAQaRbYxbEDOwpqeV9V2sn6fCg4Pm2+RclqqE=;
        b=pTre/yDnrcv3K8BNSy2BCrR5h4HudzyGAoFW82UdPSLh7PCGDLSYEf6J+B4agveiaN
         HkMnO8/4pFiwvEJHvyVEF4YgL06eh/3X8ex8avpDJJuX2rLJ7RUDgAs0vNFQJ/qhxmIW
         eVv2VEU/az+BNSVdhLFHSS+y5WsvpmgCn8s4iJjAxayx6m8lygtaXTA6q8KEQ+yWMjvB
         vPyLVJfza+tYvQyC0vXB4+yAI0OiZFarFnZ5tt93pNPf/BAFdu5OOjYPR2FcS/r+mEG3
         D4K1pJ23kCz9QONYiCknHWu2wWsAXkCcAffo6XBuanvHoKno5XmPZ9XkkJhtb/G3sde9
         cT2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722038079; x=1722642879;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lKpu7mXAQaRbYxbEDOwpqeV9V2sn6fCg4Pm2+RclqqE=;
        b=lw+w6DXC76DbEB4Mvc1ln45KEk/axH7fYcLMjL9AauO1dXI5V5FKh6AqispFmVTwyx
         pXwVaj5Z/GWu/vR5aBzdFwCRGBeJRCnaTw8KO0WDMO0ip7lANXG2WwoZ2ntDG84DbhOC
         x13O9P+ji5+dkTuH8rjXBwPY9Mjs9J6KtwdeSo0ULyx2jpKMvtKDION3rdMQrn+YK4ME
         8GbFf50AniaJl5udva5psxdxaULdyRr3ZfJcGcnKLX7d4k2cIsze/XAtznYoAMLPvYlI
         ADzSwZMnEUEmEsGnMYb98mVtn28T9QhNuBai+NoMDXC8kFuEy/X9ZbaFn+i8iqrGNAen
         zGRw==
X-Forwarded-Encrypted: i=1; AJvYcCU8IgeRIIiPEckUeSus5H47EgG+REhEsYCf2ru6nn1Anq8XuvZ+2ze8YdcjLO7Bo9NRu1gdf3PvFL7jF845erS2C9+INtrG2JhD
X-Gm-Message-State: AOJu0Yy86qhb7IUiXBN5q7QDFcnELvLNQXrDphq+kF/IVD1E4XqglTtq
	4KcNq0O55tun/w0iRG4keLmxsopJSptl7OhIQgEr1vSihaOAtVJD08wdNOH0gUK8JAG+DL91W5u
	73Q==
X-Google-Smtp-Source: AGHT+IHhzhjU3Z65Ec9zcL96WqENi83QMIcwPrprR++iZTSrPH87Hnrc6/v3lgb0Tgsr4AkAwll8yu22uIk=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:690c:ec3:b0:663:ddc1:eab8 with SMTP id
 00721157ae682-67a088f07bfmr790257b3.4.1722038078515; Fri, 26 Jul 2024
 16:54:38 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 26 Jul 2024 16:52:07 -0700
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240726235234.228822-59-seanjc@google.com>
Subject: [PATCH v12 58/84] KVM: RISC-V: Use kvm_faultin_pfn() when mapping
 pfns into the guest
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

Convert RISC-V to __kvm_faultin_pfn()+kvm_release_faultin_page(), which
are new APIs to consolidate arch code and provide consistent behavior
across all KVM architectures.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/riscv/kvm/mmu.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
index 806f68e70642..f73d6a79a78c 100644
--- a/arch/riscv/kvm/mmu.c
+++ b/arch/riscv/kvm/mmu.c
@@ -601,6 +601,7 @@ int kvm_riscv_gstage_map(struct kvm_vcpu *vcpu,
 	bool logging = (memslot->dirty_bitmap &&
 			!(memslot->flags & KVM_MEM_READONLY)) ? true : false;
 	unsigned long vma_pagesize, mmu_seq;
+	struct page *page;
 
 	/* We need minimum second+third level pages */
 	ret = kvm_mmu_topup_memory_cache(pcache, gstage_pgd_levels);
@@ -631,7 +632,7 @@ int kvm_riscv_gstage_map(struct kvm_vcpu *vcpu,
 
 	/*
 	 * Read mmu_invalidate_seq so that KVM can detect if the results of
-	 * vma_lookup() or gfn_to_pfn_prot() become stale priort to acquiring
+	 * vma_lookup() or __kvm_faultin_pfn() become stale priort to acquiring
 	 * kvm->mmu_lock.
 	 *
 	 * Rely on mmap_read_unlock() for an implicit smp_rmb(), which pairs
@@ -647,7 +648,7 @@ int kvm_riscv_gstage_map(struct kvm_vcpu *vcpu,
 		return -EFAULT;
 	}
 
-	hfn = gfn_to_pfn_prot(kvm, gfn, is_write, &writable);
+	hfn = kvm_faultin_pfn(vcpu, gfn, is_write, &writable, &page);
 	if (hfn == KVM_PFN_ERR_HWPOISON) {
 		send_sig_mceerr(BUS_MCEERR_AR, (void __user *)hva,
 				vma_pageshift, current);
@@ -681,11 +682,7 @@ int kvm_riscv_gstage_map(struct kvm_vcpu *vcpu,
 		kvm_err("Failed to map in G-stage\n");
 
 out_unlock:
-	if ((!ret || ret == -EEXIST) && writable)
-		kvm_set_pfn_dirty(hfn);
-	else
-		kvm_release_pfn_clean(hfn);
-
+	kvm_release_faultin_page(kvm, page, ret && ret != -EEXIST, writable);
 	spin_unlock(&kvm->mmu_lock);
 	return ret;
 }
-- 
2.46.0.rc1.232.g9752f9e123-goog

