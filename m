Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1609A72631;
	Sun,  1 Mar 2026 01:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772328469; cv=none; b=i3wbDy0yZvZR0ej7iAYTsV6bLDrMDtTqBIglbIBFA+BnXd8kECXJ4vZFwepH36Nbu4OKi6sIZdD4iFp0OJe8kon+GmaDDfs/cuvGnhcpxtV21/ZXmzut2v5IS1iQqvgSt7zKori17spO19vZeoECuUtecnU7b9WsSqhL3WN6AzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772328469; c=relaxed/simple;
	bh=NU6YYCjeixqM1cOja2Y1u7bnxVQvfEUSDuSBbk71l3c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=K4vc+oTf9acOxKlyR5w+1B5DYnB8v52jMF7wj4gG/JMwH8Vi1J5K0VQOCQdVOA4lAf9uNwixTsIv/XgwseFzGeHeWedTQAMpt7LE0+RbaAmKm2w5AQAb4U+YSOLWuNy8u0CZqfzLqrghycjvEGVH49+l4sUHbTOYy8mb71W0ZFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ALPjbwZP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ALPjbwZP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 755D8C19421;
	Sun,  1 Mar 2026 01:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772328469;
	bh=NU6YYCjeixqM1cOja2Y1u7bnxVQvfEUSDuSBbk71l3c=;
	h=From:To:Cc:Subject:Date:From;
	b=ALPjbwZPFyi6aPCwhXHZ8qhQZyVfLu3PLlmdOFpjKRInKnZLXa9zNagmuh91msJ7x
	 HDHf6a1Vbo9xmq6kqsY+/ex0bsuv2y2bi7cQ4clFcdF4qp7EElWdfhFDBCyJ1/RobF
	 6pAQ3CqDeRRbBOVqil8N07UDAEjNIfAl8t0cO7co1/JfjKnP01bfEdxctmMSlPVvKp
	 pQKATd8IhjCzIH977YqSPHQxggTm6bi8t7WEZPwjr/wA+HXO/6Ln/1KxFfMfQyZiSF
	 9zU8t1PqPzCQpsnDHJp25yGyB/43C8aIkkGdcmpFtzZoB4VJWzZsPpD7KkSDA1YhXr
	 ZFPyaRq6/SaQg==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	yangtiezhu@loongson.cn
Cc: Huacai Chen <chenhuacai@loongson.cn>,
	loongarch@lists.linux.dev
Subject: FAILED: Patch "LoongArch: Remove some extern variables in source files" failed to apply to 6.12-stable tree
Date: Sat, 28 Feb 2026 20:27:46 -0500
Message-ID: <20260301012747.1685366-1-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Patchwork-Hint: ignore
X-stable: review
Content-Transfer-Encoding: 8bit

The patch below does not apply to the 6.12-stable tree.
If someone wants it applied there, or to any other stable or longterm
tree, then please email the backport, including the original git commit
id to <stable@vger.kernel.org>.

Thanks,
Sasha

------------------ original commit in Linus's tree ------------------

From 0e6f596d6ac635e80bb265d587b2287ef8fa1cd6 Mon Sep 17 00:00:00 2001
From: Tiezhu Yang <yangtiezhu@loongson.cn>
Date: Tue, 10 Feb 2026 19:31:14 +0800
Subject: [PATCH] LoongArch: Remove some extern variables in source files

There are declarations of the variable "eentry", "pcpu_handlers[]" and
"exception_handlers[]" in asm/setup.h, the source files already include
this header file directly or indirectly, so no need to declare them in
the source files, just remove the code.

Cc: stable@vger.kernel.org
Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
---
 arch/loongarch/kernel/unwind_orc.c      | 2 --
 arch/loongarch/kernel/unwind_prologue.c | 4 ----
 arch/loongarch/mm/tlb.c                 | 1 -
 3 files changed, 7 deletions(-)

diff --git a/arch/loongarch/kernel/unwind_orc.c b/arch/loongarch/kernel/unwind_orc.c
index 11ba3e4ac9eee..9cfb5bb1991f2 100644
--- a/arch/loongarch/kernel/unwind_orc.c
+++ b/arch/loongarch/kernel/unwind_orc.c
@@ -350,8 +350,6 @@ EXPORT_SYMBOL_GPL(unwind_start);
 
 static inline unsigned long bt_address(unsigned long ra)
 {
-	extern unsigned long eentry;
-
 #if defined(CONFIG_NUMA) && !defined(CONFIG_PREEMPT_RT)
 	int cpu;
 	int vec_sz = sizeof(exception_handlers);
diff --git a/arch/loongarch/kernel/unwind_prologue.c b/arch/loongarch/kernel/unwind_prologue.c
index ee1c29686ab05..da07acad7973a 100644
--- a/arch/loongarch/kernel/unwind_prologue.c
+++ b/arch/loongarch/kernel/unwind_prologue.c
@@ -23,10 +23,6 @@ extern const int unwind_hint_lasx;
 extern const int unwind_hint_lbt;
 extern const int unwind_hint_ri;
 extern const int unwind_hint_watch;
-extern unsigned long eentry;
-#ifdef CONFIG_NUMA
-extern unsigned long pcpu_handlers[NR_CPUS];
-#endif
 
 static inline bool scan_handlers(unsigned long entry_offset)
 {
diff --git a/arch/loongarch/mm/tlb.c b/arch/loongarch/mm/tlb.c
index 6a3c91b9cacdc..4014c44695878 100644
--- a/arch/loongarch/mm/tlb.c
+++ b/arch/loongarch/mm/tlb.c
@@ -262,7 +262,6 @@ static void output_pgtable_bits_defines(void)
 #ifdef CONFIG_NUMA
 unsigned long pcpu_handlers[NR_CPUS];
 #endif
-extern long exception_handlers[VECSIZE * 128 / sizeof(long)];
 
 static void setup_tlb_handler(int cpu)
 {
-- 
2.51.0




