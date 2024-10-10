Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CDD22185BA
	for <loongarch@lists.linux.dev>; Thu, 10 Oct 2024 18:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728584857; cv=none; b=jbKS02rGVyiDNEBuzNnFIdI2xec4LiFpeVAd18GA3k7BOdA60YLSgx6TYvIpyyURPCS/SIQ6/O44iG0v8CHtiwrJGv3apoMnmwvP0seVwPL387JHOwcluNpWyAWu3H/3vqAFmTOl09bzwi2XrVDMW9rw6gWwc7ulLIOK87t561g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728584857; c=relaxed/simple;
	bh=h3dpe04J9rq+dGEj5vV4pEUoAEcWlYwK7aXFrp+Hc5M=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=m4O7MosMVtYR9J51Jtdw6+J0FHM8FWiDzMbeyEHj8YsFnWR3lWC/lTYy8aR28L35DRG4cOEan2t8doTG6Xr01LI6zYIFoPQaqrl+fLPE30xAQsnY3/MG09fHNO4Wloy4YzxbyNsyAucdQ/2xlRfPyn8Vuoq6h6Kpp8YQmaP2iXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YAZgIMg3; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YAZgIMg3"
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-6e30fe2a9feso16560297b3.3
        for <loongarch@lists.linux.dev>; Thu, 10 Oct 2024 11:27:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584854; x=1729189654; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fQZoDf0NIFdWK0Ory3IxzF5D2dmoMJWboRGGHV/nWyI=;
        b=YAZgIMg3KT7ETR2wpFNOU6MNkj3O05imRxOqBfOELrEcd9CRjKK3d0JM57yN9wMVQd
         SwNJqn0cic3fjlspyaqAOeOuSySdRoUWikqOweCiBpJydvA1xWiFYPGiNadgAK9o3HM5
         IMeUxN4F4NKK2sFFDcoFVPzXA8X4tacvry3WW24udwZHh2EmfWf9bkxFEZ2hfWc6BnMu
         j+g+lP3H+qS6s5XHlUmL47PDmMiGlREUbJYMmfA8ViiH2rZIAUY1Terk22llQZICkg4D
         6NboKTIa1TT420jtzyAt3pEWSdoSp1bzrw9rMipsvQfxFr+RpKVaaKROZlD7MvQWuHKI
         iaLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584854; x=1729189654;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fQZoDf0NIFdWK0Ory3IxzF5D2dmoMJWboRGGHV/nWyI=;
        b=GpyHLxaZ9EjMCoeRmgMgc6wTRueFAWacM955Hma4mH3oJm7JbUSPhjnMnAxSXShh5/
         kXEMpio0ebgAghJloe2MfY92G8WAUBCrFwTzgaDxhrveUdfpWC5lIWx1t0MYN9TKZOkU
         Hb0QFHqlrn2CslrMFrhadG3Za7sEbbvLstS/9s9kRWWz17AgP2oYA62fx+oYUStTjMoE
         69VUdMXUf4rqc236WIgRHhLnI6cmo20i9lv5vMj2+s4deCRIXvyNpP4PyI4Jm7k1cp/W
         +f7946N4UuHiCBMK4Ah5KDoj9HY0o8jaYyTZi2gy3tN+xRREhGqQeoxOpUDkpq2a99DI
         I/Xw==
X-Forwarded-Encrypted: i=1; AJvYcCX3jd9D5NZshRwrbJL4/5R/XumcuiKHAbva9f0f7ojPqW5etbXl4C+89HxITIWPtt60J/dpGzI+Tfc=@lists.linux.dev
X-Gm-Message-State: AOJu0YxiGFfj5AgYH3NSpHWUB/XAqEANS+xj7DrclK+TIsLOvDZMPrPR
	MrUdwlXww3CbBQlrmPtxlS1+sOO1oG4R9ohbqO6AMC/EcZ/0AvrntQvo30wr71WLYd/hlcSwk/z
	lVQ==
