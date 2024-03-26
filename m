Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EA5D3A1D7
	for <loongarch@lists.linux.dev>; Tue, 26 Mar 2024 09:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711443688; cv=none; b=Sfv9YcCDOxeFYvl5SINxDuoqKWm5C92sdSxQGBGTe9+a4cDNOYScJLconDzYfdqKUbF6whdSARb0sq+3BlmMEipdRlyBxzy8gZP8gt/uK8e5g+V/bx0cyUS0cT/iUxxcvA2L1tM+DgkghYqH+FNqswG+QtMs/WhaIN0FLEpQUGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711443688; c=relaxed/simple;
	bh=ZLMZXWIqJfjB6j7Q8q78DvIs2Qz3PB7jEcYZrU8Wils=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VBFsd5wmR+KmBhRQE8D87Ez5HlW3l4cUZ/21a1Aylt+oBUuSpKnxrTrlYu5tHHylFghk/K+vJntde1IHmB8eKjkhXeFpn0dDvwKOFrgjIYt92pvgjhVIoAMjVmzhjL/ImKu+XbpXukMePAWPwrtor023rJ4ncGXTvF9NWzxJA4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [112.20.109.198])
	by gateway (Coremail) with SMTP id _____8BxHOvijgJmk04eAA--.61143S3;
	Tue, 26 Mar 2024 17:01:22 +0800 (CST)
Received: from localhost.localdomain (unknown [112.20.109.198])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8BxVMzajgJmV7JoAA--.13451S5;
	Tue, 26 Mar 2024 17:01:21 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yinbo Zhu <zhuyinbo@loongson.cn>
Cc: Huacai Chen <chenhuacai@kernel.org>,
	loongson-kernel@lists.loongnix.cn,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH v1 3/8] dt-bindings: clock: loongson2: add Loongson-2K0500 compatible
Date: Tue, 26 Mar 2024 17:01:02 +0800
Message-ID: <7c7728451fdea3977c492f3daee260590af78d16.1710926402.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1710926402.git.zhoubinbin@loongson.cn>
References: <cover.1710926402.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8BxVMzajgJmV7JoAA--.13451S5
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj9xXoWrZr17AFW7tw4xCrWDKw43XFc_yoW3twb_Aa
	4Iy3WkXFZ3AF1FgwsFvF4xtw13uayIy3W3CF17AF1kJ345KFZ8JFykJw1akasrur43uw13
	ZF4kGry7Zr4xGosvyTuYvTs0mTUanT9S1TB71UUUUUJqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUbSxYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_JF0_JFyl8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1ln4kS14v26r1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12
	xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q
	6rW5McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64
	vIr41lc7CjxVAaw2AFwI0_JF0_Jw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_
	Jr0_Gr1l4IxYO2xFxVAFwI0_Jrv_JF1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8Gjc
	xK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0
	cI8IcVAFwI0_Xr0_Ar1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8V
	AvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E
	14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxU4ApnDUUUU

Add the devicetree compatible for Loongson-2K0500 clocks.

Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 Documentation/devicetree/bindings/clock/loongson,ls2k-clk.yaml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/loongson,ls2k-clk.yaml b/Documentation/devicetree/bindings/clock/loongson,ls2k-clk.yaml
index 63a59015987e..83baee40e200 100644
--- a/Documentation/devicetree/bindings/clock/loongson,ls2k-clk.yaml
+++ b/Documentation/devicetree/bindings/clock/loongson,ls2k-clk.yaml
@@ -16,7 +16,8 @@ description: |
 properties:
   compatible:
     enum:
-      - loongson,ls2k-clk
+      - loongson,ls2k0500-clk
+      - loongson,ls2k-clk  # This is for Loongson-2K1000
 
   reg:
     maxItems: 1
-- 
2.43.0

