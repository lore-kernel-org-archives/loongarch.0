Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B69F1EF0A1
	for <loongarch@lists.linux.dev>; Tue, 15 Oct 2024 11:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728992463; cv=none; b=n0rmFzwfwTD2b0BxrilLY24hHcefsHbeaukHKh0JTiAT+BRR4eq2m3JsBYXFqy3vAsGWTK3UMYcJmTUXIb4Umd10LsUAXnV60UWDeHO5Fsfi8fuufUwfl/I5z+T+mNl2X+rnpeKbjVRyAsCceCfKI4p2vmA3QT86NyvWbcVN6ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728992463; c=relaxed/simple;
	bh=ApEpc+gMzlX7HhsNG8gGJN7ES63x/5gdU3xsJJp/lNw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AsL/maov0nVOEMRhDKeMWV2rcW7xKNNyzQ2QIeRNt017snTqtWpZlDnqVXs2TrZSBBDqVbzUmkdkDT+HKoxA9m9MH2y2HT4vl3D1kYmbhFtOb4WnLvwsfD9pzOk7efXuSt9wAl852hGumyafWmfY6ES16NunDV/4UAxhq4FOONY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8AxDOtoVA5n+38dAA--.44136S3;
	Tue, 15 Oct 2024 19:39:20 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by front2 (Coremail) with SMTP id qciowMCxbcdkVA5n6E0uAA--.9583S7;
	Tue, 15 Oct 2024 19:39:20 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>
Cc: loongarch@lists.linux.dev,
	bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 5/6] LoongArch: Define specified arch_prepare_goto()
Date: Tue, 15 Oct 2024 19:39:14 +0800
Message-ID: <20241015113915.12623-6-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20241015113915.12623-1-yangtiezhu@loongson.cn>
References: <20241015113915.12623-1-yangtiezhu@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qciowMCxbcdkVA5n6E0uAA--.9583S7
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7CF1ftr4xAF43CF4xCF18CrX_yoW8WrW5pF
	9rZ3WkKFZ7Wr4fCrZrta4UWr15Xan3WF47WF1Iqa48AF90q34vyr1kK34DAFyUCan5JrWI
	gF1fWa4YgF4UJabCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUk2b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q6rW5McIj6I8E87Iv
	67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2
	Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s02
	6x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0x
	vE2Ix0cI8IcVAFwI0_Xr0_Ar1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE
	42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6x
	kF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxU2F4iUUUUU

In order to figure out the address of goto table by interpreting the
LoongArch machine code, define specified arch_prepare_goto() to insert
the relocation information of goto table address, then it can find the
destination address of the table jump instruction.

Suggested-by: Xi Ruoyao <xry111@xry111.site>
Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 arch/loongarch/Kconfig                |  1 +
 arch/loongarch/include/asm/compiler.h | 13 +++++++++++++
 2 files changed, 14 insertions(+)
 create mode 100644 arch/loongarch/include/asm/compiler.h

diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
index 49ed776cb253..9eed0bde678f 100644
--- a/arch/loongarch/Kconfig
+++ b/arch/loongarch/Kconfig
@@ -106,6 +106,7 @@ config LOONGARCH
 	select GPIOLIB
 	select HAS_IOPORT
 	select HAVE_ARCH_AUDITSYSCALL
+	select HAVE_ARCH_COMPILER_H
 	select HAVE_ARCH_JUMP_LABEL
 	select HAVE_ARCH_JUMP_LABEL_RELATIVE
 	select HAVE_ARCH_KASAN
diff --git a/arch/loongarch/include/asm/compiler.h b/arch/loongarch/include/asm/compiler.h
new file mode 100644
index 000000000000..424268a92c40
--- /dev/null
+++ b/arch/loongarch/include/asm/compiler.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2024 Loongson Technology Corporation Limited
+ */
+#ifndef _ASM_COMPILER_H
+#define _ASM_COMPILER_H
+
+#ifndef CONFIG_BPF_JIT_ALWAYS_ON
+#define arch_prepare_goto() \
+	asm volatile(".reloc\t., R_LARCH_NONE, %0" : : "i" (jumptable))
+#endif
+
+#endif /* _ASM_COMPILER_H */
-- 
2.42.0

