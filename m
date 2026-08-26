Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 392A93D75CE
	for <loongarch@lists.linux.dev>; Wed, 26 Aug 2026 23:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787785538; cv=none; b=NVSnVYKbLOxarbryJ+YKDJzrfgGvVfBZ5vQLod5uWhMXfLa+fw8ige7f1NDWLC/Uq9JCCaYHOye7fVcle+3P6pRURQ4Q5xCF+AkP1OKEdfnP7bg8U18czvph4dlhWeez9K2OnKcp713Vy/hpCpE6GeGFT5pL7732MT9gwtIHHPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787785538; c=relaxed/simple;
	bh=3EDupCSd227h2crKQg33vyihGNO4uU9jZfUf3CJAc4M=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=iNeHvrYIxcQHpgaiAxF52x3Ux/sICU68yB1t/Zth8djTiSov84+XIoGoVDZipXLUeAOeG0yz3YebuO3NWsi9oAChNksA/miG2qb2Bk3J3719DRn5XJmo8B22PKyxjRbSCqRuddoJJYEE47jTwSeked5wJ/LYlbkkaO/V4M5hN5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FsqT6H/v; arc=none smtp.client-ip=209.85.215.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FsqT6H/v"
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc1d85c012dso182547a12.2
        for <loongarch@lists.linux.dev>; Wed, 26 Aug 2026 16:05:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787785534; x=1788390334; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=x6dP/JlGXbpMmzJiAs51wjG9zHvCLsaGeW9+h1tHon4=;
        b=FsqT6H/vT2wMQp1KMhhT4822h34V+c/XiwpEbtEA2CYvHzhEZ0RwmtN2MAYyBEyIDt
         Zdy6h+qxQr5zuRxxjHM9QMAVyMezKFzu6Weo0Md/h0J8obYEBwkj5jqKgfmWUE7uazzz
         kBSg9Mc47GjPjG2pE27D3PHiC2APXq8PcMe44vkpM3kKOTab3t/VdHstdF1Uzg33cgCB
         Fx4nWkhqbLzjuPCt8ghYTR3qhHd1D/zv46Om6VMv/M6o7dxpUT6eCyhB07vwpNefJP03
         RdxST5+nfnaYdHCtANcvgPvcX2AZBC3pxOP17K1tehwNfHN25JDezSm9dWiMX9LwXgxu
         YLEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787785534; x=1788390334;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=x6dP/JlGXbpMmzJiAs51wjG9zHvCLsaGeW9+h1tHon4=;
        b=R0eIfaLS9nEk3fRgBguWtokZJaAhoM0K9Rnyz5ScXibx8l1ISfQLZdg/qqN/ZMxlyk
         YbJbPtqmSjLyq5KGGTLDEZsYC8DzUECSoZztvgIML5yHFjbvhXCE00w0lyU6JLjQ6JjJ
         u4TvCZp72GbYQQOhaZZS2etCLeTziGmjbHxdrJEEahPXY+7jIdCGQHpKZDCn32YpRH+b
         feF1LzoFopcuQho5TXkjRodFXw05ataaG8qXwPs0P0MBGqamUXbKW5/cuLOhg36OGlXp
         rf8qmsEuydpTkbNW9tlOq7HLM4yN5RaIJ1CVjz1TOxd8DCk327Qvu+lMrkMkePRmV2M0
         i7RA==
X-Forwarded-Encrypted: i=1; AHgh+RqPiGNYjxVofjmIQUL/un5cDV/nkvYLcOwDoho+rLKV5i3Y0kQFtku3Q+GwF9Ob67YN2BNPKvgEcq8=@lists.linux.dev
X-Gm-Message-State: AFuF++nPZ8XBmLm8pq4lWvxyD79pqIevaaIxOjjfzPfVXpc3W7q2gc6z
	vDDuQ3YYynfQwtYaf0lts5x+alGTHiVv2EtB8AeN/8g5VBFvq6edbSUzz8MGHyIjk0tcVlszhVI
	/KkQJKw==
X-Received: from pgcv20.prod.google.com ([2002:a05:6a02:5314:b0:cc1:c423:3804])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:cfa8:b0:3cc:8f53:26c0
 with SMTP id adf61e73a8af0-3cf86dd6053mr21955403637.17.1787785533546; Wed, 26
 Aug 2026 16:05:33 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 26 Aug 2026 16:05:05 -0700
In-Reply-To: <20260826230511.972824-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260826230511.972824-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.887.g758fc8c411-goog
Message-ID: <20260826230511.972824-15-seanjc@google.com>
Subject: [PATCH 14/20] KVM: selftests: Use TEST_EXTRA region in arm64's vGIC
 LPI stress test
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

Use the TEST_EXTRA region/memslot for arm64's vGIC LPI stress test instead
of a custom memslot, so that the primary vm_phy_pages_alloc() APIs can be
reworked to take a region type instead of a raw memslot.

For all intents and purposes, no functional change intended, as
vm_override_mem_region() is barely more than a wrapper for
vm_userspace_mem_region_add().

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/arm64/vgic_lpi_stress.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/kvm/arm64/vgic_lpi_stress.c b/tools/testing/selftests/kvm/arm64/vgic_lpi_stress.c
index 9a69c439a0f8..9865b204fdeb 100644
--- a/tools/testing/selftests/kvm/arm64/vgic_lpi_stress.c
+++ b/tools/testing/selftests/kvm/arm64/vgic_lpi_stress.c
@@ -164,8 +164,8 @@ static void setup_memslot(void)
 
 	pages = sz / vm->page_size;
 	gpa_base = ((vm_compute_max_gfn(vm) + 1) * vm->page_size) - sz;
-	vm_userspace_mem_region_add(vm, VM_MEM_SRC_ANONYMOUS, gpa_base,
-				    TEST_MEMSLOT_INDEX, pages, 0);
+	vm_override_mem_region(vm, MEM_REGION_TEST_EXTRA, VM_MEM_SRC_ANONYMOUS,
+			       gpa_base, TEST_MEMSLOT_INDEX, pages);
 }
 
 #define LPI_PROP_DEFAULT_PRIO	0xa0
-- 
2.55.0.887.g758fc8c411-goog

