Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FE4E79C3
	for <loongarch@lists.linux.dev>; Fri,  5 May 2023 09:49:31 +0000 (UTC)
Received: from loongson.cn (unknown [112.20.110.102])
	by gateway (Coremail) with SMTP id _____8AxdfCw0FRkSSQFAA--.8598S3;
	Fri, 05 May 2023 17:47:28 +0800 (CST)
Received: from localhost.localdomain (unknown [112.20.110.102])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8BxKL2u0FRkQKZLAA--.7843S2;
	Fri, 05 May 2023 17:47:27 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Jianmin Lv <lvjianmin@loongson.cn>,
	Huacai Chen <chenhuacai@loongson.cn>,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	devicetree@vger.kernel.org,
	loongson-kernel@lists.loongnix.cn,
	Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH V5 0/2] irqchip: loongson-eiointc: Add DT init support
Date: Fri,  5 May 2023 17:46:47 +0800
Message-Id: <cover.1683279769.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.39.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8BxKL2u0FRkQKZLAA--.7843S2
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBjvdXoW7Jr1Utry5KF4UCFyUWFy3Jwb_yoWkKFgE9r
	yI9a4kJryqqF17Xay8Jr4xJr9rurWjg3Wjka1DKr18Was5Ar15CrnrA3ZxWa1IkF4Yyrn5
	ZrZ5uryxZw17WjkaLaAFLSUrUUUU1b8apTn2vfkv8UJUUUU8wcxFpf9Il3svdxBIdaVrn0
	xqx4xG64xvF2IEw4CE5I8CrVC2j2Jv73VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUY
	W7kC6x804xWl14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3w
	AFIxvE14AKwVWUXVWUAwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK
	6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7
	xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr1j6rxdM2kK
	e7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI
	0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUXVWUAwAv7VC2z280
	aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxkF7I0En4
	kS14v26r126r1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMxCIbckI
	1I0E14v26r1Y6r17MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_Jr
	Wlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j
	6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr
	0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIY
	CTnIWIevJa73UjIFyTuYvjxUxUGYDUUUU

Hi all:

Add EIOINTC irqchip DT support, which is needed for Loongson chips
that are DT-based and support EIOINTC, such as the Loongson-2K0500 chip.

Thanks.

---
V5:
- patch(2/2)
  - Rebased on top of latest loongarch-next(v6.3.0).

V4:
- patch(1/2)
  - Simplify the definition of the reg attribute by declaring the entire
    chip configuration space directly.

V3:
- patch(1/2)
  - Drop quotes;
  - Drop interrupt-names;
  - Drop loongson,eio-num-vecs;
  - SoC-based compatibles instead of version-based compatibles.
- patch (2/2)
  - irq_set_handler_data() is used to get parent irq form DTS;
  - Set vec_count by judging compatibles.

V2:
- Add the dt-bindings file (1/2);
- patch(2/2)
  - Remove forgotten debugging messages;
  - Change compatible string name to "loongson,eiointc-1.0".

Binbin Zhou (2):
  dt-bindings: interrupt-controller: Add Loongson EIOINTC
  irqchip/loongson-eiointc: Add DT init support

 .../loongson,eiointc.yaml                     |  59 ++++++++
 drivers/irqchip/irq-loongson-eiointc.c        | 133 +++++++++++++-----
 2 files changed, 157 insertions(+), 35 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/loongson,eiointc.yaml

-- 
2.39.1

