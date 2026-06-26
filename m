Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF82B3769E6
	for <loongarch@lists.linux.dev>; Fri, 26 Jun 2026 15:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782486490; cv=none; b=Zva+8CeMpRvtD1ciiuECfUz0RywTiqwCOS6YhR6sT01CqqqdTdwpNi1HDiE50WBXTSVuaE4cx5nKuXogw7vDl5Er0yM3m7p1+EvCGfKk/QTrSg75QhPjAeRTHhQox7lClnLd21//uL4HUF6lkrRlxDIxQf5+0c/SM9sCjpAjVZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782486490; c=relaxed/simple;
	bh=nHawKbVbsZKuniiw+r4XgINhMoVafVxexID6UXYmiRM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=fvN654M4rTod08h1TF7EPZmUnOSjViR5cZb818P1AMN3nvh912Dd/TZgbIUhf3fIjEtv7MTvBX24LAsy+sX4dlgYB/Z9LHf3PTxym2Rxn+Mx6H4Q1NtoW0fLEQQfztxK1kmCxMnwsFrd/jAXHqidJqQoAXtS72EQ0mAVkCh+GmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.155])
	by gateway (Coremail) with SMTP id _____8AxX+trlT5qK2UYAA--.62186S3;
	Fri, 26 Jun 2026 23:06:19 +0800 (CST)
Received: from kernelserver (unknown [223.64.68.155])
	by front1 (Coremail) with SMTP id qMiowJAxVcBklT5qwhm0AA--.60682S2;
	Fri, 26 Jun 2026 23:06:17 +0800 (CST)
From: Huacai Chen <chenhuacai@loongson.cn>
To: Linus Torvalds <torvalds@linux-foundation.org>,
	Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Guo Ren <guoren@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Huacai Chen <chenhuacai@loongson.cn>
Subject: [GIT PULL] LoongArch changes for v7.2
Date: Fri, 26 Jun 2026 23:06:04 +0800
Message-ID: <20260626150605.3967536-1-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJAxVcBklT5qwhm0AA--.60682S2
X-CM-SenderInfo: hfkh0x5xdftxo6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoWxZFWUCrW3Jr4rKFW7GFyUArc_yoWrWrWUpF
	9xurnxJr48GryfXFnxt343urn8Jr1kG34aq3Way34rCF47ZryUXr1xGrykXFyUJ3yrJry0
	qr1rKwn0gF4UJ3gCm3ZEXasCq-sJn29KB7ZKAUJUUUU7529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUBIb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07
	AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWU
	AVWUtwAv7VC2z280aVAFwI0_Cr0_Gr1UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x
	0EwIxGrwCY1x0262kKe7AKxVWUAVWUtwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkE
	bVWUJVW8JwCFI7km07C267AKxVWUXVWUAwC20s026c02F40E14v26r1j6r18MI8I3I0E74
	80Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0
	I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04
	k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7Cj
	xVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8xsqJUUUUU==

