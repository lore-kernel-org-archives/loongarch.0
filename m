Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 681FD186E5D
	for <loongarch@lists.linux.dev>; Fri, 23 Aug 2024 10:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724409225; cv=none; b=N8oJYGJxnyQDTs76KqK6I1O31jK0+lxnrD8/7hxvwR4KlRpyJ7tkq/hhm6t+QQ//1e4qp6F+j8bV1Pbcr9m6e0k2bJIG8wtkPEaE0BnPOQjgik5o3+sOZ+8smL1bdpv4L4b3ilJHUfCgv6pgbQefpO7NpCv82F/sJloRnH16h3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724409225; c=relaxed/simple;
	bh=xqkYFoIeKHjvyXYSScBmkIwYsS+h8/BO5Dlwp5j/f4c=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=WeleN7dOrbmF7ZzpEXZ/hYOqz0DLkkDVOVT7UiHJpnKdUqVNVg9kbSZUXVxdkGpROfFzYpzvzQDQ0t5iAcE3+tSLI0xN7QjltMqrV3qPnUe3SuwvOzt7lxyGlQW1l8re6/Zq5NjGA0v1ImXQz0KSn0rkMbZbXWLf4WYRUfmB7Ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.2.10.34])
	by gateway (Coremail) with SMTP id _____8AxGuqEZchmoFMdAA--.62099S3;
	Fri, 23 Aug 2024 18:33:40 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.10.34])
	by front1 (Coremail) with SMTP id qMiowMAxVOCDZchmmDYfAA--.5401S2;
	Fri, 23 Aug 2024 18:33:39 +0800 (CST)
From: Tianyang Zhang <zhangtianyang@loongson.cn>
To: corbet@lwn.net,
	alexs@kernel.org,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	tglx@linutronix.de,
	jiaxun.yang@flygoat.com,
	gaoliang@loongson.cn,
	wangliupu@loongson.cn,
	lvjianmin@loongson.cn,
	zhangtianyang@loongson.cn,
	yijun@loongson.cn,
	mhocko@suse.com,
	akpm@linux-foundation.org,
	dianders@chromium.org,
	maobibo@loongson.cn,
	xry111@xry111.site,
	zhaotianrui@loongson.cn,
	nathan@kernel.org,
	yangtiezhu@loongson.cn,
	zhoubinbin@loongson.cn
Cc: loongarch@lists.linux.dev,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v11 0/7] Loongarch-avec support
Date: Fri, 23 Aug 2024 18:33:29 +0800
Message-Id: <20240823103337.23602-1-zhangtianyang@loongson.cn>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMAxVOCDZchmmDYfAA--.5401S2
X-CM-SenderInfo: x2kd0wxwld05hdqjqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoWxGF1DZrW3Gw4DXrWxJFyxWFX_yoWrtr4kpF
	W7Cryqvr48CryxCrnak34rury5Xr4xK3y2qay3K347uryDJ34DWr10yF1DZF18Jw4rGa4I
	gF1rW3yUWa1UAacCm3ZEXasCq-sJn29KB7ZKAUJUUUU7529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUB2b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07
	AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWU
	AVWUtwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7V
	AKI48JMxkF7I0En4kS14v26r126r1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY
	6r1j6r4UMxCIbckI1I0E14v26r1Y6r17MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7
	xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY6xII
	jxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw2
	0EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x02
	67AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxUcpBTUUUUU

This series of patches introduces support for advanced extended 
interrupt controllers (AVECINTC), and this hardware feature will 
be supported on 3C6000 for the first time

