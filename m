Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF66513B593
	for <loongarch@lists.linux.dev>; Thu, 11 Apr 2024 02:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712804313; cv=none; b=CWaUiLKQpd7o5yNB5Z19d2HGkA/NY8TXNuK4RZQwgdS+olg22WtcztLADIu1LArCZhvbDWw6BHMH575ixTobmdoFqAeKmwS2PqpqJPsMyFGgoMmy7sUO/x9WjMExXt1a14t9q72XOAv37Uv1z/odecfZtlJnoYhfB5/KB3MdC8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712804313; c=relaxed/simple;
	bh=cZLoiFMWvk72Qshdcb7S6xhavv9LiZ1g4+0y00SMlu4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nVo1UBhJfQl23a8oBioJGk5CYbfuErDYzJJ/zC/X7KtVLiHl1zS15FoKwuJw8y/05BK/bfCJNJYO05kj5LpYQ+tFBalmpjjGW7QAPATFwd63z0Di4we8Sx6XtzM5Gg+6qfFYk5AGNGYxFGr5bi3u7xe6oWaYj2nBzeja8elUL18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [112.20.109.80])
	by gateway (Coremail) with SMTP id _____8DxmfDUURdm35wlAA--.21074S3;
	Thu, 11 Apr 2024 10:58:28 +0800 (CST)
Received: from localhost.localdomain (unknown [112.20.109.80])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8CxLBPLURdmz8l3AA--.34105S5;
	Thu, 11 Apr 2024 10:58:27 +0800 (CST)
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
	Binbin Zhou <zhoubinbin@loongson.cn>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 3/6] dt-bindings: clock: loongson2: Add Loongson-2K0500 compatible
Date: Thu, 11 Apr 2024 10:58:08 +0800
Message-ID: <c4784102d2bb8bf6982799babe39d5827235461d.1712731524.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1712731524.git.zhoubinbin@loongson.cn>
References: <cover.1712731524.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8CxLBPLURdmz8l3AA--.34105S5
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj9xXoWrZr17AFW7tw4xZF4kJF17twc_yoWfWFg_Aa
	4xJ3WkXFZ3AF1FgwsFvF4xtwnxua92yF13CF17AF4kJ345KFZ8JFykJw1akasrWr43uw13
	ZF4kGryIvr4xGosvyTuYvTs0mTUanT9S1TB71UUUUUJqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUbS8YFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_JF0_JFyl8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwA2z4x0Y4vEx4A2jsIE14v26F4j6r4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Gr1j6F4UJwAaw2AFwI0_Jrv_JF1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0c
	Ia020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jw0_
	WrylYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwI
	xGrwCY1x0262kKe7AKxVWUAVWUtwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWU
	JVW8JwCFI7km07C267AKxVWUXVWUAwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4
	vE14v26r106r1rMI8E67AF67kF1VAFwI0_GFv_WrylIxkGc2Ij64vIr41lIxAIcVC0I7IY
	x2IY67AKxVW5JVW7JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26c
	xKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAF
	wI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jzc_-UUUUU=

Add the devicetree compatible for Loongson-2K0500 clocks.

Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
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

