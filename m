Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 489BE800
	for <loongarch@lists.linux.dev>; Tue, 25 Oct 2022 03:51:38 +0000 (UTC)
Received: from loongson.cn (unknown [10.180.13.64])
	by gateway (Coremail) with SMTP id _____8Dx_NhIXVdjX08CAA--.9044S3;
	Tue, 25 Oct 2022 11:51:36 +0800 (CST)
Received: from localhost.localdomain (unknown [10.180.13.64])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8AxDuJBXVdj2rMEAA--.18366S3;
	Tue, 25 Oct 2022 11:51:35 +0800 (CST)
From: Yinbo Zhu <zhuyinbo@loongson.cn>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Hector Martin <marcan@marcan.st>,
	Lubomir Rintel <lkundrak@v3.sk>,
	Conor Dooley <conor.dooley@microchip.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Hitomi Hasegawa <hasegawa-hitomi@fujitsu.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Brian Norris <briannorris@chromium.org>,
	Sven Peter <sven@svenpeter.dev>,
	loongarch@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yinbo Zhu <zhuyinbo@loongson.cn>
Subject: [PATCH v2 2/2] dt-bindings: soc: add loongson2 guts
Date: Tue, 25 Oct 2022 11:51:28 +0800
Message-Id: <20221025035128.21068-2-zhuyinbo@loongson.cn>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20221025035128.21068-1-zhuyinbo@loongson.cn>
References: <20221025035128.21068-1-zhuyinbo@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8AxDuJBXVdj2rMEAA--.18366S3
X-CM-SenderInfo: 52kx5xhqerqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBjvJXoW7uF15Xw4UCw17Xw1fKr4UArb_yoW8ZrW7pr
	nxC34rGrW0vF17uws3GFyIk3W5Cr97CasFgFZrtw1UKF9rA3W3Zw13KF1DZa13Ary8GFW2
	9F97WrWUKF48CaUanT9S1TB71UUUUj7qnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
	qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
	bfkFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AKwVWUAVWUZwA2ocxC64
	kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28E
	F7xvwVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJw
	A2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJwAaw2AFwI0_JF0_Jw1le2I262IYc4CY
	6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrV
	C2j2WlYx0E2Ix0cI8IcVAFwI0_Jw0_WrylYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE
	7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCY1x0262kKe7AKxVWUAVWUtwCF04k20xvY0x
	0EwIxGrwCF04k20xvE74AGY7Cv6cx26rWl4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xF
	xVAFwI0_JF0_Jw1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWw
	C2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Gr0_
	Xr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJV
	WUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIY
	CTnIWIevJa73UjIFyTuYvjxU2_-PUUUUU

Add the loongson2 soc guts driver binding with DT schema format
using json-schema.

Signed-off-by: Yinbo Zhu <zhuyinbo@loongson.cn>
---
 .../soc/loongson/loongson,ls2k-guts.yaml      | 37 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/loongson/loongson,ls2k-guts.yaml

diff --git a/Documentation/devicetree/bindings/soc/loongson/loongson,ls2k-guts.yaml b/Documentation/devicetree/bindings/soc/loongson/loongson,ls2k-guts.yaml
new file mode 100644
index 000000000000..2502f8aeb74d
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/loongson/loongson,ls2k-guts.yaml
@@ -0,0 +1,37 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/loongson/loongson,ls2k-guts.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Loongson2 GUTS driver.
+
+maintainers:
+  - Yinbo Zhu <zhuyinbo@loongson.cn>
+
+description: |
+  GUTS driver was to manage and access global utilities block. Initially
+  only reading SVR and registering soc device are supported.
+
+properties:
+  compatible:
+    const: loongson,ls2k-guts
+
+  reg:
+    maxItems: 1
+
+  little-endian: true
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    guts: guts@1fe00000 {
+        compatible = "loongson,ls2k-guts";
+        reg = <0x1fe00000 0x3ffc>;
+        little-endian;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 0f06dc83f7c6..b23474a5d8c1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11934,6 +11934,7 @@ LOONGSON2 SOC SERIES GUTS DRIVER
 M:	Yinbo Zhu <zhuyinbo@loongson.cn>
 L:	loongarch@lists.linux.dev
 S:	Maintained
+F:	Documentation/devicetree/bindings/soc/loongson/loongson,ls2k-guts.yaml
 F:	drivers/soc/loongson/loongson2_guts.c
 
 LSILOGIC MPT FUSION DRIVERS (FC/SAS/SPI)
-- 
2.31.1

