Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E98B1ABED9
	for <loongarch@lists.linux.dev>; Wed,  8 Jan 2025 07:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736319807; cv=none; b=TecjHycYGd9s3BEtwXCVWuBY1+Z5g6yKHhGVkCwLPGfM4bR9HSoIgiSaOy5KdTozCR94RFfk6ladTGbICNkGAQxPnEJWOs9rJcPC7Ic5in3Ql/GU6Gkb+6su7tJpfCByNMlfxriVYd1XSRa48hpFaXYETTRpJf0/T1WuzO4SA8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736319807; c=relaxed/simple;
	bh=/Z4BDRon0Bevgr5mvsJCh3x7OaoERaQ2cVgkjt99Nxk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tctB2zzul3zknegMOMh7bJfCMT29rqfZ5RDky00tzHlfd7aq4SeNIVTyFrfHAtPsDsjDPumHgAjyJmzJH2JojhDEN1S7Cx5hU/ZfJT4/SBr6Oo0dCvLVZkgdZRu1TlVSQofTMQi23bEu3x2VZBRQlBUHbgIkiBDD+4HzNvdOWuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=FbXAQnO1; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="FbXAQnO1"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2156e078563so210961575ad.2
        for <loongarch@lists.linux.dev>; Tue, 07 Jan 2025 23:03:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1736319804; x=1736924604; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x40aCfPUIT+7f+SOGlgpQ1mZ5+3GERu3xGzgSvQpPds=;
        b=FbXAQnO17SUPqGOidKSeIYhfEoHVojuU3/vOmfmfOGo6ZMs9LVeEwlz3kobA5/iMzi
         UVdd5Y15/chWnfEqNpAEMyRPrGl/mh6lZRG1X1tK0DpvHVmtLqBxjyOER+r2d5GwesQI
         TCx42n/+geYVe2GfiO8Rm7w/3U6lNeQSn0ckTj6pMQKNr0xfG5Bjy1JftrqL16gYBxI2
         h4HvP88y7BCS8gY1u7xf9S4MYqb0IRqZFfOa8AAyQlT5kiP82P5Wre+S6c59uQ8jviU0
         W2UWj1eky5pce9jwQDVgi1I3Mq5FxUlYpf74OxJoS+8GrefkDwqzL0v9zJn0B+P2FnUH
         fuiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736319804; x=1736924604;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x40aCfPUIT+7f+SOGlgpQ1mZ5+3GERu3xGzgSvQpPds=;
        b=IvbMaPLa46PlwmU1hEB2/GJXhJIy6Qc8GHwz8OG+xdVpjZ4SCHEWWPmF0i6RrftjtR
         PTRq9z+GYHLbhhu24iFGBWD6NrIc1RubHttA2aYNIyPlxO/6LcLeLDegR5Znxj4v5IeE
         1v5YOxEe15bUD44z6eJoP+hUuKs5qOkaXbEYZW3rrx0cl2EEVxIMspAloWVD/bi+MRAT
         rXybQLhT2bgJ8P0auQhul7q3//JRg0c0Evulf0K10FRlKih0A+oVfyEjxJuGpcVLHInf
         TKm/QUvAoiQuxzcVIjHPhRwbnlZFzEjW64YXFJOfF1AgzuJLrVJw2vzqforAnfHkSlih
         41ag==
X-Forwarded-Encrypted: i=1; AJvYcCXVfZ94C70SpeJ0NvJIWCbUCwamzHc82MiS8hkb0goxontVJR4EzsuBFmo80KSx47c273xCksT2vGg=@lists.linux.dev
X-Gm-Message-State: AOJu0YwLkT/QGv/VeRWtUF8wLiIYSp8pMvTwkQTr1ILoOrUsi7xMlShA
	ububFoWwWMQBeR0k3ao7ANm+jCvrlnW7a/302zOA6Hi9Wu1rCImr3l15/hzGIxc=
X-Gm-Gg: ASbGnctnPVtDXoX1+Zn10+qCfBdA4AVEeMmpy9afAPija0q+XqmIHGzNDPogB1TQVpw
	nzHmSd/N8+ptnVxdBGfPIBeHdO7CmQa7Iz2/i7H2HVRK1xvoWD6p9B8X1ZGKnkftrO8lY/FmKn3
	Qc2DVPvQESsDd8uttwi7RuehLitZQUaGhfX2valNPb3Hrmc6B5+zIPK9bEZ9sKweXSp0bfQKyd4
	AFik6fz+RX+SQJyB3z2cJ31DXjkxmMenDKsOYoVxruMWb7JvMZTe2xo51Tp28kc/dz67iXjlYZI
	Zh7a5RUPgu0t1eaiGMdlbJRPGes=
X-Google-Smtp-Source: AGHT+IH8IKObAIjKqBGW3XQDBdiOawtDgYf1Tuj1urKOF9Kp4Be/TSELj5l2Ma8a+iBaK6i0ld/PMQ==
X-Received: by 2002:a17:902:da8e:b0:216:410d:4c67 with SMTP id d9443c01a7336-21a83fb1395mr28350885ad.41.1736319804422;
        Tue, 07 Jan 2025 23:03:24 -0800 (PST)
