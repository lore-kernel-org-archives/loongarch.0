Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB24F1CF7C2
	for <loongarch@lists.linux.dev>; Thu, 10 Oct 2024 18:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728584697; cv=none; b=QVnBNGXroHGD8KnOcZPyFmzYkrNIabAYQ/9PJaU9eLLRRdCGrBcwtY3B5cHV2SsAotuVEb/LZ4y57nSAm7lh/+o18Ikm7zKhDER6D5DZpfwBxqS1InmUsrcZ1Y5u1uNx4IMoOwumDyBfgLN2jSK1s0CUO/Prtx0Q509O2Q/D3A0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728584697; c=relaxed/simple;
	bh=iBKdL35kBHi2YuWkjigWDtnk5mPkldKXaU7GHff52mQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=uonubBpkXoXIME0P0qlY+O8o75NWNYdLPCAS7MFLAhrXPympCleMrgjulSKWBNlNw9IFUJRp/Ye54OY6CPGua5hn92ozFW4IMJOv5G3jbdwrHjIII08qq9FmzhE5Mxucmq2F2CeribrWgWwigvPc3tXV3EBiB+FfqxapEHE5GYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=eH0UIlND; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="eH0UIlND"
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-6e2261adfdeso21172417b3.2
        for <loongarch@lists.linux.dev>; Thu, 10 Oct 2024 11:24:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584695; x=1729189495; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8PiI9IzFtQVAZLsCzTZ7ta7WGdR9XnSo4A5BSh1uxRg=;
        b=eH0UIlNDOVXSo4sN/2Mp/USE76DQTnFpAu+hhMtLh3lR/GIbg6rHjOOK0XJ0rFv6sg
         XweWhaUBZISQ4tNUH0KmPU2gEpQeLpY/yS2Hqf3bOPrsUfgdswJvo3gBHSuEWleYLGUH
         6qRl0foXXzgFEFpANfWP6Si0CRJMICMOWA71kNj5zmv8aXDZdrt4TRzaw2BRGAXaX3ck
         omyJ6utGpieIi0v4x8aInD4wYQjaQgn0jlTvqx1XUAlyTv3UBQ3xpdW8HiSCTRNwUixP
         9xTs/0tPm8LofNSG2+yDJudJj5QQz0RcR0QhSF5atSP6qFIAveGwC46oi/XlSEism8bQ
         y59g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584695; x=1729189495;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8PiI9IzFtQVAZLsCzTZ7ta7WGdR9XnSo4A5BSh1uxRg=;
        b=NuPmmSXKjRoKgnAaKIupZm8sPIJ0AlYE07NPCB0eyY/jmmTDJ0HQDF/Pt6BHpOmGKb
         z156ppWv9WDs08YKU4BtX8rmQKXaQVeYK+FYUiaM0YfEhhgSuIfic6C+SDOcgH+kfbO6
         IX/K6hZ/t4+RHpeXcc6VjQvoBN2dgPlVdcuYDMbTT1iGfpeKCjikgnaCnrnnJXvCM5Uo
         oGHnb0NavlOi09sHv5Ip6udd/Ux1dh0m+ooqmxozMJz8H1X1Ri6+JN3x6QuqxRVExvtE
         Abv8BWxL2CzMBzRhZt5a0AK1JNloewEhrNdGdgBNlX3OA7sRFruizCDZD3K4DNiC81RK
         1bxQ==
X-Forwarded-Encrypted: i=1; AJvYcCVO9qLOK6dBVPzI/cTKDwHooxM5COTnk3qvqhMzfXAqcRyFARkqSelLNTHoNwBliGPDN7AnY8sJfNg=@lists.linux.dev
X-Gm-Message-State: AOJu0YxH/fbr3KHrT4nB9+Bht6v71ATAQGbKPb+xMqqlzIXGjTn+URLc
	6oimQ77xkABJCQr/mni4t0eEa336DB7TXwEm+b4i9VFsBcx/bM8iSwDkeMv/Lqxg4aqp4wNXS86
	ZJw==
X-Google-Smtp-Source: AGHT+IGz6mODxZTH5agCMYiGZey+8PwFJu50se4JqpXBNG0SwyKrN9TWGGQJqqmZYCdc2Fnc7eka1IGyLLE=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a81:ad16:0:b0:6c1:298e:5a7 with SMTP id
 00721157ae682-6e3224662ffmr1632867b3.5.1728584694780; Thu, 10 Oct 2024
 11:24:54 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 10 Oct 2024 11:23:05 -0700
In-Reply-To: <20241010182427.1434605-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20241010182427.1434605-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Message-ID: <20241010182427.1434605-4-seanjc@google.com>
Subject: [PATCH v13 03/85] KVM: Add kvm_release_page_unused() API to put pages
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
	"=?UTF-8?q?Alex=20Benn=C3=A9e?=" <alex.bennee@linaro.org>, Yan Zhao <yan.y.zhao@intel.com>, 
	David Matlack <dmatlack@google.com>, David Stevens <stevensd@chromium.org>, 
	Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Add an API to release an unused page, i.e. to put a page without marking
it accessed or dirty.  The API will be used when KVM faults-in a page but
bails before installing the guest mapping (and other similar flows).

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Tested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 include/linux/kvm_host.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index ee186a1fbaad..ab4485b2bddc 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -1216,6 +1216,15 @@ unsigned long gfn_to_hva_prot(struct kvm *kvm, gfn_t=
 gfn, bool *writable);
 unsigned long gfn_to_hva_memslot(struct kvm_memory_slot *slot, gfn_t gfn);
 unsigned long gfn_to_hva_memslot_prot(struct kvm_memory_slot *slot, gfn_t =
gfn,
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
=20
--=20
2.47.0.rc1.288.g06298d1525-goog

