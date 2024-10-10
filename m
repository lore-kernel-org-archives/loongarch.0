Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD12B1E573A
	for <loongarch@lists.linux.dev>; Thu, 10 Oct 2024 18:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728584860; cv=none; b=ATQBCxXXQAG0JDYvI7WWGjHUfXe+x1spIkx/kPStY0lQ6Hyil7tyVKKqzJA1eRPdwcx3EQDrpi+Zug4D6VYt4oqimC8n+tDUt9zXVqvjbkrueuNA5VROWiMkQxQ1cT0XTAF2ExLbt/EfdLxODjP2bjaDBkoA++ajJfQb75UUnZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728584860; c=relaxed/simple;
	bh=WU2bYG9iOpd2mUwv0Kp3QHVdfdxFDeft8vY+L5Knm2Q=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=uGqJmrcRUknU1k66/+3iopImUChGAK5vtYCYl1aFqkr4z6SwRy1QwIIaliUwn0h851YSAHPHQR6/2gf0Qigi0m9TipuBCkgPiqmO0VltnfAsfYTRvT5ch0vQQKuDMFVtj66SBorVi/BE49YeZRHSvWL6cQiN4xBYDPlFw/ChIOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=2nw620B0; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="2nw620B0"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-778702b9f8fso1040815a12.1
        for <loongarch@lists.linux.dev>; Thu, 10 Oct 2024 11:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584858; x=1729189658; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=43Dd+lWRPu/QQcFLGDLhCyyiH7uAqu5vbmltTcj5okg=;
        b=2nw620B0iObQ+wthcTKLvqJ8Gu0lha/FTo9zYH108B7eyV5d3i4ARkttuTTlDkteOi
         xYwAyeWCPaOJAKiTJCwO6oi0mgsPW/czQr3NkgE2V3u978l3u5c4LpoNirczvHZ8sfEO
         rc5zkIX4oElO2TtkJugxoRrQPQuR2OQmNS+w8Gir8SbS7Rp5aRp0Dd56tJ0fnhlIfGE9
         3bgURH94EKYZMXeu3H5vj52L7Ya20Xi4iseIoeuMkVknVBYZpPCG3TjoCu/Tz7iOYpgd
         Q5m+d8JyMDVQ2mXkiU8zra8Or2G8JSu0jAmfSlqsh6lxaUYMB3eEd/dEVsOGWg7Mc8ZQ
         cUBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584858; x=1729189658;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=43Dd+lWRPu/QQcFLGDLhCyyiH7uAqu5vbmltTcj5okg=;
        b=axetIp3Gk0r5/s2u4RTKu/ZJx3Dg5/ZZ+hiz7OXRZljgS0811N1ZbWag9aMsUgMJbA
         E8NCH96kcs5c6AFr0q5eADLg8ssCAhPcy3yduFBIMx9hd2hRwWzdy5w9NYZCoxV185/T
         ZRb68/zrY8H9aMK6zaWoujVKqQ2GQNkjg9kYDVeDQTcZcpsZ9RO9IxaDdxHSFk0jz5PG
         YXYHCXp3Z/kerICgvjnEVMmH1WAYX3l8t25z6FFkc+7pvjIxozpm61+XaXWUIe0tRs+v
         UnVBcgT0ZW5Uk8+XeLLiUeBHtBX+uU2DGKCN6prMYiRSI8hyQ+E4T0GPaBP6SGGQDegp
         jKHg==
X-Forwarded-Encrypted: i=1; AJvYcCWobDqq5vAASIRSAQQy4s1LhVtel9izWfT9XYIBK3nd68XEN/umDw+CVjgKAWYr6CqgNEkoCSUiBhA=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy7bw74E/mismaItMuTYL4mptmfvUXpPTWkhdW8ztINJoiBM2Xr
	S3FcbMzl714V2+kvhlImx4PSBLBT5PNMu/h7fZyuwc9oT5VmEezAaMg6IwXaSnfW1l5ZCq4RlJh
	cYQ==
X-Google-Smtp-Source: AGHT+IGjs5y0lK7jvR8/zbNWJNDHfDWRUWSPa98vwOnU2bZ6sNQJgoH/6j7HDiYxyC+lHu033MhghQMujcY=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a63:b208:0:b0:7e6:c3f2:24c2 with SMTP id
 41be03b00d2f7-7ea535dce6cmr30a12.6.1728584857741; Thu, 10 Oct 2024 11:27:37
 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 10 Oct 2024 11:24:20 -0700
