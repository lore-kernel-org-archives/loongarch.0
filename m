Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C90C21A6810
	for <loongarch@lists.linux.dev>; Fri, 24 Apr 2026 04:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777004380; cv=none; b=midJlxUEBxiMFF0qVbLX+BR52SCqt9aDkYH4naLsXbYeXFp87a/47fJczg4qP6uHfM3eO8Q3VCZkJRxKQmQ2D+7thHa5bmGTlD0EUGPxH06dQs6tL3o6qdfaAHC3ArMVjIgtQBJ9xFVfmFNDsg3x182sm52mMGuQGUZs+iXdjHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777004380; c=relaxed/simple;
	bh=seXi2X/+knpbUBnFlZPBBulXv4W29BwHLvU5AN59HmI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dZOQeNHAsdh3yHNIdP6mKtE0iBbxA1m3vCiLsLd2twGo/jNeT7uzH5l6ychw1ksO6X60VOQifMy6j0FS8HcDblMmFLamcRk7DIo9pFFj+U+6xLORQi+0OAK5V7b2yT6SLFiWhW4fZ2yAORQUBlOyrCCAhhj+SlD/zMCygi8Qf+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.8])
	by gateway (Coremail) with SMTP id _____8CxRehQ7+ppqIkDAA--.6480S3;
	Fri, 24 Apr 2026 12:19:28 +0800 (CST)
Received: from kernelserver (unknown [223.64.68.8])
	by front1 (Coremail) with SMTP id qMiowJBxiuBL7+ppnc1zAA--.52682S2;
	Fri, 24 Apr 2026 12:19:26 +0800 (CST)
From: Huacai Chen <chenhuacai@loongson.cn>
To: Linus Torvalds <torvalds@linux-foundation.org>,
	Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Guo Ren <guoren@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Huacai Chen <chenhuacai@loongson.cn>
Subject: [GIT PULL] LoongArch changes for v7.1
Date: Fri, 24 Apr 2026 12:19:13 +0800
Message-ID: <20260424041913.3035241-1-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJBxiuBL7+ppnc1zAA--.52682S2
X-CM-SenderInfo: hfkh0x5xdftxo6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoWxAFWrXr4fZF4fXr4fXrWfCrX_yoWrur1fpF
	9xZrnxGF48Gr93Ar1Dt34Uur1Dtr1xGry2q3WYy348CF15Zr1UXr1xWFykZFyUt3yrJrW0
	qr1fGw1aqF4UJacCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUk0b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4j6r4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc
	02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAF
	wI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw28IcxkI7V
	AKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCj
	r7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6x
	IIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAI
	w20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x
	0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxU7_MaUUUUU

