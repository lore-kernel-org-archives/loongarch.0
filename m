Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1836517CA01
	for <loongarch@lists.linux.dev>; Fri, 26 Jul 2024 23:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722038009; cv=none; b=KyNXphznjODCy6Bsw/589lXx4dKDj428+PVUOVget9IG+85tVzWW62FGOb4XTrgTqX3cSm5Vc5uutQUzw2JrOJ7TenzHdgV7tHPjkqvVwc8gwXG8RmTkBVv7mznEdjhWCB3TopQ016uS80pLZXzXlHeQ5m+WVpKtb612RpbXmbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722038009; c=relaxed/simple;
	bh=9OmPm/sXETts377Es3w8PthSdVQhTvxkXBBvmqGH6tM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=jIjD8LmVYsTHIg6XJuPK7ldQeO1+0iLKBTgPryW0cwtslMX1nxz72ZaUZlC801SgiasgUxIKySBnliLOSCnYYesioZI5WUbWgTpzV/Syc8EV8EQa0D5G8itBgjtgMb3sRGDh96Gt4GfIj4RuWlCLuopACrua5mPc6pgW6vGTR50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=w/ZHty6s; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="w/ZHty6s"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-1fc6db23c74so11322365ad.0
        for <loongarch@lists.linux.dev>; Fri, 26 Jul 2024 16:53:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722038007; x=1722642807; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=Cx2uwWro3wQxHPvpUbBfNMOIaJj2wri0zL/P/0Je2BI=;
        b=w/ZHty6sAdPVgpOE/i1dCj0n8ibBzNoyi8RsmNTueM2ORbLBsw0ZrCRRiSsRBTzVwz
         di6Pm43GLrZz9P5X8B/YMKOI1j3x7AVKZgFsQwVYe/VGZRFs8d9yoiD6PFUw3no851QT
         aNnvMDnz2+Y04+MkaT2Cd9rV2YBqZwIxPl5toXNISC34twjbvXgSj8CQ7fNQwZE1Z2+g
         TQ8wLxDADzADIyogbBKWGhGRZawcZ3CrN9ynWDIG1wmkR/lcShqkpexAuJ4zlx67LAo8
         EMyPpgdTI86D+KfjGS32OzYt34kpefV0pTeljvDw+2QbS+z1ZRCv+gLhryLi7JxolH5D
         qlzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722038007; x=1722642807;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Cx2uwWro3wQxHPvpUbBfNMOIaJj2wri0zL/P/0Je2BI=;
        b=KsJCRNWvuLcPMXLiZu7xQrFUcE6I2h1JYTzN9PjWFB2yHRWTcKt8bPuAv5g0DMPvqk
         9E1CzgwROxxKfdUd4hG609mHX/Xf1yhshV29KFaEiG3vPa1HvUYbPBapkBbxpgn5irbG
         OaSNUe3G7gxbYgJ3xs6+ys2f0E+2OSL18H1k1wXR08XC778ctgWSKPhGcaFMPGU0PUsc
         90chtCRObidF4ljuAuXE/kcjX0oIq4XZf4WpLLwNV9O5Y9ZS4Cy8zNeeNGoxTKWvXgz6
         wk+W3WwXcVAhW6u9dJPUrj83+l0p95V1vOr7Axw2ihFyT159OOcn5scXmvBv/EkbW3F8
         L0kA==
X-Forwarded-Encrypted: i=1; AJvYcCUPaZX6wx4EZcMAlSr5x+vldK2OAj/U9v7xa4VNYtlX8TjodR5yLYCtCpNoYBLqZpyOHM8vOZNHFFYvixjTAEWTsoZC1S0nESN0
X-Gm-Message-State: AOJu0YzC1T4nXpAQlPfuIrVsWKmiPJ1HSREwJc1PjrQPXV9xM4UOUKiz
	2k6f8PhOQdu2UTsOVDr29ERxUA5uGfM3OYukw0lhM1StdLIepg3EFqgHFCcMN9N4UJDemuwFLPk
	z8g==
X-Google-Smtp-Source: AGHT+IFyTmAdCKGjl4Efd/ur3Lgpr5WGUo8BVtVPeI74QsMUPNsZhPnU9qRmgrxg08u1lYU5BCnREsvFCzc=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:903:41ce:b0:1fa:acf0:72d6 with SMTP id
 d9443c01a7336-1ff0483372emr764645ad.3.1722038007284; Fri, 26 Jul 2024
 16:53:27 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 26 Jul 2024 16:51:33 -0700
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240726235234.228822-25-seanjc@google.com>
Subject: [PATCH v12 24/84] KVM: Use plain "struct page" pointer instead of
 single-entry array
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

Use a single pointer instead of a single-entry array for the struct page
pointer in hva_to_pfn_fast().  Using an array makes the code unnecessarily
annoying to read and update.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 virt/kvm/kvm_main.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 3d717a131906..8e83d3f043f1 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -2763,7 +2763,7 @@ static inline int check_user_page_hwpoison(unsigned long addr)
  */
 static bool hva_to_pfn_fast(struct kvm_follow_pfn *kfp, kvm_pfn_t *pfn)
 {
-	struct page *page[1];
+	struct page *page;
 
 	/*
 	 * Fast pin a writable pfn only if it is a write fault request
@@ -2773,8 +2773,8 @@ static bool hva_to_pfn_fast(struct kvm_follow_pfn *kfp, kvm_pfn_t *pfn)
 	if (!((kfp->flags & FOLL_WRITE) || kfp->map_writable))
 		return false;
 
-	if (get_user_page_fast_only(kfp->hva, FOLL_WRITE, page)) {
-		*pfn = page_to_pfn(page[0]);
+	if (get_user_page_fast_only(kfp->hva, FOLL_WRITE, &page)) {
+		*pfn = page_to_pfn(page);
 		if (kfp->map_writable)
 			*kfp->map_writable = true;
 		return true;
-- 
2.46.0.rc1.232.g9752f9e123-goog

