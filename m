Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.132
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795770514;
	b=QJ7lbuwTcPI7ud6kUdOnsZGK9ftGm5e7Sb2yYZ3gal3Jx0wVZ6nnD30g7QbDqvxslipA
	 SZ99CkxP+AQ0/MGTs5MtY1m8TLcOVW5KVfEa3WfBkPHJWG6VeixiYBiT5xTckhrxi6eIM
	 I1ULDP1HdGnPbPyYW1r1d16e+vskOycz8TYA+rjBcAggpFwVNGzQnnjcIklOtgBfON+6I
	 HLDYNEcVhH+CJMSw5HO0MD7Y/K7+oTPf5BZraz1ag8K7OCKxtLEa1c5m4IHDjSVet10yX
	 /Vj4Y0+DQ9CPpinBto4Yqz9ASG+RJ7Ue+iBv4W5Hu0yYzLDtPNhBwyrZ/HPr8LhOwgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795770514;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=s7Fb6KtcWAXnUfcecLaSQ1H6J8YKvEJFUWN8A6hcpOc=;
	b=UPFD2Guo936oSaXzyIRn0QlYpvkqlgpX2WgrDenxVxB7c1w9/bTei4DSc6RZ6X2zpYfj
	 pRNeyPTZqj+Dhy2w8X9Sj9o2L2APUZETMaNfoPIuSM84qkRIgdRtsq8SNyimcotFvj+cs
	 Z69P4xgbVOD7Gumm1ZKYd1wmymCDTiokY61hEMyOLv3uMyDeEsVl3PToV67SLUFUUi96b
	 UB44O4uKh5sXGWfpeXXls/gJKh8rYMDsc8YvgI+rAKA2isTBMFFrVGthSazDjAyPd6Q99
	 VjUf8JfBrQX7ED7B4eBTmwb7wyzpQ4z85zcG9cIcF6E4wHa7AcGF+MmbnIQgHuvPw4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="sIjc/tEE";
	arc=none smtp.remote-ip=74.125.227.132
Received: from mail-pj2-f4.google.com (mail-pj2-f4.google.com [74.125.227.132])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8BEB606A31C
	for <loongarch@lists.linux.dev>; Fri, 27 Nov 2026 09:08:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8BEB606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sIjc/tEE
Received: by mail-pj2-f4.google.com with SMTP id 98e67ed59e1d1-3b426133d98so2053014a91.1
        for <loongarch@lists.linux.dev>; Fri, 27 Nov 2026 01:08:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795770513; x=1796375313; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s7Fb6KtcWAXnUfcecLaSQ1H6J8YKvEJFUWN8A6hcpOc=;
        b=sIjc/tEEj662XxjjsRQKQvmC3tPzWvwyAeT+EmE8US5ae6RPLhftHe5hHYKMDrUkwL
         Knvb/kHeQIUFB6q2Ofd4cmiwNooQ+poGzIp6bxFu+HR430/POPk2TSgcPvKuPYgcbhXE
         5JVEhGMatrymzu3/uSxHTcTO26nGsFxZrpfZNM0gA+88yUhIxXF5Cg2wbHI37b0uhWoo
         o2nkR9pLrSVIKsk+hUGFusa5dTfa1vzDf31Fybod/bYPMvYlxIkSOO0/L4Xqw2mx+66J
         R79v3tYgESwJNcT06LL7PzLsDfN8DNkNDajMeUxqSr3BiiOHJafk3wIh1afT6o72s8de
         kwaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795770513; x=1796375313;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=s7Fb6KtcWAXnUfcecLaSQ1H6J8YKvEJFUWN8A6hcpOc=;
        b=pCNpmHoZb+QLBjmk7DfNPHXLMxELclx5g/Q1wkciQch25HqPmI65bauYHhfyS6Tv4C
         Ta9nAgMfM8q0nyo4pyXzxqKC7uk8ZZQRWTiDOBV/JaCxxIQnDwzgf/e34aXrUvR7fRfb
         q5mRAMdj/D3lqY4JN+3efcHwM9suC4fhs6vVEwxGuwYyEcVq88XXmKZAAxCfty/4cQZO
         lqShkRw+8GhoPHaqvffwB8z4ZcGZ8x93CrNtHIiRYinwuG7u9UMRVKz06V6TJm5HPndx
         2wbyuMCl//LJebSBpUIAarEYTXkSEskduSXLN5EHKrt0TGFEDThZ+NuTRzrUuJApMb/w
         x+EQ==
X-Forwarded-Encrypted: i=1; AL+hErGf77a6jaJBu7xrlM4CW6Bz4L/Lqh/5XgPp68mBK10PpJ+/FiA7Cc/HnUm/69J7pwvWU5YbxKB4zSM=@lists.linux.dev
X-Gm-Message-State: APuU4Z9dkOEqdzbdKW51INxERnyUd2+f0DH0Sl+nTTvn/W0Hh5Gn9rfL
	xHbP6XWGA+TZVh/JZDcXR0HYRSspwWkvK+9lbhnaUGFRLtF/Xu3vpcnF
X-Gm-Gg: AZFdTZf4qzJJn0N8IXQFt8oFnyON/6OUcBOyYj9lzO63/H9pOp3OjIX1ZdYqolpFta3
	E6Nq/dfUKBCCubwvbSYxs7TwAwOmB+saO7bdeBIrppMYo22ZRxOay6I7FoSS9OTYPtpYzIOyBZ/
	7i8mFwYuk8TRdhK/fd1lsJuEGSoTvUmH/O0iQduMbb5f3+ctlq5qY2XjMyLiK5Lmn8MR0sQQ+KP
	TIu85uwrn1jkC4a1NfJVZ+it4NSNaO3jTGq+SD8b0ILNyIZEilmuNsiNstNQgyUOsSMF3zmu7Il
	GQKfyFE1X3pX4i6jvbirBrhXy1hMHlCzrezmqwneCKvQDQEE/fiXR0rJXLNRC9AlawUczE343Qn
	pWz4EI8vcQt8CMYX2AKSWYMWe60PObTSY0qEpwoKy2wO8hqe0Z6RcGQ7T0gyNdrds2fuhbm/gYi
	b7RO+H9AyHKVtHTIbOIJHUjWXpyJxZ5mznxKs2wAIaOXj3jnnDMUTtVZTS4rzLHokr7o96qidBT
	NtIUBx31cEd7VU7MwScmkTQiaEpVCREa/2BHjliheEIIP/pN8LQXuFmCMq38VSgm4SRxPJHgAeC
	jDu3bQDytjErTtT7k5ttZ6vED2KfwrtrlvjxJkKWtw==
X-Received: by 2002:a17:90b:554d:b0:3ad:d29c:5e64 with SMTP id 98e67ed59e1d1-3b41c9b361fmr22966937a91.65.1795770513277;
        Fri, 27 Nov 2026 01:08:33 -0800 (PST)
Received: from intel.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6d06ee37sm11718725a12.28.2026.11.27.01.08.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 01:08:32 -0800 (PST)
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
Subject: [PATCH v10 4/8] crash_core: replace for_each_mem_range() with for_each_mem_region()
Date: Fri, 27 Nov 2026 17:07:19 +0800
Message-ID: <20261127090723.741253-5-chenwandun1@gmail.com>
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

