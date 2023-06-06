Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89F3D37B84
	for <loongarch@lists.linux.dev>; Tue,  6 Jun 2023 13:26:00 +0000 (UTC)
Received: from loongson.cn (unknown [223.106.25.146])
	by gateway (Coremail) with SMTP id _____8DxPPDYM39kZDAAAA--.818S3;
	Tue, 06 Jun 2023 21:25:44 +0800 (CST)
Received: from localhost.localdomain (unknown [223.106.25.146])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8AxfcrVM39kyHICAA--.1597S4;
	Tue, 06 Jun 2023 21:25:44 +0800 (CST)
From: Yanteng Si <siyanteng@loongson.cn>
To: tiwai@suse.com
Cc: Yanteng Si <siyanteng@loongson.cn>,
	perex@perex.cz,
	chenhuacai@loongson.cn,
	alsa-devel@alsa-project.org,
	loongarch@lists.linux.dev,
	loongson-kernel@lists.loongnix.cn,
	Yingkun Meng <mengyingkun@loongson.cn>
Subject: [PATCH v2 2/4] ALSA: hda: Using polling mode for loongson controller by default
Date: Tue,  6 Jun 2023 21:25:28 +0800
Message-Id: <521be42ac818d35a996e01cc3d591e1c87f230d9.1686057365.git.siyanteng@loongson.cn>
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
X-CM-TRANSID:AQAAf8AxfcrVM39kyHICAA--.1597S4
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
X-Coremail-Antispam: 1Uk129KBj93XoW7ArWkuF1UCr1fGw1xXF4DJrc_yoW8tFWxpF
	1kC340gFZrWr4FvF4DKa4UKr13Xa93G3WrGrW09348Arn2v3WrW39FyF40yFWjyrWIgrW3
	X3ykt348Jay5tabCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkYb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1a6r1DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v2
	6F4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc
	02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUAVWUtwAv7VC2z280aVAF
	wI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw28IcxkI7V
	AKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCj
	r7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6x
	IIjxv20xvE14v26r1I6r4UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAI
	w20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x
	0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IUbQJ55UUUUU==

On loongson controller, RIRBSTS.RINTFL cannot be cleared,
azx_interrupt() is called all the time. We disable RIRB
interrupt, and use polling mode by default.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
Signed-off-by: Yingkun Meng <mengyingkun@loongson.cn>
---
 include/sound/hdaudio.h     | 1 +
 sound/hda/hdac_controller.c | 5 ++++-
 sound/pci/hda/hda_intel.c   | 4 ++++
 3 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/include/sound/hdaudio.h b/include/sound/hdaudio.h
index 97f09acae302..a1dcc7f97d08 100644
--- a/include/sound/hdaudio.h
+++ b/include/sound/hdaudio.h
@@ -346,6 +346,7 @@ struct hdac_bus {
 	bool reverse_assign:1;		/* assign devices in reverse order */
 	bool corbrp_self_clear:1;	/* CORBRP clears itself after reset */
 	bool polling_mode:1;
+	bool no_intr_polling_mode:1;
 	bool needs_damn_long_delay:1;
 
 	int poll_count;
diff --git a/sound/hda/hdac_controller.c b/sound/hda/hdac_controller.c
index 3c7af6558249..705e09cc50ac 100644
--- a/sound/hda/hdac_controller.c
+++ b/sound/hda/hdac_controller.c
@@ -79,7 +79,10 @@ void snd_hdac_bus_init_cmd_io(struct hdac_bus *bus)
 	/* set N=1, get RIRB response interrupt for new entry */
 	snd_hdac_chip_writew(bus, RINTCNT, 1);
 	/* enable rirb dma and response irq */
-	snd_hdac_chip_writeb(bus, RIRBCTL, AZX_RBCTL_DMA_EN | AZX_RBCTL_IRQ_EN);
+	if (bus->no_intr_polling_mode)
+		snd_hdac_chip_writeb(bus, RIRBCTL, AZX_RBCTL_DMA_EN);
+	else
+		snd_hdac_chip_writeb(bus, RIRBCTL, AZX_RBCTL_DMA_EN | AZX_RBCTL_IRQ_EN);
 	/* Accept unsolicited responses */
 	snd_hdac_chip_updatel(bus, GCTL, AZX_GCTL_UNSOL, AZX_GCTL_UNSOL);
 	spin_unlock_irq(&bus->reg_lock);
diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
index 9c353dc7740c..1e8993836fc6 100644
--- a/sound/pci/hda/hda_intel.c
+++ b/sound/pci/hda/hda_intel.c
@@ -1875,6 +1875,10 @@ static int azx_first_init(struct azx *chip)
 	if (chip->driver_type == AZX_DRIVER_GFHDMI)
 		bus->polling_mode = 1;
 
+	if (chip->driver_type == AZX_DRIVER_LOONGSON) {
+		bus->no_intr_polling_mode = 1;
+	}
+
 	err = pcim_iomap_regions(pci, 1 << 0, "ICH HD audio");
 	if (err < 0)
 		return err;
-- 
2.31.4

