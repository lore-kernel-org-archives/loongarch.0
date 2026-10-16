Received: from mail-pz2-f2.google.com (mail-pz2-f2.google.com [74.125.228.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 762B73B1022
	for <loongarch@lists.linux.dev>; Fri, 16 Oct 2026 06:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792131444; cv=none; b=o+mK7ayD6X7EJ/+jCJblY9NvsKuecdsdUAXeq2xzw3ZB+c01IyeV11peACp42R3LJqIDVdaKzXEXBoWHTGWOL92LOC26Ka+RbqW7tgwQgtEszN7W/SgHwpPmddNWGyeJ3wNKF2GByyZ1vYhVq9/8yXioyEq1Ike9KO0smgPxxp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792131444; c=relaxed/simple;
	bh=KS2Sad4txxYAPU7Ulhsill0lGwhrig2221eGQ+9zjh4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bnplwfJgnm5rRl5w3tCDeUGMvIROT+94jiK2L7hOFZ8klAgNSsCoEuHA0DmVLupDmD/DKKc3otCNQFKn4lXjSv7AzfzJJCYAX8DRN04oeLvPCRk2lAjevGTQDfL9s0KGuBtB0xyeUe3LCnjxibbx5UmyjrOnzy7vq1lk+i8nbKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ljbJtgYW; arc=none smtp.client-ip=74.125.228.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ljbJtgYW"
Received: by mail-pz2-f2.google.com with SMTP id 41be03b00d2f7-ccc451ef3a7so604509a12.1
        for <loongarch@lists.linux.dev>; Thu, 15 Oct 2026 23:17:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792131441; x=1792736241; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EXuyqgfiF9x7HO7+fbFxeGIrd5nFUV6QECR0sZa4nrg=;
        b=ljbJtgYWw1zwOG9bRbECcUOXEtINAAsqlcSTCSaXWCxxt5j8/rjC1/XphOiQ3FCdYZ
         n3Yv082A846IESO6rTx1FQvNAZQQ+JQMnp1WwrMRZ1BLjdvmA0+Wkt0NbwMbWXniEmcz
         vQq11xIwWOJGTM3qmK49VUC8fOE+Afz12NPN6PnOp3l52pH44irv+dPuU2qI9bUerMHM
         uq4xQViNJVgAF6c2qhR1AWygeYQX3gdzYskQGhCMrHeYfc5i2WPYMi8buvC4097bpTJc
         /NBLv91R7rPRJFaXUztQlFT+vq1b1h1WbGmMpwdBXKf/OaNQAa9YvIWxu5v3EKjHP8G1
         eFSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792131441; x=1792736241;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EXuyqgfiF9x7HO7+fbFxeGIrd5nFUV6QECR0sZa4nrg=;
        b=gYHOgiKGDmIwLG+YX+JoDDoJ5zD0z3lXGfSvlDFQXMS9sC7psW+p29HV1WoR+Mziax
         Q2p3df4oSXDZqndQ+YOQDPWJxM0UcUaSMgbQT+bPNfo1E5n3EBLMeOIqYhRUQ9wXOsk3
         6STUa/ZsJTGx9gjJFXbz2R4kUWgeeu3vE1XXNQSoM0aGFpRsXC/qdk9Wvt7bLwuWEBM7
         TgL3nUJbAEV3pj1cB7lYfpnxH/sn7D2L5HISgbl0OEw6lAn9H9WWYw6nn8qujnq0/fOj
         A5TWAGU++lw4cBkT2iDdzrkiosAzKfKeR7JhQPCHZNXIJ7grIw7GzSJ4HohCX4AUVmV8
         TY0g==
X-Forwarded-Encrypted: i=1; AKwUvBw6fIVxiLnD42+Zd0DChp4xc8hk9z8HHOOucVKeZqZUL0ddDgPcW0zN6NjXdLBQkgLhbzbAiKeKlDk=@lists.linux.dev
X-Gm-Message-State: AFq9FYIuaxam17bjWAPYi5g0qYwtKRy65dh+MB5Px/qhQMH21kXc8meg
	SaQHfriw7n49R3zboC9OuS9POXAz12f2VBiRDRkt68HBy4eg1gdF9Kw5
X-Gm-Gg: AYBFou1noudHqofhQY4DlBKuWb7T2rFeBkC9bznXDNiksbQ4SocXUKYsK6sE2Vc2G7i
	rySu8/PjZ95oncBpFKevjky8yBrsABQZlGl/A5A+Ald58XfY3GfsRyZ8dNJygccWlzKn04nJnT5
	YYRS0AGwhXvXQQjP2lknCDZEkkXMvDWTPTKVrXNJhF1EEKjTZTgSMGWEWNpjyQLIEijkE3WVcE/
	SHBsVxSNf54VVkYFv3+bbt8kOg140cMyucMWeyoAWCuvYlBg6+Yux3IIqdlsx9Y2+m7OQFEDUdy
	4FlyJE+/t5W6FvbtZHjqQn1X9lBEsCqffTlM/c+FuszGzmOCrz7pWjFfMThB2PzdV31GqdrFMJ0
	UVkDqbPgDxzbbtJIku5gvV6bNUl9LhcFaYBwyq3V7VBi4icxLffpD+qM1/KZ/hLD6by2MXh5x/Y
	ojTsk0w5ip3y/b3c+8ti8tZNBjSF3UkhUMFVgMhau3oT+xjNkj1FoBwEEbBDDLai4E/ToIgTE52
	lMEni4LYaFhFBLwibsrPA==
X-Received: by 2002:a05:6a21:1f8a:b0:3de:14ad:ae8a with SMTP id adf61e73a8af0-3e1d04198a7mr7196697637.16.1792131440647;
        Thu, 15 Oct 2026 23:17:20 -0700 (PDT)
Received: from intel.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89f57b334e6sm586375b3a.42.2026.10.15.23.17.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 23:17:20 -0700 (PDT)
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
Subject: [RESEND PATCH v8 6/8] of: reserved_mem: add dumpable flag to opt-in vmcore
Date: Fri, 16 Oct 2026 14:15:47 +0800
Message-ID: <20261016061549.4181390-7-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261016061549.4181390-1-chenwandun1@gmail.com>
References: <20261016061549.4181390-1-chenwandun1@gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
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

