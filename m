Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 271961E285E
	for <loongarch@lists.linux.dev>; Thu, 10 Oct 2024 18:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728584803; cv=none; b=ISJ9BkurLyiHQPtxJ39EmZEnq9xROlerGH3o+JfJOZRwORkGj8tYCB/XLMdnjoYFuB/rZHWN+OaZIYUOdLnSt3t+8N9TMtnO7DdZL/1k5T1VkgOkKFvcTjKXktE2As8enp2aK/jsHgHc+zy5migUlwRjn5qzK5hRVsI9Ms9HcW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728584803; c=relaxed/simple;
	bh=ux21RVGWhz9JRdIoM/Dq30UYNcfog+x0iowAjNZ/4XU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=VUqHEzDGNyVqkl81d5MUfKEQEtKFE8rK4Fpx9pHmrWoVX+P+KVEMVMLjI9PCF+b3/dWkaICWJyw2gAX4/1dah6Rdbwv50ta7yPYghs+63FNsBotOvU6Y8IMtNWGOd0sYBJTE8WDSahYSLF8DgExq4UCoABqGrmYAgfMBQY7OrYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Jmvv7WqZ; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Jmvv7WqZ"
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-6e284982a31so22453617b3.3
        for <loongarch@lists.linux.dev>; Thu, 10 Oct 2024 11:26:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584801; x=1729189601; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W6Zzl9AmyqedpEIwNpLXiwPcmrnHw6ZPa/9pyFpLcZ0=;
        b=Jmvv7WqZDOxXTsxEpRf9v6QkXV1Ht1d/SYdUZmjUhyAtUYKShIGEnQ13HS/BG2hSJa
         C+qgbGU6KNg5xAhG1D1f4Xic45OMphrLa3tMJpsTMxdCS39GgNRI44I5FBfXDJrRMpH2
         nyHKoZmHnKn+KqBSC2tz+XBG3XV50AS+4Grw/gxnXm4c6Kt36FmUpAWyc5pqXbwq+B8I
         FnMEgVsJINfgRdUhTZwOBs+WsQMRq2Ehz0gdQJWeqK1ZywJtfpuFFm7I8rZ2aZC4oBvO
         ThVnEZstza6+StZUMNBVooALcb3lIjG9VHpJYXo6b8M0uIgsTxaC80s6TjkYafJebHQy
         /Qwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584801; x=1729189601;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=W6Zzl9AmyqedpEIwNpLXiwPcmrnHw6ZPa/9pyFpLcZ0=;
        b=of/Js2AXKwxgckNuJMagi+b92ZVJaRATsP7FfiQYwzBTJ1nz8HdG9s3PIJ3wkjGZ64
         ls56QmMjkIcIxOAcmTW50l3tHat8/3WnHEcs0/0bGuCBmeQzX1Ka2uzdEbVsOxPjMiph
         nHN4C2ZLcZqvn+dUA9EuCbLaW/dSdwQ/gDF6uOUKTrapqcQgZ2Fa6J5OnMdCqUI3WTgK
         upksWs7bR+0P3hZfytWQcQSl9dxL27Pc7o314grxiMk+IQ0lmRBseu7Mif00lP1473YM
         fbjdMVTksn+LEWPjlT8+5lQyALGqQs5zvvS8ewFagFXRJkOyGIWk93b+IwSZtlo6sUnA
         K2Gg==
X-Forwarded-Encrypted: i=1; AJvYcCXHfmAWGjkskA76TYJe8F7AdTSxgA3Rm90NaijsF7ka9DnaepS8LDlLCBArDsQER49SvEdp9cw5D00=@lists.linux.dev
X-Gm-Message-State: AOJu0YyYoDG6TXwBZtUqzWhqhLQ8sec8diXCSO4hUgeOd914dbHB6QQa
	pijzl/uSk2+nAnzlm10BltilySWf44ki7xPxMyI3jq6mM+n4/5CN2CEWy/yLCwgCEDTOp3bO4qB
	tTA==
X-Google-Smtp-Source: AGHT+IGFUTZueI+Si3awRWj8jA+YGlhXMEzUcm/2nm7iA7dHF8070ZlvI1MSF0nUJUhFBhXPPz9v/uVg5Fg=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a05:690c:2f08:b0:6e2:2c72:3abb with SMTP id
 00721157ae682-6e3224db667mr816567b3.7.1728584801239; Thu, 10 Oct 2024
 11:26:41 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 10 Oct 2024 11:23:53 -0700
In-Reply-To: <20241010182427.1434605-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20241010182427.1434605-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Message-ID: <20241010182427.1434605-52-seanjc@google.com>
Subject: [PATCH v13 51/85] KVM: VMX: Use __kvm_faultin_page() to get APIC
 access page/pfn
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

Use __kvm_faultin_page() get the APIC access page so that KVM can
precisely release the refcounted page, i.e. to remove yet another user
of kvm_pfn_to_refcounted_page().  While the path isn't handling a guest
page fault, the semantics are effectively the same; KVM just happens to
be mapping the pfn into a VMCS field instead of a secondary MMU.

Tested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/vmx.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index 851be0820e04..44cc25dfebba 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -6790,8 +6790,10 @@ void vmx_set_apic_access_page_addr(struct kvm_vcpu *=
vcpu)
 	struct kvm *kvm =3D vcpu->kvm;
 	struct kvm_memslots *slots =3D kvm_memslots(kvm);
 	struct kvm_memory_slot *slot;
+	struct page *refcounted_page;
 	unsigned long mmu_seq;
 	kvm_pfn_t pfn;
+	bool writable;
=20
 	/* Defer reload until vmcs01 is the current VMCS. */
 	if (is_guest_mode(vcpu)) {
@@ -6827,7 +6829,7 @@ void vmx_set_apic_access_page_addr(struct kvm_vcpu *v=
cpu)
 	 * controls the APIC-access page memslot, and only deletes the memslot
 	 * if APICv is permanently inhibited, i.e. the memslot won't reappear.
 	 */
-	pfn =3D gfn_to_pfn_memslot(slot, gfn);
+	pfn =3D __kvm_faultin_pfn(slot, gfn, FOLL_WRITE, &writable, &refcounted_p=
age);
 	if (is_error_noslot_pfn(pfn))
 		return;
=20
@@ -6838,10 +6840,13 @@ void vmx_set_apic_access_page_addr(struct kvm_vcpu =
*vcpu)
 		vmcs_write64(APIC_ACCESS_ADDR, pfn_to_hpa(pfn));
=20
 	/*
-	 * Do not pin apic access page in memory, the MMU notifier
-	 * will call us again if it is migrated or swapped out.
+	 * Do not pin the APIC access page in memory so that it can be freely
+	 * migrated, the MMU notifier will call us again if it is migrated or
+	 * swapped out.  KVM backs the memslot with anonymous memory, the pfn
+	 * should always point at a refcounted page (if the pfn is valid).
 	 */
-	kvm_release_pfn_clean(pfn);
+	if (!WARN_ON_ONCE(!refcounted_page))
+		kvm_release_page_clean(refcounted_page);
=20
 	/*
 	 * No need for a manual TLB flush at this point, KVM has already done a
--=20
2.47.0.rc1.288.g06298d1525-goog

