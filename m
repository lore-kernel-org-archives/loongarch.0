Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AD5D23CD
	for <loongarch@lists.linux.dev>; Sat,  2 Sep 2023 08:47:48 +0000 (UTC)
Received: from loongson.cn (unknown [112.20.109.102])
	by gateway (Coremail) with SMTP id _____8Cx2eqt9vJk1P4dAA--.56175S3;
	Sat, 02 Sep 2023 16:47:41 +0800 (CST)
Received: from localhost.localdomain (unknown [112.20.109.102])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8BxrM6n9vJkZY1pAA--.58262S4;
	Sat, 02 Sep 2023 16:47:40 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Yinbo Zhu <zhuyinbo@loongson.cn>,
	Arnd Bergmann <arnd@arndb.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Huacai Chen <chenhuacai@kernel.org>,
	loongson-kernel@lists.loongnix.cn,
	soc@kernel.org,
	devicetree@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	Binbin Zhou <zhoubinbin@loongson.cn>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 2/5] dt-bindings: soc: loongson,ls2k-pmc: Use fallbacks for ls2k-pmc compatible
Date: Sat,  2 Sep 2023 16:47:28 +0800
Message-Id: <fd2313138ec94775fcd43f4b1244b9ce1258dbd1.1693623752.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <cover.1693623752.git.zhoubinbin@loongson.cn>
References: <cover.1693623752.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8BxrM6n9vJkZY1pAA--.58262S4
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoW7ury5AryDuFykWry3Jw18JFc_yoW8WrW8pF
	sxCas7Gr10vF13Z395JFy8Ar4Fvr93C3ZrXFsrJF17Gw1DXa1jvw1rKF15ZF45urW8XFW7
	uF92krWrWasrCrcCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUBIb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07
	AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWU
	tVWrXwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7V
	AKI48JMxkF7I0En4kS14v26r126r1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY
	6r1j6r4UMxCIbckI1I0E14v26r1Y6r17MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7
	xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY6xII
	jxv20xvE14v26ryj6F1UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw2
	0EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x02
	67AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU0epB3UUUUU==

The Loongson-2K series chips (ls2k0500/ls2k1000/ls2k2000) share the same
PM system controller, using ls2k0500 compatible as fallback for the
others.

Fixes: 6054a676e969 ("soc: dt-bindings: add loongson-2 pm")
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 .../soc/loongson/loongson,ls2k-pmc.yaml         | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/soc/loongson/loongson,ls2k-pmc.yaml b/Documentation/devicetree/bindings/soc/loongson/loongson,ls2k-pmc.yaml
index da2dcfeebf12..c45f5e7fc0e6 100644
--- a/Documentation/devicetree/bindings/soc/loongson/loongson,ls2k-pmc.yaml
+++ b/Documentation/devicetree/bindings/soc/loongson/loongson,ls2k-pmc.yaml
@@ -11,11 +11,16 @@ maintainers:
 
 properties:
   compatible:
-    items:
-      - enum:
-          - loongson,ls2k0500-pmc
-          - loongson,ls2k1000-pmc
-      - const: syscon
+    oneOf:
+      - items:
+          - const: loongson,ls2k0500-pmc
+          - const: syscon
+      - items:
+          - enum:
+              - loongson,ls2k1000-pmc
+              - loongson,ls2k2000-pmc
+          - const: loongson,ls2k0500-pmc
+          - const: syscon
 
   reg:
     maxItems: 1
@@ -44,7 +49,7 @@ examples:
     #include <dt-bindings/interrupt-controller/irq.h>
 
     power-management@1fe27000 {
-        compatible = "loongson,ls2k1000-pmc", "syscon";
+        compatible = "loongson,ls2k1000-pmc", "loongson,ls2k0500-pmc", "syscon";
         reg = <0x1fe27000 0x58>;
         interrupt-parent = <&liointc1>;
         interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
-- 
2.39.3

