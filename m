Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A94916AB1;
	Tue,  1 Aug 2023 06:30:57 +0000 (UTC)
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8BxpPCdpshk6OUNAA--.32922S3;
	Tue, 01 Aug 2023 14:30:53 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8DxPCOcpshk8pVDAA--.26385S2;
	Tue, 01 Aug 2023 14:30:52 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>
Cc: loongarch@lists.linux.dev,
	llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	loongson-kernel@lists.loongnix.cn
Subject: [PATCH] LoongArch: Error out if clang version is less than 17.0.0
Date: Tue,  1 Aug 2023 14:30:46 +0800
Message-Id: <1690871446-23713-1-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
X-CM-TRANSID:AQAAf8DxPCOcpshk8pVDAA--.26385S2
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7AFykXFW8JryfCr47CFWrtFc_yoW8Cr4fpr
	1rZw1DKr4kXryFvrZ7J34DWryY9F97JryIgFyUJryUWry2qws5WrW8KrWagFZrZws7Zay0
	gryxG3WS9FyUA3gCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkFb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv
	67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2
	Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s02
	6x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0x
	vE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE
	42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6x
	kF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07j1WlkUUUUU=
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>

On my test machine, the clang version is 16.0.4, when build kernel
with clang:

  make CC=clang loongson3_defconfig
  make CC=clang

there exist many errors such as:

  clang-16: error: argument unused during compilation: '-mabi=lp64s'
  error: unknown register name 'a0' in asm
  error: unknown register name 't0' in asm

the above issues have been fixed in the upstream llvm project recently,
it works well when update clang version to 17.0.0:

  make CC=clang loongson3_defconfig
  make CC=clang menuconfig (set CONFIG_MODULES=n and CONFIG_RELOCATABLE=n)
  make CC=clang

thus 17.0.0 is the minimal clang version to build kernel on LoongArch,
it is better to error out if clang version is less than 17.0.0, then
we can do the right thing to update clang version and avoid wasting
time to analysis kernel errors.

By the way, the clang 17.0.0 still have some issues to build kernel on
LoongArch, you need to unset CONFIG_MODULES and CONFIG_RELOCATABLE to
avoid build errors. Additionally, if you want a workable kernel, some
modules should be set as y instead of m if CONFIG_MODULES=n.

Link: https://github.com/ClangBuiltLinux/linux/issues/1787
Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 arch/loongarch/Makefile | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/loongarch/Makefile b/arch/loongarch/Makefile
index b1e5db5..f07f62a 100644
--- a/arch/loongarch/Makefile
+++ b/arch/loongarch/Makefile
@@ -10,6 +10,12 @@ KBUILD_DEFCONFIG := loongson3_defconfig
 image-name-y			:= vmlinux
 image-name-$(CONFIG_EFI_ZBOOT)	:= vmlinuz
 
+ifdef CONFIG_CC_IS_CLANG
+  ifneq ($(call clang-min-version, 170000),y)
+    $(error Sorry, you need a newer clang version >= 17.0.0)
+  endif
+endif
+
 ifndef CONFIG_EFI_STUB
 KBUILD_IMAGE	:= $(boot)/vmlinux.elf
 else
-- 
2.1.0

