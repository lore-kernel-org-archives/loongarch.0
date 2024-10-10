Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0FA81F708A
	for <loongarch@lists.linux.dev>; Thu, 10 Oct 2024 18:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728584739; cv=none; b=GS7RY8cc/599HEiJ63F8rk4qZmLT/eB6deIEGKZebFMyNLR/byLMtnDpsKSCTS+rIpNaYlHh6esUCVvh1zNA7nozaQKi3L/PP4dQLeLsHIcA1+fiB8JQb0gwzosFsS65ARq36+5T7o5CNb7yP6ec6rb6YIRG/fuuaXnwSy7yprQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728584739; c=relaxed/simple;
	bh=w6CtoHT4iiBJ8oKluaibldhSnM94wRba+mvcEkROyJo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=liPoGHhPf0hAr1yR8rrDIuu5MDNOpTLJe9qZz5C5oq0TGj6Nyd/R8G89XLNfVT2r9RPJH9BEbhpp4qek5BwDjyPQ4k1eID5hSbqWqXeVZ8fAtzc3ibk3vUhYst1Nhi7GE+fDTSOkxD4pLlh3tib2tNXW54Fo0hItfit3Ki2Gcws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ftxPXolH; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ftxPXolH"
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-6e23ee3110fso21883497b3.1
        for <loongarch@lists.linux.dev>; Thu, 10 Oct 2024 11:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584737; x=1729189537; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IMgO/JDFhWAWu7Wkr7+zBWYfApHhI977J8rKw7ML51Y=;
        b=ftxPXolHekXNPINkjnGwW7SSKTd06vH3d9+JqMdMzm99M9gJxa2qsP+BiEnYXv1cKz
         0s34XZMXDUkwq7txg2HgTWQGQxUp0X64aVIoJyFsbSXdpPb2YChC8bgQFP6AIcn6+HT2
         zlCgQ1mM0csy2UEs9xeItlO+cV5KT6dYMkVOMhzIzvO0ovI/BR0uRfMwR6On9GSfFm+P
         CGqYPbrWfRKS6C/qcg4QcBf3KmvoOV4Yhip72wpFQG3b8ieeVTiqi/GzhnO7Pu8vfMP3
         Aij/hfgeDBnmGCSiqNubu8c8Eqbw1okmTDa7loQHP+rTdbgvYNeaCwdOzkwstDlLvyBi
         cstg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584737; x=1729189537;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IMgO/JDFhWAWu7Wkr7+zBWYfApHhI977J8rKw7ML51Y=;
        b=JpiLeOjV4e3hTTW0AltvdRnRwrDMOS9enRuvIhN4GM/4sG6ruyQgXoSg2rRjmKLlXi
         4sYGAVY8LKik2OxOU5ND8zPcuqCOmKm60/am5UsUVnjEB2JI7BstLsQFo37kkN9yAPdN
         FH4kYP9NT6nlbFcUxp65l5Xd4YXRU/PGEhNrCPCrwVFN7TQ0njg2fQV2LGDK8XJvOCcs
         gdTEJ6krYpDVh/uM+ttnedF2N2gpZeIzEAu01zxi6Io8xRe8H/bH0m5zyfgBvL24B901
         d7y05anqyeOVaRa7gi3wIDaSXwUmCdsnjhvIeoMHzIKhE3ap7gutVR6fejo6RFdQv5km
         CCXw==
X-Forwarded-Encrypted: i=1; AJvYcCW2nXvsdoL/CKVQOWHIx0bf2JBR5PKcjpwe7rYtRu51DY4Ry1xDYmalnRQIBDBOu4uu/TaSF+Xp0p4=@lists.linux.dev
X-Gm-Message-State: AOJu0YzcTJpG0pePXaZGr8TKoUiychGKzADTKPfYhUDWBLg7SQc3jEUw
	o7EFyBulIx0D7hqZhOZCa86kmYB8x+QgqJ9XhPFygB8koy7Yv6r306D3b1Pwaz4OQUa8We8Q54a
	ACQ==
X-Google-Smtp-Source: AGHT+IGlSN4X6DbrP5DPPe6+MPgoNlxMoOT3GZzpJV2jr+xnXsAJlzTjTlsnBYkwN+CsyuU9UJbLGW89hxk=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a25:c70a:0:b0:e28:eae7:f84a with SMTP id
 3f1490d57ef6-e28fe0feaecmr5507276.0.1728584736880; Thu, 10 Oct 2024 11:25:36
 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 10 Oct 2024 11:23:23 -0700
In-Reply-To: <20241010182427.1434605-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20241010182427.1434605-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Message-ID: <20241010182427.1434605-22-seanjc@google.com>
Subject: [PATCH v13 21/85] KVM: Explicitly initialize all fields at the start
 of kvm_vcpu_map()
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

Explicitly initialize the entire kvm_host_map structure when mapping a
pfn, as some callers declare their struct on the stack, i.e. don't
zero-initialize the struct, which makes the map->hva in kvm_vcpu_unmap()
*very* suspect.

Tested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 virt/kvm/kvm_main.c | 40 ++++++++++++++++------------------------
 1 file changed, 16 insertions(+), 24 deletions(-)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index c7691bc40389..f1c9a781315c 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -3067,32 +3067,24 @@ void kvm_release_pfn(kvm_pfn_t pfn, bool dirty)
=20
 int kvm_vcpu_map(struct kvm_vcpu *vcpu, gfn_t gfn, struct kvm_host_map *ma=
p)
 {
-	kvm_pfn_t pfn;
-	void *hva =3D NULL;
-	struct page *page =3D KVM_UNMAPPED_PAGE;
-
-	pfn =3D gfn_to_pfn(vcpu->kvm, gfn);
-	if (is_error_noslot_pfn(pfn))
-		return -EINVAL;
-
-	if (pfn_valid(pfn)) {
-		page =3D pfn_to_page(pfn);
-		hva =3D kmap(page);
-#ifdef CONFIG_HAS_IOMEM
-	} else {
-		hva =3D memremap(pfn_to_hpa(pfn), PAGE_SIZE, MEMREMAP_WB);
-#endif
-	}
-
-	if (!hva)
-		return -EFAULT;
-
-	map->page =3D page;
-	map->hva =3D hva;
-	map->pfn =3D pfn;
+	map->page =3D KVM_UNMAPPED_PAGE;
+	map->hva =3D NULL;
 	map->gfn =3D gfn;
=20
-	return 0;
+	map->pfn =3D gfn_to_pfn(vcpu->kvm, gfn);
+	if (is_error_noslot_pfn(map->pfn))
+		return -EINVAL;
+
+	if (pfn_valid(map->pfn)) {
+		map->page =3D pfn_to_page(map->pfn);
+		map->hva =3D kmap(map->page);
+#ifdef CONFIG_HAS_IOMEM
+	} else {
+		map->hva =3D memremap(pfn_to_hpa(map->pfn), PAGE_SIZE, MEMREMAP_WB);
+#endif
+	}
+
+	return map->hva ? 0 : -EFAULT;
 }
 EXPORT_SYMBOL_GPL(kvm_vcpu_map);
=20
--=20
2.47.0.rc1.288.g06298d1525-goog

