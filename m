Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D36F4AE135
	for <loongarch@lists.linux.dev>; Wed,  2 Sep 2026 16:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788367317; cv=none; b=Zae+BRUAdB9TIehxpDnQJFQLIhFJcsO1ZmiK5N213rVb3KtHjCNVBpcgb4gaPDAXIFbdXOeKcurbRGku1FsPzSj4lqeP/aLAi/J27ZDNxe5jCFYOcFxrcmpSdoVG6n6wlSZ0+e5qsFUb1MHzDpypPWbbolcIxoUep/HWnNCT+zI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788367317; c=relaxed/simple;
	bh=x3gHoQm6151eyOz2sxvBb0hZCS6dwBM8KBP69Q1Eww0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=TMCk5ujhWEzZBV51HGYBLNnb5/h47c1Fd6DB+OgR3awvsx7hMapGkMHgykvKaQ/iYbeA5fOVwRB7awjZF2i3AWGfSpzPp+1XEcUy41Q5ei6XsWu6CDI3ZdR4icoxzDAUdrwKpjSuK7YfHT0zN9piXvIIHxLlJMT5LIvtIEOkI2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CQIc3hYe; arc=none smtp.client-ip=209.85.215.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CQIc3hYe"
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc1c18c775eso76017a12.0
        for <loongarch@lists.linux.dev>; Wed, 02 Sep 2026 09:41:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788367306; x=1788972106; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ff1nydjVZ5E7b5LVcCvqITlv5jcgKgSL4KOLnEEEgvQ=;
        b=CQIc3hYexchZAAxjCUz6amEsU7cNGT/746FypuyD7xmeJQpN8/kHVqr1FmBcfM+smF
         wOXruWdEM/eOB4QyPKxouoiLXifOusQAYpjou0CTXCERsJb8Up6n7xOHKDwY6LxEaIaq
         V1uTSLIYOJsRmBnbVMOfWvi+sbs8brlqlRy2cp2tf74peCbdi11NBksnIt39kmAk40xO
         98V5f3/0Dsvx71UfQwZH6CletSr7kNVDHL2u9MuhgYGnYq97lrMIBlRpDMk08G6Zra2e
         bwD2zfcJpG1c8bc+/1B4mw/Xnyyg66j5G7tIDuafvnSvPOFHrO6oUZkt0iQykib27dyQ
         G5lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788367306; x=1788972106;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ff1nydjVZ5E7b5LVcCvqITlv5jcgKgSL4KOLnEEEgvQ=;
        b=CsLvKtlYaQcpoxkahaqsUPglY3/QzHMCjSUP+rzQzbO4fWSjQqlVaOXZuG5V304oCQ
         3KxAnBfBEde0tvLCtD+en8KSH2rzzy/fIThF7+8So+RLCMsVMOlzEcCegB57a0cIxqmW
         ByVwA6ItTfTEC2f0RC3Cxzmz60QA3E4PGChR4TDA7y1QTtKTdPJGy+VIbxMeUnAGHgIS
         5vx1t+ysKTQUm1GrYCpxrIJPHaMjQFnw/+3GAerq9jpERsMSLLz7YeHuSVyafKQGPvff
         aUY/UqW4nHJDlpTd3zW2I7Crl1WFq9XRqbMuMOmEkjjvfD+dP9qAoJCtsNg61CPk/f6E
         jLCg==
X-Forwarded-Encrypted: i=1; AKwUvBzmCQw4eJH5qAIBFsepUwctitzNkpTY0pn6/tCfqhdCEX8tndSauJUOkNJWM3WdVJWyVxiXJS4Cce4=@lists.linux.dev
X-Gm-Message-State: AFuF++m6+Q21T9n2MXHGXj9iK/Knm8PloNDtnHDrOAjTx1PXE9fCd6pS
	8ursB6Tz2P6gYfu97sE7fPrb5kTFY5H8qoq0fsv0Of/d9XI18UePA6w8cy7VfOnu8IXErq4403Y
	LbFt0CA==
X-Received: from pjc15.prod.google.com ([2002:a17:90b:2f4f:b0:380:cd24:3a7d])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1dcd:b0:398:9bd3:d6d1
 with SMTP id 98e67ed59e1d1-39b083af6fdmr384502a91.11.1788367306328; Wed, 02
 Sep 2026 09:41:46 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed,  2 Sep 2026 09:41:21 -0700
In-Reply-To: <20260902164123.2546762-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260902164123.2546762-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.966.g6673acef38-goog
Message-ID: <20260902164123.2546762-19-seanjc@google.com>
Subject: [PATCH v2 18/20] KVM: selftests: Use TEST_ASSERT(), not assert(), in vm_get_mem_region()
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

Use a proper selftests TEST_ASSERT() in vm_get_mem_region() so that bad
input is guaranteed to fail the test, and with the standard error message
format.

Tested-by: Itaru Kitayama <itaru.kitayama@fujitsu.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/include/kvm_util.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/include/kvm_util.h b/tools/testing/selftests/kvm/include/kvm_util.h
index c9ef2e5c9971..c166fce4599c 100644
--- a/tools/testing/selftests/kvm/include/kvm_util.h
+++ b/tools/testing/selftests/kvm/include/kvm_util.h
@@ -200,7 +200,8 @@ memslot2region(struct kvm_vm *vm, u32 memslot);
 static inline struct userspace_mem_region *vm_get_mem_region(struct kvm_vm *vm,
 							     enum kvm_mem_region_type type)
 {
-	assert(type < NR_MEM_REGIONS);
+	TEST_ASSERT(type < NR_MEM_REGIONS,
+		    "Invalid memory region type '%u'", type);
 	return memslot2region(vm, vm->memslots[type]);
 }
 
-- 
2.55.0.966.g6673acef38-goog

