Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C23B277032
	for <loongarch@lists.linux.dev>; Tue, 22 Apr 2025 11:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745320048; cv=none; b=CZHdoINuKmjmAdObhia5bcv6opZKIDgracLvKqSHzylVxVPSrT1DsFdpdOwOSmSrbvjnTwjr/WlvxVlVm8XPkdKjNBBL1ZXlhybXGupZoASpc1AnYUW48JCzEASeSTly4+0q4KQQQwE82agPa7l7CpvaBR2DtK5cAekRWH+n3Vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745320048; c=relaxed/simple;
	bh=B0mqH/GhTJVmfY3J8t0PqVycZFkniE9/OOhD7YK8Q0Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C24ldFUfKRmBcK1av986B/KQ3mR+nabybCTrtGL1uhsZ5XtM6aoAQSJrX9czvrAkRpNwgO8ra1FgQLz6Iz3CMdk+yI9w/atro7HjNHDMj10iy7ss/VNFGHG93W+RhZSqfM6kg/q7kcq+2SRsxXWodnbtVO89KLt9q/y5mqMiN/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8Bx32tpeAdo_PvDAA--.62868S3;
	Tue, 22 Apr 2025 19:07:21 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowMCxbsVneAdoe9yPAA--.33268S3;
	Tue, 22 Apr 2025 19:07:21 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] LoongArch: Make regs_irqs_disabled() more clear
Date: Tue, 22 Apr 2025 19:07:18 +0800
Message-ID: <20250422110719.15673-2-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20250422110719.15673-1-yangtiezhu@loongson.cn>
References: <20250422110719.15673-1-yangtiezhu@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMCxbsVneAdoe9yPAA--.33268S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7Cr1rWF1xtw1UZF4UXryUCFX_yoW8GrWUpF
	9rCF97GF48uF109FZrXFZ8XrZ8JrZ5G392kw17Ga4YyF15Xr1Fqrn7Gw1YvFy8Aa9ayFya
	qFn8tr1rZF45ZabCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUyEb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4
	xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v2
	6r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x0EwI
	xGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480
	Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jrv_JF1lIxkGc2Ij64vIr41lIxAIcVC0I7
	IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k2
	6cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxV
	AFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8j-e5UUUUU==

In the current code, the definition of regs_irqs_disabled() is actually
!(regs->csr_prmd & CSR_CRMD_IE) because arch_irqs_disabled_flags() is
defined as !(flags & CSR_CRMD_IE), it looks a little strange.

Define regs_irqs_disabled() as !(regs->csr_prmd & CSR_PRMD_PIE) directly
to make it more clear, no functional change.

While at it, the return value of regs_irqs_disabled() is true or false,
so change its type to reflect that and also make it always inline.

Fixes: 803b0fc5c3f2 ("LoongArch: Add process management")
Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 arch/loongarch/include/asm/ptrace.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/loongarch/include/asm/ptrace.h b/arch/loongarch/include/asm/ptrace.h
index f3ddaed9ef7f..a5b63c84f854 100644
--- a/arch/loongarch/include/asm/ptrace.h
+++ b/arch/loongarch/include/asm/ptrace.h
@@ -33,9 +33,9 @@ struct pt_regs {
 	unsigned long __last[];
 } __aligned(8);
 
-static inline int regs_irqs_disabled(struct pt_regs *regs)
+static __always_inline bool regs_irqs_disabled(struct pt_regs *regs)
 {
-	return arch_irqs_disabled_flags(regs->csr_prmd);
+	return !(regs->csr_prmd & CSR_PRMD_PIE);
 }
 
 static inline unsigned long kernel_stack_pointer(struct pt_regs *regs)
-- 
2.42.0

