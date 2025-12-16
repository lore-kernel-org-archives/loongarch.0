Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB1C721D3CD
	for <loongarch@lists.linux.dev>; Tue, 16 Dec 2025 07:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765871732; cv=none; b=d1vanFDNG4Jjkkf1SC6SOUcBcgeEB0712i6ZUosyU+bfpJ24XQTQKTft4/+Wd9FQXlNe4xB9SmcDbRsYLPk1yd9IwUhIz6ONP1RTO3P9UbV7VKgv+UiuCc9Py34LAEdFTsfmTGLFSkaTWhY1P7PxXg97ast4spe4NdOngKLVL7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765871732; c=relaxed/simple;
	bh=Ranov5WkdhKt/AcBPVQLvk1R6YbGP25uilNGYH/3oq0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EyrB9VP/nOey2nyeA/RbG0Px3nV7ik85poVblAjWz8dnlL8WeIhRdYBjRHvVIpRmVtCPe/9OpS03uZfJ1lJ/c+pjSi+2B0E9AsMzYOQ2P98eiS8bAWtdq0/zmKq05jVURCBTUfAcPoUs/NVjaUbJIF5/gE0pF2e5JU8/42o0YUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.219])
	by gateway (Coremail) with SMTP id _____8Dx+tFuEEFp45cuAA--.36125S3;
	Tue, 16 Dec 2025 15:55:26 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.68.219])
	by front1 (Coremail) with SMTP id qMiowJCxWeBqEEFpU2EAAA--.2306S2;
	Tue, 16 Dec 2025 15:55:25 +0800 (CST)
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
Subject: [PATCH 2/7] dt-bindings: interrupt-controller: loongson,pch-pic: Change to unevaluatedProperties
Date: Tue, 16 Dec 2025 15:55:13 +0800
Message-ID: <db24b6366bb0d49e9dcc04328ffad7a37f687a89.1765778124.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1765778124.git.zhoubinbin@loongson.cn>
References: <cover.1765778124.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJCxWeBqEEFpU2EAAA--.2306S2
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/1tbiAgESCGlA9JgB4gABs+
X-Coremail-Antispam: 1Uk129KBj93XoW7uF17ur4xZw4DXw18ZFyfZrc_yoW8XrW8pF
	W3CanrWF4UtF13C3y0qa4vkrnxZF9xAwn29anrtw47GrsFq343Xr13Kr95ta1rGrZ7Xa47
	WryF93W0qF13JFcCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkIb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAF
	wI0_Gr1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI
	0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUtVWrXwAv7VC2z280
	aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw28Icx
	kI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2Iq
	xVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42
	IY6xIIjxv20xvE14v26r4j6ryUMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY
	6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aV
	CY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU84xRDUUUUU==

Change additionalProperties to unevaluatedProperties because it refs to
interrupt-controller.yaml.

Fix below CHECK_DTBS warnings:
arch/loongarch/boot/dts/loongson-2k2000-ref.dtb: interrupt-controller@10000000 (loongson,pch-pic-1.0): '#address-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
        from schema $id: http://devicetree.org/schemas/interrupt-controller/loongson,pch-pic.yaml

Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 .../bindings/interrupt-controller/loongson,pch-pic.yaml      | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/loongson,pch-pic.yaml b/Documentation/devicetree/bindings/interrupt-controller/loongson,pch-pic.yaml
index b7bc5cb1dff2..1f818316082e 100644
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
@@ -41,7 +44,7 @@ required:
   - interrupt-controller
   - '#interrupt-cells'
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
-- 
2.47.3