The following changes since commit 028ef9c96e96197026887c0f092424679298aae8:

  Linux 7.0 (2026-04-12 13:48:06 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loongson.git tags/loongarch-7.1

for you to fetch changes up to 7939f96f26e96b69db1fe4e7c18537a679696358:

  selftests/bpf: Enable CAN_USE_LOAD_ACQ_STORE_REL for LoongArch (2026-04-23 12:49:46 +0800)

----------------------------------------------------------------
LoongArch changes for v7.1

1, Adjust build infrastructure for 32BIT/64BIT;
2, Add HIGHMEM (PKMAP and FIX_KMAP) support;
3, Show and handle CPU vulnerabilites correctly;
4, Batch the icache maintenance for jump_label;
5, Add more atomic instructions support for BPF JIT;
6, Add more features (e.g. fsession) support for BPF trampoline;
7, Some bug fixes and other small changes.

Note: There is a conflict in arch/loongarch/mm/init.c but can be
simply fixed by adjusting context.

----------------------------------------------------------------
Greg Kroah-Hartman (1):
      LoongArch: Add spectre boundry for syscall dispatch table

Hengqi Chen (2):
      LoongArch: BPF: Introduce emit_store_stack_imm64() helper
      LoongArch: BPF: Add fsession support for trampolines

Huacai Chen (4):
      LoongArch: Adjust build infrastructure for 32BIT/64BIT
      LoongArch: Add HIGHMEM (PKMAP and FIX_KMAP) support
      LoongArch: Make arch_irq_work_has_interrupt() true only if IPI HW exist
      LoongArch: Show CPU vulnerabilites correctly

Lisa Robinson (1):
      LoongArch: Align FPU register state to 32 bytes

Luo Qiu (1):
      LoongArch: Use get_random_canary() for stack canary init

Tiezhu Yang (9):
      LoongArch: Handle CONFIG_32BIT in syscall_get_arch()
      LoongArch: Define instruction formats for AM{SWAP/ADD}.{B/H} and DBAR
      LoongArch: BPF: Add the default case in emit_atomic() and rename it
      LoongArch: BPF: Support 8 and 16 bit read-modify-write instructions
      LoongArch: BPF: Support load-acquire and store-release instructions
      LoongArch: BPF: Open code and remove invoke_bpf_mod_ret()
      LoongArch: BPF: Support small struct arguments for trampoline
      LoongArch: BPF: Support up to 12 function arguments for trampoline
      selftests/bpf: Enable CAN_USE_LOAD_ACQ_STORE_REL for LoongArch

Youling Tang (2):
      LoongArch: Add flush_icache_all()/local_flush_icache_all()
      LoongArch: Batch the icache maintenance for jump_label

Yuqian Yang (1):
      LoongArch: Improve the logging of disabling KASLR

 arch/loongarch/Kconfig                             | 120 +++++--
 arch/loongarch/Makefile                            |  23 +-
 arch/loongarch/boot/Makefile                       |   6 +
 arch/loongarch/include/asm/cacheflush.h            |  16 +-
 arch/loongarch/include/asm/cpu-features.h          |   1 +
 arch/loongarch/include/asm/cpu.h                   |  64 ++--
 arch/loongarch/include/asm/fixmap.h                |  14 +
 arch/loongarch/include/asm/highmem.h               |  43 +++
 arch/loongarch/include/asm/inst.h                  |  10 +
 arch/loongarch/include/asm/irq_work.h              |   2 +-
 arch/loongarch/include/asm/jump_label.h            |   2 +
 arch/loongarch/include/asm/page.h                  |   4 -
 arch/loongarch/include/asm/pgtable.h               |  12 +
 arch/loongarch/include/asm/processor.h             |   2 +-
 arch/loongarch/include/asm/stackprotector.h        |   9 +-
 arch/loongarch/include/asm/syscall.h               |   4 +
 arch/loongarch/include/uapi/asm/hwcap.h            |   1 +
 arch/loongarch/kernel/cpu-probe.c                  |  11 +
 arch/loongarch/kernel/fpu.S                        |  12 +-
 arch/loongarch/kernel/inst.c                       |   6 +-
 arch/loongarch/kernel/jump_label.c                 |  12 +-
 arch/loongarch/kernel/proc.c                       |   2 +
 arch/loongarch/kernel/process.c                    |   2 +
 arch/loongarch/kernel/relocate.c                   |  26 +-
 arch/loongarch/kernel/syscall.c                    |   3 +-
 arch/loongarch/kernel/vmlinux.lds.S                |   7 +-
 arch/loongarch/kvm/Kconfig                         |   2 +-
 arch/loongarch/lib/Makefile                        |   6 +-
 arch/loongarch/mm/Makefile                         |   1 +
 arch/loongarch/mm/cache.c                          |  10 -
 arch/loongarch/mm/highmem.c                        |  12 +
 arch/loongarch/mm/init.c                           |  61 +++-
 arch/loongarch/mm/pgtable.c                        |  27 ++
 arch/loongarch/net/bpf_jit.c                       | 381 +++++++++++++++++----
 drivers/firmware/efi/libstub/Makefile              |   1 +
 drivers/pci/controller/Kconfig                     |   2 +-
 lib/crc/Kconfig                                    |   2 +-
 tools/testing/selftests/bpf/progs/bpf_misc.h       |   4 +-
 .../selftests/bpf/progs/verifier_precision.c       |   4 +-
 39 files changed, 726 insertions(+), 201 deletions(-)
 create mode 100644 arch/loongarch/include/asm/highmem.h
 create mode 100644 arch/loongarch/mm/highmem.c

