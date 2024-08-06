Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E16CD14C59A
	for <loongarch@lists.linux.dev>; Tue,  6 Aug 2024 22:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722982500; cv=none; b=B4Fgsr4BasUXbeZui6l493I/3rK4aRuMcXhUJnJvk+YKDgm/v35jLBlMoa6deV/VpCHjaMsGbJheSe1a2F9W/Jd6ly0XkF40AFqwPuDI7Ci1Pa5FgNPA75vYamrKg6pKxy4XGGCWvAiM8XOikIEkyjHBr7teRZdSzuNDYDMVPqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722982500; c=relaxed/simple;
	bh=Ogo68UR/OsXc9UdIgAzdmezFiK2lZB543zE7hjBKpoA=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=eG5c+AyaZGnwxUwd3s5++qlbiWqwUxqAHF2Wx+Ez0aMqk0NF/hTh/ucZN+1s/T2KAK7a5USgBAPztS1AOUQSRt1CwoeehjuBJg/gBE6F9hBdcP5XZFIfwc7oCO/JmghxwVHKp1sHSaqIvuDNJEL3icyz0FZgdCu3lmtP2y8dYEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b=aJDsBHa3; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b="aJDsBHa3"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-6b7aed340daso6705346d6.3
        for <loongarch@lists.linux.dev>; Tue, 06 Aug 2024 15:14:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1722982498; x=1723587298; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=DpwrGsGSvnHFdGVf1tlm4Wyo1L4IUT4bE3I4p9OVTOM=;
        b=aJDsBHa35lx6MXllLUIC4JgAvLjzNmOpBNfH35fYuZ84MXUofTwPRNBbANRiKOxXmS
         tTepcbHcYyJzaI2YjuQIqg8lYFs3ELePrOSEOO6SxfWi0P8d6+fYOJRgk1KX2Zfwod3M
         flbJLhhIZBToGR35P1aM5ZCCzOCF1r071jF2qTQWej88iJ35NL3TK6BBGut1TGPe4afj
         8SgPxY8HjVTksFv6E4Mz/i6rp7ftA0NqY3G8UD9pxhZAMZGRh37aObCrV/2UNQ8FmFE/
         90ybmMX9SEQ145E4LbUMgK+ot9byAF1qJDaFmInL1zxrg5M/eD0Nkv8q5uTv/yRGr2KB
         6DBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722982498; x=1723587298;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DpwrGsGSvnHFdGVf1tlm4Wyo1L4IUT4bE3I4p9OVTOM=;
        b=ZNjelJ3Xde5R7B6tyOecTdTuu7TOkkV4MLfMTeOrGdYBhX0j1nbA9EQ+0mgxnaaETP
         BU+EG0/827hTQscvPEDK7PMgZJx1bwfu9S6bY32zoSyBAfHgkKMsO0A1aj/yoMzclSis
         kZTgN3VDE2Scx8JfG/HzpgdnmfMRTDZdB5VxRrxF4034Hfngt1F0jHzNpL1tcCOsJ649
         k3sbGD6pOhmdLzi8meOjYQS4HleotlmPkfQ49FhTWTxu9iyevuTGSK14mhSBAwW7ZwPJ
         yzDSYoc37m3WUE4zNXniBW+uKZObmxQRupcgkos7xvu+WrF74R0cpgN2139bNNUY5DY1
         FynQ==
X-Forwarded-Encrypted: i=1; AJvYcCXfr9T9WLyIX/ee7+VPe8XX+ewVTNrLx40v44t4GrAUW3WTRhR43jOsgs+KAgWhHWYCvpnwJfbpQy9LFb9gWsGnqb/O4yUCmnVQ
X-Gm-Message-State: AOJu0Yx9HXiZj+AnZ/3cvfTGOsIodJI0DzPcvZDXowEvM+7Eua+6vWP/
	Vyvm6dqemRLO00C5nzefTfDA3LPa2ZSzm5adkLacf47MtvBHJNKyw8Yf0fhApVg=
X-Google-Smtp-Source: AGHT+IGvHhFLKBv+CzG3kEzbceETNjAkvAWmYHLIEUsuY6FkehJnB//a5YH4EciwSMoOH9WpYcIhcQ==
X-Received: by 2002:a05:6214:5990:b0:6b0:86f9:64ad with SMTP id 6a1803df08f44-6bb98493eb3mr259732626d6.52.1722982497815;
        Tue, 06 Aug 2024 15:14:57 -0700 (PDT)
