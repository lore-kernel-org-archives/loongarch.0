Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E873F2F691B
	for <loongarch@lists.linux.dev>; Wed, 19 Nov 2025 04:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763526459; cv=none; b=m9a4jFn1i5P5FLuz6R55VLdRILJf+GEPOTcBu7fl8fKtBvE3BxhMeivRyoeGKJpv3z5bAemXffkft93ozvpHaGqFW1d1tmSXNozHrM/T87PtJnTVGBnCYcxgzrR3fBDC7WS23vFe5C3k7PMhOZIE/4dxDneM4lIqFzP4aNz4PCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763526459; c=relaxed/simple;
	bh=hLfuJ61oLqW2BaLcphzFXuJJWRUPwv1GeC9b/oMzyGU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oMmum9FUS7dMey730M6IPT+3yHoD03NqNp7jl8riokhYnXxSVQNL8QLHJs9f2+WzBbYdzGTZ+bmaXrPkvqK03ej5R0QI/uGUcimuOO0fCG1Sy/sgdixBuh0sMEXgP4unl+UjInGAdLbXV1RKBu+z5braturuOMesrgRu7BiH604=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8Bx3tIwRx1p41clAA--.14769S3;
	Wed, 19 Nov 2025 12:27:29 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowJCxG8EsRx1pchQ4AQ--.53944S2;
	Wed, 19 Nov 2025 12:27:25 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Nathan Chancellor <nathan@kernel.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>
Cc: linux-kbuild@vger.kernel.org,
	linux-efi@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] kbuild: Add KBUILD_VMLINUX_LIBS_PRELINK
Date: Wed, 19 Nov 2025 12:27:08 +0800
Message-ID: <20251119042708.27658-1-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJCxG8EsRx1pchQ4AQ--.53944S2
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7tr1fWr1rGry8GFWxGFyrKrX_yoW8Zr1rpa
	90kw42939rX3yvq397CrW0qw45tFZ8ZrWrWFWDJan8CryDXr4I9rZ2kr43AryDuFyDAF45
	WF1xAFyakFyDu3gCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUv2b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
	Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE
	14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCY1x0262kKe7
	AKxVWUAVWUtwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02
	F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GF
	ylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7Cj
	xVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r
	1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU1RB
	T5UUUUU==

In order to only link libstub to the final vmlinux, it can not use the
current KBUILD_VMLINUX_LIBS, just add KBUILD_VMLINUX_LIBS_PRELINK. This
is preparation for later patch, no functionality change.

Link: https://lore.kernel.org/lkml/pq4h7jgndnt6p45lj4kgubxjd5gidfetugcuf5rcxzxxanzetd@6rrlpjnjsmuy/
Suggested-by: Josh Poimboeuf <jpoimboe@kernel.org>
Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
There is a long discussion in the previous patch:
https://lore.kernel.org/lkml/20250928085506.4471-1-yangtiezhu@loongson.cn/

This version is based on 6.18-rc6, split the generic parts out
into a separate patch to avoid merge conflicts, the other parts
will send out after the merge window.

 Makefile                | 1 +
 scripts/link-vmlinux.sh | 5 ++---
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index d763c2c75cdb..69485f47b794 100644
--- a/Makefile
+++ b/Makefile
@@ -1199,6 +1199,7 @@ KBUILD_VMLINUX_OBJS := built-in.a $(patsubst %/, %/lib.a, $(filter %/, $(libs-y)
 KBUILD_VMLINUX_LIBS := $(filter-out %/, $(libs-y))
 
 export KBUILD_VMLINUX_LIBS
+export KBUILD_VMLINUX_LIBS_PRELINK
 export KBUILD_LDS          := arch/$(SRCARCH)/kernel/vmlinux.lds
 
 ifdef CONFIG_TRIM_UNUSED_KSYMS
diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
index 433849ff7529..e72d3254b93f 100755
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

