Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E53F3998BE
	for <loongarch@lists.linux.dev>; Tue,  8 Sep 2026 07:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788853871; cv=none; b=ZNwg16a/TXWuP4ZhAkhPxkUMSTNrnLm6iQmsg5EpBdRJPNJR4+GlDCNkm1wqRpPH3QtsG/EB1PQh8fXjRQgzFb8SLGO8KNr4C8vFJl7x/IJDZVKE/d7kZZBhyhLR7nBbiTCDAU1KhLGFrsRMBvlvLJ+W4ZZOOR410IqvppaiGAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788853871; c=relaxed/simple;
	bh=i+XbG0C3Y1Z14Pm7tlM7Ix5h4dqleLfbW9K5xjNIP+E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sYnnBdyvdwplGFDSH7vnThnhBsl1aFkKTZ8k1BkhxLd0iWZRUizUuXhM/hQfYwSwwnostIMxS0D15lAQM5SBj0g6tJfpZy1Lw+6O06aAhHwzGt11YrVtsXGnBO9qscG2r9LhI2isuCb6ImBv2761he7GI919uaMz0rvJDEV6EMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [123.138.236.242])
	by gateway (Coremail) with SMTP id _____8CxPNJsvp9q+rgJAA--.27877S3;
	Tue, 08 Sep 2026 15:51:08 +0800 (CST)
Received: from linux.localdomain (unknown [123.138.236.242])
	by front1 (Coremail) with SMTP id qMiowJBx5cxrvp9qVRAdAA--.35215S3;
	Tue, 08 Sep 2026 15:51:07 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/6] LoongArch: Fix bitmask corruption in update_bp_registers()
Date: Tue,  8 Sep 2026 15:51:01 +0800
Message-ID: <20260908075106.5039-2-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20260908075106.5039-1-yangtiezhu@loongson.cn>
References: <20260908075106.5039-1-yangtiezhu@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJBx5cxrvp9qVRAdAA--.35215S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7tFWfKw15JF1fKF1ruF4ftFc_yoW8Zw15pr
	17uF4kGF4UWa13Xasrtr1kCr43Gw4Duw47Z3WfK34rtwn8CrnYvwnYgF9xXayUGw4fJ3WI
	vF1Fgr90vanrAwcCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkFb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r126r13M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
	Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ex4A2jsIE
	14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x
	0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E
	7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jrv_JF1lIxkGc2Ij64vIr41lIxAIcV
	C0I7IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF
	04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7
	CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jea0PUUUUU=

In update_bp_registers(), when disabling a LOAD or STORE watchpoint,
the code attempts to clear the bit of LoadEn or StoreEn by using the
standard bit-clearing pattern.

However, due to the omission of parentheses, the bitwise NOT operator
'~' takes higher precedence than the left shift operator '<<'. Then:
(1) ~0x1 << MWPnCFG3_LoadEn evaluates to "(~0x1) << 8 = 0xFFFFFE00",
(2) ~0x1 << MWPnCFG3_StoreEn evaluates to "(~0x1) << 9 = 0xFFFFFC00",
that incorrectly clears all configuration fields in the lower 8 bits.

These fields in the lower 8 bits contain critical configurations such
as DSOnly (bit 0), PLV0-PLV3 privilege levels (bits 1-4), and LCL (bit
7). Writing back these corrupted values severely breaks configuration
isolation and ruins the hardware watchpoint states.

Add parentheses to ensure the correct evaluation order, so that only
the targeted LoadEn/StoreEn bit is cleared while preserving the other
crucial configuration bits in the lower 8 bits.

Fixes: edffa33c7bb5 ("LoongArch: Add hardware breakpoints/watchpoints support")
Cc: stable@vger.kernel.org
Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 arch/loongarch/kernel/hw_breakpoint.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/loongarch/kernel/hw_breakpoint.c b/arch/loongarch/kernel/hw_breakpoint.c
index c35f9bf38033..6ba7315852f3 100644
--- a/arch/loongarch/kernel/hw_breakpoint.c
+++ b/arch/loongarch/kernel/hw_breakpoint.c
@@ -469,9 +469,9 @@ static void update_bp_registers(struct pt_regs *regs, int enable, int type)
 			} else {
 				ctrl = read_wb_reg(CSR_CFG_CTRL, i, 1);
 				if (info->ctrl.type == LOONGARCH_BREAKPOINT_LOAD)
-					ctrl &= ~0x1 << MWPnCFG3_LoadEn;
+					ctrl &= ~(0x1 << MWPnCFG3_LoadEn);
 				if (info->ctrl.type == LOONGARCH_BREAKPOINT_STORE)
-					ctrl &= ~0x1 << MWPnCFG3_StoreEn;
+					ctrl &= ~(0x1 << MWPnCFG3_StoreEn);
 				write_wb_reg(CSR_CFG_CTRL, i, 1, ctrl);
 			}
 			regs->csr_prmd &= ~CSR_PRMD_PWE;
-- 
2.42.0