X-Google-Smtp-Source: AGHT+IGkMjnJcd2oWHVLgC5xfQJb4mHLQjnUvb6XgW9ZV8VH9lzrMuhcRfl3e0TBTVqXdJBO9V/Z2ttoh2Y=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a05:690c:4091:b0:64a:e220:bfb5 with SMTP id
 00721157ae682-6e32213fbacmr192077b3.1.1728584853563; Thu, 10 Oct 2024
 11:27:33 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 10 Oct 2024 11:24:18 -0700
In-Reply-To: <20241010182427.1434605-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20241010182427.1434605-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Message-ID: <20241010182427.1434605-77-seanjc@google.com>
Subject: [PATCH v13 76/85] KVM: Add support for read-only usage of gfn_to_page()
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

Rework gfn_to_page() to support read-only accesses so that it can be used
by arm64 to get MTE tags out of guest memory.

Opportunistically rewrite the comment to be even more stern about using
gfn_to_page(), as there are very few scenarios where requiring a struct
page is actually the right thing to do (though there are such scenarios).
Add a FIXME to call out that KVM probably should be pinning pages, not
just getting pages.

Tested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 include/linux/kvm_host.h |  7 ++++++-
 virt/kvm/kvm_main.c      | 15 ++++++++-------
 2 files changed, 14 insertions(+), 8 deletions(-)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 9f7682ece4a1..af928b59b2ab 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -1213,7 +1213,12 @@ void kvm_arch_flush_shadow_memslot(struct kvm *kvm,
 int kvm_prefetch_pages(struct kvm_memory_slot *slot, gfn_t gfn,
 		       struct page **pages, int nr_pages);
=20
-struct page *gfn_to_page(struct kvm *kvm, gfn_t gfn);
+struct page *__gfn_to_page(struct kvm *kvm, gfn_t gfn, bool write);
+static inline struct page *gfn_to_page(struct kvm *kvm, gfn_t gfn)
+{
+	return __gfn_to_page(kvm, gfn, true);
+}
+
 unsigned long gfn_to_hva(struct kvm *kvm, gfn_t gfn);
 unsigned long gfn_to_hva_prot(struct kvm *kvm, gfn_t gfn, bool *writable);
 unsigned long gfn_to_hva_memslot(struct kvm_memory_slot *slot, gfn_t gfn);
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 1782242a4800..8f8b2cd01189 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -3138,25 +3138,26 @@ int kvm_prefetch_pages(struct kvm_memory_slot *slot=
, gfn_t gfn,
 EXPORT_SYMBOL_GPL(kvm_prefetch_pages);
=20
 /*
- * Do not use this helper unless you are absolutely certain the gfn _must_=
 be
- * backed by 'struct page'.  A valid example is if the backing memslot is
- * controlled by KVM.  Note, if the returned page is valid, it's refcount =
has
- * been elevated by gfn_to_pfn().
+ * Don't use this API unless you are absolutely, positively certain that K=
VM
+ * needs to get a struct page, e.g. to pin the page for firmware DMA.
+ *
+ * FIXME: Users of this API likely need to FOLL_PIN the page, not just ele=
vate
+ *	  its refcount.
  */
-struct page *gfn_to_page(struct kvm *kvm, gfn_t gfn)
+struct page *__gfn_to_page(struct kvm *kvm, gfn_t gfn, bool write)
 {
 	struct page *refcounted_page =3D NULL;
 	struct kvm_follow_pfn kfp =3D {
 		.slot =3D gfn_to_memslot(kvm, gfn),
 		.gfn =3D gfn,
-		.flags =3D FOLL_WRITE,
+		.flags =3D write ? FOLL_WRITE : 0,
 		.refcounted_page =3D &refcounted_page,
 	};
=20
 	(void)kvm_follow_pfn(&kfp);
 	return refcounted_page;
 }
-EXPORT_SYMBOL_GPL(gfn_to_page);
+EXPORT_SYMBOL_GPL(__gfn_to_page);
=20
 int __kvm_vcpu_map(struct kvm_vcpu *vcpu, gfn_t gfn, struct kvm_host_map *=
map,
 		   bool writable)
--=20
2.47.0.rc1.288.g06298d1525-goog

