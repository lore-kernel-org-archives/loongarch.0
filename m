Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17DCA25B2FE
	for <loongarch@lists.linux.dev>; Fri, 19 Sep 2025 09:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758274585; cv=none; b=K4KdghIJRoj3/mKEOMK8ETEKucG8VyJBHuLbcQkBPeRjOlPzlh5Gf7PSgkJnWZIFZUXK4ovTrHBnHS7ofQGzmQ2ZeVZ4ckOAPO+JeNMdq87iVmRVanWAdBnrC1fIu2xL+LsTZUUeZuj/sdTIe5uZqf5rT5lSZQ+kQWjWwopwBWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758274585; c=relaxed/simple;
	bh=WcG0omybLt/WfUJoDZrm8GNqdvyombjqKFY+koInuQ0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ujfMEupQFWHr1W1imul0h8IgZpYIL6sOp2sxI5PgtuU/ete0MzsIjLK+jXc19OXxFOOx1dC3ctx5++r7lKUImh9bvlrk7foZwlGudeNd5Gk3u55pViGAR4IuVeHOVH1Cuz0h5w5opJQGDy3XxGVR2fD/DgdOrGpY+nJy6gq+kjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8DxP9MUJM1ooC0MAA--.25678S3;
	Fri, 19 Sep 2025 17:36:20 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowJDxbMEPJM1oMmufAA--.61162S3;
	Fri, 19 Sep 2025 17:36:17 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Josh Poimboeuf <jpoimboe@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-efi@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/3] LoongArch: Only link libstub to final vmlinux
Date: Fri, 19 Sep 2025 17:36:13 +0800
Message-ID: <20250919093615.30235-2-yangtiezhu@loongson.cn>
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
X-CM-TRANSID:qMiowJDxbMEPJM1oMmufAA--.61162S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoWxZF4rCF15tF13ury3Ar4rtFc_yoW5Wryfpa
	1vkw42vrWDXrWvq3s7JFW0qw15tFs5Jr42qFyDGFZ8AryDXrn2vrZxArsrXF9Fq34DAFWI
	qF1xtF1akFyUA3gCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkjb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I
	8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r126r1DMcIj6I8E87Iv67AK
	xVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2Ij64
	vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8G
	jcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2I
	x0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK
	8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I
	0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07j83kZUUUUU=

When compiling with LLVM and CONFIG_LTO_CLANG is set, there exists
the following objtool warning:

  vmlinux.o: warning: objtool: __efistub_efi_boot_kernel()
  falls through to next function __efistub_exit_boot_func()

This is because efi_boot_kernel() doesn't end with a return instruction
or an unconditional jump, then objtool has determined that the function
can fall through into the next function.

At the beginning, try to do something to make efi_boot_kernel() ends with
an unconditional jump instruction, but this modification seems not proper.

Since the efistub functions are useless for stack unwinder, they can be
ignored by objtool. After many discussions, no need to link libstub to
the vmlinux.o, only link libstub to the final vmlinux.

Link: https://lore.kernel.org/lkml/pq4h7jgndnt6p45lj4kgubxjd5gidfetugcuf5rcxzxxanzetd@6rrlpjnjsmuy/
Suggested-by: Josh Poimboeuf <jpoimboe@kernel.org>
Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 Makefile                | 1 +
 arch/loongarch/Makefile | 5 ++++-
 scripts/link-vmlinux.sh | 5 ++---
 3 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/Makefile b/Makefile
index 9771619ac596..b8e7c63ae3d1 100644
--- a/Makefile
+++ b/Makefile
@@ -1201,6 +1201,7 @@ KBUILD_VMLINUX_OBJS := built-in.a $(patsubst %/, %/lib.a, $(filter %/, $(libs-y)
 KBUILD_VMLINUX_LIBS := $(filter-out %/, $(libs-y))
 
 export KBUILD_VMLINUX_LIBS
+export KBUILD_VMLINUX_LIBS_PRELINK
 export KBUILD_LDS          := arch/$(SRCARCH)/kernel/vmlinux.lds
 
 ifdef CONFIG_TRIM_UNUSED_KSYMS
diff --git a/arch/loongarch/Makefile b/arch/loongarch/Makefile
index a3a9759414f4..e9c61f76a045 100644
--- a/arch/loongarch/Makefile
+++ b/arch/loongarch/Makefile
@@ -164,7 +164,10 @@ CHECKFLAGS += $(shell $(CC) $(KBUILD_CPPFLAGS) $(KBUILD_CFLAGS) -dM -E -x c /dev
 endif
 
 libs-y += arch/loongarch/lib/
-libs-$(CONFIG_EFI_STUB) += $(objtree)/drivers/firmware/efi/libstub/lib.a
+
+ifdef CONFIG_EFI_STUB
+KBUILD_VMLINUX_LIBS_PRELINK += $(objtree)/drivers/firmware/efi/libstub/lib.a
+endif
 
 drivers-y		+= arch/loongarch/crypto/
 
diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
index 51367c2bfc21..b3cbff31d8a9 100755
--- a/scripts/link-vmlinux.sh
+++ b/scripts/link-vmlinux.sh
@@ -61,12 +61,11 @@ vmlinux_link()
 	shift
 
 	if is_enabled CONFIG_LTO_CLANG || is_enabled CONFIG_X86_KERNEL_IBT; then
-		# Use vmlinux.o instead of performing the slow LTO link again.
 		objs=vmlinux.o
-		libs=
+		libs="${KBUILD_VMLINUX_LIBS_PRELINK}"
 	else
 		objs=vmlinux.a
-		libs="${KBUILD_VMLINUX_LIBS}"
+		libs="${KBUILD_VMLINUX_LIBS} ${KBUILD_VMLINUX_LIBS_PRELINK}"
 	fi
 
 	if is_enabled CONFIG_GENERIC_BUILTIN_DTB; then
-- 
2.42.0

