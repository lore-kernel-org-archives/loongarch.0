Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CDE21CF7C3
	for <loongarch@lists.linux.dev>; Thu, 10 Oct 2024 18:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728584753; cv=none; b=VgqSlx5fq1Sm/uD4lZG9yCmgYayCulpEWmETmEaHQp4ht4Lq9HGBAZuQ5Rq9kP9bJ5p+u0RqmzpKhpzq0q+HBkExc9wBVZ0EIU75BPVHt4BQl5kzxkYQUaTSwmKNeTussQq31MJEBqnajGyEr4NUnvVrdkWRdX74IgsvPCgR6ww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728584753; c=relaxed/simple;
	bh=CmHVeWZ83J0EQfDqM5RvAa04rCEwL0d1DQJqfJodvCg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=g1tpmmO6DCucNtnSwdJJiWBKZPNFunZ6T3Nm1noOhd52aYmA3tXkWWW44TLwnJPLwdjkP3wDenCHMjUdO/EmcYZZwcGGVUVEarTz3HpJYUbPZ9oYBu+8EV4CvWRP7wiH8kuBAQQG3hyqcvV85PNagqtk9wxOhXEzg5S/z/AObnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=N/e3zRVY; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="N/e3zRVY"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-5e4df21f22dso1172631a12.0
        for <loongarch@lists.linux.dev>; Thu, 10 Oct 2024 11:25:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584751; x=1729189551; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MotdKZcknVHCSnrsAh1XZemF3Qz2FYV2KdHfEEknv98=;
        b=N/e3zRVYKbBnNQ8UBPqVbf+MdN8/EruHDT3hmVUsbei9yORtlkIRU2LzVReT+/Ako8
         bWeWIwKo4acaGb9D0tKzxn9n7+rtDITbQXu2KblCnocGpDVouBC/AufRvCNN4X1xBIEv
         RbXunhIlIoK/8uoJ+JqzkbDi4JDiSPx7r1U1jqzDxq2ZRYCpB+cPh+1SMXy+y8a4RRpQ
         YZ4WfMaPMzI+4gSdJJUfILL2CmnOvenRJdVW/0lvI5Az6UAqfpH+c3Gi2SZF+656t27A
         79H5M8IajLnEo2gVa7hgVhTLUlSMfOqExZjJ41tcR/rXwVNt1UTVGurUyYBKXJ7hETdl
         cAXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584751; x=1729189551;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MotdKZcknVHCSnrsAh1XZemF3Qz2FYV2KdHfEEknv98=;
        b=vY6BkdI/g8Z8jFrq8ed+qVSvFwixP8URBUFVS5+EcCZG7sGih1Yk7Pzu2/VjT5SOKS
         kdrSJvNFtJwuZQV/B/WPs6bS6EuYrQ73/ZprSzDsIfBMR4+nuHdi5ht5h1pd/UrOG/Cn
         sr2ygqJLTmn4GAHXQ9DvwabXSC6GKdLvAiyWzphKRjQtvauYUiZV0q8mhenTO0dnndIE
         w/KEOc3CSYD4TICyrAROzbBfP0fK+n6Zs/YmQ1GRlP5y7L8IVDJAPyXpOBtLV0MmadMa
         f6Xt9YsnxndOwuiVl8M3AakPei6zd5mXUdfUE78BWunETZ6sMgUu414kpB5MvE+WRklG
         CjSQ==
X-Forwarded-Encrypted: i=1; AJvYcCVuEYK/KzVFCBgLN9kOQHwXzj6LIlWvH7bplBrLNRGSZeNvHmEXMKFvG8dEm3XbevIHKDGUk3pxWeA=@lists.linux.dev
X-Gm-Message-State: AOJu0YyxgRVOsnt+dK/zekWDXeQNbZdhq8XBJpLxRa791yrnp4DoMNyz
	7jgOcOBHKccZ0V6ifA+UsAF5fmqOjdriFLDkjZNoPkU8/Pa89QLk3rcOJyUW51oLMQS6w6K7Pkn
	1tw==
X-Google-Smtp-Source: AGHT+IHahb+vMbBUybe9JXpaiwYyoag4sz2flsLCX6vY5d7t+wo3V9TaPVQYV32tHeuijXZHqATezWyezMk=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a17:90a:d913:b0:2e2:a810:c3e4 with SMTP id
 98e67ed59e1d1-2e2c81d4d19mr7321a91.4.1728584751203; Thu, 10 Oct 2024 11:25:51
 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 10 Oct 2024 11:23:30 -0700
