Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFCE024A06D
	for <loongarch@lists.linux.dev>; Fri, 19 Dec 2025 08:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766134055; cv=none; b=bZqSHuKh6BlkvXTdMWSOh8L8O9kZe1N+j2hy3FfWdQ2TdVsraJigjhbo+BMtBX+khYvZbR/Yb5wIWEfsuMsiE1BmKzl6/lyohPVmdL3jryJ1MN2+ksbcGIj921tOZtHWGZMw4F+P/mnZ5EV95S0uunHsWmM/uG+84QQzHNtSjRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766134055; c=relaxed/simple;
	bh=GVGCPDSftlYdIUmbR+1AljgDAX2zsvOjm8zcyVHyRGw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XXRJu5t16yNZOd9z5ndz9VwhGMhnrPMYfWenF/MaUI+lIzFwzwUwHQKgPN5w01SIuktoBoPY8qDF7fkCA85sbOf1bkpttwXo4oBOradljnFs2GA/E20gGFM4nmAGXqy850Vlsd6OgP+F54254QGdWCkNDvfrtWsTIduXwL0dwjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.69.54])
	by gateway (Coremail) with SMTP id _____8DxPMMVEUVpg8cAAA--.2544S3;
	Fri, 19 Dec 2025 16:47:17 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.69.54])
	by front1 (Coremail) with SMTP id qMiowJBxSeADEUVpAbQBAA--.6444S4;
	Fri, 19 Dec 2025 16:47:11 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Yao Zi <me@ziyao.cc>,
	Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Huacai Chen <chenhuacai@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	devicetree@vger.kernel.org,
	Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH v2 2/7] dt-bindings: interrupt-controller: loongson,pch-pic: Change to unevaluatedProperties
Date: Fri, 19 Dec 2025 16:46:49 +0800
Message-ID: <7a0df6f836e0ec7ddfe4d592c10259c87ef96e4f.1766037997.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1766037997.git.zhoubinbin@loongson.cn>
References: <cover.1766037997.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJBxSeADEUVpAbQBAA--.6444S4
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/1tbiAgEBCGlE6RgD1QAAsA
X-Coremail-Antispam: 1Uk129KBj93XoW7uF17ur4fKFW7AFWftr1fGrX_yoW8CF1rpF
	ZxCwsrWF48tr13A3yvqa4vkrnxZF9xAwn7CwsFyw47GrsFq342qr43KFn5Ja1rGrn7Xa47
	WryF93W0qF13AabCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUk2b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r126r13M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q6rW5McIj6I8E87Iv
	67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2
	Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s02
	6x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0x
	vE2Ix0cI8IcVAFwI0_Gr0_Xr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE
	42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6x
	kF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUco7KUUUUU

Change additionalProperties to unevaluatedProperties because it refs to
interrupt-controller.yaml.

Fix below CHECK_DTBS warnings:
arch/loongarch/boot/dts/loongson-2k2000-ref.dtb: interrupt-controller@10000000 (loongson,pch-pic-1.0): '#address-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
        from schema $id: http://devicetree.org/schemas/interrupt-controller/loongson,pch-pic.yaml

Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 .../interrupt-controller/loongson,pch-pic.yaml         | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/loongson,pch-pic.yaml b/Documentation/devicetree/bindings/interrupt-controller/loongson,pch-pic.yaml
index b7bc5cb1dff2..cf235ca57a2f 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/loongson,pch-pic.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/loongson,pch-pic.yaml
@@ -14,6 +14,9 @@ description:
   transforming interrupts from on-chip devices into HyperTransport vectorized
   interrupts.
 
+allOf:
+  - $ref: /schemas/interrupt-controller.yaml#
+
 properties:
   compatible:
     const: loongson,pch-pic-1.0
@@ -34,14 +37,18 @@ properties:
   '#interrupt-cells':
     const: 2
 
+  '#address-cells':
+    const: 0
+
 required:
   - compatible
   - reg
   - loongson,pic-base-vec
   - interrupt-controller
   - '#interrupt-cells'
+  - '#address-cells'
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
@@ -50,6 +57,7 @@ examples:
       compatible = "loongson,pch-pic-1.0";
       reg = <0x10000000 0x400>;
       interrupt-controller;
+      #address-cells = <0>;
       #interrupt-cells = <2>;
       loongson,pic-base-vec = <64>;
       interrupt-parent = <&htvec>;
-- 
2.47.3

