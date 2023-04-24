Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9D447C
	for <loongarch@lists.linux.dev>; Mon, 24 Apr 2023 12:49:36 +0000 (UTC)
Received: from loongson.cn (unknown [112.20.110.102])
	by gateway (Coremail) with SMTP id _____8AxHuveekZkgQoAAA--.75S3;
	Mon, 24 Apr 2023 20:49:34 +0800 (CST)
Received: from localhost.localdomain (unknown [112.20.110.102])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8BxHLPdekZkMNA4AA--.11292S2;
	Mon, 24 Apr 2023 20:49:34 +0800 (CST)
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
	linux-mips@vger.kernel.org,
	loongarch@lists.linux.dev,
	devicetree@vger.kernel.org,
	loongson-kernel@lists.loongnix.cn,
	Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH V4 0/2] irqchip: loongson-eiointc: Add DT init support
Date: Mon, 24 Apr 2023 20:49:10 +0800
Message-Id: <cover.1682328016.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.39.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8BxHLPdekZkMNA4AA--.11292S2
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBjvdXoWrtFWxWF48Xw1Dtw1ftw1kKrg_yoWkXFcE9a
	4S9a4kXr9FgF17XaykAr4xJr9xurWj93Wjka1DKF18Was5Ar15CFnrA3ZxWF4IgF4Yvrn8
	ZrZ5ur1xZw1xGjkaLaAFLSUrUUUU1b8apTn2vfkv8UJUUUU8wcxFpf9Il3svdxBIdaVrn0
	xqx4xG64xvF2IEw4CE5I8CrVC2j2Jv73VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUY
	g7kC6x804xWl14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3w
	AFIxvE14AKwVWUXVWUAwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK
	6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r1j6r4UM28EF7
	xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJwAa
	w2AFwI0_Jrv_JF1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44
	I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2
	jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20x
	vY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km07C267AKxVWUXVWUAwC20s02
	6c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw
	0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvE
	c7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14
	v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7I
	U8CksDUUUUU==

Add EIOINTC irqchip DT support, which is needed for Loongson chips
that are DT-based and support EIOINTC, such as the Loongson-2K0500 chip.

---
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
 drivers/irqchip/irq-loongson-eiointc.c        | 129 +++++++++++++-----
 2 files changed, 154 insertions(+), 34 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/loongson,eiointc.yaml

-- 
2.39.1

