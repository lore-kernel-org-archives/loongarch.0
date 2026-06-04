Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01D0D231A41
	for <loongarch@lists.linux.dev>; Thu,  4 Jun 2026 01:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780538396; cv=none; b=ouQt7kkeY1wmXarRl8UYvbcdbdRs/+FLoMA/UHQgGi9CgVasM5SBgxbGUVsGZAWp2Jm/fGeSRs+CWwlq9DfCfeHXZV9TJYTeAvxfnq4k3/3/1a0ubMpHSBu7D/aoUpyEpYosceCBeiVmLXdliIMytIvJ9yfwlgV5RyvhRQbRc8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780538396; c=relaxed/simple;
	bh=oL/KIUF/rvpfZrt0+5eZKtP2YMc3tCS0xA9cLrUHvow=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PAwWNLO7JCrwsDc1O6J4hcgyJdsYy8K4BS7YYu1P7HwHNSU5cwiinQ6j5wjDWjLfTgJWK2Ruy2q4vQ2XWPOx9e7StIF/+e14hzOFm0EcU7LVBbJ8WdsJHTYz98K84Uo612lW+wiXZjvFbQ0dftFmzBYsYRPVlWxkpHKSU5HXXwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.42.101])
	by gateway (Coremail) with SMTP id _____8Cx3ekZ3CBq3l8QAA--.45249S3;
	Thu, 04 Jun 2026 09:59:53 +0800 (CST)
Received: from loongson-pc.loongson.cn (unknown [10.20.42.101])
	by front1 (Coremail) with SMTP id qMiowJDxSMEV3CBqvESbAA--.17953S3;
	Thu, 04 Jun 2026 09:59:53 +0800 (CST)
From: Hongliang Wang <wanghongliang@loongson.cn>
To: Hongliang Wang <wanghongliang@loongson.cn>,
	Binbin Zhou <zhoubinbin@loongson.cn>,
	Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	loongarch@lists.linux.dev,
	stable@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v5 1/2] dt-bindings: i2c: ls2x-i2c: Add clocks and clock-frequency properties
Date: Thu,  4 Jun 2026 09:58:47 +0800
Message-Id: <20260604015848.18643-2-wanghongliang@loongson.cn>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20260604015848.18643-1-wanghongliang@loongson.cn>
References: <20260604015848.18643-1-wanghongliang@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJDxSMEV3CBqvESbAA--.17953S3
X-CM-SenderInfo: pzdqwxxrqjzxhdqjqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj9xXoWrZF45WryfKr4fKr4UuFWkKrX_yoWkAFgEya
	4xAw18JrsxAFyFg3yqvF4xJr13Ja42y3WrC3W7AF4vy34Ut345KF97J34ayr4fWrsxuF13
	uFs7CrZ3Za1xKosvyTuYvTs0mTUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUb78YFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwA2z4x0Y4vEx4A2jsIE14v26r4j6F4UM28EF7xvwVC2z280aVCY1x0267AKxVW8
	JVW8Jr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4
	xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ex4A2jsIE14v2
	6r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x0EwI
	xGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480
	Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7
	IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k2
	6cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxV
	AFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU82g43UUUUU==

Add clocks and clock-frequency properties to examples.

Cc: stable@vger.kernel.org
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Hongliang Wang <wanghongliang@loongson.cn>
---
 Documentation/devicetree/bindings/i2c/loongson,ls2x-i2c.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/loongson,ls2x-i2c.yaml b/Documentation/devicetree/bindings/i2c/loongson,ls2x-i2c.yaml
index ee09c6d9c5f0..0beb7f2515c8 100644
--- a/Documentation/devicetree/bindings/i2c/loongson,ls2x-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/loongson,ls2x-i2c.yaml
@@ -37,11 +37,14 @@ unevaluatedProperties: false
 
 examples:
   - |
+    #include <dt-bindings/clock/loongson,ls2k-clk.h>
     #include <dt-bindings/interrupt-controller/irq.h>
 
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

