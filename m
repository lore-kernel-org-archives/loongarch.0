Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C7E4101C9
	for <loongarch@lists.linux.dev>; Thu, 25 May 2023 12:55:55 +0000 (UTC)
Received: from loongson.cn (unknown [223.106.25.146])
	by gateway (Coremail) with SMTP id _____8Bxy_LaWm9knP8AAA--.2635S3;
	Thu, 25 May 2023 20:55:54 +0800 (CST)
Received: from localhost.localdomain (unknown [223.106.25.146])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8DxOLbWWm9kkYR3AA--.323S4;
	Thu, 25 May 2023 20:55:53 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Alessandro Zummo <a.zummo@towertech.it>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-rtc@vger.kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Huacai Chen <chenhuacai@loongson.cn>
Cc: Huacai Chen <chenhuacai@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	linux-mips@vger.kernel.org,
	Keguang Zhang <keguang.zhang@gmail.com>,
	zhao zhang <zhzhl555@gmail.com>,
	Yang Ling <gnaygnil@gmail.com>,
	loongson-kernel@lists.loongnix.cn,
	Binbin Zhou <zhoubinbin@loongson.cn>,
	WANG Xuerui <git@xen0n.name>
Subject: [PATCH V4 5/5] MIPS: Loongson64: DTS: Add RTC support to Loongson-2K1000
Date: Thu, 25 May 2023 20:55:43 +0800
Message-Id: <7dcce6fb65594180ea92854c211ce1da4edd8c12.1684983279.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <cover.1684983279.git.zhoubinbin@loongson.cn>
References: <cover.1684983279.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8DxOLbWWm9kkYR3AA--.323S4
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBjvdXoW7XF4fCryDCr47Xry8GF4Uurg_yoWDGrXEya
	s7Kw1kGrWrJF1ft348Zr1UJFy3u3y7u3Z5C3WxXr15tas0yrnxJFWUAayDGryfWrWYqrs3
	Wws5WF4xZFyxKjkaLaAFLSUrUUUU0b8apTn2vfkv8UJUUUU8wcxFpf9Il3svdxBIdaVrn0
	xqx4xG64xvF2IEw4CE5I8CrVC2j2Jv73VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUY
	u7kC6x804xWl14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3w
	AFIxvE14AKwVWUXVWUAwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK
	6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwA2z4
	x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr1j6rxdM2kK
	e7AKxVWUAVWUtwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI
	0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWrXVW3AwAv7VC2z280
	aVAFwI0_Cr0_Gr1UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCY1x0262
	kKe7AKxVWUAVWUtwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km
	07C267AKxVWUAVWUtwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r
	1rMI8E67AF67kF1VAFwI0_GFv_WrylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVW7
	JVWDJwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UMIIF0xvE42xK8VAvwI8IcIk0rV
	WUJVWUCwCI42IY6I8E87Iv67AKxVWxJVW8Jr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8
	JrUvcSsGvfC2KfnxnUUI43ZEXa7IU022NJUUUUU==

The module is now supported, enable it.

Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
Signed-off-by: WANG Xuerui <git@xen0n.name>
Acked-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
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

