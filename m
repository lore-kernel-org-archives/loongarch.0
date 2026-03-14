Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABEC822332E
	for <loongarch@lists.linux.dev>; Sat, 14 Mar 2026 16:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773505751; cv=none; b=nWaV2XQb5aeUU6EpIyqT4y/PmcG+WRbBkrxQiy8/dvL8r7/LzbvmRxC5FDXbUijQJ5Vil0Kb+bEmThF4CaAoi5JG4kNWf8UANo/ohZ9MpdsbY5HHc7geYqMlHV2WbDBHkWD2s0ctkFpvIl7s+Hs4afzRmZuBYlpiHcZFKnElwJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773505751; c=relaxed/simple;
	bh=iVShpG0Z/dcJZEudexrQsbP4JDOi+uyIxkpcfEemDE8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bimrB5Za4/9ZiQxeGWSZDxOF0eGdmArSRcNfHPeT3725oIWa3De17c/0urmCAmbCi3lXFk9Z+iXL+W6cIJPhGcYIgfhSgT8zbkkMSyw4weLzJW9qDj8SCPkhY42op2v3OS84c8Bt2YUzrSpBz0T/fLr6GRySgEF4/O/mEswetT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from edelgard.fodlan.icenowy.me (unknown [112.94.100.43])
	by APP-03 (Coremail) with SMTP id rQCowAB3ktmwjLVpHpqpCg--.41252S9;
	Sun, 15 Mar 2026 00:29:03 +0800 (CST)
From: Icenowy Zheng <zhengxingda@iscas.ac.cn>
To: Thomas Gleixner <tglx@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: Icenowy Zheng <uwu@icenowy.me>,
	Yao Zi <me@ziyao.cc>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org,
	Icenowy Zheng <zhengxingda@iscas.ac.cn>
Subject: [PATCH v3 7/8] MIPS: Loongson64: dts: sort nodes
Date: Sun, 15 Mar 2026 00:28:27 +0800
Message-ID: <20260314162828.1055188-8-zhengxingda@iscas.ac.cn>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260314162828.1055188-1-zhengxingda@iscas.ac.cn>
References: <20260314162828.1055188-1-zhengxingda@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowAB3ktmwjLVpHpqpCg--.41252S9
X-Coremail-Antispam: 1UD129KBjvJXoWrZFy3Wr1ktr45Aw1fAr48Xrb_yoW8JrWfpw
	srA3929r4FgFn8trn0qFyrXF4fAFZYyFyDuFs2yrW7J3sYq3Wjvr1xGFyrtr9rWrWrZ34j
	grn7t34jkF1xuw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUmv14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
	kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
	z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F
	4UJwA2z4x0Y4vEx4A2jsIE14v26r4j6F4UM28EF7xvwVC2z280aVCY1x0267AKxVW8Jr0_
	Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6x
	IIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_
	Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8c
	xan2IY04v7MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCj
	c4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4
	CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1I6r4U
	MIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8Jr0_Cr1UMIIF0xvE42xK8VAvwI8IcIk0rVWUJV
	WUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4UJVWxJrUv
	cSsGvfC2KfnxnUUI43ZEXa7VUbPC7UUUUUU==
X-CM-SenderInfo: x2kh0wp0lqwv3d6l2u1dvotugofq/

The RTC's address is after UARTs, however the node is currently before
them.

Re-order the node to match address sequence.

Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
---
 arch/mips/boot/dts/loongson/ls7a-pch.dtsi | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/mips/boot/dts/loongson/ls7a-pch.dtsi b/arch/mips/boot/dts/loongson/ls7a-pch.dtsi
index 6dee85909f5a6..59ca1ef0a7b64 100644
--- a/arch/mips/boot/dts/loongson/ls7a-pch.dtsi
+++ b/arch/mips/boot/dts/loongson/ls7a-pch.dtsi
@@ -19,13 +19,6 @@ pic: interrupt-controller@10000000 {
 			#interrupt-cells = <2>;
 		};
 
-		rtc0: rtc@100d0100 {
-			compatible = "loongson,ls7a-rtc";
-			reg = <0 0x100d0100 0 0x78>;
-			interrupt-parent = <&pic>;
-			interrupts = <52 IRQ_TYPE_LEVEL_HIGH>;
-		};
-
 		ls7a_uart0: serial@10080000 {
 			compatible = "ns16550a";
 			reg = <0 0x10080000 0 0x100>;
@@ -65,6 +58,13 @@ ls7a_uart3: serial@10080300 {
 			no-loopback-test;
 		};
 
+		rtc0: rtc@100d0100 {
+			compatible = "loongson,ls7a-rtc";
+			reg = <0 0x100d0100 0 0x78>;
+			interrupt-parent = <&pic>;
+			interrupts = <52 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
 		pci@1a000000 {
 			compatible = "loongson,ls7a-pci";
 			device_type = "pci";
-- 
2.52.0

