Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B16501D0E10
	for <loongarch@lists.linux.dev>; Thu, 10 Oct 2024 18:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728584699; cv=none; b=hHdxQNnmGO/rDvq4mYrj7wbJnju2k5fEi4cVyHT9pahU07TJxCTvcGU6PFEvVtyHg4FAqKg3EiQW97orMWcwqKw/xVBh2gCtqYx5/9FBENtQUqs5o1UPHItg8AW6RWITkGpobk4awmDDWxb1aIQclYjSgCSakXTKQgN87tul8OE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728584699; c=relaxed/simple;
	bh=/+UXWBjoqTQ+9Qx4e881Uho0Hr1R01lQsdRPnyHLl9M=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Qlu/VQHnx+cINKpJrZg/JMUtqkwpJaXChuzMPohdU6av0cSmEdShrC8chyXSsoFOHlNA7vOL4RJgljdtF5bb4QyTvXrsFCpZf+rlpwOZnSeBXiLr9huIliFrrVxQndL9LDL1/PglcY1V2EGG86D5ta9iXzhlL3x7a0wUobRbvS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=s0vhLW7u; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="s0vhLW7u"
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-6e20e22243dso22265197b3.1
        for <loongarch@lists.linux.dev>; Thu, 10 Oct 2024 11:24:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584697; x=1729189497; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X4CpCR2xmh5xLGpBn2Bl3P0Y4RCeyU3sCMc2ynGYEmk=;
        b=s0vhLW7u6r+wxlfco64Ctbd9jBdreOEyavQw6XBdmjKAnt3SlYT0GCPTwVmfXXV542
         owMtBVLR0/ImSIlBrF+EUuwSt07/eNE9geLNvWYgpTUixkJRRnO8dcqBtFY3c62f/NZc
         bc5GvRctm6r3pvj+sx02gfEMtPKeUMUUW+6wvMf9yzXpwP6Dcg/y/mjFbLWfXJeWVF+E
         3ITU5eHV+QWQqGBHrJwDFvapBTKnlZzanM8nUCG/Gso0VLDh1e+DAGPFbzpeIez1Yzie
         D0VbgA72DwK5pHNC5Gn1L6m86908u6Qcl/mIqwPl0NFiDX2DImrexVTSexJeCQwzJbYN
         LlZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584697; x=1729189497;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=X4CpCR2xmh5xLGpBn2Bl3P0Y4RCeyU3sCMc2ynGYEmk=;
        b=BHXepzQKeV1iH8Iny50JqJ06vaHmEXxjlN2jwOk50QkrfmZ9hEN95rs974fpru5DxG
         VT76A5JF0eLXlMAJUWaVjXrUl5Cb5/KmgOokvePNJTFCdYd4+7ztCP3Rzhjt3pzz+Qeb
         3NfKyrGHgvFg21FkL1H4mFhoPOvYpv4oGEwXgf5lO3BIltET7j1v7LBTVBBrljMFdxZP
         awPqUotxvltGsmEQWU+VEuwQ1a/n2YyzDVLF+Trv1VfS9b4qF3O1En9Ty3+2TCW/pwDt
         8TtYN7r2S8CNokDhCaq2k669zlsg0D9dFtrxkYfKG2xHIp95udqBKa7edV7wHuqcLNT2
         Q4mA==
X-Forwarded-Encrypted: i=1; AJvYcCV3otlwA4yglcX0lj5pYSDG8PLMvSRC4SD624JQbU3gysec9iLBI/pNiGnjubI7xWq3KCa5dgNYZ8E=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxb7naBQwwqgJL3IVrEx4hlqUFeHW2kwh36DiPnulVUQ7EoHHGy
	0zRKPLL1NmyoRjN3h0HINE9SZJ/QVX0Z5ExiJ+YhN0e6Md3X5f/o/PtwXdEjHq7/Pd5prFMLOai
	BSQ==
X-Google-Smtp-Source: AGHT+IGrULPD5dT5NWC9dFAfgTsoL9JIWGzHU9t8+6e7flVyO5QHPCRlr/jDUZCu+nhXBHYl+WGzejB3KuQ=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a0d:e486:0:b0:6e2:371f:4aef with SMTP id
 00721157ae682-6e322168931mr204147b3.3.1728584696651; Thu, 10 Oct 2024
 11:24:56 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 10 Oct 2024 11:23:06 -0700
In-Reply-To: <20241010182427.1434605-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20241010182427.1434605-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Message-ID: <20241010182427.1434605-5-seanjc@google.com>
Subject: [PATCH v13 04/85] KVM: x86/mmu: Skip the "try unsync" path iff the
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
	"=?UTF-8?q?Alex=20Benn=C3=A9e?=" <alex.bennee@linaro.org>, Yan Zhao <yan.y.zhao@intel.com>, 
	David Matlack <dmatlack@google.com>, David Stevens <stevensd@chromium.org>, 
	Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

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
Tested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/mmu/spte.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/arch/x86/kvm/mmu/spte.c b/arch/x86/kvm/mmu/spte.c
index 8f7eb3ad88fc..5521608077ec 100644
--- a/arch/x86/kvm/mmu/spte.c
+++ b/arch/x86/kvm/mmu/spte.c
@@ -226,12 +226,20 @@ bool make_spte(struct kvm_vcpu *vcpu, struct kvm_mmu_=
page *sp,
 		spte |=3D PT_WRITABLE_MASK | shadow_mmu_writable_mask;
=20
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
=20
 		/*
--=20
2.47.0.rc1.288.g06298d1525-goog

