Received: from out-179.mta0.migadu.com (out-179.mta0.migadu.com [91.218.175.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59152314A83
	for <loongarch@lists.linux.dev>; Fri, 14 Nov 2025 11:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763118829; cv=none; b=jWWb5W06Or4D/AfkOoFyTwsxYXpZuW+BnUiWoBWV+A2j9DQkARXqjFMXgbYnGJViYJlSolReSnoC1/egSVB+fKECPdu/sPsSXudY5QIm5IFz/Eqz95dYyeuKdBsg04UW4tH/TXYP8tJ1AQst5K6OnQFJh9XWv00px8hKGXICzJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763118829; c=relaxed/simple;
	bh=zKmRBaTVYT/GGP753suJGZyWfmgTXSn//WvB4YLCjlk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FuZ2/x9h7ilFfAtUVpbEUnIT6VkzIR7K+dvB9AiwjdseAIhgMliHd9MayIBRu31c1ZE76oVAI5zv2ZR2CWTYKrjq1ugqgI9obresGitouY0Du86LYE6NtpcZHzcJ07uATJTaTYBocHVvt927UnhhsLjLYedLa/bk8aKxR5xAOeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=vExdq/0Q; arc=none smtp.client-ip=91.218.175.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="vExdq/0Q"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1763118824;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=P6T+2Lant3MYurrTyX3sjQxVkxrSJ5NC17wEIBzsAD8=;
	b=vExdq/0QIbNXwYGHrXQqTUESTgynxZF1NJ0xtYYbpdRrZ58EdRub+KFh9R2nimgCQ5fatR
	4xLlVhyB6VQJZcD/sz1r9N+vzLfWl9ZUNEJ579ag0IteNR33li8sNEYMRTdhUYVjBH+SAv
	KC18Vm38wa/0lScGVl1ZIZrfKVIfEok=
From: Qi Zheng <qi.zheng@linux.dev>
To: will@kernel.org,
	aneesh.kumar@kernel.org,
	npiggin@gmail.com,
	peterz@infradead.org,
	dev.jain@arm.com,
	akpm@linux-foundation.org,
	david@redhat.com,
	ioworker0@gmail.com
Cc: linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-alpha@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linux-um@lists.infradead.org,
	Qi Zheng <zhengqi.arch@bytedance.com>,
	Vineet Gupta <vgupta@kernel.org>
Subject: [PATCH 2/7] arc: mm: enable MMU_GATHER_RCU_TABLE_FREE
Date: Fri, 14 Nov 2025 19:11:16 +0800
Message-ID: <6a4192f5cef3049f123f08cb04ef5cd0179c3281.1763117269.git.zhengqi.arch@bytedance.com>
In-Reply-To: <cover.1763117269.git.zhengqi.arch@bytedance.com>
References: <cover.1763117269.git.zhengqi.arch@bytedance.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

From: Qi Zheng <zhengqi.arch@bytedance.com>

On a 64-bit system, madvise(MADV_DONTNEED) may cause a large number of
empty PTE page table pages (such as 100GB+). To resolve this problem,
first enable MMU_GATHER_RCU_TABLE_FREE to prepare for enabling the
PT_RECLAIM feature, which resolves this problem.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
Cc: Vineet Gupta <vgupta@kernel.org>
---
 arch/arc/Kconfig               | 1 +
 arch/arc/include/asm/pgalloc.h | 9 ++++++---
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/arch/arc/Kconfig b/arch/arc/Kconfig
index f27e6b90428e4..47db93952386d 100644
--- a/arch/arc/Kconfig
+++ b/arch/arc/Kconfig
@@ -54,6 +54,7 @@ config ARC
 	select HAVE_ARCH_JUMP_LABEL if ISA_ARCV2 && !CPU_ENDIAN_BE32
 	select TRACE_IRQFLAGS_SUPPORT
 	select HAVE_EBPF_JIT if ISA_ARCV2
+	select MMU_GATHER_RCU_TABLE_FREE
 
 config LOCKDEP_SUPPORT
 	def_bool y
diff --git a/arch/arc/include/asm/pgalloc.h b/arch/arc/include/asm/pgalloc.h
index dfae070fe8d55..b1c6619435613 100644
--- a/arch/arc/include/asm/pgalloc.h
+++ b/arch/arc/include/asm/pgalloc.h
@@ -72,7 +72,8 @@ static inline void p4d_populate(struct mm_struct *mm, p4d_t *p4dp, pud_t *pudp)
 	set_p4d(p4dp, __p4d((unsigned long)pudp));
 }
 
-#define __pud_free_tlb(tlb, pmd, addr)  pud_free((tlb)->mm, pmd)
+#define __pud_free_tlb(tlb, pud, addr)	\
+	tlb_remove_ptdesc((tlb), virt_to_ptdesc(pud))
 
 #endif
 
@@ -83,10 +84,12 @@ static inline void pud_populate(struct mm_struct *mm, pud_t *pudp, pmd_t *pmdp)
 	set_pud(pudp, __pud((unsigned long)pmdp));
 }
 
-#define __pmd_free_tlb(tlb, pmd, addr)  pmd_free((tlb)->mm, pmd)
+#define __pmd_free_tlb(tlb, pmd, addr)	\
+	tlb_remove_ptdesc((tlb), virt_to_ptdesc(pmd))
 
 #endif
 
-#define __pte_free_tlb(tlb, pte, addr)  pte_free((tlb)->mm, pte)
+#define __pte_free_tlb(tlb, pte, addr)	\
+	tlb_remove_ptdesc((tlb), page_ptdesc(pte))
 
 #endif /* _ASM_ARC_PGALLOC_H */
-- 
2.20.1

