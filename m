Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2EF5181CEE
	for <loongarch@lists.linux.dev>; Fri, 26 Jul 2024 23:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722038048; cv=none; b=kMut2B2AIFZVAKTGmidnvtwUTs6whSOmgAdPWRUEWDypZMlzlXVK/hVYvBaSaVAw9U5L2Y+TECqMbUoiBraAko0c0jXAWYKE9yMFqGF4d3XBYzheQGtTR6QSH6Vh2kv1jlxJPZX8Riklk5Naw40oVBmXJZlERzdWI5aY3oTq3uY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722038048; c=relaxed/simple;
	bh=UWINRAqNW2M8Y4oOWNTo24b9GyZbmPXxBUrdFtS1EX8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=OwAeSy/DUEyq+jpQ/HaGSl9I8prw4RqlpzPkhMzg/JujlIJDf8GMUz857gHVjd7T/kPpgohxIMBaAOpWwNJQBx5O8dRm1z4hqxihtezzQBEy5hUIJ4d8pNBUTlQNgq7lvJ+yt4I35DYhoSYNslgPu/DkJOZPQt2GYHH6Me4RpUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vuY4G9VT; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vuY4G9VT"
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-664c185a606so7416977b3.2
        for <loongarch@lists.linux.dev>; Fri, 26 Jul 2024 16:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722038044; x=1722642844; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=66tkjZePX8REZ4BHWwuGWSSOzSubgrfSmhtIFHX3PRM=;
        b=vuY4G9VTzkrtKYtkoIDRIkVumRaCC8aGEZ5Mua+q2XIGMCPi3jd7Hc9tOOnmIAkqNT
         +D6l53cKNfeJYZ7eEvlBlae5CEL1+ZLEvN5UAqaQM0T45kkQXr+P7rl/FX7v39qngBbQ
         z+LIAurbgDXz9H9iyYGZHkeaDFkG5F6xuhTmDl8WWsRWyxnWQASUhR3VWMoZ0YxSqD41
         QvzN9cvfIlnjCl/FlIdMMJ4E15TUaY01Uyk+wi6yO4kYikVK73yCFHbqMiaRANTELyGD
         harqbvsSc/UZUWGmCZWKyDbKnwFRSLnROtLeSDHE0VuYsPnDR6AHEIUBNUthGjgpff2X
         YtUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722038044; x=1722642844;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=66tkjZePX8REZ4BHWwuGWSSOzSubgrfSmhtIFHX3PRM=;
        b=KjOrs/ZuSN3btIi8oW9v/RKxZjuMLYfqE9mRHNMJbvK3zHpCn88Nol5ghEkic0gA/k
         VAZn2ib6fEgurt7/axypI2eYbDy/L49VFNF5q0t9OHEuaQYJc6YatyxPyzsI5Wggo3Lt
         EWqEDU2+zBzgpDdKJwBA7ZpucPDCpSygUXrsjPUlYOKxBx2bL24JqTxcGkdDXbxHCpcN
         IPaO3pMfKCn2aMhjJzxpgRrCY/VSwgmhJ7yGi41lu/+VDbtieuw2bMmZDMySqN6Wdy7D
         XFk9KdMtE7PmzTfpWIsNQ2HeOlaaJgpWr3uuKfaJQVgkgv6f5TuDVUdgjq8fQMbUJ8ca
         IG0Q==
X-Forwarded-Encrypted: i=1; AJvYcCXeDgE4pO+dxkVxRYD5YzXheDpkGugiX9l0DPXR8QUP1qGHk4vTFDds5n4fofcztIm3qR8vyIIxg4nwPvd8YXrIS5DRhMY8YbVx
X-Gm-Message-State: AOJu0YyP5XSXITbkj8aDL1JiAkx14LVXZL5aGXhL+4S1cFMbYtTgeToO
	pO2tW912J79wT4wEG+69Noy/qOxdBNYhfxxDP9EfcwQaXgUn+zAVp69OeseYv0kaVbX92Qms2CY
	gWw==
X-Google-Smtp-Source: AGHT+IEXCHhy0parcxZWaUKhAkA9z5ds6aScUvbMwsWWyatCr0tT87bBO0XasR4cX5mU+wgB/x+9BeJQnC8=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:690c:f92:b0:673:b39a:92f2 with SMTP id
 00721157ae682-67a0a7fd778mr244297b3.7.1722038044118; Fri, 26 Jul 2024
 16:54:04 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 26 Jul 2024 16:51:51 -0700
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240726235234.228822-43-seanjc@google.com>
Subject: [PATCH v12 42/84] KVM: Move declarations of memslot accessors up in kvm_host.h
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

Move the memslot lookup helpers further up in kvm_host.h so that they can
be used by inlined "to pfn" wrappers.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 include/linux/kvm_host.h | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 5a572cef4adc..ef0277b77375 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -1153,6 +1153,10 @@ static inline bool kvm_memslot_iter_is_valid(struct kvm_memslot_iter *iter, gfn_
 	     kvm_memslot_iter_is_valid(iter, end);			\
 	     kvm_memslot_iter_next(iter))
 
+struct kvm_memory_slot *gfn_to_memslot(struct kvm *kvm, gfn_t gfn);
+struct kvm_memslots *kvm_vcpu_memslots(struct kvm_vcpu *vcpu);
+struct kvm_memory_slot *kvm_vcpu_gfn_to_memslot(struct kvm_vcpu *vcpu, gfn_t gfn);
+
 /*
  * KVM_SET_USER_MEMORY_REGION ioctl allows the following operations:
  * - create a new memory slot
@@ -1290,15 +1294,13 @@ int kvm_gfn_to_hva_cache_init(struct kvm *kvm, struct gfn_to_hva_cache *ghc,
 })
 
 int kvm_clear_guest(struct kvm *kvm, gpa_t gpa, unsigned long len);
-struct kvm_memory_slot *gfn_to_memslot(struct kvm *kvm, gfn_t gfn);
 bool kvm_is_visible_gfn(struct kvm *kvm, gfn_t gfn);
 bool kvm_vcpu_is_visible_gfn(struct kvm_vcpu *vcpu, gfn_t gfn);
 unsigned long kvm_host_page_size(struct kvm_vcpu *vcpu, gfn_t gfn);
 void mark_page_dirty_in_slot(struct kvm *kvm, const struct kvm_memory_slot *memslot, gfn_t gfn);
 void mark_page_dirty(struct kvm *kvm, gfn_t gfn);
 
-struct kvm_memslots *kvm_vcpu_memslots(struct kvm_vcpu *vcpu);
-struct kvm_memory_slot *kvm_vcpu_gfn_to_memslot(struct kvm_vcpu *vcpu, gfn_t gfn);
+
 kvm_pfn_t kvm_vcpu_gfn_to_pfn(struct kvm_vcpu *vcpu, gfn_t gfn);
 
 int __kvm_vcpu_map(struct kvm_vcpu *vcpu, gpa_t gpa, struct kvm_host_map *map,
-- 
2.46.0.rc1.232.g9752f9e123-goog

