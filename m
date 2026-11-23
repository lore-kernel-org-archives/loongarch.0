Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=114.242.206.163
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795427113;
	b=rbT//bVFJ24Uz7Q5Hgk+rauztBGCPU2Y0M8RqBfvmDMte1ik4KHg5SwsBXkHD6ZKG5/z
	 m6J/Gk7aAzgvuND/EdDFZPXfSrjuYK1YWhF6raE8/N3J23PSxEUqfG/K7kpV4Lvxd6LoT
	 aHfZuszpAElxkAzFtH0IcSoMqUFbw3lP4R3WEAJgdxHnLZxekP8CyQx9RGUQEVOKdaOm4
	 re9PpDqjisiTUt3tcYtMNuB+GK3NbbAgRTVP09X0iU5uHx0/chxzRMooQZR+qxieqqAcn
	 OyWWghzkVre3CMhXsEMsfPgJeBZEoaG4m8ER+OhCOnxeqVLjLVahm8tjfKZJDEQFDHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795427113;
	h=DMARC-Filter:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-CM-SenderInfo:
	 X-Coremail-Antispam;
	bh=x1z0GbdrQIHQcp51uliucAtdNXofwnV/BX4voI0/ibU=;
	b=n0oR7h7SORkuPDUPMrfE2xsI7WAfaY8NrLbYBwreFX0e9KGctFfF1MsjRzOOk5Sq1WZw
	 i16GDjzFdNL7PUyAvJi/VKKIWqf2+gizbc45rDrZp5uEDSEnBeTfQaw6HZSX6LEDCtqhj
	 DxZE1qaqL6lPp+PVUoJUXs7qfqyJjZFqc64tLDQeWgWme5C6dROjePSdbmSLaUCfLjAEC
	 vvfwxsVmfi/rmwoBJL+/ehbUn6mWVPgTXCpWl2xaMsMR7cQawjzgl+6m6nLuNLL8uQS68
	 KgVJUr5h64lH01MuKP4JrIzEasZjA//Mjzd8g4AsGDIToLB39ajTIKfA4JVjoklMizQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=loongson.cn;
	spf=pass smtp.mailfrom=loongson.cn;
	arc=none smtp.remote-ip=114.242.206.163
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 692E9606A31A
	for <loongarch@lists.linux.dev>; Mon, 23 Nov 2026 09:45:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 692E9606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.69.66])
	by gateway (Coremail) with SMTP id _____8DxTNAmCwRr3DAiAA--.4100S3;
	Mon, 23 Nov 2026 17:45:10 +0800 (CST)
Received: from kernelserver (unknown [223.64.69.66])
	by front1 (Coremail) with SMTP id qMiowJDxTs8jCwRrW9o2AA--.44054S3;
	Mon, 23 Nov 2026 17:45:09 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yinbo Zhu <zhuyinbo@loongson.cn>,
	Mark Brown <broonie@kernel.org>
Cc: Huacai Chen <chenhuacai@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-spi@vger.kernel.org,
	Bingxiong Li <libingxiong@loongson.cn>,
	Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH 1/5] spi: dt-bindings: loongson,ls2k-spi: Document loongson,ls2k0300-spi compatible
Date: Mon, 23 Nov 2026 17:44:46 +0800
Message-ID: <00177b3d15224a5f92b73789cbcbcde4d71922a9.1795425389.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1795425389.git.zhoubinbin@loongson.cn>
References: <cover.1795425389.git.zhoubinbin@loongson.cn>
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJDxTs8jCwRrW9o2AA--.44054S3
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/1tbiAQEACGsDnvwK9AAAs8
X-Coremail-Antispam: 1Uk129KBj9xXoWrZFW7AFWrZryDWFWrCr4UGFX_yoWkJrX_Za
	4xKF48Cr4DAF1Fq34jvr4xKFy3Xayay3WrCwnrJF109390gr9xJFyvy3sIkFy8Cr45uw1f
	ua1kGry0vrs7GosvyTuYvTs0mTUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUb7AYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	WUJVW8JwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
	Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ex4A2jsIE
	14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x
	0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E
	7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcV
	C0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF
	04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7
	CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU82g43UUUUU==

The SPI flash controller on Loongson-2K0300 shares the same register
layout and functionality as the one on Loongson-2K1000. Add a dedicated
compatible string `loongson,ls2k0300-spi` with
`loongson,ls2k1000-spi` as fallback to allow proper DT binding.

Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 Documentation/devicetree/bindings/spi/loongson,ls2k-spi.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/spi/loongson,ls2k-spi.yaml b/Documentation/devicetree/bindings/spi/loongson,ls2k-spi.yaml
index de9d32feadf5..8a36dbece788 100644
--- a/Documentation/devicetree/bindings/spi/loongson,ls2k-spi.yaml
+++ b/Documentation/devicetree/bindings/spi/loongson,ls2k-spi.yaml
@@ -19,6 +19,7 @@ properties:
           - loongson,ls2k1000-spi
       - items:
           - enum:
+              - loongson,ls2k0300-spi
               - loongson,ls2k0500-spi
           - const: loongson,ls2k1000-spi
 
@@ -28,6 +29,9 @@ properties:
   clocks:
     maxItems: 1
 
+  interrupts:
+    maxItems: 1
+
 required:
   - compatible
   - reg
-- 
2.52.0

