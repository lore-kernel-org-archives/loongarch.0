Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B628367F2A
	for <loongarch@lists.linux.dev>; Wed, 13 May 2026 01:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778635745; cv=none; b=pmUc40TydjzRQEynAH0VO8LN0m7LROSrLs6k6nEPTf2T6DoNWhdFvCiSPZ7ArnPw9KzvHo2wdS1cWmaUClF4UBvPonGFMG1ix/Kat2q4DuRUQpLNFrDd91fnskpPUQIp5hQzTzHdJ+M7bjjFDDy5lQRRYw6Qqz4HS7bVRxvwFU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778635745; c=relaxed/simple;
	bh=wcuf5XCjO52k7218qnhjeM7SODIQTgO5jRaAv1Qv+zc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NaOwonFYJW2FBO5EmzkG9fp4hqoCtE5guFlgQDUWFA0mNmNw1tg71n4OdwfjInu7eVugBB3ZaAxSi1PbpK5CTPLyTgynhCbCMBQlZvAdYEjdnTTa1UZScz41hy1acq0zqdCDuY8f40JA1Itg6+I0ODky4XiRHHdpZl12Vtt7OEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.40.57.136])
	by gateway (Coremail) with SMTP id _____8CxCHnY0wNq9FcJAA--.3940S3;
	Wed, 13 May 2026 09:28:56 +0800 (CST)
Received: from localhost.cn (unknown [10.40.57.136])
	by front1 (Coremail) with SMTP id qMiowJCxOMHJ0wNqr7eAAA--.34539S2;
	Wed, 13 May 2026 09:28:41 +0800 (CST)
From: Tianyang Zhang <zhangtianyang@loongson.cn>
To: chenhuacai@kernel.org,
	kernel@xen0n.name,
	corbet@lwn.net,
	alexs@kernel.org,
	si.yanteng@linux.dev,
	tglx@linutronix.de,
	jiaxun.yang@flygoat.com,
	maobibo@loongson.cn
Cc: loongarch@lists.linux.dev,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Tianyang Zhang <zhangtianyang@loongson.cn>
Subject: [PATCH v12 0/4] Loongarch irq-redirect support
Date: Wed, 13 May 2026 09:28:31 +0800
Message-ID: <20260513012839.2856463-1-zhangtianyang@loongson.cn>
X-Mailer: git-send-email 2.41.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJCxOMHJ0wNqr7eAAA--.34539S2
X-CM-SenderInfo: x2kd0wxwld05hdqjqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW3Gr4xZryrZw1kWr17AF13Awc_yoW7urWUpF
	WUCas8trs5CrW7G3Z7ua18ZFy3ury8GrW7Xa1Skw12k3s8ur1v9FyxKFy5XFy8Grs5K3Wj
	qr4qq34Uu3WDAagCm3ZEXasCq-sJn29KB7ZKAUJUUUU7529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUB0b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Gr0_Gr1UM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYI
	kI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUAVWU
	twAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI4
	8JMxkF7I0En4kS14v26r126r1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j
	6r4UMxCIbckI1I0E14v26r1Y6r17MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwV
	AFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv2
	0xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4
	v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AK
	xVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxUcpBTUUUUU

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

	v9->v10
	1 Rewrite the changelog in the order of background, problem and solution.
	2 Fix the potential undefined issue with 'order' in the redirect_table_alloc.
	3 Use GPL-2.0-only as SPDX-License-Identifier.
	4 Update the code creation time.
	5 Rearrange the order of the header files alphabetically.
	6 Refactor portions of the code and remove unnecessary line breaks.
	7 Rename __redirect_irde_fini() to redirect_free_irde() and label it with __init.

	v10->v11
	1 Adjust the name of patch 0002.
	2 Simplify some code.
	3 Fix the incorrect data type.

	v11->v12
	1 Adjust the description of the interrupt model in the documentation
	  to better reflect the actual situation.
	2 Modified some inappropriate commit messages.  
	3 Adjusted part of the code to better conform to specifications. 

Tianyang Zhang (4):
  Docs/LoongArch: Add advanced extended IRQ model (redirection)
    description
  irqchip/loongarch-avec: Prepare for interrupt redirection support
  irqchip/loongarch-avec: Return IRQ_SET_MASK_OK_DONE when keep affinity
  irqchip/loongarch-ir: Add IR (interrupt redirection) irqchip support

 .../arch/loongarch/irq-chip-model.rst         |  35 ++
 .../zh_CN/arch/loongarch/irq-chip-model.rst   |  34 ++
 drivers/irqchip/Makefile                      |   2 +-
 drivers/irqchip/irq-loongarch-avec.c          |  20 +-
 drivers/irqchip/irq-loongarch-ir.c            | 537 ++++++++++++++++++
 drivers/irqchip/irq-loongson.h                |  15 +
 6 files changed, 629 insertions(+), 14 deletions(-)
 create mode 100644 drivers/irqchip/irq-loongarch-ir.c

-- 
2.20.1

