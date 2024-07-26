Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25B5217D890
	for <loongarch@lists.linux.dev>; Fri, 26 Jul 2024 23:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722038013; cv=none; b=Xr6bCMCYBdwFqB4GfDh39aSe1M3ujmIESkXK7bcDiSP7wyjL137Tgd2s/NsKAk69lUsV2YZKOrgYmdsM04W5wfl8pXMVCC6LM4Mh2SzgumMjYV3CvmNe2iUmXQDcJTZcY3nPjfBariL4VVPk6rPNCOOiIjbvIjBFRBgiSw8dv+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722038013; c=relaxed/simple;
	bh=28S7/fmm9eTt7XEt9AeUCWuLsWPEg2sRA2JAT+HddFY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=uSSQVF8e75E2Ft/sKyB7s1wzahxwL9YhY1UFdOkLdIAhedEGXD7ZQEcsu+u7iHpQ7RJvj/Qb3lpnhh4wSU4BBzcE2d+PwvBTAzMya2bgLK1YzgE2+R+FSWZ6iJfquvDj/tz8PNuukZzlX1+0q/yndpMXRDVy1V3iQH+0z9Sg2hA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LnlpCQ9H; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LnlpCQ9H"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-2cb639aa911so1507864a91.3
        for <loongarch@lists.linux.dev>; Fri, 26 Jul 2024 16:53:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722038011; x=1722642811; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=R2I4/1amdIANY6ZAXPe7SG9ch9BlLbSqRy3xqYz3ZKo=;
        b=LnlpCQ9HiOB1Rheul4X9BeD1b02akIiQWZI5nwTJwfo4YaXLFTbzDspedbmYg3fDCp
         aGfvlGKXYAMQQ5CQ//nqLWnIHhU9SwQyzWYy5pVEkzt6pTGXBd6L7dElIVXJN4lnv5Xu
         2B/iTab5wicgKhVv4mAp7ljkMGbmwVItzLdjyOQXn7thYAsdQyfbGcT/yDA+7aCLpuPx
         36ruRclVNZ+iBxy42g0oXoWU/xw7nPEmlMYl6QZB54z3Lx9wD1FexigomRt7xPVpzWrD
         b3ywGXCp2Amj76f6w/olArNKYCexXTwJXZgr0zUUmgp7E1tj1oySYXRRZvu8SybX2HYp
         J52Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722038011; x=1722642811;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R2I4/1amdIANY6ZAXPe7SG9ch9BlLbSqRy3xqYz3ZKo=;
        b=eb8U/93tN9niCl21qZ8MYjBgmgTna7DOo2Rtss1KCAwndbjs1fHGsi4YoGdRk1nNPw
         zNayyg8ZNzmKaUW78RCNcMSA7t15nIsNyThe+kg4d3K7vByK3P2/PjUP0vBlk2vxkFiZ
         bX5p+pLDNALIWFqqTKF6f9TOn16xMu5GRhpYiJcHS67JF7KMP1plj0spAlzYLg288+3m
         teDWsBiRS9HXw4zd1t8rh9lBFsMXbKrPJRQSkUyCkGKiHwRdefMNCUvLAVyMYgPapagE
         phT1FolrufMmyeDKVzsuHGA4hWGFnajZFYR/McXEWyrz2CX1vPMEqnumPGG/XXsW6mp0
         JU8w==
X-Forwarded-Encrypted: i=1; AJvYcCWyXWTAnV3eSwijXYqTgFYGR0IWLvkL6IOiE6myaLCzXNmT1ox8jeyY2c5wjyjLal5XGV/d6bD4e1F7nICDog5xacNpSLGfoZAf
X-Gm-Message-State: AOJu0YxIBi2lPdvtTS1tOCX1m1xZ8jeQqwRTUPFzwkwbXny7v4PLWjN7
	MHMXXW5A7SZXcPi5BkPjqTtHMZF3FL+zfuqfZhArTgzEVGdizs/IjjZlRAxc8gAUpsRSOTvchVd
	EHg==
X-Google-Smtp-Source: AGHT+IHKOaCbBS38DB3+XV8s1t7JOWc+aANKzUQK49zxzSlWFwYOsfXU8rtGTN4QUDwCdEEeB4LXs+kD0Xc=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:90a:890d:b0:2c8:637:7390 with SMTP id
 98e67ed59e1d1-2cf7e97d380mr2244a91.6.1722038011380; Fri, 26 Jul 2024 16:53:31
 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 26 Jul 2024 16:51:35 -0700
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240726235234.228822-27-seanjc@google.com>
Subject: [PATCH v12 26/84] KVM: Move kvm_{set,release}_page_{clean,dirty}()
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
	David Matlack <dmatlack@google.com>, David Stevens <stevensd@chromium.org>
Content-Type: text/plain; charset="UTF-8"

Hoist the kvm_{set,release}_page_{clean,dirty}() APIs further up in
kvm_main.c so that they can be used by the kvm_follow_pfn family of APIs.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 virt/kvm/kvm_main.c | 82 ++++++++++++++++++++++-----------------------
 1 file changed, 41 insertions(+), 41 deletions(-)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 31570c5627e3..48b626f1b5f3 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -2748,6 +2748,47 @@ unsigned long kvm_vcpu_gfn_to_hva_prot(struct kvm_vcpu *vcpu, gfn_t gfn, bool *w
 	return gfn_to_hva_memslot_prot(slot, gfn, writable);
 }
 
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
 static inline int check_user_page_hwpoison(unsigned long addr)
 {
 	int rc, flags = FOLL_HWPOISON | FOLL_WRITE;
@@ -3125,37 +3166,6 @@ void kvm_vcpu_unmap(struct kvm_vcpu *vcpu, struct kvm_host_map *map, bool dirty)
 }
 EXPORT_SYMBOL_GPL(kvm_vcpu_unmap);
 
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
@@ -3171,16 +3181,6 @@ void kvm_release_pfn_clean(kvm_pfn_t pfn)
 }
 EXPORT_SYMBOL_GPL(kvm_release_pfn_clean);
 
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
-- 
2.46.0.rc1.232.g9752f9e123-goog

