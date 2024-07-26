Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 032C6181D08
	for <loongarch@lists.linux.dev>; Fri, 26 Jul 2024 23:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722038049; cv=none; b=bOC/zRgFT87SpfHmUJOiG2VXnuRoxzFumqZMqco+a6Lpw0K2LXn7rtLOYEaoWbKac3t9f/EgU1BUAqI+aAmlLervon60N4gdUuJxA1UQfgwMP7sO7Acl2q5g/6Cfy/ltVqPUygigVVyQhZYmxdUlxo2aafXBdY4H/gOmZrRQ5b8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722038049; c=relaxed/simple;
	bh=ZiPrcqIShlRmgFNauo+vxtdzmRhSo46Zz79Lct/JRI0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=hAi6C7WgXyfi76o7j218OTMM6HUPXuCmUvs6VpZvrYDwwAeZ/XZwEZqKpenDGxNYqvlHX/XMK5iJ8NAuCMiT55bnahn1OK62Qe6uWRoiyNn6NIJ7dFall5ISSOHcoGJehWcGD2YyxKlFY3GAR5w1qJlUIXHf4TSlRGWg4QayZzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SmTvxoWV; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SmTvxoWV"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-78e323b3752so1106025a12.0
        for <loongarch@lists.linux.dev>; Fri, 26 Jul 2024 16:54:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722038047; x=1722642847; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=wxuzXAlWAmTLEMJkRQnxVQGU0NLqznOMJ0954FoR3Ro=;
        b=SmTvxoWVkQlhPc40ogtMm6SBUuoZGamwRqdJ7hhBrqRbjjN4+p+2iaDL64uJvqHuEG
         b5aFp8ocD995AWWiAMkmEqz0TWoKmA7/kHGqkMdwljX0IITvy4i53zmx+eSw4yeUFIp6
         Sl7BDGuDzKDyPiRfyJD/87EMMX6STs3Ru49ZLRpEiV/7zy1Vd9EFT2NXCQUFWGhAvEDg
         9Bn5Yqop7COTe16J0Sy6A4GSWUm3n6TkjVzDiNu8IU0AAxxLqRi0T3gKvHhvHVL7JQN5
         k3L2Yn8HXwiPGKttVGEpTlJWTkaIORiHf+E1eQXYC5jEPpK9BfQqeI9xYD9zOYwKdz4U
         UkyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722038047; x=1722642847;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wxuzXAlWAmTLEMJkRQnxVQGU0NLqznOMJ0954FoR3Ro=;
        b=RYcO/3fOTs2rudt9Znoj/nO0fDNW7WCJXm45q6/7e3b1OnXFH5NNthwFegE6LUpJCt
         8pefP0NbtexToFIRJQE607Gw/oPwcmW3k9EJcpXxI6WeGVdF8PSrpfjYJ5iOnn8CP3wE
         Nt0HLpqn2QLBZ+LOye0Wx1bijReHUhVjZgO3Jd4QUW9W2yXKYHW+Vav39hNNl7JEZYqy
         mjZLWvGtpS1YlPxfnT89+YYJ36ymTjo96rYWgl7Yg6/h6ZTsgb7lUEQ2oh4gYDKEYVHL
         JhWbhywktfeGAgcEYjUAR9gyNBOgDjO0E82K9SzsLF9nEDaJ9pysXtXKi0AzeF2qbdVl
         rLWQ==
X-Forwarded-Encrypted: i=1; AJvYcCVPbsJ7yLYONwC8rLpAGMaT260DUYniEmz5WkK7xUWNdq2zfN3Kum+5tChZnYPRe8GcNv+o3e70TBf/1mSXFu5gdqkqax63IEbG
X-Gm-Message-State: AOJu0YzzGUem6i1vRAhFoCLI0l9EIdLl3Sf4Tc/aAzqnoKcJpNsCHDzX
	jpGxEYF+yIfo4b5lVHzRZ2YknR+T8hHbRvXzZT2llNJo9EgDFrbYztzznD3vIu8vEQrOLRSSTlr
	8UA==
