Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBEF43C1F
	for <loongarch@lists.linux.dev>; Wed, 11 Jun 2025 00:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749600659; cv=none; b=LvK1GGE2uhQQE0EEZ4f8Svxinewv54nPIcgG4CHkSCmLGDCVskTXT/tx7DG47XR388u5NeDuLC8J4wa7Jf34ZlCxd6AY5ciyLfatGTlR8CeA+w9VYdcCX4kgXC78RVgNKmT+PWSG415tg2udE8p5eOCQNFJJJk2rPGv0WW1FYUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749600659; c=relaxed/simple;
	bh=KbvpWBmaAbSh8Vh7bcMGuAO93v+FYmozT636NWdRWts=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ETdvnhlhspLs4pN6QXDVWpMAbB+5nMiGHjDTidCX/FbGt2sviDDtkJJOsMdzvq473PF5gzN6SuqWafMoBi4mKm3IVrdSWSdz4OJmtyUSNzXbo/hkeV8cQHMVVxQtBgyO807q0am5iUvzwB4X7woOKG84iVJIm3zD0LRCOlHu2H4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=g5ESatST; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="g5ESatST"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-311d670ad35so5571752a91.3
        for <loongarch@lists.linux.dev>; Tue, 10 Jun 2025 17:10:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749600657; x=1750205457; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=VlZgeHA644QawbjAzxLvevk+0CPgkFNL80WvPP4oWa8=;
        b=g5ESatSTZF56SA9uYEqqsrlI6f6HowiaHMaQZluhZ/RJL1+bdmH5rU/5PdgRCZmloW
         KZGdmmvvrPj8i0oME+6URI+pTsZYiQn/johUUgd7tz6bP8mSI4sI/AF0ram6WwE03N4S
         peNfgmpPCggiTXwlK+biixl1PQUhJ09VRFUhCLTiQCNV6JkIJ9nDU6nsELSGwGaotLed
         K2IGb8JBmdPZK1GmabDJNFKiM18FXH23Nstq/U01CawTQqOvlIk8uNJWuW9BYDeVRRO7
         qs7KiNrjhMLk05omN+XwxY9smB/eM0tPBPAYy7nvkQtwbbp64eqLV4b2setXZ69sxcKX
         pHcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749600657; x=1750205457;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VlZgeHA644QawbjAzxLvevk+0CPgkFNL80WvPP4oWa8=;
        b=QfvQHbY585G8kuYqmQZTmGT/+YFJx3oSZRvAUIKQcCSJ2zAywJ8XEmxKaCzoeS1JlR
         6EN3V7Y3tvcoBeuOWXzBXnKjEzPq/1UjBWqa33r6Dq7V363hs3MBbcDYrEke/n5EXOMj
         y7mU20F7Dcnr6w9UF9USFKM2A2RvTkOYKdjf7WcKxA9LZ3zpyFZOwaOjN2yhXD1M1mhD
         yCY73zoYpC8cfGSiRM5VKKdcbyW/FLTl//9Y/Lvq9HBtiy+I2nDN8kfvzPp5XRg6JlYr
         1UFCyfMepyhZTgP4iVVyCOtJKKTLEG5qVYTjT0ZReUjQUaebYYAEQrhlGfDBKaMNfm8r
         W5lQ==
X-Forwarded-Encrypted: i=1; AJvYcCUEMklmQBhSWbRIX/zX/KXqZz7G3Aww4RYiZag3axNzRjr9xWKdiyVGrPiatguHD+MkX0UHws84POs=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw6u2+XOPes3aNaHSqso/wM5b4j4dQHN9mhtb0O68fS9HCp0yso
	Kys3T03hxjasmE3Iqsrertl18FSfw2bYMjU3UMIunSdl/9djrkCaoCwp2Lk1F1ThyIrWCV8ghCL
	TukOwWQ==
X-Google-Smtp-Source: AGHT+IEo+A1iKKp/d15/c3Y8CK62vwTvYQUmq5gUOhKzuXVKftWt1+9sRfxp1GZ6dnQl+d5j2tHzGoYEsqQ=
X-Received: from pjboh5.prod.google.com ([2002:a17:90b:3a45:b0:2fb:fa85:1678])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2643:b0:312:29e:9ec9
 with SMTP id 98e67ed59e1d1-313af1dd043mr2232849a91.24.1749600657225; Tue, 10
 Jun 2025 17:10:57 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Tue, 10 Jun 2025 17:10:41 -0700
In-Reply-To: <20250611001042.170501-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250611001042.170501-1-seanjc@google.com>
X-Mailer: git-send-email 2.50.0.rc0.642.g800a2b2222-goog
Message-ID: <20250611001042.170501-8-seanjc@google.com>
Subject: [PATCH 7/8] KVM: s390: Stop adding virt/kvm to the arch include path
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

Don't add virt/kvm to KVM s390's include path, the headers in virt/kvm are
intended to be used only by other code in virt/kvm, i.e. are "private" to
the core KVM code.  It's not clear that s390 *ever* included a header from
virt/kvm, i.e. odds are good the "-Ivirt/kvm" was copied from a x86's
Makefile when s390 support was first added.

The only headers in virt/kvm at the time were the x86 specific ioapic.h,
and iodev.h, neither of which shows up as an #include in the diff for the
commit range 37817f2982d0f..e976a2b997fc4.

Acked-by: Claudio Imbrenda <imbrenda@linux.ibm.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/s390/kvm/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/s390/kvm/Makefile b/arch/s390/kvm/Makefile
index 9a723c48b05a..b742e08c036b 100644
--- a/arch/s390/kvm/Makefile
+++ b/arch/s390/kvm/Makefile
@@ -5,7 +5,7 @@
 
 include $(srctree)/virt/kvm/Makefile.kvm
 
-ccflags-y := -Ivirt/kvm -Iarch/s390/kvm
+ccflags-y := -Iarch/s390/kvm
 
 kvm-y += kvm-s390.o intercept.o interrupt.o priv.o sigp.o
 kvm-y += diag.o gaccess.o guestdbg.o vsie.o pv.o gmap-vsie.o
-- 
2.50.0.rc0.642.g800a2b2222-goog

