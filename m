Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0295946C
	for <loongarch@lists.linux.dev>; Fri, 19 Dec 2025 08:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766134208; cv=none; b=LydNhpQFoTvh4VGF3ZAid6Pe6A3y7EGeEKiD9NumETdfG1N1uJnbVq3wt9wcgUacSEa5wKclqTihU0aePmvY+lC9tJUkldUrLNicHUf9MGvdHT37JEsS2T60UsU1wZa24ECzHW7vUsiYNziCubBKxjx1kThwtwC/FyDqgN+xvnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766134208; c=relaxed/simple;
	bh=kuGCYS9QSqhY3Rr3pzIUIZ/Ab4TAjQtx2ly8J0e5yRI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tYWo8dW0as4HZ6qGrEPUk0oNrLhaY6r6sABcM8654UHVEGkIr6QkphH9P2OJ0iP2Msld8RnqB7YicN9hpYI02qQ7JnT8RY0p1oZbpefTMg0oHJ8OAWXh9D3GrFcaPGEgZ2NNAHxNM62AlpDCMcGiBL6wE/mDn6BPqaWMtM8X9zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.69.54])
	by gateway (Coremail) with SMTP id _____8AxEvE_EUVpuscAAA--.3296S3;
	Fri, 19 Dec 2025 16:47:59 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.69.54])
	by front1 (Coremail) with SMTP id qMiowJCxHOE3EUVpDrQBAA--.6650S4;
	Fri, 19 Dec 2025 16:47:58 +0800 (CST)
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
Subject: [PATCH v2 6/7] LoongArch: dts: loongson-2k2000: Add default PCH PIC controller address cells
Date: Fri, 19 Dec 2025 16:47:38 +0800
Message-ID: <f8001f7e76495a1b7590a02d1f2afc605f4d3178.1766037997.git.zhoubinbin@loongson.cn>
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
X-CM-TRANSID:qMiowJCxHOE3EUVpDrQBAA--.6650S4
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/1tbiAQEBCGlE6TQEBQAAs4
X-Coremail-Antispam: 1Uk129KBj93XoW7Ww45ur17urW8Wry5CF4Utrc_yoW8GrWDpF
	ZFywsrGr40gr1fC390qFySgr1DAFZ8AF129an0yFW8JwsIvw1jvr1fJF93tF1UKr4rJ3yj
	qrn5Kw12qF45CabCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkab4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAF
	wI0_Gr1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI
	0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWrXVW3AwAv7VC2z280
	aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw28Icx
	kI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2Iq
	xVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42
	IY6xIIjxv20xvE14v26ryj6F1UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1lIxAI
	cVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2js
	IEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jT-e5UUUUU=

Add missing address-cells 0 to the PCH PIC Controller node to silence
W=1 warning:

  loongson-2k2000.dtsi:364.5-49: Warning (interrupt_map): /bus@10000000/pcie@1a000000/pcie@9,0:interrupt-map:
    Missing property '#address-cells' in node /bus@10000000/interrupt-controller@10000000, using 0 as fallback

Value '0' is correct because:
1. The PCH PIC controller does not have children,
2. interrupt-map property (in PCI node) consists of five components and
   the fourth component "parent unit address", which size is defined by
   '#address-cells' of the node pointed to by the interrupt-parent
   component, is not used (=0)

Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 arch/loongarch/boot/dts/loongson-2k2000.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/loongarch/boot/dts/loongson-2k2000.dtsi b/arch/loongarch/boot/dts/loongson-2k2000.dtsi
index 87c45f1f7cc7..9b4bb4c7f60c 100644
--- a/arch/loongarch/boot/dts/loongson-2k2000.dtsi
+++ b/arch/loongarch/boot/dts/loongson-2k2000.dtsi
@@ -149,6 +149,7 @@ pic: interrupt-controller@10000000 {
 			compatible = "loongson,pch-pic-1.0";
 			reg = <0x0 0x10000000 0x0 0x400>;
 			interrupt-controller;
+			#address-cells = <0>;
 			#interrupt-cells = <2>;
 			loongson,pic-base-vec = <0>;
 			interrupt-parent = <&eiointc>;
-- 
2.47.3

