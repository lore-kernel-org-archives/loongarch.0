Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF8481CD1E1
	for <loongarch@lists.linux.dev>; Mon,  3 Mar 2025 07:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740987979; cv=none; b=ENCn0fH2Ot/O/11M7EFm4+m/8ujshmBuXxcbjAQfEN8rjH4jZaYzoppRwU4i4b/2kSUNvkN3GQXt7R0e0Flz+O8owj7yMoNgbx6vt+B2J5ZbfulPhAiR51m7DqlOHkuZuhLcsVkArmzLHmENpFqlkpkH23FSx5Ji3TPy0rVY11Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740987979; c=relaxed/simple;
	bh=45/qDsmDCCyOu9HMAdSnCWnN/LJOZXdy7hLvXkjsEd8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=seKZD+2IgCCZQgyqBbmGDZcKclJSwEjAX1RGMVfJ4zZZPGQjneJtrlaFDiIC1k4cHnLUoXmccaT8ULwQLcJjoLFObawD2dlKdAflsDyMMHCB2SBNh/rtLVHFsNUlakqC/ohpzapWDkwTr5LOiN1e+JhUN/EsAQ6AwInCffiuMqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.156])
	by gateway (Coremail) with SMTP id _____8DxOGo+XsVnpvmIAA--.38085S3;
	Mon, 03 Mar 2025 15:46:06 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.68.156])
	by front1 (Coremail) with SMTP id qMiowMAxzMQ7XsVn1GEzAA--.57437S2;
	Mon, 03 Mar 2025 15:46:04 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yinbo Zhu <zhuyinbo@loongson.cn>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Huacai Chen <chenhuacai@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH 1/2] dt-bindings: gpio: loongson: Add new loongson gpio chip compatible
Date: Mon,  3 Mar 2025 15:45:51 +0800
Message-ID: <20250303074552.3335186-1-zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMAxzMQ7XsVn1GEzAA--.57437S2
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj9xXoWrtw43uryrtF1UZFy8WF18Xrc_yoWDKFg_Ja
	4IkF4kCrs5AF9aq34jvr43Kry3X3yay3W3CFnxtF48Zw1jv3s8CFZ7Aw1YkryxXr45ur13
	ZFZ7Grn5AF1IgosvyTuYvTs0mTUanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUb7xYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Cr1j6rxdM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I
	8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv67AK
	xVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2Ij64
	vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8G
	jcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2I
	x0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK
	8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I
	0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07j1WlkUUUUU=

Add the devicetree compatibles for Loongson-7A2000 and Loongson-3A6000
gpio chip.

Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 Documentation/devicetree/bindings/gpio/loongson,ls-gpio.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpio/loongson,ls-gpio.yaml b/Documentation/devicetree/bindings/gpio/loongson,ls-gpio.yaml
index cf3b1b270aa8..b68159600e2b 100644
--- a/Documentation/devicetree/bindings/gpio/loongson,ls-gpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/loongson,ls-gpio.yaml
@@ -20,7 +20,10 @@ properties:
           - loongson,ls2k2000-gpio1
           - loongson,ls2k2000-gpio2
           - loongson,ls3a5000-gpio
+          - loongson,ls3a6000-gpio  # Loongson-3A6000 node GPIO
           - loongson,ls7a-gpio
+          - loongson,ls7a2000-gpio1 # LS7A2000 chipset GPIO
+          - loongson,ls7a2000-gpio2 # LS7A2000 ACPI GPIO
       - items:
           - const: loongson,ls2k1000-gpio
           - const: loongson,ls2k-gpio

base-commit: 8a5680bffb2f681688b5788751c767fc380ff9b7
-- 
2.47.1

