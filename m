Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7CAD2D29C8
	for <loongarch@lists.linux.dev>; Thu,  4 Jun 2026 02:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780539110; cv=none; b=Bpb2R79fnWzRGL+itddOPOpGkX71E9jwTWrvfmReApWRDbbS1qhJWT1wlBMce4N8DHuc1po9PCjFhXQ0fe+tE06pW/VoHnTVOG/ddRmDOeLflWYsrU6rYTYKUkDLIejCP8INrQE36TcIf0SOJei7Twx2VFT2mGYkKxOqTyCb8pA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780539110; c=relaxed/simple;
	bh=+V6AIWfyM6FTGDpl9t/525pgkKv+eOUl6q1ny8/q/KM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OeD1xgponB17biQwh7Zeuh51euLR97U6230THW1a2lUCRLtCPsASZfAGtdx3/6Rq6mL07QA25JGOKTJQYV+0bBVvmZpDIx9+xZwLma2T30EWs6yENGP+32Y4HnryZPb1oHauwc8FPI8OjX7KyOKqMycc6EyvG95crqS9mz0M8GE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.59])
	by gateway (Coremail) with SMTP id _____8Bxzene3iBqNGEQAA--.43861S3;
	Thu, 04 Jun 2026 10:11:42 +0800 (CST)
Received: from kernelserver (unknown [223.64.68.59])
	by front1 (Coremail) with SMTP id qMiowJBx78LZ3iBq1UabAA--.33017S5;
	Thu, 04 Jun 2026 10:11:41 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Huacai Chen <chenhuacai@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-sound@vger.kernel.org,
	Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH v2 3/7] ASoC: dt-bindings: loongson,ls-audio-card: Use common sound card
Date: Thu,  4 Jun 2026 10:11:23 +0800
Message-ID: <bbbcfd66b3b98713315f1af374c8da1065c8db68.1780538113.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1780538113.git.zhoubinbin@loongson.cn>
References: <cover.1780538113.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJBx78LZ3iBq1UabAA--.33017S5
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/1tbiAgEICGofwi0ZagAAsq
X-Coremail-Antispam: 1Uk129KBj93XoW7ury8Ww4rtw43tFWDtF18WFX_yoW8Wr4UpF
	ZxC3srKr48t3W7Zas5ZFyxCw4Sq3sYya9rXFW2q34DJFZ0qanYqw1ak3Wjqa15CF9YqFW7
	WFyFkrn8Ga43CwcCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUk2b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q6rW5McIj6I8E87Iv
	67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2
	Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s02
	6x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0x
	vE2Ix0cI8IcVAFwI0_Xr0_Ar1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE
	42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6x
	kF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUcHUqUUUUU

Reference the common sound card properties. This allows removing the
`model` property and directly using the common `audio-routing` property
later on.

Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 .../bindings/sound/loongson,ls-audio-card.yaml        | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/loongson,ls-audio-card.yaml b/Documentation/devicetree/bindings/sound/loongson,ls-audio-card.yaml
index 61e8babed402..e1b7445a8b22 100644
--- a/Documentation/devicetree/bindings/sound/loongson,ls-audio-card.yaml
+++ b/Documentation/devicetree/bindings/sound/loongson,ls-audio-card.yaml
@@ -8,20 +8,20 @@ title: Loongson 7axxx/2kxxx ASoC audio sound card driver
 
 maintainers:
   - Yingkun Meng <mengyingkun@loongson.cn>
+  - Binbin Zhou <zhoubinbin@loongson.cn>
 
 description:
   The binding describes the sound card present in loongson
   7axxx/2kxxx platform. The sound card is an ASoC component
   which uses Loongson I2S controller to transfer the audio data.
 
+allOf:
+  - $ref: sound-card-common.yaml#
+
 properties:
   compatible:
     const: loongson,ls-audio-card
 
-  model:
-    $ref: /schemas/types.yaml#/definitions/string
-    description: User specified audio sound card name
-
   mclk-fs:
     $ref: simple-card.yaml#/definitions/mclk-fs
 
@@ -47,12 +47,11 @@ properties:
 
 required:
   - compatible
-  - model
   - mclk-fs
   - cpu
   - codec
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
-- 
2.52.0

