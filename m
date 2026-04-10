Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C9EC37DEA0
	for <loongarch@lists.linux.dev>; Fri, 10 Apr 2026 10:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775816607; cv=none; b=ov0bfGkfR4WdDY3VwYbUzfyBiIF7srCadc8LfAWmvco9tgQqXsdR6oBmZopWChfTc2/aR3gnZXCiWbMlUYC328kwYdDJAUPiVsvkTujSfT99TznyDMJaiiX0raVQOKDa8pEVMs6bqp0PBHoc1iHGnnzimGRPh7c5HWt/Ix1XO5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775816607; c=relaxed/simple;
	bh=yBZaykq8NceUyGXJ09ciRntxCq5vrz2Gky5gYr1KgLY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=X68fVAwvS9uuyBHHZS5WcuS0C+MOv57yxdVtttG6hlVtz6m2nJGlCNRK/J4e8S3NLEbj4TR3q3FtvsfIEINjG0Zwb7D6A9WPT0l7ngP0wmHRdu8OVAbNiu/1duu40sipDNZSV/THiB49TZto1H35L8X7Gdhs5QWDLbNHoDMPc/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.17])
	by gateway (Coremail) with SMTP id _____8Bx28KPz9hpH_YjAA--.33798S3;
	Fri, 10 Apr 2026 18:23:13 +0800 (CST)
Received: from kernelserver (unknown [223.64.68.17])
	by front1 (Coremail) with SMTP id qMiowJCxdcCEz9hpUkpqAA--.37300S2;
	Fri, 10 Apr 2026 18:23:10 +0800 (CST)
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
Subject: [GIT PULL] LoongArch KVM changes for v7.1
Date: Fri, 10 Apr 2026 18:22:45 +0800
Message-ID: <20260410102245.2749691-1-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJCxdcCEz9hpUkpqAA--.37300S2
X-CM-SenderInfo: hfkh0x5xdftxo6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoWxGw1DArWDXr4DCFWxtFyfKrX_yoW5WF4kpF
	W3urn3Gr48GFyfJrn7Ka4DurnrJF1xGr1IqF1ayFy8Ar42vF18Xry8GrykXFy5Gay8Jr1F
	vr1fG3WYgF1UJacCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkFb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv
	67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2
	Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s02
	6x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0x
	vE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE
	42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6x
	kF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07UNvtZUUUUU=

The following changes since commit 591cd656a1bf5ea94a222af5ef2ee76df029c1d2:

  Linux 7.0-rc7 (2026-04-05 15:26:23 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loongson.git tags/loongarch-kvm-7.1

for you to fetch changes up to e47b8e1db9a9bbef6765e85b11e87f48e6b56846:

  KVM: LoongArch: selftests: Add PMU overflow interrupt test (2026-04-09 18:56:38 +0800)

----------------------------------------------------------------
LoongArch KVM changes for v7.1

1. Use CSR_CRMD_PLV in kvm_arch_vcpu_in_kernel().
2. Let vcpu_is_preempted() a macro & some enhanments.
3. Add DMSINTC irqchip in kernel support.
4. Add KVM PMU test cases for tools/selftests.

----------------------------------------------------------------
Bibo Mao (4):
      LoongArch: KVM: Check kvm_request_pending() in kvm_late_check_requests()
      LoongArch: KVM: Move host CSR_EENTRY save and restore in context switch
      LoongArch: KVM: Move host CSR_GSTAT save and restore in context switch
      LoongArch: KVM: Make vcpu_is_preempted() as a macro rather than function

Song Gao (5):
      LoongArch: KVM: Add DMSINTC device support
      LoongArch: KVM: Add DMSINTC inject msi to vCPU
      KVM: LoongArch: selftests: Add cpucfg read/write helpers
      KVM: LoongArch: selftests: Add basic PMU event counting test
      KVM: LoongArch: selftests: Add PMU overflow interrupt test

Tao Cui (1):
      LoongArch: KVM: Use CSR_CRMD_PLV in kvm_arch_vcpu_in_kernel()

 arch/loongarch/include/asm/kvm_dmsintc.h           |  27 +++
 arch/loongarch/include/asm/kvm_host.h              |   3 +
 arch/loongarch/include/asm/kvm_pch_pic.h           |   3 +-
 arch/loongarch/include/asm/qspinlock.h             |  26 ++-
 arch/loongarch/include/uapi/asm/kvm.h              |   4 +
 arch/loongarch/kernel/paravirt.c                   |  16 +-
 arch/loongarch/kvm/Makefile                        |   1 +
 arch/loongarch/kvm/intc/dmsintc.c                  | 182 ++++++++++++++++++
 arch/loongarch/kvm/intc/pch_pic.c                  |  15 +-
 arch/loongarch/kvm/interrupt.c                     |   2 +
 arch/loongarch/kvm/irqfd.c                         |  10 +-
 arch/loongarch/kvm/main.c                          |  14 +-
 arch/loongarch/kvm/vcpu.c                          |  29 +--
 include/uapi/linux/kvm.h                           |   2 +
 tools/testing/selftests/kvm/Makefile.kvm           |   3 +-
 .../testing/selftests/kvm/include/loongarch/pmu.h  |  66 +++++++
 .../selftests/kvm/include/loongarch/processor.h    |  15 ++
 .../selftests/kvm/lib/loongarch/processor.c        |  15 +-
 tools/testing/selftests/kvm/loongarch/pmu_test.c   | 205 +++++++++++++++++++++
 19 files changed, 593 insertions(+), 45 deletions(-)
 create mode 100644 arch/loongarch/include/asm/kvm_dmsintc.h
 create mode 100644 arch/loongarch/kvm/intc/dmsintc.c
 create mode 100644 tools/testing/selftests/kvm/include/loongarch/pmu.h
 create mode 100644 tools/testing/selftests/kvm/loongarch/pmu_test.c