Received: from C02DW0BEMD6R.bytedance.net ([139.177.225.244])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dca023a3sm320067275ad.250.2025.01.07.23.03.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 23:03:23 -0800 (PST)
From: Qi Zheng <zhengqi.arch@bytedance.com>
To: peterz@infradead.org,
	agordeev@linux.ibm.com,
	kevin.brodsky@arm.com,
	alex@ghiti.fr,
	andreas@gaisler.com,
	palmer@dabbelt.com,
	tglx@linutronix.de,
	david@redhat.com,
	jannh@google.com,
	hughd@google.com,
	yuzhao@google.com,
	willy@infradead.org,
	muchun.song@linux.dev,
	vbabka@kernel.org,
	lorenzo.stoakes@oracle.com,
	akpm@linux-foundation.org,
	rientjes@google.com,
	vishal.moola@gmail.com,
	arnd@arndb.de,
	will@kernel.org,
	aneesh.kumar@kernel.org,
	npiggin@gmail.com,
	dave.hansen@linux.intel.com,
	rppt@kernel.org,
	ryan.roberts@arm.com
Cc: linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	x86@kernel.org,
	linux-arch@vger.kernel.org,
	linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org,
	linux-sh@vger.kernel.org,
	linux-um@lists.infradead.org,
	Qi Zheng <zhengqi.arch@bytedance.com>
Subject: [PATCH v5 16/17] mm: pgtable: move __tlb_remove_table_one() in x86 to generic file
Date: Wed,  8 Jan 2025 14:57:32 +0800
Message-Id: <aab8a449bc67167943fd2cb5aab0a3a23b7b1cd7.1736317725.git.zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <cover.1736317725.git.zhengqi.arch@bytedance.com>
References: <cover.1736317725.git.zhengqi.arch@bytedance.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The __tlb_remove_table_one() in x86 does not contain architecture-specific
content, so move it to the generic file.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
Reviewed-by: Kevin Brodsky <kevin.brodsky@arm.com>
---
 arch/x86/include/asm/tlb.h | 19 -------------------
 mm/mmu_gather.c            | 20 ++++++++++++++++++--
 2 files changed, 18 insertions(+), 21 deletions(-)

diff --git a/arch/x86/include/asm/tlb.h b/arch/x86/include/asm/tlb.h
index 3858dbf75880e..77f52bc1578a7 100644
--- a/arch/x86/include/asm/tlb.h
+++ b/arch/x86/include/asm/tlb.h
@@ -20,25 +20,6 @@ static inline void tlb_flush(struct mmu_gather *tlb)
 	flush_tlb_mm_range(tlb->mm, start, end, stride_shift, tlb->freed_tables);
 }
 
-#ifdef CONFIG_PT_RECLAIM
-static inline void __tlb_remove_table_one_rcu(struct rcu_head *head)
-{
-	struct ptdesc *ptdesc;
-
-	ptdesc = container_of(head, struct ptdesc, pt_rcu_head);
-	__tlb_remove_table(ptdesc);
-}
-
-static inline void __tlb_remove_table_one(void *table)
-{
-	struct ptdesc *ptdesc;
-
-	ptdesc = table;
-	call_rcu(&ptdesc->pt_rcu_head, __tlb_remove_table_one_rcu);
-}
-#define __tlb_remove_table_one __tlb_remove_table_one
-#endif /* CONFIG_PT_RECLAIM */
-
 static inline void invlpg(unsigned long addr)
 {
 	asm volatile("invlpg (%0)" ::"r" (addr) : "memory");
diff --git a/mm/mmu_gather.c b/mm/mmu_gather.c
index 1e21022bcf339..7aa6f18c500b2 100644
--- a/mm/mmu_gather.c
+++ b/mm/mmu_gather.c
@@ -311,13 +311,29 @@ static inline void tlb_table_invalidate(struct mmu_gather *tlb)
 	}
 }
 
-#ifndef __tlb_remove_table_one
+#ifdef CONFIG_PT_RECLAIM
+static inline void __tlb_remove_table_one_rcu(struct rcu_head *head)
+{
+	struct ptdesc *ptdesc;
+
+	ptdesc = container_of(head, struct ptdesc, pt_rcu_head);
+	__tlb_remove_table(ptdesc);
+}
+
+static inline void __tlb_remove_table_one(void *table)
+{
+	struct ptdesc *ptdesc;
+
+	ptdesc = table;
+	call_rcu(&ptdesc->pt_rcu_head, __tlb_remove_table_one_rcu);
+}
+#else
 static inline void __tlb_remove_table_one(void *table)
 {
 	tlb_remove_table_sync_one();
 	__tlb_remove_table(table);
 }
-#endif
+#endif /* CONFIG_PT_RECLAIM */
 
 static void tlb_remove_table_one(void *table)
 {
-- 
2.20.1

