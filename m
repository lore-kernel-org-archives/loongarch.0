Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4BEF3043BF
	for <loongarch@lists.linux.dev>; Fri, 19 Sep 2025 09:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758274588; cv=none; b=pZQbgbMxLctMrvO8znG0cQ11AGmKLnGQQYgpxkK1oEE5af9opw5pcanq3DTmPVWZzd6DrkXHc1TBAJkyyucV1MSVT+sFJIxT7mzQjMHjYjIGQifuyl54sAxgVWbbAzH4ufmzmIiq8kuw2bcdX/PJHTdPFU7PaJ1ixZkvis+tVOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758274588; c=relaxed/simple;
	bh=c0aFLf+K/5xDdlOK+v5TNIoQS0iAmSlqkl9KH5H0XJg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lhgEUySBBRR9YY593YfBlKkWyhrzOtfmbJC0j+Qocz4DUNUTl7i6MVq9J4mcSi3U2XjNqmj9dFxx77UpiZG40dFyv4zsCdsGVz3aPDjYJIrpEAa5sE+SL31MaxTLBVKK8ylK9PDw7qX1iIlBMlgwgHqnB/MHczte9WrtR2uZSSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8BxWNEZJM1oqS0MAA--.26341S3;
	Fri, 19 Sep 2025 17:36:25 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowJDxbMEPJM1oMmufAA--.61162S5;
	Fri, 19 Sep 2025 17:36:24 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Josh Poimboeuf <jpoimboe@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-efi@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 3/3] riscv: Only link libstub to final vmlinux
Date: Fri, 19 Sep 2025 17:36:15 +0800
Message-ID: <20250919093615.30235-4-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20250919093615.30235-1-yangtiezhu@loongson.cn>
References: <20250919093615.30235-1-yangtiezhu@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJDxbMEPJM1oMmufAA--.61162S5
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7Gw15Wr13Kw43AFWrCFW5twc_yoW8Jr1kpw
	s8CF4jvrZ5urWrWa48X3y7W3y5Kws5XrZI9Fy8ArWUJrWrXwsrZrn8Ar42yFs3XFy8XFWf
	Jw4fCF1rCF4UA3gCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUk0b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I
	8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q6rW5McIj6I8E87Iv67AK
	xVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2Ij64
	vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8G
	jcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2I
	x0cI8IcVAFwI0_Gr0_Xr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK
	8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I
	0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUcHUqUUUUU

Since the efistub functions are useless for stack unwinder, they can be
ignored by objtool. No need to link libstub to the vmlinux.o, only link
libstub to the final vmlinux. Otherwise, there may be objtool warnings
when riscv supports objtool, this is to make consistent with the other
archs that use libstub.

Link: https://lore.kernel.org/lkml/pq4h7jgndnt6p45lj4kgubxjd5gidfetugcuf5rcxzxxanzetd@6rrlpjnjsmuy/
Suggested-by: Josh Poimboeuf <jpoimboe@kernel.org>
Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 arch/riscv/Makefile | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
index df57654a615e..cfd82b2c1bbf 100644
--- a/arch/riscv/Makefile
+++ b/arch/riscv/Makefile
@@ -173,7 +173,10 @@ boot-image-$(CONFIG_XIP_KERNEL)		:= xipImage
 KBUILD_IMAGE				:= $(boot)/$(boot-image-y)
 
 libs-y += arch/riscv/lib/
-libs-$(CONFIG_EFI_STUB) += $(objtree)/drivers/firmware/efi/libstub/lib.a
+
+ifdef CONFIG_EFI_STUB
+KBUILD_VMLINUX_LIBS_PRELINK += $(objtree)/drivers/firmware/efi/libstub/lib.a
+endif
 
 ifeq ($(KBUILD_EXTMOD),)
 ifeq ($(CONFIG_MMU),y)
-- 
2.42.0