Received: from soleen.c.googlers.com.com (118.239.150.34.bc.googleusercontent.com. [34.150.239.118])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6bb9c8778e1sm50584506d6.128.2024.08.06.15.14.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Aug 2024 15:14:57 -0700 (PDT)
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: agordeev@linux.ibm.com,
	akpm@linux-foundation.org,
	alexghiti@rivosinc.com,
	aou@eecs.berkeley.edu,
	ardb@kernel.org,
	arnd@arndb.de,
	bhe@redhat.com,
	bjorn@rivosinc.com,
	borntraeger@linux.ibm.com,
	bp@alien8.de,
	catalin.marinas@arm.com,
	chenhuacai@kernel.org,
	chenjiahao16@huawei.com,
	christophe.leroy@csgroup.eu,
	dave.hansen@linux.intel.com,
	david@redhat.com,
	dawei.li@shingroup.cn,
	gerald.schaefer@linux.ibm.com,
	gor@linux.ibm.com,
	hca@linux.ibm.com,
	hpa@zytor.com,
	kent.overstreet@linux.dev,
	kernel@xen0n.name,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	loongarch@lists.linux.dev,
	luto@kernel.org,
	maobibo@loongson.cn,
	mark.rutland@arm.com,
	mcgrof@kernel.org,
	mingo@redhat.com,
	mpe@ellerman.id.au,
	muchun.song@linux.dev,
	namcao@linutronix.de,
	naveen@kernel.org,
	npiggin@gmail.com,
	osalvador@suse.de,
	palmer@dabbelt.com,
	pasha.tatashin@soleen.com,
	paul.walmsley@sifive.com,
	peterz@infradead.org,
	philmd@linaro.org,
	rdunlap@infradead.org,
	rientjes@google.com,
	rppt@kernel.org,
	ryan.roberts@arm.com,
	souravpanda@google.com,
	svens@linux.ibm.com,
	tglx@linutronix.de,
	tzimmermann@suse.de,
	will@kernel.org,
	x86@kernel.org
Subject: [PATCH 1/2] mm: update the memmap stat before page is freed
Date: Tue,  6 Aug 2024 22:14:53 +0000
Message-ID: <20240806221454.1971755-1-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.46.0.76.ge559c4bf1a-goog
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It is more logical to update the stat before the page is freed, to avoid
use after free scenarios.

Fixes: 15995a352474 ("mm: report per-page metadata information")
Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 mm/hugetlb_vmemmap.c | 4 ++--
 mm/page_ext.c        | 8 ++++----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
index 829112b0a914..fa83a7b38199 100644
--- a/mm/hugetlb_vmemmap.c
+++ b/mm/hugetlb_vmemmap.c
@@ -185,11 +185,11 @@ static int vmemmap_remap_range(unsigned long start, unsigned long end,
 static inline void free_vmemmap_page(struct page *page)
 {
 	if (PageReserved(page)) {
-		free_bootmem_page(page);
 		mod_node_page_state(page_pgdat(page), NR_MEMMAP_BOOT, -1);
+		free_bootmem_page(page);
 	} else {
-		__free_page(page);
 		mod_node_page_state(page_pgdat(page), NR_MEMMAP, -1);
+		__free_page(page);
 	}
 }
 
diff --git a/mm/page_ext.c b/mm/page_ext.c
index c191e490c401..962d45eee1f8 100644
--- a/mm/page_ext.c
+++ b/mm/page_ext.c
@@ -330,18 +330,18 @@ static void free_page_ext(void *addr)
 	if (is_vmalloc_addr(addr)) {
 		page = vmalloc_to_page(addr);
 		pgdat = page_pgdat(page);
+		mod_node_page_state(pgdat, NR_MEMMAP,
+				    -1L * (DIV_ROUND_UP(table_size, PAGE_SIZE)));
 		vfree(addr);
 	} else {
 		page = virt_to_page(addr);
 		pgdat = page_pgdat(page);
+		mod_node_page_state(pgdat, NR_MEMMAP,
+				    -1L * (DIV_ROUND_UP(table_size, PAGE_SIZE)));
 		BUG_ON(PageReserved(page));
 		kmemleak_free(addr);
 		free_pages_exact(addr, table_size);
 	}
-
-	mod_node_page_state(pgdat, NR_MEMMAP,
-			    -1L * (DIV_ROUND_UP(table_size, PAGE_SIZE)));
-
 }
 
 static void __free_page_ext(unsigned long pfn)
-- 
2.46.0.76.ge559c4bf1a-goog

