Received: from mail-pj2-f11.google.com (mail-pj2-f11.google.com [74.125.227.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA1F639B4AF
	for <loongarch@lists.linux.dev>; Fri, 16 Oct 2026 03:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792120230; cv=none; b=uMJR21LEL3GUXhovsK11QMIQQH/SlwrFPmxU5ZnyFF9IzLdK047I7nFwNNyKvIPAYkBuzGFOkYLvX4Ous1hOmFldx8hSs6/7cURDmH3fXCeuoBrImu7hXLuKftpF6mpTgLq+H5TJ/xyLiRmQVYsUryQJBs9Mu294DWzAKlK7eZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792120230; c=relaxed/simple;
	bh=KS2Sad4txxYAPU7Ulhsill0lGwhrig2221eGQ+9zjh4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f8p8JhLYJaUzswpV1BtOpZPK2KRQMrgWc7HwhO2sM1pWS0PdOjWkui3LMfb6kACIl//nt9tlJ89FtRNCkfWCud+3TiRrO8ZI7RXRT7+MZaW6FNMHd4zb8ZgJ9WTfOC8zZOUl4myLtJexG9laqDXbpHCNcVDLq8b6H+QJE/hES8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A6ujxF6Z; arc=none smtp.client-ip=74.125.227.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A6ujxF6Z"
Received: by mail-pj2-f11.google.com with SMTP id 98e67ed59e1d1-3a0aa5e2b20so1652521a91.1
        for <loongarch@lists.linux.dev>; Thu, 15 Oct 2026 20:10:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792120228; x=1792725028; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EXuyqgfiF9x7HO7+fbFxeGIrd5nFUV6QECR0sZa4nrg=;
        b=A6ujxF6Z3bNXVcV1DNCuJQyIZ6GZlVtPnR9W6jg4PuJXf7oZPoykfFO2iI/ZlCm9oF
         vqyiTUvbuFw6zPCfbR0i9ENg2qJ6QVv8tGEH3KyvwONvWXJ3teyid0IstdSbk94pWtzx
         e2mLpY+7dxZQKe+cW7gcU4tayL6doIPhkrJybKHdj1vQ5uu8aOBWdF31YmHJX+zTe5oD
         dsY09O7hzOghV7Vd94KXDV+3BgJ7ZFZS8vdnVF0oD1MN3do53v/XtdXBDaPOEDxqssC1
         Hknr+m34OD78zdRYYGmTBv6xA+5OBmc99qbf5WussS6kOoKa20i/KF2FhX8ScPrjdKO5
         EpLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792120228; x=1792725028;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EXuyqgfiF9x7HO7+fbFxeGIrd5nFUV6QECR0sZa4nrg=;
        b=OhbqaWlE81H7zO5+UcoMV0226siNLLDNLgucXcqUFzTXf2uESzheRkKL4Zh8JQW6UE
         1+9wxYcl7DtJ2y38t/3A3pk4loCe8L9iULIP1PYlEzJojyhk9ofXPsk+5P9t1CBPrXEM
         c7vxg+5PN0vE1O11AxGCYFj01TkExvfot9rj2nAf1hNrLagVxGyC2BoKGJBhwnaAPeYf
         +I5rSUrzse8+OAPGBN0I8jXZNWVxcxfWByk61MyoK4aWGEBMRlWSj5XNjnTdOdBBhLW7
         VunLczwrKdmNfG7dY2qMTIgyMXMxdL2OIoXuiZ1GksumgyVBYpqTj11ZyHLC3wliqv3o
         ZnwA==
X-Forwarded-Encrypted: i=1; AKwUvBxUH2oLN4IRnlEPj0P4rztRO8R0329JBSSx/VupChJwDa4fvD+lvnwekT7/kRRF11hBoP7W8aYBMs0=@lists.linux.dev
X-Gm-Message-State: AFq9FYJAyg0c9pVwX5Mw9SSOvJAGdZIHDb8y+W8x+zSYVIOQOxUapPnV
	EmEXrNBMNmBx4lwLkuPge9kXAyqEzfAE0j9zgS99Yj+p4B6iA0esrgs1
X-Gm-Gg: AYBFou3/fXi/YIODJiN/FoLL8bbBLQjE8w4H3b0tJ8dGMFcew83QOMj0ih7I/J8PCLz
	os1VKT7xerRw8Z5iUagT3lphZbW+S+Cjf0+g4/rX4ieWvuuoX4g5ZsHKUyWUwjRzHvNUbqsQnX7
	CAHa2JOoIq1NDTW3OBzGKz6Oyi/9JN4pGChITDLlnAtx3M8bi57Z+6JUfQR1CWE6QfHM1dJo7zn
	pXLuT0oGV5vRF+ZH+rx3aFEpfnM/noAKZG9TVhfELWLjqNET3dTKVTIWYgBds2gNC+7EmNNsdqT
	zsVMjXRYkRfO6lYv+53yY45t9KCl+6gtAXF/qeDzjHH869dFtPvTyyU3BeJC4racRldl2Kb3nlM
	ArAuXB5rJjEMaeHLjyTE2YMOsdNAR6kPidN0R075eFR5lmj7MkvR0R/8VQVMODKcIoOrGODL/rm
	zw4VOgyq79MijgCOURHhr+q2izDonuVzKYXwc74YVaCGce98lTYqtJww5AocdoN+rZlpI+lmLm2
	DOnYBi7JAp9/rUkAVMOYQ==
X-Received: by 2002:a17:90b:2d86:b0:3a7:d2b5:2e99 with SMTP id 98e67ed59e1d1-3ab3a60d1eamr16967413a91.20.1792120228159;
        Thu, 15 Oct 2026 20:10:28 -0700 (PDT)
Received: from intel.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acd3cc73c7sm370085a91.4.2026.10.15.20.10.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 20:10:27 -0700 (PDT)
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
Subject: [PATCH v8 6/8] of: reserved_mem: add dumpable flag to opt-in vmcore
Date: Fri, 16 Oct 2026 11:08:53 +0800
Message-ID: <20261016030855.4062882-7-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261016030855.4062882-1-chenwandun1@gmail.com>
References: <20261016030855.4062882-1-chenwandun1@gmail.com>
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

