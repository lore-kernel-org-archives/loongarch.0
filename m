Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE3051A262A
	for <loongarch@lists.linux.dev>; Fri, 28 Aug 2026 07:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787903469; cv=none; b=N1cjMriknl/7CefolOPznI+Gh3oneapE4fK3JtTxngPWP6g6sSuknU5V47LrDtU21dvq3OsXZ4JUaVgv+VJveK/Js5On92lkdcfvJbXWTaFONDNd6UE9GXV2ol9B14hwsAU4ZMuBghXN12N6jihGuUELC1ua2+SZ5yyi08WXPlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787903469; c=relaxed/simple;
	bh=1OjkvvAZOnGlCuXH2KuSAvAMmthp6CXtjH/L+oEPLe4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HYqqJ9M9ak9fQtYzU1Do37cEWIKEFbw8Sdix73lK++wjnVLkb6Ht5/HrPCvJT9qJbyJGLwyZKyIaktx35pJM++mzwJYhpURHmfqWhBUGSuGl5YbnpaEsI5o0tR/Ok7AccpGayUuz5uW7r7f+r1+h0Mrc51wXMiIODljK5enKqOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [123.138.236.242])
	by gateway (Coremail) with SMTP id _____8BxLtPnPZFqlAcGAA--.16996S3;
	Fri, 28 Aug 2026 15:51:03 +0800 (CST)
Received: from linux.localdomain (unknown [123.138.236.242])
	by front1 (Coremail) with SMTP id qMiowJAxmM3lPZFq5D0VAA--.41531S2;
	Fri, 28 Aug 2026 15:51:02 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: loongarch@lists.linux.dev,
	bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] LoongArch: BPF: Fix off-by-one error for insn_is_cast_user
Date: Fri, 28 Aug 2026 15:51:00 +0800
Message-ID: <20260828075100.24776-1-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJAxmM3lPZFq5D0VAA--.41531S2
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7Zr1kur4DtFyrJF1xtFyDCFX_yoW8WF1rpr
	ZxCws8KFWUWry3ua4DJayIvF1ftFs3Wr43WF12y3yFy3sIqryFqFyrK3sIkFnYkw48Zr1F
	qr9Ykw1Yva4DZacCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkFb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
	Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE
	14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x
	0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E
	7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcV
	C0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF
	04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7
	CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07j0sjUUUUUU=

Fix a severe off-by-one error in the branch offset calculation for the
user pointer cast helper insn_is_cast_user() inside build_insn().

In the current code, an offset of 1 causes the "beq" to target the next
"or" instruction, which means the "or" instruction is always executed,
even if the pointer is NULL. Thus, a native NULL pointer is incorrectly
combined with the arena base address and turns into a non-zero address,
breaking nullable safety guards and causing silent memory corruption.

Fix this by changing the branch offset from 1 to 2, which properly skips
the "or" instruction and jumps directly to the "move_reg" instruction if
the pointer is NULL, ensuring the destination register is safely cleared
to 0.

Fixes: 4fdb5dd8aeba ("LoongArch: BPF: Implement bpf_addr_space_cast instruction")
Cc: stable@vger.kernel.org
Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 arch/loongarch/net/bpf_jit.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/loongarch/net/bpf_jit.c b/arch/loongarch/net/bpf_jit.c
index 1eb588e443c9..4da278900938 100644
--- a/arch/loongarch/net/bpf_jit.c
+++ b/arch/loongarch/net/bpf_jit.c
@@ -717,7 +717,7 @@ static int build_insn(const struct bpf_insn *insn, struct jit_ctx *ctx, bool ext
 			move_reg(ctx, t1, src);
 			emit_zext_32(ctx, t1, true);
 			move_imm(ctx, dst, (ctx->user_vm_start >> 32) << 32, false);
-			emit_insn(ctx, beq, t1, LOONGARCH_GPR_ZERO, 1);
+			emit_insn(ctx, beq, t1, LOONGARCH_GPR_ZERO, 2);
 			emit_insn(ctx, or, t1, dst, t1);
 			move_reg(ctx, dst, t1);
 			break;
-- 
2.42.0