In-Reply-To: <20241010182427.1434605-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20241010182427.1434605-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Message-ID: <20241010182427.1434605-29-seanjc@google.com>
Subject: [PATCH v13 28/85] KVM: Move kvm_{set,release}_page_{clean,dirty}()
 helpers up in kvm_main.c
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

Hoist the kvm_{set,release}_page_{clean,dirty}() APIs further up in
kvm_main.c so that they can be used by the kvm_follow_pfn family of APIs.

No functional change intended.

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Tested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 virt/kvm/kvm_main.c | 82 ++++++++++++++++++++++-----------------------
 1 file changed, 41 insertions(+), 41 deletions(-)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index e29f78ed6f48..6cdbd0516d58 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -2746,6 +2746,47 @@ unsigned long kvm_vcpu_gfn_to_hva_prot(struct kvm_vc=
pu *vcpu, gfn_t gfn, bool *w
 	return gfn_to_hva_memslot_prot(slot, gfn, writable);
 }
=20
+static bool kvm_is_ad_tracked_page(struct page *page)
+{
+	/*
+	 * Per page-flags.h, pages tagged PG_reserved "should in general not be
+	 * touched (e.g. set dirty) except by its owner".
+	 */
+	return !PageReserved(page);
+}
+
+static void kvm_set_page_dirty(struct page *page)
+{
+	if (kvm_is_ad_tracked_page(page))
+		SetPageDirty(page);
+}
+
+static void kvm_set_page_accessed(struct page *page)
+{
+	if (kvm_is_ad_tracked_page(page))
+		mark_page_accessed(page);
+}
+
+void kvm_release_page_clean(struct page *page)
+{
+	if (!page)
+		return;
+
+	kvm_set_page_accessed(page);
+	put_page(page);
+}
+EXPORT_SYMBOL_GPL(kvm_release_page_clean);
+
+void kvm_release_page_dirty(struct page *page)
+{
+	if (!page)
+		return;
+
+	kvm_set_page_dirty(page);
+	kvm_release_page_clean(page);
+}
+EXPORT_SYMBOL_GPL(kvm_release_page_dirty);
+
 static kvm_pfn_t kvm_resolve_pfn(struct kvm_follow_pfn *kfp, struct page *=
page,
 				 struct follow_pfnmap_args *map, bool writable)
 {
@@ -3105,37 +3146,6 @@ void kvm_vcpu_unmap(struct kvm_vcpu *vcpu, struct kv=
m_host_map *map, bool dirty)
 }
 EXPORT_SYMBOL_GPL(kvm_vcpu_unmap);
=20
-static bool kvm_is_ad_tracked_page(struct page *page)
-{
-	/*
-	 * Per page-flags.h, pages tagged PG_reserved "should in general not be
-	 * touched (e.g. set dirty) except by its owner".
-	 */
-	return !PageReserved(page);
-}
-
-static void kvm_set_page_dirty(struct page *page)
-{
-	if (kvm_is_ad_tracked_page(page))
-		SetPageDirty(page);
-}
-
-static void kvm_set_page_accessed(struct page *page)
-{
-	if (kvm_is_ad_tracked_page(page))
-		mark_page_accessed(page);
-}
-
-void kvm_release_page_clean(struct page *page)
-{
-	if (!page)
-		return;
-
-	kvm_set_page_accessed(page);
-	put_page(page);
-}
-EXPORT_SYMBOL_GPL(kvm_release_page_clean);
-
 void kvm_release_pfn_clean(kvm_pfn_t pfn)
 {
 	struct page *page;
@@ -3151,16 +3161,6 @@ void kvm_release_pfn_clean(kvm_pfn_t pfn)
 }
 EXPORT_SYMBOL_GPL(kvm_release_pfn_clean);
=20
-void kvm_release_page_dirty(struct page *page)
-{
-	if (!page)
-		return;
-
-	kvm_set_page_dirty(page);
-	kvm_release_page_clean(page);
-}
-EXPORT_SYMBOL_GPL(kvm_release_page_dirty);
-
 void kvm_release_pfn_dirty(kvm_pfn_t pfn)
 {
 	struct page *page;
--=20
2.47.0.rc1.288.g06298d1525-goog

