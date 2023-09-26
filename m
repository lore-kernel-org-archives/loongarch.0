Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 154F911CB8
	for <loongarch@lists.linux.dev>; Tue, 26 Sep 2023 08:11:06 +0000 (UTC)
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8BxpPASkhJlQ5UsAA--.19939S3;
	Tue, 26 Sep 2023 16:10:58 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Bxni8NkhJlnnoSAA--.37906S3;
	Tue, 26 Sep 2023 16:10:56 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	loongson-kernel@lists.loongnix.cn
Subject: [PATCH v1 1/3] LoongArch: Define relocation types added in ABI v2.10
Date: Tue, 26 Sep 2023 16:10:50 +0800
Message-Id: <1695715852-15902-2-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1695715852-15902-1-git-send-email-yangtiezhu@loongson.cn>
References: <1695715852-15902-1-git-send-email-yangtiezhu@loongson.cn>
X-CM-TRANSID:AQAAf8Bxni8NkhJlnnoSAA--.37906S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7Ary5Jw45trWUWFWxWr4fCrX_yoW8ArWUpr
	yDZr1DAr48GFn7ua48t3WkuF17XrykK3y2qa45WFyxCFsrX348Ar18Wrn8ZFWUWwsYgr1F
	grn3uw18XFZxJwbCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkFb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r126r1DMcIj6I8E87Iv
	67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2
	Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s02
	6x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0x
	vE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE
	42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6x
	kF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07jOb18UUUUU=
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>

The relocation types from 101 to 109 are used by GNU binutils >= 2.41,
add their definitions to use them in later patches.

Link: https://sourceware.org/git/?p=binutils-gdb.git;a=blob;f=include/elf/loongarch.h#l230
Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: <stable@vger.kernel.org>
---
 arch/loongarch/include/asm/elf.h | 9 +++++++++
 arch/loongarch/kernel/module.c   | 2 +-
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/arch/loongarch/include/asm/elf.h b/arch/loongarch/include/asm/elf.h
index 7af0ceb..b9a4ab5 100644
--- a/arch/loongarch/include/asm/elf.h
+++ b/arch/loongarch/include/asm/elf.h
@@ -111,6 +111,15 @@
 #define R_LARCH_TLS_GD_HI20			98
 #define R_LARCH_32_PCREL			99
 #define R_LARCH_RELAX				100
+#define R_LARCH_DELETE				101
+#define R_LARCH_ALIGN				102
+#define R_LARCH_PCREL20_S2			103
+#define R_LARCH_CFA				104
+#define R_LARCH_ADD6				105
+#define R_LARCH_SUB6				106
+#define R_LARCH_ADD_ULEB128			107
+#define R_LARCH_SUB_ULEB128			108
+#define R_LARCH_64_PCREL			109
 
 #ifndef ELF_ARCH
 
diff --git a/arch/loongarch/kernel/module.c b/arch/loongarch/kernel/module.c
index b8b8608..c3f9d2f 100644
--- a/arch/loongarch/kernel/module.c
+++ b/arch/loongarch/kernel/module.c
@@ -382,7 +382,7 @@ typedef int (*reloc_rela_handler)(struct module *mod, u32 *location, Elf_Addr v,
 
 /* The handlers for known reloc types */
 static reloc_rela_handler reloc_rela_handlers[] = {
-	[R_LARCH_NONE ... R_LARCH_RELAX]		     = apply_r_larch_error,
+	[R_LARCH_NONE ... R_LARCH_64_PCREL]		     = apply_r_larch_error,
 
 	[R_LARCH_NONE]					     = apply_r_larch_none,
 	[R_LARCH_32]					     = apply_r_larch_32,
-- 
2.1.0

