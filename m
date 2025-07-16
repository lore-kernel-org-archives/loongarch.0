Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA79E289346
	for <loongarch@lists.linux.dev>; Wed, 16 Jul 2025 07:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752649381; cv=none; b=EjijMdPH/1AgyfdtWi2rme7tOZEBbHghhF4Z8A8dALORO1ybKBwVjSsSQezYEPwSqtFizANKKqFWazQXrFwYZH58X6JYESC0mlIHMbyhLXnMqqhHTB/byDbDEKpJuUGaW2ClPoj2jJgneoIEPxk0a4TxfuHfre7U2KWwklPUrhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752649381; c=relaxed/simple;
	bh=JrDdmDazemyu6/6F25kPPNyzjuVa+2wySlOW3Q4baOQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TquW2Z6sr3AlX0S4YHs/a6EpUsBOqTuzw7KZARwsQzxpFM0yg+M8uj9r6sdEqNkVGA0dKt4Gi5lDe9CoCN+nuDnrr6tbsyKv9EdftFn7jWdtfoF0GxCEylN2CnOAeP4olyFbXad8uOtoKb7cdRFAzx1lURLsV4ZbvI1suW9dthA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.193])
	by gateway (Coremail) with SMTP id _____8DxjXKgTndoKgMrAQ--.23701S3;
	Wed, 16 Jul 2025 15:02:56 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.68.193])
	by front1 (Coremail) with SMTP id qMiowJCxocKbTndoBnYZAA--.5577S4;
	Wed, 16 Jul 2025 15:02:55 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>
Cc: Huacai Chen <chenhuacai@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH 3/3] LoongArch: dts: Add eMMC/sdio controller support to Loongson-2K2000
Date: Wed, 16 Jul 2025 15:02:43 +0800
Message-ID: <20250716070243.3846100-3-zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250716070243.3846100-1-zhoubinbin@loongson.cn>
References: <20250716070243.3846100-1-zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJCxocKbTndoBnYZAA--.5577S4
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoWxJrWxXw45JF47Gr48ZrW7KFX_yoW8Aw17pa
	sruwsxKrW8Wr1Sgr98JrWUGrn5AFWkGF9rWanxCFWUGanFvw1jvr18JF9aqF18Ww4rX3yI
	qrn5G343KF4UXabCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkYb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v2
	6F4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc
	02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUtVWrXwAv7VC2z280aVAF
	wI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw28IcxkI7V
	AKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCj
	r7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6x
	IIjxv20xvE14v26r1I6r4UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAI
	w20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x
	0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU8QJ57UUUUU==

The Loongson-2K2000 integrates one eMMC controller and one SDIO controller.

The module is supported now, enable it.

Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 .../loongarch/boot/dts/loongson-2k2000-ref.dts | 10 ++++++++++
 arch/loongarch/boot/dts/loongson-2k2000.dtsi   | 18 ++++++++++++++++++
 2 files changed, 28 insertions(+)

diff --git a/arch/loongarch/boot/dts/loongson-2k2000-ref.dts b/arch/loongarch/boot/dts/loongson-2k2000-ref.dts
index ea9e6985d0e9..3c6b12220386 100644
--- a/arch/loongarch/boot/dts/loongson-2k2000-ref.dts
+++ b/arch/loongarch/boot/dts/loongson-2k2000-ref.dts
@@ -39,6 +39,16 @@ linux,cma {
 	};
 };
 
+&emmc {
+	status = "okay";
+
+	bus-width = <8>;
+	cap-mmc-highspeed;
+	mmc-hs200-1_8v;
+	no-sd;
+	no-sdio;
+};
+
 &sata {
 	status = "okay";
 };
diff --git a/arch/loongarch/boot/dts/loongson-2k2000.dtsi b/arch/loongarch/boot/dts/loongson-2k2000.dtsi
index 9e0411f2754c..00cc485b753b 100644
--- a/arch/loongarch/boot/dts/loongson-2k2000.dtsi
+++ b/arch/loongarch/boot/dts/loongson-2k2000.dtsi
@@ -259,6 +259,24 @@ uart0: serial@1fe001e0 {
 			status = "disabled";
 		};
 
+		emmc: mmc@79990000 {
+			compatible = "loongson,ls2k2000-mmc";
+			reg = <0x0 0x79990000 0x0 0x1000>;
+			interrupt-parent = <&pic>;
+			interrupts = <51 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk LOONGSON2_EMMC_CLK>;
+			status = "disabled";
+		};
+
+		mmc@79991000 {
+			compatible = "loongson,ls2k2000-mmc";
+			reg = <0x0 0x79991000 0x0 0x1000>;
+			interrupt-parent = <&pic>;
+			interrupts = <50 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk LOONGSON2_EMMC_CLK>;
+			status = "disabled";
+		};
+
 		pcie@1a000000 {
 			compatible = "loongson,ls2k-pci";
 			reg = <0x0 0x1a000000 0x0 0x02000000>,
-- 
2.47.3

