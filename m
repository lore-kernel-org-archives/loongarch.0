Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B16B18C356
	for <loongarch@lists.linux.dev>; Fri, 26 Jul 2024 23:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722038097; cv=none; b=tDFa/pkfYHRDymi0hZQFD77V6sMVrxYelxdwaVqESRifPXlidvmeRfMkDMtqvggpNioKtpiwIz4CEV7fboKijeVbjvRBJG2/+t9RNskmnMUA5o4wMfSV1WGhP01rcYmOaNWDX/i3JXL5cvNuJLVRJcrds++GzRmWLS0n+o8MVuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722038097; c=relaxed/simple;
	bh=p4k5vgBtys8Iq9l8Spp/J/Js17wYLPMbdqXjO7cF1ww=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=gHHtnRS+XmQLVwpNhTsEFfFsn2Ud0ctqSm2rIrNHeeDLm3o0MVygu+je8ukwtmFMU5uPnS6H16VsfiCU7EonytFzRvUm48S2bFMIux4SvnSxSiWn4IjeNov+5xkKxsnOonWG3musqR/yMetdeZGuDtnpvQ1Gu8GVGMYhMyAi6gM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=36mxGVfy; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="36mxGVfy"
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-66a2aee82a0so6621007b3.0
        for <loongarch@lists.linux.dev>; Fri, 26 Jul 2024 16:54:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722038094; x=1722642894; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=r/0kdPmZ+ClWir3sWShoQK9y6l+vrSl7wHPcCrpa8dU=;
        b=36mxGVfy0sV1u2HR9cgzzixn3CBstbS7WuL2eJ+XP6QCW1UW1i2afPqysLgDJ9u9Ls
         ihZ/iRxTndLN5Hg+cmpqUR6Ya/04w6BIQY59MDSbBXo2TckkuBsbpHfs4jbDmG0nRn2p
         EaB2Z6dLJ8hFb3LmwnTEXKU2t20XYIaxEAOZx0392rxno1NLNkL1pf/6U1fkDC5wIft5
         2IHT36ii7JhaHTaYencHGyGvW+kmxDJ2GxgikRA1tsRYj7gfmdbf9VpwbCr+Dwh3A70b
         ufpRV/ZH6l9bVaYICr7u66G2DKXuedtFDCeQDJxATJefIZv8IZaRozCNfdZr9xLQDZHq
         tEpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722038094; x=1722642894;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r/0kdPmZ+ClWir3sWShoQK9y6l+vrSl7wHPcCrpa8dU=;
        b=e7HlqbxSSGtANo7aaAm0m1fdmX395rKIqz4ki0bGDvlaUxEvgY88caoqgZ6LyVQEgn
         2vNf3q+bUEz5B4BQvJdva0pgrg3VgSRhe/DGIx8XlmBGnozY9MxIFj0MOUqE1Ixaxg3G
         hZ7rQuLjfqQh4gSDR7vEgF5pEFsePGdv6WNtrVXwVMViHCCDyKHA3vW3BeskKHNjQ79G
         sathOi6gplUfK0V6MAqAs3j6cf0h6XJov+k/kYglq861aJ3pxC4UW5qZG8zPZNe2OrZd
         KmFndzUqzBowrOCgiywfxdjzQV1yfC+4TPf2pfOp3jBu0wJg+Mj+swYfhh9DQgOeESgX
         +EdA==
X-Forwarded-Encrypted: i=1; AJvYcCXYOiDwS192z0ArMZzRp9d3rfBlaRAyL4q73GYBGWSXw97H4JfC/mPE6G2Mi4R0nY6RiWHcxKP77Kh9YLgH1Rk4PWqnv6Ff+VQi
X-Gm-Message-State: AOJu0YxNwLrr4Nlm3oAT1lMy5ktfNg3h87vW1Nla2ieHGE718PYZU5GW
	NXHH1Fb8EeXbpgfK5mQy9YJTkJXv6sWOeC43Z5KwrYyAe/1nd56OdB5hH8SrB1hRZ9y9Q6ZKdZy
	LIw==
X-Google-Smtp-Source: AGHT+IFfaCc2nH86ghdgf4dpmC6KBZ4LBEB5Lf4TmkgG+fOYVVXJfjBbiJJRrvW3lQJXVsfLzyeGSOH6WxY=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:690c:830:b0:61b:e103:804d with SMTP id
 00721157ae682-67a004a2a4amr37847b3.0.1722038094439; Fri, 26 Jul 2024 16:54:54
 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 26 Jul 2024 16:52:15 -0700
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240726235234.228822-67-seanjc@google.com>
Subject: [PATCH v12 66/84] KVM: LoongArch: Mark "struct page" pfn accessed
 before dropping mmu_lock
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

Mark pages accessed before dropping mmu_lock when faulting in guest memory
so that LoongArch can convert to kvm_release_faultin_page() without
tripping its lockdep assertion on mmu_lock being held.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/loongarch/kvm/mmu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/loongarch/kvm/mmu.c b/arch/loongarch/kvm/mmu.c
index 52b5c16cf250..230cafa178d7 100644
--- a/arch/loongarch/kvm/mmu.c
+++ b/arch/loongarch/kvm/mmu.c
@@ -902,13 +902,13 @@ static int kvm_map_page(struct kvm_vcpu *vcpu, unsigned long gpa, bool write)
 
 	if (writeable)
 		kvm_set_pfn_dirty(pfn);
+	kvm_release_pfn_clean(pfn);
 
 	spin_unlock(&kvm->mmu_lock);
 
 	if (prot_bits & _PAGE_DIRTY)
 		mark_page_dirty_in_slot(kvm, memslot, gfn);
 
-	kvm_release_pfn_clean(pfn);
 out:
 	srcu_read_unlock(&kvm->srcu, srcu_idx);
 	return err;
-- 
2.46.0.rc1.232.g9752f9e123-goog

