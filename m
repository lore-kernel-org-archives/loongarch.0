Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBDAE1E22E3
	for <loongarch@lists.linux.dev>; Thu, 10 Oct 2024 18:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728584704; cv=none; b=Njjcbxl55+hRqlCh2Y6cAOkdOW5/va33iCRDwHzUebbhuaD7n0DHoXdBnNGEFajx8339d/LfJ/5QNI44EwcnKsuF6RJfSF6qDA8lfnaBxiSBy4s3+ZuG/8QhvEUo+fDW71+1YgkKoYVXceetbqN91120PrlegZRzoUhkx3vAd0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728584704; c=relaxed/simple;
	bh=uAiI5uzFAMXWntu4OPmR0EhFBczJTAI1tjFERMQUX4o=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=PbotthpaW/8+kuZfZ8oFehowjO+fm+wOTR/OOg5u9acHHMTQOLdc8zxWeAOGGqLp9wI2tEFHLFGhWhMYYvKhWvi7ir0HQnNRyqxcIpGx2cjTLkjMCVtBlHr20mkEVoENCFy73/15UE9EYzhvxZQMaknGakOT77R6ik6pqjskWsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZeDzQQGD; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZeDzQQGD"
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-6e2d1860a62so23425267b3.0
        for <loongarch@lists.linux.dev>; Thu, 10 Oct 2024 11:25:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584701; x=1729189501; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=pPAj0F/7+N3G0fgp8rSBmKqwV8uR3Qu6XgX2gyD+fUo=;
        b=ZeDzQQGDR4GjGLNMl2TpTXqusTv6MNZt5v7Sk3p59RUwXjTK8k8NiKBCMJqXIKIe6F
         WTOjFi7MVPOO7ar7n/sxQtRTxkk31yuDrxXd0u3fJoYQ1nGaYU7eEw+qPSGPWnjNrcv4
         OM19uBbh/6AVtAHuSw1uDnG6HBdk9pDvTIgF2A4vUDS+ihoQhOwgyd/o5n7zgNAULNE4
         x39sy6l1KSDTJuhdjn5pB5CjCe44zz2H1Z9gBt1+6PnkBOMjbqoMsj2aJUY1eQ3zi99P
         TaSSVHeY1KxbOGm3ljBfmSwvCDcg8d7xI5tyXrwaaiXQjqv7Rd9uJXysdrhIbARXd9pT
         +3lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584701; x=1729189501;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pPAj0F/7+N3G0fgp8rSBmKqwV8uR3Qu6XgX2gyD+fUo=;
        b=Oij4FZdljFQ6Z0tG85L05c0rKU5mlDwsivQTjdvWF2lHTtsWEr7ZO/+/cKpukCb28Z
         A0NHtrsYwHQyl0uhReRKm3yc/VLuaOBUNH1FbhgllESfNm50x5+gdkZLlOPIDZvV31Zi
         voJ8TWTCdM0EaikEKfnhT1Fvw7jbNLBC81EmFz1jiRKnnrNcSIkxMnmGrWuf6yEhK0l8
         +dEnwMz3thZZJrwU4mOWHQ4ZeTnWqJSszOif1alEMXDbcoF3Oe91aBzyhSGYQ317S7jT
         jK0CPEZ1tiHApFmP5/RDmgMq29kr+yRiTR2woaTLnvtBLju/Ii5cju+FhTgzIvYwx23N
         m85g==
X-Forwarded-Encrypted: i=1; AJvYcCWvIyW3fqblAavCjSOSCdnErUKneVUcWi1rwiNDprFZ/WC/TZRCzhb3+KaS4f1B5bO37E+NRUvZQ28=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy2vMF3d+l0yGlSuEiyRzxo+234aHa/jLSGra0vSJVyNy5zJyVQ
	Vx7Z9My2dz57V9sUA+PHugaGvlJzgg64qmOQJxirj/ReFDRJgy7PHP8DTywm3RipGYqxmaExiWE
	miA==
X-Google-Smtp-Source: AGHT+IHQgMXiDY3ifHkkle2NgOnYNSR5nXtws6LnwLsJ4J6Fqip1dtdD5j5lAqBgp/4MJdCcEXFALInKEMI=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a25:69c3:0:b0:e1a:9ed2:67f4 with SMTP id
 3f1490d57ef6-e28fe4313ffmr4949276.2.1728584700890; Thu, 10 Oct 2024 11:25:00
 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 10 Oct 2024 11:23:07 -0700
In-Reply-To: <20241010182427.1434605-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20241010182427.1434605-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Message-ID: <20241010182427.1434605-6-seanjc@google.com>
Subject: [PATCH v13 05/85] KVM: x86/mmu: Don't overwrite shadow-present MMU
 SPTEs when prefaulting
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

Treat attempts to prefetch/prefault MMU SPTEs as spurious if there's an
existing shadow-present SPTE, as overwriting a SPTE that may have been
create by a "real" fault is at best confusing, and at worst potentially
harmful.  E.g. mmu_try_to_unsync_pages() doesn't unsync when prefetching,
which creates a scenario where KVM could try to replace a Writable SPTE
with a !Writable SPTE, as sp->unsync is checked prior to acquiring
mmu_unsync_pages_lock.

Note, this applies to three of the four flavors of "prefetch" in KVM:

  - KVM_PRE_FAULT_MEMORY
  - Async #PF (host or PV)
  - Prefetching

The fourth flavor, SPTE synchronization, i.e. FNAME(sync_spte), _only_
overwrites shadow-present SPTEs when calling make_spte().  But SPTE
synchronization specifically uses mmu_spte_update(), and so naturally
avoids the @prefetch check in mmu_set_spte().

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/mmu/mmu.c     | 3 +++
 arch/x86/kvm/mmu/tdp_mmu.c | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index a9a23e058555..a8c64069aa89 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -2919,6 +2919,9 @@ static int mmu_set_spte(struct kvm_vcpu *vcpu, struct kvm_memory_slot *slot,
 	}
 
 	if (is_shadow_present_pte(*sptep)) {
+		if (prefetch)
+			return RET_PF_SPURIOUS;
+
 		/*
 		 * If we overwrite a PTE page pointer with a 2MB PMD, unlink
 		 * the parent of the now unreachable PTE.
diff --git a/arch/x86/kvm/mmu/tdp_mmu.c b/arch/x86/kvm/mmu/tdp_mmu.c
index 3b996c1fdaab..3c6583468742 100644
--- a/arch/x86/kvm/mmu/tdp_mmu.c
+++ b/arch/x86/kvm/mmu/tdp_mmu.c
@@ -1026,6 +1026,9 @@ static int tdp_mmu_map_handle_target_level(struct kvm_vcpu *vcpu,
 	if (WARN_ON_ONCE(sp->role.level != fault->goal_level))
 		return RET_PF_RETRY;
 
+	if (fault->prefetch && is_shadow_present_pte(iter->old_spte))
+		return RET_PF_SPURIOUS;
+
 	if (unlikely(!fault->slot))
 		new_spte = make_mmio_spte(vcpu, iter->gfn, ACC_ALL);
 	else
-- 
2.47.0.rc1.288.g06298d1525-goog

