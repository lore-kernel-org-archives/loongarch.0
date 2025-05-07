Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60CDF21FF2B
	for <loongarch@lists.linux.dev>; Wed,  7 May 2025 07:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746602922; cv=none; b=ShscJ57p9lmiddB/vVVQAYj578QbHs/U1irXBys+urLbzrvEhvk6F2pK4tqS8GoimzGv0DWxOoKAdMO5ePoZBXk3fO19om9A8vTt4mWUXsIxDF4SzqjNCnvsMtnClQqsEn6TMf5TFoe/joDHdunPlUKsDtyFmGH5i4d3b/AipnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746602922; c=relaxed/simple;
	bh=ulQtHUG0S3l7JffL/BaQM5ehW0XxXDgLkkCBE2xYkss=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DlTigXSN4KC/vmz/swrUp/uh9pyjD10KwNXTANgq+kpowa5YcoJS0f+4UUerkRbMASM2OHA2LqfR/6CZfAc5gKCFNczlJnSHQj8SPUheUoko/jF6/Jeab8bOmO1+zTnTm5DR3omHwOc2vayeFZfj6O2TGMEM2US2bZSo7POM/xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.186])
	by gateway (Coremail) with SMTP id _____8CxqmqiCxtoIOHXAA--.28689S3;
	Wed, 07 May 2025 15:28:34 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.68.186])
	by front1 (Coremail) with SMTP id qMiowMBxn8WVCxtoGna5AA--.12969S5;
	Wed, 07 May 2025 15:28:29 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>
Cc: Huacai Chen <chenhuacai@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH v2 3/4] dt-bindings: mmc: loongson,ls2k-mmc: Add compatible for Loongson-2K2000
Date: Wed,  7 May 2025 15:28:07 +0800
Message-ID: <65c7d269776319ddfc951e94a2c4cc9bf572b75c.1746581751.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1746581751.git.zhoubinbin@loongson.cn>
References: <cover.1746581751.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMBxn8WVCxtoGna5AA--.12969S5
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoW7Wry7Cr4Dtr4DXw4ftr43Jwc_yoW8KF1xpa
	9xCw47Gr4jvF13urZ8Ga48Cw13ZrykA3ZrAFsrJr17GanxW34Yq343KF1Fqay3CrW0qFW7
	Zry8Cr45ua47CrcCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUk0b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I
	8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q6rW5McIj6I8E87Iv67AK
	xVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2Ij64
	vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8G
	jcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2I
	x0cI8IcVAFwI0_Gr0_Xr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK
	8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I
	0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUcCD7UUUUU

Add the devicetree compatible for Loongson-2K2000 EMMC/SD/SDIO controller.

Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 .../bindings/mmc/loongson,ls2k-mmc.yaml       | 47 ++++++++++++++++++-
 1 file changed, 45 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/mmc/loongson,ls2k-mmc.yaml b/Documentation/devicetree/bindings/mmc/loongson,ls2k-mmc.yaml
index 97a0853399f1..6130be214d3c 100644
--- a/Documentation/devicetree/bindings/mmc/loongson,ls2k-mmc.yaml
+++ b/Documentation/devicetree/bindings/mmc/loongson,ls2k-mmc.yaml
@@ -9,6 +9,9 @@ title: The SD/SDIO/eMMC host controller for Loongson-2K family SoCs
 description:
   The MMC host controller on the Loongson-2K0500/2K1000 (using an externally
   shared apbdma controller) provides the SD and SDIO device interfaces.
+  The two MMC host controllers on the Loongson-2K2000 are similar,
+  except that they use internal exclusive DMA. one controller provides
+  the eMMC interface and the other provides the SD/SDIO interface.
 
 maintainers:
   - Binbin Zhou <zhoubinbin@loongson.cn>
@@ -21,8 +24,10 @@ properties:
     enum:
       - loongson,ls2k0500-mmc
       - loongson,ls2k1000-mmc
+      - loongson,ls2k2000-mmc
 
   reg:
+    minItems: 1
     items:
       - description: Loongson-2K MMC controller registers.
       - description: APB DMA config register for Loongson-2K MMC controller.
@@ -44,11 +49,31 @@ required:
   - reg
   - interrupts
   - clocks
-  - dmas
-  - dma-names
 
 unevaluatedProperties: false
 
+if:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - loongson,ls2k0500-mmc
+          - loongson,ls2k1000-mmc
+
+then:
+  properties:
+    reg:
+      minItems: 2
+
+  required:
+    - dmas
+    - dma-names
+
+else:
+  properties:
+    reg:
+      maxItems: 1
+
 examples:
   - |
     #include <dt-bindings/gpio/gpio.h>
@@ -67,3 +92,21 @@ examples:
         bus-width = <4>;
         cd-gpios = <&gpio0 22 GPIO_ACTIVE_LOW>;
     };
+
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/clock/loongson,ls2k-clk.h>
+
+    mmc@79990000 {
+        compatible = "loongson,ls2k2000-mmc";
+        reg = <0x79990000 0x1000>;
+        interrupt-parent = <&pic>;
+        interrupts = <51 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&clk LOONGSON2_EMMC_CLK>;
+        bus-width = <8>;
+        non-removable;
+        cap-mmc-highspeed;
+        mmc-hs200-1_8v;
+        no-sd;
+        no-sdio;
+    };
-- 
2.47.1

