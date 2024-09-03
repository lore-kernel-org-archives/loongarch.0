Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAD071A42D8
	for <loongarch@lists.linux.dev>; Tue,  3 Sep 2024 11:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725364016; cv=none; b=Op/3G1KUnnIRMLMr6We361ZuZvYGOzchqp/UuPHhL7pRi/3kV4U+hMRgrH6gXwoX5XQRHWJxGhuWT6XztBh/wEr0fj+Rq2xSZG/cAjL1Do5sSYkqiAOwf/hUw7zZrfGJzcHeThQqBTgskJB139/0D7y414x6TFjLQgWRuzWgd38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725364016; c=relaxed/simple;
	bh=EvHFZxR8lI+0dioSBkQb9HmMWv9zSBxynOIFR624PsY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CQdm5KkQvbnG0oDWHMCT53m4AMThD1NCtEiiJPXLTEbUHOZAunxPxQpegF3QFdM89DL/atTrw3fgLXRo7FFU3gQ+jdYRVy2Sch/svFUn3gvAZmXpWIinlT5OgkpEJj3CTgYWVJ6gPTMiMzmlnHxHrRE62Fu9w25xvxXc5e+kLZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.40.54.90])
	by gateway (Coremail) with SMTP id _____8Bxmpot99ZmLSUpAA--.43411S3;
	Tue, 03 Sep 2024 19:46:53 +0800 (CST)
Received: from localhost.localdomain (unknown [10.40.54.90])
	by front2 (Coremail) with SMTP id qciowMAxvsUr99ZmONYEAA--.13062S3;
	Tue, 03 Sep 2024 19:46:53 +0800 (CST)
From: Zhao Qunqin <zhaoqunqin@loongson.cn>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	chenhuacai@kernel.org
Cc: linux-edac@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel@xen0n.name,
	bp@alien8.de,
	tony.luck@intel.com,
	james.morse@arm.com,
	mchehab@kernel.org,
	rric@kernel.org,
	loongarch@lists.linux.dev,
	Zhao Qunqin <zhaoqunqin@loongson.cn>
Subject: [PATCH V3 1/2] dt-bindings: EDAC for ls3a5000 memory controller
Date: Tue,  3 Sep 2024 19:47:13 +0800
Message-Id: <20240903114714.11428-2-zhaoqunqin@loongson.cn>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20240903114714.11428-1-zhaoqunqin@loongson.cn>
References: <20240903114714.11428-1-zhaoqunqin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qciowMAxvsUr99ZmONYEAA--.13062S3
X-CM-SenderInfo: 52kd01pxqtx0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoW7urWkuFW7Jw1UuF1Utry3ZFc_yoW8KF18pr
	s3Aan3Kr18K3W7AanYqa48A3WFq34kZ3W7XFsrK3W7KryDWasYvFyYkryUJa15JFykXFW5
	ZFySgr42kFsFkabCm3ZEXasCq-sJn29KB7ZKAUJUUUUd529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUBmb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAF
	wI0_Gr1j6F4UJwAaw2AFwI0_Jw0_GFyle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2
	xF0cIa020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_
	Wrv_ZF1lYx0Ex4A2jsIE14v26F4j6r4UJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2
	Ij64vIr41lc7CjxVAaw2AFwI0_GFv_Wryl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Y
	z7v_Jr0_Gr1l4IxYO2xFxVAFwI0_Jw0_GFylx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x
	8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE
	2Ix0cI8IcVAFwI0_Xr0_Ar1lIxAIcVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwCI42IY6x
	AIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Cr0_Gr1UMIIF0xvEx4A2jsIE
	c7CjxVAFwI0_Gr1j6F4UJbIYCTnIWIevJa73UjIFyTuYvjxUhGNtUUUUU

add device tree bindings for ls3a5000 EDAC driver.

Signed-off-by: Zhao Qunqin <zhaoqunqin@loongson.cn>
---
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

