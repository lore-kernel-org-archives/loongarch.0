Received: from mail-pj2-f10.google.com (mail-pj2-f10.google.com [74.125.227.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6306652F299
	for <loongarch@lists.linux.dev>; Tue, 22 Sep 2026 08:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790066640; cv=none; b=f8Bv4rCfmIlcjh4IYWSMQDp3QJpuklVkcxBqaSoAdy/E8lUFElnLUilMTDydwcS6VvNagcYYs8175x6HpXGdSNJMa9NoWBtyGmnBsGESikesDL0A7Gmax0mBqRTRgAVtFHjoMcHxsy/IbTK4zyzld/AhAcw9h8NFWM+yLdvFVsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790066640; c=relaxed/simple;
	bh=aVUsHlz/xoft1y6LdoTP6jj2hctS3djOcN1LZjUnlTo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KTvfx0Phr9tE1Xj2J0VGX32pRwCE2uxeO1LysD/1b+ariW5xs/gHGOggQNiXfHOgeOOO0GOBHNVauqqtCyK7ZElgC+aWed6cBf2aVIwdzLEefDdhFlrkMHGl5AW1DPVSY5cPQohfF1/fmIqvzWbFMqn/ynQzi4wpvEPoI+7LpLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sg41JHaj; arc=none smtp.client-ip=74.125.227.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sg41JHaj"
Received: by mail-pj2-f10.google.com with SMTP id 98e67ed59e1d1-39e249c766bso1632785a91.0
        for <loongarch@lists.linux.dev>; Tue, 22 Sep 2026 01:43:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790066639; x=1790671439; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BQZ6M9cJvbnCelbC8h/SiM2wDn1buqTcsR+O1dmHqTM=;
        b=Sg41JHajSewNZRtaerWLmPeGoGYnVYvC9ZQGDYB1EfLE+kqr0WjtEjC7au9GBNVZl9
         A1WC3eE8PTMdy5M1guMX4AUjD+dNJYc1zclurNZ70tnxJAjsgQmHCwiGJVP3YSD8EcIt
         B2mLJpOetsVDSJQFrlFQgm2hFgEmRfkKwFYrWHSkI9dMiinK30duR3o/UfiBaA0/AKEB
         w+mB/v5lJyBxsaV+eiyz2EoZflRKBEGxytu4Wli85QkvrqK+hUXRoPfQ44DVDLnBMbCU
         NFwxR6Dj8Ruf+LF7MxUTT0C3yNn+7X+QldZvemJlexXe27EmmdZQlz/pN4wGOJvMxt56
         bAsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790066639; x=1790671439;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BQZ6M9cJvbnCelbC8h/SiM2wDn1buqTcsR+O1dmHqTM=;
        b=p/mK8mtDwdaAGBGEwlfxr07Jdg4QGWs9J71B+0N12upuLGwNngaXb/TyYFaqBD7Pcq
         7ZfVNWY2FNSJzq+cS8QzSuV2VFeUtSWH3l4PMABLEju90uXDh8gjr3w6+Rioy8URoSC6
         WLVSdAKdAbqajtnIwy1ZJOv301RoTb0DKQwejsfmzYk4SOlTxDNn5Y2JperuQ2ErJ+Y4
         bkx4DenqFupjnSdtupznLXpDfiLAU2m/YofS1ZXAvtDuN/3nH9nO6zeqnq15QT0JNhsl
         3zIl6e40Vkb1TqsB8Gxve7AmvGdZqSyjeRlQovVU7HAjOfIe8+wwZwna64NK0ZWfW+zd
         1Agw==
X-Forwarded-Encrypted: i=1; AKwUvBzKI3Q6JyC6LxMngm4B0iynYCv138egvJ33blS2ZTPXdo//mGnrR3cFxOc/HNtNwXoerZ1ooVrOj8w=@lists.linux.dev
X-Gm-Message-State: AFuF++kFNw2bLngrveOXQYUIdmftEkzGYLSgG6esYLlYc0zCrFAn8fxb
	w5Hc1Vzb1GgEupwT5Z4WYbtWenkxvdMuWDU1e8VznxtqBgag0p42ZQmQ
X-Gm-Gg: AYBFou065tm5SahGFTfmGHsWpZEIcqRrYBL5KneZBRdronVTdEz+Z2vrb2hEkuCRMd5
	C11Eoni/uxEDaUPZCBDKIkR9fg2wmLmCwixZ3IGCBPp+yE3QhwKRXAgN8DYyQUIXFub9qFa/N/D
	rrNz4mTR3VRlmUVnDputNaa9y69gg/FccAXvaNsT/SM15mrvI9llNNZ8L0ahzW+HAwrYFSYB/Xq
	eh+efMsof5DJCho77RE9oXbsZx/QdiodTOecRiwE4YPPKFFor7wLoQxPckZ6iKTfyodqNDLBwpb
	fnDLgkyWCRz0Lk90PyDMvukdRWl+usCzDYgkfIXYLhVAVLXVFg1Ab4Sh9494t7YrVx0ZHHdwoyk
	3IY0wysEQYTUk9iStpfPLYx0fand+/qVM6I+3M2ClYOROj7Chp3iC5B01A7j2GRwbQD/qrtjLBV
	Z1DIVFdqvG3vy1uE3z7up4FhB6JgXKsGo9V+IGzLDnalDEVQGZpbaN6HbTUT68Fo/hoGzIta41y
	y8cgIumczA=
X-Received: by 2002:a17:90b:35c5:b0:39e:6a80:dd9b with SMTP id 98e67ed59e1d1-3a0731f9793mr476673a91.34.1790066638632;
        Tue, 22 Sep 2026 01:43:58 -0700 (PDT)
Received: from intel.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0674a5ae4sm3670016a91.12.2026.09.22.01.43.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 01:43:58 -0700 (PDT)
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
Subject: [PATCH v7 4/9] crash_core: replace for_each_mem_range() with for_each_mem_region()
Date: Tue, 22 Sep 2026 16:42:51 +0800
Message-ID: <20260922084256.1515554-5-chenwandun1@gmail.com>
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
index d0cc2496dc09..c7acb2e449df 100644
--- a/kernel/crash_core.c
+++ b/kernel/crash_core.c
@@ -270,6 +270,12 @@ int crash_prepare_elf64_headers(struct crash_mem *mem, int need_kernel_map,
 	return 0;
 }
 
+/* Exclude NOMAP regions from the vmcore. */
+static bool crash_should_skip_region(struct memblock_region *reg)
+{
+	return memblock_is_nomap(reg);
+}
+
 static struct crash_mem *alloc_cmem(unsigned int nr_ranges)
 {
 	struct crash_mem *cmem;
@@ -285,22 +291,25 @@ static struct crash_mem *alloc_cmem(unsigned int nr_ranges)
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

