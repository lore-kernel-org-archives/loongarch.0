Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7BDC27A476
	for <loongarch@lists.linux.dev>; Sat, 13 Jun 2026 02:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781318569; cv=none; b=g+tXJGKyFT51XAp1/zDNC1qZbhig26UBJ0oQ9LchxWn2K7S4NbWWV+jO4tQVCJ2mZEQpXAxwfdYmXhe91GnMj6vZCTvPV7U47S4vCT3vguMfj6L1gbombTibvnyTP01U+BxdQdBh4aZUuiI+ptCJlCZMOiPCoEbvjAm0DvixJrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781318569; c=relaxed/simple;
	bh=uV5TVWiUgmDlWQsVmw4g2rymQGflfgPjSXOmrudOfg0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lHbb6Dfmp8x8F0UUM2U93vk9nyUM0SVy37LvXwWYtyANwx/Dnv8dWCJhkzb5bJvSTYM/G6bablcKP+kFYuAlAGn/ySvUZKlFLNAjaid82wo9yn8nVPWhJ9nhcin+LqHbVQYlCqxI1+X4Rm6Rb4+T6ACniVymIbyvbn2HdVXmr8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.41])
	by gateway (Coremail) with SMTP id _____8CxnOmdwyxq+bITAA--.49947S3;
	Sat, 13 Jun 2026 10:42:37 +0800 (CST)
Received: from kernelserver (unknown [223.64.68.41])
	by front1 (Coremail) with SMTP id qMiowJDxhcCYwyxqKJKkAA--.56537S2;
	Sat, 13 Jun 2026 10:42:36 +0800 (CST)
From: Huacai Chen <chenhuacai@loongson.cn>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Tianrui Zhao <zhaotianrui@loongson.cn>,
	Bibo Mao <maobibo@loongson.cn>
Cc: kvm@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Xuerui Wang <kernel@xen0n.name>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Huacai Chen <chenhuacai@loongson.cn>
Subject: [GIT PULL] LoongArch KVM changes for v7.2
Date: Sat, 13 Jun 2026 10:42:11 +0800
Message-ID: <20260613024211.2247147-1-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJDxhcCYwyxqKJKkAA--.56537S2
X-CM-SenderInfo: hfkh0x5xdftxo6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoW7WFW7AFWxCr4xuF1DtF17CFX_yoW8Kw4rpF
	y3uFnxJr4DGr4xX342q347uF1DXr1xGryfXr1akFW0kr1UZr1UXry8XrZ5XFy5Ga95Jr10
	qr1rJw4jgF1UJagCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkjb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWUJVW8JwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Gr0_Gr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I
	8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AK
	xVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2Ij64
	vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8G
	jcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2I
	x0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK
	8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I
	0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07j8yCJUUUUU=

The following changes since commit 4549871118cf616eecdd2d939f78e3b9e1dddc48:

  Linux 7.1-rc7 (2026-06-07 15:37:58 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loongson.git tags/loongarch-kvm-7.2

for you to fetch changes up to aeded601d6aceb57cdda4b2701d2ee00c43a8b69:

  LoongArch: KVM: Add missing slots_lock for device register/unregister (2026-06-11 20:46:44 +0800)

----------------------------------------------------------------
LoongArch KVM changes for v7.2

1. Enable FPU with max VM supported FPU type.
2. Some enhancements about interrupt injection.
3. Some bug fixes and other small changes.

----------------------------------------------------------------
Bibo Mao (12):
      LoongArch: KVM: Add separate KVM_REQ_LBT_LOAD bit
      LoongArch: KVM: Enable FPU with max supported FPU type
      LoongArch: KVM: Remove some middle FPU states
      LoongArch: KVM: Remove KVM_LARCH_LSX and KVM_LARCH_LASX
      LoongArch: KVM: Fix FPU register width with user access API
      LoongArch: KVM: Use existing macro about interrupt bit mask
      LoongArch: KVM: Check irq validity in kvm_vcpu_ioctl_interrupt()
      LoongArch: KVM: Check msgint feature in interrupt post
      LoongArch: KVM: Inject interrupts with batch method
      LoongArch: KVM: Add valid bit check when set CSR.ESTAT register
      LoongArch: KVM: Deliver interrupt after IN_GUEST_MODE is set
      LoongArch: KVM: Remove timer interrupt injection when SW timer expired

Qiang Ma (2):
      LoongArch: KVM: Check the return values for put_user()
      LoongArch: KVM: Return full old CSR value from kvm_emu_xchg_csr()

Yanfei Xu (1):
      LoongArch: KVM: Validate irqchip index in irqfd routing

Zeng Chi (1):
      LoongArch: KVM: Add missing slots_lock for device register/unregister

 arch/loongarch/include/asm/kvm_host.h |  14 ++--
 arch/loongarch/include/asm/kvm_vcpu.h |  43 +++++++++----
 arch/loongarch/kvm/exit.c             |  22 ++-----
 arch/loongarch/kvm/intc/eiointc.c     |   6 ++
 arch/loongarch/kvm/intc/ipi.c         |   2 +
 arch/loongarch/kvm/intc/pch_pic.c     |   2 +
 arch/loongarch/kvm/interrupt.c        |  98 ++++++++--------------------
 arch/loongarch/kvm/irqfd.c            |   3 +-
 arch/loongarch/kvm/timer.c            |   3 +-
 arch/loongarch/kvm/vcpu.c             | 118 ++++++++++++++--------------------
 10 files changed, 131 insertions(+), 180 deletions(-)

