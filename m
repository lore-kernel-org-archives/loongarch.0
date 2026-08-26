Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70CF0392C2A
	for <loongarch@lists.linux.dev>; Wed, 26 Aug 2026 23:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787785519; cv=none; b=L3Pm3GIVq77Zli/6zG4zx2k4re2had8wLGImliFjXI+MBnYwFfoEk/C6LXEtxpHassMI9TYaa8Hwhzj0NrUt1Xhxipy1TyosXtPNuptQfQdbMp0VtpnHlEN2AkLpDDXcP4OhIjSaF443GMhzQoPBDo7NsSSgJWRwWIbht+9JeoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787785519; c=relaxed/simple;
	bh=RtpwpC4+8FlGBnxPYsA9ZpkBEAbkRAXGvd07qy2rIzg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=lfFer2TPP5WOegK3UrF0zHRPQ8gbG0Ck6sDreiTd+J7E2zEYva/mlQS3amjzF6UccFDZZEpTEeR/mOjxK8TwI9k7jVDT6Etcff4Zyazs2rvHGTgtrPZQ4BeQmz4sysplQuDFWctinthfGOpEOoWGSv0NhS3l5zFOwCkNfbHPtDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=K2OuoO6m; arc=none smtp.client-ip=209.85.215.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="K2OuoO6m"
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc1c057f480so1472131a12.0
        for <loongarch@lists.linux.dev>; Wed, 26 Aug 2026 16:05:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787785517; x=1788390317; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=94pyTmilRwp00Qy5PlO0fIgUZFKJ9TnrjxcqGpSFO84=;
        b=K2OuoO6mBjMS2d0Wlhf9UPpWFBnEU3PBQIMPRjX8r9InZ0tTMQrgUP5YISSQewxH5o
         jvJUqFNqcTNHgeb6QIdRNBTUCmh5CvPnijdzL+fMtIbohKegSUv/YI1mw3AFRkmVpiFF
         A3JsLsJA0nxYlNW6zIILmy5R5Zi499mxO0xQIc5tQFGQPIdQ030xhTfDUn7NCnbuF7uw
         T/Xz+PZXAMOpxpKw/LWBSD3GJVHh0CWu5bBsuAZVoF+q5pKLyJbde6ToV/+rDYQ20sP/
         ItYrUQb9q6CZUGVZI7XD3hiTNhTfTh4r45GxNjJfg6iPcUF7TRzj7rkRbaAdtRAvQuVK
         uP0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787785517; x=1788390317;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=94pyTmilRwp00Qy5PlO0fIgUZFKJ9TnrjxcqGpSFO84=;
        b=k+OSK7gM1C33k+ioGP3glOQ8gecsvLByYCyiBB5A6c2xIBOShgg4u0jLzHtocA/Gp/
         6ZJhCVbll8HVqyZK0oQ2wAI1u4M/gcj7/SYoxeeE2ZDlE2zhaaXqQ4kN8Tb+ofNWPcyu
         lfoGuQ3HA1JeZvH5ArfBzGW2S53JyCMK7brqWBUDua6gcBlDtk3kcXGQ0Ua66RHrsuNa
         8CGYE4XA7y8AN09NrLlVcwfGb8KJAn2757Md/9ggQaaRAawIvK8GMgzL7Z/+PUbQt+D6
         UpQRttTFkd+gYYO8VjFVwgqd8SRNa1zUmUhWPxhBJyd8mZ88+6ZH3X01pYa5oKRXjajy
         eDaw==
X-Forwarded-Encrypted: i=1; AHgh+RrWOG5WmaiudKvh+lBSyRzlTtXq+NP6KN0J7Xd8PIaX+wiUgOtzfRwZf4f7pwHcf9+tqG+bgSgv1gQ=@lists.linux.dev
X-Gm-Message-State: AFuF++mEro2AgCACbQzTQUm4cuJtN9zoRnmaBCJc8An5HVV5p/3nOiPq
	aDisY1j4jyva6ILAzpzGch7rk04MwKdk+JYeQVFMAxXhAUWT79q1m9oyf8UZhGpzOxMUny4jPo9
	ieCMCZQ==
X-Received: from pgct13.prod.google.com ([2002:a05:6a02:528d:b0:c99:5634:7551])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:7008:b0:3bf:7bf7:7913
 with SMTP id adf61e73a8af0-3cf8445170emr21857267637.14.1787785516420; Wed, 26
 Aug 2026 16:05:16 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 26 Aug 2026 16:04:53 -0700
In-Reply-To: <20260826230511.972824-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260826230511.972824-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.887.g758fc8c411-goog
Message-ID: <20260826230511.972824-3-seanjc@google.com>
Subject: [PATCH 02/20] KVM: selftests: Bump the minimum GPA for page tables to 0x200000
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>
Cc: Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Atish Patra <atish.patra@linux.dev>, 
	Alexandre Ghiti <alex@ghiti.fr>, David Hildenbrand <david@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm@vger.kernel.org, loongarch@lists.linux.dev, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, 
	Ritesh Harjani <ritesh.list@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Bump selftests completely arbitrary minimum GPA for page tables from
0x180000 to 0x200000 (LoongArch's minimum), so that LoongArch can use
vm_alloc_page_table() instead of open coding a rough equivalent.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/include/kvm_util.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/include/kvm_util.h b/tools/testing/selftests/kvm/include/kvm_util.h
index 5a7a455b5387..70906a0d1003 100644
--- a/tools/testing/selftests/kvm/include/kvm_util.h
+++ b/tools/testing/selftests/kvm/include/kvm_util.h
@@ -175,7 +175,7 @@ static inline struct userspace_mem_region *vm_get_mem_region(struct kvm_vm *vm,
 
 /* Minimum allocated guest virtual and physical addresses */
 #define KVM_UTIL_MIN_VADDR		0x2000
-#define KVM_GUEST_PAGE_TABLE_MIN_PADDR	0x180000
+#define KVM_GUEST_PAGE_TABLE_MIN_PADDR	0x200000
 
 #define DEFAULT_GUEST_STACK_VADDR_MIN	0xab6000
 #define DEFAULT_STACK_PGS		5
-- 
2.55.0.887.g758fc8c411-goog

