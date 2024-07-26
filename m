Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BBA518561C
	for <loongarch@lists.linux.dev>; Fri, 26 Jul 2024 23:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722038067; cv=none; b=ZT+FVfhq9HTKM0yHMovz87t0GBfbINdNdW+DVld7MngZu9iRqEg76pyfb5PXJls+3MMhnbc431kxWvEasY6lgiluAzYQjrhBG+Mjsl4aDpJTM9HuMsmo7O1NSlokkzcMmuWTJX+rPZdlEWc9h5BFwGrhzJpj/uky/sUbfdISlec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722038067; c=relaxed/simple;
	bh=bY53gDaonSlIhoyFNY0EzYkmvr6M3Y58/Tqc7IOcPjk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=CDztkHv0qaJ6axBNJ5+h2EIPPRrX/e+C6a79azIpngaTuQ1y6tFnL5UzIugBkXPAWboRVxxsccBevNs/Bvm4QQOZMiFPQBazw2SV3QgkMf1Vy+gfttZ19MtyV708MHjBS+m1eKEfDovB2RUDViB8kiDB7Za18Co2r6AUMVcqDII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cGv2dwh7; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cGv2dwh7"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-1fc54c57a92so10629095ad.3
        for <loongarch@lists.linux.dev>; Fri, 26 Jul 2024 16:54:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722038065; x=1722642865; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=WWjK/C8AJGiWvc7o48+tH+q+w9m6pJN61mgGRKL0h6o=;
        b=cGv2dwh7fodd6s/voYf34/PIU0Qw/UQ7O+a8GHj6SSZjSmHXKy2ROksFACGdXDx/0a
         uazk8b/b8BZ5xd1h/kVy1VY7sqlrRr5hw+2p+9BrVcKXC7O3cvpPmMnCzS9f7c2j/Ef+
         TqcN1z40lIdbHkyIndAxE2C89CkyYyThhUeU5uE9qu7jnNC3rQ0Gqhd0jgh3cJdJbs8w
         1Q36nDlV0A6A3jGt6oQsEaAS89c2VJetDVnIob03eypr6EXe3fgWmS7sWNQnCkVPQ0ij
         eekiod0kxV5bFw8obhKhW+2k6rjWwkEe3ouvIA9o47GRB7ISzwqDXrMOJYLgBhUjuscp
         Onhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722038065; x=1722642865;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WWjK/C8AJGiWvc7o48+tH+q+w9m6pJN61mgGRKL0h6o=;
        b=wFsDmb/rDOY7h5nptN8DBzdfN1z/oP2LnaNNxOyY0I8X8DQ90cW64PrK3Fug5YjY6p
         BnuBIWBHxYky76ueZrhn7v9AD0qGZzbWcar8MXG3koJr28SAlSbdMENnfrKeD03dAhAD
         b/z64j5FBeoIkKY+8RRrOmjmFIC08FvVPSAwbxKL7yrSpq65zmigMVkWeIkZGtTSfkfi
         vJ/bxq6UsfhYd3LD/akKtJYAlmkTMdkx9wHXLwWa32kZOAgPhWk3TyOt+Xq3bAOeaSev
         WQpuYBipDbeV6QnKA7mf1Syp+F/IC8vagBEFBz4Q8IlrN76Fz5Ok7tpgDyZSa8XG/IVR
         SZBA==
X-Forwarded-Encrypted: i=1; AJvYcCUiL29rGZsh/l2PUIxAbV/cd0UKrl4nlw3kn57P6E3DcWIX1yLZ4CIpjnl/CfS7wYlFvoSbL1a5i2RcZ1ytl4JCrPCdHUCfe3f6
X-Gm-Message-State: AOJu0YzTSksbPwJQ5WGXHsCVULvKUz2LG2lZkQPa2cjI3oktj2qYMHD4
	xFVyLYE/kwKs+g234CpyNLbexrigJ6Lhrjs+19YVvMSFkpAqZVkCwPHKeUZUmPEXlkquyM0u8gh
	v7w==
X-Google-Smtp-Source: AGHT+IHjueGi4XHTR80VLKYNSmezTNqicqTjy1hjWkoeqfVxP7xL/6dlCTgQugjOLvFflviFEVZzvXY7ZzM=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:903:41c6:b0:1fb:80c5:ce5d with SMTP id
 d9443c01a7336-1ff047b2dd6mr400915ad.4.1722038064523; Fri, 26 Jul 2024
 16:54:24 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 26 Jul 2024 16:52:01 -0700
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240726235234.228822-53-seanjc@google.com>
Subject: [PATCH v12 52/84] KVM: PPC: e500: Mark "struct page" pfn accessed
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
	David Matlack <dmatlack@google.com>, David Stevens <stevensd@chromium.org>
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
2.46.0.rc1.232.g9752f9e123-goog

