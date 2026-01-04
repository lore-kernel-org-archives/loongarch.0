Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 067BA2E1758
	for <loongarch@lists.linux.dev>; Sun,  4 Jan 2026 06:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767508907; cv=none; b=TeC4ex8LXymVIR/Q6Y3TK0swaTSX3MyDZUygP4yziXvwD+Al4Jy5/R85zU7AxS6X5PAB5yEJ7YcyIPz36V6FCKXuxlZYKlj8akkNU4ej4nAzq2UHEb8W3faSAt3+SlxYFpBMoOhsbsawm2Iewt3KqStg3kgQ9Ate0SC7lq74K4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767508907; c=relaxed/simple;
	bh=XRvweoQRXnQW7zdjkM56yWJ4eX5Wh5UBNvvoqDlnL20=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fd2m3RrUfAe7akGlusBMfVqqRLq3NduSXsTV2bnNs3aoBDtR88wc3jS6DAlL+DWKr7zcLP0AuENCqvbYu7yGRDIOOZEhrLUyroPN/Uk16hibE9pyuVG7a9grUEnc5nrDpH1gF7H/LyjayI0fT9M9+6u/a378Ptg3rwlcAB9CIh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.69.1])
	by gateway (Coremail) with SMTP id _____8AxEvGfC1pprlIFAA--.17285S3;
	Sun, 04 Jan 2026 14:41:35 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.69.1])
	by front1 (Coremail) with SMTP id qMiowJCx2+CWC1ppbzUMAA--.28347S4;
	Sun, 04 Jan 2026 14:41:34 +0800 (CST)
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
	Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH v3 2/9] dt-bindings: interrupt-controller: loongson,eiointc: Document address-cells
Date: Sun,  4 Jan 2026 14:41:12 +0800
Message-ID: <3e903541d37432c88c27272094420b03418a607d.1767505859.git.zhoubinbin@loongson.cn>
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
X-CM-TRANSID:qMiowJCx2+CWC1ppbzUMAA--.28347S4
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/1tbiAgERCGlaARoAaQAAsb
X-Coremail-Antispam: 1Uk129KBj9xXoWrKryDGF1fKryxKFWrAF48Xwc_yoWDGrg_uF
	1xC3WrCr1DJFyIg3Z0vrs7tr13J347t3WIk3W2gF18A3WDtrn8GF97Z3yjkrWxXan8uF1r
	XrZakrZ8ZFy7CosvyTuYvTs0mTUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUb7AYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_JFv_Jw1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwA2z4x0Y4vEx4A2jsIE14v26F4j6r4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Gr1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc
	02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUtVWrXwAv7VC2z280aVAF
	wI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw28IcxkI7V
	AKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCj
	r7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6x
	IIjxv20xvE14v26r1I6r4UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAI
	w20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x
	0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IUbCzuJUUUUU==

The Loongson Extend I/O interrupt controller can be referenced in
interrupt-map properties (e.g. in
arch/loongarch/boot/dts/loongson-2k0500.dtsi), thus the nodes should
have address-cells property.

Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 .../bindings/interrupt-controller/loongson,eiointc.yaml        | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/loongson,eiointc.yaml b/Documentation/devicetree/bindings/interrupt-controller/loongson,eiointc.yaml
index 393c128a41d8..3c03d90058ed 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/loongson,eiointc.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/loongson,eiointc.yaml
@@ -29,6 +29,9 @@ properties:
   interrupts:
     maxItems: 1
 
+  '#address-cells':
+    const: 0
+
   interrupt-controller: true
 
   '#interrupt-cells':
-- 
2.47.3

