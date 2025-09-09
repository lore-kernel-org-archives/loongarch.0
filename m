Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B73AC32C324
	for <loongarch@lists.linux.dev>; Tue,  9 Sep 2025 12:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757419913; cv=none; b=NPclJEcL47lSXEpu1p1kMRtTt0byjavvvx3362CWlTaEuZYwgq61kQXf9FIb4e86n/OUNFlNTKADzRCi9U4WK9s5GR/iKqmKyjnYfLTf9oVYYTMnSG+QDKOFvE+x2AA7GXAQq8KNLUXmNYNx3hsQYxqHSh3oexJ/zAvRtXgIOOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757419913; c=relaxed/simple;
	bh=Bqcfq/5hvvyukGL3kkXiQQnws5gX06F+lhFQbamJsBA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FEPsgGSiQDNcqlsjn8oL+Vo592VNgVuwM/+8L0GSFmCKJiO1EgAS6SzPm1VgjU/s+v4vcm5fGanjRKbHUnw/Z5Dd+hy4zygPQZgrQ/gB6ZiFOqt2Tbif50847YHxeiiX6RmkIUvAb1GD96C1u+g9oQ+Pb8FpBCV+zWoyZf0tcmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.89])
	by gateway (Coremail) with SMTP id _____8DxP9OBGcBog10IAA--.17412S3;
	Tue, 09 Sep 2025 20:11:45 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.68.89])
	by front1 (Coremail) with SMTP id qMiowJCxH8JzGcBoOzSKAA--.57626S5;
	Tue, 09 Sep 2025 20:11:45 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Haowei Zheng <zhenghaowei@loongson.cn>
Cc: Huacai Chen <chenhuacai@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-serial@vger.kernel.org,
	Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH v4 3/3] LoongArch: dts: Add uart new compatible string
Date: Tue,  9 Sep 2025 20:11:20 +0800
Message-ID: <2f93b8f20c6e93a15258888998e926814bfd0adf.1757318368.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1757318368.git.zhoubinbin@loongson.cn>
References: <cover.1757318368.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJCxH8JzGcBoOzSKAA--.57626S5
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoW7urW5KFWkZw4kKFy8ArW7ZFc_yoW8tr45p3
	sI939rKr4Igr1fCryDJFWUJr4kZF98GFnFga13CFyUGrsIqa4jvr1rJF9IqF1rXw4Fq3y0
	grnYgrWa9F4UZabCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkjb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r126r13M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4
	xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jw0_WrylYx0Ex4A2jsIE14v2
	6r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x0EwI
	xGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480
	Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7
	IYx2IY67AKxVW8JVW5JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k2
	6cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxV
	AFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07j5l1kUUUUU=

Add loongson,ls2k*-uart compatible string on uarts.

Co-developed-by: Haowei Zheng <zhenghaowei@loongson.cn>
Signed-off-by: Haowei Zheng <zhenghaowei@loongson.cn>
Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 arch/loongarch/boot/dts/loongson-2k0500.dtsi | 2 +-
 arch/loongarch/boot/dts/loongson-2k1000.dtsi | 2 +-
 arch/loongarch/boot/dts/loongson-2k2000.dtsi | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/loongarch/boot/dts/loongson-2k0500.dtsi b/arch/loongarch/boot/dts/loongson-2k0500.dtsi
index 588ebc3bded4..357de4ca7555 100644
--- a/arch/loongarch/boot/dts/loongson-2k0500.dtsi
+++ b/arch/loongarch/boot/dts/loongson-2k0500.dtsi
@@ -380,7 +380,7 @@ tsensor: thermal-sensor@1fe11500 {
 		};
 
 		uart0: serial@1ff40800 {
-			compatible = "ns16550a";
+			compatible = "loongson,ls2k0500-uart", "ns16550a";
 			reg = <0x0 0x1ff40800 0x0 0x10>;
 			clock-frequency = <100000000>;
 			interrupt-parent = <&eiointc>;
diff --git a/arch/loongarch/boot/dts/loongson-2k1000.dtsi b/arch/loongarch/boot/dts/loongson-2k1000.dtsi
index d8e01e2534dd..60ab425f793f 100644
--- a/arch/loongarch/boot/dts/loongson-2k1000.dtsi
+++ b/arch/loongarch/boot/dts/loongson-2k1000.dtsi
@@ -297,7 +297,7 @@ dma-controller@1fe00c40 {
 		};
 
 		uart0: serial@1fe20000 {
-			compatible = "ns16550a";
+			compatible = "loongson,ls2k1000-uart", "loongson,ls2k0500-uart", "ns16550a";
 			reg = <0x0 0x1fe20000 0x0 0x10>;
 			clock-frequency = <125000000>;
 			interrupt-parent = <&liointc0>;
diff --git a/arch/loongarch/boot/dts/loongson-2k2000.dtsi b/arch/loongarch/boot/dts/loongson-2k2000.dtsi
index 00cc485b753b..6c77b86ee06c 100644
--- a/arch/loongarch/boot/dts/loongson-2k2000.dtsi
+++ b/arch/loongarch/boot/dts/loongson-2k2000.dtsi
@@ -250,7 +250,7 @@ i2c@1fe00130 {
 		};
 
 		uart0: serial@1fe001e0 {
-			compatible = "ns16550a";
+			compatible = "loongson,ls2k2000-uart", "loongson,ls2k1500-uart", "ns16550a";
 			reg = <0x0 0x1fe001e0 0x0 0x10>;
 			clock-frequency = <100000000>;
 			interrupt-parent = <&liointc>;
-- 
2.47.3

