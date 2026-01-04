Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B4E62E2DDD
	for <loongarch@lists.linux.dev>; Sun,  4 Jan 2026 06:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767508910; cv=none; b=S7RU0OwaSGVVmBUGrLRNvYoj2SyOJVdrptC6fPK6FUS/uibICLyA0R2MfKITW/PJXegvrVdZPx1qMc4mTN3D/JRJAaBP3UgVByMiNPv1J8JFBhvnLEfnUPT35SNsJNt0xyJZR0UKdC8UWM9NNX1UEh08MKuO7452GXPpvy+/6Yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767508910; c=relaxed/simple;
	bh=/4pz1Z07HOrK5heHQWL/XUv+K74HPzARtxIdOWahaOg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X3rnyxBhkA8cuMpYggRZ1BT32oE8ANGEOntYPEFupxdM+DkVgG0myHlbIUgiSl9HycWJ35S9q1/jg7MfYpphqXmSDkZxlXjMnSGD40iX69PRoQZotFPI4K4TCBtD88HJQyz4UB/V0R7xhzzmgw/IDNKdlzScxK+rI4R7rMwVqL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.69.1])
	by gateway (Coremail) with SMTP id _____8Cx58GgC1ppt1IFAA--.4436S3;
	Sun, 04 Jan 2026 14:41:36 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.69.1])
	by front1 (Coremail) with SMTP id qMiowJCx2+CWC1ppbzUMAA--.28347S5;
	Sun, 04 Jan 2026 14:41:35 +0800 (CST)
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
Subject: [PATCH v3 3/9] dt-bindings: interrupt-controller: loongson,liointc: Document address-cells
Date: Sun,  4 Jan 2026 14:41:13 +0800
Message-ID: <fb3811b6bc387aa23adfc0aaf9a0a31c2d468e79.1767505859.git.zhoubinbin@loongson.cn>
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
X-CM-TRANSID:qMiowJCx2+CWC1ppbzUMAA--.28347S5
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/1tbiAQERCGlaATYAeQAAsk
X-Coremail-Antispam: 1Uk129KBj9xXoW7Jr1xWr18WF17GFyDGFWxGrX_yoWDJrXE93
	WxC3Z5Cr1DAFySg3Z0vrs7try3Z347ta1Sk3ZFgF18Aas8trn8GFZ3Z3yYkrW8Wan09r1f
	XrZakrZ5ZF9FkosvyTuYvTs0mTUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUb7AYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jw0_Gr1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwA2z4x0Y4vEx4A2jsIE14v26F4j6r4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Gr1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc
	02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUtVWrXwAv7VC2z280aVAF
	wI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw28IcxkI7V
	AKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCj
	r7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6x
	IIjxv20xvE14v26r4j6ryUMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAI
	w20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x
	0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IUbCzuJUUUUU==

The Loongson local I/O interrupt controller can be referenced in
interrupt-map properties (e.g. in
arch/loongarch/boot/dts/loongson-2k1000.dtsi), thus the nodes should
have address-cells property.

Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 .../bindings/interrupt-controller/loongson,liointc.yaml        | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/loongson,liointc.yaml b/Documentation/devicetree/bindings/interrupt-controller/loongson,liointc.yaml
index f63b23f48d8e..9f532cb11d0c 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/loongson,liointc.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/loongson,liointc.yaml
@@ -40,6 +40,9 @@ properties:
       - const: isr1
     minItems: 2
 
+  '#address-cells':
+    const: 0
+
   interrupt-controller: true
 
   interrupts:
-- 
2.47.3

