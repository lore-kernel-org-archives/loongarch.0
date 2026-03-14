Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09D6A2580CF
	for <loongarch@lists.linux.dev>; Sat, 14 Mar 2026 16:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773505750; cv=none; b=OBgPO//lAe2VZcUce1IO3fMwTjBvTE/jaHUZx5jf8OcnDkC2PFJaYuG2IxMdWgW+V+o4M6IwjOL+Wrw05mAg6d2xH31F+H31ALWrSs6VYFdnARuLr7BfUU9W3DFEZXf4I+/9Q98QVfNZV6JQmNrhhb4Ru88GXJ3+Uf053XR36wE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773505750; c=relaxed/simple;
	bh=2e5Lu9J3BOI3wAKN3cpt0gtB6i25xcA42yATWTMpBlM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EiHF/r761aBrAQvY9ByXlatFgfgjd0F/X5/MlBQDNyhpSK8pan0LJdBo5PH/7oMMNfudWOEFu8hhkW5QGQg/N2Q3/in6UofGWcX/O37iLeKHIwISILTA1Zoav2mWiqH881iTEv0eCHEbFgtaa8fDGQPLtAxnMLKDLqd7oNxf7c8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from edelgard.fodlan.icenowy.me (unknown [112.94.100.43])
	by APP-03 (Coremail) with SMTP id rQCowAB3ktmwjLVpHpqpCg--.41252S5;
	Sun, 15 Mar 2026 00:28:50 +0800 (CST)
From: Icenowy Zheng <zhengxingda@iscas.ac.cn>
To: Thomas Gleixner <tglx@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: Icenowy Zheng <uwu@icenowy.me>,
	Yao Zi <me@ziyao.cc>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org,
	Icenowy Zheng <zhengxingda@iscas.ac.cn>
Subject: [PATCH v3 3/8] dt-bindings: interrupt-controller: add LS7A PCH LPC
Date: Sun, 15 Mar 2026 00:28:23 +0800
Message-ID: <20260314162828.1055188-4-zhengxingda@iscas.ac.cn>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260314162828.1055188-1-zhengxingda@iscas.ac.cn>
References: <20260314162828.1055188-1-zhengxingda@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowAB3ktmwjLVpHpqpCg--.41252S5
X-Coremail-Antispam: 1UD129KBjvJXoW7tr15XrW7Ar47tr1DWr1kuFg_yoW8ur1fpF
	45C3ZxWF40qF13C39Yga40kFnxZr98ArnxCws7tw47Gr9Fga45XrWakF95X3WfCr9rXa47
	ZFyF93W0g347JF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUmY14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JrWl82xGYIkIc2
	x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UM2
	8EF7xvwVC2z280aVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4j6r4UJwAS
	0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2
	IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0
	Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2kIc2
	xKxwCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWU
	JVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67
	kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY
	6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42
	IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIev
	Ja73UjIFyTuYvjfUO_MaUUUUU
X-CM-SenderInfo: x2kh0wp0lqwv3d6l2u1dvotugofq/

Loongson 7A series PCH contains an LPC controller with an interrupt
controller.

Add the device tree binding for the interrupt controller.

Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../loongson,pch-lpc.yaml                     | 52 +++++++++++++++++++
 1 file changed, 52 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/loongson,pch-lpc.yaml

diff --git a/Documentation/devicetree/bindings/interrupt-controller/loongson,pch-lpc.yaml b/Documentation/devicetree/bindings/interrupt-controller/loongson,pch-lpc.yaml
new file mode 100644
index 0000000000000..ff2a425b6f0b8
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/loongson,pch-lpc.yaml
@@ -0,0 +1,52 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/interrupt-controller/loongson,pch-lpc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Loongson PCH LPC Controller
+
+maintainers:
+  - Jiaxun Yang <jiaxun.yang@flygoat.com>
+
+description:
+  This interrupt controller is found in the Loongson LS7A family of PCH for
+  accepting interrupts sent by LPC-connected peripherals and signalling PIC
+  via a single interrupt line when interrupts are available.
+
+properties:
+  compatible:
+    const: loongson,ls7a-lpc
+
+  reg:
+    maxItems: 1
+
+  interrupt-controller: true
+
+  interrupts:
+    maxItems: 1
+
+  '#interrupt-cells':
+    const: 2
+
+required:
+  - compatible
+  - reg
+  - interrupt-controller
+  - interrupts
+  - '#interrupt-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    lpc: interrupt-controller@10002000 {
+      compatible = "loongson,ls7a-lpc";
+      reg = <0x10002000 0x400>;
+      interrupt-controller;
+      #interrupt-cells = <2>;
+      interrupt-parent = <&pic>;
+      interrupts = <19 IRQ_TYPE_LEVEL_HIGH>;
+    };
+...
-- 
2.52.0

