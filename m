Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DF633EDE40
	for <loongarch@lists.linux.dev>; Tue,  9 Jun 2026 09:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780996012; cv=none; b=l6EOQ7/wh1GIU2tKSPiaTQ8OJ8Lt0TP2N2cldZzqTFtPou0cAaXzQl8DgSesTOCzc/UwUgd8Dbt6g/i6CtrllLkqWI8VjQCJvmXMmH4e615W1ZFO8L0Qz+8+/sfzYMnsmwJ2cTp0PVCKKQPqra09lY8v6l+Lij9AnhdYOZTcLSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780996012; c=relaxed/simple;
	bh=/vPodh8on6A4OnRb2aoAHZJLbt4JZwztrUkDiPLW6kk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Db9q00lsQJSMyiZ59BXox8vjTHAYmN4ripw0lFPd4IsJzjghCM4Erz+/wG2nRyEiYew0bjCWeFmsIKY/i7Kj66ns6cO8mQCkgqpYUUm4ZaRXR8u0vJB6OK/pMr8yhRk+D9og1uhpvAHK3pFgRmaugkbxf2xz/EYnbokAbCYUZIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.42.101])
	by gateway (Coremail) with SMTP id _____8AxVumo1ydqfTESAA--.42576S3;
	Tue, 09 Jun 2026 17:06:48 +0800 (CST)
Received: from loongson-pc.loongson.cn (unknown [10.20.42.101])
	by front1 (Coremail) with SMTP id qMiowJCxOMGk1ydqKKOgAA--.28652S5;
	Tue, 09 Jun 2026 17:06:47 +0800 (CST)
From: Hongliang Wang <wanghongliang@loongson.cn>
To: Hongliang Wang <wanghongliang@loongson.cn>,
	Binbin Zhou <zhoubinbin@loongson.cn>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>
Cc: devicetree@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 3/3] LoongArch: dts: i2c: Add clocks and clock-frequency properties to 2K2000
Date: Tue,  9 Jun 2026 17:05:43 +0800
Message-Id: <20260609090543.1462-4-wanghongliang@loongson.cn>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20260609090543.1462-1-wanghongliang@loongson.cn>
References: <20260609090543.1462-1-wanghongliang@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJCxOMGk1ydqKKOgAA--.28652S5
X-CM-SenderInfo: pzdqwxxrqjzxhdqjqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj9xXoWrZryxtrW5Zw47XFy5Ary7Jwc_yoWkGFgEq3
	WfKw1kGrs5JFZ5Zryq9r18X3y7Z347Z3WFyF9rur48tas8trnxGr48Zas8ArW0krW2grs8
	J3y8X3s3CryakosvyTuYvTs0mTUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUb28YFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
	Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jw0_WrylYx0Ex4A2jsIE
	14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x
	0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E
	7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcV
	C0I7IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF
	04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7
	CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07josjUUUUUU=

Add clocks and clock-frequency properties to i2c nodes.

Signed-off-by: Hongliang Wang <wanghongliang@loongson.cn>
---
 arch/loongarch/boot/dts/loongson-2k2000.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/loongarch/boot/dts/loongson-2k2000.dtsi b/arch/loongarch/boot/dts/loongson-2k2000.dtsi
index 3678c084adf7..7fdc4192d2f2 100644
--- a/arch/loongarch/boot/dts/loongson-2k2000.dtsi
+++ b/arch/loongarch/boot/dts/loongson-2k2000.dtsi
@@ -239,6 +239,8 @@ rtc0: rtc@100d0100 {
 		i2c@1fe00120 {
 			compatible = "loongson,ls2k-i2c";
 			reg = <0x0 0x1fe00120 0x0 0x8>;
+			clock-frequency = <100000>;
+			clocks = <&clk LOONGSON2_MISC_CLK>;
 			interrupt-parent = <&liointc>;
 			interrupts = <8 IRQ_TYPE_LEVEL_HIGH>;
 			status = "disabled";
@@ -247,6 +249,8 @@ i2c@1fe00120 {
 		i2c@1fe00130 {
 			compatible = "loongson,ls2k-i2c";
 			reg = <0x0 0x1fe00130 0x0 0x8>;
+			clock-frequency = <100000>;
+			clocks = <&clk LOONGSON2_MISC_CLK>;
 			interrupt-parent = <&liointc>;
 			interrupts = <9 IRQ_TYPE_LEVEL_HIGH>;
 			status = "disabled";
-- 
2.47.2