X-Google-Smtp-Source: AGHT+IHHkDF9jDFipyHQqfPDWUmaQYRR7lKWyDIChzQG4y5VknOXhGJqf1L9qSRAYqKwiuxxpki7u8BCvjE=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a63:141f:0:b0:6e5:ef07:5922 with SMTP id
 41be03b00d2f7-7ac8d9d818bmr4158a12.1.1722038046008; Fri, 26 Jul 2024 16:54:06
 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 26 Jul 2024 16:51:52 -0700
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240726235234.228822-44-seanjc@google.com>
Subject: [PATCH v12 43/84] KVM: Add kvm_faultin_pfn() to specifically service
 guest page faults
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

Add a new dedicated API, kvm_faultin_pfn(), for servicing guest page
faults, i.e. for getting pages/pfns that will be mapped into the guest via
an mmu_notifier-protected KVM MMU.  Keep struct kvm_follow_pfn buried in
internal code, as having __kvm_faultin_pfn() take "out" params is actually
cleaner for several architectures, e.g. it allows the caller to have its
own "page fault" structure without having to marshal data to/from
kvm_follow_pfn.

Long term, common KVM would ideally provide a kvm_page_fault structure, a
la x86's struct of the same name.  But all architectures need to be
converted to a common API before that can happen.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 include/linux/kvm_host.h | 11 +++++++++++
 virt/kvm/kvm_main.c      | 22 ++++++++++++++++++++++
 2 files changed, 33 insertions(+)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index ef0277b77375..e0548ae92659 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -1217,6 +1217,17 @@ void kvm_release_page_clean(struct page *page);
 void kvm_release_page_dirty(struct page *page);
 
 kvm_pfn_t kvm_lookup_pfn(struct kvm *kvm, gfn_t gfn);
+kvm_pfn_t __kvm_faultin_pfn(const struct kvm_memory_slot *slot, gfn_t gfn,
+			    unsigned int foll, bool *writable,
+			    struct page **refcounted_page);
+
+static inline kvm_pfn_t kvm_faultin_pfn(struct kvm_vcpu *vcpu, gfn_t gfn,
+					bool write, bool *writable,
+					struct page **refcounted_page)
+{
+	return __kvm_faultin_pfn(kvm_vcpu_gfn_to_memslot(vcpu, gfn), gfn,
+				 write ? FOLL_WRITE : 0, writable, refcounted_page);
+}
 
 kvm_pfn_t gfn_to_pfn(struct kvm *kvm, gfn_t gfn);
 kvm_pfn_t gfn_to_pfn_prot(struct kvm *kvm, gfn_t gfn, bool write_fault,
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index ad84dab8c5dc..6dc448602751 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -3134,6 +3134,28 @@ kvm_pfn_t kvm_lookup_pfn(struct kvm *kvm, gfn_t gfn)
 	return pfn;
 }
 
+kvm_pfn_t __kvm_faultin_pfn(const struct kvm_memory_slot *slot, gfn_t gfn,
+			    unsigned int foll, bool *writable,
+			    struct page **refcounted_page)
+{
+	struct kvm_follow_pfn kfp = {
+		.slot = slot,
+		.gfn = gfn,
+		.flags = foll,
+		.map_writable = writable,
+		.refcounted_page = refcounted_page,
+	};
+
+	if (WARN_ON_ONCE(!writable || !refcounted_page))
+		return KVM_PFN_ERR_FAULT;
+
+	*writable = false;
+	*refcounted_page = NULL;
+
+	return kvm_follow_pfn(&kfp);
+}
+EXPORT_SYMBOL_GPL(__kvm_faultin_pfn);
+
 int kvm_prefetch_pages(struct kvm_memory_slot *slot, gfn_t gfn,
 		       struct page **pages, int nr_pages)
 {
-- 
2.46.0.rc1.232.g9752f9e123-goog

