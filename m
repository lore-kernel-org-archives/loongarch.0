Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7313E3BF68F
	for <loongarch@lists.linux.dev>; Wed, 26 Aug 2026 11:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787742325; cv=none; b=JW6rQVoZJ6rNHMR1AnDYiUbC9WAuLQZp26YGpl+gqhaRiznCG5uP6YQLRiy5OgMCzfH/80BmE/9d5YvhM9oidR3aC9v6C/uWIyJG2bNgGS9oPGncFyBJSnLx63ok1BNLndfcOIE94T+6UNZtm1XLFwn5MYfkqMgUKbXwC9REA4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787742325; c=relaxed/simple;
	bh=7udMkiSJsNGfAumk7yLV2lOLODDFfYghRIte5/70ZI4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pJzDPAWbVV5vNt7fiPeLmCi1QFPAxarWz9FpL4q3QU2A0E9ed550WvOQqQOkoN37+hxPGOhxZkACtV6cmZNHq9M3hKi37VxGTd85cPH1g7C1qqh9qx30gNKtNM8OcQfPNvOI1Nt+b4Wfe7DQy3ExH6Dny2/7NJ1p9pGz/TMbMHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [123.138.236.242])
	by gateway (Coremail) with SMTP id _____8CxfdLtx45q6DsFAA--.14555S3;
	Wed, 26 Aug 2026 19:03:09 +0800 (CST)
Received: from linux.localdomain (unknown [123.138.236.242])
	by front1 (Coremail) with SMTP id qMiowJDxg8zrx45qn+8SAA--.8826S5;
	Wed, 26 Aug 2026 19:03:09 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 3/6] LoongArch: Fix architectural naming typo for CSR_FWPS_SKIP
Date: Wed, 26 Aug 2026 19:03:03 +0800
Message-ID: <20260826110306.6847-4-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20260826110306.6847-1-yangtiezhu@loongson.cn>
References: <20260826110306.6847-1-yangtiezhu@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJDxg8zrx45qn+8SAA--.8826S5
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoWxArWxJry5KF15AryxKw1fZrc_yoW5Zryrpr
	nrZF95GrW8WFs7Gan8ta1rur47tFZ7Gw429anYk3yS9F47X34rJF109rnrXF15Xw4rX34F
	qFnYkw1jgFyUA3XCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkFb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q6rW5McIj6I8E87Iv
	67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2
	Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s02
	6x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1Y6r17MIIYrxkI7VAKI48JMIIF0x
	vE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE
	42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6x
	kF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07josjUUUUUU=

According to the LoongArch Reference Manual, the single-step 'Skip'
bit resides in the instruction breakpoint status register CSR.FWPS,
rather than the configuration register CSR.FWPC.

Furthermore, the kernel code comments also explicitly document it
as "CSR.FWPS.Skip", yet the actual macro was erroneously defined
as CSR_FWPC_SKIP and used as such in traps.c and hw_breakpoint.c.
This mismatch creates architectural naming confusion.

Fix this by renaming the macro from CSR_FWPC_SKIP to CSR_FWPS_SKIP
to precisely match the manual and comments. Also, update all call
sites to align with the rectified definition.

Fixes: 424421a7f34c ("LoongArch: ptrace: Add hardware single step support")
Cc: stable@vger.kernel.org
Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 arch/loongarch/include/asm/loongarch.h | 4 ++--
 arch/loongarch/kernel/hw_breakpoint.c  | 2 +-
 arch/loongarch/kernel/traps.c          | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/loongarch/include/asm/loongarch.h b/arch/loongarch/include/asm/loongarch.h
index 2a6bc99177d8..32bbff337c5c 100644
--- a/arch/loongarch/include/asm/loongarch.h
+++ b/arch/loongarch/include/asm/loongarch.h
@@ -1130,8 +1130,8 @@
 #define LOONGARCH_CSR_DERA		0x501	/* debug era */
 #define LOONGARCH_CSR_DESAVE		0x502	/* debug save */
 
-#define CSR_FWPC_SKIP_SHIFT		16
-#define CSR_FWPC_SKIP			(_ULCAST_(1) << CSR_FWPC_SKIP_SHIFT)
+#define CSR_FWPS_SKIP_SHIFT		16
+#define CSR_FWPS_SKIP			(_ULCAST_(1) << CSR_FWPS_SKIP_SHIFT)
 
 /*
  * CSR_ECFG IM
diff --git a/arch/loongarch/kernel/hw_breakpoint.c b/arch/loongarch/kernel/hw_breakpoint.c
index bd891b3808a6..7f69cf361a5e 100644
--- a/arch/loongarch/kernel/hw_breakpoint.c
+++ b/arch/loongarch/kernel/hw_breakpoint.c
@@ -550,7 +550,7 @@ void hw_breakpoint_thread_switch(struct task_struct *next)
 		addr = read_wb_reg(CSR_CFG_ADDR, 0, 0);
 		mask = read_wb_reg(CSR_CFG_MASK, 0, 0);
 		if (!((regs->csr_era ^ addr) & ~mask))
-			csr_write32(CSR_FWPC_SKIP, LOONGARCH_CSR_FWPS);
+			csr_write32(CSR_FWPS_SKIP, LOONGARCH_CSR_FWPS);
 		regs->csr_prmd |= CSR_PRMD_PWE;
 	} else {
 		/* Update breakpoints */
diff --git a/arch/loongarch/kernel/traps.c b/arch/loongarch/kernel/traps.c
index 776523747ea3..c4d7e55fb3ea 100644
--- a/arch/loongarch/kernel/traps.c
+++ b/arch/loongarch/kernel/traps.c
@@ -829,7 +829,7 @@ asmlinkage void noinstr do_watch(struct pt_regs *regs)
 			 * instruction. So don't clear llbit and reset CSR.FWPS.Skip until
 			 * the llsc execution is completed.
 			 */
-			csr_write32(CSR_FWPC_SKIP, LOONGARCH_CSR_FWPS);
+			csr_write32(CSR_FWPS_SKIP, LOONGARCH_CSR_FWPS);
 			csr_write32(CSR_LLBCTL_KLO, LOONGARCH_CSR_LLBCTL);
 			goto out;
 		}
@@ -846,7 +846,7 @@ asmlinkage void noinstr do_watch(struct pt_regs *regs)
 				 * current pc, If yes, then we should not set the CSR.FWPS.SKIP
 				 * bit to break the original instruction stream.
 				 */
-				csr_write32(CSR_FWPC_SKIP, LOONGARCH_CSR_FWPS);
+				csr_write32(CSR_FWPS_SKIP, LOONGARCH_CSR_FWPS);
 				goto out;
 			}
 		}
-- 
2.42.0

