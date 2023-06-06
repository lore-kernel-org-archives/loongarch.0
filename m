Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B7BD28C24
	for <loongarch@lists.linux.dev>; Tue,  6 Jun 2023 13:26:00 +0000 (UTC)
Received: from loongson.cn (unknown [223.106.25.146])
	by gateway (Coremail) with SMTP id _____8Cx_erZM39kaTAAAA--.793S3;
	Tue, 06 Jun 2023 21:25:45 +0800 (CST)
Received: from localhost.localdomain (unknown [223.106.25.146])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8AxfcrVM39kyHICAA--.1597S5;
	Tue, 06 Jun 2023 21:25:45 +0800 (CST)
From: Yanteng Si <siyanteng@loongson.cn>
To: tiwai@suse.com
Cc: Yanteng Si <siyanteng@loongson.cn>,
	perex@perex.cz,
	chenhuacai@loongson.cn,
	alsa-devel@alsa-project.org,
	loongarch@lists.linux.dev,
	loongson-kernel@lists.loongnix.cn,
	Yingkun Meng <mengyingkun@loongson.cn>
Subject: [PATCH v2 3/4] ALSA: hda: Workaround for SDnCTL register on loongson controller
Date: Tue,  6 Jun 2023 21:25:29 +0800
Message-Id: <5e1de6145ad6fd32814165f596be38ef03137c8d.1686057365.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.31.4
In-Reply-To: <cover.1686057365.git.siyanteng@loongson.cn>
References: <cover.1686057365.git.siyanteng@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8AxfcrVM39kyHICAA--.1597S5
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
X-Coremail-Antispam: 1Uk129KBj93XoWxJry8KFyftFyrGrW3Zw1kZwc_yoW8Cw1rpr
	1kC34rKFZFqF4vkF45Ga4UKF18Gas7G3ZIkrW0k348Ars2vr1Fv3srtF4UZFyUGrWrWry3
	Za45t34rX345XwbCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkYb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1q6r4UM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v2
	6F4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc
	02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUtVWrXwAv7VC2z280aVAF
	wI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw28IcxkI7V
	AKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCj
	r7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6x
	IIjxv20xvE14v26r1I6r4UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAI
	w20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x
	0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IUbCzuJUUUUU==

On loongson controller, after calling snd_hdac_stream_updateb()
to enable DMA engine, the SDnCTL.STRM will become to zero.  We
need to access SDnCTL in dword to keep SDnCTL.STRM is not changed.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
Signed-off-by: Yingkun Meng <mengyingkun@loongson.cn>
---
 include/sound/hdaudio.h   | 1 +
 sound/hda/hdac_stream.c   | 6 +++++-
 sound/pci/hda/hda_intel.c | 1 +
 3 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/include/sound/hdaudio.h b/include/sound/hdaudio.h
index a1dcc7f97d08..859becb0eaba 100644
--- a/include/sound/hdaudio.h
+++ b/include/sound/hdaudio.h
@@ -348,6 +348,7 @@ struct hdac_bus {
 	bool polling_mode:1;
 	bool no_intr_polling_mode:1;
 	bool needs_damn_long_delay:1;
+	bool access_sdnctl_in_dword:1;
 
 	int poll_count;
 
diff --git a/sound/hda/hdac_stream.c b/sound/hda/hdac_stream.c
index 1f56fd33b9af..2633a4bb1d85 100644
--- a/sound/hda/hdac_stream.c
+++ b/sound/hda/hdac_stream.c
@@ -150,7 +150,11 @@ void snd_hdac_stream_start(struct hdac_stream *azx_dev)
 					stripe_ctl);
 	}
 	/* set DMA start and interrupt mask */
-	snd_hdac_stream_updateb(azx_dev, SD_CTL,
+	if (bus->access_sdnctl_in_dword)
+		snd_hdac_stream_updatel(azx_dev, SD_CTL,
+				0, SD_CTL_DMA_START | SD_INT_MASK);
+	else
+		snd_hdac_stream_updateb(azx_dev, SD_CTL,
 				0, SD_CTL_DMA_START | SD_INT_MASK);
 	azx_dev->running = true;
 }
diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
index 1e8993836fc6..0222a1721b4d 100644
--- a/sound/pci/hda/hda_intel.c
+++ b/sound/pci/hda/hda_intel.c
@@ -1877,6 +1877,7 @@ static int azx_first_init(struct azx *chip)
 
 	if (chip->driver_type == AZX_DRIVER_LOONGSON) {
 		bus->no_intr_polling_mode = 1;
+		bus->access_sdnctl_in_dword = 1;
 	}
 
 	err = pcim_iomap_regions(pci, 1 << 0, "ICH HD audio");
-- 
2.31.4

