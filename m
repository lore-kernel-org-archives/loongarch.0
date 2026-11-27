Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.128
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795770539;
	b=xeTk2SVAz+ZfuMkBQfN9cNJ2vyBPWy5fOUU9/Fy6oTd1O1rbxZ1v1CDujKd2YWqE+/QP
	 MFijV/ikyl9kjjNarh3H5b72D4xNWIfVhRrBaaNqnico4hPFY7FwGOBJREKTBpQVObyHs
	 te7lrEMM7y5d5gU0n2tFZ2LAgE5MB5qRaOD51CPQ4nSlNvgYAt1e5g/z+xAq47AUeMw56
	 X50nyoBRWzFeij0QHEKrPSPjykI89fxySHt0yD3CDpZPqjhaAxHYSFFb8eiatZ5+pmI++
	 zdCWRLu0L/E1XFiAfbGuMRY5Fy0nsvwC5JOuiNBJ8IOB4i3mABwq/iTedX+nJI1j/Gw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795770539;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=dYWYab/i6KswA9jBoR7n0gUVHNmGP1kEM/igKErB1/4=;
	b=Ax153rLwH5N8R3u2VZgz5PPr2AM8WekUDcQ4zvA1UQGgq3rCn2gac7UPG26bUzGqqZMF
	 GFVv1OeuElljs9eCeJEddNCZemFxL9b8hAtMFQLST4NaHuP165VjDUL/0lMYIPn4HnUKz
	 5YiOYtZsuZIULD43Ydf/eKl+RTY7xdxTPIK98VlypuTl4WvT5/0lGWdaUXsKxDBa2t8YL
	 ZSE+SA/R8lA26EKo7SKmCCmtHcSj2Ctci28tqtY0vBGN2mRznn4jYI7OAwUjtUAbenvPP
	 QpBRoh0cOWE88y523128auv84Yq+iWCh/zqRUx1GQE/4KX2kobh34RNC8GBssykV2FQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="n/3zwDtn";
	arc=none smtp.remote-ip=74.125.227.128
Received: from mail-pj2-f0.google.com (mail-pj2-f0.google.com [74.125.227.128])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2120606A31E
	for <loongarch@lists.linux.dev>; Fri, 27 Nov 2026 09:08:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2120606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=n/3zwDtn
Received: by mail-pj2-f0.google.com with SMTP id 98e67ed59e1d1-3b094d5f1b4so1403147a91.0
        for <loongarch@lists.linux.dev>; Fri, 27 Nov 2026 01:08:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795770538; x=1796375338; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dYWYab/i6KswA9jBoR7n0gUVHNmGP1kEM/igKErB1/4=;
        b=n/3zwDtn11fbmIgvIxMkuNd5QeutSYqyB7isxJctZG3reX8wnRW1KBuNvpSGSO4GtG
         yO+xy26o6UozfnOdvnykiQPswO8Kvpsmk+OKOCdsb9PUkicIUfC5z0O3wty1ff/ZeXUR
         YBLvnSdJLIg1vBeNqhI3dmKSfhxooLdClkxTtNxF60lae/8cKVOmnU383ZPKlFxrDjDU
         PBtYXInqNjTyNomzIGR3GzhEK6ZYLCpJid9Weasfvu/i8K5kiQu5uRikEcFKm53m6+cL
         l9ADlErz+mzwWa5ZiyhCc5ULFZH6264qZbpfNU7Nj6BFiTBwNCNu1M9VAgb++v68sgqx
         ec+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795770538; x=1796375338;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dYWYab/i6KswA9jBoR7n0gUVHNmGP1kEM/igKErB1/4=;
        b=rXDhNUGxGT6fdKIg5oU71tIu5e2hK9s76ipmfpWyI0XGyhetQguNi9LYJ0o171l4cN
         EDl79MLiCISCz3dmifsOo7/FAsLBi/l0xWrRmBC7/bxQ7yqcq9tfttoQsmOBZXx32In4
         NwC+dX2zEO57Aw2Ebwqlw9w0qroqgJnIlVND3mE7ejeveIFZ2BqMiVfdTGV6Skiu08NN
         xGUX8QrA1/ycL5ESB3Ny2hXF+ul80e35LOTT6CdeU1XvRUV9yRomJ7ezCqMGOJxuCCMg
         BkxQPzq9QizXm36agzvjgPaJdRgEDXRdMTe02xjdNJ2CcQMFlp1duDS2j+JgKdNiS4nZ
         evPQ==
