Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81CE12FD1B5
	for <loongarch@lists.linux.dev>; Fri, 26 Jun 2026 02:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782440882; cv=none; b=ffO+klDfEfjB6+UpnKtmT4iPtFgvTsAv+ArMS+7MxLGVecSGCMzByLZCwDyhMTFAVOHYYC7wSbFb3BpvnR5EwW9gY93xlgYgJSAKJlAa97ujYZ45EnKbaBEHjmbo6BPdaQEpn9R4Zty/SGo40/JUcwMu8K9KX/XuocMnuZnF3RU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782440882; c=relaxed/simple;
	bh=AkvTLSpf8tNX3O3zxFlSCiZyBI46jiN6mQBAhF7Ah6c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NC2L8BqjH8HVASkT/dxBaPIcF25Ob8g/LGGMpquxd7EKTbFufZA3vOjL85tkySgT+x/i+g7FkjnbzcGZR8a6yHJNMxG1/drz1u4Xi3w5QIaCmTKIa1iWqFusUzmKyDfC74gEHCV50FZTSrCeaY72Luhy4v9u4GdeSeEh+Fbqx0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.155])
	by gateway (Coremail) with SMTP id _____8Bx+Hiv4z1qMjEYAA--.37495S3;
	Fri, 26 Jun 2026 10:27:59 +0800 (CST)
Received: from kernelserver (unknown [223.64.68.155])
	by front1 (Coremail) with SMTP id qMiowJBx68Gs4z1q0m2zAA--.10481S3;
	Fri, 26 Jun 2026 10:27:58 +0800 (CST)
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
Subject: [PATCH v3 9/9] ASoC: es8328: Add DAPM routes from MIC inputs to Mic Bias
Date: Fri, 26 Jun 2026 10:27:49 +0800
Message-ID: <dcf1f8ae4f1f192a1d63e9fe7044b0218119b5eb.1782439646.git.zhoubinbin@loongson.cn>
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
X-CM-TRANSID:qMiowJBx68Gs4z1q0m2zAA--.10481S3
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/1tbiAQEKCGo8w2QargAAsH
X-Coremail-Antispam: 1Uk129KBj93XoW7CFW7WrWfZr1kuFy5AFW3CFX_yoW8GrWkpF
	4rKrs3tF97J3WfAw1vkw13XF13GFy7uFWfGFWUK3yDKrn8JF4vqr1Fyr129Fs7JrZYgan7
	X3s7t3yrCa43ArXCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkmb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r126r13M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26F4j6r4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAF
	wI0_Gr1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI
	0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWrXVW3AwAv7VC2z280
	aVAFwI0_Cr0_Gr1UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20x
	vY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I
	3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_GFv_WrylIxkGc2Ij64vIr41lIx
	AIcVC0I7IYx2IY67AKxVW7JVWDJwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJwCI
	42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Cr0_Gr1UMIIF0xvEx4
	A2jsIEc7CjxVAFwI0_Gr1j6F4UJbIYCTnIWIevJa73UjIFyTuYvjxU4hF4DUUUU

The ES8328 codec has differential/single-ended microphone inputs
(LINPUT1/RINPUT1, LINPUT2/RINPUT2) that require connection to the
internal Mic Bias generator for proper operation. Currently, these
routes are missing, which can cause microphone recording to fail.

Add the missing DAPM routes to link the input pins to the Mic Bias
supply, ensuring the microphone bias voltage is correctly applied.

Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
PS:
I'm not sure if this patch is also required for other platforms using
the ES8328. If not, I'll drop the patch and add this DAPM route to the
`audio-routing` property of the Loongson ASoC machine driver.

 sound/soc/codecs/es8328.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/sound/soc/codecs/es8328.c b/sound/soc/codecs/es8328.c
index 9838fe42cb6f..aaa6646ad4c5 100644
--- a/sound/soc/codecs/es8328.c
+++ b/sound/soc/codecs/es8328.c
@@ -405,6 +405,11 @@ static const struct snd_soc_dapm_route es8328_dapm_routes[] = {
 
 	{ "Mic Bias", NULL, "Mic Bias Gen" },
 
+	{ "LINPUT1", NULL, "Mic Bias" },
+	{ "RINPUT1", NULL, "Mic Bias" },
+	{ "LINPUT2", NULL, "Mic Bias" },
+	{ "RINPUT2", NULL, "Mic Bias" },
+
 	{ "Left Mixer", NULL, "Left DAC" },
 	{ "Left Mixer", "Left Bypass Switch", "Left Line Mux" },
 	{ "Left Mixer", "Right Playback Switch", "Right DAC" },
-- 
2.52.0

