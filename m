Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=114.242.206.163
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794405953;
	b=nk2CXRWABWbhXPcIJvE2geIFUrOcp4wwU6q3/vb/teF5V0ghWNYtBRIGYysSepyG0cap
	 6Ips4X9miOgesHEEtQM6A+Yw1rXvqBF7TWUMJGkY6LfdHtaLCfIakWgOO9kuaZe49IB3R
	 y6AS3gXYG/WtL94zhfyfHjizbA8hEQ7rli3tFDwXoR/IJGQpjS2WcH4CaeJ4Uz3WHqmmO
	 8eaEXbrJEMQMkxCmPh27SvtgFKk8J2bpeAb9KrMfEnP1k/7JRYj3GguIL4Vc/Ijxd9Ha6
	 lPD3IFzw9hwj/BjlCyp7eFtt+RSoREciIJp2Ha5gD2GU1+aQMttYul/9kidnTbbCpmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794405953;
	h=DMARC-Filter:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:X-CM-TRANSID:
	 X-CM-SenderInfo:X-Coremail-Antispam;
	bh=YmrcfgcwkxKNZg0iNiiDr2NYN6573L8YQrdPEwtnUro=;
	b=lZlSBKY5Xv7vaifenQ+LGQodr3W3Sq4mQ1MVQH5JPkUp5zgApbpJ1fxhQuDsDFlIECax
	 dFNDTtVtr4vJoH07XfNqbQd56BSefqE+2lCPR2HY5z50RycJKmjfbGjWlEY3m7cHQjvme
	 FLsuHHLEev0IDsdWlfBL9qsyXNL/yK1bLyJ3n7ZrJferA2Ez5qGjLjjGL4TZ0uslrXxI/
	 HnaUvzR8jPbWBwPZdqPm7RcxmrfFkRzcdo0oH7/xIE/EVbJAG4XtZcriLUgWXn0iw4YYW
	 qFw/1z9VNsggbzhgOkp46/bIxYKU2nprFcyXU9ap5akTBDix8oXyjf2Dha5NvGrPftg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=loongson.cn;
	spf=pass smtp.mailfrom=loongson.cn;
	arc=none smtp.remote-ip=114.242.206.163
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25E62606A32D
	for <loongarch@lists.linux.dev>; Wed, 11 Nov 2026 14:05:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25E62606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.69.17])
	by gateway (Coremail) with SMTP id _____8BxLNI8dvRq2Y8eAA--.22594S3;
	Wed, 11 Nov 2026 22:05:48 +0800 (CST)
Received: from kernelserver (unknown [223.64.69.17])
	by front1 (Coremail) with SMTP id qMiowJCxtMw3dvRqALwzAA--.13124S2;
	Wed, 11 Nov 2026 22:05:47 +0800 (CST)
From: Huacai Chen <chenhuacai@loongson.cn>
To: Linus Torvalds <torvalds@linux-foundation.org>,
	Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Guo Ren <guoren@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Huacai Chen <chenhuacai@loongson.cn>
Subject: [GIT PULL] LoongArch fixes for v7.4-rc3
Date: Wed, 11 Nov 2026 22:05:34 +0800
Message-ID: <20261111140535.3899978-1-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.52.0
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJCxtMw3dvRqALwzAA--.13124S2
X-CM-SenderInfo: hfkh0x5xdftxo6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoW7tw1DWr1ftrW3Cr1xXr4fJFc_yoW8uF4Upr
	y3uFnxGF4DGry3JrnIk34Uur15Jr1xG34fXF47Cry8CF15Ar1UJry7XrykXa4UA3yrJry0
	qF1rG3WYgF1UJagCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUk2b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv
	67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2
	Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s02
	6x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0x
	vE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE
	42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6x
	kF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUcVc_UUUUU

The following changes since commit 7475ea8b58616b33c04afb976cf0fbaad9dd63fb:

  Linux 7.4-rc2 (2026-11-08 16:22:20 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loongson.git tags/loongarch-fixes-7.4-1

for you to fetch changes up to 422e532809572ba1043192bf6a0c653bc68b3140:

  LoongArch: KVM: Reject repeated PCH-PIC CTRL_INIT (2026-11-10 17:20:42 +0800)

----------------------------------------------------------------
LoongArch fixes for v7.4-rc3

Fix several bugs about ACPI IOVT, KEXEC, Hibernation, BPF JIT and KVM.
----------------------------------------------------------------
Bibo Mao (2):
      ACPI: LoongArch: Fix incorrect pointer in acpi_iovt_init()
      ACPI: LoongArch: Add checksum validation for ACPI IOVT table

Huacai Chen (1):
      ACPI: LoongArch: Validate ACPI IOVT device entries

Jinjie Ruan (2):
      LoongArch: kexec_file: Fix a modified cmdline leak
      LoongArch: kexec_file: Fix elf_headers memory leak in retry loop

Mike Rapoport (Microsoft) (1):
      LoongArch: Restore KFENCE pages through DMW on resume

Tao Cui (3):
      LoongArch: KVM: Clear device pointer in irqchip destroy callbacks
      LoongArch: KVM: Propagate real error code in kvm_pch_pic_create()
      LoongArch: KVM: Reject repeated PCH-PIC CTRL_INIT

Tiezhu Yang (2):
      LoongArch: BPF: Make arena support depend on 128-bit cmpxchg
      LoongArch: BPF: Make use of beqz and bnez for trampoline branches

 arch/loongarch/include/asm/inst.h          | 21 +++++++++
 arch/loongarch/kernel/inst.c               | 28 +++++++++++
 arch/loongarch/kernel/machine_kexec.c      |  2 +
 arch/loongarch/kernel/machine_kexec_file.c |  4 ++
 arch/loongarch/kvm/intc/dmsintc.c          |  1 +
 arch/loongarch/kvm/intc/eiointc.c          |  1 +
 arch/loongarch/kvm/intc/ipi.c              |  1 +
 arch/loongarch/kvm/intc/pch_pic.c          | 18 +++++--
 arch/loongarch/net/bpf_jit.c               | 16 +++++--
 arch/loongarch/power/hibernate.c           |  6 +++
 drivers/acpi/loongarch/iovt.c              | 76 +++++++++++++++++++++++++-----
 11 files changed, 156 insertions(+), 18 deletions(-)

