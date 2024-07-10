Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F07A18F62
	for <loongarch@lists.linux.dev>; Wed, 10 Jul 2024 02:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720577074; cv=none; b=ddhG5D1vThI1l4QiGfwXapOVPSPu7VWC3YkH8LlUp3Rm3aaxI2TqcSABuAo19ByLVsByq3livdYI1tyUDUHEDOVDUtbQXBjbEe5VyJCSdt50Ce2PiNEaqLPkF0CWTEs3+xRkmlkl1UmD67QE7jYd+9oJ1o1lhzw+RMLQMfVtY1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720577074; c=relaxed/simple;
	bh=gyWe0xFTECVzNF3rJj5io7qNIzFZRX6UAQlXPMPC5gg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nJAWC2FFozX56Fs1J7r0n3MsrPZKWRUxMOKTSMzojQbgn4pz/nfo/xFxsnoohjF4ZJJgHlAvYg5wSH1nF3l7PIkHfv3Almdq0nuay9hViOyFMAHBxY+fKAtt0qKhCq+xll1WOJ5aeH8kW5IWo/aoiCxQj+VQJRbIo9Z/6gcx51A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.130])
	by gateway (Coremail) with SMTP id _____8Cx_vAn7I1mRKwCAA--.8351S3;
	Wed, 10 Jul 2024 10:04:23 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.68.130])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Cxbccj7I1m3OFBAA--.20688S3;
	Wed, 10 Jul 2024 10:04:22 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Juxin Gao <gaojuxin@loongson.cn>
Cc: Huacai Chen <chenhuacai@kernel.org>,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	Binbin Zhou <zhoubinbin@loongson.cn>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v5 1/2] dt-bindings: pwm: Add Loongson PWM controller
Date: Wed, 10 Jul 2024 10:04:06 +0800
Message-ID: <28e74b9f25265d7ac743d46c65a2181001eb5817.1720516327.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <cover.1720516327.git.zhoubinbin@loongson.cn>
References: <cover.1720516327.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8Cxbccj7I1m3OFBAA--.20688S3
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoWxArW8Aw1fAw4fWr1kWryDArc_yoW5ArWfpF
	sxC3s2kr10qF17u390ga48Cr1fZ3s5A3ZrKFW7Aw1DKF9xG3WYqw13KF1UZay3ur1UXFWU
	ZF9akr47KayUCrcCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkYb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4j6r4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc
	02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUAVWUtwAv7VC2z280aVAF
	wI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw28IcxkI7V
	AKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCj
	r7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6x
	IIjxv20xvE14v26r1I6r4UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAI
	w20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x
	0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU1LiSJUUUUU==

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
index efa9e7b653a6..973d60113105 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12989,6 +12989,12 @@ S:	Maintained
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
2.43.5