X-Forwarded-Encrypted: i=1; AL+hErGYxQHnR/d3VANWR0Dsn52zlD8jyYN8X1KEZ5TaURzF20HwaGPxLy4wHfwbE9cPL7c7e/24s8HZjRI=@lists.linux.dev
X-Gm-Message-State: APuU4Z/zFpZWx/7gXDYL3ewY0E2Snr75e/Tifp5oqCn9+D4ddWtVg+pK
	ENfaQKWrMqahDrYXqnotb1ujXi24X0zhvrLUQEL9TW0mjV0kZIbJZFeR
X-Gm-Gg: AZFdTZdo10um3XUMJhO5nXuczBuKXYYFtP06rfvERjpRMkeSYjKuaarfNUQUbdp0txS
	NmgkmZ2c+YVg5umW0YDXUSrOPn5V4opJPou9NbMgDPQ4ycB0l/5VZuerEl3B/ZiAIrKzOXo25p8
	MwfyribIcwEsRB9sXMJwcJORCPVnOd18PtVDBEgw/l9Z7K9ff/8/3grtBHynodhMNlVl1K680qZ
	mP/49X2cWzvtNGS7+lYOrjp6to1V98iMA4LvfqaW9fhoPnDF629suQnvWU5y3/H49ZEIFWZhRH5
	2yyBCYCe9UGvSoXsbWC5v7+/FJKgbh+EtncQBL6NfT70r+ZULtQmbxdgdkG1gESOz8/PlPytfe6
	wzRyqqVrLS+3KrU9CdoOmPchaE8hhabC4bie5jxCTm4NehFHCTGp+SeqhNIS3F7tx72wk9FKZfE
	l+cH9SnXLxd1mWHnNVNxFu8R7kPlIvOaZWcA60Gz92eViNfAlOudNr/I0dEdL18exTlIdtAbYUs
	EP5z6WyC+3U0RvW1y9W3DRBMDKF3tfRwM+G3J/jhcwE2RkHTNBZweMjHZwkH6pHcTZeGdQCVwzs
	B64p4YDFwShzedP2y1v9F+tp9dckSLCK3TCN/8/ow2Q=
X-Received: by 2002:a17:90b:3d92:b0:3b0:91ce:672e with SMTP id 98e67ed59e1d1-3b41c8dc8a3mr20396792a91.17.1795770538277;
        Fri, 27 Nov 2026 01:08:58 -0800 (PST)
Received: from intel.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6d06ee37sm11718725a12.28.2026.11.27.01.08.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 01:08:57 -0800 (PST)
From: Wandun Chen <chenwandun1@gmail.com>
To: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	robh@kernel.org,
	baoquan.he@linux.dev,
	rppt@kernel.org,
	m.szyprowski@samsung.com
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	mark.rutland@arm.com,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
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
	ruanjinjie@huawei.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	kexec@lists.infradead.org,
	linux-mm@kvack.org,
	iommu@lists.linux.dev
Subject: [PATCH v10 6/8] of: reserved_mem: add dumpable flag to opt-in vmcore
Date: Fri, 27 Nov 2026 17:07:21 +0800
Message-ID: <20261127090723.741253-7-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261127090723.741253-1-chenwandun1@gmail.com>
References: <20261127090723.741253-1-chenwandun1@gmail.com>
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
index 7a940d1815b6..caac366bcb66 100644
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
index 865d7cd2f0e1..ff92dfb09649 100644
--- a/kernel/dma/contiguous.c
+++ b/kernel/dma/contiguous.c
@@ -555,6 +555,7 @@ static int __init rmem_cma_setup(unsigned long node, struct reserved_mem *rmem)
 		dma_contiguous_default_area = cma;
 
 	rmem->priv = cma;
+	rmem->dumpable = true;
 
 	pr_info("Reserved memory: created CMA memory pool at %pa, size %ld MiB\n",
 		&rmem->base, (unsigned long)rmem->size / SZ_1M);
-- 
2.43.0

