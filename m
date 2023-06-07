Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D2AD8C05
	for <loongarch@lists.linux.dev>; Wed,  7 Jun 2023 08:51:25 +0000 (UTC)
Received: from loongson.cn (unknown [223.106.25.146])
	by gateway (Coremail) with SMTP id _____8Bx7eoLRYBksRQAAA--.293S3;
	Wed, 07 Jun 2023 16:51:23 +0800 (CST)
Received: from localhost.localdomain (unknown [223.106.25.146])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8CxXMoGRYBkGikEAA--.6577S6;
	Wed, 07 Jun 2023 16:51:22 +0800 (CST)
From: Yanteng Si <siyanteng@loongson.cn>
To: tiwai@suse.com
Cc: Yanteng Si <siyanteng@loongson.cn>,
	perex@perex.cz,
	chenhuacai@loongson.cn,
	alsa-devel@alsa-project.org,
	loongarch@lists.linux.dev,
	loongson-kernel@lists.loongnix.cn,
	Yingkun Meng <mengyingkun@loongson.cn>
Subject: [PATCH v3 4/4] ALSA: hda/intel: Workaround for WALLCLK register for loongson controller
Date: Wed,  7 Jun 2023 16:51:05 +0800
Message-Id: <bf3d1e928a9096b033833c5ce559dda3c898636b.1686125797.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.31.4
In-Reply-To: <cover.1686125797.git.siyanteng@loongson.cn>
References: <cover.1686125797.git.siyanteng@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8CxXMoGRYBkGikEAA--.6577S6
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
X-Coremail-Antispam: 1Uk129KBj9xXoWrZrW8ZF1fZw4rXrykAFW8uFX_yoWDArcEgw
	sFvryDW3s8GFsxKr1rZrnrXFW3taykAFyxW3Z7tr47JayrKFZ5W34kArnxuFy7Zw4kXF1Y
	9rnIqry09r1UKosvyTuYvTs0mTUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUb7kYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Cr1j6rxdM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I
	8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q6rW5McIj6I8E87Iv67AK
	xVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2Ij64
	vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8G
	jcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2I
	x0cI8IcVAFwI0_Xr0_Ar1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK
	8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I
	0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxU2F4iUUUUU

On loongson controller, the value of WALLCLK register
is always 0, which is meaningless, so we return directly.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
Signed-off-by: Yingkun Meng <mengyingkun@loongson.cn>
---
 sound/pci/hda/hda_intel.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
index a1e3883b00a4..76fddd9e0f15 100644
--- a/sound/pci/hda/hda_intel.c
+++ b/sound/pci/hda/hda_intel.c
@@ -655,6 +655,13 @@ static int azx_position_ok(struct azx *chip, struct azx_dev *azx_dev)
 	unsigned int pos;
 	snd_pcm_uframes_t hwptr, target;
 
+ /*
+  * The value of the WALLCLK register is always 0
+  * on the Loongson controller, so we return directly.
+  */
+	if (chip->driver_type == AZX_DRIVER_LOONGSON)
+		return 1;
+
 	wallclk = azx_readl(chip, WALLCLK) - azx_dev->core.start_wallclk;
 	if (wallclk < (azx_dev->core.period_wallclk * 2) / 3)
 		return -1;	/* bogus (too early) interrupt */
-- 
2.31.4

