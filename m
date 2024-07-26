Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97BEF15B541
	for <loongarch@lists.linux.dev>; Fri, 26 Jul 2024 23:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722037985; cv=none; b=qt9XdQ7JETUn0zcpXC2k43ktBsaVN9s6adgFTqOhTPGsqmJ7gyPr/hOGjAOXq+eE2SbK7ol+wEUXL1RtiB5Pu8GcBRLlNAJXheoZ88sZIaQTYSv9CuJI9eFyv2pbagRYI/p7qWr2jahyTtorNAAk/zvT+LHxCfN3SclN+xdrFAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722037985; c=relaxed/simple;
	bh=izT0ZHXrcrHipMlKscBt522ZpbrYe6ZS+CksnjxIp6E=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=kjPPkEGQDT3Inyqx8aCtXpkR0tQ0qj/QJurcvUC7/ysufpRjjcaR2Mb2LwC5nYbWf2++Mka8b3k2kuckAzfTxc/1cK4lidlpC7KQv2VjYpszIkGVW8skZUUHq28RNgVC3HB4sismuwpSLk1zIVrooaQQcg/GghHDxTQeNBZZArY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=F2G6yEnU; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="F2G6yEnU"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-1fca868b53cso10617245ad.1
        for <loongarch@lists.linux.dev>; Fri, 26 Jul 2024 16:53:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722037984; x=1722642784; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=G8vTlhvtYFVN9mhfz5x+cQCHJ6x1sNjhm2Vdu8bZ6Vo=;
        b=F2G6yEnUbVCO5IHJhaCk/bl2KNNgNFuClvldi/LLs8hnL372W374kUNxIseCKKmx9q
         FrjAYTV9OxLyjl5H+UKxZSYI/o6WS3H6btxoBUVg/f91cRtjdszz8nkaJLY39VcAS88n
         grN11vcteSOdQmYdGx7znPmb9Oph0eAg900R1qij8ovvPWe8iUMCr5G1xo42sKc8kNoe
         0Odxhl69LokM7ar0p0NXWWg5kOF0NdkFDjaTjGu7oEgoOY6i52CcyQBKrvHlgVQq2PxL
         cLouzGHTwxwo5JKjfW4p8K5wOqUlCo5DnN084hAG5OI7e7sBNxDwPsharyan1rqxvWNm
         TUGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722037984; x=1722642784;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G8vTlhvtYFVN9mhfz5x+cQCHJ6x1sNjhm2Vdu8bZ6Vo=;
        b=Gqr8Qhcb6RlX2EXY1k21Tjxk8MPKFotZvEozkNpylSF92oUd3jMUo13kaEusMcu82a
         6LmTX4WvoQn1BV9OAlvYFnGF+qyApo09z3o1aCAfNK/HKtvpf+pFt61doIOOIDR3x02v
         wxU3EYcS7Isf/3su/TgOJBODaLqOtDkQ5XWUd35qDMw62F9ytT6yCzkqLbC1rHeoH9jG
         Gkyyt8AXoR84oN9z0AjRU4SPEAHfr4tiV6+Pj1+ZsFlAtCtUFF+jylyWPDwWvOpUkRA5
         bhFo0wXXQnHuqjt0kwMaw+D9rkHp6B7W5EdkWsKkucdVDwkuX2ukULyHXNDviTHQxTIr
         sfpA==
X-Forwarded-Encrypted: i=1; AJvYcCXLCwZAqM43OkqWmZUWOL0WfJKjKNL3Jd9G3qzN+y9eN54a6fT/m+gKFAHyth15nLyFli3JgKgPW53Ja3WY0/i8iHvR7ZJPmirT
X-Gm-Message-State: AOJu0YwDYUW6jWU0I2qoXaDQipcO7hohPudyg5spDjRLz6EXJaDLaGu/
	wEXGcm9nA400oRBkj/BOp1+g4fBYQiYB0vkKAYYA880yl3LumUPC1Z3KJE4gUVa4YpKqOeT95kz
	TBg==
X-Google-Smtp-Source: AGHT+IGcvEjw3oRLgbDLJZa9I5d4JQMYDdZeA/FUbXpEzYyt5G6Xd+JdRMAKGNKsfMlLtXc62VqHMV40c8I=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:903:234e:b0:1f6:2964:17b8 with SMTP id
 d9443c01a7336-1ff0492c71fmr137005ad.10.1722037983933; Fri, 26 Jul 2024
 16:53:03 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 26 Jul 2024 16:51:22 -0700
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240726235234.228822-14-seanjc@google.com>
Subject: [PATCH v12 13/84] KVM: Annotate that all paths in hva_to_pfn() might sleep
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

Now that hva_to_pfn() no longer supports being called in atomic context,
move the might_sleep() annotation from hva_to_pfn_slow() to hva_to_pfn().

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 virt/kvm/kvm_main.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 84c73b4fc804..03af1a0090b1 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -2807,8 +2807,6 @@ static int hva_to_pfn_slow(unsigned long addr, bool *async, bool write_fault,
 	struct page *page;
 	int npages;
 
-	might_sleep();
-
 	if (writable)
 		*writable = write_fault;
 
@@ -2947,6 +2945,8 @@ kvm_pfn_t hva_to_pfn(unsigned long addr, bool interruptible, bool *async,
 	kvm_pfn_t pfn;
 	int npages, r;
 
+	might_sleep();
+
 	if (hva_to_pfn_fast(addr, write_fault, writable, &pfn))
 		return pfn;
 
-- 
2.46.0.rc1.232.g9752f9e123-goog

