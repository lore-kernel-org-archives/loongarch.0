Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B0A47E0E8
	for <loongarch@lists.linux.dev>; Fri, 30 Jan 2026 02:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769741774; cv=none; b=fGDQDH7HZQfJE5Mt+arSr9XcY9tQVnAa+LJ/Je4YQE5vZd6ygoYzYUirZed8T2mOXoBznusAr2IGU908XuHPVZCCq8YcOIZMMWOrfAU5gIHjPBLANsWEw/tNLc2U5cb5m4tmQLeO21OiVHGJl4gzp74tM5ijoHToXQiww4A9ges=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769741774; c=relaxed/simple;
	bh=1CoTAwVnAdJzTCMVTY8D3AXdGTsE+x1yRXkX5wJQ4/w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cH9Wpca/VtCphNT1UdWqHRMaMgaeDjpcE48pQGo5hRbZKoCcosrXSAkbtUUlGydCjdxKxApMpyQKEUxTm5nwiLElcSjzM8sdzEW5NPawecej6zirDgDpcVvHSE7DLokasDDsrx0Gn5F9xjuPEm5a/jIktTJ+lamHL96L87b4X8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.40.57.136])
	by gateway (Coremail) with SMTP id _____8BxXcPBHXxpZyQOAA--.46542S3;
	Fri, 30 Jan 2026 10:56:01 +0800 (CST)
Received: from localhost.localdomain (unknown [10.40.57.136])
	by front1 (Coremail) with SMTP id qMiowJCxHOGzHXxpRvM5AA--.45456S2;
	Fri, 30 Jan 2026 10:55:47 +0800 (CST)
From: Tianyang Zhang <zhangtianyang@loongson.cn>
To: chenhuacai@kernel.org,
	kernel@xen0n.name,
	corbet@lwn.net,
	alexs@kernel.org,
	si.yanteng@linux.dev,
	tglx@linutronix.de,
	jiaxun.yang@flygoat.com,
	peterz@infradead.org,
	wangliupu@loongson.cn,
	lvjianmin@loongson.cn,
	maobibo@loongson.cn,
	siyanteng@cqsoftware.com.cn,
	gaosong@loongson.cn,
	yangtiezhu@loongson.cn
Cc: loongarch@lists.linux.dev,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Tianyang Zhang <zhangtianyang@loongson.cn>
Subject: [PATCH v9 0/4] Loongarch irq-redirect support
Date: Fri, 30 Jan 2026 10:55:39 +0800
Message-ID: <20260130025545.2140543-1-zhangtianyang@loongson.cn>
X-Mailer: git-send-email 2.41.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJCxHOGzHXxpRvM5AA--.45456S2
X-CM-SenderInfo: x2kd0wxwld05hdqjqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoWxGF4UKr1DZry5Cr1UJF1rXwc_yoW7JFyfpF
	W7uas8trsYkrWxG3Z7ua18uFy3uryfGrW3Xa1fCw1a93s8ur1q9F1xKF98XFy8Grs5K3W2
	qr4qq3yUua4DAagCm3ZEXasCq-sJn29KB7ZKAUJUUUU3529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUmjb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r126r13M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2kKe7AKxVWUAVWUtwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07
	AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWU
	tVWrXwAv7VC2z280aVAFwI0_Gr1j6F4UJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2
	Ij64vIr41lF7xvrVCFI7AF6II2Y40_Zr0_Gr1UMxkF7I0En4kS14v26r126r1DMxAIw28I
	cxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMxCIbckI1I0E14v26r126r1DMI8I3I
	0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVW8
	ZVWrXwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26ryj6F1UMIIF0xvE2Ix0cI8IcV
	CY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAF
	wI0_Gr1j6F4UJwCI42IY6I8E87Iv6xkF7I0E14v26r4UJVWxJrUvcSsGvfC2KfnxnUUI43
	ZEXa7IU50JmUUUUUU==

This series of patches introduces support for interrupt-redirect
controllers, and this hardware feature will be supported on 3C6000
for the first time

