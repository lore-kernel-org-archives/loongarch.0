Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=114.242.206.163
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794390755;
	b=2yjFOQtqg3d0a1/qBq99aOkX3oZKr1lvVLzy70yWl6DnOXs6ycXMD5A3/6bsANY6LEcD
	 kQkWkz6Mh3MlnLMSW1rkWX8a1KgLT5wi0GC6qqstXNYvFCKFO/Pk+P9mFLtnfKxr6svW4
	 s1Z1szAiuSgSekFPw/c515f6tvgTD0JfBP6JxbxpuP5CJRaJuwu2Yps+Vom9lSbTHbWvL
	 S41so/4LRJkCPBbCqlS1oBvRasbS11dGjpTfSS+3w6h4W7GHbeD9Sz+Ghkai07RZU69Is
	 216jvhdP7XaCqtWlqlf4VY5nPKIZJzgsOnTSuIrb7jcUfIeQPelZODnUsHn+kTQvLPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794390755;
	h=DMARC-Filter:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-CM-SenderInfo:
	 X-Coremail-Antispam;
	bh=EFQ5aKJbkCEgmmGSErZYKqxoWVZRX4rstimb9ink1b0=;
	b=LLq/h1UCDkwkp7yiuzvuIsN+aVPIzrsVqpgOcVwJ9e3zwnfKsXZQmWalFaGtIDV4tc2n
	 Q6fCfHBZW7c5NdWUK5pEPaKsK9SAY+0QU0yX1XPiU1/MONtZcV/bN70hIF7I7vZsZYBHc
	 uf6a6qCE9Vat2U0zvsX+5ZX2c3jcnC01OwolPcE3rWngtC/d3cp5Qb89XwCnBKWuRR4Sn
	 C7eECs/SDlIRvjP9QJyd8uABVqurSMWcXNslY3+NU/k1a0AuFjMtZBCmro6ra5LKpXLx1
	 dbC69y1uImCx71O554lTRlPaeQ7DxqCgA2A/grM0W3fY6n/ryBsXiruJuhmFYmOzusA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=loongson.cn;
	spf=pass smtp.mailfrom=loongson.cn;
	arc=none smtp.remote-ip=114.242.206.163
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65376606A333
	for <loongarch@lists.linux.dev>; Wed, 11 Nov 2026 09:52:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65376606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [123.138.236.242])
	by gateway (Coremail) with SMTP id _____8Cx_9LaOvRqaIEeAA--.22510S3;
	Wed, 11 Nov 2026 17:52:26 +0800 (CST)
Received: from linux.localdomain (unknown [123.138.236.242])
	by front1 (Coremail) with SMTP id qMiowJDxg8zSOvRqrLMzAA--.12000S5;
	Wed, 11 Nov 2026 17:52:26 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>,
	Hengqi Chen <hengqi.chen@gmail.com>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 3/3] LoongArch: BPF: Add support for indirect calls
Date: Wed, 11 Nov 2026 17:52:17 +0800
Message-ID: <20261111095217.31415-4-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20261111095217.31415-1-yangtiezhu@loongson.cn>
References: <20261111095217.31415-1-yangtiezhu@loongson.cn>
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJDxg8zSOvRqrLMzAA--.12000S5
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7Ary3JF1Utw4rGF4xuFy3trc_yoW8GFyrp3
	yDArn3ArWFgrWftFn7Ja18uw13KFs5W342qF1jq3yFk3ZxZrn8XF1rK34YqF98J3yrXw4x
	Xrs0krnxua1DJacCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
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

In order to implement JIT support for the indirect call instruction
(BPF_JMP | BPF_CALL | BPF_X), load REG_TCC from the stack (just like
a direct bpf2bpf call) first, and emit a jirl instruction to jump to
the target subprog address held in rd while saving PC+4 into return
address.

This is similar to commit 1cec0b70fdc6 ("riscv, bpf: Support indirect
calls to bpf subprogs (callx)").

Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 arch/loongarch/net/bpf_jit.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/loongarch/net/bpf_jit.c b/arch/loongarch/net/bpf_jit.c
index 64abebd9c950..8191dc5f09b6 100644
--- a/arch/loongarch/net/bpf_jit.c
+++ b/arch/loongarch/net/bpf_jit.c
@@ -1255,6 +1255,13 @@ static int build_insn(const struct bpf_insn *insn, struct jit_ctx *ctx, bool ext
 
 		break;
 
+	/* indirect call to a bpf subprog via the address in rd */
+	case BPF_JMP | BPF_CALL | BPF_X:
+		tcc_ptr_off = BPF_TAIL_CALL_CNT_PTR_STACK_OFF(ctx->stack_size);
+		emit_insn(ctx, ldd, REG_TCC, LOONGARCH_GPR_SP, tcc_ptr_off);
+		emit_insn(ctx, jirl, LOONGARCH_GPR_RA, rd, 0);
+		break;
+
 	/* tail call */
 	case BPF_JMP | BPF_TAIL_CALL:
 		if (emit_bpf_tail_call(ctx, i) < 0)
@@ -2544,3 +2551,8 @@ bool bpf_jit_inlines_helper_call(s32 imm)
 		return false;
 	}
 }
+
+bool bpf_jit_supports_callx(void)
+{
+	return true;
+}
-- 
2.42.0

