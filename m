Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35579801
	for <loongarch@lists.linux.dev>; Wed, 11 Jun 2025 00:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749600657; cv=none; b=Qg9gSxIK99s8D3T18Q7dYCW8w9xsK2qgVQHzhcdUoia5LRZ2g8ZP/GHn97Rin9M2VdlGatQtgXkojqYCAnIHBOSsuRXH76PotCAamBmYfUl2UVBnBtLIGbwxvkZ0h5XlyzqeAxHA5nSu6TafSMl5FLLV4EZUd2kwSY+I76ywAKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749600657; c=relaxed/simple;
	bh=tIVAjv0R6pUZqeCBUMOqA6Hwa6RH3vUVAalxmKoMGQM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=L9rDn1bNT44nBJDPevYF7PavbmN6CzxjYGFdupwoEN8B0OLAIj9Wm9ZJ1JFygIjIj8WvgCOC7nVTUDxdi8e+YHzn/FXr9zSHl3rofp/yZnWoiCQPr6+E3D7oWMUAQyLaP4lHKyYeqgCLwySwyojn0z+8WsotsrovxWgvxh6pu9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=AL73jBm6; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="AL73jBm6"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-311b6d25278so5805877a91.3
        for <loongarch@lists.linux.dev>; Tue, 10 Jun 2025 17:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749600655; x=1750205455; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=zss/ktKZQOB/zxYHcr8l4OJbiGy6+R3+c8NDOsBeWew=;
        b=AL73jBm69MRquzqAqPoIYKmtzZjdl9dUQNh/OMwJeuNxehUEhsutJZE/YH1UDWnhOy
         UovYwVhEn/JPfIUdfcRuRtqDClwiYKr8FBXXxipedXPoY9b28gDQQ32JtkS3XG4ZSayD
         y7Mphz2uKna5SLkXKvvm8c599PBpPr7UrIFDuxKbObpNeo3kar6UvvjY8famlyq7q8VA
         V+QxvIpNW4cBpb7dUBh3uxGAP/pMnQnxinoMIt6lRIZpYQggFMI8CstfcoIFRkbRuCYW
         ZJoTX0NvyvwhaGGH8Fqdzt045efNqTcJrClSlKcjsnVkVkXSD54YswViRtAHOFEvjRmS
         YfnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749600655; x=1750205455;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zss/ktKZQOB/zxYHcr8l4OJbiGy6+R3+c8NDOsBeWew=;
        b=oHL7KC6pO9ElN8TwZzC7fxCTRKPGOH/ymx+W1Rda83GpIOifJAjkIBR0Kt3mr9X7vf
         2R2Dq89PmQw5MpE0lV8sAfZO5zp6VDG/yxft980KOC1gaIHOInw5yO7c8dse8h9QCk9g
         RODQ0z8R6tVTHOo7zc889ZZab5mljdfV+CquXo9Eo+oAwId47fnN5DPDXGHjU2SOhkM3
         Ikk0uwwhyv0LAvt6gSUdN/gwy955wHW/XtO5NNXbT/L3cXaOsWTD3L69/yhlN6zHLQ1C
         saXvCtWXpQ+FLngok5jd4wafhfQsMIq78MXiCi5eOzfKjrlvNPOmNrfOd4AskjZugGl/
         Tb5g==
X-Forwarded-Encrypted: i=1; AJvYcCUNNRuPMdPa2j+tatKQI9nRv3X54ndou5VhGOi9zxZX6BUDYCfUaPNIZXgqAa+Hvso/1MBZW1Jutug=@lists.linux.dev
X-Gm-Message-State: AOJu0YxICk3SMpebtTQmmyLLTmkapUHYMOc0yiOy4drjFe4CBY7mLPtM
	8bJtVPCOBD7ba/6USbf6HwKOLyWiO3Dv23zEhhA0hVxBOC88jE7tjAUoQ/fR4FJ1baya/t4dv/E
	lE4ry0A==
X-Google-Smtp-Source: AGHT+IFPf4zAcxMmKYyJF/0q0QWOeyyNBeEfAEV8gqM1cGbYGy338sgO6izo7nZMoEiNEzX0yDZpDSCyFlg=
X-Received: from pjbpx2.prod.google.com ([2002:a17:90b:2702:b0:313:230:89ed])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:384d:b0:311:f30b:c21
 with SMTP id 98e67ed59e1d1-313af243a50mr1534626a91.26.1749600655513; Tue, 10
 Jun 2025 17:10:55 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Tue, 10 Jun 2025 17:10:40 -0700
In-Reply-To: <20250611001042.170501-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250611001042.170501-1-seanjc@google.com>
X-Mailer: git-send-email 2.50.0.rc0.642.g800a2b2222-goog
Message-ID: <20250611001042.170501-7-seanjc@google.com>
Subject: [PATCH 6/8] KVM: PPC: Stop adding virt/kvm to the arch include path
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Sean Christopherson <seanjc@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Anish Ghulati <aghulati@google.com>, Colton Lewis <coltonlewis@google.com>, 
	Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"

Don't add virt/kvm to KVM PPC's include path, the headers in virt/kvm are
intended to be used only by other code in virt/kvm, i.e. are "private" to
the core KVM code.  It's not clear that PPC *ever* included a header from
virt/kvm, i.e. odds are good the "-Ivirt/kvm" was copied from a different
architecture's Makefile when PPC support was first added.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/powerpc/kvm/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/kvm/Makefile b/arch/powerpc/kvm/Makefile
index 4bd9d1230869..1a575db2666e 100644
--- a/arch/powerpc/kvm/Makefile
+++ b/arch/powerpc/kvm/Makefile
@@ -3,7 +3,7 @@
 # Makefile for Kernel-based Virtual Machine module
 #
 
-ccflags-y := -Ivirt/kvm -Iarch/powerpc/kvm
+ccflags-y := -Iarch/powerpc/kvm
 
 include $(srctree)/virt/kvm/Makefile.kvm
 
-- 
2.50.0.rc0.642.g800a2b2222-goog

