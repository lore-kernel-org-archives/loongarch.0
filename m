Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35A441EF372
	for <loongarch@lists.linux.dev>; Thu, 10 Apr 2025 08:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744274477; cv=none; b=Jl1sxQBHReF9Etg0IyctNpMjmcCV5wNiCMptAwq/8cZcpEXA8oReyqD17LKrdpLx+eAQZRFGumKMOu3JTkJTfAZ6DF4uXFRBN6jt2o8c6bY7ZJPbp+n0RUc65xU0nP+b+5rVQi4/mp7coQ39t0EPq6lblPTCAKQ+PBY0MO43JlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744274477; c=relaxed/simple;
	bh=kmU4BvN9VTUIS1WmqzIwVvOKepgCowkKHbHDBQpPbIo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BXwm3bl59r/cTFul3jgj+DjxNuK3kqrCfWjHKdeuSE/4NSnjEK5oPvAsfGfJrPrwpzKUen/uOsBdrDNqx2wTa2hkQNQbelha/KCwNRE/X3VbEPRBR2N/F6q3i4laM/SmteB/8p5ztdLEQx+AUgn4S/xR5BTYVoaVPkVDQLTYGm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.198])
	by gateway (Coremail) with SMTP id _____8DxvnMkhPdnsri2AA--.9472S3;
	Thu, 10 Apr 2025 16:41:08 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.68.198])
	by front1 (Coremail) with SMTP id qMiowMDxH+UQhPdnGrJ3AA--.30039S5;
	Thu, 10 Apr 2025 16:41:06 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>
Cc: Huacai Chen <chenhuacai@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH v1 3/4] dt-bindings: mmc: loongson,ls2k-mmc: Add compatible for Loongson-2K2000
Date: Thu, 10 Apr 2025 16:40:37 +0800
Message-ID: <cefcd16d303936247b94bc13047c8a1861bb8330.1744273956.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1744273956.git.zhoubinbin@loongson.cn>
References: <cover.1744273956.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMDxH+UQhPdnGrJ3AA--.30039S5
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoW7Wry7Cr4Dtr4DXw4ftr43Jwc_yoW8tF45pF
	ZxCa17Jr4qvF13u39xGa48Cw1fZ34kA3ZrJFsrAFnrG3ZxW3WYqw13KFyFqFy3CrW0qFW7
	Zry0kr45uasrCrcCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkjb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4
	xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jw0_WrylYx0Ex4A2jsIE14v2
	6r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x0EwI
	xGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480
	Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7
	IYx2IY67AKxVW8JVW5JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k2
	6cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxV
	AFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07josjUUUUUU=

Add the devicetree compatible for Loongson-2K2000 EMMC/SD/SDIO controller.

Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 .../bindings/mmc/loongson,ls2k-mmc.yaml       | 47 ++++++++++++++++++-
 1 file changed, 45 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/mmc/loongson,ls2k-mmc.yaml b/Documentation/devicetree/bindings/mmc/loongson,ls2k-mmc.yaml
index f3e94f5f3a35..24d217a9bbe6 100644
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
     maxItems: 2
 
   interrupts:
@@ -42,11 +47,31 @@ required:
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
@@ -65,3 +90,21 @@ examples:
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

