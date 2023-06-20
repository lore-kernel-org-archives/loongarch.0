Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 194F079F6
	for <loongarch@lists.linux.dev>; Tue, 20 Jun 2023 07:52:13 +0000 (UTC)
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8Ax0OisWpFkQBwHAA--.12660S3;
	Tue, 20 Jun 2023 15:52:12 +0800 (CST)
Received: from bogon.localdomain (unknown [113.200.148.30])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8AxauWoWpFkdmghAA--.28374S5;
	Tue, 20 Jun 2023 15:52:11 +0800 (CST)
From: Youling Tang <tangyouling@loongson.cn>
To: Josh Poimboeuf <jpoimboe@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	madvenka@linux.microsoft.com
Cc: chenzhongjin@huawei.com,
	WANG Xuerui <kernel@xen0n.name>,
	Xi Ruoyao <xry111@xry111.site>,
	live-patching@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	tangyouling00@gmail.com,
	youling.tang@outlook.com
Subject: [RFC PATCH v1 18/23] LoongArch: Fix fpu.S objtool warning
Date: Tue, 20 Jun 2023 15:52:05 +0800
Message-Id: <1687247526-32258-4-git-send-email-tangyouling@loongson.cn>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1687247526-32258-1-git-send-email-tangyouling@loongson.cn>
References: <1687247526-32258-1-git-send-email-tangyouling@loongson.cn>
X-CM-TRANSID:AQAAf8AxauWoWpFkdmghAA--.28374S5
X-CM-SenderInfo: 5wdqw5prxox03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoW7JF4xCFy7GF1ruFy3AFyfZrc_yoW8JF1rpr
	9xArZ5Kr45Wa4fAa4jyw18WrZ8Ga97Ga1293WvyrWxAFWjgF1jqw40yrZ7XFyaq3yfJr4F
	qws5Wr4Sva1DCwbCm3ZEXasCq-sJn29KB7ZKAUJUUUU7529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUmIb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E
	14v26r4UJVWxJr1ln4kS14v26r1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6x
	kI12xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v2
	6r45tVCq3wAv7VC2z280aVAFwI0_Gr1j6F4UJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2
	IYc2Ij64vIr41lF7xvrVCFI7AF6II2Y40_Zr0_Gr1UMxkF7I0En4kS14v26r126r1DMxAI
	w28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMxCIbckI1I0E14v26r1Y6r17MI
	8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AK
	xVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26w1j6s0DMIIF0xvE2Ix0cI
	8IcVCY1x0267AKxVW8Jr0_Cr1UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E
	87Iv67AKxVW8Jr0_Cr1UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJbIYCTnIWIevJa
	73UjIFyTuYvjxU99YwUUUUU
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>

When objtool checked the fpu.o file, the following warnings appeared,
$ ./tools/objtool/objtool --orc arch/loongarch/kernel/fpu.o
arch/loongarch/kernel/fpu.o: warning: objtool: _save_fp_context() falls through
to next function fault()

This `fault` is only used in extable, it is not a function itself, and change
SYM_FUNC_START(fault) to the label method(.L_fault).

Signed-off-by: Youling Tang <tangyouling@loongson.cn>
---
 arch/loongarch/kernel/fpu.S | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/arch/loongarch/kernel/fpu.S b/arch/loongarch/kernel/fpu.S
index ccde94140c89..8331835c0591 100644
--- a/arch/loongarch/kernel/fpu.S
+++ b/arch/loongarch/kernel/fpu.S
@@ -20,9 +20,13 @@
 #define LSX_REG_WIDTH		16
 #define LASX_REG_WIDTH		32
 
+.L_fault:
+	li.w	a0, -EFAULT				# failure
+	jr	ra
+
 	.macro	EX insn, reg, src, offs
 .ex\@:	\insn	\reg, \src, \offs
-	_asm_extable .ex\@, fault
+	_asm_extable .ex\@, .L_fault
 	.endm
 
 	.macro sc_save_fp base
@@ -243,8 +247,3 @@ SYM_FUNC_START(_restore_fp_context)
 	li.w		a0, 0				# success
 	jr		ra
 SYM_FUNC_END(_restore_fp_context)
-
-SYM_FUNC_START(fault)
-	li.w	a0, -EFAULT				# failure
-	jr	ra
-SYM_FUNC_END(fault)
-- 
2.39.2

