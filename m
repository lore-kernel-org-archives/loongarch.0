Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B67E630F535
	for <loongarch@lists.linux.dev>; Thu, 24 Sep 2026 14:27:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790260036; cv=none; b=rqwXfscvLmVHOmw1YjawGK2npjN3W+JBja3ByWnLd0QxBoaKtit/FvbFZE/a605Vof+0tv0/zRoKwmBXGvfYhdkvkXBt4u6p2mAqdsMhA4c6/DRkXM+yhEmYaWeVemO54ZBGPUl90cWcKSTgby+yWwl8DMpC9T3GHa74Lf8Aj5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790260036; c=relaxed/simple;
	bh=7udMkiSJsNGfAumk7yLV2lOLODDFfYghRIte5/70ZI4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n0S3iWk1FnNR8XBBSv5LUbI/LEWnOBbyhTH5AigWAl82paki7BTFk9y1vQI1adRCzVOQqYg70CdAGGLEffNxhWSFshzNoRV7K1TRu8WQbbgCG++16WyAAxNooe2uPTpppy2Lcyrm5AX6tkCS1RcgGXNrvk7kMosgwngrwud4mdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [123.138.236.242])
	by gateway (Coremail) with SMTP id _____8DxOvBAM7Vq4nAPAA--.45370S3;
	Thu, 24 Sep 2026 22:27:12 +0800 (CST)
Received: from linux.localdomain (unknown [123.138.236.242])
	by front1 (Coremail) with SMTP id qMiowJDxBc09M7Vqha8kAA--.50018S5;
	Thu, 24 Sep 2026 22:27:12 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 3/6] LoongArch: Fix architectural naming typo for CSR_FWPS_SKIP
Date: Thu, 24 Sep 2026 22:27:05 +0800
Message-ID: <20260924142708.2459-4-yangtiezhu@loongson.cn>
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
X-CM-TRANSID:qMiowJDxBc09M7Vqha8kAA--.50018S5
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoWxArWxJry5KF15AryxKw1fZrc_yoW5Zryrpr
	nrZF95GrW8WFs7Gan8ta1rur47tFZ7Gw429anYk3yS9F47X34rJF109rnrXF15Xw4rX34F
	qFnYkw1jgFyUA3XCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUk2b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q6rW5McIj6I8E87Iv
	67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2
	Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s02
	6x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1Y6r17MIIYrxkI7VAKI48JMIIF0x
	vE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE
	42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6x
	kF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUcCD7UUUUU

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

