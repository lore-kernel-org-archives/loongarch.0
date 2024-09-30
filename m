Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 195A83BB48
	for <loongarch@lists.linux.dev>; Mon, 30 Sep 2024 03:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727667107; cv=none; b=FzQKyxQ80NBhHhyyZKv/VeC7IIYkPSf9eq+UzLl1k6EyzE+KFwavo/3XjxdjALvfpgdDoLzwBEsV/J64yVzRBOwFluB+URkaOEUzH4nvcxqwoewtDlEP21Fr9AChEAE0HLi+mMxSPVi5TRXwuFc6uoM4YPnbJe9YL6kA6sqUgI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727667107; c=relaxed/simple;
	bh=bdft0GveiJOgmlwiqu80tDEqUiGpXv4NyBkfkR8QmsQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=doRd5DRR0IAkJ92uXt01PWB9K8QFxlpKMlDHVrSegtIUGQRPHvpo8ImoE7XQ2NPwmIAkCqmVFf87nyvu9QEQ3vLY7iZwcmDxqG9FgB/gZxNRCxJSrQ/IR+eOAbAM4LAUdvu2hhJyrTC2WQoBjAXxN56+xCs9vMYuPsYBXXejH5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.40.54.90])
	by gateway (Coremail) with SMTP id _____8Dxn_GdG_pmq18EAA--.8832S3;
	Mon, 30 Sep 2024 11:31:41 +0800 (CST)
Received: from localhost.localdomain (unknown [10.40.54.90])
	by front2 (Coremail) with SMTP id qciowMCxbceZG_pmD9gYAA--.23677S3;
	Mon, 30 Sep 2024 11:31:39 +0800 (CST)
From: Zhao Qunqin <zhaoqunqin@loongson.cn>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	chenhuacai@kernel.org,
	bp@alien8.de,
	tony.luck@intel.com,
	james.morse@arm.com,
	mchehab@kernel.org,
	rric@kernel.org
Cc: linux-edac@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel@xen0n.name,
	loongarch@lists.linux.dev,
	Jonathan.Cameron@Huawei.com,
	Zhao Qunqin <zhaoqunqin@loongson.cn>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v6 1/2] dt-bindings: EDAC for ls3a5000 memory controller
Date: Mon, 30 Sep 2024 11:29:42 +0800
Message-Id: <20240930032943.5182-2-zhaoqunqin@loongson.cn>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20240930032943.5182-1-zhaoqunqin@loongson.cn>
References: <20240930032943.5182-1-zhaoqunqin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qciowMCxbceZG_pmD9gYAA--.23677S3
X-CM-SenderInfo: 52kd01pxqtx0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoWxWw1rtrW7ZFyrGw4ruF17Arc_yoW5GFWrpr
	s3Aan7Kry8t3W7Aan5XFyxAa1Fqw1kZ3W7XFs7Kw13KryDWa4FvFyYkryUXan8JrykXFW5
	ZFySgr42kFsFkwcCm3ZEXasCq-sJn29KB7ZKAUJUUUU3529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUB2b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1ln4kS14v26r126r1DM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12
	xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q
	6rW5McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64
	vIr41lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_
	Jr0_Gr1l4IxYO2xFxVAFwI0_JF0_Jw1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8Gjc
	xK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0
	cI8IcVAFwI0_Xr0_Ar1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8V
	AvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E
	14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxU4YLvDUUUU

add device tree bindings for ls3a5000 EDAC driver.

Signed-off-by: Zhao Qunqin <zhaoqunqin@loongson.cn>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
Changes form v5 to v6:
	- None

Changes in v4:
	- Added tag from Krzysztof (thanks!)

Changes in v3:
	- None

Changes in v2:
	- Fixed the errors raised by Rob
	- Addressed review comments raised by Krzysztof and Conor

 .../edac/loongson,ls3a5000-mc-edac.yaml       | 44 +++++++++++++++++++
 MAINTAINERS                                   |  6 +++
 2 files changed, 50 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/edac/loongson,ls3a5000-mc-edac.yaml

diff --git a/Documentation/devicetree/bindings/edac/loongson,ls3a5000-mc-edac.yaml b/Documentation/devicetree/bindings/edac/loongson,ls3a5000-mc-edac.yaml
new file mode 100644
index 000000000..52f10bc94
--- /dev/null
+++ b/Documentation/devicetree/bindings/edac/loongson,ls3a5000-mc-edac.yaml
@@ -0,0 +1,44 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/edac/loongson,ls3a5000-mc-edac.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Loongson Memory Controller EDAC
+
+maintainers:
+  - Zhao Qunqin <zhaoqunqin@loongson.cn>
+
+description: |
+  EDAC node is defined to describe on-chip error detection and correction for
+  Loongson Memory Controller.
+
+properties:
+  compatible:
+    oneOf:
+      - enum:
+          - loongson,ls3a5000-mc-edac
+      - items:
+          - enum:
+              - loongson,ls3c5000l-mc-edac
+              - loongson,ls3c5000-mc-edac
+              - loongson,ls3d5000-mc-edac
+              - loongson,ls3a6000-mc-edac
+              - loongson,ls3c6000-mc-edac
+          - const: loongson,ls3a5000-mc-edac
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    memory-controller@1fe00600 {
+        compatible = "loongson,ls3a5000-mc-edac";
+        reg = <0x1fe00600 0x50>;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 42decde38..6cc8cfc8f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13237,6 +13237,12 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/thermal/loongson,ls2k-thermal.yaml
 F:	drivers/thermal/loongson2_thermal.c
 
+LOONGSON EDAC DRIVER
+M:	Zhao Qunqin <zhaoqunqin@loongson.cn>
+L:	linux-edac@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/edac/loongson,ls3a5000-mc-edac.yaml
+
 LSILOGIC MPT FUSION DRIVERS (FC/SAS/SPI)
 M:	Sathya Prakash <sathya.prakash@broadcom.com>
 M:	Sreekanth Reddy <sreekanth.reddy@broadcom.com>
-- 
2.43.0

