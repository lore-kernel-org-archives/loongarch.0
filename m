Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.228.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792571516;
	b=uQ2XPkAhuG2tq4vBnEeAfJ+/Ey7hrhSAvVK02mRoHGl/Ene8stj+06MRJPA7ecvxDoFR
	 71i8dAZ4S++ed4BH2VzYBRyLmU8U3kY6/oh8JxwQD5pzqStNLcFrhVVtThU8Dm7B55B5s
	 7sg1IhA44hCc4Y2vgOMIML+e2uYe/PvRI0X4OR6hpAoa2O6pYywWnq5A0VZOzI8fjCcRg
	 QYQ6IaTTGJXlDZG51tifsYhyIxJ7VR4C34PRdHn/twJNCb9EUZHPpnP4GnT6+bu7RofVx
	 7hzIJAT9mIoIcc4qM+/a57CiwsURkjk1gEaIFDKsmQezfXN7SqPWGxxN26TMQCf0PFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792571516;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=EXuyqgfiF9x7HO7+fbFxeGIrd5nFUV6QECR0sZa4nrg=;
	b=0tNTu76DfkaDqdsKfAbRMgbeap9Sr824JXc7Mz3PErFEgltj3GpH6ZVImH5NM5kma/uj
	 IiVoN69NhAv8+nwEBOypwTCtLItUOMMPG+PrW8hojU1cNwTEclsTL8CeYhYjir3MW4q4l
	 3Atj2qnupSD9tuVUkBH9Pt0wCN3JnKm8W2p5KnyHdU8LcDK/KWjzaDAd4GgFqc9wfLSeT
	 kjMoxPrvvAFHk3KPi/jWYTGjjlxn5zeTQ/EIPPooOkpqCodfOtKsd1EMCJduE23jbiSIF
	 Rs5HEdoMtVpdd/HBxwHptDAFsc3BR1R5lDyCk5ZXLyAIY2pSmBrXwSirr+1GubHa6dA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=c0ajL3lG;
	arc=none smtp.remote-ip=74.125.228.9
Received: from mail-pz2-f9.google.com (mail-pz2-f9.google.com [74.125.228.9])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82147606A319
	for <loongarch@lists.linux.dev>; Wed, 21 Oct 2026 08:31:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82147606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=c0ajL3lG
Received: by mail-pz2-f9.google.com with SMTP id 41be03b00d2f7-cd69ca84740so115869a12.1
        for <loongarch@lists.linux.dev>; Wed, 21 Oct 2026 01:31:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792571516; x=1793176316; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EXuyqgfiF9x7HO7+fbFxeGIrd5nFUV6QECR0sZa4nrg=;
        b=c0ajL3lG7Tfx2mB+vsh+6ReY1Ol6ndXs2v9CEVkGW9uP545ncgF6/6e0hwbYc8GsDF
         +BWLOoi9YDguZclQp/rnmkxRI4svUxuUbumiT6j0ZZT86ow7P8vHuEkH+w53UlhEfvVj
         ktQYgx5YDGMAqeMjv+t3kt+tq91GVwSVqP07Upeu+dHjW9oJ6A7L/f8P7B/Uog/hlvBc
         uOklDsvRJQUevk1viflVdUbVBr3GcI85qn1LYplfRg7zZM9GxUT1oLxzbVn51pLaGQnk
         /XeCIK2veswgv58Z5kGWNM3XUJBc5NRxFyNoiharTANjVeLg2xkc0YZ3WubyiL97IALJ
         pQ1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792571516; x=1793176316;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EXuyqgfiF9x7HO7+fbFxeGIrd5nFUV6QECR0sZa4nrg=;
        b=Az2JsFv6ysc+A+DSJbA9X6t0a/SA+wte2gWhul6V42V11RgThuY5abp0PunlwiemiB
         LkyfoaakBfBSZHYIfnCuuEll7Smzh1FAqJ4BbAEotSOlynF7HwzTJtAhEZ1q4zncvM8w
         WMbm8tSexuMWMyNIdH8Rth91bcHy8lXfu83hvWGRXUOAOInNGSbDg5nR4w6u/5Mmp6cA
         nc5l7n79PDwzkg/wEcU1xZrDw9AfYR3Y/h6QZDKIcNwzzZftOehmYgHwrC4oSFOhwR8C
         CvjROeYUXocFTi6iqZgo3Gc1IeAhhYTl6L/0hoicVIlqMec6SC5ixm7ELr0qGvraSjn3
         QBNA==