Changes log:
 V0->V1:
         1.Modified some formats and declarations
         2.Removed kmalloc/kfree when adding affinity related data to pending_list,
           and used moving tag to replace the original behavior
         3.Adjusted the process that enables AVEC interrupts, now it is at the end of all processes
         4.Removed CPUHP related callbacks, now irq_matrix_online/irq_matrix_offline is completed in start_secondary/loongson_cpu_disable
         5.Adjusted compatibility issues for CONFIG_ACPI
         6.About question:
         > irr = csr_read64(LOONGARCH_CSR_IRR0 + vector / 64);
         > should be good enough, no?
         csr_read64 was built-in as __csrrd_d, it doesn't seem to support variables as parameters
         >>>>
         drivers/irqchip/irq-loongarch-avec.c: In function ‘complete_irq_moving’:
         ./arch/loongarch/include/asm/loongarch.h:164:25: error: invalid argument to built-in function
           164 | #define csr_read64(reg) __csrrd_d(reg)
               |                         ^~~~~~~~~
         drivers/irqchip/irq-loongarch-avec.c:170:23: note: in expansion of macro ‘csr_read64’
           170 |                 irr = csr_read64(LOONGARCH_CSR_IRR_BASE + vector / VECTORS_PER_REG);
               |                       ^~~~~~~~~~
         >>>>
         So we have temporarily retained the previous implementation.
 
 V1->V2:
         Fixed up coding style. Made on/offline functions void
         Added compatibility when CONFIG_SMP is turned off
 
 V2->V3:
 	Squash two patches into one
 
 V3->V4:
 	Update NR_IRQS
 	Update Register's name
 	Fixed up coding style
 V4->V5:
	Retain feature CPUCFG1_MSGINT	
 	Fixed up coding style
	Delete the test code introduced by V4, and now msi msg address still uses the 32-bit address
 V5->V6:
	Fix definition of NR_IRQS
	Define arch_probe_nr_irqs()
	Handle all avecintc interrupts in one dispatch
	Use cpuhotplug callbacks instead of direct call to avec_online_cpu()/avec_offline_cpu()
	Rename {SMP,ACTION}_CLEAR_VECT to {SMP,ACTION}_CLEAR_VECTOR
	Use avecintc_ prefix instead of loongarch_avec_ to keep consistancy
 V6->V7:
	Fixed compatibility issue with cpuhp_setup_state_nocalls when CONFIG_SMP is turned off
	Rename avecintc_online/offline_cpu as avecintc_cpu_online/offline
	Use pch_msi_handle[0] as default value of get_pch_msi_handle
	Rework commit-message
 V7->V8:
	Fixed up coding style
	Support per-device-MSI domain
	Replaced spin_lock ops with guard/scope_guard
	Always execute irq_metrix_offline while the CPU is offline
 V8->V9:
	Fixed up coding style and potential bugs 
 V9->V10:
	Add a cover of series patch
 V10->V11:
	Separate the original patch into 7 small patches
	Correcting memory operations in critical areas
	Fixed up other coding style problem

Huacai Chen (5):
  Docs/LoongArch: Add advanced extended IRQ model description
  LoongArch: Define ARCH_IRQ_INIT_FLAGS as IRQ_NOPROBE
  LoongArch: Move irqchip function prototypes to irq-loongson.h
  LoongArch: Architectural preparation for AVEC irqchip
  irqchip/loongson-eiointc: Rename CPUHP_AP_IRQ_LOONGARCH_STARTING

Tianyang Zhang (2):
  irqchip/loongson-pch-msi: Prepare get_pch_msi_handle() for AVECINTC
  irqchip/loongarch-avec: Add AVEC irqchip support

 .../arch/loongarch/irq-chip-model.rst         |  32 ++
 .../zh_CN/arch/loongarch/irq-chip-model.rst   |  32 ++
 arch/loongarch/Kconfig                        |   1 +
 arch/loongarch/include/asm/cpu-features.h     |   1 +
 arch/loongarch/include/asm/cpu.h              |   2 +
 arch/loongarch/include/asm/hardirq.h          |   3 +-
 arch/loongarch/include/asm/hw_irq.h           |   2 +
 arch/loongarch/include/asm/irq.h              |  31 +-
 arch/loongarch/include/asm/loongarch.h        |  18 +-
 arch/loongarch/include/asm/smp.h              |   2 +
 arch/loongarch/kernel/cpu-probe.c             |   3 +-
 arch/loongarch/kernel/irq.c                   |  15 +-
 arch/loongarch/kernel/paravirt.c              |   5 +
 arch/loongarch/kernel/smp.c                   |   6 +
 drivers/irqchip/Makefile                      |   2 +-
 drivers/irqchip/irq-loongarch-avec.c          | 425 ++++++++++++++++++
 drivers/irqchip/irq-loongarch-cpu.c           |   7 +-
 drivers/irqchip/irq-loongson-eiointc.c        |   9 +-
 drivers/irqchip/irq-loongson-htvec.c          |   2 +
 drivers/irqchip/irq-loongson-liointc.c        |   2 +
 drivers/irqchip/irq-loongson-pch-lpc.c        |   2 +
 drivers/irqchip/irq-loongson-pch-msi.c        |  25 +-
 drivers/irqchip/irq-loongson-pch-pic.c        |   2 +
 drivers/irqchip/irq-loongson.h                |  27 ++
 include/linux/cpuhotplug.h                    |   3 +-
 25 files changed, 624 insertions(+), 35 deletions(-)
 create mode 100644 drivers/irqchip/irq-loongarch-avec.c
 create mode 100644 drivers/irqchip/irq-loongson.h

-- 
2.20.1

