Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C443257B
	for <loongarch@lists.linux.dev>; Sat, 22 Oct 2022 08:00:00 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.32])
	by gateway (Coremail) with SMTP id _____8Bxfdr7olNjJZ0BAA--.7206S3;
	Sat, 22 Oct 2022 15:59:55 +0800 (CST)
Received: from loongson-pc.loongson.cn (unknown [10.20.42.32])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Dx_1f7olNjLlUDAA--.13337S2;
	Sat, 22 Oct 2022 15:59:55 +0800 (CST)
From: Jianmin Lv <lvjianmin@loongson.cn>
To: Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Len Brown <lenb@kernel.org>,
	rafael@kernel.org,
	linux-pci@vger.kernel.org,
	linux-acpi@vger.kernel.org
Subject: [PATCH V5 0/4] irqchip: Support to set irq type for ACPI path
Date: Sat, 22 Oct 2022 15:59:51 +0800
Message-Id: <20221022075955.11726-1-lvjianmin@loongson.cn>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8Dx_1f7olNjLlUDAA--.13337S2
X-CM-SenderInfo: 5oymxthqpl0qxorr0wxvrqhubq/
X-Coremail-Antispam: 1Uk129KBjvJXoWrKFWUur13CryDAFy3XrWfAFb_yoW8JryUpa
	yxCa98tF9xKry2kas3Cr15X343ta1ftrZrKayfK3W29rZ8Wr1v9F18AFWDZas8Cw13GryI
	9r1FgF1UWa15CFJanT9S1TB71UUUUUJqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
	qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
	bSxYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
	1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
	wVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwA2z4
	x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJVWxJr1l
	n4kS14v26r1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6x
	ACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E
	87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lc7CjxV
	Aaw2AFwI0_JF0_Jw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxY
	O2xFxVAFwI0_Jrv_JF1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGV
	WUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_
	Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rV
	WUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4U
	JbIYCTnIWIevJa73UjIFyTuYvjxUxUGYDUUUU

For ACPI path of pch-pic and liointc driver, setting irq
type is not supported yet, so the patch series add code
to implement it.

And a bug in translate callback of irqchip/loongson-pch-pic, which
is introduced by previous patch, is fixed.

GSI for legacy irqs of PCI devices are mapped in pch-pic domain, after
supporting setting_irq_type for pch-pic domain, we add the workaround
for LoongArch based PCI controller with high-level trigger intterrupt
so that the high-level trigger type is passed into acpi_register_gsi().
  
V1 -> V2
- Change comment information and fix a bug for DT path in patch[1].

V2 -> V3
- Separate original patch[1] to three patches[1][2][3].

V3 -> V4
- Improve commit log

V4 -> V5
- Improve commit log for patch[1]

Jianmin Lv (4):
  ACPI / PCI: fix LPIC IRQ model default PCI IRQ polarity
  irqchip/loongson-pch-pic: fix translate callback for DT path
  irqchip/loongson-pch-pic: Support to set IRQ type for ACPI path
  irqchip/loongson-liointc: Support to set IRQ type for ACPI path

 drivers/acpi/pci_irq.c                 |  6 ++++--
 drivers/irqchip/irq-loongson-liointc.c |  7 ++++++-
 drivers/irqchip/irq-loongson-pch-pic.c | 14 ++++++++++----
 3 files changed, 20 insertions(+), 7 deletions(-)

-- 
2.31.1

