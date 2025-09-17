Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3F31205AB6
	for <loongarch@lists.linux.dev>; Wed, 17 Sep 2025 01:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758071425; cv=none; b=HeK4Hay6jm5WsKm13klnNRZ4erEERCTWoTyRJ6HRWa61o7DW2tNch9tRFsvgkqq1daHclNijIxbcp3PSsCNBgwWYjrWE27V2k2Kvq1Fs4zIa90thCY5UPvfULR4vhKje3nq9wLK3s83hYbUVYN5c1Btp4+OIFNdwn/DsssHzKVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758071425; c=relaxed/simple;
	bh=wKMnfmUFWqrW3ySwm0v+v7NekQfUF/7ARBBzoLlWHsA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z5LgAuzDIIkrXGY6NkrPPnFGDvPvc2/crJwaacBC0tUm6SMdGnW5iOxOYshAz1CEwyBinYV4bUDG8oZAiSmmHeJspx503KhmT/XyG2vZc741orkTK+AP6FyKX3pop8gHQ25a+BRBVkIHM1qbwyPNdP4Z/t6qzB9y7+EcZGlB9Wo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8Cxf9N8CspoIi4LAA--.23826S3;
	Wed, 17 Sep 2025 09:10:20 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowJAxE+RwCsposWOaAA--.35728S4;
	Wed, 17 Sep 2025 09:10:18 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Josh Poimboeuf <jpoimboe@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/4] objtool/LoongArch: Fix unreachable instruction warnings about image header
Date: Wed, 17 Sep 2025 09:10:05 +0800
Message-ID: <20250917011007.4540-3-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20250917011007.4540-1-yangtiezhu@loongson.cn>
References: <20250917011007.4540-1-yangtiezhu@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJAxE+RwCsposWOaAA--.35728S4
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoWxZF45AFyUKw1fCF17tF4rCrX_yoW5Cw4UpF
	47Cr1jyFZ8WFyqgw4DCw4a93yaqan8Xr4vqF1UJa43J3yq9asFq3ZYyw17GFyqqr4YgF4f
	Xr4UKrWDCa4jy3gCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkjb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4
	xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jw0_WrylYx0Ex4A2jsIE14v2
	6r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x0EwI
	xGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480
	Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7
	IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k2
	6cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxV
	AFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07josjUUUUUU=

When compiling with LLVM and CONFIG_LTO_CLANG is set, there exist the
following objtool warnings:

  vmlinux.o: warning: objtool: .head.text+0x0: unreachable instruction
  vmlinux.o: warning: objtool: .head.text+0x18: unreachable instruction
  vmlinux.o: warning: objtool: .head.text+0x38: unreachable instruction
  vmlinux.o: warning: objtool: .head.text+0x3c: unreachable instruction
  vmlinux.o: warning: objtool: .head.text+0x40: unreachable instruction
  vmlinux.o: warning: objtool: .head.text+0x44: unreachable instruction
  vmlinux.o: warning: objtool: .head.text+0x54: unreachable instruction
  vmlinux.o: warning: objtool: .head.text+0x58: unreachable instruction
  vmlinux.o: warning: objtool: .head.text+0x6c: unreachable instruction
  vmlinux.o: warning: objtool: .head.text+0x84: unreachable instruction
  vmlinux.o: warning: objtool: .head.text+0x94: unreachable instruction
  vmlinux.o: warning: objtool: .head.text+0x9c: unreachable instruction
  vmlinux.o: warning: objtool: .head.text+0xc4: unreachable instruction
  vmlinux.o: warning: objtool: .head.text+0xf8: unreachable instruction
  vmlinux.o: warning: objtool: .head.text+0xfc: unreachable instruction
  vmlinux.o: warning: objtool: .head.text+0x104: unreachable instruction
  vmlinux.o: warning: objtool: .head.text+0x10c: unreachable instruction
  vmlinux.o: warning: objtool: .head.text+0x11c: unreachable instruction
  vmlinux.o: warning: objtool: .head.text+0x120: unreachable instruction
  vmlinux.o: warning: objtool: .head.text+0x124: unreachable instruction
  vmlinux.o: warning: objtool: .head.text+0x144: unreachable instruction

All of the above instructions are in arch/loongarch/kernel/head.S,
and there is "OBJECT_FILES_NON_STANDARD_head.o := y" in Makefile
to skip objtool checking for head.o, but OBJECT_FILES_NON_STANDARD
does not work for link time validation of vmlinux.o according to
tools/objtool/Documentation/objtool.txt.

After many discussions, it is not proper to ignore .head.text section
in objtool or put them from text section to data section, so just give
a unwind hint to fix the above warnings.

Link: https://lore.kernel.org/lkml/20250814083651.GR4067720@noisy.programming.kicks-ass.net/
Link: https://lore.kernel.org/lkml/CAAhV-H6A_swQmqpWHp6ryAEvc96CAMOMd2ZGyJEVNMsJfLkz6w@mail.gmail.com/
Suggested-by: Peter Zijlstra <peterz@infradead.org>
Suggested-by: Huacai Chen <chenhuacai@kernel.org>
Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 arch/loongarch/kernel/head.S | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/loongarch/kernel/head.S b/arch/loongarch/kernel/head.S
index e3865e92a917..6ce999586757 100644
--- a/arch/loongarch/kernel/head.S
+++ b/arch/loongarch/kernel/head.S
@@ -20,6 +20,7 @@
 	__HEAD
 
 _head:
+	UNWIND_HINT_UNDEFINED
 	.word	IMAGE_DOS_SIGNATURE	/* "MZ", MS-DOS header */
 	.org	0x8
 	.dword	_kernel_entry		/* Kernel entry point (physical address) */
-- 
2.42.0

