Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E871913F435
	for <loongarch@lists.linux.dev>; Tue, 15 Oct 2024 11:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728992363; cv=none; b=AbyKu6cugZ+2M6Qec7nW1YGh5MHrCUCCa4ORbUAjntDHR+EFOGPvFVBGY2Q98RlXnKRXhWCNieEGN8C1wdrjiq6UYSf4yUFdLeR6PGEcN7mlrUti7H2LCNen7LHJi2zGod01vWs5OgCUjHRxmJ2rbmFODdrmTfBQwP17f5k82wA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728992363; c=relaxed/simple;
	bh=SbfJr9+jdDKjyBPYTFn1HGRQF9YgV69BHlnKnAozTHU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OeqPcPlhxKwcF8b0Mg1H7gJr/btKyXpg2WM2k4eAeM9TO/eBT8uoR/d98ConIKh9NA+v76PvV4ele3heOYw5jo7oyOj1b/uw8o01RW/iW4E6kUqFeNxJvmtAL8MNcAxp4Sha138iJhM0CevR9aJQTUg8PqCbb/o9mm682hiWDDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8DxK_BnVA5n8X8dAA--.44015S3;
	Tue, 15 Oct 2024 19:39:19 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by front2 (Coremail) with SMTP id qciowMCxbcdkVA5n6E0uAA--.9583S5;
	Tue, 15 Oct 2024 19:39:19 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>
Cc: loongarch@lists.linux.dev,
	bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 3/6] LoongArch: Enable jump table for objtool
Date: Tue, 15 Oct 2024 19:39:12 +0800
Message-ID: <20241015113915.12623-4-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20241015113915.12623-1-yangtiezhu@loongson.cn>
References: <20241015113915.12623-1-yangtiezhu@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qciowMCxbcdkVA5n6E0uAA--.9583S5
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7tF47uFWrtr1xZw15Kw13Jrc_yoW8uF1kpr
	Z7Zr1kGr4kXF4vqry3J3yFg398AFnrtr4fXF4xWa4rCrWSq3yavw40yrsrGa40k398J3yS
	gFWfGa4ayF4UGwbCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUk2b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q6rW5McIj6I8E87Iv
	67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2
	Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s02
	6x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0x
	vE2Ix0cI8IcVAFwI0_Gr0_Xr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE
	42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6x
	kF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUcCD7UUUUU

For now, it can remove -fno-jump-tables and then enable jump table
for objtool if the compiler has option -mannotate-tablejump.

Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 arch/loongarch/Kconfig  | 8 +++++++-
 arch/loongarch/Makefile | 5 +----
 2 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
index bb35c34f86d2..49ed776cb253 100644
--- a/arch/loongarch/Kconfig
+++ b/arch/loongarch/Kconfig
@@ -150,7 +150,7 @@ config LOONGARCH
 	select HAVE_LIVEPATCH
 	select HAVE_MOD_ARCH_SPECIFIC
 	select HAVE_NMI
-	select HAVE_OBJTOOL if AS_HAS_EXPLICIT_RELOCS && AS_HAS_THIN_ADD_SUB
+	select HAVE_OBJTOOL if TOOLCHAIN_SUPPORTS_OBJTOOL
 	select HAVE_PCI
 	select HAVE_PERF_EVENTS
 	select HAVE_PERF_REGS
@@ -284,6 +284,12 @@ config AS_HAS_LBT_EXTENSION
 config AS_HAS_LVZ_EXTENSION
 	def_bool $(as-instr,hvcl 0)
 
+config CC_HAS_ANNOTATE_TABLEJUMP
+	def_bool $(cc-option,-mannotate-tablejump)
+
+config TOOLCHAIN_SUPPORTS_OBJTOOL
+	def_bool AS_HAS_EXPLICIT_RELOCS && AS_HAS_THIN_ADD_SUB && CC_HAS_ANNOTATE_TABLEJUMP
+
 menu "Kernel type and options"
 
 source "kernel/Kconfig.hz"
diff --git a/arch/loongarch/Makefile b/arch/loongarch/Makefile
index ae3f80622f4c..69a3b4ae6c60 100644
--- a/arch/loongarch/Makefile
+++ b/arch/loongarch/Makefile
@@ -99,10 +99,7 @@ KBUILD_AFLAGS			+= $(call cc-option,-mno-relax) $(call cc-option,-Wa$(comma)-mno
 KBUILD_CFLAGS			+= $(call cc-option,-mno-relax) $(call cc-option,-Wa$(comma)-mno-relax)
 KBUILD_AFLAGS			+= $(call cc-option,-mthin-add-sub) $(call cc-option,-Wa$(comma)-mthin-add-sub)
 KBUILD_CFLAGS			+= $(call cc-option,-mthin-add-sub) $(call cc-option,-Wa$(comma)-mthin-add-sub)
-
-ifdef CONFIG_OBJTOOL
-KBUILD_CFLAGS			+= -fno-jump-tables
-endif
+KBUILD_CFLAGS			+= $(call cc-option,-mannotate-tablejump)
 
 KBUILD_RUSTFLAGS		+= --target=loongarch64-unknown-none-softfloat
 KBUILD_RUSTFLAGS_KERNEL		+= -Zdirect-access-external-data=yes
-- 
2.42.0

