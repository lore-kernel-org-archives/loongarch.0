Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B9C149E13A
	for <loongarch@lists.linux.dev>; Thu, 15 Oct 2026 06:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792046838; cv=none; b=svKBQZQ31AXKCGN3by99nf1CiskonMlAOH2O8tcVrvMpZ2wMh4Ot7OFUe7VFVasP4g8KY3JCTQDlxlp6JFHCyB1ZOuf31AJW054s+HlRwsODPYPgumtGNxrz/mgdXvilQeqLhWpjXK6OUmVeeJfllL3TBaB54rbfQ6pWpDXXBEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792046838; c=relaxed/simple;
	bh=HzhBr8+hGnC8+QpQfpW4tkxgtK9VVNSpeBW+/1bD83Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Y210c36rTJyFdCgGVaXqC8BZdILuaaR2HPcsf+JPTzLcjn1p5EaRLUvBOER4+r/+g69T8DThuMVHLH3/n9KegcV8xIVtzFAyANLrrFXJ1ApQiVQQer0FRIwHQ0gOb2ZJDLbDgvHjxacI9rroqk2CJnoZoiLoG4RSHjUKVpTHu8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.109])
	by gateway (Coremail) with SMTP id _____8BxLtPvdtBqKAUWAA--.63950S3;
	Thu, 15 Oct 2026 14:47:11 +0800 (CST)
Received: from kernelserver (unknown [223.64.68.109])
	by front1 (Coremail) with SMTP id qMiowJAx3c7sdtBqKI4sAA--.28417S2;
	Thu, 15 Oct 2026 14:47:11 +0800 (CST)
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
Subject: [GIT PULL] LoongArch KVM changes for v7.4
Date: Thu, 15 Oct 2026 14:46:56 +0800
Message-ID: <20261015064656.1525830-1-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJAx3c7sdtBqKI4sAA--.28417S2
X-CM-SenderInfo: hfkh0x5xdftxo6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoWxXF4fAF1kGr1DCw47GrWDZFc_yoW5JFWkpF
	y3urnxJr4rGr93Ar9Fg34kur1DJr1xGr1aqa4akFyxCr43Zr1UXry8Gr1kXFy5J3yrJry0
	qr1fGw1agF1UJacCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkYb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
	Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE
	14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x
	0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E
	7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcV
	C0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF
	04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7
	CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8xuctUUUUU==

The following changes since commit 24a19b953e2a3d0ea5a8c4951a0ab8f32720c907:

  Linux 7.3-rc7 (2026-10-11 20:04:55 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loongson.git tags/loongarch-kvm-7.4

for you to fetch changes up to 34f4ce22cf25802d8026c60c13c2db81f8c8e3a0:

  KVM: LoongArch: selftests: Enable HW PTW by auto detection method (2026-10-13 16:49:05 +0800)

----------------------------------------------------------------
LoongArch KVM changes for v7.4

1. Add separate vmid support.
2. Simplify MSI intterupt injection.
3. Add hypercall crash support.
4. Allow to set pv_feature until vCPU run.
5. Enable HW PTW automatically in selftests.

----------------------------------------------------------------
Bibo Mao (8):
      LoongArch: KVM: Add vmid support for stage2 MMU
      LoongArch: KVM: Implement vmid updating logic
      LoongArch: KVM: Probe & enable separate vmid feature
      LoongArch: KVM: Remove parameter "level" when injecting MSI
      LoongArch: KVM: Remove duplicated checking with DMSI irq injection
      LoongArch: KVM: Add hypercall crash support
      LoongArch: KVM: Allow to set pv_feature until vCPU run
      KVM: LoongArch: selftests: Enable HW PTW by auto detection method

Chaithanya Lagisetty (1):
      LoongArch: KVM: Return the actual error code in kvm_ipi_create()

 arch/loongarch/include/asm/kvm_dmsintc.h           |  3 +-
 arch/loongarch/include/asm/kvm_host.h              | 15 ++++-
 arch/loongarch/include/asm/kvm_para.h              |  3 +
 arch/loongarch/include/asm/kvm_pch_pic.h           |  2 +-
 arch/loongarch/include/asm/loongarch.h             |  5 ++
 arch/loongarch/include/uapi/asm/kvm.h              |  1 +
 arch/loongarch/include/uapi/asm/kvm_para.h         |  1 +
 arch/loongarch/kernel/asm-offsets.c                |  1 +
 arch/loongarch/kernel/cpu-probe.c                  |  4 ++
 arch/loongarch/kvm/exit.c                          | 11 ++++
 arch/loongarch/kvm/intc/dmsintc.c                  | 36 +++--------
 arch/loongarch/kvm/intc/ipi.c                      |  7 +--
 arch/loongarch/kvm/intc/pch_pic.c                  |  6 +-
 arch/loongarch/kvm/irqfd.c                         |  4 +-
 arch/loongarch/kvm/main.c                          | 71 ++++++++++++++++++++--
 arch/loongarch/kvm/mmu.c                           | 25 +++++++-
 arch/loongarch/kvm/switch.S                        |  5 +-
 arch/loongarch/kvm/tlb.c                           | 19 +++++-
 arch/loongarch/kvm/vcpu.c                          | 15 ++++-
 arch/loongarch/kvm/vm.c                            |  2 +
 .../selftests/kvm/include/loongarch/processor.h    |  3 +
 .../selftests/kvm/lib/loongarch/processor.c        | 16 ++++-
 22 files changed, 194 insertions(+), 61 deletions(-)

