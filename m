Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 605821172A
	for <loongarch@lists.linux.dev>; Thu, 22 May 2025 03:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747883233; cv=none; b=q0IVg/SEsCP+Ck4J2PzZr3rM1w7sJu1wB/tqVx7Yjx6t/TRm7bFv1vlvSY8FUkAzTxWYHRwjogKEi5POw2M6Mz38vApM9L+eQvE2EwQe95JdVCiOhq0B4ZRmQziq0C4pPQo8jA0f6iSMYedeBANpY2PavSRz0PZ4j8woYy9wRsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747883233; c=relaxed/simple;
	bh=/tFrh5QqKOL4ygIBBWFi3Vw9SPY03/r3IMgvMlztlNg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CSuF4PhSLdaCHwYquDdL33zN6eEwQkDs5q5QV6Dl1EEF622QsfOltFGDp0FoWh+IcnIZuBS5S7EY7SGVcK/wphOHPqrglfleEgOTEqFk395LXTz566CZ2FdvoEL9b/rQVADPq5uOjONWD0U/ySZod8cGPLP1BCKz3S6SOa2bh7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.69.3])
	by gateway (Coremail) with SMTP id _____8Ax3eLVlC5ontv1AA--.31207S3;
	Thu, 22 May 2025 11:07:01 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.69.3])
	by front1 (Coremail) with SMTP id qMiowMDxesTIlC5orADnAA--.58454S2;
	Thu, 22 May 2025 11:06:59 +0800 (CST)
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
Subject: [GIT PULL] LoongArch KVM changes for v6.16
Date: Thu, 22 May 2025 11:06:28 +0800
Message-ID: <20250522030628.1924833-1-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMDxesTIlC5orADnAA--.58454S2
X-CM-SenderInfo: hfkh0x5xdftxo6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoWxAFy7Gr4rZr47Kr4kCFyrXwc_yoW5GrWUp3
	WSvrn3Kr18KF17Ar97J34kXryft3WkGr4Iv3Waqry8Cr1jyry8Jr1xKF95Aa43Z395XryF
	va4xGwn8WF1UJacCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUyEb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4
	xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v2
	6r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x0EwI
	xGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480
	Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7
	IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k2
	6cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxV
	AFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8j-e5UUUUU==

The following changes since commit a5806cd506af5a7c19bcd596e4708b5c464bfd21:

  Linux 6.15-rc7 (2025-05-18 13:57:29 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loongson.git tags/loongarch-kvm-6.16

for you to fetch changes up to a867688c8cbb1b83667a6665362d89e8c762e820:

  KVM: selftests: Add supported test cases for LoongArch (2025-05-20 20:20:26 +0800)

----------------------------------------------------------------
LoongArch KVM changes for v6.16

1. Don't flush tlb if HW PTW supported.
2. Add LoongArch KVM selftests support.

----------------------------------------------------------------
Bibo Mao (7):
      LoongArch: KVM: Add ecode parameter for exception handlers
      LoongArch: KVM: Do not flush tlb if HW PTW supported
      KVM: selftests: Add VM_MODE_P47V47_16K VM mode
      KVM: selftests: Add KVM selftests header files for LoongArch
      KVM: selftests: Add core KVM selftests support for LoongArch
      KVM: selftests: Add ucall test support for LoongArch
      KVM: selftests: Add supported test cases for LoongArch

 MAINTAINERS                                        |   2 +
 arch/loongarch/include/asm/kvm_host.h              |   2 +-
 arch/loongarch/include/asm/kvm_vcpu.h              |   2 +-
 arch/loongarch/kvm/exit.c                          |  37 +--
 arch/loongarch/kvm/mmu.c                           |  15 +-
 tools/testing/selftests/kvm/Makefile               |   2 +-
 tools/testing/selftests/kvm/Makefile.kvm           |  17 +
 tools/testing/selftests/kvm/include/kvm_util.h     |   6 +
 .../kvm/include/loongarch/kvm_util_arch.h          |   7 +
 .../selftests/kvm/include/loongarch/processor.h    | 141 +++++++++
 .../selftests/kvm/include/loongarch/ucall.h        |  20 ++
 tools/testing/selftests/kvm/lib/kvm_util.c         |   3 +
 .../selftests/kvm/lib/loongarch/exception.S        |  59 ++++
 .../selftests/kvm/lib/loongarch/processor.c        | 346 +++++++++++++++++++++
 tools/testing/selftests/kvm/lib/loongarch/ucall.c  |  38 +++
 .../testing/selftests/kvm/set_memory_region_test.c |   2 +-
 16 files changed, 674 insertions(+), 25 deletions(-)
 create mode 100644 tools/testing/selftests/kvm/include/loongarch/kvm_util_arch.h
 create mode 100644 tools/testing/selftests/kvm/include/loongarch/processor.h
 create mode 100644 tools/testing/selftests/kvm/include/loongarch/ucall.h
 create mode 100644 tools/testing/selftests/kvm/lib/loongarch/exception.S
 create mode 100644 tools/testing/selftests/kvm/lib/loongarch/processor.c
 create mode 100644 tools/testing/selftests/kvm/lib/loongarch/ucall.c

