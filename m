Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B5C118AE6
	for <loongarch@lists.linux.dev>; Mon,  5 Jun 2023 12:09:44 +0000 (UTC)
Received: from loongson.cn (unknown [10.180.13.124])
	by gateway (Coremail) with SMTP id _____8Dx9vCG0H1k+hMAAA--.212S3;
	Mon, 05 Jun 2023 20:09:42 +0800 (CST)
Received: from localhost.localdomain (unknown [10.180.13.124])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8AxauWC0H1k_3AAAA--.2032S6;
	Mon, 05 Jun 2023 20:09:42 +0800 (CST)
From: YingKun Meng <mengyingkun@loongson.cn>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	loongarch@lists.linux.dev,
	loongson-kernel@lists.loongnix.cn,
	Yingkun Meng <mengyingkun@loongson.cn>
Subject: [PATCH 3/3] ASoC: dt-bindings: Add support for Loongson audio card
Date: Mon,  5 Jun 2023 20:09:34 +0800
Message-Id: <20230605120934.2306548-3-mengyingkun@loongson.cn>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20230605120934.2306548-1-mengyingkun@loongson.cn>
References: <20230605120934.2306548-1-mengyingkun@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8AxauWC0H1k_3AAAA--.2032S6
X-CM-SenderInfo: 5phqw55lqjy33q6o00pqjv00gofq/1tbiAQANDGR8fwASxAASsj
X-Coremail-Antispam: 1Uk129KBj93XoW7tF4fuF1UWw15WF47ZFWDtrc_yoW8Zw1Dpw
	s3C34UGrWxt3W7C395ZFWxAw4fJasayFsrXF42qw1UGFWDKa4FqwsIk3W5u3W2kFn5Jay7
	Wa4rGr1xGas3CwcCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkYb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4j6r4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc
	02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUtVWrXwAv7VC2z280aVAF
	wI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw28IcxkI7V
	AKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCj
	r7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6x
	IIjxv20xvE14v26r4j6ryUMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAI
	w20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x
	0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU8l38UUUUUU==

From: Yingkun Meng <mengyingkun@loongson.cn>

The audio card uses loongson I2S controller present in 7axxx/2kxxx chips
to transfer audio data.

Signed-off-by: Yingkun Meng <mengyingkun@loongson.cn>
---
 .../sound/loongson,ls-audio-card.yaml         | 64 +++++++++++++++++++
 1 file changed, 64 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/loongson,ls-audio-card.yaml

diff --git a/Documentation/devicetree/bindings/sound/loongson,ls-audio-card.yaml b/Documentation/devicetree/bindings/sound/loongson,ls-audio-card.yaml
new file mode 100644
index 000000000000..f1d6ee346bb3
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/loongson,ls-audio-card.yaml
@@ -0,0 +1,64 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/loongson-audio-card.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Loongson generic ASoC audio sound card.
+
+maintainers:
+  - Yingkun Meng <mengyingkun@loongson.cn>
+
+description:
+  Generic ASoC audio device for loongson platform.
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
+
+  codec:
+    description: Holds subnode which indicates codec dai.
+    type: object
+    additionalProperties: false
+    properties:
+      sound-dai:
+        maxItems: 1
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

