Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BB72190664;
	Sun,  1 Mar 2026 02:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772330698; cv=none; b=qBqj0IY9NJ21RtLOGc7YA2OEkdmDm5uYUj7eE16dBGcVqgisBe9nWabLWozLNN747kyMnbTbTuBZEG784uj892w/t5R+yg2uFmbNLPbZxWGc41YDSGRnbrClTTqr4ue3g2MyP5yfydwHMXpbJOkNfqMotzk5MwZOW6WVevbJVvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772330698; c=relaxed/simple;
	bh=iz5rkGEhX7Fs5/IeX5oRUe3EDqpjGudShX3ozAvAf5M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HsVMgqP7apVuFxk8O2JQsz35Jf7NCnAc3m1ADTyoscjdK/fsZSSPiwIMWkAmNGkp3pKAQKDbTijNJTFs2D0UPz/y+rKScEOXi0N/wexeVWob//s+5TROv09m2OKwG35fhTd1FRhSQP8SOLusz8gReDx/NJVKG+qm9CRCzW81Cvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NfXZQZDR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NfXZQZDR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDAD9C19421;
	Sun,  1 Mar 2026 02:04:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772330698;
	bh=iz5rkGEhX7Fs5/IeX5oRUe3EDqpjGudShX3ozAvAf5M=;
	h=From:To:Cc:Subject:Date:From;
	b=NfXZQZDRg39tHgMWsKopnkeev/qss5M4WR4D2amHqB4/2x+RmTg9y/ucUbEGMO5Cb
	 XAk3LRLfV3mxPz8dnEVSjDOZbQdft/mYnAFeaK6QUVVtR/P9BH144Ifdw4zqNIa+Lf
	 bj2oPVNDPoAEA19asE9cZIVU8mSF6NZgKwVAzq/lOYCcerQTWPhHiNqG3eDQXXJqXK
	 tB5ZheBpAhpAg+pmlJjgVm92RnFK+1AbSZfIie5Xij0h23OzMwDgIJUGvW9SJjpAFk
	 mU9xVAFRoZagDkLb5XxZr7SWVqwgrZaVLodBmRONwMFMdeZrj8BDrt4OUlb6nb7xnX
	 +0RpY8Oxpg9Gg==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	yangtiezhu@loongson.cn
Cc: Huacai Chen <chenhuacai@loongson.cn>,
	loongarch@lists.linux.dev
Subject: FAILED: Patch "LoongArch: Remove some extern variables in source files" failed to apply to 5.10-stable tree
Date: Sat, 28 Feb 2026 21:04:56 -0500
Message-ID: <20260301020456.1733498-1-sashal@kernel.org>
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

The patch below does not apply to the 5.10-stable tree.
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




