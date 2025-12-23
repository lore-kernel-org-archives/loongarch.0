Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AEFB30171E
	for <loongarch@lists.linux.dev>; Tue, 23 Dec 2025 06:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766472161; cv=none; b=RC50woO1J2DGxTseqOBo792IdYfZQQsHE/5m3B/SyFDJ+DmOxt75r8xIGKj7K/TAxSr6BP2pYZI6xeic+Xj0HYMAUtko2z8DmycQjqT2Wjf+aFrZeeEyhohy046CgKp1dU9oOscAnS0oPOKPw32ob3HvsKqRzxizrOMO2q19ITs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766472161; c=relaxed/simple;
	bh=f3ziabVq/peWL5Af72F3GY3UYxRq27CsYqtRTyfpZSg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mrphkWO6ub2rFsOtrNnpEWiyQH1pDx5wr8ihvEUtL7vmEUK1NBE8+P69wKQYqBE4bpSb+XIQcFVj/RUspjdbIfCetppT0bdiirFcQZOwT58RXbTXvqWcWg482SMYIl6r35BriekEaiDfNJu6E9XIQmgDTvQHM9cEYu0Ys6eh4Sk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.69.54])
	by gateway (Coremail) with SMTP id _____8CxMvHXOUppG0wCAA--.7729S3;
	Tue, 23 Dec 2025 14:42:31 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.69.54])
	by front1 (Coremail) with SMTP id qMiowJBxLMLQOUppTr0DAA--.8929S3;
	Tue, 23 Dec 2025 14:42:28 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-rtc@vger.kernel.org
Cc: Xiaochuang Mao <maoxiaochuan@loongson.cn>,
	Huacai Chen <chenhuacai@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org,
	Keguang Zhang <keguang.zhang@gmail.com>,
	Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH v1 1/2] dt-binding: rtc: loongson: Document Loongson-2K0300 compatible
Date: Tue, 23 Dec 2025 14:42:12 +0800
Message-ID: <36544ba0d847bca639632ea0c74907de90975f80.1766471839.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1766471839.git.zhoubinbin@loongson.cn>
References: <cover.1766471839.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJBxLMLQOUppTr0DAA--.8929S3
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/1tbiAQEFCGlKLzQAcAAAsF
X-Coremail-Antispam: 1Uk129KBj9xXoW7Xry5tr13uFWfGryUKw43twc_yoWktFXEka
	4Ikw18Grs8AF1aga4qvr4xKr9xZ392y3WUC3ZrtF1Fy340vr15tFyvyryYkFyxurW3ZF1r
	Zw4kGryvvw1xGosvyTuYvTs0mTUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUb7AYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_JrI_Jryl8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwA2z4x0Y4vEx4A2jsIE14v26F4j6r4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Gr1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc
	02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUtVWrXwAv7VC2z280aVAF
	wI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw28IcxkI7V
	AKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCj
	r7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6x
	IIjxv20xvE14v26r1I6r4UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAI
	w20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x
	0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU8xOz3UUUUU==

Add "loongson,ls2k0300-rtc" dedicated compatible to represent the RTC
interface of the Loongson-2K0300 chip.

Its hardware design is similar to that of the Loongson-1B, but it does
not support the alarm feature.

Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 .../devicetree/bindings/rtc/loongson,rtc.yaml       | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/rtc/loongson,rtc.yaml b/Documentation/devicetree/bindings/rtc/loongson,rtc.yaml
index f89c1f660aee..aac91c79ffdb 100644
--- a/Documentation/devicetree/bindings/rtc/loongson,rtc.yaml
+++ b/Documentation/devicetree/bindings/rtc/loongson,rtc.yaml
@@ -23,6 +23,7 @@ properties:
           - loongson,ls1b-rtc
           - loongson,ls1c-rtc
           - loongson,ls7a-rtc
+          - loongson,ls2k0300-rtc
           - loongson,ls2k1000-rtc
       - items:
           - enum:
@@ -42,6 +43,18 @@ required:
 
 unevaluatedProperties: false
 
+if:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - loongson,ls1c-rtc
+          - loongson,ls2k0300-rtc
+
+then:
+  properties:
+    interrupts: false
+
 examples:
   - |
     #include <dt-bindings/interrupt-controller/irq.h>
-- 
2.47.3

