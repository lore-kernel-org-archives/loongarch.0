Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71CAD324B37
	for <loongarch@lists.linux.dev>; Tue, 16 Dec 2025 07:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765871795; cv=none; b=Cj8fBFrNY4qPpYjhFHYR8e5WU5TXgTRGK8aklTQzZ5G/LD9grz8Y90IVzUx9uNBkhT7nWMTMUqq//Ps+odC7jGPbPAWF4y118db9oopD6gis0jO6ei4tWyXVNUeofNQkmsu6iEDDbYTTGVR77IZ3eskW0qW/iYLZiMTY/YAPHFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765871795; c=relaxed/simple;
	bh=e6J585BT5glX4rv0GYiHkk3a02y9G9ho/KYeG812spE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RBnA0pReBXlLlOR/Bxj8/0hMmUF1YZvxrKjQAYAVcwTHESLqvUjS4MhHWkHp8PDr4um5SMCW81adkfj/xK4HtuxbqKvvGLLalMw6lhFrFhRZaOSNs9EunZ5vm7bsXkgmeJNXVEpDnU+fIctNqkjDx+goMrn89LlQ2akqfM+MeVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.219])
	by gateway (Coremail) with SMTP id _____8AxB9GmEEFpE5guAA--.35256S3;
	Tue, 16 Dec 2025 15:56:23 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.68.219])
	by front1 (Coremail) with SMTP id qMiowJBxSeCiEEFpbGEAAA--.2262S2;
	Tue, 16 Dec 2025 15:56:21 +0800 (CST)
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
Subject: [PATCH 4/7] LoongArch: dts: loongson-2k0500: Add default Extend I/O Interrupt controller address cells
Date: Tue, 16 Dec 2025 15:56:09 +0800
Message-ID: <c07a7d7062a3645c11fb4fbf7c71c6592f000f37.1765778124.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1765778124.git.zhoubinbin@loongson.cn>
References: <cover.1765778124.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJBxSeCiEEFpbGEAAA--.2262S2
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/1tbiAQESCGlA9LMB8AAAsF
X-Coremail-Antispam: 1Uk129KBj93XoW7KF18tr43JF15Xr43ZFy8CrX_yoW8GFy8pF
	W2kwsrGr40gF1fGw4DtFy2gr1UAF98AFnF9w4vy3y8ArsIq34UZr4fGF9YqF1Ygr4rX34j
	qr1Fk342qa1DAabCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkIb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAF
	wI0_Gr1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI
	0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUtVWrXwAv7VC2z280
	aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw28Icx
	kI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2Iq
	xVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42
	IY6xIIjxv20xvE14v26ryj6F1UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY
	6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aV
	CY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU84xRDUUUUU==

Add missing address-cells 0 to the extend I/O interrupt controller node
to silence W=1 warning:

  loongson-2k0500.dtsi:513.5-51: Warning (interrupt_map): /bus@10000000/pcie@1a000000/pcie@0,0:interrupt-map:
    Missing property '#address-cells' in node /bus@10000000/interrupt-controller@1fe11600, using 0 as fallback

Value '0' is correct because:
1. The extend I/O interrupt controller does not have children,
2. interrupt-map property (in PCI node) consists of five components and
   the fourth component "parent unit address", which size is defined by
   '#address-cells' of the node pointed to by the interrupt-parent
   component, is not used (=0)

Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 arch/loongarch/boot/dts/loongson-2k0500.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/loongarch/boot/dts/loongson-2k0500.dtsi b/arch/loongarch/boot/dts/loongson-2k0500.dtsi
index 357de4ca7555..0594da1ea83d 100644
--- a/arch/loongarch/boot/dts/loongson-2k0500.dtsi
+++ b/arch/loongarch/boot/dts/loongson-2k0500.dtsi
@@ -164,6 +164,7 @@ eiointc: interrupt-controller@1fe11600 {
 			compatible = "loongson,ls2k0500-eiointc";
 			reg = <0x0 0x1fe11600 0x0 0xea00>;
 			interrupt-controller;
+			#address-cells = <0>;
 			#interrupt-cells = <1>;
 			interrupt-parent = <&cpuintc>;
 			interrupts = <3>;
-- 
2.47.3

