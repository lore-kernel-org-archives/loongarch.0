Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 543943BA22C
	for <loongarch@lists.linux.dev>; Thu, 24 Sep 2026 14:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790260038; cv=none; b=F9DNQuErI68j+Gogb4xtSAQdvmD7N8vs1CesQQZi0sBv3RZ2ViCkSK8m2K/0wGYZRU+ndX7kehlxphSfwQRrD0WfmdYd7DZa3zdcXh87cWF7fhZYvT+NXoz4ILeUa2WPmobi1MegHVERelS0EPCsws8VoAK/njw9Bg1oo0D8lmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790260038; c=relaxed/simple;
	bh=i+XbG0C3Y1Z14Pm7tlM7Ix5h4dqleLfbW9K5xjNIP+E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rNonjqu4jFozXz+ceSQSHHbXjey2AesXdcUSUXiwFNmUALDJyTuibmyHQM9xs5PT5EHtSheAtDyj8R7FL30cXPa7eQB73RaHwFqaFWNkADlR7DBFgDrHz5FlrzzVBkdE+VeaOk9pmrFH14fMO6AO1zRxV9qLKIKhjLCIQY5h42g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [123.138.236.242])
	by gateway (Coremail) with SMTP id _____8CxPNI_M7Vq23APAA--.45373S3;
	Thu, 24 Sep 2026 22:27:11 +0800 (CST)
Received: from linux.localdomain (unknown [123.138.236.242])
	by front1 (Coremail) with SMTP id qMiowJDxBc09M7Vqha8kAA--.50018S3;
	Thu, 24 Sep 2026 22:27:11 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/6] LoongArch: Fix bitmask corruption in update_bp_registers()
Date: Thu, 24 Sep 2026 22:27:03 +0800
Message-ID: <20260924142708.2459-2-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20260924142708.2459-1-yangtiezhu@loongson.cn>
References: <20260924142708.2459-1-yangtiezhu@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJDxBc09M7Vqha8kAA--.50018S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7tFWfKw15JF1fKF1ruF4ftFc_yoW8Zw15pr
	17uF4kGF4UWa13Xasrtr1kCr43Gw4Duw47Z3WfK34rtwn8CrnYvwnYgF9xXayUGw4fJ3WI
	vF1Fgr90vanrAwcCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkFb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv
	67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2
	Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s02
	6x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1Y6r17MIIYrxkI7VAKI48JMIIF0x
	vE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE
	42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6x
	kF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07j1WlkUUUUU=

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

