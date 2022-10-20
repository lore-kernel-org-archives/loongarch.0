Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8C0A23BF
	for <loongarch@lists.linux.dev>; Thu, 20 Oct 2022 07:37:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2B74C433C1;
	Thu, 20 Oct 2022 07:37:08 +0000 (UTC)
From: Huacai Chen <chenhuacai@loongson.cn>
To: Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Xuefeng Li <lixuefeng@loongson.cn>,
	Huacai Chen <chenhuacai@gmail.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Huacai Chen <chenhuacai@loongson.cn>
Subject: [PATCH V2 0/4] irqchip/loongson: Add suspend/resume support for irqchip drivers
Date: Thu, 20 Oct 2022 15:35:23 +0800
Message-Id: <20221020073527.541845-1-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.31.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series add suspend/resume support for Loongson-related irqchip
drivers (i.e., HTVECINTC, EIOINTC, PCH-PIC and PCH_LPC), which is needed
for LoongArch's upcoming suspend/hibernation support.

Note: this series is applicable after "irqchip/loongson-htvec: Add ACPI
init support".

V1 -> V2:
Holding irq_desc->lock while eiointc_set_irq_affinity().

Huacai Chen (4):
 irqchip/loongson-htvec: Add suspend/resume support.
 irqchip/loongson-eiointc: Add suspend/resume support.
 irqchip/loongson-pch-pic: Add suspend/resume support.
 irqchip/loongson-pch-lpc: Add suspend/resume support.

Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
---
 drivers/irqchip/irq-loongson-eiointc.c | 31 ++++++++++++++++++++++
 drivers/irqchip/irq-loongson-htvec.c   | 27 +++++++++++++++++++
 drivers/irqchip/irq-loongson-pch-lpc.c | 25 ++++++++++++++++++
 drivers/irqchip/irq-loongson-pch-pic.c | 47 ++++++++++++++++++++++++++++++++++
 4 files changed, 130 insertions(+)
--
2.27.0

