Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF527156887
	for <loongarch@lists.linux.dev>; Fri, 26 Jul 2024 23:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722037972; cv=none; b=EKkeUqXMHUt31W8kjr8conrQ1zGcXxFjM+GOVhy8TkxWl6OupfD40qFEzT6WYfZ6BLzUvh5IwiMDUAK1nPElKfQVpOVXNCWfExENAoijrYW/k5v5ZJsDBzJUvc9ZZiOaySdJ538nMYtBOWZj8zeX+SCfVIOkx2WzisdXHhsI4+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722037972; c=relaxed/simple;
	bh=W8/UyfsPYwl/cL0QQCHocRUppr1lNXJ7XLufW7qP3ig=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=gCTAyQ+tfRbEJap94ZkNzesFa3875T4g74JQa2jjYqcAZbC5xVwBZQY0kwOtQrvZjUCRkeL3AQ+V7rEnhH5nxO+e3wEHJjG4e+sD/XiubkCckrIEZZZQ4jSG2plby2XxALYfYle3g9tXDXyttdYvvP+okd8dqEwnIO48xa94URA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OA9ymFs4; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OA9ymFs4"
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-668e964ffd9so6340617b3.3
        for <loongarch@lists.linux.dev>; Fri, 26 Jul 2024 16:52:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722037970; x=1722642770; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=VnEAHRC1zG591I39OowzIjQNXTqQsRDXyh/rUn6sicQ=;
        b=OA9ymFs4VHSMkpIO+Pda4if1XszHz/Aq1/pWPZPaK1fq+36j6HLKzE1qjCCm5qcDwp
         1al5V9EMEw7xUpGBQXakvJLM7K6SpbqKSWIlUPMxF35wjnd24dmgbqkc2jWL5yrULB7t
         DCW2eimqGpLZXvFnURDCY+WhAhcdYm0qJ6bjPjnF4DhehvfuSnrcAU9w6G835pCg5clw
         xkUnkwnIboSprKAn3WxB7DsBrOFs5pzH/2gKjPqeZo69CZBg2MTpM+Z/+WW7nnBH3tZN
         AmDvbDYCXZgD0gOdO1vfDAIdIJHY06u/3JMOMfzambPW/Oz/F4j7tDQjvJ9tKMiipkJ+
         QxFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722037970; x=1722642770;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VnEAHRC1zG591I39OowzIjQNXTqQsRDXyh/rUn6sicQ=;
        b=E7EhvZ/nLl8zjx81TE6jdB7M4hJrmKKFYYGZX+KUdVngPMl2SxdHR0S4gkhAlaD2SR
         V0PfX/RUT0exqSzHn8dfY67gPyqu82ctbOjqTFR0UZhYlTenyj0+t+n43GTBUVo9KgX0
         GPUddNvWqsfx1NpWmGGUwUhMQdgfkt8wE3VFz5gfiLSlrp360dctPIHgrk+6H24E6fgd
         xJUcnMMf4Ir8W4RkwaTFcJkigJ60BJOZikigfrDKpD+JIgUMWfROb43jK6S7qAb563kf
         dFDYasU4h5KvhF186Rge8MrTQ2H88MNhqikUv404fuTlIxhF3i2+49xQf4DCi7C6+XBs
         Dwbg==
X-Forwarded-Encrypted: i=1; AJvYcCWiCvTYcctle/ng5OqI3muNNi2oVT9uXy+ofcEV8QRnh4pwpbDX8TNhVFsrgUdxc2A4nmfVyWF0p2S979MZGLn6aXaW3Uj9fKNW
X-Gm-Message-State: AOJu0YyP1Has0TWkOtahcpMETnMbpyi0kJt7RJLOtoeSBUhNoyX1AJi9
	y9ZPaNVvq4LZTlBvCMI5ltlxECou1mJ4wUfavTtuC6AQYFJWx6/o0JpNUIDIewy62I+qKXijUeU
	ZxA==
X-Google-Smtp-Source: AGHT+IFPOoUYsYyJmRjA25F0UYC9yeYKs61mDA/QqS/vgTcAgpqjjzQfUfGqPl0MU2c7vZElDBuLLOtKUts=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:690c:fc9:b0:648:afcb:a7ce with SMTP id
 00721157ae682-67a05a9d90bmr269367b3.3.1722037969718; Fri, 26 Jul 2024
 16:52:49 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 26 Jul 2024 16:51:15 -0700
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240726235234.228822-7-seanjc@google.com>
Subject: [PATCH v12 06/84] KVM: x86/mmu: Skip the "try unsync" path iff the
 old SPTE was a leaf SPTE
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

Apply make_spte()'s optimization to skip trying to unsync shadow pages if
and only if the old SPTE was a leaf SPTE, as non-leaf SPTEs in direct MMUs
are always writable, i.e. could trigger a false positive and incorrectly
lead to KVM creating a SPTE without write-protecting or marking shadow
pages unsync.

This bug only affects the TDP MMU, as the shadow MMU only overwrites a
shadow-present SPTE when synchronizing SPTEs (and only 4KiB SPTEs can be
unsync).  Specifically, mmu_set_spte() drops any non-leaf SPTEs *before*
calling make_spte(), whereas the TDP MMU can do a direct replacement of a
page table with the leaf SPTE.

Opportunistically update the comment to explain why skipping the unsync
stuff is safe, as opposed to simply saying "it's someone else's problem".

Cc: stable@vger.kernel.org
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/mmu/spte.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/arch/x86/kvm/mmu/spte.c b/arch/x86/kvm/mmu/spte.c
index d4527965e48c..a3baf0cadbee 100644
--- a/arch/x86/kvm/mmu/spte.c
+++ b/arch/x86/kvm/mmu/spte.c
@@ -226,12 +226,20 @@ bool make_spte(struct kvm_vcpu *vcpu, struct kvm_mmu_page *sp,
 		spte |= PT_WRITABLE_MASK | shadow_mmu_writable_mask;
 
 		/*
-		 * Optimization: for pte sync, if spte was writable the hash
-		 * lookup is unnecessary (and expensive). Write protection
-		 * is responsibility of kvm_mmu_get_page / kvm_mmu_sync_roots.
-		 * Same reasoning can be applied to dirty page accounting.
+		 * When overwriting an existing leaf SPTE, and the old SPTE was
+		 * writable, skip trying to unsync shadow pages as any relevant
+		 * shadow pages must already be unsync, i.e. the hash lookup is
+		 * unnecessary (and expensive).
+		 *
+		 * The same reasoning applies to dirty page/folio accounting;
+		 * KVM will mark the folio dirty using the old SPTE, thus
+		 * there's no need to immediately mark the new SPTE as dirty.
+		 *
+		 * Note, both cases rely on KVM not changing PFNs without first
+		 * zapping the old SPTE, which is guaranteed by both the shadow
+		 * MMU and the TDP MMU.
 		 */
-		if (is_writable_pte(old_spte))
+		if (is_last_spte(old_spte, level) && is_writable_pte(old_spte))
 			goto out;
 
 		/*
-- 
2.46.0.rc1.232.g9752f9e123-goog