X-Forwarded-Encrypted: i=1; AKwUvByq7yl2Hc509LghGBbTrVNpFvXlPUdlMDmo6xert/EyyoCcWs7Vf3U2cTqKF6aIOURll8017DEcJ4s=@lists.linux.dev
X-Gm-Message-State: AFq9FYL3LBdQWSKz1py4iDX+QPujWu8WFmWNRbN4dHODCpvEYplgc495
	+EeuwCXvs064rjVXY4AljDf4GtZrVxPsRmR9siSR/rjUMKSFFXWq+9Yr
X-Gm-Gg: AYBFou1Ul05kWW+niIgqu+rKQ2Ngh30flkz6bXtZfiiyxzUlKEik7+KKZTveo7S0uNd
	gPTjUEFdmv2mdWduoJZJuG3B4wL/lBZHE2GdWgO0BTNDqF5Mj3qVEZGaNBbPRNG3vK22WRCNPn5
	b6BMelBOD+L3TmiayJE7OVh3N71GZ/OeAyvN1gJs4bsv8vRW6oA6d2NqNILk5VRT+YGk5zA3VCn
	b183npq2bNF+FAkAhLWRZTKFdLweF9o194H/JjY7L0GQVKyTfMJCQfmlv/veQSa3QytsVUrxqCI
	EsqXhYmY9vNBh230njS4nIOFz/bj2NcZYTTSkADDA+6widbsq309T8OPREhE2AiVMNYRljmoolC
	z0HASWftXdzhRFuJshBeicoJcJQpQQ7wWahsMEe7LVKyIJctAIKS4HqHf1MV2byLdjzvnpib+Rw
	MwGzo62iZd5YFvXQgdOmu5VG5kwGa1fZmEpDTVduAUbSC7bRLBVEnmolFuuJTD/yKRoLDA71fJ1
	a7VaJguIgZMKGCWoCn+YnN8y6v/kUJLcR2E1V1EKUUxo+WmpysorK5S4F4ci0HhHVgkDA==
X-Received: by 2002:a05:6a00:21d5:b0:876:194e:b8fe with SMTP id d2e1a72fcca58-8a089de73admr1183835b3a.26.1792571515803;
        Wed, 21 Oct 2026 01:31:55 -0700 (PDT)
Received: from intel.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a0895e273bsm600653b3a.41.2026.10.21.01.31.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 01:31:54 -0700 (PDT)
From: Wandun Chen <chenwandun1@gmail.com>
To: robh@kernel.org,
	baoquan.he@linux.dev,
	rppt@kernel.org,
	m.szyprowski@samsung.com
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	mark.rutland@arm.com,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	saravanak@kernel.org,
	akpm@linux-foundation.org,
	pasha.tatashin@soleen.com,
	pratyush@kernel.org,
	ruirui.yang@linux.dev,
	robin.murphy@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	kexec@lists.infradead.org,
	linux-mm@kvack.org,
	iommu@lists.linux.dev
Subject: [PATCH v9 6/8] of: reserved_mem: add dumpable flag to opt-in vmcore
Date: Wed, 21 Oct 2026 16:30:09 +0800
Message-ID: <20261021083011.2170525-7-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261021083011.2170525-1-chenwandun1@gmail.com>
References: <20261021083011.2170525-1-chenwandun1@gmail.com>
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wandun Chen <chenwandun@lixiang.com>

Add a 'dumpable' flag to struct reserved_mem to decide whether a
reserved area should be included in the kdump vmcore. Non-dumpable
regions are later marked MEMBLOCK_NODUMP; the filtering itself happens
in memblock, keeping the arch kdump code independent of the DT API.

Most reserved regions are owned by devices and do not contain data
useful for kernel crash analysis, so dumpable default to false.
Reusable CMA regions are different: their pages are handed back to the
buddy allocator and may contain key data for crash analysis, so set
dumpable to true in rmem_cma_setup().

Suggested-by: Rob Herring <robh@kernel.org>
Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
Tested-by: Meijing Zhao <zhaomeijing@lixiang.com>
Acked-by: Marek Szyprowski <m.szyprowski@samsung.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 include/linux/of_reserved_mem.h | 1 +
 kernel/dma/contiguous.c         | 1 +
 2 files changed, 2 insertions(+)

diff --git a/include/linux/of_reserved_mem.h b/include/linux/of_reserved_mem.h
index 49da515859f2..99c0f3ccc297 100644
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
index 90937dc7c627..d7bfc38ac762 100644
--- a/kernel/dma/contiguous.c
+++ b/kernel/dma/contiguous.c
@@ -567,6 +567,7 @@ static int __init rmem_cma_setup(unsigned long node, struct reserved_mem *rmem)
 		dma_contiguous_default_area = cma;
 
 	rmem->priv = cma;
+	rmem->dumpable = true;
 
 	pr_info("Reserved memory: created CMA memory pool at %pa, size %ld MiB\n",
 		&rmem->base, (unsigned long)rmem->size / SZ_1M);
-- 
2.43.0

