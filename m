Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BEAD627
	for <loongarch@lists.linux.dev>; Mon, 29 May 2023 01:19:20 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.176])
	by gateway (Coremail) with SMTP id _____8AxhPBl+3NkvRQCAA--.4858S3;
	Mon, 29 May 2023 09:09:57 +0800 (CST)
Received: from loongson-pc.loongson.cn (unknown [10.20.42.176])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8CxorRi+3NkrCd+AA--.9782S6;
	Mon, 29 May 2023 09:09:57 +0800 (CST)
From: Jianmin Lv <lvjianmin@loongson.cn>
To: Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	WANG Xuerui <kernel@xen0n.name>,
	loongson-kernel@lists.loongnix.cn,
	Yinbo Zhu <zhuyinbo@loongson.cn>,
	Huacai Chen <chenhuacai@kernel.org>
Subject: [PATCH V2 4/4] irqchip/loongson-liointc: Add IRQCHIP_SKIP_SET_WAKE flag
Date: Mon, 29 May 2023 09:09:54 +0800
Message-Id: <20230529010954.2678-5-lvjianmin@loongson.cn>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20230529010954.2678-1-lvjianmin@loongson.cn>
References: <20230529010954.2678-1-lvjianmin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8CxorRi+3NkrCd+AA--.9782S6
X-CM-SenderInfo: 5oymxthqpl0qxorr0wxvrqhubq/
X-Coremail-Antispam: 1Uk129KBjvdXoW7Jw1DGFW3Gr4UCF48Wr1Dtrb_yoWkZrg_uF
	WIqws5urySqr4a9a48Cr4UXrnYk3y5uan7ua1FvFs3Z348tw43Ca13Z3W3GFW7KryvyF93
	Cr4UWr4rCryxJjkaLaAFLSUrUUUU8b8apTn2vfkv8UJUUUU8wcxFpf9Il3svdxBIdaVrn0
	xqx4xG64xvF2IEw4CE5I8CrVC2j2Jv73VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUY
	u7kC6x804xWl14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3w
	AFIxvE14AKwVWUtVW8JwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK
	6xIIjxv20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4UJVWxJr1l84
	ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxVW8Jr0_Cr1U
	M2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zV
	CFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWrXVW3AwAv7VC2
	z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxkF7I
	0En4kS14v26r126r1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMxCI
	bckI1I0E14v26r1Y6r17MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_Jr
	I_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v2
	6ryj6F1UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj4
	0_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8
	JrUvcSsGvfC2KfnxnUUI43ZEXa7IU8CzutUUUUU==

From: Yinbo Zhu <zhuyinbo@loongson.cn>

LIOINTC doesn't require specific logic to work with wakeup IRQs,
and no irq_set_wake callback is needed. To allow registered IRQs
from LIOINTC to be used as a wakeup-source, and ensure irq_set_irq_wake()
works well, the flag IRQCHIP_SKIP_SET_WAKE should be added.

Reviewed-by: Huacai Chen <chenhuacai@kernel.org>
Signed-off-by: Yinbo Zhu <zhuyinbo@loongson.cn>
Signed-off-by: Jianmin Lv <lvjianmin@loongson.cn>
---
 drivers/irqchip/irq-loongson-liointc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/irqchip/irq-loongson-liointc.c b/drivers/irqchip/irq-loongson-liointc.c
index 5dd9db8f8fa8..e4b33aed1c97 100644
--- a/drivers/irqchip/irq-loongson-liointc.c
+++ b/drivers/irqchip/irq-loongson-liointc.c
@@ -295,6 +295,7 @@ static int liointc_init(phys_addr_t addr, unsigned long size, int revision,
 	ct->chip.irq_mask = irq_gc_mask_disable_reg;
 	ct->chip.irq_mask_ack = irq_gc_mask_disable_reg;
 	ct->chip.irq_set_type = liointc_set_type;
+	ct->chip.flags = IRQCHIP_SKIP_SET_WAKE;
 
 	gc->mask_cache = 0;
 	priv->gc = gc;
-- 
2.31.1

