Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DA992116
	for <loongarch@lists.linux.dev>; Fri, 24 Mar 2023 06:09:07 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.153])
	by gateway (Coremail) with SMTP id _____8AxYeV8Ph1kWJwQAA--.25427S3;
	Fri, 24 Mar 2023 14:09:00 +0800 (CST)
Received: from loongson-pc.loongson.cn (unknown [10.20.42.153])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Axmr12Ph1kY_QKAA--.2874S7;
	Fri, 24 Mar 2023 14:08:59 +0800 (CST)
From: Jianmin Lv <lvjianmin@loongson.cn>
To: Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	loongson-kernel@lists.loongnix.cn
Subject: [PATCH V1 5/5] irqchip/loongson-pch-pic: Fix registration of syscore_ops
Date: Fri, 24 Mar 2023 14:08:54 +0800
Message-Id: <20230324060854.29375-6-lvjianmin@loongson.cn>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20230324060854.29375-1-lvjianmin@loongson.cn>
References: <20230324060854.29375-1-lvjianmin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8Axmr12Ph1kY_QKAA--.2874S7
X-CM-SenderInfo: 5oymxthqpl0qxorr0wxvrqhubq/
X-Coremail-Antispam: 1Uk129KBjvdXoW7Xr43Xr4UCFyUAryDuFy8Zrb_yoWkCrcEgr
	yIqFnrAr1xZr1Uu3y3Zr15XF1ayF4UW3ZY9FZaqFy3J3yFq34fJrnFyr9xCw47Ga48Ary3
	C395Wwn7CryxCjkaLaAFLSUrUUUU8b8apTn2vfkv8UJUUUU8wcxFpf9Il3svdxBIdaVrn0
	xqx4xG64xvF2IEw4CE5I8CrVC2j2Jv73VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUY
	y7kC6x804xWl14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3w
	AFIxvE14AKwVWUXVWUAwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK
	6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7
	xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJwAa
	w2AFwI0_Jrv_JF1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44
	I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Wrv_ZF1lYx0Ex4A2
	jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20x
	vY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km07C267AKxVWUXVWUAwC20s02
	6c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw
	0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVW5JVW7JwCI42IY6xIIjxv20xvE
	c7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14
	v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x
	07j6sjUUUUUU=

When support suspend/resume for loongson-pch-pic, the syscore_ops is
registered twice in dual-bridges machines where there are two pch-pic IRQ
domains. Repeated registration of an same syscore_ops broke syscore_ops_list,
so the patch will corret it.

Change-Id: Ib08e102931f1b90082d8eaa752287f60147bf777
Fixes: 1ed008a2c331 ("irqchip/loongson-pch-pic: Add suspend/resume support")
Signed-off-by: Jianmin Lv <lvjianmin@loongson.cn>
---
 drivers/irqchip/irq-loongson-pch-pic.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-loongson-pch-pic.c b/drivers/irqchip/irq-loongson-pch-pic.c
index e3c698ca11e9..e5fe4d50be05 100644
--- a/drivers/irqchip/irq-loongson-pch-pic.c
+++ b/drivers/irqchip/irq-loongson-pch-pic.c
@@ -311,7 +311,8 @@ static int pch_pic_init(phys_addr_t addr, unsigned long size, int vec_base,
 	pch_pic_handle[nr_pics] = domain_handle;
 	pch_pic_priv[nr_pics++] = priv;
 
-	register_syscore_ops(&pch_pic_syscore_ops);
+	if (nr_pics == 1)
+		register_syscore_ops(&pch_pic_syscore_ops);
 
 	return 0;
 
-- 
2.31.1

