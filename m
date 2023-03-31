Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FED12569
	for <loongarch@lists.linux.dev>; Fri, 31 Mar 2023 11:39:02 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.153])
	by gateway (Coremail) with SMTP id _____8BxMMxUxiZkJO0UAA--.32256S3;
	Fri, 31 Mar 2023 19:39:00 +0800 (CST)
Received: from loongson-pc.loongson.cn (unknown [10.20.42.153])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Bx57xUxiZkmwASAA--.12675S2;
	Fri, 31 Mar 2023 19:39:00 +0800 (CST)
From: Jianmin Lv <lvjianmin@loongson.cn>
To: Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	loongson-kernel@lists.loongnix.cn,
	stable@vger.kernel.org
Subject: [PATCH V2 0/5] Fix some issues of irq controllers for dual-bridges scenario 
Date: Fri, 31 Mar 2023 19:38:55 +0800
Message-Id: <20230331113900.9105-1-lvjianmin@loongson.cn>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8Bx57xUxiZkmwASAA--.12675S2
X-CM-SenderInfo: 5oymxthqpl0qxorr0wxvrqhubq/
X-Coremail-Antispam: 1Uk129KBjvdXoW7Jw1xWFyxXw1kury7AFW7twb_yoW3CwbE9F
	y0vrWkGr48WF1xZa9rZry5Ar9xJFWUW3Z09FyUKFy3X340yw15Jr12ywsxG3WxK3WrXFn5
	urs5Gr1xCr12yjkaLaAFLSUrUUUUbb8apTn2vfkv8UJUUUU8wcxFpf9Il3svdxBIdaVrn0
	xqx4xG64xvF2IEw4CE5I8CrVC2j2Jv73VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUY
	b7kC6x804xWl14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3w
	AFIxvE14AKwVWUAVWUZwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK
	6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r1j6r4UM28EF7
	xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr1j6rxdM2AI
	xVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I8CrVACY4xI64
	kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r126r1DMcIj6I8E87Iv67AKxVWUJVW8JwAm
	72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2Ij64vIr41l4I8I3I
	0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWU
	GVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI
	0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0
	rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r
	4UYxBIdaVFxhVjvjDU0xZFpf9x07jjpB-UUUUU=

In dual-bridges scenario, some bugs were found for irq
controllers drivers, so the patch serie is used to fix them.

V1->V2:
1. Remove all of ChangeID in patches
2. Exchange the sequence of some patches
3. Adjust code style of if...else... in patch[2]

Jianmin Lv (5):
  irqchip/loongson-eiointc: Fix returned value on parsing MADT
  irqchip/loongson-eiointc: Fix incorrect use of acpi_get_vec_parent
  irqchip/loongson-eiointc: Fix registration of syscore_ops
  irqchip/loongson-pch-pic: Fix registration of syscore_ops
  irqchip/loongson-pch-pic: Fix pch_pic_acpi_init calling

 drivers/irqchip/irq-loongson-eiointc.c | 32 ++++++++++++++++++--------
 drivers/irqchip/irq-loongson-pch-pic.c |  6 ++++-
 2 files changed, 27 insertions(+), 11 deletions(-)

-- 
2.31.1

