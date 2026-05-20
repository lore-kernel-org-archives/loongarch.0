Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com [209.85.210.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 351663BED01
	for <loongarch@lists.linux.dev>; Wed, 20 May 2026 09:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779268774; cv=none; b=g63KyGJFY19M6e5ANY7MQ9bprjC0r3BMXh41BbF0KAwwulXzU5ZfFdzoM4YcAykR27mWrrxmks8LEq5rDU1Sd5r39TOtKGWk7TD4We88MdLVmNlmnBewhrSjgb9iKSQi/RSo3kKd9FpQUtA7L4lKRfesC05Wi4n06L//YdpAeXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779268774; c=relaxed/simple;
	bh=25Wos8h+kuVxYdWnXQjvGbC62TvhYYtucbzUo5/jn3s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O2CjSLfl4f505FvZjZJiK7FXGd+FoYspjUEedIKHaCVmC4VvFlhfKZwPvIIr0+S9hWSSQxwGTX3rU3LILlQOheiO90CM4FCnHP4UVsi/BLBIlBMqi9+3pEQtU+aU3i3N//DNX5pfCgTLhtZJt02cwsrKG5ya0O02yQWdnw9kXbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qVxG9lQ4; arc=none smtp.client-ip=209.85.210.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qVxG9lQ4"
Received: by mail-pf1-f193.google.com with SMTP id d2e1a72fcca58-83ec36a13e9so2171798b3a.0
        for <loongarch@lists.linux.dev>; Wed, 20 May 2026 02:19:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779268771; x=1779873571; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ciQnv+j7sn9Iwh07+rP7odEwkTvIV/Tmpz7NteXq2I8=;
        b=qVxG9lQ4LQ+JMLm7Zxp7FN69i67NaB9tRfGX35uZmA0tq+mFyEPZKyEpYiyEs7V3Zu
         BqzdOBWq75OW82BQWwcR4/Y/nYWRNjgOeOqQ5sydAO3MF2YPU8+1FPPZiTkeWqH709Sm
         qEIYiXWX+CnirUdWTy3kpb6JCauibrv2YY81C+g2PTzyTP+NgIejQQpZpUbbv0FtFNox
         JL9++KWzr822RsSl7Md+Cm0wcIfE4EAbqua3QfaoZpksevAX+8wS7W2xgIsUa2RMW8IS
         yy3UkvYkaBxITf9Yvv16xSRZZ3CTNu1vZiI7qfuQbrjSTpcMOC/2sEN44bMHpNPRjChw
         x1Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779268771; x=1779873571;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ciQnv+j7sn9Iwh07+rP7odEwkTvIV/Tmpz7NteXq2I8=;
        b=CMIXBrHb24ZrgksWPPTS5xOiF/7av13RF66n4dO+NsGdm4WUetQsTpKLwzY0ZVKmpu
         va+XJy8zjaI9954j8Qu6knI/wAXHjCZ9TB7E+O4J2r8z5Otxvuw8KumBSB98I3oZ6+4E
         xsvlsv8wn3oldtIMSZG75YtUjg9T/mtpd7kJD5TeuyujP/F9sZz3HUdLlOmrgo1nwFiN
         ELOBqSOGvU3xrud3GHKwwZWyBZw5K5UCkm0EVf7UxdIlSgeLeHTSegSzzV30w64eXTS+
         zMSwdt1Ddo+PBJGyXLNHdqjQAsxN+ev4bi5EeQgqmJnLhjHClYTfh/SuxXxwo5028Ygc
         fRLQ==
X-Forwarded-Encrypted: i=1; AFNElJ8//DYkydcqyik7k7ytZQFgFjHtjoU8a8/YsMpwnMUnR/l7u33Q3X4JjmrtM3vpaMWe/vjzdZ0hEEQ=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywk8KDQbxDUix218kpm4i2uRRJzRhff7vJE4LmjfvUODaAPtJ0s
	r5twEvuXRJwYQ659CDed2HalfNDgFwRsfPaBGWKTaet0yMoApF8Hh9u2tEGW3Lg87EF+25C3
X-Gm-Gg: Acq92OE73pQ95alc54umc7iKdKRIir2JhLIk8Cj9ZmzP6zfEXijNaDAzbdhVIX8+qdF
	XatVMIv0Amgkj+6z0oBJ3tMuARhOetnyoh1wqEm++88VYqoLzyxs0vJWy2mo4nhQ+DoEEeQH/Wx
	1m5K02teYpfbr1Fq5sBE1D0chfXlpLTDm0Eplx83OnBg3nPMi8Puh7hGbmjraVRUPd/VcWAYzmO
	HkXonlxkVXrfZXFUd42CghE6s3PR94srgwZBFEwbCjHUXvMouVEdCQr7zffr2Fyi8I5WdO6vb5X
	5DkuWsJwJlQogRnYtaVGZpMM74k3/JhxmSfRHyyKCH8WCtllyyhPET6r3PZio1QWI1ytBvu/aNV
	+bAC92I5858VYwSoYcsd7zy6+MI60JrlKZ8OxXjhqSO39Qn7qoPT2SX6/H1yBJ1fxutNjrZjWKO
	RdmZkS2nYsfnWVqLbbohojp9Db0pdfl7FsrHVp8yJv889x9mTa
X-Received: by 2002:a05:6a00:90aa:b0:829:8c08:d1f4 with SMTP id d2e1a72fcca58-83f33ccd856mr24019073b3a.39.1779268771454;
        Wed, 20 May 2026 02:19:31 -0700 (PDT)
Received: from intel.company.local ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f63bb986dsm10208967b3a.48.2026.05.20.02.19.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 02:19:30 -0700 (PDT)
From: Wandun Chen <chenwandun1@gmail.com>
X-Google-Original-From: Wandun Chen <chenwandun@lixiang.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	kexec@lists.infradead.org,
	iommu@lists.linux.dev,
	zhaomeijing@lixiang.com
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	robh@kernel.org,
	saravanak@kernel.org,
	akpm@linux-foundation.org,
	bhe@redhat.com,
	rppt@kernel.org,
	pasha.tatashin@soleen.com,
	pratyush@kernel.org,
	ruirui.yang@linux.dev,
	m.szyprowski@samsung.com,
	robin.murphy@arm.com,
	leitao@debian.org,
	kees@kernel.org,
	coxu@redhat.com,
	tangyouling@kylinos.cn,
	songshuaishuai@tinylab.org
Subject: [PATCH v2 3/8] of: reserved_mem: add dumpable flag to opt-in vmcore
Date: Wed, 20 May 2026 17:18:39 +0800
Message-ID: <20260520091844.592753-4-chenwandun@lixiang.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260520091844.592753-1-chenwandun@lixiang.com>
References: <20260520091844.592753-1-chenwandun@lixiang.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wandun Chen <chenwandun1@gmail.com>

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
index 03f52bd17120..eddec89eb414 100644
--- a/kernel/dma/contiguous.c
+++ b/kernel/dma/contiguous.c
@@ -579,6 +579,7 @@ static int __init rmem_cma_setup(unsigned long node, struct reserved_mem *rmem)
 		dma_contiguous_default_area = cma;
 
 	rmem->priv = cma;
+	rmem->dumpable = true;
 
 	pr_info("Reserved memory: created CMA memory pool at %pa, size %ld MiB\n",
 		&rmem->base, (unsigned long)rmem->size / SZ_1M);
-- 
2.43.0