change log:
        v0->v1:
        1.Rename the model names in the document.
        2.Adjust the code format.
        3.Remove architecture - specific prefixes.
        4.Refactor the initialization logic, and IR driver no longer set 
	  AVEC_ENABLE.
        5.Enhance compatibility under certain configurations.

        v1->v2:
        1.Fixed an erroneous enabling issue.

        v2->v3
        1.Replace smp_call with address mapping to access registers
        2.Fix some code style issues

        v3->v4
        1.Provide reasonable comments on the modifications made to
	  IRQ_SET_MASK_OK_DONE
        2.Replace meaningless empty functions with parent_mask/unmask/ack
        3.Added and indeed released resources
        4.Added judgment for data structure initialization completion to 
          avoid duplicate creation during cpuhotplug
        5.Fixed the code style and some unnecessary troubles

        v4->v5
	1.when it is detected in avecintc_set_affinity that the current affinity
	remains valid, the return value is modified to IRQ_SET_MASK_OK_DONE.
	  After the introduction of redirect-domain, for each interrupt source, 
	avecintc-domain only provides the CPU/interrupt vector, while redirect-domain 
	provides other operations to synchronize interrupt affinity information 
	among multiple cores. 	  The original intention is to notify the cascaded
	redirect_set_affinity that multi-core synchronization is not required. 
	  However, this introduces some compatibility issues, such as the new return
	value causing msi_domain_set_affinity to no longer perform irq_chip_write_msi_msg.
	  1) When redirect exist in the system, the msi msg_address and msg_data no 
	longer changes after the allocation phase, so it does not actually require updating
	the MSI message info.
	  2) When only avecintc exists in the system, the irq_domain_activate_irq
	interface will be responsible for the initial configuration of the MSI message,
	which is unconditional. After that, if unnecessary, no modification to the MSI
	message is alse correctly.

	2.Restructured the macro definitions to make them appear more logical.

	3.Adjusted the layout of members struct redirect_queue\struct redirect_table and 
	struct redirect_item, making redirect_item the primary interface for accessing
	other members.

	4.The method of accessing registers has been standardized to MMIO.

	5.Initialize variables at declaration whenever possible.

	6.Replaced the the "struct page" in redirect_table and redirect_queue with "struct folio".

	7.Adjusted the initialization process so that all irq_desc configurations are completed
	during driver initialization, no longer relying on specific CPUs being online.

	8.Refactored portions of the code to make them more concise and logical.

	v5->v6
	Fix the warning messages reported by the test bot.

	v6->v7:
	1 Split patch:
 	 1) Docs/LoongArch: Add Advanced Extended-Redirect IRQ model description
	 2) LoongArch: Architectural preparation for Redirect irqchip
	 3) irqchip/irq-loongson.h:irq-loongson.h preparation for Redirect irqchip
	 4) irqchip/loongarch-avec.c:return IRQ_SET_MASK_OK_DONE when keep affinity
	 5) irqchip/irq-loongarch-ir:Add Redirect irqchip support

	2 Use sizeof() to replace fixed-size macro definitions.

	3 Unify the data types of the parameters for redirect_write/read_reg*.

	4 rename irde_invalid_entry_node to irde_invalid_entry and add comments 
	  explaining the 'raddr'.

	5 Fix the critical condition check bug in redirect_table_alloc.

	6 Use clear_bit to replace bitmap_release_region

	7 Delete some goto and handle the failure when it occurs.

	8 Removed the check for the `CONFIG_ACPI` macro, as CONFIG_ACPI 
          is selected by the arch/loongarch/Kconfig.

	9 Fixed the incorrect error flow in redirect_acpi_init.

	v7->v8:
	1 Apologies for the chaotic email delivery due to some network issues earlier.

	2 redirect_table_alloc now allocates nr_irqs consecutive redirect table entries to 
	  support multiple MSI devices.

	v8->v9:
	1 Rebased and reorganized the patches on the latest irq/core branch.

Tianyang Zhang (4):
  Docs/LoongArch: Add Advanced Extended-Redirect IRQ model description
  irqchip/irq-loongson.h:irq-loongson.h preparation for Redirect irqchip
  irqchip/loongarch-avec.c:return IRQ_SET_MASK_OK_DONE when keep
    affinity
  irqchip/irq-loongarch-ir:Add Redirect irqchip support

 .../arch/loongarch/irq-chip-model.rst         |  38 ++
 .../zh_CN/arch/loongarch/irq-chip-model.rst   |  37 ++
 drivers/irqchip/Makefile                      |   2 +-
 drivers/irqchip/irq-loongarch-avec.c          |  20 +-
 drivers/irqchip/irq-loongarch-ir.c            | 534 ++++++++++++++++++
 drivers/irqchip/irq-loongson.h                |  19 +
 6 files changed, 636 insertions(+), 14 deletions(-)
 create mode 100644 drivers/irqchip/irq-loongarch-ir.c

-- 
2.41.0

