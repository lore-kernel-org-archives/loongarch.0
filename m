Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D57012AD24
	for <loongarch@lists.linux.dev>; Fri, 19 Sep 2025 07:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758266553; cv=none; b=UKoTTR6NWYMZ2VxfaWU0h2jG53zuPHGmxsHOKbkPqDS8fOLMdUmdV5X7imInoW07vLqmDiNmizEHV7HDcKFTgILnwAn9Hsw+ZrDPcgb3DAwV1hO4lyQHZdqzTXzXrPDIiK88+dPwopMLe9YBV428Bjw/HJ8C+NYB9MPTKXQpT8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758266553; c=relaxed/simple;
	bh=+tBvip76XXr+lu0sgkTSqWqXh8t41hAbXy4NTp2PPko=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Df4sTJ84jmV8nMY0X1qXmkfgVZXhhCwmzhrSH+hy9C4fSlcP3vn2DFyHZ39Bzi3farKOypCdvAjR/ZX1HYG4LL04/EX+QunO7ulsWH8nhqFihjN2YN6kiYaZ/25pt3lg89mSmtzfwrijSjfFaTio6GcLPohagF90ajoKWAr8fpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.89])
	by gateway (Coremail) with SMTP id _____8DxM9CsBM1oKCIMAA--.26480S3;
	Fri, 19 Sep 2025 15:22:20 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.68.89])
	by front1 (Coremail) with SMTP id qMiowJAxleSmBM1otiifAA--.54733S2;
	Fri, 19 Sep 2025 15:22:19 +0800 (CST)
From: Huacai Chen <chenhuacai@loongson.cn>
To: Linus Torvalds <torvalds@linux-foundation.org>,
	Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Guo Ren <guoren@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Huacai Chen <chenhuacai@loongson.cn>
Subject: [GIT PULL] LoongArch fixes for v6.17-rc7
Date: Fri, 19 Sep 2025 15:21:54 +0800
Message-ID: <20250919072154.2509239-1-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJAxleSmBM1otiifAA--.54733S2
X-CM-SenderInfo: hfkh0x5xdftxo6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoWxXF4fJw4fZF48CF4DCFy7twc_yoW5XryDpr
	4a9r9IqF4DGrZ3ZwnIq347uF15trs7Cry2qF42k348JF1Yvr1UJr18Xr1kJFyUJ395Jr10
	qF1rWwn0kF1UJacCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkjb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I
	8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv67AK
	xVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2Ij64
	vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8G
	jcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2I
	x0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK
	8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I
	0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07j1WlkUUUUU=

The following changes since commit f83ec76bf285bea5727f478a68b894f5543ca76e:

  Linux 6.17-rc6 (2025-09-14 14:21:14 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loongson.git tags/loongarch-fixes-6.17-2

for you to fetch changes up to 8dc5245673cf7f33743e5c0d2a4207c0b8df3067:

  LoongArch: KVM: Avoid copy_*_user() with lock hold in kvm_pch_pic_regs_access() (2025-09-18 19:44:25 +0800)

----------------------------------------------------------------
LoongArch fixes for v6.17-rc7

Fix some build warnings for RUST-enabled objtool check, align ACPI
structures for ARCH_STRICT_ALIGN, fix an unreliable stack for live
patching, add some NULL pointer checkings, and fix some bugs about
KVM.
----------------------------------------------------------------
Bibo Mao (5):
      LoongArch: KVM: Fix VM migration failure with PTW enabled
      LoongArch: KVM: Avoid copy_*_user() with lock hold in kvm_eiointc_ctrl_access()
      LoongArch: KVM: Avoid copy_*_user() with lock hold in kvm_eiointc_regs_access()
      LoongArch: KVM: Avoid copy_*_user() with lock hold in kvm_eiointc_sw_status_access()
      LoongArch: KVM: Avoid copy_*_user() with lock hold in kvm_pch_pic_regs_access()

Guangshuo Li (1):
      LoongArch: vDSO: Check kcalloc() result in init_vdso()

Huacai Chen (1):
      LoongArch: Align ACPI structures if ARCH_STRICT_ALIGN enabled

Tao Cui (3):
      LoongArch: Check the return value when creating kobj
      LoongArch: Replace sprintf() with sysfs_emit()
      LoongArch: KVM: Remove unused returns and semicolons

Tiezhu Yang (6):
      objtool/LoongArch: Mark types based on break immediate code
      objtool/LoongArch: Mark special atomic instruction as INSN_BUG type
      LoongArch: Make LTO case independent in Makefile
      LoongArch: Handle jump tables options for RUST
      LoongArch: Update help info of ARCH_STRICT_ALIGN
      LoongArch: Fix unreliable stack for live patching

 arch/loongarch/Kconfig                  | 12 ++++-
 arch/loongarch/Makefile                 | 15 ++++--
 arch/loongarch/include/asm/acenv.h      |  7 ++-
 arch/loongarch/include/asm/kvm_mmu.h    | 20 ++++++--
 arch/loongarch/kernel/env.c             |  4 +-
 arch/loongarch/kernel/stacktrace.c      |  3 +-
 arch/loongarch/kernel/vdso.c            |  3 ++
 arch/loongarch/kvm/exit.c               |  6 +--
 arch/loongarch/kvm/intc/eiointc.c       | 87 ++++++++++++++++++++-------------
 arch/loongarch/kvm/intc/pch_pic.c       | 21 +++++---
 arch/loongarch/kvm/mmu.c                |  8 +--
 tools/arch/loongarch/include/asm/inst.h | 12 +++++
 tools/objtool/arch/loongarch/decode.c   | 33 +++++++++++--
 13 files changed, 162 insertions(+), 69 deletions(-)

