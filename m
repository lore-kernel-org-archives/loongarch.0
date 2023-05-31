Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 136091863
	for <loongarch@lists.linux.dev>; Wed, 31 May 2023 03:21:48 +0000 (UTC)
Received: from loongson.cn (unknown [223.106.25.146])
	by gateway (Coremail) with SMTP id _____8CxqPFFvXZk2tMCAA--.6461S3;
	Wed, 31 May 2023 11:21:41 +0800 (CST)
Received: from localhost.localdomain (unknown [223.106.25.146])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Cx77M_vXZkqrWBAA--.14943S5;
	Wed, 31 May 2023 11:21:41 +0800 (CST)
From: Yanteng Si <siyanteng@loongson.cn>
To: tiwai@suse.com
Cc: Yanteng Si <siyanteng@loongson.cn>,
	perex@perex.cz,
	chenhuacai@loongson.cn,
	alsa-devel@alsa-project.org,
	loongarch@lists.linux.dev,
	loongson-kernel@lists.loongnix.cn,
	Yingkun Meng <mengyingkun@loongson.cn>
Subject: [PATCH 3/4] ALSA: hda: Workaround for SDnCTL register on loongson controller
Date: Wed, 31 May 2023 11:21:33 +0800
Message-Id: <74a63661726b8c44be72bf3bd35a3259f2ae2e6a.1685501806.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.31.4
In-Reply-To: <cover.1685501806.git.siyanteng@loongson.cn>
References: <cover.1685501806.git.siyanteng@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8Cx77M_vXZkqrWBAA--.14943S5
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
X-Coremail-Antispam: 1Uk129KBjvJXoWxJry8KFyftrWUtw1xXFW8JFb_yoW8Xw17pw
	s5CayrKFZrta109a1Yk345KF1UGFWkJasrtrWFyw18Zw1ktr1Fqryqyr48ZFy0kryYgrW3
	AFy3tr98Xw45WFUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
	qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
	b28YFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
	1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
	wVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4
	x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJVWxJr1l
	e2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4xG64xvF2
	IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jw0_WrylYx0Ex4A2jsIE14v26r4j6F4U
	McvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x0EwIxGrwCFx2
	IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v2
	6r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67
	AKxVW8JVW5JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IY
	s7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr
	0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07josjUUUUUU=

On loongson controller, after calling snd_hdac_stream_updateb()
to enable DMA engine, the SDnCTL.STRM will become to zero.  We
need to access SDnCTL in dword to keep SDnCTL.STRM is not changed.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
Signed-off-by: Yingkun Meng <mengyingkun@loongson.cn>
---
 sound/hda/hdac_stream.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/sound/hda/hdac_stream.c b/sound/hda/hdac_stream.c
index 1f56fd33b9af..90fbf9fea2b3 100644
--- a/sound/hda/hdac_stream.c
+++ b/sound/hda/hdac_stream.c
@@ -13,6 +13,7 @@
 #include <sound/hdaudio.h>
 #include <sound/hda_register.h>
 #include "trace.h"
+#include "../pci/hda/hda_controller.h"
 
 /*
  * the hdac_stream library is intended to be used with the following
@@ -130,6 +131,7 @@ EXPORT_SYMBOL_GPL(snd_hdac_stream_init);
 void snd_hdac_stream_start(struct hdac_stream *azx_dev)
 {
 	struct hdac_bus *bus = azx_dev->bus;
+	struct azx *chip = bus_to_azx(bus);
 	int stripe_ctl;
 
 	trace_snd_hdac_stream_start(bus, azx_dev);
@@ -150,7 +152,11 @@ void snd_hdac_stream_start(struct hdac_stream *azx_dev)
 					stripe_ctl);
 	}
 	/* set DMA start and interrupt mask */
-	snd_hdac_stream_updateb(azx_dev, SD_CTL,
+	if (chip->driver_caps & AZX_DCAPS_LOONGSON_WORKAROUND)
+		snd_hdac_stream_updatel(azx_dev, SD_CTL,
+				0, SD_CTL_DMA_START | SD_INT_MASK);
+	else
+		snd_hdac_stream_updateb(azx_dev, SD_CTL,
 				0, SD_CTL_DMA_START | SD_INT_MASK);
 	azx_dev->running = true;
 }
-- 
2.31.4

