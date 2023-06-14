Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1ACF8F74
	for <loongarch@lists.linux.dev>; Wed, 14 Jun 2023 12:27:32 +0000 (UTC)
Received: from loongson.cn (unknown [10.180.13.124])
	by gateway (Coremail) with SMTP id _____8BxLuszsolkRyEFAA--.11091S3;
	Wed, 14 Jun 2023 20:27:31 +0800 (CST)
Received: from localhost.localdomain (unknown [10.180.13.124])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8DxbMoxsolkg5oaAA--.1712S4;
	Wed, 14 Jun 2023 20:27:29 +0800 (CST)
From: YingKun Meng <mengyingkun@loongson.cn>
To: krzysztof.kozlowski+dt@linaro.org,
	robh+dt@kernel.org,
	conor+dt@kernel.org,
	krzysztof.kozlowski@linaro.org
Cc: devicetree@vger.kernel.org,
	broonie@kernel.org,
	lgirdwood@gmail.com,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	loongarch@lists.linux.dev,
	loongson-kernel@lists.loongnix.cn,
	mengyingkun@loongson.cn
Subject: [PATCH v3 3/3] ASoC: dt-bindings: Add support for Loongson audio card
Date: Wed, 14 Jun 2023 20:26:59 +0800
Message-Id: <20230614122659.3402788-1-mengyingkun@loongson.cn>
X-Mailer: git-send-email 2.33.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8DxbMoxsolkg5oaAA--.1712S4
X-CM-SenderInfo: 5phqw55lqjy33q6o00pqjv00gofq/1tbiAQACDGSIXIIYSwARs-
X-Coremail-Antispam: 1Uk129KBj93XoW7tF4fKF4xCr4fAr4rXr4rXrc_yoW5Jry5pw
	s3C34UGr48t3W7Cas5ZFyxAw4fZasayFsrJr42qw1UCFZ8K3WFqw1ak3WUu3W2kr1kJay7
	uFyFkr1xGas3CwcCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUvFb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4
	xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jw0_WrylYx0Ex4A2jsIE14v2
	6r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCY1x0262kKe7AKxV
	WUAVWUtwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E
	14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIx
	kGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVW5JVW7JwCI42IY6xIIjxv20xvEc7CjxVAF
	wI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26F4j6r
	4UJwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxU4ID7
	DUUUU

From: Yingkun Meng <mengyingkun@loongson.cn>

The audio card uses loongson I2S controller present in
7axxx/2kxxx chips to transfer audio data.

On loongson platform, the chip has only one I2S controller.

Signed-off-by: Yingkun Meng <mengyingkun@loongson.cn>
---
Changes v2 -> v3
  No change.

Changes v1 -> v2
  Add chip model restriction for title and descrition.
  Add 'required' option for sound-dai property.

 .../sound/loongson,ls-audio-card.yaml         | 70 +++++++++++++++++++
 1 file changed, 70 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/loongson,ls-audio-card.yaml

diff --git a/Documentation/devicetree/bindings/sound/loongson,ls-audio-card.yaml b/Documentation/devicetree/bindings/sound/loongson,ls-audio-card.yaml
new file mode 100644
index 000000000000..61e8babed402
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/loongson,ls-audio-card.yaml
@@ -0,0 +1,70 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/loongson,ls-audio-card.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Loongson 7axxx/2kxxx ASoC audio sound card driver
+
+maintainers:
+  - Yingkun Meng <mengyingkun@loongson.cn>
+
+description:
+  The binding describes the sound card present in loongson
+  7axxx/2kxxx platform. The sound card is an ASoC component
+  which uses Loongson I2S controller to transfer the audio data.
+
+properties:
+  compatible:
+    const: loongson,ls-audio-card
+
+  model:
+    $ref: /schemas/types.yaml#/definitions/string
+    description: User specified audio sound card name
+
+  mclk-fs:
+    $ref: simple-card.yaml#/definitions/mclk-fs
+
+  cpu:
+    description: Holds subnode which indicates cpu dai.
+    type: object
+    additionalProperties: false
+    properties:
+      sound-dai:
+        maxItems: 1
+    required:
+      - sound-dai
+
+  codec:
+    description: Holds subnode which indicates codec dai.
+    type: object
+    additionalProperties: false
+    properties:
+      sound-dai:
+        maxItems: 1
+    required:
+      - sound-dai
+
+required:
+  - compatible
+  - model
+  - mclk-fs
+  - cpu
+  - codec
+
+additionalProperties: false
+
+examples:
+  - |
+    sound {
+        compatible = "loongson,ls-audio-card";
+        model = "loongson-audio";
+        mclk-fs = <512>;
+
+        cpu {
+            sound-dai = <&i2s>;
+        };
+        codec {
+             sound-dai = <&es8323>;
+        };
+    };
-- 
2.33.0

