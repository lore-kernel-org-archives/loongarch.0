Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCD7A2EEE94
	for <loongarch@lists.linux.dev>; Fri, 26 Jun 2026 02:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782440862; cv=none; b=QoYWSjeSthaKFBT4iOD86bCHAmlfaMuGolzjOCjoF41r+EclSDo9Jl9P5DBwkkv96osd5+ZMLCDM0g7aKVAwEClw9M7t7UwoIuV+fTlMFkg09Xa6wE8gAylgS/Mhv5IRYbwsFzKvIm42ouTy4X/d2e8l7o99bK1T2Z9SE6T/89A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782440862; c=relaxed/simple;
	bh=SnojmJIFb+w5VugSLouXkiwNXzM6eXF1SqdLwT7p/Io=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CET+QTEWNyP3sGxNUBR2627ybrEpppkFv2vGbFCsYsPPRgS+kNnmr+o6ILIJoaNJ4BBCVPi9tliu1z+8TqazDnxdX7SoBA+ezncrU9MIXRr8QMccYxQV7b90XUsux/CWUq6pCytStV9I3D7KzU0TFXkhltaotnNqH2JPtJChZys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.155])
	by gateway (Coremail) with SMTP id _____8Bxzemb4z1q+zAYAA--.60429S3;
	Fri, 26 Jun 2026 10:27:39 +0800 (CST)
Received: from kernelserver (unknown [223.64.68.155])
	by front1 (Coremail) with SMTP id qMiowJCxWeCY4z1qr22zAA--.13114S3;
	Fri, 26 Jun 2026 10:27:38 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Keguang Zhang <keguang.zhang@gmail.com>
Cc: Huacai Chen <chenhuacai@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-sound@vger.kernel.org,
	Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH v3 5/9] ASoC: dt-bindings: loongson,ls-audio-card: Add ctcisz forever pi compatible
Date: Fri, 26 Jun 2026 10:27:26 +0800
Message-ID: <183d809cd51874bcb78743273e4b7617f120fedb.1782439646.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1782439646.git.zhoubinbin@loongson.cn>
References: <cover.1782439646.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJCxWeCY4z1qr22zAA--.13114S3
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/1tbiAQEKCGo8w2QaoQAAsI
X-Coremail-Antispam: 1Uk129KBj93XoW7Jry7CF48ZF1xJrW5GF4kuFX_yoW8Jr1kpr
	s7CasrKFWxK3W7Zwn8Xa4fAw4rZ3s3tan7AF47Xw1xGF98tw15W390k3Wjva1akryDJFWU
	XFyFkr4rWFyYywcCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkIb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r126r13M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26rWY6Fy7McIj6I8E87Iv
	67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2
	Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s02
	6x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0x
	vE2Ix0cI8IcVAFwI0_Xr0_Ar1lIxAIcVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwCI42IY
	6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aV
	CY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU0y89JUUUUU==

Add a new compatible string `loongson,ls2k0300-forever-pi-audio-card`
for the audio card on Loongson-2K0300 ctcisz forever pi SoC. It uses a
different DAI format compared to existing Loongson platforms.

The existing "loongson,ls-audio-card" remains valid for LS7A,
Loongson-2K1000 and Loongson-2K2000.

Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 .../devicetree/bindings/sound/loongson,ls-audio-card.yaml     | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/loongson,ls-audio-card.yaml b/Documentation/devicetree/bindings/sound/loongson,ls-audio-card.yaml
index e1b7445a8b22..8c214e5d04b1 100644
--- a/Documentation/devicetree/bindings/sound/loongson,ls-audio-card.yaml
+++ b/Documentation/devicetree/bindings/sound/loongson,ls-audio-card.yaml
@@ -20,7 +20,9 @@ allOf:
 
 properties:
   compatible:
-    const: loongson,ls-audio-card
+    enum:
+      - loongson,ls-audio-card  # Loongson-2K1000/Loongson-2K2000/LS7A
+      - loongson,ls2k0300-forever-pi-audio-card # CTCISZ Forever Pi
 
   mclk-fs:
     $ref: simple-card.yaml#/definitions/mclk-fs
-- 
2.52.0

