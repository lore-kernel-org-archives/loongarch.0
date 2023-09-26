Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46A64125A1
	for <loongarch@lists.linux.dev>; Tue, 26 Sep 2023 08:11:09 +0000 (UTC)
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8Cxh+gUkhJlTJUsAA--.49669S3;
	Tue, 26 Sep 2023 16:11:00 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Bxni8NkhJlnnoSAA--.37906S5;
	Tue, 26 Sep 2023 16:10:59 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	loongson-kernel@lists.loongnix.cn
Subject: [PATCH v1 3/3] LoongArch: Add support for 64_PCREL relocation type
Date: Tue, 26 Sep 2023 16:10:52 +0800
Message-Id: <1695715852-15902-4-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1695715852-15902-1-git-send-email-yangtiezhu@loongson.cn>
References: <1695715852-15902-1-git-send-email-yangtiezhu@loongson.cn>
X-CM-TRANSID:AQAAf8Bxni8NkhJlnnoSAA--.37906S5
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoWxJr43Kryrury7ZrWDZr1xtFc_yoW8Zw43pr
	yfAwnxXa1fKFn7Xayqv3WkWw1rWaykW342ga9a9r97ArnxJFyj9w1xtryDtayjvrs5uF4r
	ZryIq3WrZanrAwbCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUk2b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q6rW5McIj6I8E87Iv
	67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2
	Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s02
	6x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0x
	vE2Ix0cI8IcVAFwI0_Gr0_Xr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE
	42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6x
	kF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUcCD7UUUUU
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>

When build and update kernel with the latest upstream binutils and
loongson3_defconfig, the serial console works well with the previous
32_PCREL patch, but it can not enter the graphical interface due to
it failed to start lightdm service, there are more info like this:

  kmod: zsmalloc: Unknown relocation type 109
  kmod: fuse: Unknown relocation type 109
  kmod: fuse: Unknown relocation type 109
  kmod: radeon: Unknown relocation type 109
  kmod: nf_tables: Unknown relocation type 109
  kmod: nf_tables: Unknown relocation type 109

This is because the latest upstream binutils replaces a pair of ADD64
and SUB64 with 64_PCREL, so add support for 64_PCREL relocation type.

Link: https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=ecb802d02eeb
Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: <stable@vger.kernel.org>
---
 arch/loongarch/kernel/module.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/loongarch/kernel/module.c b/arch/loongarch/kernel/module.c
index 9e10c44..b13b285 100644
--- a/arch/loongarch/kernel/module.c
+++ b/arch/loongarch/kernel/module.c
@@ -376,6 +376,15 @@ static int apply_r_larch_32_pcrel(struct module *mod, u32 *location, Elf_Addr v,
 	return 0;
 }
 
+static int apply_r_larch_64_pcrel(struct module *mod, u32 *location, Elf_Addr v,
+				  s64 *rela_stack, size_t *rela_stack_top, unsigned int type)
+{
+	ptrdiff_t offset = (void *)v - (void *)location;
+
+	*(u64 *)location = offset;
+	return 0;
+}
+
 /*
  * reloc_handlers_rela() - Apply a particular relocation to a module
  * @mod: the module to apply the reloc to
@@ -406,6 +415,7 @@ static reloc_rela_handler reloc_rela_handlers[] = {
 	[R_LARCH_ADD32 ... R_LARCH_SUB64]		     = apply_r_larch_add_sub,
 	[R_LARCH_PCALA_HI20...R_LARCH_PCALA64_HI12]	     = apply_r_larch_pcala,
 	[R_LARCH_32_PCREL]				     = apply_r_larch_32_pcrel,
+	[R_LARCH_64_PCREL]				     = apply_r_larch_64_pcrel,
 };
 
 int apply_relocate_add(Elf_Shdr *sechdrs, const char *strtab,
-- 
2.1.0

