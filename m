Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70D774AE10C
	for <loongarch@lists.linux.dev>; Wed,  2 Sep 2026 16:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788367312; cv=none; b=p2L8T2FId5cj7GDjWlKp5xiHjxoEKUd7q//Z/b68g1nE6zl/B5zFviZF24aGkZoJX+TrlqrGdtmUwwmafvL52AUBEIR7de8UllYEhVR5z739KAob8jhny76hOSiEQ35mHV8WN9RK5HqqFhkPDVX9KzlIAMJYNoeEKB6kk6Apfik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788367312; c=relaxed/simple;
	bh=a+smfS4HY4kg5A4IC4+lGdAxAV+Nzj8xt7z5c+G89xo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=abARHdBRj8yWC57xLKTNUTfDB6Bv/5oYdBOZp24Uj2nfgTctUddJFCLgyRrNaqhfky5/lQu105UQbYSXGaKGEG8Ue96IMZmXivFH675H2UCvR1rDwqjwG6fnoEEuXsPDdzhInTV2pmWoYp8bUqKQUaUyRp8dbrgHczPs7akH6LY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pEUidtMR; arc=none smtp.client-ip=209.85.215.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pEUidtMR"
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc4216aee8fso1341952a12.1
        for <loongarch@lists.linux.dev>; Wed, 02 Sep 2026 09:41:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788367303; x=1788972103; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=F6KFth+wmNcPY6G4yAkPxQ/KQlcOGwTTAk9RODAHfTs=;
        b=pEUidtMRWC7VmU3l7E3S+goj8sBZC+vCtHYAkfwouDQF2Hr3xNU/k5woilIyMWo9LQ
         QCqTrbZpDV12O62aLYHcZ58Qohbpsma+7WTpVTPBcxwQ/HyHsoo6EHRzltzzDzvHihWK
         z1FszPrHskJYiuO7W0v13KnkLn5kwderdP1wFZs0BUUe8Tv7iSImZuX3Rtd8bSHxOeTc
         TCKv5gu68OGJPgFaqM6B0CBskZtNUVS57FUZJZWxzKvJsSTOtzPwFR/V/pkaOU3FrgIV
         +1Ljpnn9K55gqXlQaxTG0o2TLreUzjlswhJTREYVhyQyb/pCE/5ASlqQnXyfFi9tn48H
         iNCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788367303; x=1788972103;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=F6KFth+wmNcPY6G4yAkPxQ/KQlcOGwTTAk9RODAHfTs=;
        b=maVFXfy2t5FQww2hJYvgir8grTiGbiQyzpaaJWmqefXUHpCLxRjFf4drWaxHy7ns9J
         0NqWPxKkiGBaQSqEyQjX7YHlHK5j+7hHcs4DzGOPDtvix24Sniyx/uSpWTvKCerCeGq1
         cFLLSwvp1MWqlicmCT9hyR9tiQmZsrOZ392L6EQ/yI7IldrjGjUMX0HIjVzReh1ZmI1Q
         UJCnvfGNLWQk4EKUN9VyZZRIxO2AU5Ida1PASsjMp4umHN0NT4LFV67CXG3PZCOu4Bh4
         IZlhNaWIE08eP3PwExxBJm/8498HHay1vvvZ6SY81MgQnmWGWShWVlZLBNPdIxiLK4pv
         Fbiw==
X-Forwarded-Encrypted: i=1; AKwUvByEaWBP20iu3vhWOXLTq9TIdGLwdk3EMlHTFpwgwv8ZImkuTpn96ZhXvNUvhvVTzchFTR82YnORa7g=@lists.linux.dev
X-Gm-Message-State: AFuF++lbLsyPU+EZO+AAZe/7a/g8rvkjZdDN/OIzsSwd60oCEnymfDzp
	YPlngdLhR2q0eUX7twAExu6dpsZC6cGQfsyZBsq17kjIyUKqlFrCw1ZAWgpkjMxClQ7ebpQ0iVb
	K7lxoxw==
X-Received: from pfux9.prod.google.com ([2002:a05:6a00:bc9:b0:847:82b3:aca])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:9295:b0:837:e9cc:d474
 with SMTP id d2e1a72fcca58-85ed1d07a02mr8719333b3a.2.1788367302673; Wed, 02
 Sep 2026 09:41:42 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed,  2 Sep 2026 09:41:18 -0700
In-Reply-To: <20260902164123.2546762-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260902164123.2546762-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.966.g6673acef38-goog
Message-ID: <20260902164123.2546762-16-seanjc@google.com>
Subject: [PATCH v2 15/20] KVM: selftests: Use TEST_EXTRA region in x86's
 smaller MAXPHYADDR test
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
	linux-kernel@vger.kernel.org, Itaru Kitayama <itaru.kitayama@fujitsu.com>, 
	Nicholas Piggin <npiggin@gmail.com>, Ritesh Harjani <ritesh.list@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Use the TEST_EXTRA region/memslot for x86's smaller MAXPHYADDR test instead
of a custom memslot, so that the primary vm_phy_pages_alloc() APIs can be
reworked to take a region type instead of a raw memslot.

For all intents and purposes, no functional change intended, as
vm_add_extra_mem_region() is barely more than a wrapper for
vm_userspace_mem_region_add().

Tested-by: Itaru Kitayama <itaru.kitayama@fujitsu.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 .../selftests/kvm/x86/smaller_maxphyaddr_emulation_test.c  | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/kvm/x86/smaller_maxphyaddr_emulation_test.c b/tools/testing/selftests/kvm/x86/smaller_maxphyaddr_emulation_test.c
index 3dca85e95478..b21798a385ca 100644
--- a/tools/testing/selftests/kvm/x86/smaller_maxphyaddr_emulation_test.c
+++ b/tools/testing/selftests/kvm/x86/smaller_maxphyaddr_emulation_test.c
@@ -62,9 +62,10 @@ int main(int argc, char *argv[])
 	TEST_ASSERT(rc, "KVM_CAP_EXIT_ON_EMULATION_FAILURE is unavailable");
 	vm_enable_cap(vm, KVM_CAP_EXIT_ON_EMULATION_FAILURE, 1);
 
-	vm_userspace_mem_region_add(vm, VM_MEM_SRC_ANONYMOUS,
-				    MEM_REGION_GPA, MEM_REGION_SLOT,
-				    MEM_REGION_SIZE / PAGE_SIZE, 0);
+	vm_override_mem_region(vm, MEM_REGION_TEST_EXTRA, VM_MEM_SRC_ANONYMOUS,
+			       MEM_REGION_GPA, MEM_REGION_SLOT,
+			       MEM_REGION_SIZE / PAGE_SIZE);
+
 	gpa = vm_phy_pages_alloc(vm, MEM_REGION_SIZE / PAGE_SIZE,
 				 MEM_REGION_GPA, MEM_REGION_SLOT);
 	TEST_ASSERT(gpa == MEM_REGION_GPA, "Failed vm_phy_pages_alloc");
-- 
2.55.0.966.g6673acef38-goog

