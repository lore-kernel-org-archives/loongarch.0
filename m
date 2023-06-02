Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A13095687
	for <loongarch@lists.linux.dev>; Fri,  2 Jun 2023 09:51:10 +0000 (UTC)
Received: from loongson.cn (unknown [223.106.25.146])
	by gateway (Coremail) with SMTP id _____8Bx3+uMu3lkSZcDAA--.7674S3;
	Fri, 02 Jun 2023 17:51:08 +0800 (CST)
Received: from localhost.localdomain (unknown [223.106.25.146])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8AxgjiHu3lk97qFAA--.19179S4;
	Fri, 02 Jun 2023 17:51:07 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Alessandro Zummo <a.zummo@towertech.it>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-rtc@vger.kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org
Cc: Huacai Chen <chenhuacai@kernel.org>,
	loongson-kernel@lists.loongnix.cn,
	Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	linux-mips@vger.kernel.org,
	Keguang Zhang <keguang.zhang@gmail.com>,
	zhao zhang <zhzhl555@gmail.com>,
	Yang Ling <gnaygnil@gmail.com>,
	Binbin Zhou <zhoubinbin@loongson.cn>,
	WANG Xuerui <git@xen0n.name>
Subject: [PATCH V5 5/5] MIPS: Loongson64: DTS: Add RTC support to Loongson-2K1000
Date: Fri,  2 Jun 2023 17:50:50 +0800
Message-Id: <36ceb490f00f7a387de41330465a4daa21484be0.1685693501.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <cover.1685693501.git.zhoubinbin@loongson.cn>
References: <cover.1685693501.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8AxgjiHu3lk97qFAA--.19179S4
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBjvdXoWrZw48Jw4rGrW8Jr48WFy8Xwb_yoWDGrXEya
	s7K3WkGrWrJF1ft348Zr1UJFy3u3y7u3Z5C3WxXr15tas0vrnxJFWUAayDGryfWrWYvrs3
	Wws5WF4xZFyxKjkaLaAFLSUrUUUU0b8apTn2vfkv8UJUUUU8wcxFpf9Il3svdxBIdaVrn0
	xqx4xG64xvF2IEw4CE5I8CrVC2j2Jv73VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUY
	K7kC6x804xWl14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3w
	AFIxvE14AKwVWUXVWUAwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK
	6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4UJVWxJr1l84
	ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxVWxJr0_GcWl
	n4kS14v26r126r1DM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6x
	ACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26rWY6Fy7McIj6I8E
	87Iv67AKxVWxJVW8Jr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxkF7I
	0En4kS14v26r126r1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMxCI
	bckI1I0E14v26r126r1DMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_Jr
	I_JrWlx4CE17CEb7AF67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v2
	6F1j6w1UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1lIxAIcVCF04k26cxKx2IYs7
	xG6r1j6r1xMIIF0xvEx4A2jsIE14v26F4j6r4UJwCI42IY6I8E87Iv6xkF7I0E14v26r4j
	6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUI0eHUUUUU

The module is now supported, enable it.

Acked-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
Signed-off-by: WANG Xuerui <git@xen0n.name>
---
 arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi b/arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi
index 8143a61111e3..f878f47e4501 100644
--- a/arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi
+++ b/arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi
@@ -97,6 +97,13 @@ liointc1: interrupt-controller@1fe11440 {
 						<0x00000000>; /* int3 */
 		};
 
+		rtc0: rtc@1fe07800 {
+			compatible = "loongson,ls2k1000-rtc";
+			reg = <0 0x1fe07800 0 0x78>;
+			interrupt-parent = <&liointc0>;
+			interrupts = <60 IRQ_TYPE_LEVEL_LOW>;
+		};
+
 		uart0: serial@1fe00000 {
 			compatible = "ns16550a";
 			reg = <0 0x1fe00000 0 0x8>;
-- 
2.39.1

