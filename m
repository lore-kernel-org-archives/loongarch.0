Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D07381A256E
	for <loongarch@lists.linux.dev>; Tue,  6 Jan 2026 02:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767668127; cv=none; b=c9vB9Scll1Ta4Kfi+uHxNKgmUOEX8CIor8tq+L2k18EOnE5V++foxU0QHTK18f1sNC3d9rr9cIZRkwrgBgUk/TShJkI0CHORNrf5a7m45DPCBj+0+5Cb/0bAxiC0rFwUZ0NyvnW5e6epXyPlejdlLCP0/Fjcdwq0YcXol8CwYN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767668127; c=relaxed/simple;
	bh=fmT91oIOnqReX/Vuc295d8fDIpY7NrtNMKwQyfTV0vk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SWYtVK4n7xiiZP9MuvvnPQ1ceuJuO1RvtAwkYwlbe8NJdr5SFqrigFNeDehko1QFiMm+cQsMaDtWivBeP3boDnFDwPse2Uarg8zsGAHZtbtvsSZ87R8/eMDfGcv+btBm5MHaTQiM6mBDL3S+itoSiD2yHSeIYAlbEVtfWr3ZBK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.69.1])
	by gateway (Coremail) with SMTP id _____8DxOMKVeVxpTtMFAA--.18398S3;
	Tue, 06 Jan 2026 10:55:17 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.69.1])
	by front1 (Coremail) with SMTP id qMiowJBxiuCQeVxp450PAA--.7830S2;
	Tue, 06 Jan 2026 10:55:15 +0800 (CST)
From: Huacai Chen <chenhuacai@loongson.cn>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>
Cc: Xuerui Wang <kernel@xen0n.name>,
	stable@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	Chenghao Duan <duanchenghao@kylinos.cn>,
	Huacai Chen <chenhuacai@loongson.cn>
Subject: [PATCH 6.18] LoongArch: BPF: Enhance the bpf_arch_text_poke() function
Date: Tue,  6 Jan 2026 10:55:02 +0800
Message-ID: <20260106025502.951868-1-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJBxiuCQeVxp450PAA--.7830S2
X-CM-SenderInfo: hfkh0x5xdftxo6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoW7KFWUZrWkKw4fCr43ZF1fAFc_yoW8ur15pr
	1DArs5XrWUWr47Ja9rJw45Xry5Ja93Wr47WF43KryrCw13Xwn7Zw1Sk3ZxXasYkw48ur1r
	ZFZ8trnIg3WDZacCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkYb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
	Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE
	14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x
	0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E
	7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcV
	C0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF
	04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7
	CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8vApUUUUUU==

From: Chenghao Duan <duanchenghao@kylinos.cn>

commit 73721d8676771c6c7b06d4e636cc053fc76afefd upstream.

Enhance the bpf_arch_text_poke() function to enable accurate location
of BPF program entry points.

When modifying the entry point of a BPF program, skip the "move t0, ra"
instruction to ensure the correct logic and copy of the jump address.

Cc: stable@vger.kernel.org
Fixes: 677e6123e3d2 ("LoongArch: BPF: Disable trampoline for kernel module function trace")
Signed-off-by: Chenghao Duan <duanchenghao@kylinos.cn>
Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
---
 arch/loongarch/net/bpf_jit.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/arch/loongarch/net/bpf_jit.c b/arch/loongarch/net/bpf_jit.c
index 95c214e2cf09..87ff02513787 100644
--- a/arch/loongarch/net/bpf_jit.c
+++ b/arch/loongarch/net/bpf_jit.c
@@ -1307,6 +1307,10 @@ int bpf_arch_text_poke(void *ip, enum bpf_text_poke_type poke_type,
 		       void *old_addr, void *new_addr)
 {
 	int ret;
+	unsigned long size = 0;
+	unsigned long offset = 0;
+	void *image = NULL;
+	char namebuf[KSYM_NAME_LEN];
 	bool is_call = (poke_type == BPF_MOD_CALL);
 	u32 old_insns[LOONGARCH_LONG_JUMP_NINSNS] = {[0 ... 4] = INSN_NOP};
 	u32 new_insns[LOONGARCH_LONG_JUMP_NINSNS] = {[0 ... 4] = INSN_NOP};
@@ -1314,9 +1318,20 @@ int bpf_arch_text_poke(void *ip, enum bpf_text_poke_type poke_type,
 	/* Only poking bpf text is supported. Since kernel function entry
 	 * is set up by ftrace, we rely on ftrace to poke kernel functions.
 	 */
-	if (!is_bpf_text_address((unsigned long)ip))
+	if (!__bpf_address_lookup((unsigned long)ip, &size, &offset, namebuf))
 		return -ENOTSUPP;
 
+	image = ip - offset;
+
+	/* zero offset means we're poking bpf prog entry */
+	if (offset == 0) {
+		/* skip to the nop instruction in bpf prog entry:
+		 * move t0, ra
+		 * nop
+		 */
+		ip = image + LOONGARCH_INSN_SIZE;
+	}
+
 	ret = emit_jump_or_nops(old_addr, ip, old_insns, is_call);
 	if (ret)
 		return ret;
-- 
2.47.3

