Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CBA8A2C
	for <loongarch@lists.linux.dev>; Fri,  7 Apr 2023 08:34:56 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.153])
	by gateway (Coremail) with SMTP id _____8AxJMSu1S9kiMcXAA--.25533S3;
	Fri, 07 Apr 2023 16:34:54 +0800 (CST)
Received: from loongson-pc.loongson.cn (unknown [10.20.42.153])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8AxGL2t1S9kKRwYAA--.21995S2;
	Fri, 07 Apr 2023 16:34:53 +0800 (CST)
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
Subject: [PATCH V3 0/5] Fix some issues of irq controllers for dual-bridges scenario 
Date: Fri,  7 Apr 2023 16:34:48 +0800
Message-Id: <20230407083453.6305-1-lvjianmin@loongson.cn>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8AxGL2t1S9kKRwYAA--.21995S2
X-CM-SenderInfo: 5oymxthqpl0qxorr0wxvrqhubq/
X-Coremail-Antispam: 1Uk129KBjvdXoW7Jw1xWFyxXw1kury7AFW7twb_yoWfWrcE9F
	y0vrZ7Gry8W3WxZa9rZryYyr9xGFW7W3Z09FWjgFyfX3yaywn8Jr12ywsxA3Z7G3WrXFn8
	urs5Gr1xCr12yjkaLaAFLSUrUUUUbb8apTn2vfkv8UJUUUU8wcxFpf9Il3svdxBIdaVrn0
	xqx4xG64xvF2IEw4CE5I8CrVC2j2Jv73VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUY
	j7kC6x804xWl14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3w
	AFIxvE14AKwVWUGVWUXwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK
	6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7
	xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVWxJr0_GcWle2I2
	62IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4xG64xvF2IEw4
	CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v26r1j6r4UMcvj
	eVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x0EwIxGrwCFx2IqxV
	CFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r10
	6r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxV
	WUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG
	6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_Gr
	UvcSsGvfC2KfnxnUUI43ZEXa7IU8r9N3UUUUU==

In dual-bridges scenario, some bugs were found for irq
controllers drivers, so the patch serie is used to fix them.

V2->V3:
1. Add Cc: stable@vger.kernel.org to make them be backported to stable branch

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

