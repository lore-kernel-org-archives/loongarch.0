Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25EA5206E9F
	for <loongarch@lists.linux.dev>; Thu, 10 Oct 2024 18:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728584807; cv=none; b=UolwXvVrd7fT4joX3IUZEejmeM3TyJcXaz/CjsGU4c2wnnmI+NCFmNo57OhlB3OEI70u5a6BdlZttOHOenopqll/2QVGXHggqcgoEiquZqCDzxfV3JDCDR7NoQ7yNZ/5zzxIl4MmTHv1pYR9x/OyjNBWl79qudGQIyltvwyvceQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728584807; c=relaxed/simple;
	bh=kbjwflG2kz8fn2XlGwl/ZUkp2MoQm+/BMH1MpANV1Tw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=PoozIGhyILTkiuy8nnO48iY8oKzUalat0ee0Ld2gSQ2zm336JYakyRyRu4JkzCljzkohGV/mbdDjT7O0po8LtdB/ykf06DC6uezM1wUZlz5cocK3dyme5t3Hu44sDUJ2nq7DgPSiDjRbsbcheZfGUg2comGhcvEmjfZ9TCaruf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=KOPgrrdI; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KOPgrrdI"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-7e9f9a927a5so1044194a12.2
        for <loongarch@lists.linux.dev>; Thu, 10 Oct 2024 11:26:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584805; x=1729189605; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=RAEBOjiR86B8MKio5svj+gL/GJb0VtWq7ImNxArS0H8=;
        b=KOPgrrdIQuxv55g2QNpQWt6OmHHUR4RKLO7D+Zc/FE9w5jHQ8QroI9PpH3788B9Cx1
         ANsuA34N227F16ki3fTO94u/rQtyI8/3d3CmDGyzTWWXKIziO8vB9w1zXlS2Ao9XXga4
         pqxx2HR73lF5P4ZBuJDKLrfXOLtGi7EVBJLZFQMdqRXqDTmKWeEFfWWIiyyUAjgfttQA
         XZOeR+aiFbCF1Wq30QZtVmYbC/FVP/HnjpieNPlc6vxLM78ocMpKO37JCfyRpKwkYlir
         RXdSMxaBdEGfI7dAkDPcnaO3vU2GUbCe+Q9Snb6Rsivl7HEHsN0QLVwY0TRIkmdBIRqt
         yarg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584805; x=1729189605;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RAEBOjiR86B8MKio5svj+gL/GJb0VtWq7ImNxArS0H8=;
        b=wXok0nQC+HnX7YRu/ZHNkMI8ttcjB5C/3hBL8sMYAE2xdsiIQlhDveJx+U29rvXFgX
         Wapg90rhnDnbR5djhWjQQzWPuRdTD1XBEi/2ME9VoRJFjf5ug8v696jqRB56BzADBQC3
         j887rHUQzNvOdFz6HHocr2MUYhKqyb1J+047YEHSy1fN/zv8R6VyvTARpcgRsNfSMFEC
         xpA+xwtXQ3Kdcwmfs55iWSzSZdebyi9iJ2Y7hZ20ydpTuHTtspZOziveJLz4r79ldz+9
         p3Q2g7ZHd6RvgsULnD4ScFUuxhZXsClkh+X9fwAShkZHGlgMzJuaSQ2BKVwfKa33Me42
         MdKQ==
X-Forwarded-Encrypted: i=1; AJvYcCVl4ExpyVZ7jnJGvKdx+IKU5PkDNS+Xe5GNDV+7V+NyZ/Ca0rXN11PtU/IspvleHtHzwCC1k+Cue1A=@lists.linux.dev
X-Gm-Message-State: AOJu0YybirP0l+lEqCQM/PoBVMSjAPM+Jd8LAfq/sskqDi9Nu8NucM5U
	NBc1w/A4bnSgmUbzkh194kgaobZUeibsIWybHXXPU0WZ3Ccx3RDqF/z3skuiuUT4P/j/1O/pE3w
	0+Q==
X-Google-Smtp-Source: AGHT+IH3g+or1uGKI8zaqA7g6VjAId1uToioip8sNGZo/KyXggeZoODfUOK1q5z450FXHERnWYgwR7EwX2I=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a17:90a:5107:b0:2e2:ca3e:10fe with SMTP id
 98e67ed59e1d1-2e2f0f88a54mr24a91.8.1728584805241; Thu, 10 Oct 2024 11:26:45
 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 10 Oct 2024 11:23:55 -0700
In-Reply-To: <20241010182427.1434605-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20241010182427.1434605-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Message-ID: <20241010182427.1434605-54-seanjc@google.com>
Subject: [PATCH v13 53/85] KVM: PPC: e500: Mark "struct page" pfn accessed
 before dropping mmu_lock
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

Mark pages accessed before dropping mmu_lock when faulting in guest memory
so that shadow_map() can convert to kvm_release_faultin_page() without
tripping its lockdep assertion on mmu_lock being held.  Marking pages
accessed outside of mmu_lock is ok (not great, but safe), but marking
pages _dirty_ outside of mmu_lock can make filesystems unhappy.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/powerpc/kvm/e500_mmu_host.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/powerpc/kvm/e500_mmu_host.c b/arch/powerpc/kvm/e500_mmu_host.c
index 5c2adfd19e12..334dd96f8081 100644
--- a/arch/powerpc/kvm/e500_mmu_host.c
+++ b/arch/powerpc/kvm/e500_mmu_host.c
@@ -498,11 +498,9 @@ static inline int kvmppc_e500_shadow_map(struct kvmppc_vcpu_e500 *vcpu_e500,
 	kvmppc_mmu_flush_icache(pfn);
 
 out:
-	spin_unlock(&kvm->mmu_lock);
-
 	/* Drop refcount on page, so that mmu notifiers can clear it */
 	kvm_release_pfn_clean(pfn);
-
+	spin_unlock(&kvm->mmu_lock);
 	return ret;
 }
 
-- 
2.47.0.rc1.288.g06298d1525-goog

