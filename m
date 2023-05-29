Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 283927C
	for <loongarch@lists.linux.dev>; Mon, 29 May 2023 01:19:20 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.176])
	by gateway (Coremail) with SMTP id _____8DxuPFi+3NknRQCAA--.4948S3;
	Mon, 29 May 2023 09:09:54 +0800 (CST)
Received: from loongson-pc.loongson.cn (unknown [10.20.42.176])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8CxorRi+3NkrCd+AA--.9782S2;
	Mon, 29 May 2023 09:09:54 +0800 (CST)
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
Subject: [PATCH V2 0/4] irqchip/loongson: Fix some loongson irqchip drivers
Date: Mon, 29 May 2023 09:09:50 +0800
Message-Id: <20230529010954.2678-1-lvjianmin@loongson.cn>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8CxorRi+3NkrCd+AA--.9782S2
X-CM-SenderInfo: 5oymxthqpl0qxorr0wxvrqhubq/
X-Coremail-Antispam: 1Uk129KBjvdXoWrtF4rJFWrWw4rJr48Gr4xCrg_yoWxuFX_CF
	WI93ykArn2gF1xXay7tr40yF9I9FW8W3ZF9FyqqF1ru3yvgw4ayr4akwsxG3W7XF48JF1r
	Xws5uryxCryIyjkaLaAFLSUrUUUU1b8apTn2vfkv8UJUUUU8wcxFpf9Il3svdxBIdaVrn0
	xqx4xG64xvF2IEw4CE5I8CrVC2j2Jv73VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUY
	y7kC6x804xWl14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3w
	AFIxvE14AKwVWUXVWUAwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK
	6xIIjxv20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwA2z4
	x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJVWxJr1l
	n4kS14v26r1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6x
	ACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E
	87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82
	IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_Jrv_JF1lx2Iq
	xVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r
	1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY
	6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67
	AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x
	07jepB-UUUUU=

The patch series provide some fixes for loongson-liointc and loongson-pch-pic driver.

V1->V2:
1. Adjust commit log for all patchs
2. Add some explanation for Loongson-3's polarity register

Jianmin Lv (2):
  irqchip/loongson-pch-pic: Fix initialization of HT vector register
  irqchip/loongson-liointc: Fix IRQ trigger polarity

Liu Peibao (1):
  irqchip/loongson-pch-pic: Fix potential incorrect hwirq assignment

Yinbo Zhu (1):
  irqchip/loongson-liointc: Add IRQCHIP_SKIP_SET_WAKE flag

 drivers/irqchip/irq-loongson-liointc.c | 13 +++++++++----
 drivers/irqchip/irq-loongson-pch-pic.c | 10 ++++------
 2 files changed, 13 insertions(+), 10 deletions(-)

-- 
2.31.1