In-Reply-To: <20241010182427.1434605-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20241010182427.1434605-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Message-ID: <20241010182427.1434605-79-seanjc@google.com>
Subject: [PATCH v13 78/85] KVM: PPC: Explicitly require struct page memory for
 Ultravisor sharing
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

Explicitly require "struct page" memory when sharing memory between
guest and host via an Ultravisor.  Given the number of pfn_to_page()
calls in the code, it's safe to assume that KVM already requires that the
pfn returned by gfn_to_pfn() is backed by struct page, i.e. this is
likely a bug fix, not a reduction in KVM capabilities.

Switching to gfn_to_page() will eventually allow removing gfn_to_pfn()
and kvm_pfn_to_refcounted_page().

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/powerpc/kvm/book3s_hv_uvmem.c | 25 ++++++++++++-------------
 1 file changed, 12 insertions(+), 13 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv_uvmem.c b/arch/powerpc/kvm/book3s_hv_uvmem.c
index 92f33115144b..3a6592a31a10 100644
--- a/arch/powerpc/kvm/book3s_hv_uvmem.c
+++ b/arch/powerpc/kvm/book3s_hv_uvmem.c
@@ -879,9 +879,8 @@ static unsigned long kvmppc_share_page(struct kvm *kvm, unsigned long gpa,
 {
 
 	int ret = H_PARAMETER;
-	struct page *uvmem_page;
+	struct page *page, *uvmem_page;
 	struct kvmppc_uvmem_page_pvt *pvt;
-	unsigned long pfn;
 	unsigned long gfn = gpa >> page_shift;
 	int srcu_idx;
 	unsigned long uvmem_pfn;
@@ -901,8 +900,8 @@ static unsigned long kvmppc_share_page(struct kvm *kvm, unsigned long gpa,
 
 retry:
 	mutex_unlock(&kvm->arch.uvmem_lock);
-	pfn = gfn_to_pfn(kvm, gfn);
-	if (is_error_noslot_pfn(pfn))
+	page = gfn_to_page(kvm, gfn);
+	if (!page)
 		goto out;
 
 	mutex_lock(&kvm->arch.uvmem_lock);
@@ -911,16 +910,16 @@ static unsigned long kvmppc_share_page(struct kvm *kvm, unsigned long gpa,
 		pvt = uvmem_page->zone_device_data;
 		pvt->skip_page_out = true;
 		pvt->remove_gfn = false; /* it continues to be a valid GFN */
-		kvm_release_pfn_clean(pfn);
+		kvm_release_page_unused(page);
 		goto retry;
 	}
 
-	if (!uv_page_in(kvm->arch.lpid, pfn << page_shift, gpa, 0,
+	if (!uv_page_in(kvm->arch.lpid, page_to_pfn(page) << page_shift, gpa, 0,
 				page_shift)) {
 		kvmppc_gfn_shared(gfn, kvm);
 		ret = H_SUCCESS;
 	}
-	kvm_release_pfn_clean(pfn);
+	kvm_release_page_clean(page);
 	mutex_unlock(&kvm->arch.uvmem_lock);
 out:
 	srcu_read_unlock(&kvm->srcu, srcu_idx);
@@ -1083,21 +1082,21 @@ kvmppc_h_svm_page_out(struct kvm *kvm, unsigned long gpa,
 
 int kvmppc_send_page_to_uv(struct kvm *kvm, unsigned long gfn)
 {
-	unsigned long pfn;
+	struct page *page;
 	int ret = U_SUCCESS;
 
-	pfn = gfn_to_pfn(kvm, gfn);
-	if (is_error_noslot_pfn(pfn))
+	page = gfn_to_page(kvm, gfn);
+	if (!page)
 		return -EFAULT;
 
 	mutex_lock(&kvm->arch.uvmem_lock);
 	if (kvmppc_gfn_is_uvmem_pfn(gfn, kvm, NULL))
 		goto out;
 
-	ret = uv_page_in(kvm->arch.lpid, pfn << PAGE_SHIFT, gfn << PAGE_SHIFT,
-			 0, PAGE_SHIFT);
+	ret = uv_page_in(kvm->arch.lpid, page_to_pfn(page) << PAGE_SHIFT,
+			 gfn << PAGE_SHIFT, 0, PAGE_SHIFT);
 out:
-	kvm_release_pfn_clean(pfn);
+	kvm_release_page_clean(page);
 	mutex_unlock(&kvm->arch.uvmem_lock);
 	return (ret == U_SUCCESS) ? RESUME_GUEST : -EFAULT;
 }
-- 
2.47.0.rc1.288.g06298d1525-goog

