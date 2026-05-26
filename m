Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A18203AB28E
	for <loongarch@lists.linux.dev>; Tue, 26 May 2026 03:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779765098; cv=none; b=rnXBzwPqRH7YMZF5x0yK768iTqS06rR7bhXqI/jW7H06cYIQCIHCPHzvK/5zpPSBEt+aPmR6AYgQVj85RVaJti3Dhk04YqShf539LKPOgHLqwLt4XnUafcU9G2D0Eejcz4KPqtQL53FhTTx4EN3s2dHnpjb1BvhRGir9s9kQTpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779765098; c=relaxed/simple;
	bh=iat2BungkSJorLGPQ6vTXR2vubaLdM7rlijKwZgCRfs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nxJhNC/gO3d3UOBC4zxZpSa8PKQpG5ublonbN1/AkBmSorpj7zt1BNZ/lZjnsIo2yWbdU+z5gg+lUCd02Quy2VotCvR5Ui9fpRz3k8eGK5E649UakL5eQi3b/qypypLxrdH4x8MXgFnPWBKtOEoygl09ZcQ3V8LI7nXldVyX57Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.42.101])
	by gateway (Coremail) with SMTP id _____8BxEutgDxVq2UENAA--.37963S3;
	Tue, 26 May 2026 11:11:28 +0800 (CST)
Received: from loongson-pc.loongson.cn (unknown [10.20.42.101])
	by front1 (Coremail) with SMTP id qMiowJAxXcJaDxVq10SRAA--.10437S3;
	Tue, 26 May 2026 11:11:27 +0800 (CST)
From: Hongliang Wang <wanghongliang@loongson.cn>
To: Binbin Zhou <zhoubinbin@loongson.cn>,
	Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Hongliang Wang <wanghongliang@loongson.cn>
Cc: linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	loongarch@lists.linux.dev
Subject: [PATCH v4 1/2] dt-bindings: i2c: ls2x-i2c: Add clocks and clock-frequency properties
Date: Tue, 26 May 2026 11:10:20 +0800
Message-Id: <20260526031021.32662-2-wanghongliang@loongson.cn>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20260526031021.32662-1-wanghongliang@loongson.cn>
References: <20260526031021.32662-1-wanghongliang@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJAxXcJaDxVq10SRAA--.10437S3
X-CM-SenderInfo: pzdqwxxrqjzxhdqjqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj9xXoW7GrWDZrWrZFy7Cw15Zr4UKFX_yoWkurX_Aa
	4xAr18GrnxAF1Fg34qvF4xArW3Xa42ya1kC3W7AF10ya4jyw13GF97J343Ar4rur43u3Wr
	uF4kKrZIva17KosvyTuYvTs0mTUanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUbxkYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	WUJVW8JwA2z4x0Y4vEx4A2jsIE14v26r4j6F4UM28EF7xvwVC2z280aVCY1x0267AKxVW8
	JVW8Jr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4
	xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ex4A2jsIE14v2
	6r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCY1x0262kKe7AKxV
	WUAVWUtwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E
	14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIx
	kGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAF
	wI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r
	4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8fOz7UU
	UUU==

From: wanghongliang <wanghongliang@loongson.cn>

clocks property describes the i2c bus reference clock from APB clock.
clock-frequency property describes i2c bus speed.

Signed-off-by: wanghongliang <wanghongliang@loongson.cn>
---
 Documentation/devicetree/bindings/i2c/loongson,ls2x-i2c.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/loongson,ls2x-i2c.yaml b/Documentation/devicetree/bindings/i2c/loongson,ls2x-i2c.yaml
index ee09c6d9c5f0..4bf89bb97e7d 100644
--- a/Documentation/devicetree/bindings/i2c/loongson,ls2x-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/loongson,ls2x-i2c.yaml
@@ -38,10 +38,13 @@ unevaluatedProperties: false
 examples:
   - |
     #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/clock/loongson,ls2k-clk.h>
 
     i2c0: i2c@1fe21000 {
         compatible = "loongson,ls2k-i2c";
         reg = <0x1fe21000 0x8>;
+        clock-frequency = <100000>;
+        clocks = <&clk LOONGSON2_APB_CLK>;
         interrupt-parent = <&extioiic>;
         interrupts = <22 IRQ_TYPE_LEVEL_LOW>;
         #address-cells = <1>;
-- 
2.47.2

