Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B821633A9DB
	for <loongarch@lists.linux.dev>; Sat, 21 Mar 2026 09:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774085226; cv=none; b=sZ/VXDkiB45RAE/bMy0Gafb6IlABRLWButmntA6dpZXqnlhMqGRB0g8ccrotsknBQb9jyJuaUUOmMAyNQmvZlqVf1/0XTkE/wYHuYtgr9vM3llQqtKczPYCBqirLJZhRxxClrplTvw/3z4wYB523t/EGDSUykkKg2nB9grNkXQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774085226; c=relaxed/simple;
	bh=eF44SUi5zfXz7DKjdWLusMD+wNgC82cI6OdzfwtX46E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AUe8Xx5/S/D1l0Mo5Y1qb1W3AIb/ww/kjmR2MeK+I/6V1utm6zyuriEpxwTkOZX34RoSpM1X2a3wzeiHUAav0Ohqg2LpIL46IxrurZpkzxBtyAy0ouMdtIFgPlOifzYhgwoKQBwK3QFwT93TT1qEXgcLac+/7MPz8dfmaamvUcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from edelgard.fodlan.icenowy.me (unknown [112.94.102.202])
	by APP-01 (Coremail) with SMTP id qwCowAA33mnjYr5p3aWyCg--.465S5;
	Sat, 21 Mar 2026 17:20:40 +0800 (CST)
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
Subject: [PATCH v4 3/6] dt-bindings: interrupt-controller: add LS7A PCH LPC
Date: Sat, 21 Mar 2026 17:20:29 +0800
Message-ID: <20260321092032.3502701-4-zhengxingda@iscas.ac.cn>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260321092032.3502701-1-zhengxingda@iscas.ac.cn>
References: <20260321092032.3502701-1-zhengxingda@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qwCowAA33mnjYr5p3aWyCg--.465S5
X-Coremail-Antispam: 1UD129KBjvJXoW7tr15XrW7Ar47Wr17Kw4rXwb_yoW8ZFyrpF
	45C3ZxWF40qF13C39Yga40kFnxZr95ArnxCws7tw47Gr9Fga45X3yakF95Xa1fGr9rXay7
	ZFyF93W0gw17JF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUmY14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JrWl82xGYIkIc2
	x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UM2
	8EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS
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

