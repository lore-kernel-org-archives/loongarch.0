Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A129542EEB5
	for <loongarch@lists.linux.dev>; Tue,  3 Mar 2026 11:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772537277; cv=none; b=mqzikmZr9QbfwMPtPgO96qj/1LhK0UNVikXNydmLsvQWU2oRYflwVlz+tIsgKVA+M42zPkVRlqnIMQDyV1PWoKHqH6n2nk+7jtUngTTCYeQhSWuFbhVhwkxGORxK4aoAInBF6cwE5ye/kBzlpWNuRfHIfFo8UouJmhYG8I69C0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772537277; c=relaxed/simple;
	bh=JDpJSaBCMI72i1+dB+6tSJPdQTSoAzpCTjBKUnWXPNM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TDMGKqEowa2H0C5QGVnD/HwohT20B/Q5sZC0CkCLLMVMH07MkYadh02yP3UIIPXN41jDjbzuzmLN4+v81ZTBZGnHJLZ2DJs0ighTDUYh3SCHB76kobmJQ+XNnBp2g3bMQztKVxKPsx+6JiTjuXy5hRfXXDXiRG7RRcGTAEj/llE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.227])
	by gateway (Coremail) with SMTP id _____8AxDMO3xaZpRwEXAA--.3978S3;
	Tue, 03 Mar 2026 19:27:51 +0800 (CST)
Received: from kernelserver (unknown [223.64.68.227])
	by front1 (Coremail) with SMTP id qMiowJAxHMKzxaZpM59NAA--.14456S3;
	Tue, 03 Mar 2026 19:27:50 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>
Cc: Huacai Chen <chenhuacai@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH 1/3] dt-bindings: mmc: loongson,ls2k0500-mmc: Add compatible for Loongson-2K0300
Date: Tue,  3 Mar 2026 19:27:38 +0800
Message-ID: <5fd555050c62d1bd7dc4f7fc15f93dd48a8a40c3.1772529875.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1772529875.git.zhoubinbin@loongson.cn>
References: <cover.1772529875.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJAxHMKzxaZpM59NAA--.14456S3
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/1tbiAQEPCGmmeEEIjAAAs1
X-Coremail-Antispam: 1Uk129KBj9xXoWrtFWfArW5Kw47tw4kXw1UArc_yoWDArc_W3
	WIq3WkGrsxAFyag34UZr47Kry3X3s2k3W0k3WUJF18A3y0v345tFykGr98CFyxurs8uF13
	XFs7WryfZ347GosvyTuYvTs0mTUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUb28YFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
	Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jw0_WrylYx0Ex4A2jsIE
	14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x
	0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E
	7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcV
	C0I7IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF
	04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7
	CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07josjUUUUUU=

Add "loongson,ls2k0300-mmc" dedicated compatible to represent the
eMMC/SD/SDIO controller interface of the Loongson-2K0300 chip.

Its hardware design is similar to that of the Loongson-2K2000, but it
suffers from hardware defects such as missing CMD48 interrupts.

Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 Documentation/devicetree/bindings/mmc/loongson,ls2k0500-mmc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mmc/loongson,ls2k0500-mmc.yaml b/Documentation/devicetree/bindings/mmc/loongson,ls2k0500-mmc.yaml
index c142421bc723..b3e8d3f13592 100644
--- a/Documentation/devicetree/bindings/mmc/loongson,ls2k0500-mmc.yaml
+++ b/Documentation/devicetree/bindings/mmc/loongson,ls2k0500-mmc.yaml
@@ -22,6 +22,7 @@ allOf:
 properties:
   compatible:
     enum:
+      - loongson,ls2k0300-mmc
       - loongson,ls2k0500-mmc
       - loongson,ls2k1000-mmc
       - loongson,ls2k2000-mmc
-- 
2.52.0

