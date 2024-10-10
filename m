Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F091D20823B
	for <loongarch@lists.linux.dev>; Thu, 10 Oct 2024 18:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728584816; cv=none; b=n0ozDs2wQe1VpG73to7d6ubZgx6Mgj9H2jwJ2E/5lZBfdiDk0plxSYNeY63puWwMgppqrmgEbAwf4kHDQGXsiutGDHLRsp263b6XUyrKBb+cNOZEvkT6d0K7szYmtO/ABNkkeIqj4eclS8tvT3dfjrBbKR/FNJ4ZNufnKLbb8fM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728584816; c=relaxed/simple;
	bh=tUWxw/XFi5Jjw4MLGoQx4yzkrGK2c3j8OG0Ux9/pXvk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=YSEZQ3TeJUwhlIk89XYp1FnJ+Yv7obOqEhsShzO1A1KA/I6kphGcxSLN1SySVHxfUzXCfM1UteHzPgshqNL4IhwM/PuvSausmVpF8gL2H690xbP8jv5KBrfiP9h34Mu5Z25BG3711/EKSqLKwMIYzOkjbwK5kx9DHUpXYzZ0Msw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Xno7LoFA; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Xno7LoFA"
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-6e2e4874925so21257157b3.1
        for <loongarch@lists.linux.dev>; Thu, 10 Oct 2024 11:26:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584814; x=1729189614; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=9PLNR7J7/StxhsadOj2FvapRbIqIfrDfQ6nFmhEUvk8=;
        b=Xno7LoFAh3nM4XUMx7Ta9TmdfZf0rO+kbt4WvFQD7HTO3ReKHI62l53hFFy8NuGWFs
         VEWZTy47S4+gKeWu9H7R+d7f1wNn1K5DtrsOfW1I+KEXVml+2j/gPuARUHYK9ImqC6oc
         hkBU8m09PesYvGJnto/SdYEw+pAvs/QJXjlcoKcZ08IHaXtsZdGfRWiDn9XRTW37qJEN
         Gz2Addar7TXCeE8w4exFdkbhtrxT0ZPlaYPgpx1j+LtsNpVhtn2kVmfN3u+NKxtwarxM
         akU7Dab4i1kqK04ZlEYCQFzbhVk2R32uIOoeuKi8nK3zm9GuXjsylDNseKPU8ggh0Dnd
         J8nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584814; x=1729189614;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9PLNR7J7/StxhsadOj2FvapRbIqIfrDfQ6nFmhEUvk8=;
        b=a7yZ8m7S8ytHYjkGbArBShEyID/y7znF3AJTzkzh1e0Tn8a/lcH6LjTRxep6e5xpH3
         jLszG/UA5oqdCBxbYIlbEjCopsmFYs78w6k25gINXDsvs+niKrywdWDQ5tohSe0zIiCu
         vjAAGI1REPEll0wkYEIwa5RdUwLlTcaOg/rN37jjVfFU3FM4zb51H7S959XsO4CIiip6
         4LA56v5MHnSGo/OUUPEdIP46PCFiakV0Jxx1PAQfy/Ukj3KAWua6RSUDL3ozNpObsEkJ
         i7cDh4XA3VBAm2eD6Et/yjnNu3XO6MtgwmOEDFBnY28ytg9u390zqEEFuACInes5YMCF
         GF9Q==
X-Forwarded-Encrypted: i=1; AJvYcCVTnt1WQpY4rXd8+o2vzbg55ROoXpXmFOlcRCmo9aQs3WYAD2wRzuwYNNqSLlsnYjCwB9WEjPV7ocg=@lists.linux.dev
X-Gm-Message-State: AOJu0YwbfzDpPkJOwY9NDnWmY4aI2qC1TOcaNQjajiI5XcD3E9WmEoBd
	wMHbLOuVxztE28kWP8ADU0mmfIj9qlkJ/1jhsMGOop5aH5EIbJF81wZNZPkWY+FcMKXlYUXa4G6
	5PQ==
X-Google-Smtp-Source: AGHT+IFTz5/NgoL1lG2XSkf5pquU6CJl4M8l3x57mh4U7FbzzS84rW+oHIk+OXb87gKu92fZB4cgNqwOitE=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a05:690c:46c3:b0:6e3:21cf:a67f with SMTP id
 00721157ae682-6e32242fb5emr1006557b3.7.1728584814138; Thu, 10 Oct 2024
 11:26:54 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 10 Oct 2024 11:23:59 -0700
In-Reply-To: <20241010182427.1434605-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20241010182427.1434605-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Message-ID: <20241010182427.1434605-58-seanjc@google.com>
Subject: [PATCH v13 57/85] KVM: RISC-V: Mark "struct page" pfns dirty iff a
 stage-2 PTE is installed
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

Don't mark pages dirty if KVM bails from the page fault handler without
installing a stage-2 mapping, i.e. if the page is guaranteed to not be
written by the guest.

In addition to being a (very) minor fix, this paves the way for converting
RISC-V to use kvm_release_faultin_page().

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Acked-by: Anup Patel <anup@brainfault.org>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/riscv/kvm/mmu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
index b63650f9b966..06aa5a0d056d 100644
--- a/arch/riscv/kvm/mmu.c
+++ b/arch/riscv/kvm/mmu.c
@@ -669,7 +669,6 @@ int kvm_riscv_gstage_map(struct kvm_vcpu *vcpu,
 		goto out_unlock;
 
 	if (writable) {
-		kvm_set_pfn_dirty(hfn);
 		mark_page_dirty(kvm, gfn);
 		ret = gstage_map_page(kvm, pcache, gpa, hfn << PAGE_SHIFT,
 				      vma_pagesize, false, true);
@@ -682,6 +681,9 @@ int kvm_riscv_gstage_map(struct kvm_vcpu *vcpu,
 		kvm_err("Failed to map in G-stage\n");
 
 out_unlock:
+	if ((!ret || ret == -EEXIST) && writable)
+		kvm_set_pfn_dirty(hfn);
+
 	spin_unlock(&kvm->mmu_lock);
 	kvm_set_pfn_accessed(hfn);
 	kvm_release_pfn_clean(hfn);
-- 
2.47.0.rc1.288.g06298d1525-goog

