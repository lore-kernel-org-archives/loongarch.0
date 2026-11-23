Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=114.242.206.163
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795427113;
	b=Z9DO5MW6NBSJ9OKyaUeL9No4+uVdr1v+eGD1BgLDMCzZygpZsP5UrHpKDrT2VTPRlNl+
	 nXPBN4/3nQVO/FREQm+JqtjOZll67L9l1qsd9vubtLwIVxYl+ZM4wwQIMZkBLPdfvFX7p
	 9VS87wLAnPU4HV4czJZH47b8p2Kl1E8LH56n8hlunDfbkGFesWKO+C/iGY3yMkflE/yIJ
	 btpXaBg4Xm1ac7V5QYvzxtdBU/X3pvDVBvladkBNwBOMP/lUKb8h184dO5KoVW0tubaVh
	 DBciMT7lKuKL99tEdkMV0rD2RTvxAH8zqKvm2P1Y52QpiZ1mskPhTrjwh/7yZ+lInWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795427113;
	h=DMARC-Filter:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-CM-SenderInfo:
	 X-Coremail-Antispam;
	bh=yn36Mkpi/X9k7obbI5fyLF0Pe6QqiXuOva9oIQ9Cepc=;
	b=PuIM1TIHjR5tl4Jko0PxXzr102fnQdLhjAzgpRp8IZUkZM8OjDsS53w8YqNtKN7U1izD
	 LBKFd6XKLOANqN2zBi6e/EmDPCx6KhoDf9oOxDaV1hlyVzvQAhrhk0vLniq7cHj9IEbgM
	 wWGrNYdrUkpc04zlOO0sQIuxK4ZOp7B04dDGHh5RwkJdb4RlSMUe7MJYr2L1jYYY92kFd
	 Ox1vITKzU/iQ053SJeieR7jLzinCT9fKnMlrSp17MLvegIDNTKKh6mTejzZZpctyfyyEZ
	 cbqawqWmwIGK/jn+KtHtFAPz4hj4nHSh3273U611nybLl3R7eZ+KQtJOvndnP33B7UQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=loongson.cn;
	spf=pass smtp.mailfrom=loongson.cn;
	arc=none smtp.remote-ip=114.242.206.163
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76DEF606A32E
	for <loongarch@lists.linux.dev>; Mon, 23 Nov 2026 09:45:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76DEF606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.69.66])
	by gateway (Coremail) with SMTP id _____8CxutEmCwRr4jAiAA--.31891S3;
	Mon, 23 Nov 2026 17:45:10 +0800 (CST)
Received: from kernelserver (unknown [223.64.69.66])
	by front1 (Coremail) with SMTP id qMiowJDxTs8jCwRrW9o2AA--.44054S4;
	Mon, 23 Nov 2026 17:45:10 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yinbo Zhu <zhuyinbo@loongson.cn>,
	Mark Brown <broonie@kernel.org>
Cc: Huacai Chen <chenhuacai@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-spi@vger.kernel.org,
	Bingxiong Li <libingxiong@loongson.cn>,
	Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH 2/5] spi: dt-bindings: loongson,ls2k-spi: Document loongson,ls2k0300-spi-io compatible
Date: Mon, 23 Nov 2026 17:44:47 +0800
Message-ID: <f4b1bbc084281212070f4aacd19fafbaaff11b42.1795425389.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1795425389.git.zhoubinbin@loongson.cn>
References: <cover.1795425389.git.zhoubinbin@loongson.cn>
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJDxTs8jCwRrW9o2AA--.44054S4
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/1tbiAQEACGsDnvwK9QAAs9
X-Coremail-Antispam: 1Uk129KBj93XoW7ZFWUZr15JF1rGr1fGFyxXrc_yoW8ZryDpF
	9xCr1fGrW8tF17Cws8ta48Aa1fZr93Z3ZrCFZ2yF47Ga9YgayUXw43KFn0qa1fGF4DXFy5
	ZF4kKrW5Ga47urcCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUvab4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q6rW5McIj6I8E87Iv
	67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2
	Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_JF0_Jw1lx2IqxVAq
	x4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r
	43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Gr0_Xr1lIxAIcVC0I7IYx2IY6xkF
	7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxV
	W8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxU
	cCD7UUUUU

Loongson-2K0300 integrates a new SPI-IO controller with enhanced
registers and extended capabilities (interrupt, DMA, larger FIFO, etc.)
which is distinct from the legacy SPI flash controller.

Define the new compatible `loongson,ls2k0300-spi-io` and require the
associated DMA and interrupt properties for this variant.

Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 .../bindings/spi/loongson,ls2k-spi.yaml       | 41 +++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/Documentation/devicetree/bindings/spi/loongson,ls2k-spi.yaml b/Documentation/devicetree/bindings/spi/loongson,ls2k-spi.yaml
index 8a36dbece788..b113d10c5bd9 100644
--- a/Documentation/devicetree/bindings/spi/loongson,ls2k-spi.yaml
+++ b/Documentation/devicetree/bindings/spi/loongson,ls2k-spi.yaml
@@ -16,6 +16,7 @@ properties:
   compatible:
     oneOf:
       - enum:
+          - loongson,ls2k0300-spi-io
           - loongson,ls2k1000-spi
       - items:
           - enum:
@@ -32,6 +33,14 @@ properties:
   interrupts:
     maxItems: 1
 
+  dmas:
+    maxItems: 2
+
+  dma-names:
+    items:
+      - const: tx
+      - const: rx
+
 required:
   - compatible
   - reg
@@ -39,6 +48,23 @@ required:
 
 unevaluatedProperties: false
 
+if:
+  properties:
+    compatible:
+      contains:
+        const: loongson,ls2k0300-spi-io
+
+then:
+  required:
+    - dmas
+    - dma-names
+    - interrupts
+
+else:
+  properties:
+    dmas: false
+    dma-names: false
+
 examples:
   - |
     spi0: spi@1fff0220{
@@ -48,3 +74,18 @@ examples:
         #address-cells = <1>;
         #size-cells = <0>;
     };
+
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/clock/loongson,ls2k-clk.h>
+
+    spi@1610c000 {
+        compatible = "loongson,ls2k0300-spi-io";
+        reg = <0x1610c000 0x2000>;
+        clocks = <&clk LS2K0300_CLK_DEV_GATE>;
+        interrupt-parent = <&liointc0>;
+        interrupts = <6 IRQ_TYPE_LEVEL_HIGH>;
+        dmas = <&dma_router 14 1 0x8e>,
+               <&dma_router 14 0 0x8e>;
+        dma-names = "tx", "rx";
+    };
-- 
2.52.0

