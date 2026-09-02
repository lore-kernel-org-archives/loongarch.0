Received: from mail-pz2-f7.google.com (mail-pz2-f7.google.com [74.125.228.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CAA93E5A0E
	for <loongarch@lists.linux.dev>; Wed,  2 Sep 2026 07:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788334398; cv=none; b=ZlJiU7JB9BkEZJGrWilqZ0Q5NKYM07MUIAJ9q3SmfrUxi/lQfibhw5jonfxWy1NyMEA1IEnxj1/6wodhfnyUuunbPbJpC3TK/+EZNz+cN7bjhTiAeWyoRsdpNkBA78yyKp2gGStBOJcMnrSuTyKu2Ngw0vPnSXayHVIuB1si0vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788334398; c=relaxed/simple;
	bh=LdiDKcxoqOK6v7YCmPqCiMeNyxA1ek7PYiNAuO0m/sQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Xz+rzbxm98aKNBs4m0AynJzb5tHMwCSAaAhjrr3Yu+H57GwWdtEY3DlMVSQAzhUIoKy5AcDpCbl9WjjsIDlqT1HGtQ261YMCYimJrLpVvQhLsODboEMxZMHtJ6068Ya74CKCicjfiZn2xu0opKboiED/+orkGXIP2BuIxpseO1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kY6RVo00; arc=none smtp.client-ip=74.125.228.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kY6RVo00"
Received: by mail-pz2-f7.google.com with SMTP id 41be03b00d2f7-cc1ddb3ba3eso440136a12.1
        for <loongarch@lists.linux.dev>; Wed, 02 Sep 2026 00:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788334397; x=1788939197; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fTBZpbSvsidLVDHHiShy9f+wnGid6sRS2qRO19KqwKw=;
        b=kY6RVo00NST51thGYM/4ntsbphmOwVn49mKF7/6yZDXRWHD5gKkPtUOiFftCxQNWtf
         /iZ+sDnP5gIRjDVw9wTcvyarXpzouBKVoE26L/0VHPJ2wEKtlkJnQbcmEFV5o86rKtZl
         9VNOseTDIhPmXQWo20+NSahMJYZv4BFcu60rMDEaNMUbgaDWe5M0uGJhZ99pFgWNJEdP
         ad7TBNWBq6F5hxzq3wX7XlG9B+cxbhwMlfGgTo1SFymQN1f3O9a7vUqBhCh8DXSbncxU
         DllLX0GmQNI8+oaeg2KoHc72g2fkX2o+g/KXn72EMHOAyWru7QLiA2dCHM23AeIX5n03
         jwDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788334397; x=1788939197;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fTBZpbSvsidLVDHHiShy9f+wnGid6sRS2qRO19KqwKw=;
        b=r/HuPr/WM8Fy+xP0Vl26XYDvwYAFZp5KiyOqDYIsW+6Vy19R/WaPvDGGoU8IOld3lD
         2h6detXkR4pS5K4Co9Qz4QkXOh/2IijeMvHnTfL62hbbPm5fosN39Abyc25Zq278hfIu
         N5A5MyG70rbNSkFRGE/wkfy/4rXRbMPXJh7ATu6f75810G/zMOIRcP7DRyX9ePJhDJgU
         5xyoCexuHBsUyd7NHEl3hOtm42ry9Vkma/hP0d104kiyeiU0BK3MmgUczGncGofn7j11
         jNZtXP0bLNfdcuV8h7jh7L2eaRNaTptY3p9q+is3wG1ILazQHDanTzBA+ddnYil/iO5Y
         3G0Q==
X-Forwarded-Encrypted: i=1; AKwUvBzJw84CuiYd0kx1k20s/fQmJVo49omX/bhlCH+umODh81z60c1+dW9v2tIsI4W5ar0y/WbB2GGFmNk=@lists.linux.dev
X-Gm-Message-State: AFuF++ls1aLuoOmi+OSYPEOgrgOHh8pUc3g3g6Pdax0LPc/20JO2vC8N
	DZw9XWaqCDt4tEXrMzKdDkTWXQSqsEYnmbxZ6S8gFyzbgveTRSyPeBgs
X-Gm-Gg: AYBFou0ggPCCBLgvtYoSO14x08VKp3T8gFZrq8THVDFzA/GTRuBZp1Izjesz+0wqDZA
	TRz71kSGFZ8IorO9XPZT7lPc2nP0igvxlM5saCJWPLWFrk3S0TUF07REReqx/UQnTJgxvysDk8X
	Xw8grGaEJnG/q5m4LEhgWkx+QEJsDfMvYK5MvDv5ZGZoFQmky/5+tE36ulku64/gTYktvK6dpie
	uCeGdmZvwQMAmP5fHuzYxrb1n+oQeT+uY9tCnC5L00r2tYlSwm3AOMB0WhXoz7s4hZJOow3RAJn
	UXgMYwnqwTVtT1+sdWZ98FdsylJghG2BIE+TZrtrtOz7GRQgYPgDE2fa+Vs8tddSSDwTEKt7Uo2
	eOI8QebkkyhfrtyTxidAV9BvrGLIucwPPdnfgn3MgKgGuNkUsjpzFlJJM8tG5+u8TKjIBPA1uDn
	EKVDUfhI9W2Y3akXQNWK6s8f2/GcudlhdbgKtqL9d7/u2Bhwwxs/1jOsbiRR7q8qDVUNg3bQigl
	/CQWe1+ORc=
X-Received: by 2002:a05:6a00:4f83:b0:857:72f8:dc99 with SMTP id d2e1a72fcca58-85ed8fd714cmr4354975b3a.26.1788334396619;
        Wed, 02 Sep 2026 00:33:16 -0700 (PDT)
Received: from intel.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-85db2adcbedsm926914b3a.20.2026.09.02.00.33.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 00:33:14 -0700 (PDT)
From: Wandun Chen <chenwandun1@gmail.com>
To: catalin.marinas@arm.com,
	will@kernel.org,
	chenhuacai@kernel.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	robh@kernel.org,
	saravanak@kernel.org,
	akpm@linux-foundation.org,
	baoquan.he@linux.dev,
	rppt@kernel.org,
	pasha.tatashin@soleen.com,
	pratyush@kernel.org,
	m.szyprowski@samsung.com
Cc: mark.rutland@arm.com,
	kernel@xen0n.name,
	alex@ghiti.fr,
	hpa@zytor.com,
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
Subject: [PATCH v6 08/10] of: reserved_mem: mark /reserved-memory entries with MEMBLOCK_NODUMP
Date: Wed,  2 Sep 2026 15:31:14 +0800
Message-ID: <20260902073116.802752-9-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260902073116.802752-1-chenwandun1@gmail.com>
References: <20260902073116.802752-1-chenwandun1@gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wandun Chen <chenwandun@lixiang.com>

Mark non-dumpable reserved-memory regions with MEMBLOCK_NODUMP so
kdump can omit them from the vmcore.

The marking is guarded by CONFIG_CRASH_DUMP so non-kdump kernels do not
pay the cost of splitting memblock.memory entries at NODUMP boundaries.

Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
Tested-by: Meijing Zhao <zhaomeijing@lixiang.com>
---
 drivers/of/fdt.c             |  1 +
 drivers/of/of_private.h      |  1 +
 drivers/of/of_reserved_mem.c | 15 +++++++++++++++
 3 files changed, 17 insertions(+)

diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index a64afc3ded3d..286fd4db6312 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -1285,6 +1285,7 @@ void __init unflatten_device_tree(void)
 
 	/* Save the statically-placed regions in the reserved_mem array */
 	fdt_scan_reserved_mem_late();
+	fdt_mark_reserve_mem_nodump();
 
 	/* Populate an empty root node when bootloader doesn't provide one */
 	if (!fdt) {
diff --git a/drivers/of/of_private.h b/drivers/of/of_private.h
index 0ae16da066e2..505735732c13 100644
--- a/drivers/of/of_private.h
+++ b/drivers/of/of_private.h
@@ -187,6 +187,7 @@ static inline struct device_node *__of_get_dma_parent(const struct device_node *
 
 int fdt_scan_reserved_mem(void);
 void __init fdt_scan_reserved_mem_late(void);
+void __init fdt_mark_reserve_mem_nodump(void);
 
 bool of_fdt_device_is_available(const void *blob, unsigned long node);
 
diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
index 8c9d6395d6a3..f29a07e8fb23 100644
--- a/drivers/of/of_reserved_mem.c
+++ b/drivers/of/of_reserved_mem.c
@@ -677,6 +677,21 @@ static void __init fdt_init_reserved_mem_node(unsigned long node, const char *un
 	reserved_mem_count++;
 }
 
+void __init fdt_mark_reserve_mem_nodump(void)
+{
+	struct reserved_mem *rmem;
+	int i;
+
+	if (!IS_ENABLED(CONFIG_CRASH_DUMP))
+		return;
+
+	for (i = 0; i < reserved_mem_count; i++) {
+		rmem = &reserved_mem[i];
+		if (rmem->size && !rmem->dumpable)
+			memblock_mark_nodump(rmem->base, rmem->size);
+	}
+}
+
 struct rmem_assigned_device {
 	struct device *dev;
 	struct reserved_mem *rmem;
-- 
2.43.0

