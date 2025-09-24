Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F00F95FDA7
	for <loongarch@lists.linux.dev>; Wed, 24 Sep 2025 08:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758701622; cv=none; b=R+NqcMy6VfhpUe+0IhiF43Y5u+nAR8kxZ3Farij/B7vZxCnMUXZ7NwuvDdvMXqhB1YZlyBlfpeXIl7aF9vSJq5nmt3fq1ucBgslrFKMgqix81NRBclH1CpB5gzfYeFLfkW9l786OfoTtxySuo55bxDJ2cYk0hM2MoRIrdkNL5LM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758701622; c=relaxed/simple;
	bh=RU9nU4TgrkuZsnJ7uuoI3e4j3dHjMdpU+wa0jq7caDM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ILdxtyTn1FRf78mSIMSyQau0Py3h9DP0jYQQSRy8WvmUuMRlgn0AA2hUnZZvt4xFKAqhfUOS/Knv/+ab/wtMLui584PaXKjFAQhidOnXj+DRobdrynTOqssHlW4lQIWYQ4CSIoHCXhLSEvjo96O7R+u43nRfFJEPMClun1wbDXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.198])
	by gateway (Coremail) with SMTP id _____8Axjr8vqNNomv8NAA--.28628S3;
	Wed, 24 Sep 2025 16:13:35 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.68.198])
	by front1 (Coremail) with SMTP id qMiowJAx_8EcqNNorvaqAA--.46292S2;
	Wed, 24 Sep 2025 16:13:27 +0800 (CST)
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
Subject: [GIT PULL] LoongArch KVM changes for v6.18
Date: Wed, 24 Sep 2025 16:13:05 +0800
Message-ID: <20250924081305.3068787-1-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJAx_8EcqNNorvaqAA--.46292S2
X-CM-SenderInfo: hfkh0x5xdftxo6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoW7tw4fZFWfJF4UJw17Aw43Arc_yoW8uFW5pF
	13urnrCr4rJrW7Xry8X343WrnrAF1xGryaqF45Kw48CF1DAFyjgryUXr95ZFyjka93Jr10
	qw1rGw1jvF1UAagCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkjb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I
	8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AK
	xVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2Ij64
	vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8G
	jcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2I
	x0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK
	8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I
	0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07jOF4_UUUUU=

The following changes since commit 07e27ad16399afcd693be20211b0dfae63e0615f:

  Linux 6.17-rc7 (2025-09-21 15:08:52 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loongson.git tags/loongarch-kvm-6.18

for you to fetch changes up to 66e2d96b1c5875122bfb94239989d832ccf51477:

  LoongArch: KVM: Move kvm_iocsr tracepoint out of generic code (2025-09-23 23:37:26 +0800)

----------------------------------------------------------------
LoongArch KVM changes for v6.18

1. Add PTW feature detection on new hardware.
2. Add sign extension with kernel MMIO/IOCSR emulation.
3. Improve in-kernel IPI emulation.
4. Improve in-kernel PCH-PIC emulation.
5. Move kvm_iocsr tracepoint out of generic code.

----------------------------------------------------------------
Bibo Mao (9):
      LoongArch: KVM: Add PTW feature detection on new hardware
      LoongArch: KVM: Add sign extension with kernel MMIO read emulation
      LoongArch: KVM: Add sign extension with kernel IOCSR read emulation
      LoongArch: KVM: Add implementation with IOCSR_IPI_SET
      LoongArch: KVM: Access mailbox directly in mail_send()
      LoongArch: KVM: Set version information at initial stage
      LoongArch: KVM: Add IRR and ISR register read emulation
      LoongArch: KVM: Add different length support in loongarch_pch_pic_read()
      LoongArch: KVM: Add different length support in loongarch_pch_pic_write()

Steven Rostedt (1):
      LoongArch: KVM: Move kvm_iocsr tracepoint out of generic code

Yury Norov (NVIDIA) (1):
      LoongArch: KVM: Rework pch_pic_update_batch_irqs()

 arch/loongarch/include/asm/kvm_pch_pic.h |  15 +-
 arch/loongarch/include/uapi/asm/kvm.h    |   1 +
 arch/loongarch/kvm/exit.c                |  19 +--
 arch/loongarch/kvm/intc/ipi.c            |  80 ++++++-----
 arch/loongarch/kvm/intc/pch_pic.c        | 239 +++++++++++++------------------
 arch/loongarch/kvm/trace.h               |  35 +++++
 arch/loongarch/kvm/vcpu.c                |   2 +
 arch/loongarch/kvm/vm.c                  |   4 +
 include/trace/events/kvm.h               |  35 -----
 9 files changed, 211 insertions(+), 219 deletions(-)

