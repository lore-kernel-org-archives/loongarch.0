Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BC052DEA80
	for <loongarch@lists.linux.dev>; Sun,  4 Jan 2026 06:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767508906; cv=none; b=bzxOJvNWEOOEalqEsEmO/DGPniA+pFM1zVBkqOIBdqqKtuBBTxIQOlnt4zI9yaLGMtdzxg4f7vP85GTbCQdM9TLnn6SXgZOXLkp5nMbBMa3GfTtJ0xkzomJJVzvRtYmKWSqOR+T/rdzqsdLIH+BOHQupj4be4qcDMv+N3A0/FSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767508906; c=relaxed/simple;
	bh=RnVxskyqAy13UFjKv1o7YUk01teDpgQs89ugfKwizY4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pB53gqx3+/g16Ktyi4x/YDTXsRBI22UhS+umI0mrQ2Zdd3IWhZMoHwhVDGRUJc9NwLbkeBU/XBi+L3QO0aBZ+FRYicjR3FN5Wu6LCo3T8yaOJMpm3P443y3xqqOGqV877bEq+l9zl0QkXL+yrd8XxWsNAItAUlJhRLDa+nZFG+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.69.1])
	by gateway (Coremail) with SMTP id _____8Dx_8OdC1ppqFIFAA--.17067S3;
	Sun, 04 Jan 2026 14:41:33 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.69.1])
	by front1 (Coremail) with SMTP id qMiowJCx2+CWC1ppbzUMAA--.28347S3;
	Sun, 04 Jan 2026 14:41:32 +0800 (CST)
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
Subject: [PATCH v3 1/9] dt-bindings: PCI: loongson: Document msi-parent property
Date: Sun,  4 Jan 2026 14:41:11 +0800
Message-ID: <15d61a50f0fcca34f6a5da5fbfdb181646d60fee.1767505859.git.zhoubinbin@loongson.cn>
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
X-CM-TRANSID:qMiowJCx2+CWC1ppbzUMAA--.28347S3
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/1tbiAQERCGlaATYAeAAAsl
X-Coremail-Antispam: 1Uk129KBj9xXoW7GFWkGr48Wry3XF45XF4DWrX_yoWktFXEvF
	yxCFs5Crs8JF1Igwn0vr4xAFy3Za4Ik3Z8ua1kJanYy3WSv39xtF97J3s8ZF13Gr45ur15
	uws7GrWkZr1xGosvyTuYvTs0mTUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUb7kYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_JF0_JFyl8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwA2z4x0Y4vEx4A2jsIE14v26F4j6r4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Gr1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc
	02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUAVWUtwAv7VC2z280aVAF
	wI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw28IcxkI7V
	AKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCj
	r7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6x
	IIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAI
	w20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x
	0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxU7TKZDUUUU

From: Yao Zi <me@ziyao.cc>

Loongson PCI controllers found in LS2K1000/2000 SoCs
(loongson,ls2k-pci), 7A1000/2000 bridge chips (loongson,ls7a-pci), and
RS780E bridge chips (loongson,rs780e-pci) all have their paired MSI
controllers.

Though only the one in LS2K2000 SoC is described in devicetree, we
should document the property for all variants. For the same reason, it
isn't marked as required for now.

Fixes: 83e757ecfd5d ("dt-bindings: Document Loongson PCI Host Controller")
Signed-off-by: Yao Zi <me@ziyao.cc>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 Documentation/devicetree/bindings/pci/loongson.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/pci/loongson.yaml b/Documentation/devicetree/bindings/pci/loongson.yaml
index e5bba63aa947..26e77218b901 100644
--- a/Documentation/devicetree/bindings/pci/loongson.yaml
+++ b/Documentation/devicetree/bindings/pci/loongson.yaml
@@ -32,6 +32,8 @@ properties:
     minItems: 1
     maxItems: 3
 
+  msi-parent: true
+
 required:
   - compatible
   - reg
-- 
2.47.3

