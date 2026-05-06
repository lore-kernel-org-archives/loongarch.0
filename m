Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 122AF19DF6A
	for <loongarch@lists.linux.dev>; Wed,  6 May 2026 02:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778035170; cv=none; b=ZtQk9AnqiCQypWTVQHhNLhHmx3HBgoE0iLRcQizEJN/ffpIqiSsz6T+7Td6nnQzdDgJjauJ5qZV5NVP2C8H5ejCykj61RGVpiuf+0i3yJe0ZejElTPbqw7a4a8B4xOOpKI4szVhSOKoga+HzXMKhBtAmDDeMrK4ZWjY0mNgYRLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778035170; c=relaxed/simple;
	bh=39JHZmP3fNJkclgEPRSzmArJDH8JHTPqohDHcTX6KG8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=efbhCa63RD7680gyl/LdYJb8TjbbuVPOTvlqNyBhyPmMB6rGiylncVvnMr1WMqQFyNcLCWo1e3KSCDWpE8E7FjpxuhnkxxO/PkG1/3inrPckUyMIw/IkMwFTvubO942H67CKukmWpedfEEO5u0amJYlfxlj+z5Vw64AtlYoafFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.8])
	by gateway (Coremail) with SMTP id _____8CxX+rWqfpp2voGAA--.22279S3;
	Wed, 06 May 2026 10:39:18 +0800 (CST)
Received: from kernelserver (unknown [223.64.68.8])
	by front1 (Coremail) with SMTP id qMiowJBxZcDPqfppRGh7AA--.45543S2;
	Wed, 06 May 2026 10:39:15 +0800 (CST)
From: Huacai Chen <chenhuacai@loongson.cn>
To: Linus Torvalds <torvalds@linux-foundation.org>,
	Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Guo Ren <guoren@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Huacai Chen <chenhuacai@loongson.cn>
Subject: [GIT PULL] LoongArch fixes for v7.1-rc3
Date: Wed,  6 May 2026 10:39:01 +0800
Message-ID: <20260506023904.253139-1-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJBxZcDPqfppRGh7AA--.45543S2
X-CM-SenderInfo: hfkh0x5xdftxo6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoWxXr4xZFWUGr4xJrWfWw1fXwc_yoW5XFWxpF
	y3uFnxJF4kGrZ3Xrnxt34rurn8Ar1xGr1IqF4akFW8Ar17Zw1UXr18GrWkXFyUG3ykJr10
	qr1rGw1YgFyUJacCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUU90b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1ln4kS14v26r1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12
	xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y
	6r17McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64
	vIr41l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_
	Jrv_JF1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1V
	AY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAI
	cVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42
	IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVj
	vjDU0xZFpf9x07jepB-UUUUU=

The following changes since commit 7fd2df204f342fc17d1a0bfcd474b24232fb0f32:

  Linux 7.1-rc2 (2026-05-03 14:21:25 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loongson.git tags/loongarch-fixes-7.1-1

for you to fetch changes up to 5a873d77ba792410a796595a917be6a440f9b7d2:

  LoongArch: KVM: Move unconditional delay into timer clear scenery (2026-05-04 09:00:48 +0800)

----------------------------------------------------------------
LoongArch fixes for v7.1-rc3

Fix some build and runtime issues after 32BIT Kconfig option enabled,
improve the platform-specific PCI controller compatibility, drop custom
__arch_vdso_hres_capable(), and fix a lot of KVM bugs.
----------------------------------------------------------------
Bibo Mao (3):
      LoongArch: KVM: Move AVEC interrupt injection into switch loop
      LoongArch: KVM: Fix HW timer interrupt lost when inject interrupt by software
      LoongArch: KVM: Move unconditional delay into timer clear scenery

Huacai Chen (4):
      LoongArch: Make CONFIG_64BIT as the default option
      LoongArch: Specify -m32/-m64 explicitly for 32BIT/64BIT
      LoongArch: Fix SYM_SIGFUNC_START definition for 32BIT
      LoongArch: Use per-root-bridge PCIH flag to skip mem resource fixup

Qiang Ma (1):
      LoongArch: KVM: Cap KVM_CAP_NR_VCPUS by KVM_CAP_MAX_VCPUS

Tao Cui (2):
      LoongArch: KVM: Fix missing EMULATE_FAIL in kvm_emu_mmio_read()
      LoongArch: KVM: Use kvm_set_pte() in kvm_flush_pte()

Thomas Weißschuh (1):
      LoongArch: vDSO: Drop custom __arch_vdso_hres_capable()

Wentao Guan (1):
      LoongArch: Fix potential ADE in loongson_gpu_fixup_dma_hang()

Xianglai Li (2):
      LoongArch: KVM: Compile switch.S directly into the kernel
      LoongArch: KVM: Fix "unreliable stack" for kvm_exc_entry

 arch/loongarch/Kbuild                          |  2 +-
 arch/loongarch/Kconfig                         |  1 +
 arch/loongarch/Makefile                        |  2 ++
 arch/loongarch/include/asm/asm-prototypes.h    | 20 +++++++++++++++
 arch/loongarch/include/asm/kvm_host.h          |  3 ---
 arch/loongarch/include/asm/linkage.h           |  2 +-
 arch/loongarch/include/asm/vdso/gettimeofday.h |  6 -----
 arch/loongarch/kvm/Makefile                    |  3 ++-
 arch/loongarch/kvm/exit.c                      |  1 +
 arch/loongarch/kvm/interrupt.c                 | 34 +++++++++++++++++--------
 arch/loongarch/kvm/main.c                      | 35 +++-----------------------
 arch/loongarch/kvm/mmu.c                       |  2 +-
 arch/loongarch/kvm/switch.S                    | 22 +++++++++++-----
 arch/loongarch/kvm/timer.c                     | 10 ++++++--
 arch/loongarch/kvm/vm.c                        |  2 +-
 arch/loongarch/pci/acpi.c                      |  5 ++++
 arch/loongarch/pci/pci.c                       |  3 +++
 arch/loongarch/vdso/Makefile                   |  2 ++
 18 files changed, 90 insertions(+), 65 deletions(-)

