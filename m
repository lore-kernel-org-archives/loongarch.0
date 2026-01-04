Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A31CA2E4266
	for <loongarch@lists.linux.dev>; Sun,  4 Jan 2026 06:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767508968; cv=none; b=KYiQEFbaSRSEAFktLKhgwjNfTnUikxvaqVYuOJbgGu1DO8o7OIrKe6ZrNd8AfmmomzQba+VZU4f8VRraynlkM+KWFmaKXhyygZtQgNPVvzCz7FR277aICYVrJMXp211O8o+Y45dcIPMmxPv6qbti4kV7ggLIQVt3oLrhtzCT15A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767508968; c=relaxed/simple;
	bh=mexpno8Yf+4bje8pzC5z2n+W6lDrYujUk51e00dqcNU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QsUB2FRwwW6utfkOW0GKadtS6JNL47ICwKNpbkADirhO4qh7C5zuxIbtU1oYEl3nbiiFKf46JfW1GxkN+VSiPvZL6lmWHyIy3R9th9DVDQPPII6q8dXGOnTEUpZFpjcljZSUOj8hj06rokdATEE+4vNhOtTzRD1jFEZinoybB8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.69.1])
	by gateway (Coremail) with SMTP id _____8BxHMPVC1ppIFMFAA--.16333S3;
	Sun, 04 Jan 2026 14:42:29 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.69.1])
	by front1 (Coremail) with SMTP id qMiowJDxzsLQC1ppszUMAA--.28035S3;
	Sun, 04 Jan 2026 14:42:27 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Yao Zi <me@ziyao.cc>,
	Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Huacai Chen <chenhuacai@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 9/9] LoongArch: dts: loongson-2k1000: Fix i2c-gpio node names
Date: Sun,  4 Jan 2026 14:42:15 +0800
Message-ID: <63482d86480df1582da1ae81f5d5cde6733c5da3.1767505859.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1767505859.git.zhoubinbin@loongson.cn>
References: <cover.1767505859.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJDxzsLQC1ppszUMAA--.28035S3
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/1tbiAgERCGlaARoAhAAAs2
X-Coremail-Antispam: 1Uk129KBj93XoW7uFW5ZF18ZFy8CFW3Wr1xZwc_yoW8Jw1Upa
	ya9wn7tFs5Grnagr1qyrya9r48ZFykJr4vgFs5GrW8XwsIqr1jyr1rJrnaqF45W3ySq3yF
	gryrur9FkF4DAacCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkqb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAF
	wI0_Gr1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI
	0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWrXVW3AwAv7VC2z280
	aVAFwI0_Cr0_Gr1UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20x
	vY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I
	3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIx
	AIcVC0I7IYx2IY67AKxVW7JVWDJwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UMIIF
	0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWxJVW8Jr1lIxAIcVC2z2
	80aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU0beOPUUUUU==

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

