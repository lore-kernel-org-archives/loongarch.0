Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 364042E62C4
	for <loongarch@lists.linux.dev>; Fri, 19 Dec 2025 08:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766134119; cv=none; b=CTUMYipZhDY30KCYA1VvLGRIXEHWCJMqT0gc1wHtv/obdWqo+XBkslt1DHNhmq8df1LAtwNTkQX8898h0EsF8KaOLjCilH48pudn4bY+jVhWpRYySOz3JoOVsc3P+faAMQcLvtWoOU3DJlNQYVuTvpnyoFeKbEflwH7bBVodFBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766134119; c=relaxed/simple;
	bh=mexpno8Yf+4bje8pzC5z2n+W6lDrYujUk51e00dqcNU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=neHLQj9h9+fHORCK1I3UiDZPj6GqfPLMBceq5OKxEbOGhiiZVoVPOcZbEJ6MPsPk2+BthsC6KUllU3M3f9SXjxHpK/kzagzqJhlviRo/x8X3chras0z5zWefhWM2c+7NsqXFjM7zmYZufLPGz1OcBIPbbtHkJp2vYssOR5rUQrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.69.54])
	by gateway (Coremail) with SMTP id _____8CxacJBEUVpwMcAAA--.2513S3;
	Fri, 19 Dec 2025 16:48:01 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.69.54])
	by front1 (Coremail) with SMTP id qMiowJCxHOE3EUVpDrQBAA--.6650S5;
	Fri, 19 Dec 2025 16:48:00 +0800 (CST)
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
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2 7/7] LoongArch: dts: loongson-2k1000: Fix i2c-gpio node names
Date: Fri, 19 Dec 2025 16:47:39 +0800
Message-ID: <67de4ba555842abcace2b3eb5b7295dbab736e27.1766037997.git.zhoubinbin@loongson.cn>
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
X-CM-TRANSID:qMiowJCxHOE3EUVpDrQBAA--.6650S5
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/1tbiAgEBCGlE6RgD4QAAs0
X-Coremail-Antispam: 1Uk129KBj93XoW7uFW5ZF18ZFy8CFW3Wr1xZwc_yoW8Jw1Upa
	ya9wn7tFs5Grnagr1qyrya9r48ZFykJr4vgFs5GrW8XwsIqr1jyr1rJrnaqF45W3ySq3yF
	gryrur9FkF4DAacCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkab4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAF
	wI0_Gr1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI
	0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWrXVW3AwAv7VC2z280
	aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw28Icx
	kI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2Iq
	xVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42
	IY6xIIjxv20xvE14v26F1j6w1UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1lIxAI
	cVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2js
	IEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07j-J5rUUUUU=

From: Binbin Zhou <zhoubb.aaron@gmail.com>

The binding wants the node to be named "i2c-number", but those are named
"i2c-gpio-number" instead.

Rename those to i2c-0, i2c-1 to adhere to the binding and suppress
dtbs_check warnings.

Signed-off-by: Binbin Zhou <zhoubb.aaron@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/loongarch/boot/dts/loongson-2k1000.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/loongarch/boot/dts/loongson-2k1000.dtsi b/arch/loongarch/boot/dts/loongson-2k1000.dtsi
index 440a8f3c01f4..be4f7d119660 100644
--- a/arch/loongarch/boot/dts/loongson-2k1000.dtsi
+++ b/arch/loongarch/boot/dts/loongson-2k1000.dtsi
@@ -46,7 +46,7 @@ cpuintc: interrupt-controller {
 	};
 
 	/* i2c of the dvi eeprom edid */
-	i2c-gpio-0 {
+	i2c-0 {
 		compatible = "i2c-gpio";
 		scl-gpios = <&gpio0 0 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 		sda-gpios = <&gpio0 1 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
@@ -57,7 +57,7 @@ i2c-gpio-0 {
 	};
 
 	/* i2c of the eeprom edid */
-	i2c-gpio-1 {
+	i2c-1 {
 		compatible = "i2c-gpio";
 		scl-gpios = <&gpio0 33 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 		sda-gpios = <&gpio0 32 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
-- 
2.47.3

