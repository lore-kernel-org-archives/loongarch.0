Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8FA186329
	for <loongarch@lists.linux.dev>; Wed, 18 Mar 2026 04:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773807686; cv=none; b=hl8UKuRHhTZBHWtYzcNhF9u5+JO+jRiy4oAQqil9KvU4ePFdXsbZhR0U2jk3qtLCZDqgDm8ZpjzOET4RVMMvYxkqTuo7wsjEN+EawbWBGrfSTxNzGiNdSRHgUJtDsRjEVrv3vj+obaqub115t0XZ6JLeHd5uJRSKDOkhe+l27cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773807686; c=relaxed/simple;
	bh=CUaagZUYqxKuvt+PwFg+8gtaESU8LG/Itlmlshi19mI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=fb+5NS/LxcOWg+cYihHBFUma6mMnFr2ybDHbTPXHlKBEsx63bg1AsDp/cdUGmcpVF4MZ3B8MbpEvNUm2bUVpA0Gn3aW4CvEDGqNzJYup/OmdBUSlx9lz6R/qYUlvkMFC90ysXb0FLT+d12u5xCEPqevtKvZ8SDVAFJkgbXAbH6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.17])
	by gateway (Coremail) with SMTP id _____8CxJME_KLppSTUcAA--.34725S3;
	Wed, 18 Mar 2026 12:21:19 +0800 (CST)
Received: from kernelserver (unknown [223.64.68.17])
	by front1 (Coremail) with SMTP id qMiowJBxxuI6KLppL4FXAA--.37122S2;
	Wed, 18 Mar 2026 12:21:17 +0800 (CST)
From: Huacai Chen <chenhuacai@loongson.cn>
To: Linus Torvalds <torvalds@linux-foundation.org>,
	Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Guo Ren <guoren@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Huacai Chen <chenhuacai@loongson.cn>
Subject: [GIT PULL] LoongArch fixes for v7.0-rc5
Date: Wed, 18 Mar 2026 12:20:56 +0800
Message-ID: <20260318042101.626343-1-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJBxxuI6KLppL4FXAA--.37122S2
X-CM-SenderInfo: hfkh0x5xdftxo6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoW7WryDCw17urWxJF4xXw48KrX_yoW8AFWxpr
	13ur9xJr4UGryfX3W3t345Wr45JF48K34IqF4akw1rCFyUZr1UXr4xXry8XFyDJ3yYqr10
	qF4rJw1jgF1DJacCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUU90b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1ln4kS14v26r1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12
	xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y
	6r17McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64
	vIr41l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_
	Jrv_JF1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1V
	AY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAI
	cVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42
	IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVj
	vjDU0xZFpf9x07jepB-UUUUU=

The following changes since commit f338e77383789c0cae23ca3d48adcc5e9e137e3c:

  Linux 7.0-rc4 (2026-03-15 13:52:05 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loongson.git tags/loongarch-fixes-7.0-1

for you to fetch changes up to c252c12d1f55bd5737e3b8e7839914ccdc7a701c:

  LoongArch: KVM: Fix typo issue in kvm_vm_init_features() (2026-03-16 10:36:02 +0800)

----------------------------------------------------------------
LoongArch fixes for v7.0-rc5

Only use SC.Q when supported by the assembler to fix a build failure,
fix calling smp_processor_id() in preemptible code, make a BPF helper
arch_protect_bpf_trampoline() return 0 to fix a kernel memory access
failure, and fix a typo issue in kvm_vm_init_features().
----------------------------------------------------------------
Bibo Mao (1):
      LoongArch: KVM: Fix typo issue in kvm_vm_init_features()

Thomas Weißschuh (1):
      LoongArch: Only use SC.Q when supported by the assembler

Tiezhu Yang (4):
      LoongArch: Give more information if kmem access failed
      LoongArch: Check return values for set_memory_{rw,rox}
      LoongArch: No need to flush icache if text copy failed
      LoongArch: BPF: Make arch_protect_bpf_trampoline() return 0

Xi Ruoyao (1):
      LoongArch: Fix calling smp_processor_id() in preemptible code

 arch/loongarch/Kconfig               |  3 +++
 arch/loongarch/include/asm/cmpxchg.h |  5 +++++
 arch/loongarch/include/asm/uaccess.h | 14 ++++++++++++--
 arch/loongarch/kernel/inst.c         | 31 +++++++++++++++++++++++++------
 arch/loongarch/kvm/vm.c              |  4 ++--
 arch/loongarch/net/bpf_jit.c         | 11 +++++++++++
 6 files changed, 58 insertions(+), 10 deletions(-)

