Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02A4420604F
	for <loongarch@lists.linux.dev>; Thu, 10 Oct 2024 18:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728584797; cv=none; b=IZdhE7MqNKJXhW54qkZDDIYBCL0oTBlplHUtNfWUTh3JLr3+Gg+Ys7LQytery9XDgWKz7Xjmj31aiyR8e1uUpUyUcvkkSOvNRQIJJJ3iSVVg5LpfRs5PglxQSlfE2Ap9InBhlF3hr+YfYAAXZ6fBmjmsIouQThg/8B50W0RpFVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728584797; c=relaxed/simple;
	bh=aOhxn0fpApYS19RFll+QfwBJLF7yF1QDDa2KZCpFRDw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=kf+/iTOTzVmg1C7le+O1q4QYig0spaNR1c4OP2v/5MsUVbjDBH5yqsalbJNpYsmU/kXeUJJ8wf+ZtD8SV+8nl4BCXw9IDi0pbt86WG5KnUDdS1Cb6pozbOgCBzCQoek0+PAwKGVoi7Li5d9RxdTAS68XaK60daKOoQO5aokkTrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=j2o7jarV; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="j2o7jarV"
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-6e1fbe2a6b1so23282167b3.2
        for <loongarch@lists.linux.dev>; Thu, 10 Oct 2024 11:26:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584794; x=1729189594; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BN+hsHae4h8wzhzshUJRGKM30XxzO0F311sC9z4rUGc=;
        b=j2o7jarVtvzjp0AT5RDwQJuJvwlBpxIS/FuwYJ7Dnyj9qOUYMFHSLDjv54l7/HeA2w
         e4wExH+0+9gCmPp1kH51uwz2qCOUBfUaMp7DdIsctPKqhXt/9TqBl34Rw5x2O/svCy7r
         H3NZ/J0lnoyAlmuwHl5y2dUDqzSjKEFLOLuHrnFSiNPtDkjTEc7mI/xxB0XPIPy7aZML
         r1M55xniB6e+4hqRbti/9oleVOzRB0RvM9Puj9EH8BzyyGwqyyxnejhh3XDFz2Lpvx4n
         N+rTONu5oBa96NPSo0UE7moCSY04saInnNzWkcWvff/BvjEBF621zSVsqbddpNYvgsfg
         O93w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584794; x=1729189594;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BN+hsHae4h8wzhzshUJRGKM30XxzO0F311sC9z4rUGc=;
        b=DV/uxBHhNVQvv/okO/L3T726/1YvzUlgd/KT6OAtTNsZA00xGgOk1pfNgMSkGecl5g
         hRdPzuTmBcCk75KrM76w2MYLBmFFnUK8acOSSHw4SwqrKkcvWB/tmo1nCh9qa1NNdfH3
         y8BVdNFLD4qftTsqUwpDrsMoVCwBcgrk1jrJ01P6ka3OdP9ucwK2fDplEcOMLOH7J1xW
         VD35RT2eZPo2SAD91sHYy8T+UAif31ijXUzHYzh0XCFQ2QUGzL2UYPBRdA05aeEJIcQ0
         Uieb8t420q650VYV1jP8Sj0iJzbDjML2Ax39b1Q86W6CAIPphInngj3F3ANSdRi0eNWw
         S/hg==
X-Forwarded-Encrypted: i=1; AJvYcCVRsEdUiEcVeqlTCwX4GujgrhkLcDtJGjbJqN1mAzO5ixjOlfF0YGCRcESFYCxOcx4X1M9Mczf17Xo=@lists.linux.dev
X-Gm-Message-State: AOJu0YyY/S8F08fAYBYdv347WwdUVDoLVxZiPgRCQVX7ne1UxaMU6qyU
	lBh9jI1owoW2O1MgOdBRDyZaYawwGc9bL0QSR+Tb8eRxsOcoJ7sZMQGMLHrOYakcfj/CpAYFEX9
	YYQ==
X-Google-Smtp-Source: AGHT+IEjw5s9ln5Mmco0bHKHDYNNIWwRc71SIREcZZABOz/fcRYPRAU5+BeNEqASF/uZrX6+QTap8C7eoHE=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a05:690c:2c01:b0:6e2:3e17:1838 with SMTP id
 00721157ae682-6e3221407b0mr440167b3.1.1728584793806; Thu, 10 Oct 2024
 11:26:33 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 10 Oct 2024 11:23:50 -0700
In-Reply-To: <20241010182427.1434605-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20241010182427.1434605-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Message-ID: <20241010182427.1434605-49-seanjc@google.com>
Subject: [PATCH v13 48/85] KVM: x86/mmu: Don't mark unused faultin pages as accessed
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

When finishing guest page faults, don't mark pages as accessed if KVM
is resuming the guest _without_ installing a mapping, i.e. if the page
isn't being used.  While it's possible that marking the page accessed
could avoid minor thrashing due to reclaiming a page that the guest is
about to access, it's far more likely that the gfn=3D>pfn mapping was
was invalidated, e.g. due a memslot change, or because the corresponding
VMA is being modified.

Tested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/mmu/mmu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index f9b7e3a7370f..e14b84d2f55b 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -4386,7 +4386,9 @@ static void kvm_mmu_finish_page_fault(struct kvm_vcpu=
 *vcpu,
 	 * fault handler, and so KVM must (somewhat) speculatively mark the
 	 * folio dirty if KVM could locklessly make the SPTE writable.
 	 */
-	if (!fault->map_writable || r =3D=3D RET_PF_RETRY)
+	if (r =3D=3D RET_PF_RETRY)
+		kvm_release_page_unused(fault->refcounted_page);
+	else if (!fault->map_writable)
 		kvm_release_page_clean(fault->refcounted_page);
 	else
 		kvm_release_page_dirty(fault->refcounted_page);
--=20
2.47.0.rc1.288.g06298d1525-goog

