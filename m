Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.196
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792571488;
	b=P2ED/+wikDG2bNwk8SZd4G0P4mQizDnqnOdlFvImMRcZrHWJ82Ej5H2PZn2wb7s2dGZD
	 E9HUvOBA8bskln29qs+b0tLDJqxKzEONoizZqdudIoedh/vupkeRw18aunfT0sbn1g6RH
	 pjroNBIpkFYOK8t2I19Db86vAqAopTvKwwqMEn/ui9nHUy96pYOoH58e/7J0RtMOYB8TS
	 cD4wbJGRpj86kJs5FBqLter7Wpj1fHCQ3kq8L1EBymaud+ULUNB2sMihSDIdzN6Dcs0W8
	 yxdiMF4HEbV+HIweOfC3JI3UPQ256Tfq4oAIHWTlnONJvMydmoz6X3hCkoH+7gJqJBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792571488;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=s7Fb6KtcWAXnUfcecLaSQ1H6J8YKvEJFUWN8A6hcpOc=;
	b=cCwAX4ykTKX8dyT8s6+bqM21in2caRh0vuXxIlH+AIjHnDBgPT11bRQ840Vcim9CgmdO
	 rxuxLOeZ5InFCVEi5vLLSU8mUwhQ5J7avt/Qmr+X0Q6ihhx5AyN8OWdgjmpjgzAzNnEbP
	 2Xu06MW6r2RNoZbF4vz+8f+e9GP3+8vCxomE6eQObaqduwoeHIf5iSiL9aBRZW5OfVYlw
	 5BTLHlPqtX4hIYZFqkoAXHoOlzgUHGMCTJ3o9oUPCFgHzhTci3/bd70SXOIdaZM2bGl3R
	 uJiqqZFKAUfldWDrTI0fXIQQAU0yY0012oSLQLM42D52Ykgsu1741DAYBMXDBFGoeTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="NcT05yD/";
	arc=none smtp.remote-ip=209.85.210.196
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com [209.85.210.196])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1830606A31D
	for <loongarch@lists.linux.dev>; Wed, 21 Oct 2026 08:31:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1830606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=NcT05yD/
Received: by mail-pf1-f196.google.com with SMTP id d2e1a72fcca58-8a0880a46e7so260410b3a.1
        for <loongarch@lists.linux.dev>; Wed, 21 Oct 2026 01:31:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792571487; x=1793176287; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s7Fb6KtcWAXnUfcecLaSQ1H6J8YKvEJFUWN8A6hcpOc=;
        b=NcT05yD/mGb6Ui3oGWlW+PZYbAUfFXMBR4BmzYxWEJU2iYSt1s0wG5Z727ldVeUkxz
         hP8rzXpHMiFDnx9xN0X5i7qJls2yM/8HYVQRBwaJSxZikrArXvSpJSZxdqJh2K+UamFu
         8DalDx0gaqwpvD1pNlY/axfTf5qTNftzzJNFWmuRWSaXeycTUHyVfWF2zIv+JkRujRJc
         C4tLRYa6Wpxld0e4BsumdSeYA8ZwCkDPqqE47yj2WPQfKmYhL+aRec0P/883P/bf5iDE
         pXZE15po/ROvcj1VONPtP7Tka1GoGeZPw6j/AoeyjYOKyNiihuwmn+iVZNsBHLY4mXE5
         j9qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792571487; x=1793176287;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=s7Fb6KtcWAXnUfcecLaSQ1H6J8YKvEJFUWN8A6hcpOc=;
        b=KMwMXHSq7HS//zR9O2/9ywe4SzKxNF+Sj/1JLxmXpM39x1FyOCmEL1RNZyL1QVVmSo
         BM5jGPeCzdaLnRFCV9wFEJ3u2W2k6JiPZSEMyTFI4gzWq/EvURqG5X1CUlO0USEFBLeR
         P0bEYYEeWay5nTVW6bSORrGV825vnCwdWM1OI76DDg8W0C8+srMPrcT8NO/V3UVhPye/
         wu9uVOj3OpAwcS//DNQ08QgSscHhm4qYNXXRr1hBbAvL8X/7Ib159m+zUtxXLhSTuywa
         B46PfEkr5h7beIkEuD3wL6F+Rouq2kzTSaWtIDZv+7xwpnlwklQAlKN26dxr93uaydHa
         deCw==
X-Forwarded-Encrypted: i=1; AKwUvByXdbdYnkLSWK2vrF3JPkIkSjj4EbxvRbMTKxtwHEbjtYhr2EBP6qJQTXU6Id/RY65WfwCsVrSVcy0=@lists.linux.dev
X-Gm-Message-State: AFq9FYKRM0zZmWmjuCryJ+TTOcHHbHi9Xp5Rv2fa64uaq8m2FjKzIJ2l
	KhtJWLsxtLpx2I+v64bpqzfgfBjD+sH5A0PKeFiEwuWYE1AqgGrjN+x/
