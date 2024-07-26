Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39ADD18EFCA
	for <loongarch@lists.linux.dev>; Fri, 26 Jul 2024 23:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722038105; cv=none; b=FuNWX3q7DcBXFPQsCKHcGgNK+bVMigUjBH2LB5ZE0B8PuG5oWKexjJXLn5wL05XqdPPNCOUUK02Nrc53Xrmic+5U+bir9uB90e6Y107vaLNGHGpGU+S/DAekrPYjQooS8nqN8kaYr4UEx4V+bdxE4XKiECLBFA5eBzRZPOiSgSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722038105; c=relaxed/simple;
	bh=ziM2BhZeDvRuc7Kv6C0zNSnuZJuDBMOs3hNrlsk1v5s=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=V7hmbd4PoqtI2CekdT/IlT71DOr00y6oaNZ0VPWOwcgYxLmKKoIRLpAttyFzsgvGw35vYcgr5VKWaehdKEstY+fiXXxbCPuzWIegls/Lu7iGKh/Yu0eWqUfSRqkP7W0PlvzS7UsXP0rDiY3iCvnefUx7mH8GAdmdLTTnXxWsaHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pbY8CM/q; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pbY8CM/q"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-5e4df21f22dso1272974a12.0
        for <loongarch@lists.linux.dev>; Fri, 26 Jul 2024 16:55:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722038104; x=1722642904; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=y+Ar7T6On16alzy9M8c5sPTmukkBuZuZUdMs6MViY54=;
        b=pbY8CM/qSToyVsAX6AIKUYcDxoCiMkQcKh7vlgBwhPZ3dLpEhS4hebevOIHS3WQLsF
         Q6uhOUk5q1wNvC1tnB9pe2pq9qkMh+rhM+nfu+MVasooJhENUThn/rb3C7PQB85EWVWd
         BlgGXA+tL/H2vUKMdn/d5iSNlfH/bun6kgnJX4RNf4Am0Fa/45uzhjtOkGQKCwj/GD7+
         hPSISviDR9OuagQHJEU5JMBxoXaFxI4PAK2m0qwboZsmz5XagGZhSNux1b4fFB8KZ4nJ
         0pcIIsxDjkhknUwzXEDbP/AE/dBjdrNkukJGoFAN1QUNfMna1pJ5gztBPUfakmKFY19k
         tZow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722038104; x=1722642904;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y+Ar7T6On16alzy9M8c5sPTmukkBuZuZUdMs6MViY54=;
        b=cgOOFWdEzF7s2I9Uktv51ajxsLTc+EvTOCid9VwBfS0bnbtj/mBYdJdzSc6zPye5Ku
         mM4d41Nv2W7tMIb2XZfO1hD3nrYuxW3GfR+nEopTESWcNpdODHurhUv/oqfnpol/TDBA
         eDbI/WKx9QwygMe+J03KrmBFoNdCCUzmlsrsfNmQQ7M3t7oWpdRlejydPW0GpZkmV5F3
         7fd5K2T38o4pf6m6l9jBn5QHCcytwLYN0BIWn0EHiyJEzs/s67i+Ibqu6jIFQbWO/q4+
         lZgcqGS9BScb416Sy++IZg5+PtY65Rn8A1ZaAafpqnGN1UVGanM7tUFhD//bAijedxXz
         6EuQ==
X-Forwarded-Encrypted: i=1; AJvYcCUmJJr9XkrSlXhl25Yo3eRCgwsMnPc13Khbl2i2eHN739jcY9zEOqFoZBEmexfosynwmN6WW2aLeFTSR0pLmJgGYT+L4MMYIbrx
X-Gm-Message-State: AOJu0Ywr1AwDBl3u5SdVvc8e2O/4PsrT60vCxZtlHB1Ut4cBINF2Ce1/
	5xKETQp9g05T4Q+tqCGURrsED9bRHShd3wts0SHOwh0GuPiBzyJOdC+PPYd0bpJHl1H4AW4i3/N
	BTg==
X-Google-Smtp-Source: AGHT+IFnr9ua4KoyN+kf9dgXRrvt4SVsbQldBEs2PtVQEhle6Kqivs/NJk7PeSFySHT1lFiCWuBu3lKqAis=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6a02:50a:b0:740:2b12:8780 with SMTP id
 41be03b00d2f7-7ac8fd30684mr3158a12.5.1722038103410; Fri, 26 Jul 2024 16:55:03
 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 26 Jul 2024 16:52:19 -0700
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240726235234.228822-71-seanjc@google.com>
Subject: [PATCH v12 70/84] KVM: MIPS: Mark "struct page" pfns accessed prior
 to dropping mmu_lock
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

Mark pages accessed before dropping mmu_lock when faulting in guest memory
so that MIPS can convert to kvm_release_faultin_page() without tripping
its lockdep assertion on mmu_lock being held.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/mips/kvm/mmu.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/mips/kvm/mmu.c b/arch/mips/kvm/mmu.c
index f1e4b618ec6d..69463ab24d97 100644
--- a/arch/mips/kvm/mmu.c
+++ b/arch/mips/kvm/mmu.c
@@ -634,10 +634,9 @@ static int kvm_mips_map_page(struct kvm_vcpu *vcpu, unsigned long gpa,
 
 	if (writeable)
 		kvm_set_pfn_dirty(pfn);
-
-	spin_unlock(&kvm->mmu_lock);
 	kvm_release_pfn_clean(pfn);
-	kvm_set_pfn_accessed(pfn);
+
+	spin_unlock(&kvm->mmu_lock);
 out:
 	srcu_read_unlock(&kvm->srcu, srcu_idx);
 	return err;
-- 
2.46.0.rc1.232.g9752f9e123-goog

