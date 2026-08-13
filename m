Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76935345CDA
	for <loongarch@lists.linux.dev>; Thu, 13 Aug 2026 04:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786596801; cv=none; b=lU8rDpP73iFKovCxYd3GAusN+q8RIFkq5N39UKWtFCOb0E40RZ9cie6KU6zlPMVFpTGzSBgavtnV0WBl0AjsQFJzjAfyPfdfH3GzY5oDK4LMCa1BAMKPrM407ZPrtzZuRRr2ZY6OZ4E3i04ohCVyypuX3OluT2TuC5bzFw2CCwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786596801; c=relaxed/simple;
	bh=/WeQs4kp94i9NU69HhPn78X79uzPNVFGzKZwcMv6Ntk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oLTEQAnioleKeWaJOROFxOgoTNh9k2XU5YeW8eepVoodb1CTCWg0TRSK5stV6+4R61oCVX4cvgyvQa+GcFX6ndjUEly3Zv5wkKuus+EOBYUUm+kbqzVjxJ2JPvCoYyU+oI9WsY1Mvpx8KXZ4QGslLATQUJYlRYztVlx3wKVRJpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [123.138.236.242])
	by gateway (Coremail) with SMTP id _____8CxvtK0TX1q_8sAAA--.2487S3;
	Thu, 13 Aug 2026 12:53:08 +0800 (CST)
Received: from linux.localdomain (unknown [123.138.236.242])
	by front1 (Coremail) with SMTP id qMiowJCxPs+0TX1qpf0CAA--.20229S2;
	Thu, 13 Aug 2026 12:53:09 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>,
	Hengqi Chen <hengqi.chen@gmail.com>
Cc: loongarch@lists.linux.dev,
	bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	George Guo <guodongtai@kylinos.cn>
Subject: [PATCH v1] LoongArch: BPF: Implement arch_bpf_stack_walk()
Date: Thu, 13 Aug 2026 12:53:06 +0800
Message-ID: <20260813045306.21571-1-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJCxPs+0TX1qpf0CAA--.20229S2
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoWxJFWxKF43KFW3WryxWr4rJFc_yoW5GF1xpr
	s0kanxKrZ0g34xXry3tw4UZrZ8Xr4kCr47KFW3CFyrCF9rX3Wxur9YkayqqFn8ArykJa1I
	qrZ0kF9Ika95AagCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkYb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
	Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE
	14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x
	0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E
	7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcV
	C0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF
	04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7
	CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8j-e5UUUUU==

From: George Guo <guodongtai@kylinos.cn>

Implement arch_bpf_stack_walk() on top of the ORC unwinder within
the LoongArch BPF JIT backend to provide generic BPF stack walking
capabilities.

This function is required by advanced BPF features, including timed
may_goto timeout tracing and BPF exceptions. It will be invoked in
the BPF core subsystem unwinding paths: bpf_prog_find_from_stack(),
bpf_stream_stage_dump_stack(), and bpf_throw().

Co-developed-by: Tiezhu Yang <yangtiezhu@loongson.cn>
Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
Signed-off-by: George Guo <guodongtai@kylinos.cn>
---
This is an independent feature, so split it from
https://lore.kernel.org/loongarch/20260702022322.51033-6-dongtai.guo@linux.dev/
Based on the latest loongarch-next, tested on Loongson-3A6000.

 arch/loongarch/net/bpf_jit.c | 38 ++++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/arch/loongarch/net/bpf_jit.c b/arch/loongarch/net/bpf_jit.c
index 7533917c6d47..78c20df2a2f3 100644
--- a/arch/loongarch/net/bpf_jit.c
+++ b/arch/loongarch/net/bpf_jit.c
@@ -2402,6 +2402,44 @@ bool bpf_jit_supports_subprog_tailcalls(void)
 	return true;
 }
 
+#if defined(CONFIG_UNWINDER_ORC)
+#include <asm/unwind.h>
+
+static noinline void walk_bpf_stackframe(bool (*consume_fn)(void *cookie, u64 ip, u64 sp, u64 bp),
+					 void *cookie, unsigned long fp)
+{
+	struct pt_regs dummyregs;
+	struct pt_regs *regs = &dummyregs;
+	struct unwind_state state;
+	unsigned long addr;
+
+	regs->regs[3] = (unsigned long)__builtin_frame_address(0);
+	regs->csr_era = (unsigned long)__builtin_return_address(0);
+	regs->regs[1] = 0;
+	regs->regs[22] = fp;
+
+	for (unwind_start(&state, current, regs);
+	     !unwind_done(&state); unwind_next_frame(&state)) {
+		addr = unwind_get_return_address(&state);
+		if (!addr || !consume_fn(cookie, (u64)addr, (u64)state.sp, (u64)state.fp))
+			break;
+	}
+}
+
+void arch_bpf_stack_walk(bool (*consume_fn)(void *cookie, u64 ip, u64 sp, u64 bp), void *cookie)
+{
+	unsigned long fp;
+
+	/*
+	 * Capture the live frame pointer ($r22) at the very front-line before
+	 * any kernel C code clobbers it. This must be a thin wrapper with no
+	 * large stack locals to prevent the compiler from reusing $r22 early.
+	 */
+	asm volatile("move %0, $r22" : "=r"(fp));
+	walk_bpf_stackframe(consume_fn, cookie, fp);
+}
+#endif /* CONFIG_UNWINDER_ORC */
+
 bool bpf_jit_supports_timed_may_goto(void)
 {
 	return true;
-- 
2.42.0

