Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 412DA2038B7
	for <loongarch@lists.linux.dev>; Thu, 10 Oct 2024 18:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728584781; cv=none; b=a7r6b2NlZP3HHvmfcPHEsOOEP2Xoilb7XxBHhgtf8d0o5uHrPXDyfoQ/bkKLZzc/Y7Y2N2WSSiWcc8h+4MHIEML1Q64PjdtzKPuQfFCV4F09oqWkxtSUJ2HtX1cBbqn/1FG3wYOnNLsJ3zLQu64wTzNeMH4nVXVyq9nhYOLa9YQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728584781; c=relaxed/simple;
	bh=hSHnz2G1ntKemXewFOwXdDJXjhCTKhhhRrw1wSIGnaU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=tdECsv9TR+eIbSUP0quhFc4wNCipFoik5z5yETN21stBCoMVTnwkqQPlXRPGhyJNSOi2hKWjbolAtsFPbIQQ6DXhVLBEhoEIrMIRVVvkB+TzZh7fKqJWV9uNp4BIujLtRpK4VakJJ+iJPMc79Ny4NfRnGLW71RtofSRG6kb1bOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RXdLO3TP; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RXdLO3TP"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-71e026caf8bso1466235b3a.2
        for <loongarch@lists.linux.dev>; Thu, 10 Oct 2024 11:26:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584780; x=1729189580; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8DwvYXI8CmE5CO0Ycvk+EgdgF52vTMi74FFh8TONwA8=;
        b=RXdLO3TPMkD3KnsnhoPCgEkwkv2QqNaonrCLVnm6w3OEgS5MZ2YeXbPuKQA0tVmHf5
         3Y2GAEE5XCzy4eEbKZitk9mIyIT1d6KYmZQ9GtzlfjCkOt2ZNqH6c3SxEe8n/+g408Q/
         wFaNUwYN2ugZg4Oay3woWGFFwIlHwbko9Sr58Gne3iStofuuEl7bTjMC+nOjXfWSSCyq
         QwwDPh2lxSL6cPDaU6k7ePLZyqtURdQ52Hxi0PG9GlnBHnCLV8G2QKjkzEiEEh+AWXqt
         UeOiSId+HrBMLYB2Me/Nve3GtRBQBgpAImcRgqP7yUcWQaqF0qfYDPdfoqpLt5eURNKh
         g57w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584780; x=1729189580;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8DwvYXI8CmE5CO0Ycvk+EgdgF52vTMi74FFh8TONwA8=;
        b=mYOyli/6jF8aOyURL4F0IK9kq/vbwd44gbnQZt3Q6nC9DOmWNhcFH7WfnWwiXRkke6
         kv646jGqLymVpqmTQv3eKPe6XqrCgh/AiJdwbaiaESoS40sGygTqn7Vm0rLuW9P0WMu3
         N1y0Dqk33mIM62IVcesqi6PxQh6Itq5suDeuKgmLKGu2OMI6bC+tPPv49kv3o3ykPawg
         +3jQUxFibwPzry5KqmdxvyV/jFfR4mCeaUGTNC2cgb7hx5fb42YhkFBoKfQJlbsKsir4
         ybsWU01CHtQJyDgkdHzPxHyxuzfeEIB5uwKeD2ai2u7MhcmLLW96IlDso4t28pxnocZw
         MrLQ==
X-Forwarded-Encrypted: i=1; AJvYcCU5GuMB1znky2QCTRXbrOVxTjlwfWz3En4E2mOS0LMJYWxPyyc9EMK3gcgH5AEK/1YzpfnjUX4qlRk=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywc/MOrS38AEVt4Yfio/TTIdeS2K1ppyJ6OkEAfBrj+zDK+Gtsr
	3+Laqut6krES+lZIeeIWWv2/Y3v/RJxtw7UNs3tek/HN4TItlKG51TnxOI9xDuny41ULLb7o+nl
	Pkg==
X-Google-Smtp-Source: AGHT+IG3pPvsekcqYnotExeZVZUXEYlJLq+6e3a1eutYJX4gtVKcKQbhJKMNrxmpaRIGMBxtyW/kZ/ByL14=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a05:6a00:91a3:b0:71d:fb06:e79b with SMTP id
 d2e1a72fcca58-71e37c53abamr28b3a.0.1728584779496; Thu, 10 Oct 2024 11:26:19
 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 10 Oct 2024 11:23:44 -0700
In-Reply-To: <20241010182427.1434605-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20241010182427.1434605-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Message-ID: <20241010182427.1434605-43-seanjc@google.com>
Subject: [PATCH v13 42/85] KVM: Move declarations of memslot accessors up in kvm_host.h
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

Move the memslot lookup helpers further up in kvm_host.h so that they can
be used by inlined "to pfn" wrappers.

No functional change intended.

Tested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 include/linux/kvm_host.h | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 9263375d0362..346bfef14e5a 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -1168,6 +1168,10 @@ static inline bool kvm_memslot_iter_is_valid(struct =
kvm_memslot_iter *iter, gfn_
 	     kvm_memslot_iter_is_valid(iter, end);			\
 	     kvm_memslot_iter_next(iter))
=20
+struct kvm_memory_slot *gfn_to_memslot(struct kvm *kvm, gfn_t gfn);
+struct kvm_memslots *kvm_vcpu_memslots(struct kvm_vcpu *vcpu);
+struct kvm_memory_slot *kvm_vcpu_gfn_to_memslot(struct kvm_vcpu *vcpu, gfn=
_t gfn);
+
 /*
  * KVM_SET_USER_MEMORY_REGION ioctl allows the following operations:
  * - create a new memory slot
@@ -1303,15 +1307,13 @@ int kvm_gfn_to_hva_cache_init(struct kvm *kvm, stru=
ct gfn_to_hva_cache *ghc,
 })
=20
 int kvm_clear_guest(struct kvm *kvm, gpa_t gpa, unsigned long len);
-struct kvm_memory_slot *gfn_to_memslot(struct kvm *kvm, gfn_t gfn);
 bool kvm_is_visible_gfn(struct kvm *kvm, gfn_t gfn);
 bool kvm_vcpu_is_visible_gfn(struct kvm_vcpu *vcpu, gfn_t gfn);
 unsigned long kvm_host_page_size(struct kvm_vcpu *vcpu, gfn_t gfn);
 void mark_page_dirty_in_slot(struct kvm *kvm, const struct kvm_memory_slot=
 *memslot, gfn_t gfn);
 void mark_page_dirty(struct kvm *kvm, gfn_t gfn);
=20
-struct kvm_memslots *kvm_vcpu_memslots(struct kvm_vcpu *vcpu);
-struct kvm_memory_slot *kvm_vcpu_gfn_to_memslot(struct kvm_vcpu *vcpu, gfn=
_t gfn);
+
 kvm_pfn_t kvm_vcpu_gfn_to_pfn(struct kvm_vcpu *vcpu, gfn_t gfn);
=20
 int __kvm_vcpu_map(struct kvm_vcpu *vcpu, gpa_t gpa, struct kvm_host_map *=
map,
--=20
2.47.0.rc1.288.g06298d1525-goog

