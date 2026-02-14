Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40747149E17
	for <loongarch@lists.linux.dev>; Sat, 14 Feb 2026 13:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771074966; cv=none; b=b+RskFXWOm3Eumf6IX0rZEmfZFgV3dQg7JQcDi10gFUeyT460VVpkyam43h/6x75HbfHHtWWVHqeIo2J8zja1O4ehoiB4WVrQy5R4GJYG1nPaNcswqmqAR0gyEqQZpvDt0k3N3t58YBJcU6zY39hkB0Fujicc/1V0DL78aPn0Lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771074966; c=relaxed/simple;
	bh=0bkLvZ2OhEs/78Ax9cA6o7EwomLnumh8LYHfMNqyxVs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=XSxtUB76QexvuauvIf4Ikxs1H/L8Z6jJg6wY0Vh9fEkeuY05lzsRTEH1FVlqI31gceNWEPDKkLA+4riF53OKiGVksBM17GiYo5TFVmU4DRGPAJ0o1uK5D6IftnjVS0/tX5LCKuPyrTAqBxP1L4hbpRskrGTKRh4RKoy4vKIRgH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.227])
	by gateway (Coremail) with SMTP id _____8AxisKHdZBpjXwSAA--.58231S3;
	Sat, 14 Feb 2026 21:15:51 +0800 (CST)
Received: from kernelserver (unknown [223.64.68.227])
	by front1 (Coremail) with SMTP id qMiowJBxZcB+dZBpqQ5GAA--.20330S2;
	Sat, 14 Feb 2026 21:15:48 +0800 (CST)
From: Huacai Chen <chenhuacai@loongson.cn>
To: Linus Torvalds <torvalds@linux-foundation.org>,
	Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Guo Ren <guoren@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Huacai Chen <chenhuacai@loongson.cn>
Subject: [GIT PULL] LoongArch changes for v7.0
Date: Sat, 14 Feb 2026 21:15:27 +0800
Message-ID: <20260214131533.865218-1-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJBxZcB+dZBpqQ5GAA--.20330S2
X-CM-SenderInfo: hfkh0x5xdftxo6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoWxCr43Ar48ZryftF1rXw4DWrX_yoWrJr4rpF
	y3urnxGF4rGrW3XrnrK347ur1DJFyxG342qa1akry8CF12vr1UXr1Iqrn7XFyUt3yrJry0
	qF1rG34agF1UJacCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUvEb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Gr0_Gr1UM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYI
	kI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUXVWU
	AwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI4
	8JMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMxCIbckI1I0E14v26r1Y
	6r17MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7
	AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE
	2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcV
	C2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73
	UjIFyTuYvjxU2MKZDUUUU

The following changes since commit 05f7e89ab9731565d8a62e3b5d1ec206485eeb0b:

  Linux 6.19 (2026-02-08 13:03:27 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loongson.git tags/loongarch-7.0

for you to fetch changes up to 92860256402cce9fa6268763365f5333a56c1428:

  LoongArch: dts: loongson-2k1000: Add nand controller support (2026-02-10 19:31:33 +0800)

----------------------------------------------------------------
LoongArch changes for v7.0

1, Select HAVE_CMPXCHG_{LOCAL,DOUBLE};
2, Add 128-bit atomic cmpxchg support;
3, Add HOTPLUG_SMT implementation;
4, Wire up memfd_secret system call;
5, Fix boot errors and unwind errors for KASAN;
6, Use BPF prog pack allocator and add BPF arena support;
7, Update dts files to add nand controllers;
8, Some bug fixes and other small changes.

----------------------------------------------------------------
Binbin Zhou (2):
      LoongArch: dts: loongson-2k0500: Add nand controller support
      LoongArch: dts: loongson-2k1000: Add nand controller support

Carlos López (1):
      LoongArch: Use IS_ERR_PCPU() macro for KGDB

George Guo (3):
      LoongArch: Add detection for SC.Q support
      LoongArch: Add 128-bit atomic cmpxchg support
      LoongArch: Replace seq_printf() with seq_puts() for simple strings

Hengqi Chen (3):
      LoongArch: BPF: Use BPF prog pack allocator
      LoongArch: BPF: Implement PROBE_MEM32 pseudo instructions
      LoongArch: BPF: Implement bpf_addr_space_cast instruction

Huacai Chen (3):
      LoongArch: Select HAVE_CMPXCHG_LOCAL in Kconfig
      LoongArch: Add HOTPLUG_SMT implementation
      LoongArch: Prefer top-down allocation after arch_mem_init()

John Garry (1):
      LoongArch: Make cpumask_of_node() robust against NUMA_NO_NODE

Lain "Fearyncess" Yang (1):
      LoongArch: Wire up memfd_secret system call

Tiezhu Yang (6):
      LoongArch: Use %px to print unmodified unwinding address
      LoongArch: Handle percpu handler address for ORC unwinder
      LoongArch: Guard percpu handler under !CONFIG_PREEMPT_RT
      LoongArch: Remove some extern variables in source files
      LoongArch: Disable instrumentation for setup_ptwalker()
      LoongArch: Rework KASAN initialization for PTW-enabled systems

 Documentation/admin-guide/kernel-parameters.txt |   2 +-
 arch/loongarch/Kconfig                          |   4 +
 arch/loongarch/boot/dts/loongson-2k0500-ref.dts |  19 +++
 arch/loongarch/boot/dts/loongson-2k0500.dtsi    |  12 +-
 arch/loongarch/boot/dts/loongson-2k1000-ref.dts |  22 +++
 arch/loongarch/boot/dts/loongson-2k1000.dtsi    |  13 +-
 arch/loongarch/include/asm/cmpxchg.h            |  54 +++++++
 arch/loongarch/include/asm/cpu-features.h       |   1 +
 arch/loongarch/include/asm/cpu.h                |  62 +++----
 arch/loongarch/include/asm/setup.h              |   3 +
 arch/loongarch/include/asm/topology.h           |   2 +-
 arch/loongarch/include/asm/unistd.h             |   1 +
 arch/loongarch/include/uapi/asm/hwcap.h         |   1 +
 arch/loongarch/kernel/Makefile.syscalls         |   5 +-
 arch/loongarch/kernel/cpu-probe.c               |   4 +
 arch/loongarch/kernel/kgdb.c                    |   2 +-
 arch/loongarch/kernel/proc.c                    |  63 +++++---
 arch/loongarch/kernel/setup.c                   |   1 +
 arch/loongarch/kernel/smp.c                     |  13 ++
 arch/loongarch/kernel/unwind_orc.c              |  18 ++-
 arch/loongarch/kernel/unwind_prologue.c         |   6 +-
 arch/loongarch/mm/kasan_init.c                  |  78 ++++-----
 arch/loongarch/mm/tlb.c                         |   3 +-
 arch/loongarch/net/bpf_jit.c                    | 206 +++++++++++++++++++-----
 arch/loongarch/net/bpf_jit.h                    |   4 +-
 tools/testing/selftests/mm/Makefile             |   2 +-
 26 files changed, 449 insertions(+), 152 deletions(-)

