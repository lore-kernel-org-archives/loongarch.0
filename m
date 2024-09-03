Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CAA61581F8
	for <loongarch@lists.linux.dev>; Tue,  3 Sep 2024 01:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725328427; cv=none; b=NZg5OZWpRKIsfDu/Vy8llk4cXW+FpRy6Cm49MHGlqbn0EQe8lRbB4NpGbK+qYOy46wkf/sIMjOOZuWkr9qQompLgXoYDZ3JLDZJA7wjtEZITFT2mnDFFioU+67mxJIVyXkMAJEuqHB2sKUQAY/++xYtgnP+EtTGV8ENAGbaJWIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725328427; c=relaxed/simple;
	bh=EvHFZxR8lI+0dioSBkQb9HmMWv9zSBxynOIFR624PsY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=eMB8Q8I13wVavmSpu4m48aNr+RY+8DKBt/XvDqBJIveSyBEs0HtX2U8xBY09SKIRYGYZjA9hAVC00RQvm+0tYETwVZKOuKc73GDZUbWUmsyhk4jxBE2xxLqo84UNVBqKwAU60N1e72tUQRsBZPm1zUMzp9RMcw4KzcBYElFMPmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.40.54.90])
	by gateway (Coremail) with SMTP id _____8CxrpsibNZmnr4oAA--.53362S3;
	Tue, 03 Sep 2024 09:53:38 +0800 (CST)
Received: from localhost.localdomain (unknown [10.40.54.90])
	by front2 (Coremail) with SMTP id qciowMDxvscdbNZmRXYEAA--.13550S3;
	Tue, 03 Sep 2024 09:53:36 +0800 (CST)
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
Subject: [PATCH v2 1/2] dt-bindings: EDAC for ls3a5000 memory controller
Date: Tue,  3 Sep 2024 09:53:53 +0800
Message-Id: <20240903015354.9443-2-zhaoqunqin@loongson.cn>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20240903015354.9443-1-zhaoqunqin@loongson.cn>
References: <20240903015354.9443-1-zhaoqunqin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qciowMDxvscdbNZmRXYEAA--.13550S3
X-CM-SenderInfo: 52kd01pxqtx0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoW7urWkuFW7Jw1UuF1Utry3ZFc_yoW8KF18pr
	s3Aan3Kr18K3W7AanYqa48A3WFq34kZ3W7XFsrK3W7KryDWasYvFyYkryUJa15JFykXFW5
	ZFySgr42kFsFkabCm3ZEXasCq-sJn29KB7ZKAUJUUUU7529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUBYb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Gr0_Gr1UM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYI
	kI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUtVWr
	XwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI4
	8JMxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j
	6r4UMxCIbckI1I0E14v26r1Y6r17MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwV
	AFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv2
	0xvE14v26r4j6ryUMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4
	v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AK
	xVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU8EPfPUUUUU==

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

