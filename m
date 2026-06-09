Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BA5134A3D6
	for <loongarch@lists.linux.dev>; Tue,  9 Jun 2026 09:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780996010; cv=none; b=PVQHniuK31aNbNeIYkfIoyDY9lX7OOItqyEkmF8w6aYcY9IFahYwObHi1kP/SNqo7kk1Y1KaaB45fIvNW1TNhaEtosQElSWHgk2kwrzboAdvonbkQVOZ/r1y50zSFx5JqDXAuQ/sikHBuXIZ48YlIYwrL1YRELCoufUBvKHy7y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780996010; c=relaxed/simple;
	bh=Hj1S5z20HOrHY4kGGrbU+sk4JvQTCTMsrr3XqOGMH+Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=d+fSyLRDi/dNT5Zi5Jib+X+Dlk6u2qdeLZ/YD6XAy1EXN45LVDiU4PB3JD4ek6TlLUbpoLHGrNDWHLh6xdmx5DsmgRL3asCDy349IWcoN5bAiPmWfnBOJvOYvAZBLnGg+jQpo7vqZcpLe+XxS+UwzwKhuOBAEgTSIonOlDvCVGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.42.101])
	by gateway (Coremail) with SMTP id _____8CxHuqn1ydqeTESAA--.47626S3;
	Tue, 09 Jun 2026 17:06:47 +0800 (CST)
Received: from loongson-pc.loongson.cn (unknown [10.20.42.101])
	by front1 (Coremail) with SMTP id qMiowJCxOMGk1ydqKKOgAA--.28652S4;
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
Subject: [PATCH v1 2/3] LoongArch: dts: i2c: Add clocks and clock-frequency properties to 2K1000
Date: Tue,  9 Jun 2026 17:05:42 +0800
Message-Id: <20260609090543.1462-3-wanghongliang@loongson.cn>
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
X-CM-TRANSID:qMiowJCxOMGk1ydqKKOgAA--.28652S4
X-CM-SenderInfo: pzdqwxxrqjzxhdqjqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj9xXoWrZry3GF48CF45Zr4UXw45XFc_yoWkWFX_t3
	ZxKw1UGrs5CFs5tryqvr4UJw43ZayUA3ZYkF97ury8ta4Dtr43GrWUZa98Ar1FkrW2grsY
	y3y8Xr95CryakosvyTuYvTs0mTUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUb28YFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
	Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ex4A2jsIE
	14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x
	0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E
	7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcV
	C0I7IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF
	04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7
	CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07j83kZUUUUU=

Add clocks and clock-frequency properties to i2c nodes.

Signed-off-by: Hongliang Wang <wanghongliang@loongson.cn>
---
 arch/loongarch/boot/dts/loongson-2k1000.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/loongarch/boot/dts/loongson-2k1000.dtsi b/arch/loongarch/boot/dts/loongson-2k1000.dtsi
index ab6a55937e9e..e6f0fe093ab3 100644
--- a/arch/loongarch/boot/dts/loongson-2k1000.dtsi
+++ b/arch/loongarch/boot/dts/loongson-2k1000.dtsi
@@ -311,6 +311,8 @@ uart0: serial@1fe20000 {
 		i2c2: i2c@1fe21000 {
 			compatible = "loongson,ls2k-i2c";
 			reg = <0x0 0x1fe21000 0x0 0x8>;
+			clock-frequency = <100000>;
+			clocks = <&clk LOONGSON2_APB_CLK>;
 			interrupt-parent = <&liointc0>;
 			interrupts = <22 IRQ_TYPE_LEVEL_HIGH>;
 			status = "disabled";
@@ -319,6 +321,8 @@ i2c2: i2c@1fe21000 {
 		i2c3: i2c@1fe21800 {
 			compatible = "loongson,ls2k-i2c";
 			reg = <0x0 0x1fe21800 0x0 0x8>;
+			clock-frequency = <100000>;
+			clocks = <&clk LOONGSON2_APB_CLK>;
 			interrupt-parent = <&liointc0>;
 			interrupts = <23 IRQ_TYPE_LEVEL_HIGH>;
 			status = "disabled";
-- 
2.47.2

