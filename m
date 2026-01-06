Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72A0F1E511
	for <loongarch@lists.linux.dev>; Tue,  6 Jan 2026 01:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767663241; cv=none; b=ac9JNi76I5cDRWtbR2SOhFthd5Hz/1fLhrhmCEfzmrTNpF7SjkbhFKdHZFc3WZb1GnXRhHjMzakXJs4Nn6a64eVk4m8jRbFomabDX8gXOtN2Dye/QlJGPOf/MDO8TF1OgNpWiVWag+IomrEtkN6w5QHTwCxtIRoilc0GADjAO/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767663241; c=relaxed/simple;
	bh=PsYxLWVoZ/9lQbR17RuVFS2n7GT9JYxX8dE46RISiXs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nvwNVW6NMPSpnio320odVRWxnAtpSd+usAmJajRlss1qJM1i3PtnBC4MlRP+ps2sMlaPCsHFZGJyH1i9KHJ4pm7pUwUrQvStsMX8d3T5W0UlpP5viKxh5veXV3NsHsdJnzL9lT89AgbYAckVvy/I/zZSW5lywX7PMTBzgX0sdZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.69.1])
	by gateway (Coremail) with SMTP id _____8DxvsOAZlxp+s0FAA--.18711S3;
	Tue, 06 Jan 2026 09:33:52 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.69.1])
	by front1 (Coremail) with SMTP id qMiowJBxKMF8ZlxpN4IPAA--.20395S3;
	Tue, 06 Jan 2026 09:33:52 +0800 (CST)
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
Subject: [PATCH v2 1/3] dt-binding: rtc: loongson: Correct Loongson-1C interrupts property
Date: Tue,  6 Jan 2026 09:33:31 +0800
Message-ID: <e2d6dd2924469e37ed9aa6892baec50a157eac70.1767663073.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1767663073.git.zhoubinbin@loongson.cn>
References: <cover.1767663073.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJBxKMF8ZlxpN4IPAA--.20395S3
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/1tbiAQETCGlbUrYRfwAAsj
X-Coremail-Antispam: 1Uk129KBj9xXoW7JF47tr43JF13Ar47Jr4kZrc_yoWkGrcE93
	WIyw18Gwn8JF1Iga4qvr4xJryxZ3y2k3WUu3ZrtF10kw10yrs8KFWkAw1Y9F1xurW3uFy5
	Zws7GryvvF17CosvyTuYvTs0mTUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUb78YFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_JF0_JFyl8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwA2z4x0Y4vEx4A2jsIE14v26r4j6F4UM28EF7xvwVC2z280aVCY1x0267AKxVW8
	JVW8Jr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4
	xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ex4A2jsIE14v2
	6r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x0EwI
	xGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480
	Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7
	IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k2
	6cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxV
	AFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8niSPUUUUU==

The `interrupts` property indicates an RTC alarm interrupt, which is only
required for RTCs that support the alarm feature.

As we know, the Loongson-1C RTC does not support the alarm feature, so
it needs to be excluded.

Fixes: 487ef32caebe ("dt-bindings: rtc: Split loongson,ls2x-rtc into SoC-based compatibles")
Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 .../devicetree/bindings/rtc/loongson,rtc.yaml        | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/rtc/loongson,rtc.yaml b/Documentation/devicetree/bindings/rtc/loongson,rtc.yaml
index f89c1f660aee..8a2520f963d8 100644
--- a/Documentation/devicetree/bindings/rtc/loongson,rtc.yaml
+++ b/Documentation/devicetree/bindings/rtc/loongson,rtc.yaml
@@ -42,6 +42,18 @@ required:
 
 unevaluatedProperties: false
 
+if:
+  properties:
+    compatible:
+      not:
+        contains:
+          enum:
+            - loongson,ls1c-rtc
+
+then:
+  required:
+    - interrupts
+
 examples:
   - |
     #include <dt-bindings/interrupt-controller/irq.h>
-- 
2.47.3

