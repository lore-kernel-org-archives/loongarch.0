Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B354F3C5832
	for <loongarch@lists.linux.dev>; Tue, 30 Jun 2026 08:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782807298; cv=none; b=apIrtG8vLFgjWKGGCAa55FYT8aWtXlW2tODiGDFkdGZP3hdvowz4U3MqYKEvdcrT6WpYSDoTA98fCiR/m5fYxA7fw+RkEjZOwF0OmDujj6r3HGgmGbduQdYXzihTECpGwIWzypQ7d9TxUGgme6SXol/Flc8DnmaOlIyoLhCuGac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782807298; c=relaxed/simple;
	bh=voJ9BPJrGeyZ2ItfClp571G1LtIqFS5nvI+xO3xG7kI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=q/XPvgnhYKPGDBNUNdKADz3IAUcVnhnrmwY3XPyvcTiUrGSIlz+/lieJ03FB7QvWIcXDKjzKI0tUcugDiNJbgRgzbUKXwc7Gf2MO184Gevcu0RKhJyN8oz56e8clKGYBxBMd8x3sx1TiXZfLF+EX0omzhwSAZK3asLWlsIBa4ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.155])
	by gateway (Coremail) with SMTP id _____8Dxhun_ekNqGZEZAA--.65132S3;
	Tue, 30 Jun 2026 16:14:55 +0800 (CST)
Received: from kernelserver (unknown [223.64.68.155])
	by front1 (Coremail) with SMTP id qMiowJBxJMD0ekNqDda4AA--.20127S2;
	Tue, 30 Jun 2026 16:14:55 +0800 (CST)
From: Huacai Chen <chenhuacai@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	Xuefeng Li <lixuefeng@loongson.cn>,
	Guo Ren <guoren@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	linux-kernel@vger.kernel.org,
	Huacai Chen <chenhuacai@loongson.cn>
Subject: [PATCH] LoongArch: Fix build errors due to wrong instructions for 32BIT
Date: Tue, 30 Jun 2026 16:14:38 +0800
Message-ID: <20260630081438.2832564-1-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJBxJMD0ekNqDda4AA--.20127S2
X-CM-SenderInfo: hfkh0x5xdftxo6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoW7WFy5uF47XF1kGryruryxtFc_yoW8WrWUpr
	yfZwn8ZFWUurnrtrW7ArWkWFWjqws5Aw43u3ZrXw4rCas5ArykJr48CrnxGFWrtw4fur1S
	qw4rArZ2qFs7J3cCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkFb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r126r1DMcIj6I8E87Iv
	67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2
	Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s02
	6x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0x
	vE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE
	42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6x
	kF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07jOb18UUUUU=

In some assembly files there are some instructions that only valid for
64BIT, but those files can be compiled for 32BIT and cause build errors.

So, replace those instructions with macros:
li.d --> LONG_LI (li.w or li.d), addi.d --> PTR_ADDI (addi.w or addi.d).

BTW, Re-tab the indention in the assembly files for alignment.

Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
---
 arch/loongarch/kernel/rethook_trampoline.S | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/loongarch/kernel/rethook_trampoline.S b/arch/loongarch/kernel/rethook_trampoline.S
index d4ceb2fa2a5c..2e009fbea53f 100644
--- a/arch/loongarch/kernel/rethook_trampoline.S
+++ b/arch/loongarch/kernel/rethook_trampoline.S
@@ -71,27 +71,27 @@
 	cfi_ld	s7, PT_R30
 	cfi_ld	s8, PT_R31
 	LONG_L  t0, sp, PT_CRMD
-	li.d	t1, 0x7 /* mask bit[1:0] PLV, bit[2] IE */
+	LONG_LI	t1, 0x7 /* mask bit[1:0] PLV, bit[2] IE */
 	csrxchg t0, t1, LOONGARCH_CSR_CRMD
 	.endm
 
 SYM_CODE_START(arch_rethook_trampoline)
 	UNWIND_HINT_UNDEFINED
-	addi.d	sp, sp, -PT_SIZE
+	PTR_ADDI sp, sp, -PT_SIZE
 	save_all_base_regs
 
-	addi.d	t0, sp, PT_SIZE
-	LONG_S	t0, sp, PT_R3
+	PTR_ADDI t0, sp, PT_SIZE
+	LONG_S	 t0, sp, PT_R3
 
-	move a0, sp /* pt_regs */
+	move	 a0, sp /* pt_regs */
 
-	bl arch_rethook_trampoline_callback
+	bl	 arch_rethook_trampoline_callback
 
 	/* use the result as the return-address */
-	move ra, a0
+	move	 ra, a0
 
 	restore_all_base_regs
-	addi.d	sp, sp, PT_SIZE
+	PTR_ADDI sp, sp, PT_SIZE
 
-	jr ra
+	jr	 ra
 SYM_CODE_END(arch_rethook_trampoline)
-- 
2.52.0

