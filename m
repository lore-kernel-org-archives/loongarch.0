Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D664D19004A
	for <loongarch@lists.linux.dev>; Sat, 11 Apr 2026 09:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775901526; cv=none; b=ARJyP3w+HWDbWCeNIpbckLik99S2GvI0nTATCn9tscH6pmterS5zIe9TuCcJzPpzWs1RthLw1umAgjUx2kyWaSHumZKwqca5cg1L4m0C3brjL/lwuDjvCgHk0ZJK8S6pyP5bddAh+s6qxgxLMaTtXpXJnkyrQid8kTEVN0CM1/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775901526; c=relaxed/simple;
	bh=PPfxXjMHw9jGQGGAVbT6dND4axtA3hBVLdET3eOhLiI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j14r8OYWLXk4Zaw8dKyrJ3K5dXqcJ+5euOq2doE6GD/gP3R/iPL4joY6k/xaSuJBB0Znqg+M5oeAHfpm8DqsbsfGAwrQrInjUrPYrAOHYQp/dyAlc1OpUOGr0r3n+oAEBKLn60PmjFcM6e6J8IoRRM1Fk0nukLcrDpIrPNxRl10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.17])
	by gateway (Coremail) with SMTP id _____8BxMKtQG9ppEUYkAA--.1992S3;
	Sat, 11 Apr 2026 17:58:40 +0800 (CST)
Received: from kernelserver (unknown [223.64.68.17])
	by front1 (Coremail) with SMTP id qMiowJAxGMFLG9ppx_NqAA--.58577S3;
	Sat, 11 Apr 2026 17:58:39 +0800 (CST)
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
Subject: [PATCH v7 1/2] dt-bindings: i2c: loongson,ls2x: Add ls2k0300-i2c compatible
Date: Sat, 11 Apr 2026 17:58:24 +0800
Message-ID: <0869383d3297d480456b950c57a3700789b57057.1775900045.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1775900045.git.zhoubinbin@loongson.cn>
References: <cover.1775900045.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJAxGMFLG9ppx_NqAA--.58577S3
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/1tbiAQEOCGnZ4sgB0AAAsN
X-Coremail-Antispam: 1Uk129KBj9xXoWrtFWkJr4UtrWfGr4fCF1DCFX_yoWDtFbEka
	4Iqw1xJrs8AF1Fgw1qvr4xKrnxXa9Fy3Wku3WDJF4kAw1Utrn8tF97J3sxK34fXrZxuF13
	Wa1kGr1Iva17GosvyTuYvTs0mTUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUb7xYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_JF0_JFyl8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwA2z4x0Y4vEx4A2jsIE14v26r4j6F4UM28EF7xvwVC2z280aVCY1x0267AKxVW8
	JVW8Jr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4
	xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ex4A2jsIE14v2
	6r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x0EwI
	xGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480
	Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7
	IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k2
	6cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxV
	AFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jea0PUUUUU=

Add "loongson,ls2k0300-i2c" dedicated compatible for representing I2C of
Loongson-2K0300 chip, because its HW integration is quiet different from
others.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Huacai Chen <chenhuacai@loongson.cn>
Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 Documentation/devicetree/bindings/i2c/loongson,ls2x-i2c.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/loongson,ls2x-i2c.yaml b/Documentation/devicetree/bindings/i2c/loongson,ls2x-i2c.yaml
index 67882ec6e06a..ee09c6d9c5f0 100644
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
-- 
2.52.0

