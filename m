Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48F11180041
	for <loongarch@lists.linux.dev>; Fri, 26 Jul 2024 23:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722038031; cv=none; b=pdVNS60bl0NQeUeHE2RGXa6FSrOWMeQA+yyiDDGGqt9SH2p7x7Hb/je3aPEtli/z0wYWNQ9TQhkIbqvxv9ZeQi9Ysu9X9eo3bPN5KGY4mbRI0gwBV5BQGG+C0BoriAYa6iawba3tbBEHDtK6mgBMOGgFNH8zUP2IgAz3q9afzSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722038031; c=relaxed/simple;
	bh=RxYXW38TO1i/zpJ/VZw7DD4eCUef7bpZ1SOW7WvxVVk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=l6M4TQmLhA/3LC34eUJwwTkr7BlLUNuZwt7IyfzuTagjcmA/KeF0z86A9hLHP+avDyObGS0vi+WgmwJtAOOEslfR2jqLzAqEWda0iQUgxx+bsKFeh0SkScr8R7ScHvj2WCZP7oJdC9Dzqo1fKBxfZXJrK/vtmqM5jwjBCtZkmxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=iaq2DrbE; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="iaq2DrbE"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-70d19a4137dso1423099b3a.1
        for <loongarch@lists.linux.dev>; Fri, 26 Jul 2024 16:53:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722038030; x=1722642830; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=Xse5B7AOfcqAOlY7bR5VB/olShqjuvoHnQg+aILML2Y=;
        b=iaq2DrbELvqx27YjY5hd+hlNf+MWQ3sGBHV7fLbJP1jCWwWfuNYrrJZBIrBiPAp0q3
         IiTtrHNPD4yEhpt/sV9yVMqjA46V4N/d+8aPm8/HGzB30vmAsAJHo/AmZM4DFfallzXq
         MQC77NOMfitA/Mf0gWdqSiT8j/w5DTFzh3Hf9Iw/amDi/ZALxmWq+SnnyA8wCt5bZxx8
         R5AAHUrW8pFY39Tk/dTw3khoJouB7z4GANlN+SwmTCEN4xXrt6z5noRrSwpxMD1xHZG5
         BdfH2iREIXj6otrHh0OL9WcsfTWxa6NO5Hma81S9p5zE1bkIQHmOTngavJz4dzj2hQMG
         FYSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722038030; x=1722642830;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xse5B7AOfcqAOlY7bR5VB/olShqjuvoHnQg+aILML2Y=;
        b=u02ir2S9hZFPoiXcQJ9zu1sUP5o4wnV7XDgKWjAccT+4y+GxOgvaihI4MkWXef6OPh
         x84kv6u5vLBLHdae8mscU2xcsE2Xp7K8BLdmg6oclx9KgbBvjXPnxtqCx2y9/a//taB5
         5yoasgRfgG/axi9RfXpwjfcRs364aqyMcWnobDRJWAoEA1HhpD7o/Cu59NDosjeDt4ks
         ZYn+PfNcpfN43YT7Wv+vuEeFNHXoRc047znAowGNNdIcv8D6PGMPLlzvHx9DI0fUXM0m
         eEUKPcOi7CXw4cjk5vWMduoYEn2hJeYwf+yJDrNdQUIgVIXO9qGmTLkaDLN/CJ5ttMUL
         DEvA==
X-Forwarded-Encrypted: i=1; AJvYcCURDiUL+QshZ6w4k9I8wjhfkYGqNQMuGzGR91sr5gftlv7709MC9Hc6Tb+uVE3D9eeM3L6U8k0icJrReNqKr6MWe9ZapVTnBJoe
X-Gm-Message-State: AOJu0YyncDPU6rafdkKBamn5D4yZS6hTvIpQ74nAQ5l/VEnzvZVYYZOo
	zaAi0Cvruxlv2WhtYf5Yy9MKlJ6wdBfzm0l+jld7lb4mFPmG6WQ+XkJZ4kAkNxjrnKXQZAESMaV
	t4w==
X-Google-Smtp-Source: AGHT+IEFcNwoZPtxzQ32cLJ1vxa7gkQJVcgltXDXIuLlGv+WV+Ss10kIc9nwtzcNKm3zIIgT6vAGf5Ndk9o=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6a00:2e2a:b0:70d:9a0e:c13b with SMTP id
 d2e1a72fcca58-70ece7f0562mr55820b3a.3.1722038029490; Fri, 26 Jul 2024
 16:53:49 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 26 Jul 2024 16:51:44 -0700
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240726235234.228822-36-seanjc@google.com>
Subject: [PATCH v12 35/84] KVM: x86: Use kvm_lookup_pfn() to check if retrying
 #PF is useful
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

Use kvm_lookup_pfn() instead of an open coded equivalent when checking to
see if KVM should exit to userspace or re-enter the guest after failed
instruction emulation triggered by a guest page fault.

Note, there is a small functional change as kvm_lookup_pfn() doesn't mark
the page as accessed, whereas kvm_release_pfn_clean() does mark the page
accessed (if the pfn is backed by a refcounted struct page).  Neither
behavior is wrong per se, e.g. querying the gfn=>pfn mapping doesn't
actually access the page, but the guest _did_ access the gfn, otherwise
the fault wouldn't have occurred.

That said, either KVM will exit to userspace and the guest will likely be
terminated, or KVM will re-enter the guest and, barring weirdness in the
guest, the guest will re-access the gfn, and KVM will fault-in the pfn and
mark it accessed.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/x86.c | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index af6c8cf6a37a..59501ad6e7f5 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -8867,7 +8867,6 @@ static bool reexecute_instruction(struct kvm_vcpu *vcpu, gpa_t cr2_or_gpa,
 				  int emulation_type)
 {
 	gpa_t gpa = cr2_or_gpa;
-	kvm_pfn_t pfn;
 
 	if (!(emulation_type & EMULTYPE_ALLOW_RETRY_PF))
 		return false;
@@ -8892,22 +8891,15 @@ static bool reexecute_instruction(struct kvm_vcpu *vcpu, gpa_t cr2_or_gpa,
 	}
 
 	/*
-	 * Do not retry the unhandleable instruction if it faults on the
-	 * readonly host memory, otherwise it will goto a infinite loop:
+	 * Do not retry the unhandleable instruction if emulation was triggered
+	 * for emulated MMIO, e.g. by a readonly memslot or lack of a memslot,
+	 * otherwise KVM will send the vCPU into an infinite loop:
 	 * retry instruction -> write #PF -> emulation fail -> retry
 	 * instruction -> ...
 	 */
-	pfn = gfn_to_pfn(vcpu->kvm, gpa_to_gfn(gpa));
-
-	/*
-	 * If the instruction failed on the error pfn, it can not be fixed,
-	 * report the error to userspace.
-	 */
-	if (is_error_noslot_pfn(pfn))
+	if (is_error_noslot_pfn(kvm_lookup_pfn(vcpu->kvm, gpa_to_gfn(gpa))))
 		return false;
 
-	kvm_release_pfn_clean(pfn);
-
 	/*
 	 * If emulation may have been triggered by a write to a shadowed page
 	 * table, unprotect the gfn (zap any relevant SPTEs) and re-enter the
-- 
2.46.0.rc1.232.g9752f9e123-goog

