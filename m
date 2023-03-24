Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4601F2101
	for <loongarch@lists.linux.dev>; Fri, 24 Mar 2023 06:09:06 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.153])
	by gateway (Coremail) with SMTP id _____8AxJNh6Ph1kOJwQAA--.13659S3;
	Fri, 24 Mar 2023 14:08:58 +0800 (CST)
Received: from loongson-pc.loongson.cn (unknown [10.20.42.153])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Axmr12Ph1kY_QKAA--.2874S2;
	Fri, 24 Mar 2023 14:08:58 +0800 (CST)
From: Jianmin Lv <lvjianmin@loongson.cn>
To: Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	loongson-kernel@lists.loongnix.cn
Subject: [PATCH V1 0/5] Fix some issues of irq controllers for dual-bridges scenario 
Date: Fri, 24 Mar 2023 14:08:49 +0800
Message-Id: <20230324060854.29375-1-lvjianmin@loongson.cn>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8Axmr12Ph1kY_QKAA--.2874S2
X-CM-SenderInfo: 5oymxthqpl0qxorr0wxvrqhubq/
X-Coremail-Antispam: 1Uk129KBjvdXoW7Jw1xWFyxXw1kury7AFW7twb_yoWxAFXE9F
	y0vFWkGr1xWF1xXa9rZry5Ar98XayUW3Z09FWjgFW5W3yIyw13AF12yws8Wa1xXF4rZFn5
	Wrs5Zr1xCr12yjkaLaAFLSUrUUUUbb8apTn2vfkv8UJUUUU8wcxFpf9Il3svdxBIdaVrn0
	xqx4xG64xvF2IEw4CE5I8CrVC2j2Jv73VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUY
	17kC6x804xWl14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3w
	AFIxvE14AKwVWUAVWUZwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK
	6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7
	xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJwAS
	0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc02F40EFcxC0V
	AKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUAVWUtwAv7VC2z280aVAFwI0_Jr0_Gr1l
	Ox8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw28IcxkI7VAKI48JMxC20s
	026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_
	JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14
	v26r1I6r4UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xva
	j40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJV
	W8JbIYCTnIWIevJa73UjIFyTuYvjxU7TKZDUUUU

In dual-bridges scenario, some bugs were found for irq
controllers drivers, so the patch serie is used to fix them.

Jianmin Lv (5):
  irqchip/loongson-eiointc: Fix returned value on parsing MADT
  irqchip/loongson-eiointc: Fix incorrect use of acpi_get_vec_parent
  irqchip/loongson-pch-pic: Fix pch_pic_acpi_init calling
  irqchip/loongson-eiointc: Fix registration of syscore_ops
  irqchip/loongson-pch-pic: Fix registration of syscore_ops

 drivers/irqchip/irq-loongson-eiointc.c | 27 ++++++++++++++++----------
 drivers/irqchip/irq-loongson-pch-pic.c |  6 +++++-
 2 files changed, 22 insertions(+), 11 deletions(-)

-- 
2.31.1

