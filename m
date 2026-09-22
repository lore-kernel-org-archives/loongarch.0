Received: from mail-pj2-f11.google.com (mail-pj2-f11.google.com [74.125.227.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B4DD3FE35F
	for <loongarch@lists.linux.dev>; Tue, 22 Sep 2026 08:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790066711; cv=none; b=HILJGmMWMsjcuEidVuWjoGSTClftqpjKg5AyM5icDFRJH4SjJ5eih21jY0uMBJCXgIaSTA74OU/cDifTE+bQ78b7yIvOHXe4r/WyMOHiTUw4UdQ20kxb2UI2wZ+TVf0ztpcm93P4tCG9ws5hF1fokp3JV6ypfg5TzXR+NsbQAEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790066711; c=relaxed/simple;
	bh=HSqynHYwWyM3/AIAzPlw2zR5ssM3zxj+P+TMMRPO3o0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RbtKJSDIk3yLWrkK0rc/xdw76yZX3QXI/KfUNoBOvfvaVRPMiCxawXESITJUcLfdBrlrO09CaBaOVs5nDJOusoNWVGkxRxBI0qJgMSVwhksUW/ENgykdlCzNrawZcDWGqQgES2LrAILNuy3P/tGsVu3ELjuzwBffVWRIMw8KaGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cozxXqin; arc=none smtp.client-ip=74.125.227.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cozxXqin"
Received: by mail-pj2-f11.google.com with SMTP id 98e67ed59e1d1-39569e136f9so3160269a91.0
        for <loongarch@lists.linux.dev>; Tue, 22 Sep 2026 01:45:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790066708; x=1790671508; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xFj2nCVpKiIz+n9fFlODHsR1pKxI11t8bWPyNgAqBFI=;
        b=cozxXqinOFZ0k99g2Qsg/hufjCZLMEvlqlWzlntSipUpXB7uzuQBG8ZBJyn4PClkSW
         k64nm48BZSRkOnawOlXTlAE3z2ntpHYpNxim8EudeMFb9HaHhha5e7alN8WsAoNq8WVl
         pIQYaJljgNYyL8QFtjSBq7pCirnj7mL+cEZUu29c7bzgMhvPx7/QZNxz7A60k+z0m7F4
         CHfgM2S0J005IgF/9GLG1dJvPFeBn+Au+L4Z1lkVBsicmHJCXsSBrmlYjP7w3X5Mp9s+
         jJhaj3W6AfnPz+AlM3LgIBsWZeDUIredPVTdX6eSXhbpQGK1sJNSrN0OmG/lMeTpWhQI
         hRbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790066708; x=1790671508;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xFj2nCVpKiIz+n9fFlODHsR1pKxI11t8bWPyNgAqBFI=;
        b=XoN+fVR+tpkY9cWgsZapEYodWrn/3oulslfcUl9Y9gP7EbUlOrqTUYVje2nFhpEHEt
         A6UCoEL0BX8m2Uin8F7C5a3eeZWXYeXy0XkN4bq53boddUGgRDuW1zOXgaEOpl3n4pvA
         mUYZ2wq4dEH79EkGbyfGOcOJ2+a2RuOD2wQ4zSJMACON2a2z43qHfFraDmWC7WeA4flF
         1vwFkDwz1xyMGriNPEUlokNxTt4G/wWDdNNFO+wQUDJcXWeTLpqluPYi0i8C0H/mr1+e
         gr6XCFqLyVVgBUuYASIfb7oriWXAdNE9dNW/wr+0azai0nYST7PCJHB0MLTseVuAjSHM
         9OBQ==
X-Forwarded-Encrypted: i=1; AKwUvBwSrf70it7WaU4Ep8VI16SerbVymwri6E0tMgoV0QWQmYxaOAb21lj7nbAsCgeFsKwahV3noSgv2hA=@lists.linux.dev
X-Gm-Message-State: AFuF++nBUj/7gut1K1LVsL89ztIRu/hwrXcUHPCk9wEsOdoY8qYF3G4l
	4RRZSR+VmJibOAEcpY4B7x8mP8xzd+nnxlCBSbm1rFhltpIOORClc2WF
X-Gm-Gg: AYBFou1cKWQWGnvjSrH3eEaiw1cfQP8NeBqK7o3La4BXRwhV7WcnjpOlv3YOidnx5S/
	k1SdYQIYadPKKQMKXw+kyT8DdlISdFHj4v7r5p0kY0pKFuvw2F+gLUaKIPBbAb405XmF+5jVcxo
	ET6h506CNweBJMBKT4WZqxxwap1RBC/524h36GI8+uMT8ogoHLmtVBET3uKuNrQjl9c1dK1SfPL
	tTBAqjkAt/vpLclecR0fi2rCzPLOnYmZmf0Ytgizzd7Tx5fZCYyJVWyDaJ/PWjoOsO1zO/l6Xzj
	kgq/FSaZmXVt0QUGrytECJ+r1IsT4/qKWwISguquRvpsz5vH79cBhyNlM5fSzFhcV3h3Bym5fkb
	v9oOBRtiklMEtdiwzfhmyHpGrmaDXuGgB5mqmhiuJ/B3EBFtMuqseuzZ/GyUGciJge2ZCHeQJZb
	Z/6s3h1RaT3uJ+0Mfx4ZCA9+TX6W44sWYXYr7hTThUWH0+2FHsscMzTPkAU2eTp0zxnGfQJ1hCs
	utFU0y2CI5jTZafEzbqmA==
X-Received: by 2002:a17:90b:1d8c:b0:39d:f4fd:8075 with SMTP id 98e67ed59e1d1-3a073182cebmr486642a91.19.1790066708546;
        Tue, 22 Sep 2026 01:45:08 -0700 (PDT)
Received: from intel.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0674a5ae4sm3670016a91.12.2026.09.22.01.44.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 01:45:07 -0700 (PDT)
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
Subject: [PATCH v7 9/9] crash_core: skip MEMBLOCK_NODUMP regions when building vmcore ELF header
Date: Tue, 22 Sep 2026 16:42:56 +0800
Message-ID: <20260922084256.1515554-10-chenwandun1@gmail.com>
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

Reserve regions (for GPU, DSP, ...) carry no data useful for crash
analysis. Exclude MEMBLOCK_NODUMP regions from the vmcore ELF header to
reduce vmcore size and capture time. crash_should_skip_region() now also
returns true for MEMBLOCK_NODUMP.

Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
Tested-by: Meijing Zhao <zhaomeijing@lixiang.com>
Acked-by: Baoquan He <baoquan.he@linux.dev>
---
 kernel/crash_core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/crash_core.c b/kernel/crash_core.c
index c7acb2e449df..fdfeee5afa1a 100644
--- a/kernel/crash_core.c
+++ b/kernel/crash_core.c
@@ -270,10 +270,10 @@ int crash_prepare_elf64_headers(struct crash_mem *mem, int need_kernel_map,
 	return 0;
 }
 
-/* Exclude NOMAP regions from the vmcore. */
+/* Exclude NOMAP and NODUMP regions from the vmcore. */
 static bool crash_should_skip_region(struct memblock_region *reg)
 {
-	return memblock_is_nomap(reg);
+	return memblock_is_nomap(reg) || memblock_is_nodump(reg);
 }
 
 static struct crash_mem *alloc_cmem(unsigned int nr_ranges)
-- 
2.43.0

