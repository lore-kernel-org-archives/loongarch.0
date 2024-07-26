Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DED317F51E
	for <loongarch@lists.linux.dev>; Fri, 26 Jul 2024 23:53:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722038029; cv=none; b=CSURewsRnI9JfbrapTGfZ9vCzz3mNo0AKgQtZcaYSXOQ7Dca9jLwaKHPK1qLs0grD3Na8l5DoADePSoG6UNMDQ25iJneQDIz+wv+TgjRuI0qk1GQZKq056Bj+YHWnx+wAFNhInrQCzD/zN3kw1UBXmbTxKvE4Gf18eSe7ok131E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722038029; c=relaxed/simple;
	bh=8U41yEZkwmCC7j8hL2o/rtiKo/Y2IzaocSdWcXfAeko=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=i/4yX5u/jpqm/HDPbQUEQ/AKPOsOOho6lBrtmURN2q3Yb54ri0Z9PLBZ9+PkFvhBXGD2mzfaClSjbfUfDSBtWqDCvbyrBzWVnvA0BrqFtpYizKQjIG++0ck07WZytnjpgvJQQzKkRa+klH1bbFQWNJ7rD11FHcyg3kS9qaqy8AU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ww70KDS+; arc=none smtp.client-ip=209.85.219.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ww70KDS+"
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-e087ed145caso389913276.3
        for <loongarch@lists.linux.dev>; Fri, 26 Jul 2024 16:53:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722038026; x=1722642826; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=TLCx2qDCvkD9gyhhD5S2JLlOeuoeLAn7xH7FruJz3kQ=;
        b=ww70KDS+/eP2LH0MAFiljYF9pZbxcBRj7xRjaiH5ukG0U0nbAmYWrLZBeICOMCaAbK
         /N4bG7NYBRsl7m7fEKk6qAVLhekJlReHI+YYiddL3FUzLEe4Vvbm9vxU/Fi5Q7ah8lMt
         Gvvz44eA1uDx0abbulkXrGAVrJl8fEKx8Sp7oG9EYp3SLBythCmXmS6ykSn1OQYWeEvW
         IACmkkoI7gYpFelTYP5ruMoSpD0iMJOXzUGJbPbfNttE5hYbkfoqGcbMcZNVcJc8NZCp
         Sxdm+Iip5vuwVHXrIfBrujosMewv3bQxd0kMTgqXh1/HqgnLfXKA9MnePUHvwYKXVPS7
         wF1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722038026; x=1722642826;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TLCx2qDCvkD9gyhhD5S2JLlOeuoeLAn7xH7FruJz3kQ=;
        b=eLVrXuvftZ3/auURIGvgp4K5BfXpnzdei9S5K6nJUZ+vCi9kEXO5FnHXMhEekIpKMB
         aJqpOBL2ppM/2hj8YMlM0ezhupMP8Z/vQ9tdDPefQROo6F7yy5sFDjguK9tl8GaLCwEH
         hqhRjfswHxU9GbP4fg+0ixN5xRpTPmkPQA0NunGPyb/NWgYDy+HpsuNx3Zw8H6EcXBOu
         BC/ptl0O6j8zjtG0KVINvv7eHx8Xb+Tk8ND8dC/ntu5ujOhjM79cw1/wepkcXMpIYQWB
         koowoO8wOvePyWVWQMKDPs062f5MBBj3X4J+ekW+Mfi7QscWhucZrBZtrwyM5DvCIaBj
         MrpA==
X-Forwarded-Encrypted: i=1; AJvYcCVDgfv7hNLJHQs+TbFnZv0eVSmfIpkUJ7qHVQtYFA78E2CIy8vem9CnWTwhw1Kmkosfq6rNRgGFWJo3Rjf59cgW6gM+jd7XKidP
X-Gm-Message-State: AOJu0YzfZGDlRBgNUHMV9b6q+1ztz4u/oJKztywa94fV6fGuCnSGAlez
	bIf6rXAoSoECETLCEpnE+tpFovAI8r88nyyTFf/HOfU5HAuZ2XoyDsRXJ8J6i4Y/57QDQWj8S2a
	Y9Q==
X-Google-Smtp-Source: AGHT+IFuGqnDYAUSJ5FmVd85CGAsbS7YYsLTPQN/3Ul7QhkRMd8+dVyQHeeD8wiMpZyrbrthnX4Q+b9wtNM=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6902:1005:b0:e0b:f93:fe8c with SMTP id
 3f1490d57ef6-e0b5427fa67mr79832276.0.1722038025699; Fri, 26 Jul 2024 16:53:45
 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 26 Jul 2024 16:51:42 -0700
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240726235234.228822-34-seanjc@google.com>
Subject: [PATCH v12 33/84] KVM: Disallow direct access (w/o mmu_notifier) to
 unpinned pfn by default
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

Add an off-by-default module param to control whether or not KVM is allowed
to map memory that isn't pinned, i.e. that KVM can't guarantee won't be
freed while it is mapped into KVM and/or the guest.  Don't remove the
functionality entirely, as there are use cases where mapping unpinned
memory is safe (as defined by the platform owner), e.g. when memory is
hidden from the kernel and managed by userspace, in which case userspace
is already fully trusted to not muck with guest memory mappings.

But for more typical setups, mapping unpinned memory is wildly unsafe, and
unnecessary.  The APIs are used exclusively by x86's nested virtualization
support, and there is no known (or sane) use case for mapping PFN-mapped
memory a KVM guest _and_ letting the guest use it for virtualization
structures.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 virt/kvm/kvm_main.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index a28479629488..0b3c0bddaa07 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -94,6 +94,13 @@ unsigned int halt_poll_ns_shrink = 2;
 module_param(halt_poll_ns_shrink, uint, 0644);
 EXPORT_SYMBOL_GPL(halt_poll_ns_shrink);
 
+/*
+ * Allow direct access (from KVM or the CPU) without MMU notifier protection
+ * to unpinned pages.
+ */
+static bool allow_unsafe_mappings;
+module_param(allow_unsafe_mappings, bool, 0444);
+
 /*
  * Ordering of locks:
  *
@@ -2821,6 +2828,9 @@ static kvm_pfn_t kvm_resolve_pfn(struct kvm_follow_pfn *kfp, struct page *page,
 	 * reference to such pages would cause KVM to prematurely free a page
 	 * it doesn't own (KVM gets and puts the one and only reference).
 	 * Don't allow those pages until the FIXME is resolved.
+	 *
+	 * Don't grab a reference for pins, callers that pin pages are required
+	 * to check refcounted_page, i.e. must not blindly release the pfn.
 	 */
 	if (pte) {
 		pfn = pte_pfn(*pte);
@@ -2942,6 +2952,14 @@ static int hva_to_pfn_remapped(struct vm_area_struct *vma,
 	bool write_fault = kfp->flags & FOLL_WRITE;
 	int r;
 
+	/*
+	 * Remapped memory cannot be pinned in any meaningful sense.  Bail if
+	 * the caller wants to pin the page, i.e. access the page outside of
+	 * MMU notifier protection, and unsafe umappings are disallowed.
+	 */
+	if (kfp->pin && !allow_unsafe_mappings)
+		return -EINVAL;
+
 	r = follow_pte(vma, kfp->hva, &ptep, &ptl);
 	if (r) {
 		/*
-- 
2.46.0.rc1.232.g9752f9e123-goog

