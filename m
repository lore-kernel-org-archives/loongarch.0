Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com [209.85.216.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D91383E3DBB
	for <loongarch@lists.linux.dev>; Tue, 30 Jun 2026 07:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782805702; cv=none; b=aMtLAX5CXoohBMa70pfpKsMSAkFp8SKzR7kVZ1X2zgStNn2SaIKopZZYtbzR1LhWOzb5PFoKinSithphzNhOsnAupzng3dMKXjFsZ+SSY6QTr9lhfXKuhIiYvCf1HWch63qygmEBs/GuJRe2Mbp5rixlhKahNjXcYloB8D5QvS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782805702; c=relaxed/simple;
	bh=lchK79R+AmUhTZDwGVbOfyN1yZY6T1ioSHcBPnnM3IE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gnwdW5foZNBpRXkbOcoZc5AKaj7ZS/qCnqRIlcIEclNeFqdo8oQpy9S8vwpP7rk2qWYb8W/VGc0ERbdXo+C3HChi2W23rF/3EP869+V3EXWExzk3ZJCD9ECri9TLrzLzaP2MPA6uTi1Sm63/zjJ62lfFjU9zfqYWTVzoIs1VGZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XS2lMmN8; arc=none smtp.client-ip=209.85.216.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XS2lMmN8"
Received: by mail-pj1-f68.google.com with SMTP id 98e67ed59e1d1-37fc01881f2so2550604a91.1
        for <loongarch@lists.linux.dev>; Tue, 30 Jun 2026 00:48:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782805700; x=1783410500; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zXdqCoAvNU5Q6CQ7sbboLRp1ZBRBcN1iNhiraDQrK4I=;
        b=XS2lMmN8VqkqF/MSBdjOUzvAHoH1INK5IFAxQwrswzdrCZyZDh5l6rrb8hv7VNx9iZ
         4O7BPt6/WPQwXNMHyg8xtI1F25qc3S68kKKY2yTVrvmaEPTqUXvJHl+BULkIpzDtT+gr
         1agboVO3sd767TV2+SZrQ0PRsWdOV26urRIgTnSd+cgP+KWGzTGsAX1gv+mHwZv8Lksn
         OmNMX0dLT+X6VO+i9f4g3GkKE51fOH1tkHMTUug1NqvAywVqnuoQ0WtyPtYfWpRxLWOp
         6tnJmQ0+54FCisZ6zpuPCeviKBjVpPdvCv1AynV//ogpKSnXA6apf38xauOJwEyUXhg9
         9UOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782805700; x=1783410500;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zXdqCoAvNU5Q6CQ7sbboLRp1ZBRBcN1iNhiraDQrK4I=;
        b=LKFLnYYNABEd0vkq5XWTFNsTVyhUSoSUGFhdxw8vzZAENwdeeBza7sITKgGzE59bTZ
         TRrLDdTXjTf8ibkP7hkeMVxKnGsV/vZIZJ8ujIbxq/DaNRshJ21AZ8+kxZRzrkJtDfB8
         Jh9McVqApwZGNxq4msxNpXOOEs9P96yrK2cG4sOo8o9uEt0GmN/ePZQqwuaTYt0rx2QE
         30v+8oWqoYW6zGEAHJ0BbCSEkTqV1JumlKumc8S7K3OIOMCCR10P5VDhHr3arscKK0sF
         5v9YEp9mTqFfErdMg6wIAzcsB61Cbi0nllW0bhBB2mQJv23vYUswANgTQ2FZrDmcgQMN
         WDYg==
X-Forwarded-Encrypted: i=1; AHgh+RrEakPRP72hRY8QfvCow9/j8aYOdOpG95cEMINlqYOgoVRNOOLg+3RLMr9oQkFr5heE+w45QkhTYQo=@lists.linux.dev
X-Gm-Message-State: AOJu0YwVZdtSnirJGLjyck+sKEnUzAMmidmn7/j1l6L3cn1Q3p8ehBud
	HCMKVgUtKIQstmWcqdHYkp8GHxGusQcbWyq5tc3w5YMCnewcWk7PBVKJ
X-Gm-Gg: AfdE7ckgBas+TWLtQlKGt/StuG53DoRLP22KxPNkurDdY0bRiTg0bsQw2ZiFXfFK+Rd
	YMZR4xo3d58YecK2Vhsi92aXP4PskFVZ/jj5goEvXM/WoNvNFIPSlsyFbIXarqmKzAeZXRN5iHH
	EC6gKQsacvTQzbEfyLmJrXSk6U0aRiYLkXeUbVmWoF8DHUGyUp5D0EAMzhI6KZSZeHSU4ddNuAM
	QG6lX3tf1h/0AEcYX+rcQd9UMPH/04fG06Q/qBLo9Bz5ow3m21HLjYf1KtJlqC9HDfzXOIBvQ7d
	kYVtdnYDZ081rpNS/KSOXUb7oZxsSE+2NbGaE6OMVCTaX6+n/jWmwZm8h7P8hGv9zDw8DN3ctnI
	ZIyMhXHccj8UrblDQB+hFh3+F+RrQode5MRX2VTHBBrb1/JbLAkG1HNyxucDB1YzbOXQHXZnAp4
	VstE+jodKbE3tlk8cTT1gAQHbHRw==
X-Received: by 2002:a17:90b:2249:b0:368:af5c:5925 with SMTP id 98e67ed59e1d1-38052784effmr1969443a91.23.1782805700221;
        Tue, 30 Jun 2026 00:48:20 -0700 (PDT)
Received: from intel.company.local ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca382a2d3dsm7821045ad.55.2026.06.30.00.48.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 00:48:19 -0700 (PDT)
From: Wandun Chen <chenwandun1@gmail.com>
To: chenhuacai@kernel.org,
	kernel@xen0n.name,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	robh@kernel.org,
	saravanak@kernel.org,
	bhe@redhat.com,
	rppt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	kexec@lists.infradead.org,
	iommu@lists.linux.dev,
	zhaomeijing@lixiang.com
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	alex@ghiti.fr,
	akpm@linux-foundation.org,
	pasha.tatashin@soleen.com,
	pratyush@kernel.org,
	ruirui.yang@linux.dev,
	m.szyprowski@samsung.com,
	robin.murphy@arm.com
Subject: [PATCH v4 05/10] of: reserved_mem: add dumpable flag to opt-in vmcore
Date: Tue, 30 Jun 2026 15:47:09 +0800
Message-ID: <20260630074715.4126796-6-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260630074715.4126796-1-chenwandun1@gmail.com>
References: <20260630074715.4126796-1-chenwandun1@gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wandun Chen <chenwandun@lixiang.com>

Add a 'dumpable' flag to struct reserved_mem so the kernel can decide
whether a reserved area should be included in the kdump vmcore. Most
reserved regions are owned by devices and do not contain data useful
for kernel crash analysis, so excluding them by default is the right
behaviour.

Reusable CMA regions are different: pages in a CMA region are handed
back to the buddy allocator and may contain key data for crash
analysis, so set dumpable to true in rmem_cma_setup().

Suggested-by: Rob Herring <robh@kernel.org>
Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
Tested-by: Meijing Zhao <zhaomeijing@lixiang.com>
Acked-by: Marek Szyprowski <m.szyprowski@samsung.com>
Link: https://lore.kernel.org/all/20260506144542.GA2072596-robh@kernel.org/
---
 include/linux/of_reserved_mem.h | 1 +
 kernel/dma/contiguous.c         | 1 +
 2 files changed, 2 insertions(+)

diff --git a/include/linux/of_reserved_mem.h b/include/linux/of_reserved_mem.h
index e8b20b29fa68..55a67cee41ea 100644
--- a/include/linux/of_reserved_mem.h
+++ b/include/linux/of_reserved_mem.h
@@ -15,6 +15,7 @@ struct reserved_mem {
 	phys_addr_t			base;
 	phys_addr_t			size;
 	void				*priv;
+	bool				dumpable;
 };
 
 struct reserved_mem_ops {
diff --git a/kernel/dma/contiguous.c b/kernel/dma/contiguous.c
index f754079a287d..63ff134dadd4 100644
--- a/kernel/dma/contiguous.c
+++ b/kernel/dma/contiguous.c
@@ -565,6 +565,7 @@ static int __init rmem_cma_setup(unsigned long node, struct reserved_mem *rmem)
 		dma_contiguous_default_area = cma;
 
 	rmem->priv = cma;
+	rmem->dumpable = true;
 
 	pr_info("Reserved memory: created CMA memory pool at %pa, size %ld MiB\n",
 		&rmem->base, (unsigned long)rmem->size / SZ_1M);
-- 
2.43.0

