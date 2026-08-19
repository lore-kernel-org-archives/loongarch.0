Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97FCE3D3CF5
	for <loongarch@lists.linux.dev>; Wed, 19 Aug 2026 06:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787122310; cv=none; b=KP4DdTSweQZSqJ5Rg2WN4mBtJiVZFKmEvvcdNuRi6ECnxTjU9yNeC63JEk3eNvGZI6PHK7AXcOYtwhXoZW27zWLYkU7nL9rhR/fvv+/lRWpdF9uq8SFWIWaahf4I+TumOQ6nSUh26/m4k+BiIK+UhNu3A3HW3E14SgRjgp1vel0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787122310; c=relaxed/simple;
	bh=gtUPVknTZcplrYHJEpwfsLjxcFUJ2rSW1d1aLc6WEGk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eQwfv7zCy0iEotDPffqmBYF5nkDJCCd61kIrUwdsPzZ7xe8alEMqtSWHTsDHJ0izTk+TeS0pQRNGCvEv4C+eGAflLx97E+fuTwLsBehSzmo2VrECk95VQaZIk82+wx3nLZYAtbK69k5GP+xVbjAr3x7gqqyi23wVv2yQHNcewoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.87])
	by gateway (Coremail) with SMTP id _____8CxQNF6UoVqTpoCAA--.7796S3;
	Wed, 19 Aug 2026 14:51:38 +0800 (CST)
Received: from kernelserver (unknown [223.64.68.87])
	by front1 (Coremail) with SMTP id qMiowJDxTs91UoVqL00KAA--.64131S2;
	Wed, 19 Aug 2026 14:51:37 +0800 (CST)
From: Huacai Chen <chenhuacai@loongson.cn>
To: Linus Torvalds <torvalds@linux-foundation.org>,
	Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Guo Ren <guoren@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Huacai Chen <chenhuacai@loongson.cn>
Subject: [GIT PULL] LoongArch changes for v7.3
Date: Wed, 19 Aug 2026 14:51:26 +0800
Message-ID: <20260819065126.3734859-1-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJDxTs91UoVqL00KAA--.64131S2
X-CM-SenderInfo: hfkh0x5xdftxo6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoWxXr4kZr1DCr47JFW7uw4kGrX_yoW5XF1Dpr
	ya9r93Jr4kGr45A3Wxt343urn8tFs3GrW3XF4akryxCr15Zr1DWryxGrWkXa4UA3yrJry0
	q3Wrtwn8K3WUJacCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkYb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
	Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE
	14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x
	0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E
	7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcV
	C0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF
	04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7
	CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8zwZ7UUUUU==

The following changes since commit 8d3ae59288f1e7d58d76558a6ee96d533bc5019f:

  Linux 7.2 (2026-08-16 14:32:26 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loongson.git tags/loongarch-7.3

for you to fetch changes up to 6afb03599653619e661121628611f808de1f7c7a:

  selftests/bpf: Enable kptr_xchg_inline test on LoongArch (2026-08-17 22:07:49 +0800)

----------------------------------------------------------------
LoongArch changes for v7.3

1, Add DIRECT_MAP_PHYSMEM_END definition;
2, Expand module virtual address space to 2GB;
3, Use current_stack_pointer in current_pt_regs();
4, BPF JIT enhancements such as kptr_xchg and timed may_goto;
5, Some bug fixes and other small changes.

----------------------------------------------------------------
Bibo Mao (1):
      LoongArch: Fix acpi_package_ids[] array overflow

Chenguang Zhao (3):
      LoongArch: BPF: Align value-returning atomics with LKMM
      LoongArch: BPF: Advertise JIT support for kptr xchg inline
      selftests/bpf: Enable kptr_xchg_inline test on LoongArch

George Guo (3):
      LoongArch: BPF: Resolve per-CPU addrs for internal-only MOV
      LoongArch: BPF: Add timed may_goto implementation
      LoongArch: BPF: Add arch_bpf_stack_walk() implementation

Han Gao (1):
      LoongArch: Add DIRECT_MAP_PHYSMEM_END definition

Tiezhu Yang (10):
      LoongArch: Expand module virtual address space to 2GB
      LoongArch: Use generic cmp_int() instead of custom cmp_3way()
      LoongArch: Use current_stack_pointer in current_pt_regs()
      LoongArch: BPF: Optimize redundant TCC loads in epilogue
      LoongArch: BPF: Move arena register slot below TCC context
      LoongArch: BPF: Refactor jump offset calculation in tail call
      LoongArch: BPF: Implement branchless conditional move for TCC
      LoongArch: BPF: Remove redundant zext jumping in move_imm()
      LoongArch: BPF: Remove dead move_imm() call in BPF_NEG path
      LoongArch: BPF: Split unconditional branch JA paths statically

 arch/loongarch/include/asm/inst.h                  |  25 +++
 arch/loongarch/include/asm/pgtable.h               |   9 +-
 arch/loongarch/include/asm/ptrace.h                |   6 +-
 arch/loongarch/kernel/acpi.c                       |   3 +-
 arch/loongarch/kernel/module-sections.c            |   6 +-
 arch/loongarch/mm/init.c                           |  17 +-
 arch/loongarch/net/Makefile                        |   2 +-
 arch/loongarch/net/bpf_jit.c                       | 197 +++++++++++++--------
 arch/loongarch/net/bpf_jit.h                       |   2 +-
 arch/loongarch/net/bpf_timed_may_goto.S            |  47 +++++
 .../selftests/bpf/prog_tests/kptr_xchg_inline.c    |   3 +-
 11 files changed, 225 insertions(+), 92 deletions(-)
 create mode 100644 arch/loongarch/net/bpf_timed_may_goto.S

