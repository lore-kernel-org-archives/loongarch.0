Received: from mail-pz2-f8.google.com (mail-pz2-f8.google.com [74.125.228.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E4AF3E49D7
	for <loongarch@lists.linux.dev>; Wed,  2 Sep 2026 07:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788334384; cv=none; b=IgriSAntCrIaUYglpchQvXo56wppczaOh0km0dCUMlUl/pNw2TRGzYN/OPLUDzZ0kHcHxa11Akdksn+JTeG4Ph+K3nN2WVG4Q8iI1aH1WHx8Yu0kldiVg0Ops+KswCy9CQmzklpng54kDGP9TwtY15iXUDQXygxEckKE8lSUCHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788334384; c=relaxed/simple;
	bh=MwmyZtqdZD7M055LKAyuxJR4s3W7xYxs2ORY+R5rg40=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Uh895YUM6BtWV+9ht1jQc9HtH2Sru+2iEq06iQXn8mn69pMNX4enkrQ6fxDXCxxw/05Ee878iU6C9hb9/lVcURCfuNDwssusdTyTi1fNJy9RuHYEwRvbghULOazMhlQgwAiGFTcLQdbQn3Gdzh9xHdfx0ybjoPM5N7Jh+YqZvGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XoAMjfG0; arc=none smtp.client-ip=74.125.228.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XoAMjfG0"
Received: by mail-pz2-f8.google.com with SMTP id 41be03b00d2f7-cc2085ecd44so200886a12.1
        for <loongarch@lists.linux.dev>; Wed, 02 Sep 2026 00:33:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788334382; x=1788939182; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c+6c1mxNeRcK5OGJwTOV8Umz+CvUvEErlItanMxKc4I=;
        b=XoAMjfG03izLgUyJo7arAqAkNwXD04wQhVFv3xA7W09CzXvacV2krvKw6AvNjH4Zc9
         1/+/gkzZVZXnGZrNmrpW+DDXgvC2vupAejDFpEsKFw7iqzFi0Zi98kvJk/GbJSyH+Gpj
         akF88/V/Jvk/+2RzZQ/PpAx0+PckrAbG0ffPTIRKVBplCzCJa9dPbcycyaaEKOhGba2Y
         hM1nu5hldF02rh4CgHV/zb6/foEsmZanCZNrYwfi5QT/Zj7AjrfLKDdmTO48qk1bCkcT
         LNRAAsFB/sioaVagkFI+orLWzFCrHKrD05R4ib8BfhGvJwMfNFeS6XBkiUWuQNPGC+P8
         /Otg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788334382; x=1788939182;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=c+6c1mxNeRcK5OGJwTOV8Umz+CvUvEErlItanMxKc4I=;
        b=Id6QlF0BvqZxWGjKuspKTvZWF4JnSOKGPxTY9CZue+GAJJdl/UpIB22ktARwvxAmOJ
         GdKlBC+hlAKvmEg9w65zVepRTp3ufrHTK6G2Y5oATK3P1YobNKtj7+3qX7Q55QX+WURY
         mE5VYNSxdqq5motlhQcoqMlGOBdKSIIMW3Tz1kMag3CJKEBWC+/SIP1yRE7qdfMeIgv9
         1TGP/3bdTq8/rjsXmZoNWzfKQxRCqYZoD/xVj9TT142dL1mQ7NdpLIicWEJlwA4gpGNi
         i4f/zAhKM+VTYG5eac2kukODmVr8NiVZIKfrh02XK9/2jV3ymQqKk2u3dQpeKAklVkT/
         twgA==
X-Forwarded-Encrypted: i=1; AKwUvBy6aB2/Pw3fbDONY/4fsB6GhqgmBwq5mCFVMPKANWlumk5rrWRzDBoB+BnS279/gGJwVNyIwbf06fg=@lists.linux.dev
X-Gm-Message-State: AFuF++lMjkYrkQT9Ytr/KxhGZIJxvfrYfzz0FN70IYaIe22bQWk8fAl1
	x/dTjYE2LFa/Ew1rWd67JgteCtOCbruRTlpdsr7jz2aInbcJzMnMh7b4
X-Gm-Gg: AYBFou0uA9/5p9JjiIn7j7Vfyt7ubGrjbp0aG4Z1Wd2gYWn5cGO+/jM7B1KmJjE2Uln
	2Z6H4Di/yxUmadbVI9YSuzsUPNfbEhqvItLBHdWDPQuMHI3wYmnGuo0HhJ/eOhw8vpmNynwCoJ3
	l2AEjRvegnpFwKqhqKBtGd8xRr6uOmBQ4T6nRZ76rgkYMEPtr2bkxtIPbD07HXn/FvmWaJLAjAZ
	OUHxzW+SgqRcP8JoZ4vU8xyPRC/H7blFp9F5NBQ+STQ1iXIIgmGaLdNibQyLe8IwuBVj5pjUKOQ
	XfpjrG4ClQvQ4lnUC1W6i+ltGXhnubjf82GhyXNHB90yCcMZu04h65W6rN69HOzbLk865g22iaU
	xbS45aYGY5LLsme/4eT9v3rrafK1/kZXLjf281492PHIoJVI2aoKAnKDw8ISIU7eTCAFvoB9rJS
	WzadDAZ2aBmOgNNKxoJD3/SvhZLv8IB9P62qa8YSuQ0tqwsmUxi8VJ4+xYKBSkvct7rW6hg/4w
X-Received: by 2002:a05:6a00:330a:b0:857:74ae:ad76 with SMTP id d2e1a72fcca58-85ed4e09b6fmr5077449b3a.26.1788334382541;
        Wed, 02 Sep 2026 00:33:02 -0700 (PDT)
Received: from intel.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-85db2adcbedsm926914b3a.20.2026.09.02.00.32.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 00:33:02 -0700 (PDT)
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
Subject: [PATCH v6 07/10] of: reserved_mem: add dumpable flag to opt-in vmcore
Date: Wed,  2 Sep 2026 15:31:13 +0800
Message-ID: <20260902073116.802752-8-chenwandun1@gmail.com>
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

Add a 'dumpable' flag to struct reserved_mem to decide whether a
reserved area should be included in the kdump vmcore. Non-dumpable
regions are later marked MEMBLOCK_NODUMP;the filtering itself happens
in memblock, keeping the arch kdump code independent of the DT API.

Most reserved regions are owned by devices and do not contain data
useful for kernel crash analysis, so dumpable default to false.
Reusable CMA regions are different: their pages are handed back to the
buddy allocator and may contain key data for crash analysis, so set
dumpable to true in rmem_cma_setup().

The dumpable flag is also used to check /memreserve/ entries for overlap
with other dumpable regions.

Suggested-by: Rob Herring <robh@kernel.org>
Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
Tested-by: Meijing Zhao <zhaomeijing@lixiang.com>
Acked-by: Marek Szyprowski <m.szyprowski@samsung.com>
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
index 66093460584e..caa6a5c66bd0 100644
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

