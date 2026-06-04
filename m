Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1460F2E091B
	for <loongarch@lists.linux.dev>; Thu,  4 Jun 2026 02:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780539126; cv=none; b=htAALhOmi4rmj5I7e8/vNDQr3uP+64iHkaC8JIihlLUDoeviJ/G8ZwhmqZrVaZyWnNPL1hnZ8smwdONE/lE6Rl3DJwj0RphVx+khtM0g5hkDqnsWFXlXeWZvUfyRQOShF+3a8/h4wvd1XCgcYSqJ94uJU9Esb33DidjTOticaP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780539126; c=relaxed/simple;
	bh=ubKUIVApfhJKZsctF/X0ULl7CaqPMXDoGhV1X6v2PZU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M1/VPAaerkUR2PhLu9WtnznDx3VuABYJqzjFT1nrzAvQC7U6aTYQS2VWI+sgivb6mP/UOlqUX7k+PTzHhqC5dAPfJJfE2Db9TY5D417WGEWxlHiJbHXgoc8FlCnBbvFdEj5gi80v1BuEz3NskxmrU4oZPICku7AMvQo4YDw02Ho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.59])
	by gateway (Coremail) with SMTP id _____8BxJenv3iBqW2EQAA--.39291S3;
	Thu, 04 Jun 2026 10:11:59 +0800 (CST)
Received: from kernelserver (unknown [223.64.68.59])
	by front1 (Coremail) with SMTP id qMiowJCxGODr3iBq5EabAA--.32358S4;
	Thu, 04 Jun 2026 10:11:58 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Huacai Chen <chenhuacai@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-sound@vger.kernel.org,
	Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH v2 6/7] ASoC: dt-bindings: loongson,ls-audio-card: Add ATK-DL2K0300B compatible
Date: Thu,  4 Jun 2026 10:11:46 +0800
Message-ID: <c03b86a9318cffe69ecf8d5c14543fc5948ab2c7.1780538113.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1780538113.git.zhoubinbin@loongson.cn>
References: <cover.1780538113.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJCxGODr3iBq5EabAA--.32358S4
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/1tbiAQEICGofwl8ZawAAsa
X-Coremail-Antispam: 1Uk129KBj93XoW7ZF4fZw1DuF48CryfWryfuFX_yoW8ur1kp3
	s3CasxGrWxtw13A3s8XFyxAw4fW3s3AFsrJF42qw1fGan8Kw4Yqw45K3WUWay3ArWvqFW7
	Wr95Kr48CF9rAwbCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkab4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26F4j6r4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAF
	wI0_Gr1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI
	0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWrXVW3AwAv7VC2z280
	aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw28Icx
	kI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2Iq
	xVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42
	IY6xIIjxv20xvE14v26F1j6w1UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1lIxAI
	cVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2js
	IEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jT-e5UUUUU=

Add new compatible for the ATK-DL2K0300B development board based on
Loongson-2K0300.

Unlike others, this board features GPIO-controlled headphone detection,
headphone mute, and speaker enable.

Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 .../sound/loongson,ls-audio-card.yaml         | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/loongson,ls-audio-card.yaml b/Documentation/devicetree/bindings/sound/loongson,ls-audio-card.yaml
index 8c214e5d04b1..e9b248e8246c 100644
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
 
+  loongson,spkr-en-gpios:
+    maxItems: 1
+    description: The GPIO that enables the speakers
+
+  loongson,hp-mute-gpios:
+    maxItems: 1
+    description: The GPIO that mutes the headphones
+
+  loongson,hp-det-gpios:
+    maxItems: 1
+    description: The GPIO that detect headphones are plugged in
+
 required:
   - compatible
   - mclk-fs
@@ -69,3 +82,27 @@ examples:
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
+        loongson,hp-det-gpios = <&gpio 81 GPIO_ACTIVE_HIGH>;
+        loongson,spkr-en-gpios = <&gpio 86 GPIO_ACTIVE_HIGH>;
+        loongson,hp-mute-gpios = <&gpio 87 GPIO_ACTIVE_HIGH>;
+        audio-routing =
+                      "Headphone", "LOUT1",
+                      "Headphone", "ROUT1",
+                      "Speaker", "LOUT2",
+                      "Speaker", "ROUT2";
+
+        cpu {
+            sound-dai = <&i2s>;
+        };
+        codec {
+             sound-dai = <&es8388>;
+        };
+    };
-- 
2.52.0

