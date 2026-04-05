Received: from out-188.mta0.migadu.com (out-188.mta0.migadu.com [91.218.175.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14D90328611
	for <loongarch@lists.linux.dev>; Sun,  5 Apr 2026 02:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775355219; cv=none; b=jxcmjpjZzG16tximiiyBKrqK0RFVeKgO5Zd6cpFkf8fckjr1SkA6JM4ksawmrBNLj+VTQr82xCSzBbDRUkACK/U0R4te2yUk5VnojSqdtgvqZAmUBKmpS3aCpZ6ouvifZhAxuroOhjdRBCtseLOy9S2iS2PfjaNVnl53CWCySzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775355219; c=relaxed/simple;
	bh=iFaPtTqe7LAYFqOmSED5TL+6Y3a2C1TOAguE9entkpg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qo5h7xSemiXfZhepZnTfHoYH2BQgrjG2x9kH69aaZ8iIYHCnaLwg3q/MpJBhkWQ3sI6ln6S/MgVuUTm/6hvw2YkWKDuZAL6+F5AHETDK3w75nGnXXDXjDca0qlEw6cMIcveBAb+SYiJ6Ui2HLRmOv6NgDmFhJJ9FrkC3gEsjOiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=d4gtDDIY; arc=none smtp.client-ip=91.218.175.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="d4gtDDIY"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1775355215;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Da5m6xFCvyjl/Ri3110AiD4l4usB8B5ztYetIF+TDMw=;
	b=d4gtDDIYfkXc4b+xadDJJhPS0sFN7kYpW+fp9p93/cQ4XPlrqhffnNU/Ks/W8/A3Ox4luh
	UtHM5wC15lh4x9kbv31pwea+P0ai7VoBVY14Orj35gK/rjw4y+He8VI0K706ZV2Q8kaZZP
	GZ16OM9ebFsneGeWlUCcDoa4cCfScq8=
From: Youling Tang <youling.tang@linux.dev>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Xi Ruoyao <xry111@xry111.site>,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	youling.tang@linux.dev,
	Youling Tang <tangyouling@kylinos.cn>
Subject: [PATCH v2 2/2] LoongArch: Batch icache maintenance for jump_label
Date: Sun,  5 Apr 2026 10:12:27 +0800
Message-ID: <20260405021227.532599-2-youling.tang@linux.dev>
In-Reply-To: <20260405021227.532599-1-youling.tang@linux.dev>
References: <20260405021227.532599-1-youling.tang@linux.dev>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

From: Youling Tang <tangyouling@kylinos.cn>

Switch to the batched version of the jump label update functions so
instruction cache maintenance is deferred until the end of the update.

Signed-off-by: Youling Tang <tangyouling@kylinos.cn>
---
 arch/loongarch/include/asm/jump_label.h |  1 +
 arch/loongarch/kernel/inst.c            |  6 +++---
 arch/loongarch/kernel/jump_label.c      | 13 +++++++++++--
 3 files changed, 15 insertions(+), 5 deletions(-)

diff --git a/arch/loongarch/include/asm/jump_label.h b/arch/loongarch/include/asm/jump_label.h
index dcaecf69ea5a..ceb3dfa66188 100644
--- a/arch/loongarch/include/asm/jump_label.h
+++ b/arch/loongarch/include/asm/jump_label.h
@@ -13,6 +13,7 @@
 #include <linux/stringify.h>
 #include <asm/asm.h>
 
+#define HAVE_JUMP_LABEL_BATCH
 #define JUMP_LABEL_NOP_SIZE	4
 
 #ifdef CONFIG_32BIT
diff --git a/arch/loongarch/kernel/inst.c b/arch/loongarch/kernel/inst.c
index 1a728082944c..0b9228b7c13a 100644
--- a/arch/loongarch/kernel/inst.c
+++ b/arch/loongarch/kernel/inst.c
@@ -209,6 +209,9 @@ int larch_insn_write(void *addr, u32 insn)
 	int ret;
 	unsigned long flags = 0;
 
+	if ((unsigned long)addr & 3)
+		return -EINVAL;
+
 	raw_spin_lock_irqsave(&patch_lock, flags);
 	ret = copy_to_kernel_nofault(addr, &insn, LOONGARCH_INSN_SIZE);
 	raw_spin_unlock_irqrestore(&patch_lock, flags);
@@ -221,9 +224,6 @@ int larch_insn_patch_text(void *addr, u32 insn)
 	int ret;
 	u32 *tp = addr;
 
-	if ((unsigned long)tp & 3)
-		return -EINVAL;
-
 	ret = larch_insn_write(tp, insn);
 	if (!ret)
 		flush_icache_range((unsigned long)tp,
diff --git a/arch/loongarch/kernel/jump_label.c b/arch/loongarch/kernel/jump_label.c
index 31891214b767..f5a394bdb5f3 100644
--- a/arch/loongarch/kernel/jump_label.c
+++ b/arch/loongarch/kernel/jump_label.c
@@ -6,9 +6,11 @@
  */
 #include <linux/kernel.h>
 #include <linux/jump_label.h>
+#include <asm/cacheflush.h>
 #include <asm/inst.h>
 
-void arch_jump_label_transform(struct jump_entry *entry, enum jump_label_type type)
+bool arch_jump_label_transform_queue(struct jump_entry *entry,
+				     enum jump_label_type type)
 {
 	u32 insn;
 	void *addr = (void *)jump_entry_code(entry);
@@ -18,5 +20,12 @@ void arch_jump_label_transform(struct jump_entry *entry, enum jump_label_type ty
 	else
 		insn = larch_insn_gen_nop();
 
-	larch_insn_patch_text(addr, insn);
+	larch_insn_write(addr, insn);
+
+	return true;
+}
+
+void arch_jump_label_transform_apply(void)
+{
+	flush_icache_all();
 }
-- 
2.43.0

