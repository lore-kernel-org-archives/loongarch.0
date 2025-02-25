Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CB824D5AB
	for <loongarch@lists.linux.dev>; Tue, 25 Feb 2025 03:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740455200; cv=none; b=emLJlas8hqqTyyV11XNDoDK9vXK+10oOcTjj83y1ss+CsArfx4lW4mw41Na9s6si8YnMv4f8SXilBd+/Q+9bWqGX4rTP+8g4dX1B1Z5BtoF9vDdWQ0Q3CAIq9wGOSHBgf4RVfV9ecznvq84p121Le2zEUagMDHKM8tHA5DEDsM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740455200; c=relaxed/simple;
	bh=oBmV5ytFANypY5PKhoeTOhUVK0FgP+zeeiYW6bw8jKk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pf2nGOAWtDk37nQeg9ZZpHRyv0O5aZkhjYZ5mfQowXYbmqiMf8Y22gB0b408vfHXMnr/L5Iaj2oQPHrAHw9grzOMgHtwKQiy6cng+ZL22nJfkaXIPJbUBphDrkIWLe26wTSzHlgNYxn1u6d5qsUh4AUlCpDABdmIs77mKGp0yos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=XMfFozYv; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="XMfFozYv"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-220c4159f87so72120535ad.0
        for <loongarch@lists.linux.dev>; Mon, 24 Feb 2025 19:46:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1740455199; x=1741059999; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8OP1Tf7pAaJ4pNIvAgoQe1yrsY5TH0xWN2DlWHIb0tQ=;
        b=XMfFozYvUalFL5VFy5Y5dYO2cSC65dXUgOYLStEE1phwOen4KlDnS+aNeDve5OpU1f
         Eomd/qgJF5bCiDUweX/m56khPMG6dgcsnCx8pFDst0LnB296nekhn2A6Qce0hgJr0qWE
         1/PriGkdZQ9qxiww7DX4Z7AcPNnLlxzqAr1HWDuRYKs3zaXzUOmYXYekLShOwzXb4AOV
         xlLXEkJwnmlde6Jn696x9N2V4cFuRFz/MhXYP2iL2fh4bBKM9ggk2K9vR4+y+DvCX5LQ
         RRJANwi8UozwMkWPZdkaMZJcdiww0XytkZXA0PAHbnkuLR3KjmAFJTDI781AXPfarJjt
         240Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740455199; x=1741059999;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8OP1Tf7pAaJ4pNIvAgoQe1yrsY5TH0xWN2DlWHIb0tQ=;
        b=rxW/YkhdL6Y9b3d8aGtwAmUIJaOfmY0VrnD585FLdnChs1QZARiys5DHq6UmYj4GI/
         wH3rODngXbP9rbaGOby9waM3fUNbYonNmrY097nKvcPUiPYxHpi3hBPy8p3OBkm3tgcM
         Vk5e3dcQ0MvqimbgODatDgoupVUl0sUUrtWhNnmdlnGbOyFWTe3O7ebHERmNDb7IJVsl
         FMlY3wP4aqPgWxZVh0wSA0wzVx/ff57ThEIJfVlIX63mH6zBCO/78zUxaSOiYTY5FMUn
         Aj2Vcr62fXt7CTB8mM4FtRIDordaMfFVdrpszvfs1AUkGiykVLvy749LKdGgplDm/ZPL
         y78w==
X-Forwarded-Encrypted: i=1; AJvYcCVzAwoJ5JNj5DQtw2fsUrTp9/oxESXFRo/+p5mJ3JCrVYyOQG8jdeOeK2TQxJUHzE0IQ2NDZm5azac=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw4fpFKScmYgAAy7hlkqHPSZLzk+74hR72ocK62t3gBBJuQBcr7
	KiKI1LpgYYusgbzNcBLreK2lPG+BU/U+VbGRBQgO510ETx9FpdsvLrF5SudYLEA=
