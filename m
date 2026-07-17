Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDFEB3C4161
	for <loongarch@lists.linux.dev>; Fri, 17 Jul 2026 09:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784281156; cv=none; b=dWUcWEQ8tItJC8KSgGhgE+D5hvUUkZCyry8GmpCgDE/GdOTYjTcvv529Uevy0qNRDUhNFyYCrsUNq+DLV//RI3nr0DuxiyxmKMFFBjF6Q8gT5k6qzvjeBFx68IbcYwg+DlPIoa8nLja+JItr2BZNn51mNwWFJ4bmEecTyCqVAXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784281156; c=relaxed/simple;
	bh=MO2w516jQZwoyRX5Cavs+/KzCbKPXi96UH+/b8oQdiQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DKegRlSvvvgxGDWVbga9vDP6Cd1eT+2GhL9BisuJHTuplelJj2PHjVCdd2jJw7CHjpxGAADTiDRuyGBV/DePn4LWnoyyejm6BkGB4vREJyBpfU3fJIKftOlC2D57pup5clp1nrPJJpxrzFSWI/qxT7JNALqY4YrpkcgZPFXLUlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8Dx8+k++FlqjYIEAA--.8479S3;
	Fri, 17 Jul 2026 17:39:10 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowJBxEuQ8+FlqNO0PAA--.13806S2;
	Fri, 17 Jul 2026 17:39:09 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] LoongArch: Use generic cmp_int() instead of custom cmp_3way()
Date: Fri, 17 Jul 2026 17:39:07 +0800
Message-ID: <20260717093907.30010-1-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJBxEuQ8+FlqNO0PAA--.13806S2
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7Ar43JFyUWrWrtFy7uryUArc_yoW8GrWUpF
	W5CrnxGr48Grn5Wa18CF1qgr45Gr9rGwsxZanFka92yw1qqw1jvw40qrn8Ca4jg34xGrW8
	XrW093s0ga48AabCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUk2b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv
	67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2
	Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s02
	6x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1Y6r17MIIYrxkI7VAKI48JMIIF0x
	vE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE
	42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6x
	kF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxU2ID7UUUUU

Currently, the module-sections.c file defines a custom cmp_3way() macro to
perform a three-way comparison. There is already a generic cmp_int() macro
to do the same thing in linux/sort.h, thus remove the custom macro and use
the generic interface. This is similar with commit 3e17a4b443bb ("riscv:
module: Use generic cmp_int() instead of custom cmp_3way()").

Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 arch/loongarch/kernel/module-sections.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/loongarch/kernel/module-sections.c b/arch/loongarch/kernel/module-sections.c
index 9fa1c9814fcc..0259d9c7ea30 100644
--- a/arch/loongarch/kernel/module-sections.c
+++ b/arch/loongarch/kernel/module-sections.c
@@ -62,16 +62,14 @@ Elf_Addr module_emit_plt_entry(struct module *mod, Elf_Shdr *sechdrs, Elf_Addr v
 	return (Elf_Addr)&plt[nr];
 }
 
-#define cmp_3way(a, b)  ((a) < (b) ? -1 : (a) > (b))
-
 static int compare_rela(const void *x, const void *y)
 {
 	int ret;
 	const Elf_Rela *rela_x = x, *rela_y = y;
 
-	ret = cmp_3way(rela_x->r_info, rela_y->r_info);
+	ret = cmp_int(rela_x->r_info, rela_y->r_info);
 	if (ret == 0)
-		ret = cmp_3way(rela_x->r_addend, rela_y->r_addend);
+		ret = cmp_int(rela_x->r_addend, rela_y->r_addend);
 
 	return ret;
 }
-- 
2.42.0

