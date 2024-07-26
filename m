Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA37E154445
	for <loongarch@lists.linux.dev>; Fri, 26 Jul 2024 23:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722037965; cv=none; b=syecJ3GxaLg3qjEwvv67bEZKCD+Jwy/gKFkcG7q8ZhZ5fC6rXwlPSDZH7qDzA/QrkZpU52ooPIM0+xp9THQ0/RCoesdDwRPg1S9u5G7/LTozsXw19JwhnzFOPKpxYGlaCo+zGvZrcKq0aavfCAqm7vR3uCof01Guxf163WpTrPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722037965; c=relaxed/simple;
	bh=FV9suUWbUk18QdDUsD1tv1G/hfnnbrNwbRzzjldv2AY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=O7sbIjEmXpE5cPv76ThkzGeRePfJTwPbckDZ8oAfn4ivWWSqnydK0K+9hFlsuuwqAwDpAOILMaXLcONqhQ4IqEirUwm9LFi74XNaM9KF0bLvvm7UO8eUjXCx/DlBRIvjx+SiZNnSNENVil5qKpjBLnllX5l2Yh29Ha+p+c8fxM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MJXIZqhu; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MJXIZqhu"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-70d26115cd5so1192577b3a.1
        for <loongarch@lists.linux.dev>; Fri, 26 Jul 2024 16:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722037962; x=1722642762; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=+ACqpXiHFW0htcnePdxx7jkBXYAkQBnbtzPYGP86yy4=;
        b=MJXIZqhuxpJj9JOTXgOq7tm2YEpmos1noymv2oz1uvBtAtGPUfW1shUFvO23IlQJcT
         nrsAiGgkb1ReViPpXHyXrcYi4Um7uQ6iy32TdgP4Ln1in6nDvqlJsmam1Q6maTelLYKP
         Pum8F2FR2NF+ms9ZvsBRGtJRytmRYfGmEYiyZ9U/AGRkh3rnKNoVNMW74FuO3uFVrOyR
         pTBSHoOdkGazhsOyIGOZS3MeDmoalQiTZ9C1ci/hlSs5FBzVOFdPzu7oY1WcdTzBIFsi
         6j/sRb3PNV6wuj2WVcgPe1QmXSjzk1l8WJBt6hFGeRo1GyG1vFCSh6CqTi4UxVpL41oy
         4lXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722037962; x=1722642762;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+ACqpXiHFW0htcnePdxx7jkBXYAkQBnbtzPYGP86yy4=;
        b=nHiJaERL1EP2tctynIKEKbZ67yTn+E4PzW5JjnhivF1ymLYKFa1WH7V3obEk+2MIYm
         r/Poi9D6Jo+L0EHH9I3+LxiCmI8fCa/fCDcQTJzPAt7ldFRCD5e+JWNuywY52vEJTXlY
         S+abzni1lIOQUzc4fXfa06IFULbjvD5otVvFjoXW2yrAUuWaAD8NPr6opca8dZxLhZ6y
         6ivgHfPWWz7+AFxkKumy18DG06BX+ca7QnkPangLF8LYhed4ONKiG3DQY1BSBlXwxV7A
         S3LkUxAgOde1sEXSD7OXBDGjUCii5yJec5SrMhU9io8mCEZXAyjKVa7bBnw+MfajJ4z0
         7TcQ==
X-Forwarded-Encrypted: i=1; AJvYcCUgWJzjKGPVQtDtE7sCuZrAy7ERyp0gJt1AN0rDBlvc86mldNmoFYSSS73MZr/VHND2nW8yJQwifsKajPZSt9pARDbIbpakId/Y
X-Gm-Message-State: AOJu0Yw7UTdwqJorXMiQr2V9qsQZXcQJs2lz/E3/o+66F5uR10x/B5Xo
	a+yLl6ke28jWZs/lslZYeuZPbxvK69J19zqPiLky4SQLLvikZjlL5Dc7uFXMjog1H98ZJGzxyBM
	48Q==
X-Google-Smtp-Source: AGHT+IGwCQGQqihWYa2umPunvMXl+38XfICaGVr07aRfeEr4UWXG0owvMV5oQenmn7mjdAWrLBWC2Kt2f3c=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6a00:2d5:b0:70d:1cb3:e3bb with SMTP id
 d2e1a72fcca58-70ecedee1c9mr17317b3a.5.1722037961972; Fri, 26 Jul 2024
 16:52:41 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 26 Jul 2024 16:51:11 -0700
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240726235234.228822-3-seanjc@google.com>
Subject: [PATCH v12 02/84] KVM: arm64: Disallow copying MTE to guest memory
 while KVM is dirty logging
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

Disallow copying MTE tags to guest memory while KVM is dirty logging, as
writing guest memory without marking the gfn as dirty in the memslot could
result in userspace failing to migrate the updated page.  Ideally (maybe?),
KVM would simply mark the gfn as dirty, but there is no vCPU to work with,
and presumably the only use case for copy MTE tags _to_ the guest is when
restoring state on the target.

Fixes: f0376edb1ddc ("KVM: arm64: Add ioctl to fetch/store tags in a guest")
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/arm64/kvm/guest.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/kvm/guest.c b/arch/arm64/kvm/guest.c
index e1f0ff08836a..962f985977c2 100644
--- a/arch/arm64/kvm/guest.c
+++ b/arch/arm64/kvm/guest.c
@@ -1045,6 +1045,11 @@ int kvm_vm_ioctl_mte_copy_tags(struct kvm *kvm,
 
 	mutex_lock(&kvm->slots_lock);
 
+	if (write && atomic_read(&kvm->nr_memslots_dirty_logging)) {
+		ret = -EBUSY;
+		goto out;
+	}
+
 	while (length > 0) {
 		kvm_pfn_t pfn = gfn_to_pfn_prot(kvm, gfn, write, NULL);
 		void *maddr;
-- 
2.46.0.rc1.232.g9752f9e123-goog