The following changes since commit 8cd9520d35a6c38db6567e97dd93b1f11f185dc6:

  Linux 7.1 (2026-06-14 15:58:38 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loongson.git tags/loongarch-7.2

for you to fetch changes up to 262a3b4fa1792d40728c69995924e11cf761f5cf:

  selftests/bpf: Test jited inline of bpf_get_smp_processor_id() for LoongArch (2026-06-25 13:08:58 +0800)

----------------------------------------------------------------
LoongArch changes for v7.2

1, Add THREAD_INFO_IN_TASK implementation;
2, Add build salt to the vDSO;
3, Add some BPF JIT inline helpers;
4, Update DTS for I2C clocks and clock-frequency;
5, Some bug fixes and other small changes.

I'm sorry for the late Pull-Request because a 32BIT build error is
reported and fixed recently.
----------------------------------------------------------------
Bastian Blank (1):
      LoongArch: Add build salt to the vDSO

Hongchen Zhang (1):
      LoongArch: Fix missing dirty page tracking in {pte,pmd}_wrprotect()

Hongliang Wang (3):
      LoongArch: dts: Add i2c clocks and clock-frequency properties to LS2K0500
      LoongArch: dts: Add i2c clocks and clock-frequency properties to LS2K1000
      LoongArch: dts: Add i2c clocks and clock-frequency properties to LS2K2000

Huacai Chen (3):
      Merge tag 'bpf-next-7.2' into loongarch-next
      LoongArch: Add PIO for early access before ACPI PCI root register
      LoongArch: Report dying CPU to RCU in stop_this_cpu()

Tiezhu Yang (9):
      LoongArch: Add THREAD_INFO_IN_TASK implementation
      LoongArch: BPF: Fix outdated tail call comments
      LoongArch: BPF: Fix off-by-one error in tail call
      LoongArch: BPF: Inline bpf_get_current_task/_btf() helpers
      LoongArch: BPF: Inline bpf_get_smp_processor_id() helper
      selftests/bpf: Add get_preempt_count() support for LoongArch
      selftests/bpf: Add __arch_loongarch to limit test cases for LoongArch
      selftests/bpf: Test jited inline of bpf_get_current_task() for LoongArch
      selftests/bpf: Test jited inline of bpf_get_smp_processor_id() for LoongArch

Xuewen Wang (1):
      LoongArch: Fix nr passing in set_direct_map_valid_noflush()

谢致邦 (XIE Zhibang) (1):
      LoongArch: Move struct kimage forward declaration before use

 .../core/thread-info-in-task/arch-support.txt      |  2 +-
 arch/loongarch/Kconfig                             |  1 +
 arch/loongarch/boot/dts/loongson-2k0500.dtsi       | 12 +++++
 arch/loongarch/boot/dts/loongson-2k1000.dtsi       |  4 ++
 arch/loongarch/boot/dts/loongson-2k2000.dtsi       |  4 ++
 arch/loongarch/include/asm/acpi.h                  |  2 +
 arch/loongarch/include/asm/current.h               | 31 +++++++++++++
 arch/loongarch/include/asm/kexec.h                 |  3 +-
 arch/loongarch/include/asm/percpu.h                |  1 -
 arch/loongarch/include/asm/pgtable.h               |  4 ++
 arch/loongarch/include/asm/smp.h                   |  3 +-
 arch/loongarch/include/asm/stackframe.h            | 10 ++--
 arch/loongarch/include/asm/switch_to.h             |  7 ++-
 arch/loongarch/include/asm/thread_info.h           | 10 ----
 arch/loongarch/kernel/acpi.c                       | 28 +++++++++++
 arch/loongarch/kernel/asm-offsets.c                |  6 +--
 arch/loongarch/kernel/entry.S                      |  7 ++-
 arch/loongarch/kernel/head.S                       | 18 +++++---
 arch/loongarch/kernel/process.c                    |  2 +
 arch/loongarch/kernel/relocate.c                   |  2 +-
 arch/loongarch/kernel/setup.c                      |  3 ++
 arch/loongarch/kernel/smp.c                        |  7 ++-
 arch/loongarch/kernel/switch.S                     | 14 +++---
 arch/loongarch/kernel/traps.c                      |  8 ++++
 arch/loongarch/mm/pageattr.c                       |  2 +-
 arch/loongarch/net/bpf_jit.c                       | 54 +++++++++++++++++++---
 arch/loongarch/pci/acpi.c                          |  2 +
 arch/loongarch/vdso/elf.S                          |  3 ++
 tools/testing/selftests/bpf/bpf_experimental.h     |  7 +++
 tools/testing/selftests/bpf/progs/bpf_misc.h       |  1 +
 .../selftests/bpf/progs/verifier_jit_inline.c      | 13 ++++++
 tools/testing/selftests/bpf/test_loader.c          |  5 ++
 32 files changed, 226 insertions(+), 50 deletions(-)
 create mode 100644 arch/loongarch/include/asm/current.h

