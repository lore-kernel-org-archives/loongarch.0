Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFCAC2DECBA
	for <loongarch@lists.linux.dev>; Tue, 26 May 2026 11:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779796605; cv=none; b=iWC3Ul9lNDJKn3M44lxOZ71MoFUgVmzS77I57lL5wBuTpx7tS6PhrfgzH2QskVbx/GGhBVH4qkZrX820p7huuNpib0dVYRmT9vJ4TTIM2/KD3z0Z/1k7O+zJMFdTFUlQJblsbnGS7pDHEzt6uerv42FZIkscRMSvLoNcDLBB9iQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779796605; c=relaxed/simple;
	bh=26baxojEQUES+iGTE+rTRbPSPsC97B/hRpT8D4AwdqA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QAHh+5BT55llhCz2VYCcPMhi/mZwcFsBlidS10I42LBx8pVNHz9uDe2j4YNZHCaXNiOlFreKTmG1wwWYOWbo0aoN9OSlsVSeg4bRwS2x9FLO60D+c83K8zA+G7JeyUy9O7kHBLYwCTO198gSqpcTYysM+xMydCFVyO3Z5wQKSpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.59])
	by gateway (Coremail) with SMTP id _____8CxncB0ihVqxmMNAA--.14377S3;
	Tue, 26 May 2026 19:56:36 +0800 (CST)
Received: from kernelserver (unknown [223.64.68.59])
	by front1 (Coremail) with SMTP id qMiowJCxGOBwihVq6I+RAA--.13381S3;
	Tue, 26 May 2026 19:56:35 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Huacai Chen <chenhuacai@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	linux-sound@vger.kernel.org,
	Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH v2 5/5] ASoC: codecs: es8323: Adjust the initialization of certain registers
Date: Tue, 26 May 2026 19:56:26 +0800
Message-ID: <738268f7409fafdb65cd25214114fbde4d7e25c5.1779796354.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1779796354.git.zhoubinbin@loongson.cn>
References: <cover.1779796354.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJCxGOBwihVq6I+RAA--.13381S3
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/1tbiAgETCGoVNiwIsAAAsF
X-Coremail-Antispam: 1Uk129KBj93XoWxJF4rXryrAw4kZFWrGFWUKFX_yoW5Gr4kpF
	Z0va98tF1UuF4rXry5AFWrZr1xJryF9FW7C342g39xJr13Zr9293WFqFy0vryrZFsxtr4D
	Zr1j93yUJ3WfG3XCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUk2b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r126r13M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26rWY6Fy7McIj6I8E87Iv
	67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2
	Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s02
	6x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0x
	vE2Ix0cI8IcVAFwI0_Xr0_Ar1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE
	42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6x
	kF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUsrcTUUUUU

A few additional register initializations are required for proper
operation.

- During hw_params, write ES8323_DACPOWER (0x3c) to ensure DAC power
  is correctly configured for the selected sample rate.
- In the probe function, initialize DACCONTROL17, DACCONTROL20,
  ADCCONTROL10, LOUT1_VOL, and ROUT1_VOL to improve analog output
  stability and volume level.
- In set_bias_level, set CHIPPOWER to 0x00 when powering up and
  to 0xff when powering off, fully controlling the chip's power
  state.

Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 sound/soc/codecs/es8323.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/sound/soc/codecs/es8323.c b/sound/soc/codecs/es8323.c
index d067f7bda03a..be5d9a2dea11 100644
--- a/sound/soc/codecs/es8323.c
+++ b/sound/soc/codecs/es8323.c
@@ -613,6 +613,8 @@ static int es8323_pcm_hw_params(struct snd_pcm_substream *substream,
 	snd_soc_component_write_field(component, ES8323_DACCONTROL1,
 				      ES8323_DACCONTROL1_DACWL, wl_mode);
 
+	snd_soc_component_write(component, ES8323_DACPOWER, 0x3c);
+
 	return 0;
 }
 
@@ -675,7 +677,12 @@ static int es8323_probe(struct snd_soc_component *component)
 	}
 
 	snd_soc_component_write(component, ES8323_CONTROL2, 0x60);
+	snd_soc_component_write(component, ES8323_DACCONTROL17, 0xb8);
+	snd_soc_component_write(component, ES8323_DACCONTROL20, 0xb8);
 	snd_soc_component_write(component, ES8323_DACCONTROL21, 0x80);
+	snd_soc_component_write(component, ES8323_ADCCONTROL10, 0xea);
+	snd_soc_component_write(component, ES8323_LOUT1_VOL, 0x1b);
+	snd_soc_component_write(component, ES8323_ROUT1_VOL, 0x1b);
 
 	return 0;
 }
@@ -694,6 +701,7 @@ static int es8323_set_bias_level(struct snd_soc_component *component,
 		if (ret)
 			return ret;
 
+		snd_soc_component_write(component, ES8323_CHIPPOWER, 0x00);
 		snd_soc_component_write(component, ES8323_CHIPLOPOW1, 0x00);
 		snd_soc_component_write(component, ES8323_CHIPLOPOW2, 0x00);
 		snd_soc_component_update_bits(component, ES8323_ADCPOWER,
@@ -702,6 +710,7 @@ static int es8323_set_bias_level(struct snd_soc_component *component,
 	case SND_SOC_BIAS_STANDBY:
 		break;
 	case SND_SOC_BIAS_OFF:
+		snd_soc_component_write(component, ES8323_CHIPPOWER, 0xff);
 		snd_soc_component_write(component, ES8323_CHIPLOPOW1, 0xff);
 		snd_soc_component_write(component, ES8323_CHIPLOPOW2, 0xff);
 		clk_disable_unprepare(es8323->mclk);
-- 
2.52.0

