Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F9321CEEB6
	for <loongarch@lists.linux.dev>; Thu, 10 Oct 2024 18:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728584695; cv=none; b=LAc5++dapoC3CDw8FKMZehKyhS8GTucRxCxEjqfcV5NiPuw4ARid5eqH46Ununi4sGUeXDJNKhUhLl3A+fRwHDviNGiY5jWbHECd5TL//hDRpiEAkeLLx8ovPY3MN8uKL5eT+bhd0k2PLF0s4DNoZu7KRMT9TnsdIQXMLhcKVME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728584695; c=relaxed/simple;
	bh=GKQ1+9zVatIXCwDEsM6DNkbKcmF2enzdpw2dYi1+r2s=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=auVa3MOmcK593IE1U/A3HzVDtADJou73M0JSjDvHlKQ3OU7EFLCjJx7SxSI6RWzXl/qWKl2fqxByza5hBU1V9nsCEhhTTtD+jNeP0D/LRvLOfe3s0DMYNIHSfNUXTdz/wPLohgLokNt8ac468m6BDz2uMNrX3wNVTKpXqmaNhgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TNYtrAcw; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TNYtrAcw"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-20b921fa133so13287225ad.1
        for <loongarch@lists.linux.dev>; Thu, 10 Oct 2024 11:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584693; x=1729189493; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yUMe47Ku2d+lU53n+UV6eA4G9zH9pOaBnB7PUsg7n0E=;
        b=TNYtrAcwNk0sf8D42v+j8YCO5+m/01h8wD3gW0qu3ZcKGBxEwN96EeTPjFpL8uA2oP
         6bFBYyBUOz7xgPfRUKl2vmdm8gD7410Wyt14MeRQ0pTO2QZTE4tIiCf9easKMshFNQU8
         5xo/28+R9s64yqoqueuFtiyCXXoJLu+TKkDdYdlOqEiay/z9hiiZZz5F8diHf939ZNma
         VJ4RiOs5jNTJAsZc85cw2WOoPwg4OyEBHENks7UIh9GwuvsqDBs/7TWspXb7fb+Htvuv
         iQYZhjAy6DHz5LRIpblHgG8TtwZF+YUlr2XfGaHRZczwKj297FZJaunbPKU1EV5YV6pA
         Bo6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584693; x=1729189493;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yUMe47Ku2d+lU53n+UV6eA4G9zH9pOaBnB7PUsg7n0E=;
        b=AHqlQoBMiuIMVm2oBW1RuQN5fWrvZAhmjmrOo2q+6bGCCFls/hXVoOjr6lQtUDt/5e
         QQpDw13IMpi76S/LGdWC+NSsf/B+LdvOwHYpCmgZPeeD8ODyOirwvHq7RHIqqkt8J7GP
         UoyHZHYeujYKfsxI2dBVCxEg9bsNGPv2gpeEn4njVZTQlrV7TJqx3ncfRYgk6/DBrocr
         fGTrM4wTEiwc+/86y4GIb5IjGq5s3C1t03u78GJUKEWa27ufme3iqNxVgmLjV5uXFX/U
         S502VvXB3g7+yMr8ZfF7yjf/XjiyNGfp3Nn9zJSD8CRmiCJhA0Gcr5PpvDBzr52+CtgZ
         x//A==
X-Forwarded-Encrypted: i=1; AJvYcCUtFaA2fVMYh6K6kAMRvpK3AOB1gDJO60JFliCsz9/mkSL05Lb3fjnvxZKlUfY7CXnJzD8InF6ZQAY=@lists.linux.dev
X-Gm-Message-State: AOJu0YyvNXVSsUCA/JEWBP3vO9ke/tSIfqBhPyEr5AauG/lnD54D64tC
	8rhBM9vTYxdcsTN6LTQ0xcDhV4Rl2YiqLs4+pD8CZIeS/STVkMsCIZ7ddMe2/uxd1s2+47T3Bui
	R7Q==
X-Google-Smtp-Source: AGHT+IHgBvu4/6UpOEaDnS659CK1Rn1/E5r8mTk00ZsUtMRUIXJafj8Ignnkw5WxXqtPYIrr50vXY4UIGHU=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a17:902:ff02:b0:205:58ee:1567 with SMTP id
 d9443c01a7336-20c80362278mr43175ad.0.1728584692824; Thu, 10 Oct 2024 11:24:52
 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 10 Oct 2024 11:23:04 -0700
In-Reply-To: <20241010182427.1434605-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20241010182427.1434605-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Message-ID: <20241010182427.1434605-3-seanjc@google.com>
Subject: [PATCH v13 02/85] KVM: Allow calling kvm_release_page_{clean,dirty}()
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
	"=?UTF-8?q?Alex=20Benn=C3=A9e?=" <alex.bennee@linaro.org>, Yan Zhao <yan.y.zhao@intel.com>, 
	David Matlack <dmatlack@google.com>, David Stevens <stevensd@chromium.org>, 
	Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Allow passing a NULL @page to kvm_release_page_{clean,dirty}(), there's no
tangible benefit to forcing the callers to pre-check @page, and it ends up
generating a lot of duplicate boilerplate code.

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Tested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 virt/kvm/kvm_main.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 4b659a649dfa..2032292df0b0 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -3179,7 +3179,7 @@ static void kvm_set_page_accessed(struct page *page)
=20
 void kvm_release_page_clean(struct page *page)
 {
-	if (WARN_ON(!page))
+	if (!page)
 		return;
=20
 	kvm_set_page_accessed(page);
@@ -3204,7 +3204,7 @@ EXPORT_SYMBOL_GPL(kvm_release_pfn_clean);
=20
 void kvm_release_page_dirty(struct page *page)
 {
-	if (WARN_ON(!page))
+	if (!page)
 		return;
=20
 	kvm_set_page_dirty(page);
--=20
2.47.0.rc1.288.g06298d1525-goog

