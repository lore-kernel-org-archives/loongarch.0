Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CE4D10A1B
	for <loongarch@lists.linux.dev>; Fri, 10 Nov 2023 09:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from loongson.cn (unknown [10.2.5.213])
	by gateway (Coremail) with SMTP id _____8AxEvDq8k1lSbI4AA--.45477S3;
	Fri, 10 Nov 2023 17:07:54 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.213])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8DxkN3q8k1l6vU9AA--.7142S2;
	Fri, 10 Nov 2023 17:07:54 +0800 (CST)
From: Bibo Mao <maobibo@loongson.cn>
To: Tianrui Zhao <zhaotianrui@loongson.cn>,
	Huacai Chen <chenhuacai@kernel.org>
Cc: WANG Xuerui <kernel@xen0n.name>,
	kvm@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/3] LoongArch: KVM: Remove SW timer switch when vcpu is halt polling
Date: Fri, 10 Nov 2023 17:05:26 +0800
Message-Id: <20231110090529.56950-1-maobibo@loongson.cn>
X-Mailer: git-send-email 2.39.3
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8DxkN3q8k1l6vU9AA--.7142S2
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBj93XoW7AF4rZryDJry3Gw48Kw4xKrX_yoW8Jw47pF
	ZxCFnxXr40krWYg3W7ta1DWFn7WrW8KFy7JrnIkF1rCr17Aw1FqFW8Kr95XFy3Ja93AryI
	vryrt3W5ua4UA3cCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkFb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv
	67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2
	Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s02
	6x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0x
	vE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE
	42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6x
	kF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07j8yCJUUUUU=

This patches removes SW timer switch during vcpu block stage. VM uses HW
timer rather than SW PV timer on LoongArch system, it can check pending
HW timer interrupt status directly, rather than switch to SW timer and
check injected SW timer interrupt.

When SW timer is not used in vcpu halt-polling mode, the relative
SW timer handling before entering guest can be removed also. Timer
emulation is simpler than before, SW timer emuation is only used in vcpu
thread context switch.

---

Changes in v3:
  Add kvm_arch_vcpu_runnable checking before kvm_vcpu_halt.

Changes in v2:
  Add halt polling support for idle instruction emulation, using api
kvm_vcpu_halt rather than kvm_vcpu_block in function kvm_emu_idle.

---

Bibo Mao (3):
  LoongArch: KVM: Remove SW timer switch when vcpu is halt polling
  LoongArch: KVM: Allow to access HW timer CSR registers always
  LoongArch: KVM: Remove kvm_acquire_timer before entering guest

 arch/loongarch/include/asm/kvm_vcpu.h |  1 -
 arch/loongarch/kvm/exit.c             | 13 ++------
 arch/loongarch/kvm/main.c             |  1 -
 arch/loongarch/kvm/timer.c            | 47 +++++++--------------------
 arch/loongarch/kvm/vcpu.c             | 38 +++++-----------------
 5 files changed, 22 insertions(+), 78 deletions(-)


base-commit: 305230142ae0637213bf6e04f6d9f10bbcb74af8
-- 
2.39.3

