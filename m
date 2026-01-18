Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D89243D544
	for <loongarch@lists.linux.dev>; Sun, 18 Jan 2026 01:48:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768700909; cv=none; b=SeR0avMQAvBqTUKc/WY5l44cozSyAvY+EdXwtR9Cc1FiwSxTK0rG8p0SqnFVebWtndRy9ikVNgop/PCJBwky4pkP50LUf51PZi3MFxrNlID3i0yALpc4Bmg92fH3h5WuZ0r+XI5GrDsQbKFIjVguoTYfJNnPqO1qLnIIiNrOJlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768700909; c=relaxed/simple;
	bh=Ikm9Gxk9qk6EOzTmaoT40qOBfegesYQ84y0ie3YzSYI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jV6la3uCzBD9TX4x4M87VTSTfm0pbtk4RYfA0gdMGZaR1/BZlSodWjj/XNIC0FKxzW6K7VHsk5+PxPD+fw/c4seTBIcjeDEcVQCXECZqdlkzymdHd+yIFlApyRDY+04NoQdMiJNz9qpdzCBActSRE92Hjp6z+dTYMHor7Octdqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.69.1])
	by gateway (Coremail) with SMTP id _____8AxCMLkO2xpGvgJAA--.20137S3;
	Sun, 18 Jan 2026 09:48:20 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.69.1])
	by front1 (Coremail) with SMTP id qMiowJCxecHcO2xppSUiAA--.6263S2;
	Sun, 18 Jan 2026 09:48:17 +0800 (CST)
From: Huacai Chen <chenhuacai@loongson.cn>
To: Linus Torvalds <torvalds@linux-foundation.org>,
	Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Guo Ren <guoren@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Huacai Chen <chenhuacai@loongson.cn>
Subject: [GIT PULL] LoongArch fixes for v6.19-rc6
Date: Sun, 18 Jan 2026 09:48:03 +0800
Message-ID: <20260118014803.754974-1-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJCxecHcO2xppSUiAA--.6263S2
X-CM-SenderInfo: hfkh0x5xdftxo6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoW7ZrWrJw4UuF1rZr15GF1Dtwc_yoW8uF4xpr
	W3uwsxtFn5GrW3WrnIg34Uur15XFs7Jr17Wa13try8GFnxZw1UXry8JryrAa45J3yrJF10
	qr1rG3WjgF1UJagCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUvEb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Gr0_Gr1UM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYI
	kI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUXVWU
	AwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI4
	8JMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMxCIbckI1I0E14v26r1Y
	6r17MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7
	AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE
	2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcV
	C2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73
	UjIFyTuYvjxU2MKZDUUUU

The following changes since commit 0f61b1860cc3f52aef9036d7235ed1f017632193:

  Linux 6.19-rc5 (2026-01-11 17:03:14 -1000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loongson.git tags/loongarch-fixes-6.19-2

for you to fetch changes up to 1cf342a7c3adc5877837b53bbceb5cc9eff60bbf:

  LoongArch: KVM: Fix kvm_device leak in kvm_pch_pic_destroy() (2026-01-17 10:57:03 +0800)

----------------------------------------------------------------
LoongArch fixes for v6.19-rc6

Remove redundant code in head.S, fix PMU counter allocation for mixed-
type event groups, fix a lot of dts build warnings, and fix kvm_device
memory leaks.
----------------------------------------------------------------
Binbin Zhou (4):
      LoongArch: dts: loongson-2k0500: Add default interrupt controller address cells
      LoongArch: dts: loongson-2k1000: Add default interrupt controller address cells
      LoongArch: dts: loongson-2k2000: Add default interrupt controller address cells
      LoongArch: dts: loongson-2k1000: Fix i2c-gpio node names

Huacai Chen (1):
      LoongArch: Remove redundant code in head.S

Lisa Robinson (1):
      LoongArch: Fix PMU counter allocation for mixed-type event groups

Qiang Ma (3):
      LoongArch: KVM: Fix kvm_device leak in kvm_ipi_destroy()
      LoongArch: KVM: Fix kvm_device leak in kvm_eiointc_destroy()
      LoongArch: KVM: Fix kvm_device leak in kvm_pch_pic_destroy()

Yao Zi (1):
      LoongArch: dts: Describe PCI sideband IRQ through interrupt-extended

 arch/loongarch/boot/dts/loongson-2k0500.dtsi |  3 +++
 arch/loongarch/boot/dts/loongson-2k1000.dtsi | 31 +++++++++++-------------
 arch/loongarch/boot/dts/loongson-2k2000.dtsi | 35 ++++++++++++----------------
 arch/loongarch/kernel/head.S                 |  8 -------
 arch/loongarch/kernel/perf_event.c           | 21 ++++++++++++++---
 arch/loongarch/kvm/intc/eiointc.c            |  1 +
 arch/loongarch/kvm/intc/ipi.c                |  1 +
 arch/loongarch/kvm/intc/pch_pic.c            |  1 +
 8 files changed, 52 insertions(+), 49 deletions(-)

