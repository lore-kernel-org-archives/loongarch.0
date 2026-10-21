Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=178.63.92.236
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792576544;
	b=gmhJcuEahARjll5AGHf51fl3oxtqYZkD5u7cwAdNiZXVwR4e2IMxfX/EuryUoH4njT4j
	 74Am1ud2kYZfyEoDhrUsuJhUo8PqEuK5XRq3TPpeNmNfGfyze33CfAlzUsN12JHXYrOMP
	 om3znRwiZRzj5GZ4XwgqECNP9RDDGHEu0r2VtyG+dVXXXT+XsKQVy2c6qqoBAmN8JIO+t
	 TFLNQyTAcBcaJgUYa4rzWRmd82BqJHlJF2sY5m3XOiQGbP9MwMWbl4r5aVEBxNdrNoZqR
	 gcLFlQpStENHQpAvm0ptjryUHanyjRAmjkIm28kdaIkQnm/3HjRdICpuvBDW2rtLzwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792576544;
	h=DMARC-Filter:Received:From:To:Subject:Date:Message-Id:X-Mailer;
	bh=tZ9DaGDXrYkxyzpsI1w9w9pQhaHKPRknAcuWW64w5yY=;
	b=5b7r+F4QgtizMY/RYT/yl4/T8Kg6eHd77bbOJ+V0DQ27BQz1wT8B7RN7Po1DKyPiueNf
	 SHJW9F+BKJrjAU2mC8zTCvPHJBbU267VqKi93cHs36MV5YpDR+CNyRWQNpLgpqMM2J/g/
	 7N1j/v+5sgzIkNM4q8tu+puQBuvooJF2BanGfoHPnC8vSUiYp1HDtzmsfyVGQc8fgZg9z
	 J+a0LvDqX8Rjj7ShIB8QO8CtcgzEaloRcEMsj3wTl0DBOOr5WZJ3o/12edprNwmrb4y54
	 MZzv2XYY6Z/acxbaRf9RKeKhQQDiQXSF39HjAecIByFGHQvAJrtFOHVTaCuKbxNBgNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=distanz.ch;
	spf=pass smtp.mailfrom=distanz.ch;
	arc=none smtp.remote-ip=178.63.92.236
Received: from sym2.noone.org (sym.noone.org [178.63.92.236])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96260606A31F
	for <loongarch@lists.linux.dev>; Wed, 21 Oct 2026 09:55:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96260606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=distanz.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=distanz.ch
Received: by sym2.noone.org (Postfix, from userid 1002)
	id 4j8l5j1RfYz2FtkJ; Wed, 21 Oct 2026 11:55:35 +0200 (CEST)
From: Tobias Klauser <tklauser@distanz.ch>
To: loongarch@lists.linux.dev
Subject: [PATCH] LoongArch: use asm-generic/mmu_context.h for no-op implementations
Date: Wed, 21 Oct 2026 11:55:34 +0200
Message-Id: <20261021095534.18972-1-tklauser@distanz.ch>
X-Mailer: git-send-email 2.11.0
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list

enter_lazy_tlb(), destroy_context(), activate_mm() and deactivate_mm()
are all no-ops that are already provided by default by
asm-generic/mmu_context.h, so drop the local duplicates and include
it instead, guarding init_new_context() which keeps its own real
implementation.

Signed-off-by: Tobias Klauser <tklauser@distanz.ch>
---
 arch/loongarch/include/asm/mmu_context.h | 18 +++---------------
 1 file changed, 3 insertions(+), 15 deletions(-)

diff --git a/arch/loongarch/include/asm/mmu_context.h b/arch/loongarch/include/asm/mmu_context.h
index 304363bd3935..6714290fdec7 100644
--- a/arch/loongarch/include/asm/mmu_context.h
+++ b/arch/loongarch/include/asm/mmu_context.h
@@ -43,10 +43,6 @@ static inline int asid_valid(struct mm_struct *mm, unsigned int cpu)
 	return 1;
 }
 
-static inline void enter_lazy_tlb(struct mm_struct *mm, struct task_struct *tsk)
-{
-}
-
 /* Normal, classic get_new_mmu_context */
 static inline void
 get_new_mmu_context(struct mm_struct *mm, unsigned long cpu, bool *need_flush)
@@ -63,6 +59,7 @@ get_new_mmu_context(struct mm_struct *mm, unsigned long cpu, bool *need_flush)
  * Initialize the context related info for a new mm_struct
  * instance.
  */
+#define init_new_context init_new_context
 static inline int
 init_new_context(struct task_struct *tsk, struct mm_struct *mm)
 {
@@ -122,17 +119,6 @@ static inline void switch_mm(struct mm_struct *prev, struct mm_struct *next,
 	local_irq_restore(flags);
 }
 
-/*
- * Destroy context related info for an mm_struct that is about
- * to be put to rest.
- */
-static inline void destroy_context(struct mm_struct *mm)
-{
-}
-
-#define activate_mm(prev, next)	switch_mm(prev, next, current)
-#define deactivate_mm(task, mm)	do { } while (0)
-
 /*
  * If mm is currently active, we can't really drop it.
  * Instead, we will get a new one for it.
@@ -168,4 +154,6 @@ drop_mmu_context(struct mm_struct *mm, unsigned int cpu)
 	local_irq_restore(flags);
 }
 
+#include <asm-generic/mmu_context.h>
+
 #endif /* _ASM_MMU_CONTEXT_H */
-- 
2.55.0

