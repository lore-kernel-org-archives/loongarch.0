Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A425E40DB47
	for <loongarch@lists.linux.dev>; Thu, 13 Aug 2026 12:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786622937; cv=none; b=Hr3zOljWlbyY+fVHDVVpJuLXkYZDJ8E5H0VYhak+l3C/GjwLZphdGfliTygjwO97wD4dWzCtWoONWEnZ7hXeBHAYseStzCmOC60oTIkQdm9GR9Q/8yCBZJhbQMzmwWos4SErYXbXmyodYQbLTkUHDKprwiqCwzC7B5qP5xK35hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786622937; c=relaxed/simple;
	bh=V9m7jIolaMqzijtPL4jganEyjYv4SPayUvnBdtIm/js=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LnSp9IeeZXDSFvjb2C3/EsAH9Fbn6EWa+4H+GIX+0ouW50VI5EkxM1FLzZZfckxbaf5CboLYBIR7SGBC/E2Cee2Uu2P/uweKqn5sZH9IGhJnQ7gOM5zAwxfACjcWBbKiDrfXz0AtX0Mv+BixfcdM6wTD8nlQWp/obELKXDRfIlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.87])
	by gateway (Coremail) with SMTP id _____8CxPNLUs31qIeYAAA--.2680S3;
	Thu, 13 Aug 2026 20:08:52 +0800 (CST)
Received: from kernelserver (unknown [223.64.68.87])
	by front1 (Coremail) with SMTP id qMiowJAxX8_Gs31qZ10DAA--.22644S2;
	Thu, 13 Aug 2026 20:08:52 +0800 (CST)
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
Subject: [GIT PULL] LoongArch KVM changes for v7.3
Date: Thu, 13 Aug 2026 20:08:29 +0800
Message-ID: <20260813120829.823203-1-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJAxX8_Gs31qZ10DAA--.22644S2
X-CM-SenderInfo: hfkh0x5xdftxo6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoW7ZF4xZr48JFy8Xry7trWDGFX_yoW5Jr17pF
	Wa9rnxKrs5JF43JwnFva4qqF43tF1xCr1xW3W5Kry8Cr4DAryUXry7GrZ7XFy5G395Xr1F
	vr1rGw15WF1UJacCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkFb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv
	67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2
	Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s02
	6x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0x
	vE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE
	42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6x
	kF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07jUsqXUUUUU=

The following changes since commit db2ddb87143519e20a95aa36c60b36107b736a58:

  Linux 7.2-rc7 (2026-08-09 14:54:50 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loongson.git tags/loongarch-kvm-7.3

for you to fetch changes up to c5959723aaae06aa617253528e6b228b3c858215:

  KVM: LoongArch: selftests: Add FPU/LSX/LASX test cases (2026-08-10 12:21:58 +0800)

----------------------------------------------------------------
LoongArch KVM changes for v7.3

1. Advertise already-supported capabilities.
2. Some bug fixes about timer and MMIO.
3. Some hardening about interrupt injection.
4. Replace kvm_err() with kvm_pr_unimpl().
5. Add FPU/LSX/LASX test cases for selftests.

----------------------------------------------------------------
Bibo Mao (8):
      LoongArch: KVM: Set vcpu->cpu before IN_GUEST_MODE is set
      LoongArch: KVM: Set default MAILBOX access size with 8
      LoongArch: KVM: Return directly when IPI address is not aligned
      LoongArch: KVM: Fix uninitialized stack variable issue with dmsintc
      LoongArch: KVM: Use internal API to deliver interrupt in kernel mode
      LoongArch: KVM: Replace kvm_err() with kvm_pr_unimpl()
      KVM: LoongArch: selftests: Enable LSX/LASX by auto detection
      KVM: LoongArch: selftests: Add FPU/LSX/LASX test cases

Tao Cui (3):
      LoongArch: KVM: Advertise already-supported capabilities
      LoongArch: KVM: Reload one-shot TVAL on migration destination
      LoongArch: KVM: Prevent division by zero in periodic timer restore

Zeng Chi (1):
      LoongArch: KVM: Fix PC double advance in kernel MMIO read fast path

 arch/loongarch/kvm/exit.c                          |  19 ++-
 arch/loongarch/kvm/intc/dmsintc.c                  |  18 +--
 arch/loongarch/kvm/intc/eiointc.c                  |  32 ++---
 arch/loongarch/kvm/intc/ipi.c                      |  77 ++++++------
 arch/loongarch/kvm/intc/pch_pic.c                  |  12 +-
 arch/loongarch/kvm/timer.c                         |  14 +++
 arch/loongarch/kvm/vcpu.c                          |   7 +-
 arch/loongarch/kvm/vm.c                            |   4 +
 tools/testing/selftests/kvm/Makefile.kvm           |   3 +-
 .../selftests/kvm/include/loongarch/processor.h    |  18 +++
 .../selftests/kvm/lib/loongarch/processor.c        |  11 +-
 tools/testing/selftests/kvm/loongarch/fpu_test.c   | 137 +++++++++++++++++++++
 12 files changed, 269 insertions(+), 83 deletions(-)
 create mode 100644 tools/testing/selftests/kvm/loongarch/fpu_test.c

