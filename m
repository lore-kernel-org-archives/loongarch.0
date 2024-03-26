Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7291B40BE6
	for <loongarch@lists.linux.dev>; Tue, 26 Mar 2024 09:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711443728; cv=none; b=bNMiDdUnZe/XEpFyNqPdOk8hSjui8514DixvWodmbYhVNz+ebx3bX3a+2JhFVJ0W9lLWeT8WEvSOwhTmfAtNx4gfG3yTEJR4UCkSCWfuarb1hC8PyCgb0qs2PFqu6E6AEuAjAJg4MV9/j5kkynPNErjaZkPnIDLPB32ac0h5KSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711443728; c=relaxed/simple;
	bh=bGK/tjyPouBpcr/9GWxrGkfH7GWAsOMrSFXaKmZTAV0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Re7gpOP4FmmvZh+3zTFkKTyrN05yKMl1bTM4l6FDRRjFNMubVlvadI2o0XuUT/omLi5P33U2boXkLsEX6xPJPS3nS92rrVY9oWb020DFLG8g8En3QW8MKgqtCxCGEwbeEfgWsinWKErG1fnJVOWsnjVLIKhf80OFCg+aRpZOtv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [112.20.109.198])
	by gateway (Coremail) with SMTP id _____8AxPOkNjwJm_04eAA--.61089S3;
	Tue, 26 Mar 2024 17:02:05 +0800 (CST)
Received: from localhost.localdomain (unknown [112.20.109.198])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8AxDBMMjwJmwrJoAA--.9838S2;
	Tue, 26 Mar 2024 17:02:04 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yinbo Zhu <zhuyinbo@loongson.cn>
Cc: Huacai Chen <chenhuacai@kernel.org>,
	loongson-kernel@lists.loongnix.cn,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH v1 8/8] LoongArch: dts: Add clock support to Loongson-2K2000
Date: Tue, 26 Mar 2024 17:01:52 +0800
Message-ID: <0d8d67883f885fb3148d532031db9e18eab112cb.1710926402.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1710926402.git.zhoubinbin@loongson.cn>
References: <cover.1710926402.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8AxDBMMjwJmwrJoAA--.9838S2
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoW7ur1xuFyxZFWUCw17CF13WrX_yoW8uw18p3
	srCa1UKr409F1xur98trWUGF1kAF95AFnrWanIkFyUGwnIq34UZr18JF93tF4UXr4fX3yI
	qrn5Gry29F4UuabCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUBCb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E
	14v26r4UJVWxJr1ln4kS14v26r1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6x
	kI12xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v2
	6Fy26r45twAv7VC2z280aVAFwI0_Cr0_Gr1UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0x
	vY0x0EwIxGrwCY1x0262kKe7AKxVWUAVWUtwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE
	7xkEbVWUJVW8JwCFI7km07C267AKxVWUXVWUAwC20s026c02F40E14v26r1j6r18MI8I3I
	0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAI
	cVC0I7IYx2IY67AKxVW7JVWDJwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJwCI42
	IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Cr0_Gr1UMIIF0xvEx4A2
	jsIEc7CjxVAFwI0_Gr1j6F4UJbIYCTnIWIevJa73UjIFyTuYvjxUI9NVUUUUU

The module is supported, enable it.

Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 .../boot/dts/loongson-2k2000-ref.dts          |  4 ++++
 arch/loongarch/boot/dts/loongson-2k2000.dtsi  | 19 +++++++++++++++----
 2 files changed, 19 insertions(+), 4 deletions(-)

diff --git a/arch/loongarch/boot/dts/loongson-2k2000-ref.dts b/arch/loongarch/boot/dts/loongson-2k2000-ref.dts
index dca91caf895e..a7af345b30ea 100644
--- a/arch/loongarch/boot/dts/loongson-2k2000-ref.dts
+++ b/arch/loongarch/boot/dts/loongson-2k2000-ref.dts
@@ -39,6 +39,10 @@ linux,cma {
 	};
 };
 
+&clk {
+	status = "okay";
+};
+
 &sata {
 	status = "okay";
 };
diff --git a/arch/loongarch/boot/dts/loongson-2k2000.dtsi b/arch/loongarch/boot/dts/loongson-2k2000.dtsi
index a231949b5f55..605efaba7292 100644
--- a/arch/loongarch/boot/dts/loongson-2k2000.dtsi
+++ b/arch/loongarch/boot/dts/loongson-2k2000.dtsi
@@ -6,6 +6,7 @@
 /dts-v1/;
 
 #include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/clock/loongson,ls2k-clk.h>
 
 / {
 	#address-cells = <2>;
@@ -19,21 +20,22 @@ cpu0: cpu@1 {
 			compatible = "loongson,la364";
 			device_type = "cpu";
 			reg = <0x0>;
-			clocks = <&cpu_clk>;
+			clocks = <&clk LOONGSON2_NODE_CLK>;
 		};
 
 		cpu1: cpu@2 {
 			compatible = "loongson,la364";
 			device_type = "cpu";
 			reg = <0x1>;
-			clocks = <&cpu_clk>;
+			clocks = <&clk LOONGSON2_NODE_CLK>;
 		};
 	};
 
-	cpu_clk: cpu-clk {
+	ref_100m: clock-ref-100m {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
-		clock-frequency = <1400000000>;
+		clock-frequency = <100000000>;
+		clock-output-names = "ref_100m";
 	};
 
 	cpuintc: interrupt-controller {
@@ -51,6 +53,15 @@ bus@10000000 {
 		#address-cells = <2>;
 		#size-cells = <2>;
 
+		clk: clock-controller@10010480 {
+			compatible = "loongson,ls2k2000-clk";
+			reg = <0x0 0x10010480 0x0 0x100>;
+			#clock-cells = <1>;
+			clocks = <&ref_100m>;
+			clock-names = "ref_100m";
+			status = "disabled";
+		};
+
 		pmc: power-management@100d0000 {
 			compatible = "loongson,ls2k2000-pmc", "loongson,ls2k0500-pmc", "syscon";
 			reg = <0x0 0x100d0000 0x0 0x58>;
-- 
2.43.0

