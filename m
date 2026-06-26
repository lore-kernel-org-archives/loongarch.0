Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 648502D879E
	for <loongarch@lists.linux.dev>; Fri, 26 Jun 2026 02:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782440864; cv=none; b=E33Kkc2hfbU4RK3iIlJCL6SPijR600KMV1vHBuqcuwdhNlhRbJdWKwHRexoHi5t+jq5YHxs+3twXYOoL7o/l2EyqyvGIFDAEZco6wWGj5/m96LiVJn9dd3LeyAznhbf83QiFQplB2Kt31W1wp5LgMesa2YG9USK6LfH4O2qxFSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782440864; c=relaxed/simple;
	bh=iayqFNpmtwuOmqL5hZVGUCcCiN9la0gL+/Mkg6NRh24=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rP7UgohqHd4QVjjb4QsY5sA+lxjMatMOTF7qtoCLJGcgjc/W8RSCLZy0bNFSoHE52ws1f/Xp8dttFnKsizN/Ve+4Q03y7q6voovQI/get2NIZ3cfD1PmvO25kPIHGn6d1z+jAbQESCuuW3+h3MtsLQhWuRGyizWAkfmGVsQFNGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.155])
	by gateway (Coremail) with SMTP id _____8AxvsCd4z1qCDEYAA--.38441S3;
	Fri, 26 Jun 2026 10:27:41 +0800 (CST)
Received: from kernelserver (unknown [223.64.68.155])
	by front1 (Coremail) with SMTP id qMiowJCxWeCY4z1qr22zAA--.13114S5;
	Fri, 26 Jun 2026 10:27:40 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Keguang Zhang <keguang.zhang@gmail.com>
Cc: Huacai Chen <chenhuacai@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-sound@vger.kernel.org,
	Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH v3 7/9] ASoC: dt-bindings: loongson,ls-audio-card: Add ATK-DL2K0300B compatible
Date: Fri, 26 Jun 2026 10:27:28 +0800
Message-ID: <71430fcee5951fb7a7d52e2091a87707db85e06c.1782439646.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1782439646.git.zhoubinbin@loongson.cn>
References: <cover.1782439646.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJCxWeCY4z1qr22zAA--.13114S5
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/1tbiAgEKCGo8wzAaHwAAsh
X-Coremail-Antispam: 1Uk129KBj93XoW7tF4kuw4xWw4xCFWfZF45XFc_yoW8ZF4kp3
	s3CasxWrWxtw13Aas8XFyfAw4fW3s3CFsrJF42qw1rGanxKw4Fqw45K3WDWFy5ArWvqFW7
	Wr95Kr48CF9rAwbCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkIb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1a6r1DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26rWY6Fy7McIj6I8E87Iv
	67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2
	Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s02
	6x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0x
	vE2Ix0cI8IcVAFwI0_Ar0_tr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwCI42IY
	6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aV
	CY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU8-txDUUUUU==

Add new compatible for the ATK-DL2K0300B development board based on
Loongson-2K0300.

Unlike others, this board features GPIO-controlled headphone detection,
headphone control, and speaker enable.

Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 .../sound/loongson,ls-audio-card.yaml         | 38 +++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/loongson,ls-audio-card.yaml b/Documentation/devicetree/bindings/sound/loongson,ls-audio-card.yaml
index 8c214e5d04b1..dc7f4afbb777 100644
--- a/Documentation/devicetree/bindings/sound/loongson,ls-audio-card.yaml
+++ b/Documentation/devicetree/bindings/sound/loongson,ls-audio-card.yaml
@@ -23,6 +23,7 @@ properties:
     enum:
       - loongson,ls-audio-card  # Loongson-2K1000/Loongson-2K2000/LS7A
       - loongson,ls2k0300-forever-pi-audio-card # CTCISZ Forever Pi
+      - loongson,ls2k0300-dl2k0300b-audio-card # ATK-DL2K0300B
 
   mclk-fs:
     $ref: simple-card.yaml#/definitions/mclk-fs
@@ -47,6 +48,18 @@ properties:
     required:
       - sound-dai
 
+  spkr-en-gpios:
+    maxItems: 1
+    description: The GPIO that enables the speakers
+
+  hp-ctl-gpios:
+    maxItems: 1
+    description: The GPIO that control the headphones
+
+  hp-det-gpios:
+    maxItems: 1
+    description: The GPIO that detect headphones are plugged in
+
 required:
   - compatible
   - mclk-fs
@@ -69,3 +82,28 @@ examples:
              sound-dai = <&es8323>;
         };
     };
+
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    sound {
+        compatible = "loongson,ls2k0300-dl2k0300b-audio-card";
+        model = "loongson-audio";
+        mclk-fs = <512>;
+        hp-det-gpios = <&gpio 81 GPIO_ACTIVE_HIGH>;
+        spkr-en-gpios = <&gpio 86 GPIO_ACTIVE_HIGH>;
+        hp-ctl-gpios = <&gpio 87 GPIO_ACTIVE_HIGH>;
+        audio-routing =
+                      "Headphone", "LOUT1",
+                      "Headphone", "ROUT1",
+                      "Speaker", "LOUT2",
+                      "Speaker", "ROUT2";
+
+        cpu {
+            sound-dai = <&i2s>;
+        };
+
+        codec {
+             sound-dai = <&es8388>;
+        };
+    };
-- 
2.52.0

