Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDADF155A25
	for <loongarch@lists.linux.dev>; Fri, 26 Jul 2024 23:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722037968; cv=none; b=EJYXl2Z6F4oha7QNSF/L83nFFbkt4DjRD4J9OSwD6wzjvyUzUNdvcpX3+yAwFfCE1YdlbPFXIiB3j3rFdbO56PXQpfToXUp4hEqXSzZgb3CtFsAFbO9b1t1P0EBdmnyytKlskdkErRXTDBNeJ8hN3oe6YR3SBrH1raqLBR5+RPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722037968; c=relaxed/simple;
	bh=nMIA0IB61sSIVDFSpMoIESja3SRG4qTvpXk7E9I+g3Y=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=AYUvriWhLLP32KFUBphkHDXGcPEbp63fU73Equ+KRSQoUPSwpzLT1+Pjv0jRSz/ysCOIXAkh6ECOxrtko25kqdd4K5BhcJwJQ/F6GrdK+kILeiVGVCytjVbQHtisHPXdWvcW/UHif9VSKqDageViA3Y1QRSu7d8L2WCBB7h9rvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=u3rP+oUf; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="u3rP+oUf"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-70d1c8d98baso1424302b3a.3
        for <loongarch@lists.linux.dev>; Fri, 26 Jul 2024 16:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722037966; x=1722642766; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=xiBZUTde5/yOu+VhqaXt4CYe/LeOwSdHW5ydN5gOuKQ=;
        b=u3rP+oUf2hy9GISbCgFgE0CGwSpa0G9pk9Gf1DObUVLYmb8W2T3V/478EwHQVAdIfp
         +OsJ+2+FhOSE1Adu1nXA/RLYCyLHEys+Jy9vEecOwXZHFctK7X+8kfEXdWU/hrQUOR+k
         A7/OhPBO06asBX225ocbq8tdh7dPMQBEzS84zR6+a3BYVuJQKnKbfwStDKA3Po6UVN5R
         RFuGN589fbVFr9bcYp4WhufmTSjRFzsxx7mOzMEtaAvvwpTRIx5RY0vEvkGjWztlobWc
         1cfdGGvSyBdhbdf+XqEy1G2ygV2pDYyOYLXR0gmO7SmEdJpJ6vkPLIfx+mmsJy8N38te
         Q9bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722037966; x=1722642766;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xiBZUTde5/yOu+VhqaXt4CYe/LeOwSdHW5ydN5gOuKQ=;
        b=NGqQDFk1cwExSCf6oxRxX7wV+MiIY6G2SqW86vFR7i5uO7o7KkAvTbnmUFQLkBO+Zk
         ESeb6qPa7rBnDlz8hlnh4ptGR2BTlj05oo9ulWbx4ckKBPjnF1Jtzwd0+Kxyiwa4MNQx
         wwEbU2qu/dXMohttuFc9w+IonG9ZT3q6zz89nIkmMT+dYHJU7QN2P2ZhQyoCRZOLQkKH
         PzqFof8Ny+FAKWJx9v0ZvBhd8ogz9FyEqnGFRqvJfZibR3WFrtevHP9njLZp9yN749kf
         b3zDbFMmyB40ed/t2VqwfQf++VnBhkjme8qHvHtGYjkattss78gFqEvrQS+d0hQ7guPA
         RTjw==
X-Forwarded-Encrypted: i=1; AJvYcCVjly/9d2xNvcMZ963wxCGY9bzbaTn1yri2uV1CDm+9TZjl9CPzjXhOxinyadTOVfDfHQF99ueuaQtvuI30D8W+jBnxPe7b2+7T
X-Gm-Message-State: AOJu0YwL7qGoq5FIcVT5mdPlXzsx0NecFDrVVD/Di21gJkcBE3OMGnJd
	KaBAQlCSEjapIFvlqDDSpz9gORzr1SrPJK5fNEKLZmBybQfc1XKii4rFSqGktcToZy0dH+4x32N
	Vpg==
X-Google-Smtp-Source: AGHT+IFeDzTSYc0yloJqv412y/9OHddQLGngXAZq8SjSSTQr+cl72qk3J3BVbl3XjHWFKDqTN/CvEh64V1I=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6a00:8703:b0:70d:1285:bbcf with SMTP id
 d2e1a72fcca58-70ece93a09amr3050b3a.0.1722037965825; Fri, 26 Jul 2024 16:52:45
 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 26 Jul 2024 16:51:13 -0700
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240726235234.228822-5-seanjc@google.com>
Subject: [PATCH v12 04/84] KVM: Allow calling kvm_release_page_{clean,dirty}()
 on a NULL page pointer
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

Allow passing a NULL @page to kvm_release_page_{clean,dirty}(), there's no
tangible benefit to forcing the callers to pre-check @page, and it ends up
generating a lot of duplicate boilerplate code.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 virt/kvm/kvm_main.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index fd8c212b8de7..656e931ac39e 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -3186,7 +3186,7 @@ static void kvm_set_page_accessed(struct page *page)
 
 void kvm_release_page_clean(struct page *page)
 {
-	if (WARN_ON(!page))
+	if (!page)
 		return;
 
 	kvm_set_page_accessed(page);
@@ -3211,7 +3211,7 @@ EXPORT_SYMBOL_GPL(kvm_release_pfn_clean);
 
 void kvm_release_page_dirty(struct page *page)
 {
-	if (WARN_ON(!page))
+	if (!page)
 		return;
 
 	kvm_set_page_dirty(page);
-- 
2.46.0.rc1.232.g9752f9e123-goog

