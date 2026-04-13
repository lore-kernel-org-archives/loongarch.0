Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7412E37CD5D
	for <loongarch@lists.linux.dev>; Mon, 13 Apr 2026 04:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776053132; cv=none; b=F9ulozhcfd2g1nLASQf3pvdlhSVhfPCFnjQ/5mIcnIJgIc4tQlV4rP8/ur1IIwxGIjUM1JuKZ3fz8y+jZ76tFY17M6vuLs/gIJEL3BqjPl1QAztWP+P10X4PTHEzR4YPXGS2o33YlLR82+TXFZ8Zu9duN+sD81eB/MkdrxUWhRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776053132; c=relaxed/simple;
	bh=XQ4Vez+4fynTr5VWS/XpBbVcpmlTMr1JImr1B/hJwLU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=epXc63A9LXb5feOFFNbBGlN1tJRVXiBWKHxI2cJ70LEpy9kfqmJ6bmxc9IK+XEy09+Df5OMvgqvcyvoinSYVGgsBa4OdkP1cDaRs2iLFXSaJJ+LWmQpdxjWTAJ8q9yJdD3LV69SXGfBN2OFIEDqhXFDYetyUst8RyOeaZtOmaMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8AxI_B8a9xpqwIAAA--.84S3;
	Mon, 13 Apr 2026 12:05:17 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowJDxaeBya9xpD91rAA--.9793S4;
	Mon, 13 Apr 2026 12:05:16 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>,
	Hengqi Chen <hengqi.chen@gmail.com>
Cc: loongarch@lists.linux.dev,
	bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/5] LoongArch: BPF: Add the default case in emit_atomic() and rename it
Date: Mon, 13 Apr 2026 12:05:03 +0800
Message-ID: <20260413040506.26640-3-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20260413040506.26640-1-yangtiezhu@loongson.cn>
References: <20260413040506.26640-1-yangtiezhu@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJDxaeBya9xpD91rAA--.9793S4
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7tFWrWr17WF43Jr4UAr1fAFc_yoW8Cr1Dpr
	s8AwsYkrZ3XwnYga4DJa9ruw13KFs5tay3JF4UZ3yxXwsIqr1DWF1rt3WqqFy5A3y8Wr1f
	XrsYkFyUu3W8J3cCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUk2b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r126r13M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q6rW5McIj6I8E87Iv
	67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2
	Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s02
	6x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0x
	vE2Ix0cI8IcVAFwI0_Gr0_Xr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE
	42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6x
	kF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUco7KUUUUU

Like the other archs such as x86 and riscv, add the default case
in emit_atomic() to print an error message for the invalid opcode
and return -EINVAL , then make its return type as int.

While at it, given that all of the instructions in emit_atomic()
are only read-modify-write instructions, rename emit_atomic() to
emit_atomic_rmw() to make it clear, because there will be a new
function emit_atomic_ld_st() for load-acquire and store-release
instructions in the later patch.

Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 arch/loongarch/net/bpf_jit.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/arch/loongarch/net/bpf_jit.c b/arch/loongarch/net/bpf_jit.c
index 9cb796e16379..fefda4050a20 100644
--- a/arch/loongarch/net/bpf_jit.c
+++ b/arch/loongarch/net/bpf_jit.c
@@ -344,7 +344,7 @@ static int emit_bpf_tail_call(struct jit_ctx *ctx, int insn)
 #undef jmp_offset
 }
 
-static void emit_atomic(const struct bpf_insn *insn, struct jit_ctx *ctx)
+static int emit_atomic_rmw(const struct bpf_insn *insn, struct jit_ctx *ctx)
 {
 	const u8 t1 = LOONGARCH_GPR_T1;
 	const u8 t2 = LOONGARCH_GPR_T2;
@@ -448,7 +448,12 @@ static void emit_atomic(const struct bpf_insn *insn, struct jit_ctx *ctx)
 			emit_zext_32(ctx, r0, true);
 		}
 		break;
+	default:
+		pr_err_once("bpf-jit: invalid atomic read-modify-write opcode %02x\n", imm);
+		return -EINVAL;
 	}
+
+	return 0;
 }
 
 static bool is_signed_bpf_cond(u8 cond)
@@ -1256,7 +1261,9 @@ static int build_insn(const struct bpf_insn *insn, struct jit_ctx *ctx, bool ext
 
 	case BPF_STX | BPF_ATOMIC | BPF_W:
 	case BPF_STX | BPF_ATOMIC | BPF_DW:
-		emit_atomic(insn, ctx);
+		ret = emit_atomic_rmw(insn, ctx);
+		if (ret)
+			return ret;
 		break;
 
 	/* Speculation barrier */
-- 
2.42.0

