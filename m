Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C6BE1FD3
	for <loongarch@lists.linux.dev>; Wed, 14 Jun 2023 11:59:38 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.116])
	by gateway (Coremail) with SMTP id _____8AxHuupq4lkpR0FAA--.10839S3;
	Wed, 14 Jun 2023 19:59:37 +0800 (CST)
Received: from loongson-pc.loongson.cn (unknown [10.20.42.116])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8BxNeSoq4lkzJMaAA--.10424S2;
	Wed, 14 Jun 2023 19:59:36 +0800 (CST)
From: Jianmin Lv <lvjianmin@loongson.cn>
To: Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	WANG Xuerui <kernel@xen0n.name>,
	loongson-kernel@lists.loongnix.cn
Subject: [PATCH V3 0/5] irqchip/loongson: Fix some loongson irqchip drivers
Date: Wed, 14 Jun 2023 19:59:31 +0800
Message-Id: <20230614115936.5950-1-lvjianmin@loongson.cn>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8BxNeSoq4lkzJMaAA--.10424S2
X-CM-SenderInfo: 5oymxthqpl0qxorr0wxvrqhubq/
X-Coremail-Antispam: 1Uk129KBj9xXoWrZF13JFWDXFyDJF1kZF17CFX_yoWfZFb_uF
	WI93yDCrn2gF1xXay2yr40vF9I9FWUW3Wq9FyjqF1rX3yqv3W3Cr47CwnxG3Z7JF48tFn8
	Xrs5GryfCryIyosvyTuYvTs0mTUanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUb7xYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_JrI_Jryl8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4
	xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v2
	6r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x0EwI
	xGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480
	Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7
	IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k2
	6cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxV
	AFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07j5WrAUUUUU=

The patch series provide some fixes for loongson-liointc and loongson-pch-pic driver.

V1->V2:
1. Adjust commit log for all patchs
2. Add some explanation for Loongson-3's polarity register

V2->V3:
1. Add a new patch[5] to fix irq affinity setting during resume for loongson-eiointc

Jianmin Lv (3):
  irqchip/loongson-pch-pic: Fix initialization of HT vector register
  irqchip/loongson-liointc: Fix IRQ trigger polarity
  irqchip/loongson-eiointc: Fix irq affinity setting during resume

Liu Peibao (1):
  irqchip/loongson-pch-pic: Fix potential incorrect hwirq assignment

Yinbo Zhu (1):
  irqchip/loongson-liointc: Add IRQCHIP_SKIP_SET_WAKE flag

 drivers/irqchip/irq-loongson-eiointc.c |  2 +-
 drivers/irqchip/irq-loongson-liointc.c | 13 +++++++++----
 drivers/irqchip/irq-loongson-pch-pic.c | 10 ++++------
 3 files changed, 14 insertions(+), 11 deletions(-)

-- 
2.31.1

