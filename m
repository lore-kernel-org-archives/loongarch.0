Received: from mail-pz2-f1.google.com (mail-pz2-f1.google.com [74.125.228.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35D7F4398E6
	for <loongarch@lists.linux.dev>; Thu,  6 Aug 2026 09:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786008966; cv=none; b=QW5Xk0sv97R7vWO5RGmw68Xkgb5fImeeGrrj9s+avhNkrAVWzfvMm6JYuhqjrES3fv2kfQk1qMZS8K6YYGJOBn9sDYiAPfcf6uKGQiDXtp8NdF8W9Uwo3kEz9aZMFy49chySXAHq1+E4VzTUkvzDJQPSwd7pTneHcd8xhi5e3DI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786008966; c=relaxed/simple;
	bh=lZf+l4j/Q4ThP9Eu+M5Jyz5exYGOi//i+2xKo39QXs0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DIlLxBYq2vkytJUlMOtK5XEjMsT196nag5evdVxnPi1dop73Zq01/ZOICjqGo2Z6BAqlTEwDJ8L8B9fwgmoo/KvMpDZbqEUr5qqpSbe10iK+Aha++NvfTFH9ruL8ua5PJvVwUMS6xjW/EFtXifryOWmZ28YKOinGkEreKbnhdnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fTB2Rgw9; arc=none smtp.client-ip=74.125.228.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fTB2Rgw9"
Received: by mail-pz2-f1.google.com with SMTP id 41be03b00d2f7-ca034c989e2so1034760a12.0
        for <loongarch@lists.linux.dev>; Thu, 06 Aug 2026 02:36:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786008960; x=1786613760; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=knTPycIW4JC9RtVxI7lTQdVb1SJbys3U0akygREf/j8=;
        b=fTB2Rgw92zwKcM6WsYXUCcWbbatzYatis7uWYnzwhgHxpnFQ6nMVKOTpsWxVJxtKtH
         npi8C6PrE8N2K/HrhQQppkErHzSHZpa3rklv373xslSzixrugxn0kWz0nR9xXLvk3Den
         +RbTPyDHa5S6nDc2aZeCUD3YacIk8ZxEiLyArDQvfdBsJthd65xq+JHkxjIZLiBdyZhY
         MVesaK0lHfIGg/CwgAjerjMkxBj8S51VvbSEr8Wcrj/gwkUfg9GDjeNSH0SqxuQSDV1J
         Wd+Pbxi+rMAVyY9YENKh6n/PkOaXz0jFXThCRvmdZ9MmdeDbE+EGy1Kaan+0GWs65bx2
         5dYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786008960; x=1786613760;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=knTPycIW4JC9RtVxI7lTQdVb1SJbys3U0akygREf/j8=;
        b=MdAVmSn7NEzI9Wph8VkZBID0WQXJA3GCVBotSi0q/c3q4GvwSlOCQBRANQq9KVND+I
         78/lkBf6I5XOqfaVilXsyLAl/5dpLo7zfE1ycwLvGslQU44JIaz8CQwzM6N7QMen5iAQ
         Vd4ykJYff1As29Ql+2wbEMCIK9WuxaOJT7QKKF5Q6qnJUP1XITeRgCL79ucQewZ+JA/P
         yqDr74c9qHwyxNTQ+4w2hMomOLNoP6yYqhE+CJKffWvEbpXFoGnCX1/rjvv6tjp+7yMi
         DL27qjMGsbWNI+IHwutw+tMMCZasMmmQgQqgL8/T2ntjVrfzVRpEpKR3TFlej+9l6AOZ
         LHgw==
X-Forwarded-Encrypted: i=1; AHgh+RqVxvBUUA32+fBHXaKYap/dYPVny0XGFMXQT6/QzJ4ceupKKqC+5j2LzDTwnT3+yamWzPA9zDz58dI=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx290Tf4oqIfHoTrYoZiwy4b9Vr6a1vfc21q/ZNvd2umC0bnyXi
	fY+Y1l5bmcUIt7CifUxliKj9KeIAZty2PA6IVTz1C1hgfE1ZUtkMG1gr
X-Gm-Gg: AR+sD11rjmwL9CO5kYQwEqoajuc9gvrRsu8FLxl0+gXtqByhTArahUMWCxCrA4cg3UE
	g0UJ532QM6uVLPro9q6y8VhbJG3OhnNBAyvYfdwOZXIT4vzHuJP+NDeyMyc+MZXurungYYMe8je
	OkA7AKQd1F3NvyABwfFzNmNfIH4GseoC2xxBtz1DH6dDTfkerf+jOZ1q3y5cL9lgeONmSnU2N7R
	dwVKsmzV52KJjkPG1fZEH/a8QANNfBEWVwvTVyipr5dD5CGkXIqpkiYqeEr2AUAjdiuz/8kcc+W
	vbLEsWdGS9lM/pU3bTUI0bvCTfsVUyRPkjNwTj/fsvsVQTMnRqJ28o5A/SZeavmMY6tq//sVNI5
	GllPb3ifcWhllLudp7c9T5gKxLijbzdKf+K1QRp6woWIOiu4EMVl/UpMFPOoCSnYpZz/U/ftUKT
	GRQD2MhKDs9/BT5QY24CzsQIwnM9p8ZCpOUBxtrQmKLADP68QQp9DRDjXZXoNdKnyBm6dqlDIW5
	pk=
X-Received: by 2002:a05:6a00:2d8f:b0:848:7552:3d86 with SMTP id d2e1a72fcca58-84f2e009be7mr14478703b3a.23.1786008959699;
        Thu, 06 Aug 2026 02:35:59 -0700 (PDT)
Received: from intel.company.local ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f453b0aeasm1043878b3a.13.2026.08.06.02.35.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 02:35:59 -0700 (PDT)
From: Wandun Chen <chenwandun1@gmail.com>
To: catalin.marinas@arm.com,
	will@kernel.org,
	chenhuacai@kernel.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	robh@kernel.org,
	saravanak@kernel.org,
	rppt@kernel.org,
	baoquan.he@linux.dev,
	pasha.tatashin@soleen.com,
	pratyush@kernel.org,
	m.szyprowski@samsung.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-mm@kvack.org,
	kexec@lists.infradead.org,
	iommu@lists.linux.dev
Cc: kernel@xen0n.name,
	alex@ghiti.fr,
	akpm@linux-foundation.org,
	ruirui.yang@linux.dev,
	robin.murphy@arm.com
Subject: [PATCH v5 2/8] of: reserved_mem: add dumpable flag to opt-in vmcore
Date: Thu,  6 Aug 2026 17:35:13 +0800
Message-ID: <20260806093519.2907771-3-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260806093519.2907771-1-chenwandun1@gmail.com>
References: <20260806093519.2907771-1-chenwandun1@gmail.com>
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

