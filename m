Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5C8B1C1F35
	for <loongarch@lists.linux.dev>; Wed, 20 Nov 2024 15:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732115444; cv=none; b=G5719wRR82965dhptaowhOYr+EdCo/XpbNE3Tpw1HoZ8KcmNKMG+0+S55QqYZfcB4lNJzpwPknkb5V+cyEK+EzD8FRC/86OkClPmB9+gtmfsLmX5O+elqj/0/e5mlxHP4RA+/2BF+gYaPwvf+KsGhK3l100uTgcRoe5EWVUHwLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732115444; c=relaxed/simple;
	bh=SCPGHzzQ2BKPMQKq6ogaqxmB1VFuttE+wlSxcPJR2iM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=S2UmFOvINnZWCL82oz9m72Ej2BGLOMrbE61Osga1eOGwmGsRKraXwHsZ1ovm3PqrBpeDFBfRMiS0z3j7OY25k7RBhRukmwUOYzHBxBYnU+EEtvXLgSdmkIKwRtG0Wzdm2a0fdPBJfoDuwPRmAKclPI/qmU+lQyYUj1tsS1kAv50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.202])
	by gateway (Coremail) with SMTP id _____8Ax6+Hr+z1nKshDAA--.1420S3;
	Wed, 20 Nov 2024 23:10:35 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.68.202])
	by front1 (Coremail) with SMTP id qMiowMCx_8Lm+z1n8m9fAA--.10941S2;
	Wed, 20 Nov 2024 23:10:35 +0800 (CST)
From: Huacai Chen <chenhuacai@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	Xuerui Wang <kernel@xen0n.name>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	linux-kernel@vger.kernel.org,
	loongson-kernel@lists.loongnix.cn,
	Huacai Chen <chenhuacai@loongson.cn>,
	stable@vger.kernel.org,
	Haiyong Sun <sunhaiyong@loongson.cn>
Subject: [PATCH] LoongArch: Explicitly specify code model in Makefile
Date: Wed, 20 Nov 2024 23:10:26 +0800
Message-ID: <20241120151026.1683941-1-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.43.5
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMCx_8Lm+z1n8m9fAA--.10941S2
X-CM-SenderInfo: hfkh0x5xdftxo6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoW7Zry8Jw4rWF4rKF45uFy8WFX_yoW8JFW3pF
	Z3Zr1kKr48WrW8tFykJa43WF4DGa1Dtr42vF42q34UAFyrZw13Xr4rJa1kGF1UGasrA3yF
	gayfKFy3AFyDJ3cCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkFb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv
	67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2
	Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s02
	6x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0x
	vE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE
	42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6x
	kF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07jUsqXUUUUU=

LoongArch's toolchain may change the default code model from normal to
medium. This is unnecessary for kernel, and generates some relocations
which cannot be handled by the module loader. So explicitly specify the
code model to normal in Makefile (for Rust 'normal' is 'small').

Cc: stable@vger.kernel.org
Tested-by: Haiyong Sun <sunhaiyong@loongson.cn>
Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
---
 arch/loongarch/Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/loongarch/Makefile b/arch/loongarch/Makefile
index ae3f80622f4c..567bd122a9ee 100644
--- a/arch/loongarch/Makefile
+++ b/arch/loongarch/Makefile
@@ -59,7 +59,7 @@ endif
 
 ifdef CONFIG_64BIT
 ld-emul			= $(64bit-emul)
-cflags-y		+= -mabi=lp64s
+cflags-y		+= -mabi=lp64s -mcmodel=normal
 endif
 
 cflags-y			+= -pipe $(CC_FLAGS_NO_FPU)
@@ -104,7 +104,7 @@ ifdef CONFIG_OBJTOOL
 KBUILD_CFLAGS			+= -fno-jump-tables
 endif
 
-KBUILD_RUSTFLAGS		+= --target=loongarch64-unknown-none-softfloat
+KBUILD_RUSTFLAGS		+= --target=loongarch64-unknown-none-softfloat -Ccode-model=small
 KBUILD_RUSTFLAGS_KERNEL		+= -Zdirect-access-external-data=yes
 KBUILD_RUSTFLAGS_MODULE		+= -Zdirect-access-external-data=no
 
-- 
2.43.5

