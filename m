Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD6DF215197
	for <loongarch@lists.linux.dev>; Mon, 17 Feb 2025 09:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739784650; cv=none; b=W+fgzeqXj/N9HleT3eES4GSkobGbbJ2THbW+SH5Z+etAZcCthNdcTG/Kt+11ZXo9GI23hUHSTIS2Dkpwtwy7ldDJsKZVSBmrR4Hj6Z/VFRHCNgE4IbeL8TUsJF52ezujGx458/avTNyNksIy72P7wfL9gGHAXFT7zwB/Cs6oIrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739784650; c=relaxed/simple;
	bh=aD3vY1slnPKPfhpqd2dAsUosRPb/99diiY0WwJCvQBc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Yf4zI4H9JHb9TU7Z3ckCy39byLd12kCWKhCqdJAVgznuRzrLNv/efqg+D4RsQxB1peYbH0TQHLIG+tHYq7/VoIPCXdk+R/vcRpMZqBkEcckIJaXQygeVgWXsnwzJA3noZ39gJC15LlLSwJrREiKSC5+5D+Z+OcHlJY8uJNUlxqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.156])
	by gateway (Coremail) with SMTP id _____8CxNHC_AbNn+5Z4AA--.11650S3;
	Mon, 17 Feb 2025 17:30:39 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.68.156])
	by front1 (Coremail) with SMTP id qMiowMBxLse7AbNnvO4XAA--.26537S3;
	Mon, 17 Feb 2025 17:30:38 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Juxin Gao <gaojuxin@loongson.cn>
Cc: Huacai Chen <chenhuacai@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-pwm@vger.kernel.org,
	Binbin Zhou <zhoubinbin@loongson.cn>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v9 1/2] dt-bindings: pwm: Add Loongson PWM controller
Date: Mon, 17 Feb 2025 17:30:24 +0800
Message-ID: <d6be5236ab4ff5b5fde78004c38d8bced42f2ba2.1739784071.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1739784071.git.zhoubinbin@loongson.cn>
References: <cover.1739784071.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMBxLse7AbNnvO4XAA--.26537S3
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoWxArW8Aw1fAw4fWr1kWryDArc_yoW5ArWfpF
	sxC3s2kr10qF17u398Wa48Cr1fZ3s5A3W7KFW7Aw1DKF9xJ3WYqw13KF15Z3y3ur1UXFWU
	ZF9akr4UKa4UCrcCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUk0b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r126r13M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v2
	6F4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc
	02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUAVWUtwAv7VC2z280aVAF
	wI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw28IcxkI7V
	AKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCj
	r7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6x
	IIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAI
	w20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x
	0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxU7TKZDUUUU

Add Loongson PWM controller binding with DT schema format using
json-schema.

Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Huacai Chen <chenhuacai@loongson.cn>
---
 .../bindings/pwm/loongson,ls7a-pwm.yaml       | 66 +++++++++++++++++++
 MAINTAINERS                                   |  6 ++
 2 files changed, 72 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pwm/loongson,ls7a-pwm.yaml

diff --git a/Documentation/devicetree/bindings/pwm/loongson,ls7a-pwm.yaml b/Documentation/devicetree/bindings/pwm/loongson,ls7a-pwm.yaml
new file mode 100644
index 000000000000..46814773e0cc
--- /dev/null
+++ b/Documentation/devicetree/bindings/pwm/loongson,ls7a-pwm.yaml
@@ -0,0 +1,66 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pwm/loongson,ls7a-pwm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Loongson PWM Controller
+
+maintainers:
+  - Binbin Zhou <zhoubinbin@loongson.cn>
+
+description:
+  The Loongson PWM has one pulse width output signal and one pulse input
+  signal to be measured.
+  It can be found on Loongson-2K series cpus and Loongson LS7A bridge chips.
+
+allOf:
+  - $ref: pwm.yaml#
+
+properties:
+  compatible:
+    oneOf:
+      - const: loongson,ls7a-pwm
+      - items:
+          - enum:
+              - loongson,ls2k0500-pwm
+              - loongson,ls2k1000-pwm
+              - loongson,ls2k2000-pwm
+          - const: loongson,ls7a-pwm
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  '#pwm-cells':
+    description:
+      The first cell must have a value of 0, which specifies the PWM output signal;
+      The second cell is the period in nanoseconds;
+      The third cell flag supported by this binding is PWM_POLARITY_INVERTED.
+    const: 3
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/clock/loongson,ls2k-clk.h>
+    pwm@1fe22000 {
+        compatible = "loongson,ls2k1000-pwm", "loongson,ls7a-pwm";
+        reg = <0x1fe22000 0x10>;
+        interrupt-parent = <&liointc0>;
+        interrupts = <24 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&clk LOONGSON2_APB_CLK>;
+        #pwm-cells = <3>;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 896a307fa065..9fcde52aec4b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13616,6 +13616,12 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/i2c/loongson,ls2x-i2c.yaml
 F:	drivers/i2c/busses/i2c-ls2x.c
 
+LOONGSON PWM DRIVER
+M:	Binbin Zhou <zhoubinbin@loongson.cn>
+L:	linux-pwm@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/pwm/loongson,ls7a-pwm.yaml
+
 LOONGSON-2 SOC SERIES CLOCK DRIVER
 M:	Yinbo Zhu <zhuyinbo@loongson.cn>
 L:	linux-clk@vger.kernel.org
-- 
2.47.1

