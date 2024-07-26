Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCCE3183095
	for <loongarch@lists.linux.dev>; Fri, 26 Jul 2024 23:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722038055; cv=none; b=B7L9Md1uyaaQCVty87mtR9RyX1HRk87JmKznl0115IkJXtN9CsLDWzvloZ5EDVj/BteiGTrqVUhsQJCedNvGTVHDkRyY/7zQC8gEPc/ZVdOgmFYbZ+0z3L6gdh6A994l8K1P+uE+OQNvHHVgbZcuKE+/GrHLJrtCSPEfV4SzMgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722038055; c=relaxed/simple;
	bh=PYmFTsup/AEmfy/4jq9PM2uJzzhDaOGf5jqGf3bldb4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=POxjiU+akX7DHHHFZoiOt84OFR55ORrHHN47ICH8BAS5fCkFXZ4e2eafMzflKC3uwajW2Qv04lWV0T/w3nmyrsnrDqJqP0JFfpwr+9THwtLnlXG6Rfj7NboLIgQchiUV5d7KBj1bDyAJtJmxzVRhdtspqD+PZT+SBwU0xmAuhmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=4MS1MK9q; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="4MS1MK9q"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-2cb5ab2f274so1670084a91.3
        for <loongarch@lists.linux.dev>; Fri, 26 Jul 2024 16:54:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722038053; x=1722642853; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=IbuNIltU7tfSlkccHv78LPGh6NGiPV3XEW5ZkU/rXdY=;
        b=4MS1MK9q2siwTvwZLY05vAxHnmiiQ0ymQWbF7MykG3ZQ7jv+TAECh9JMnGIQDeIBrk
         A1lG+lqrgTmSk41zxwUYcU/u9mJSk0HaYY0GkawAVIcwYF4kaSfkWzFlVgr+yGOBISKt
         qf0d1mKVRn2Ai0TYP12ZJgYgyoJiZfiPBEOFXujfB8tTwlVaghywdE5y8ASVwfH6jUAi
         t63u0L824h+IwlNJkwEEZkvuiQ0MbbywozUucygc/wpQuwQDl8DlmZ85I68ALyiZcxhj
         fUGGs2HCNfnhhyOwApPnoaboU+jVA1kZD0MurOv/VA54GD45xgRaRxfdeEk/mTE11lxz
         r4hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722038053; x=1722642853;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IbuNIltU7tfSlkccHv78LPGh6NGiPV3XEW5ZkU/rXdY=;
        b=BPdTml/OVpCgTVwr3jD5cxnFZpyZz6PAiSMivSy5vUSUe4ioazJAmBu/FMX4on78RP
         TOf6vQsByYIk1dZrlEwdQucvYC+B9mQQpMHdnTCxL8TU8D8cZBh2a7g7iQsL9rCH9mJ8
         FY05XkW2iF2CbpDKztYs7mMjn3uy0zkfWJbuYx4D8pME+QNHXZbs2iJwUK7urKE8gGvJ
         e59qRp8sKnnj7/cB1Yc38uLeSr80ISLhuz5LLNACUb+8CrtFU655VbvX3HJpyBjHGBqc
         o1/d5NfV5FJqfKypMj7BlYCuTHbLP+bhUXvJOBDO6Z1pIG3xyolL34RFGGHAIjq9roS+
         +IgA==
X-Forwarded-Encrypted: i=1; AJvYcCU1uYoVrVIGK+2DYdZIZECSIERvyYXuSLgRKn2K2eb5L+lkGGZKBSYV+aZ5pxs1r/ENj0MW3aNk+5sgKyKznPesBLv3Nd/Nb61A
X-Gm-Message-State: AOJu0Yy7gSrPMwAu6wW/MoEQADi4WHoza6wRFXMs65LSlIORnaHz1P9U
	ADko5vJaftJxAwL+zFMXZalqs5QZsnNke5nViqm1PbUpaHjh26fSu9tglSSqh2HypQiTnd9OauB
	3EA==
X-Google-Smtp-Source: AGHT+IF1WA3mVZXk9S93pEq2eXLardKUPi+yfLeicmT6epShCKMtCcCE54tvymeWkFnvdj0Qbejb/rqSUKM=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:903:41cc:b0:1fd:87a7:1445 with SMTP id
 d9443c01a7336-1ff0489344bmr935735ad.9.1722038053119; Fri, 26 Jul 2024
 16:54:13 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 26 Jul 2024 16:51:55 -0700
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240726235234.228822-47-seanjc@google.com>
Subject: [PATCH v12 46/84] KVM: x86/mmu: Put refcounted pages instead of
 blindly releasing pfns
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

Now that all x86 page fault paths precisely track refcounted pages, use
Use kvm_page_fault.refcounted_page to put references to struct page memory
when finishing page faults.  This is a baby step towards eliminating
kvm_pfn_to_refcounted_page().

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/mmu/mmu.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index 146e57c9c86d..3cdb1bd80823 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -4326,6 +4326,9 @@ static void kvm_mmu_finish_page_fault(struct kvm_vcpu *vcpu,
 	lockdep_assert_once(lockdep_is_held(&vcpu->kvm->mmu_lock) ||
 			    r == RET_PF_RETRY);
 
+	if (!fault->refcounted_page)
+		return;
+
 	/*
 	 * If the page that KVM got from the *primary MMU* is writable, and KVM
 	 * installed or reused a SPTE, mark the page/folio dirty.  Note, this
@@ -4337,9 +4340,9 @@ static void kvm_mmu_finish_page_fault(struct kvm_vcpu *vcpu,
 	 * folio dirty if KVM could locklessly make the SPTE writable.
 	 */
 	if (!fault->map_writable || r == RET_PF_RETRY)
-		kvm_release_pfn_clean(fault->pfn);
+		kvm_release_page_clean(fault->refcounted_page);
 	else
-		kvm_release_pfn_dirty(fault->pfn);
+		kvm_release_page_dirty(fault->refcounted_page);
 }
 
 static int kvm_mmu_faultin_pfn_private(struct kvm_vcpu *vcpu,
-- 
2.46.0.rc1.232.g9752f9e123-goog

