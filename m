Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=114.242.206.163
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793934135;
	b=RRs/O5kzykgVnBqRT5rU6yU17a2J2+m77PQ2X5ZgdumHwKn10XJ5dygzzx4RW5uabfnC
	 Tq3CBx3GA6jRozRD+VVOKcQh42JXpZaHec1HiJfoRqHhWPYk/qu36mUylVFohVpeZSHrn
	 4FHCcB7v9LJEIKfctneEWKVw5dQ2s1LPEAiCvetaN0IXH3u1+kVLk75fRGGm7hwbzz0bA
	 /h51J+xqYCX8+dJDQ44snV4j/T+I/HitphMG3dHYH67YjEZQCPeWJw88dS8gXDw+tkSXh
	 MJTehFah1kbnxjeaCNMRDqc9N40EXuGQWAVCFOL7TbspoOSmNN5UhDMh1Azugoiktog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793934135;
	h=DMARC-Filter:Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-CM-SenderInfo:
	 X-Coremail-Antispam;
	bh=1YVbiDtGnxRLtZkdvukEFZWM6VAbfRE5cYeWCDODJ2k=;
	b=1dALLGlDKDpbBeCZk+Enc6xmBS80tOgOVp8k1OOTAp+6Odxlm+UkBYnIMnQaRDtI7gdB
	 k/GAWsjheXGjc1yRc+6ZxU5TaryPiS3T/ksMSHI+eAJAUHXr7+dcYnNyjTI9ft+YR29vt
	 ZTE5+k7eB0l2AtfasEXB6XQ6BSVvR0oZBtgGwIbstkkApZXdIUegVPGhVqmkrMiRazh9a
	 MTCh9icIgtyA2OzKohDbw5Vx2Vog8dZlwYY619eWSlHlgCGk65oC8ngm9MXkx9Dl79+xV
	 LdO2R/FMsOfiXF3us6Fflbmf4N+we+igmygx5iGf/7h8E7eASi4z52ZFhXEd7UPN21w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=loongson.cn;
	spf=pass smtp.mailfrom=loongson.cn;
	arc=none smtp.remote-ip=114.242.206.163
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95FEC606A31B
	for <loongarch@lists.linux.dev>; Fri,  6 Nov 2026 03:02:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95FEC606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.42.101])
	by gateway (Coremail) with SMTP id _____8DxpvA0Q+1qGOocAA--.18349S3;
	Fri, 06 Nov 2026 11:02:12 +0800 (CST)
Received: from loongson-pc.loongson.cn (unknown [127.0.0.1])
	by front1 (Coremail) with SMTP id qMiowJCxvM4tQ+1qprAyAA--.18991S3;
	Fri, 06 Nov 2026 11:02:10 +0800 (CST)
From: Hongliang Wang <wanghongliang@loongson.cn>
To: Hongliang Wang <wanghongliang@loongson.cn>,
	Binbin Zhou <zhoubinbin@loongson.cn>,
	Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Huacai Chen <chenhuacai@kernel.org>
Cc: linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	loongarch@lists.linux.dev,
	Huacai Chen <chenhuacai@loongson.cn>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v11 1/2] dt-bindings: i2c: ls2x-i2c: Add clocks and clock-frequency properties
Date: Fri,  6 Nov 2026 11:02:02 +0800
Message-Id: <20261106030203.15709-2-wanghongliang@loongson.cn>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20261106030203.15709-1-wanghongliang@loongson.cn>
References: <20261106030203.15709-1-wanghongliang@loongson.cn>
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJCxvM4tQ+1qprAyAA--.18991S3
X-CM-SenderInfo: pzdqwxxrqjzxhdqjqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoWrurWfuFy3KFW5JFy8Jr4rCrX_yoW8Jr4rpa
	nxC3WDGr40vF17W395ta4xCr18ZrnxA3ZrWFZrAF4xK3ZxJwn0qr13Krn8Z3WruFW0vFW7
	ZFZ2krsY9F97CrcCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUk0b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Gr0_Gr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I
	8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r126r1DMcIj6I8E87Iv67AK
	xVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2Ij64
	vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8G
	jcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2I
	x0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK
	8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I
	0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUwMKuUUUUU

Add clocks and clock-frequency properties to examples.

Reviewed-by: Binbin Zhou <zhoubinbin@loongson.cn>
Reviewed-by: Huacai Chen <chenhuacai@loongson.cn>
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

