Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92D8A29DB61
	for <loongarch@lists.linux.dev>; Fri, 19 Dec 2025 08:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766134116; cv=none; b=N6LGUtDH2ZwdtgsJx0i3Bb8OlweM80ccdq2tkUro5JOdS4/Y0wWPsEWeEpNf+gl+rHlhJ5Cax3JT6/l/JyiQJCj5AlxQFg+LVrVO5K+8QsY6dg4URo1v/FKXqaNqSXdqWwDS+doObVEbffxLGOrSjXykLeQUIHJPCYj8NzJcslw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766134116; c=relaxed/simple;
	bh=IR20Ohj1NTAwBUfYLQ8frcz1K2pIAlA+ktCHfr+leXs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GvKSzt0khcfkr4D7z9Nsw7QvE/tp2zpAOQsYR2er2AycmS4JWH701/KVsTur43B/M878DJAwSAnuTvhRyaYbBMYAxZlYVbORDBkIvSunQavP8nYtm2mkQ4vPYq1r59S58NTvfVF/DWmOenePZiH3PCQUFydFKdTEHSyKBd1KJGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.69.54])
	by gateway (Coremail) with SMTP id _____8DxvsM8EUVpsscAAA--.3201S3;
	Fri, 19 Dec 2025 16:47:56 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.69.54])
	by front1 (Coremail) with SMTP id qMiowJCxHOE3EUVpDrQBAA--.6650S3;
	Fri, 19 Dec 2025 16:47:55 +0800 (CST)
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
	Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH v2 5/7] LoongArch: dts: loongson-2k1000: Add default Local I/O Interrupt controller address cells
Date: Fri, 19 Dec 2025 16:47:37 +0800
Message-ID: <03c20024742894cee9bd7ddaee4d861c5c7e2e43.1766037997.git.zhoubinbin@loongson.cn>
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
X-CM-TRANSID:qMiowJCxHOE3EUVpDrQBAA--.6650S3
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/1tbiAgEBCGlE6RgD3QAAsI
X-Coremail-Antispam: 1Uk129KBj93XoW7ZFy8XrWkZr4xZr47Jr18Zwc_yoW8WFyUpa
	y29wsrWr48JF1fJw4Dta4YvrnrZF98AFnI9wsakay8ArZIq34UZr1SkF9aqF1UWFZ5J340
	qrnYy3y8Kan8JabCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkIb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAF
	wI0_Gr1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI
	0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUtVWrXwAv7VC2z280
	aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw28Icx
	kI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2Iq
	xVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42
	IY6xIIjxv20xvE14v26ryj6F1UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY
	6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aV
	CY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU8QJ57UUUUU==

Add missing address-cells 0 to the local I/O interrupt controller node
to silence W=1 warning:

  loongson-2k1000.dtsi:498.5-55: Warning (interrupt_map): /bus@10000000/pcie@1a000000/pcie@9,0:interrupt-map:
    Missing property '#address-cells' in node /bus@10000000/interrupt-controller@1fe01440, using 0 as fallback

Value '0' is correct because:
1. The local I/O interrupt controller does not have children,
2. interrupt-map property (in PCI node) consists of five components and
   the fourth component "parent unit address", which size is defined by
   '#address-cells' of the node pointed to by the interrupt-parent
   component, is not used (=0)

Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 arch/loongarch/boot/dts/loongson-2k1000.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/loongarch/boot/dts/loongson-2k1000.dtsi b/arch/loongarch/boot/dts/loongson-2k1000.dtsi
index eee06b84951c..440a8f3c01f4 100644
--- a/arch/loongarch/boot/dts/loongson-2k1000.dtsi
+++ b/arch/loongarch/boot/dts/loongson-2k1000.dtsi
@@ -114,6 +114,7 @@ liointc0: interrupt-controller@1fe01400 {
 			      <0x0 0x1fe01140 0x0 0x8>;
 			reg-names = "main", "isr0", "isr1";
 			interrupt-controller;
+			#address-cells = <0>;
 			#interrupt-cells = <2>;
 			interrupt-parent = <&cpuintc>;
 			interrupts = <2>;
@@ -131,6 +132,7 @@ liointc1: interrupt-controller@1fe01440 {
 			      <0x0 0x1fe01148 0x0 0x8>;
 			reg-names = "main", "isr0", "isr1";
 			interrupt-controller;
+			#address-cells = <0>;
 			#interrupt-cells = <2>;
 			interrupt-parent = <&cpuintc>;
 			interrupts = <3>;
-- 
2.47.3