X-Gm-Gg: AYBFou2tLkHXvPHuRdFF1AV0KIdF2Ox9Njuw7ewtPz2Ob0/QpaKCXc6BIylgmY2rQ2m
	lNtXJ44ianvkbcUdozYMv4QZXx43ol/DPoWYegZBm6Gei8/mT+k/KAIqytoxm8PUxAzs3cYaDTD
	NEBxVlD9p9i6JFe5P+EBiyqqI2W0DI43Q/eetL2rmmBcYlmaZTqPJ9qVrQDXd7lzrArZvkVDUVD
	V49yGz+Gj/KEZENK4RDL4rDSgkdGUYTdpHFcpy5ufRa/P2jKePxOmOQGuYToSG0ap+cyYTdQFWV
	PvmvLBbcXlxYefZmnT+XjgrZClW1CjNhiiC8Zv0Tmukr6miIJKb/NaiJZmf9ZaCnjKy6g0UJwp1
	Lq5k0nACmxWsC/gPkSsTHeh1KpaacXXFcr+8IngaTSpL8m1PyeNToNIeipd4WV/vBLRj2gd51af
	frfX1nT0P1Fh8UjtoHzI3rBeck4Lq+vFyDg4z3Lu8afE1CFmUwMDqRKbzzqUcU+MWsxiT7yPBdu
	YCPEyWp5M8DQzkzkJlvmU/zfms5+YMwNx7efSEaMRkeAuoAwz4c7XwDaCncde73PjuRRDeKx1lB
	YFoSUw8kek2Gag==
X-Received: by 2002:a05:6a00:2e1e:b0:8a0:4d37:660d with SMTP id d2e1a72fcca58-8a07bf67824mr2764848b3a.2.1792571486193;
        Wed, 21 Oct 2026 01:31:26 -0700 (PDT)
Received: from intel.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a0895e273bsm600653b3a.41.2026.10.21.01.31.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 01:31:25 -0700 (PDT)
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
Subject: [PATCH v9 4/8] crash_core: replace for_each_mem_range() with for_each_mem_region()
Date: Wed, 21 Oct 2026 16:30:07 +0800
Message-ID: <20261021083011.2170525-5-chenwandun1@gmail.com>
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

for_each_mem_range() skips MEMBLOCK_NOMAP regions implicitly. Switch the
weak defaults to for_each_mem_region(), which exposes struct
memblock_region and per-region flags, and filter NOMAP regions explicitly
via the new crash_should_skip_region() helper. This prepares for a
subsequent patch to extend the skip filter.

No functional change.

Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
Tested-by: Meijing Zhao <zhaomeijing@lixiang.com>
Acked-by: Baoquan He <baoquan.he@linux.dev>
---
 kernel/crash_core.c | 25 +++++++++++++++++--------
 1 file changed, 17 insertions(+), 8 deletions(-)

diff --git a/kernel/crash_core.c b/kernel/crash_core.c
index 8a861a946e26..e161c8b65e00 100644
--- a/kernel/crash_core.c
+++ b/kernel/crash_core.c
@@ -283,25 +283,34 @@ static struct crash_mem *alloc_cmem(unsigned int nr_ranges)
 }
 
 #ifdef CONFIG_ARCH_KEEP_MEMBLOCK
+/* Exclude NOMAP regions from the vmcore. */
+static bool crash_should_skip_region(struct memblock_region *reg)
+{
+	return memblock_is_nomap(reg);
+}
+
 unsigned int __weak arch_get_system_nr_ranges(void)
 {
 	unsigned int nr_ranges = 2 + crashk_cma_cnt; /* crashk_res + crashk_low_res, +CMA splits */
-	phys_addr_t start, end;
-	u64 i;
+	struct memblock_region *reg;
 
-	for_each_mem_range(i, &start, &end)
+	for_each_mem_region(reg) {
+		if (crash_should_skip_region(reg))
+			continue;
 		nr_ranges++;
+	}
 	return nr_ranges;
 }
 
 int __weak arch_crash_populate_cmem(struct crash_mem *cmem)
 {
-	phys_addr_t start, end;
-	u64 i;
+	struct memblock_region *reg;
 
-	for_each_mem_range(i, &start, &end) {
-		cmem->ranges[cmem->nr_ranges].start = start;
-		cmem->ranges[cmem->nr_ranges].end = end - 1;
+	for_each_mem_region(reg) {
+		if (crash_should_skip_region(reg))
+			continue;
+		cmem->ranges[cmem->nr_ranges].start = reg->base;
+		cmem->ranges[cmem->nr_ranges].end = reg->base + reg->size - 1;
 		cmem->nr_ranges++;
 	}
 	return 0;
-- 
2.43.0

