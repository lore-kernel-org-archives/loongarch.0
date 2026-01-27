Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F4F31F3D56
	for <loongarch@lists.linux.dev>; Tue, 27 Jan 2026 02:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769482103; cv=none; b=Ac/gVDcz+niZIye2d+VqGmOY0ynPZHpmzU9M35NgDqW/sx5YOFjTsiAgO9ReieAq1IPMGBOPTXgJbj6dfWKB4woGQiz156qJ0TUUpPLALbopmsU3J6qOz8AbktVLvOtljp2MTHG/d/filkpLz3qDh1d9Rm1aFxfJP1y8F9DkhH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769482103; c=relaxed/simple;
	bh=4yQQFdO+BmzOQwKmp//pjMtarcuNliXPQ5tUWpcZNXY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uzdwQ7XQN9QAsXjlquXz6EWJJLzvEB4GAxYjaDZ81OsB1kYEL6fs2AgmsIFjwwHTgBPdfxnCn7HrqeKz3uQ0MEZP25N3luuqgjeSpTpPZ3sSXudQ8UQHpm6xk6op/n+KENn4di54wkkyUPujylUC/4SyJoXnmSrFfIcJQAM1nrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.69.42])
	by gateway (Coremail) with SMTP id _____8Axy8JsJ3hpaPsMAA--.41881S3;
	Tue, 27 Jan 2026 10:48:12 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.69.42])
	by front1 (Coremail) with SMTP id qMiowJCxWeBnJ3hpPJEzAA--.36583S3;
	Tue, 27 Jan 2026 10:48:12 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andy Shevchenko <andy@kernel.org>,
	linux-i2c@vger.kernel.org
Cc: Huacai Chen <chenhuacai@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	devicetree@vger.kernel.org,
	Binbin Zhou <zhoubinbin@loongson.cn>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 1/2] dt-bindings: i2c: loongson,ls2x: Add ls2k0300-i2c compatible
Date: Tue, 27 Jan 2026 10:47:56 +0800
Message-ID: <8ba86d2daf43527ee41795b86ea0411a3ea19b2f.1769476820.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1769476820.git.zhoubinbin@loongson.cn>
References: <cover.1769476820.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJCxWeBnJ3hpPJEzAA--.36583S3
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/1tbiAgEACGl3Ah0TuAAAsh
X-Coremail-Antispam: 1Uk129KBj93XoWrtFWkCrW3Gr48uF1xXr18Zwc_yoW8JrWrpF
	nxC3s8Gr10qF13W398ta48Cw1Yvr9Yy3ZrGFs7tr17KF4DJw4UXw13Krn8Xw45uryvvFW3
	XrZ7Kr4UCas7ZrcCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkFb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
	Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ex4A2jsIE
	14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x
	0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E
	7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcV
	C0I7IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF
	04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7
	CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07j83kZUUUUU=

Add "loongson,ls2k0300-i2c" dedicated compatible for representing I2C of
Loongson-2K0300 chip, because its HW integration is quiet different from
others.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 .../bindings/i2c/loongson,ls2x-i2c.yaml           | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/loongson,ls2x-i2c.yaml b/Documentation/devicetree/bindings/i2c/loongson,ls2x-i2c.yaml
index 67882ec6e06a..4c381559f7f0 100644
--- a/Documentation/devicetree/bindings/i2c/loongson,ls2x-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/loongson,ls2x-i2c.yaml
@@ -16,6 +16,7 @@ properties:
   compatible:
     enum:
       - loongson,ls2k-i2c
+      - loongson,ls2k0300-i2c
       - loongson,ls7a-i2c
 
   reg:
@@ -24,6 +25,9 @@ properties:
   interrupts:
     maxItems: 1
 
+  clocks:
+    maxItems: 1
+
 required:
   - compatible
   - reg
@@ -31,6 +35,17 @@ required:
 
 unevaluatedProperties: false
 
+if:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - loongson,ls2k0300-i2c
+
+then:
+  required:
+    - clocks
+
 examples:
   - |
     #include <dt-bindings/interrupt-controller/irq.h>
-- 
2.47.3

