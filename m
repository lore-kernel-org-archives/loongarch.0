Received: from mail-pj2-f7.google.com (mail-pj2-f7.google.com [74.125.227.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 800115304B3
	for <loongarch@lists.linux.dev>; Tue, 22 Sep 2026 08:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.135
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790066664; cv=none; b=M9uverZprFQja7mjKQa7NERYqLvBc8wptnQ4XUG7iFjNjQMbU18ackblQJ9X+Exjxgev79Gp6BnHFymF1nCEkUn2yF0hCUQySG0XlPqqDsbw7dAWROSYGWsaoZci73HUUA1M5HD8/gnIrmZiHasAyniYmTspUg5WfO3LNj+UR2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790066664; c=relaxed/simple;
	bh=xXXTEawloLm41fSAr5nA62b6IMDJx8mcRGgEviHUn7w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g9Ac1c0DPqcqxs1YS1Bx6zWGTr4gc8IiHd5ud2/evZTrsdFquWYN75l8Q0I1FXSEdeh4KcrMDMJRc1BLQ1Q7gOXkMDqaDDcdvidV3aMgnpk335kh9SG3poTYg8g45XsKGFeGh+81t/N7nrWfMKQE04h5QXKF+KWeC/T28Ki9ZH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LQREKB1S; arc=none smtp.client-ip=74.125.227.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LQREKB1S"
Received: by mail-pj2-f7.google.com with SMTP id 98e67ed59e1d1-398da2bdcb9so1798368a91.0
        for <loongarch@lists.linux.dev>; Tue, 22 Sep 2026 01:44:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790066662; x=1790671462; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S7DrDy5k1cF63oZDGZmuZpMhR9CRSHaszqjBOE8wOFU=;
        b=LQREKB1SW274lItQhO5h1pM6EkKGqcaFCNt2ZuxTbgH7ljWdi/wTorlCERTdBwDkTr
         +FlcBggitQTw843mhwN23xdhw73m2attKv+0LoKqEh/7fr+3ITGTL4LZr2EDXJao+Tjl
         ZxglqgERgftkvFNbeLjotFPG/FAJen5F693AQfcpmmxk3ysAwKLkziEJEtUYoLUaCDfa
         ft+jkw+tbTMRM0K4/aDQqYYhfE80uelFbTItp7rtIfVv08o4Bd43UjcdPvQOMc/mLVGm
         BOpde+WAcLcTZ9aAzExps2dkz9guuLznf+59V7cjI05VkphYqE0GlUU9H5hgHDyZt5Qk
         qLCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790066662; x=1790671462;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=S7DrDy5k1cF63oZDGZmuZpMhR9CRSHaszqjBOE8wOFU=;
        b=sPjt8cOCxvO/s+MxM6C0AX9KO696XHjyRY/bvltKj+70V66/R3hjPK52mOBaauz8DE
         CVylQRh7pw30F5taAcwpb0/YE9NAmVeO7EH8KGBbfzV2baerVK1BiCxcltqKCcMXlwCq
         fqsweh5LyeWTWhT4/yPFrq1eoC1R/XbGlozl7mMJsIiBYS6E80akTqviwLHERo9pCpRv
         py1JVvbfJ5IAesplp2/5L0oPLiHkJg1BX78F5YU4CYxipgcDs3k1/cXi9JqDBWx0g1JB
         y0OMg1JiEbgtpE0cjUXU+lBx54TOyMJNpIfkFZR0rpIE6qOAfYhywbKCC8DGXZjmgWj8
         0QVw==
X-Forwarded-Encrypted: i=1; AKwUvBzoXx5TT+iWisKGCVOwBU+33jKLnyeftGczqM8iT+xNzCggCsMaKLpN+5qfpeHqBJONeoLbKbHfu2M=@lists.linux.dev
X-Gm-Message-State: AFuF++m+ABWuigSCsK5el7SzGb4xuZcGuvp2r6Nlrnjyx5vjyXvTDfB4
	at9Kcew58p/LN3x9b4X4LbRFwZRk+3xW+ajzSZ55znC6lzh1r5SgAoZX
X-Gm-Gg: AYBFou3DZq7czR7zdmQK5d4CmVTGg+IxqpKb8sHAlTuRHRdJy8f5QetfpsnyuQKHcWn
	q7XFsQGNNsoKYWiaAM4alS5imIDk6tLZra/3VHkLs6j2TUsAp9zts16iguFDfZr+oB/L2oe+6ij
	5znbUMoR0VnI6snuteCTTpslDPXs0u2iR1fGF8YrGnG7nM4DnEyGqkNgMGunun92YxjeJolTke6
	JNzcxcez/Bt2V5N8IntE91cJnV26OQ7BSqTrlPwErEwBNDeC5OmObud5x2yrmxTRmRDV7VlXXHh
	haI/TlVumS20nfsPG0zEVTYM5ZVY7s2Bt3Cj5BoDa9g0ih7z4SVbBlLPx+kNvYXP6jE/63Qo7CM
	mF8NEnJa1LSHm7LqT5mmRK6xWXpxjek70/4xvmSKWLYzLTMiWvg6ulb56gLbmAMGDIOqDMnGi66
	ANszRsqEmS1k053HMHf4Hs9ogELjrqqPnUFfyXqdOkV64YGw6uQ8jLhF6Fx11S1G26NknDpJJfn
	TYM8YyykaU=
X-Received: by 2002:a17:90b:2ccb:b0:39e:6a81:c921 with SMTP id 98e67ed59e1d1-3a0731e1df7mr452432a91.20.1790066661956;
        Tue, 22 Sep 2026 01:44:21 -0700 (PDT)
Received: from intel.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0674a5ae4sm3670016a91.12.2026.09.22.01.44.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 01:44:21 -0700 (PDT)
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
Subject: [PATCH v7 6/9] of: reserved_mem: add dumpable flag to opt-in vmcore
Date: Tue, 22 Sep 2026 16:42:53 +0800
Message-ID: <20260922084256.1515554-7-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260922084256.1515554-1-chenwandun1@gmail.com>
References: <20260922084256.1515554-1-chenwandun1@gmail.com>
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

