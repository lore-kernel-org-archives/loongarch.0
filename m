Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB257156228
	for <loongarch@lists.linux.dev>; Fri, 26 Jul 2024 23:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722037970; cv=none; b=IJMEq0Sf+TeS3PW+8TIY6ediruRMioenBHWYsxZ4bIJ2JAYqQZLVIoelMTcSpX01nVc0DyQ+v7VpQZiCHZtl65laJFXkFvuffYGt7XvFpEinUFwYESIpoaV91bJoXD5vueJtZoyhsd1hPakqyZY4cMKl8NY/X1tcKguqxKTQd+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722037970; c=relaxed/simple;
	bh=o0JBLF6HQjluB3iIirHhfso1PE7Zf/Ht0oB2KRN4Rqk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=h27rFLBfusonksMKUnfYOXTSpodejj0HkOtwzcKjCCSwCB2CupI4r4qzcdSRHsIgQdGJKqLl5RV8dtZI7go201Rm0MIfyVMs2EUllSn+qSljXDZAz6OgKFjpjpIm7PpQGkw3uMO96GP38nVDJam1IYzUrzxAOV4aUMpR0oyV0Hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Z65s61vJ; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Z65s61vJ"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-70d14393856so1204517b3a.1
        for <loongarch@lists.linux.dev>; Fri, 26 Jul 2024 16:52:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722037968; x=1722642768; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=1PAT6v4tn5ltatT/kjen/UunIT1fRhHnj971W9WBYQU=;
        b=Z65s61vJ0G6iPLo8B4wgMvYgspN4WetZvJrFZTXnj3B9uXnyEBUoSNdCf5F0CcPpSW
         xB+vHmU51KSE7WjU/QT/la7xOhDRzCOVKgX8v7a4xDYZ7l1l4OPccDhH8+D/n2ghFuTl
         nQYbdfyzU94LydsZzJAKofL8Ols5Iue9l009z4uvtwsyaFOaN/VV2/AUaK6DxyboUJ4V
         JpnZBKIpmps2DR2p08CkOkm7W5WrynljpZtnsAIa7YgZD2UiTAD1KMPMhBrJCPJLUBdm
         PEY0Y6kFGEVkldgGzgGYgnIKcDwtie4+TK+nIPmjFVxEn92RSnEDfvKxxksF1WZPMLd7
         VdxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722037968; x=1722642768;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1PAT6v4tn5ltatT/kjen/UunIT1fRhHnj971W9WBYQU=;
        b=X0b9y1MrDQDfeJM8jl2Vtoj2Xfxkfz21roSl91w5gHQNIYnzoidGha4RNLxJfs2Nc7
         xtc4qrBLi7WP+7wJqpDMj4xgExe3FxOd1caDiwm5OntKubhn+cykfgm4SpbBGWGfvUow
         UkEJ84aRmBJckkj3McuA5xFFt3leYRlGYoR+3PLqP8sp7k+kMNYtjUnqpOk+1ketc5Lv
         8KEMMxwe9ftITgXxtbBaDt79tUOnO8QRoO5f4zmpvET9UiiiYS7VphLC4nTpePMHqIsP
         ajhnfIZgelhVGbY5OWSOxSNKxVmIXzIITyDNKhs1T/+SpdzaDsbqNzT5tSKXdE0y3fbE
         G6gg==
X-Forwarded-Encrypted: i=1; AJvYcCVQ+LlUuTaBuxgSZJMXBmxfnLRjSuwiVgx9TRPWFrKWp40YHg5vIriaoLuBM1dGA6vDv60b9Dq0a+uxflNHhZz2IefB4pp+5aXl
X-Gm-Message-State: AOJu0Yx+Zhgd3bdlSfoenOq0sEtcRzdhVUs/6+qdsgV/Bfu6s1rpr9ne
	A2Fc1ki0YKFhku0pIf0nUH5BOkr/ytMm6JdOZfRNxLSMEfQa96ecySrI1uJBpK9VS5ulbvTh/q4
	w5g==
X-Google-Smtp-Source: AGHT+IGybwcUaaDWGaRnVlNYMzL2lybkBwi+pdiFBv1toqDzA479d7SifMoC4AbRMiwOqaRTolCzzwjRN5U=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6a00:731c:b0:70d:13c2:1d08 with SMTP id
 d2e1a72fcca58-70ecedb0dfamr2514b3a.3.1722037967857; Fri, 26 Jul 2024 16:52:47
 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 26 Jul 2024 16:51:14 -0700
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240726235234.228822-6-seanjc@google.com>
Subject: [PATCH v12 05/84] KVM: Add kvm_release_page_unused() API to put pages
 that KVM never consumes
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

Add an API to release an unused page, i.e. to put a page without marking
it accessed or dirty.  The API will be used when KVM faults-in a page but
bails before installing the guest mapping (and other similar flows).

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 include/linux/kvm_host.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 3d9617d1de41..c5d39a337aa3 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -1201,6 +1201,15 @@ unsigned long gfn_to_hva_prot(struct kvm *kvm, gfn_t gfn, bool *writable);
 unsigned long gfn_to_hva_memslot(struct kvm_memory_slot *slot, gfn_t gfn);
 unsigned long gfn_to_hva_memslot_prot(struct kvm_memory_slot *slot, gfn_t gfn,
 				      bool *writable);
+
+static inline void kvm_release_page_unused(struct page *page)
+{
+	if (!page)
+		return;
+
+	put_page(page);
+}
+
 void kvm_release_page_clean(struct page *page);
 void kvm_release_page_dirty(struct page *page);
 
-- 
2.46.0.rc1.232.g9752f9e123-goog

