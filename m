Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=114.242.206.163
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795408757;
	b=UKnZpZ0Ox1wbz0AxNeQ4HNZq0W82AI4ymaVreBZmJwBkmg9W5LyrRDyM7Ae+cUhLPUZp
	 5h2hVcNYWsnE3vM+I2eYlPpW8vjOc0sesIg8Mxk9XiMIL0nmRMoyd4X6mElssMD90j4Q6
	 sfUISN49VVHJT24zN/ZqK775ZA9poVzzr646N7fUtB6vYcY9FyRkUjPU7Ym5sseXx6AX8
	 nOUBBy1kB9f5Q8MyIGpqqNJuxhtidnRImaqYGp66uAjZJnFYsU9Q6m/NJAHiKJqvSr8X4
	 wIgFrexCGIEIhQLTdR8qS4Sb15Z1YTHG8IP37Rns0YP/jV6JiyI0murtJEAMGs110Iw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795408757;
	h=DMARC-Filter:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-CM-SenderInfo:
	 X-Coremail-Antispam;
	bh=bV7AmIeoif0Xb99TtDOmDQ1HklCx/hLF6DDVzUDafnE=;
	b=mAW2aBaeeMfseHZ7Pp7vDR8ju28r2vaEVRpAa+C8gfgmV7JQvI2W2Q15oJ1gb1/ixtxb
	 WsTGSZEnh3n+57gRIq+whKnhnEfllGqTX7P2TuwS8xHDLNtX9/EZ+uqMVqVbQGwpRa4At
	 aLxFHLI9Jf/9DVMofdtqhSBNb0qmOtxZ9aEpl83c92XqbA/JzM64yns3sPGShfdqYsfJ5
	 f0wRvWEksVcZLvLZOiDDAdyf+IajzxGg7oPCXfbVMlrZ983rTV5EQQ09hhg6m4yULWvz6
	 e0gvQw8P4DaZ0QjwQ0NUL+NpBhL3pvSecD4ju5ORnViBMBGvekz47qGJUVUPxnnG+NA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=loongson.cn;
	spf=pass smtp.mailfrom=loongson.cn;
	arc=none smtp.remote-ip=114.242.206.163
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30579606A32E
	for <loongarch@lists.linux.dev>; Mon, 23 Nov 2026 04:39:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30579606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [123.138.236.242])
	by gateway (Coremail) with SMTP id _____8DxjdBywwNrGx0iAA--.4073S3;
	Mon, 23 Nov 2026 12:39:14 +0800 (CST)
Received: from linux.localdomain (unknown [123.138.236.242])
	by front1 (Coremail) with SMTP id qMiowJCxPs9rwwNra8s2AA--.43419S6;
	Mon, 23 Nov 2026 12:39:14 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>,
	Hengqi Chen <hengqi.chen@gmail.com>
Cc: loongarch@lists.linux.dev,
	bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 4/4] LoongArch: BPF: Add support for indirect calls
Date: Mon, 23 Nov 2026 12:39:07 +0800
Message-ID: <20261123043907.20225-5-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20261123043907.20225-1-yangtiezhu@loongson.cn>
References: <20261123043907.20225-1-yangtiezhu@loongson.cn>
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
X-CM-TRANSID:qMiowJCxPs9rwwNra8s2AA--.43419S6
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7Ary3JF13tryUGF4UJr48KrX_yoW8GFy3p3
	yDAr4fArZ5WryfKFnrJa1xuw13KFs5Wry2qF1jv3yFkanxZr1fXF1rK34YvF98Jw4rXw4x
	XrZ0krnxua1DJacCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
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
the target subprog address held in dst while saving PC+4 into return
address.

This is similar to commit 1cec0b70fdc6 ("riscv, bpf: Support indirect
calls to bpf subprogs (callx)").

Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 arch/loongarch/net/bpf_jit.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/loongarch/net/bpf_jit.c b/arch/loongarch/net/bpf_jit.c
index 52da39dce4f6..567729921d6d 100644
--- a/arch/loongarch/net/bpf_jit.c
+++ b/arch/loongarch/net/bpf_jit.c
@@ -1258,6 +1258,13 @@ static int build_insn(const struct bpf_insn *insn, struct jit_ctx *ctx, bool ext
 
 		break;
 
+	/* indirect call to a bpf subprog via the address in dst */
+	case BPF_JMP | BPF_CALL | BPF_X:
+		tcc_ptr_off = BPF_TAIL_CALL_CNT_PTR_STACK_OFF(ctx->stack_size);
+		emit_insn(ctx, ldd, REG_TCC, LOONGARCH_GPR_SP, tcc_ptr_off);
+		emit_insn(ctx, jirl, LOONGARCH_GPR_RA, dst, 0);
+		break;
+
 	/* tail call */
 	case BPF_JMP | BPF_TAIL_CALL:
 		if (emit_bpf_tail_call(ctx, i) < 0)
@@ -2559,3 +2566,8 @@ bool bpf_jit_inlines_helper_call(s32 imm)
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

