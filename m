Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FE7A481B3
	for <loongarch@lists.linux.dev>; Tue, 24 Sep 2024 07:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727161204; cv=none; b=pA8cPUKQ+tg2sPKGYfrzB9BjbvhfhUnuL29+2lqmoIwhBCqPh2Roeus6ESu5RMSNvinNGkoSPf/7YjEqkl8Hpw12XRMS3yqSzckMoGoC2BULkWHuUvxEh59hqUouynlVTk5GLvuRmY+Li9xL1tnAsVgjtN1ekeqwETXuhA4uf98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727161204; c=relaxed/simple;
	bh=Gi2iHYzZo3YjwxiFy3YA1lYL5lMlVuKT64ksFanbaqY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Kn0LsfLDRsmkQokpem42iII/2LTEGwwB6XQYC3eGohJZ/oC/b6XsHaRrEnWnRT0fkbAqOMcUajkb7D97sSXn9T2jzoKIOV7ron4sEKq/bE/Or6O1ykGSl2QdxYt/RgU3W2fwIkL/lpEZr9hwyNozb5zsx2ARxO/d2kjxvdn2xdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.38])
	by gateway (Coremail) with SMTP id _____8Bx++lvY_JmdcQNAA--.31674S3;
	Tue, 24 Sep 2024 14:59:59 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.68.38])
	by front1 (Coremail) with SMTP id qMiowMCxLeRpY_JmnKQNAA--.11695S3;
	Tue, 24 Sep 2024 14:59:57 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Huacai Chen <chenhuacai@kernel.org>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Weidong Wang <wangweidong.a@awinic.com>,
	Prasad Kumpatla <quic_pkumpatl@quicinc.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Shuming Fan <shumingf@realtek.com>,
	Binbin Zhou <zhoubinbin@loongson.cn>,
	Daniel Drake <drake@endlessm.com>,
	Katsuhiro Suzuki <katsuhiro@katsuster.net>,
	Matteo Martelli <matteomartelli3@gmail.com>
Subject: [PATCH v2 1/9] ASoC: dt-bindings: Add Everest ES8323 Codec
Date: Tue, 24 Sep 2024 14:59:50 +0800
Message-ID: <4269c4bea71230c8145ac6fa5a5881d252b75ec9.1727056789.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <cover.1727056789.git.zhoubinbin@loongson.cn>
References: <cover.1727056789.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMCxLeRpY_JmnKQNAA--.11695S3
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoW7WF48WF13KF1xJr45Xr17CFX_yoW8Xryxpr
	Z7CF9YqryFqF4UG3y7JFy0kF17G39xCF43GFZrCw1Iv3Z8XasYqwn3Kr1UX3WUuFWIgFW5
	urWj9r1Fga4YyFcCm3ZEXasCq-sJn29KB7ZKAUJUUUUf529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUBIb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r126r13M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2kKe7AKxVWUAVWUtwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07
	AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWU
	tVWrXwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7V
	AKI48JMxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY
	6r1j6r4UMxCIbckI1I0E14v26r126r1DMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7
	xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY6xII
	jxv20xvE14v26ryj6F1UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw2
	0EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x02
	67AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU8BuWPUUUUU==

Add DT bindings documentation for the Everest-semi ES8323 codec.

Everest-semi ES8323 codec is a low-power mono audio codec with I2S
audio interface and I2C control.

Cc: Daniel Drake <drake@endlessm.com> 
Cc: Katsuhiro Suzuki <katsuhiro@katsuster.net>
Cc: Matteo Martelli <matteomartelli3@gmail.com>
Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 Documentation/devicetree/bindings/sound/everest,es8316.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/everest,es8316.yaml b/Documentation/devicetree/bindings/sound/everest,es8316.yaml
index 214f135b7777..e4b2eb5fae2f 100644
--- a/Documentation/devicetree/bindings/sound/everest,es8316.yaml
+++ b/Documentation/devicetree/bindings/sound/everest,es8316.yaml
@@ -4,12 +4,13 @@
 $id: http://devicetree.org/schemas/sound/everest,es8316.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Everest ES8311 and ES8316 audio CODECs
+title: Everest ES8311, ES8316 and ES8323 audio CODECs
 
 maintainers:
   - Daniel Drake <drake@endlessm.com>
   - Katsuhiro Suzuki <katsuhiro@katsuster.net>
   - Matteo Martelli <matteomartelli3@gmail.com>
+  - Binbin Zhou <zhoubinbin@loongson.cn>
 
 allOf:
   - $ref: dai-common.yaml#
@@ -19,6 +20,7 @@ properties:
     enum:
       - everest,es8311
       - everest,es8316
+      - everest,es8323
 
   reg:
     maxItems: 1
-- 
2.43.5