X-Gm-Gg: ASbGncvovsUFOB2i2055ut0IDq4KxmCWbqM+Ap6Uxstt1nfXJjUNhsgC7TWZCG/zH8R
	s/jvHXAvbuieWPMW1HbWUt9VnlW0fOLJbcXGI0d+KnwQ7y7lrYaCjV0PO5Kc6VWiLbcHQkSUaLL
	K8bDZ1o5KI1sOcqjXP1BGjoJMT+VjqsciWir5LMRNZOGUset4rtMyasTsjvNJtexZ+tpXtcCKSd
	TkPr4lo3xq+mDSvZ5ZRS++YYA6YiC5c0fRoCd8Gc/pDz05F/Y68xlh5+RQ6PX5bKOwPvIh/zH54
	X+4oCF3SU3NhS/c4MrX3/91WumhkOGQAdwuF5fwYqe8rj2glq6BWszWuT6F8hfL/Eg==
X-Google-Smtp-Source: AGHT+IFHXm4yz9k/q53vQDLsSd2kyUiUDLPeAK4sNAWc/t1WzpyNSO/kW4XJ16gHc0dMjVe/gJ+ItQ==
X-Received: by 2002:a05:6a00:230b:b0:734:9cc:a6e4 with SMTP id d2e1a72fcca58-734791ab6bfmr3168643b3a.21.1740455198810;
        Mon, 24 Feb 2025 19:46:38 -0800 (PST)
Received: from C02DW0BEMD6R.bytedance.net ([63.216.146.179])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7347a81f014sm409429b3a.156.2025.02.24.19.46.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 19:46:38 -0800 (PST)
From: Qi Zheng <zhengqi.arch@bytedance.com>
To: peterz@infradead.org,
	kevin.brodsky@arm.com,
	riel@surriel.com,
	vishal.moola@gmail.com,
	david@redhat.com,
	jannh@google.com,
	hughd@google.com,
	willy@infradead.org,
	yuzhao@google.com,
	muchun.song@linux.dev,
	akpm@linux-foundation.org,
	will@kernel.org,
	aneesh.kumar@kernel.org,
	npiggin@gmail.com,
	arnd@arndb.de,
	dave.hansen@linux.intel.com,
	rppt@kernel.org,
	alexghiti@rivosinc.com
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org,
	linux-sh@vger.kernel.org,
	linux-um@lists.infradead.org,
	x86@kernel.org,
	linux-riscv@lists.infradead.org,
	Qi Zheng <zhengqi.arch@bytedance.com>
Subject: [PATCH v2 2/6] mm: pgtable: change pt parameter of tlb_remove_ptdesc() to struct ptdesc *
Date: Tue, 25 Feb 2025 11:45:52 +0800
Message-Id: <60bb44299cf2d731df6592e446e7f694054d0dbe.1740454179.git.zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <cover.1740454179.git.zhengqi.arch@bytedance.com>
References: <cover.1740454179.git.zhengqi.arch@bytedance.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

All callers of tlb_remove_ptdesc() pass it a pointer of struct ptdesc, so
let's change the pt parameter from void * to struct ptdesc * to perform
a type safety check.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
Originally-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 include/asm-generic/tlb.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/asm-generic/tlb.h b/include/asm-generic/tlb.h
index 54f579750c8e5..18bf499ef8801 100644
--- a/include/asm-generic/tlb.h
+++ b/include/asm-generic/tlb.h
@@ -506,7 +506,7 @@ static inline void tlb_remove_page(struct mmu_gather *tlb, struct page *page)
 	return tlb_remove_page_size(tlb, page, PAGE_SIZE);
 }
 
-static inline void tlb_remove_ptdesc(struct mmu_gather *tlb, void *pt)
+static inline void tlb_remove_ptdesc(struct mmu_gather *tlb, struct ptdesc *pt)
 {
 	tlb_remove_table(tlb, pt);
 }
-- 
2.20.1

