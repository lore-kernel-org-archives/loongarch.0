Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBBBA8F75
	for <loongarch@lists.linux.dev>; Wed,  7 Jun 2023 09:22:01 +0000 (UTC)
Received: from loongson.cn (unknown [223.106.25.146])
	by gateway (Coremail) with SMTP id _____8Cx+ek4TIBkVBcAAA--.330S3;
	Wed, 07 Jun 2023 17:22:00 +0800 (CST)
Received: from localhost.localdomain (unknown [223.106.25.146])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8BxNeQ2TIBkvzcEAA--.14996S4;
	Wed, 07 Jun 2023 17:21:59 +0800 (CST)
From: Yanteng Si <siyanteng@loongson.cn>
To: tiwai@suse.com
Cc: Yanteng Si <siyanteng@loongson.cn>,
	perex@perex.cz,
	chenhuacai@loongson.cn,
	alsa-devel@alsa-project.org,
	loongarch@lists.linux.dev,
	loongson-kernel@lists.loongnix.cn,
	Yingkun Meng <mengyingkun@loongson.cn>
Subject: [PATCH RESEND v3 2/4] ALSA: hda: Using polling mode for loongson controller by default
Date: Wed,  7 Jun 2023 17:21:50 +0800
Message-Id: <d309a75424d438b958d90d797b4f1ba45468e090.1686128807.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.31.4
In-Reply-To: <cover.1686128807.git.siyanteng@loongson.cn>
References: <cover.1686128807.git.siyanteng@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8BxNeQ2TIBkvzcEAA--.14996S4
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
X-Coremail-Antispam: 1Uk129KBj93XoW7ArWkuF1UCr1fGw1xXF4DJrc_yoW8tFyxpF
	97C348KFW7Wr4Yvr4DKa4UKr13Xa93G3ZxGrW0k348Arn2v3WfW39FyF40yFWjkrWIgrW3
	X3ykt348Jay5twcCm3ZEXasCq-sJn29KB7ZKAUJUUUUx529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUU90b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v2
	6F4UJVW0owAaw2AFwI0_JF0_Jw1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0c
	Ia020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jw0_
	WrylYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwI
	xGrwCY1x0262kKe7AKxVWUAVWUtwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWU
	JVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67
	kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVW8JVW5JwCI42IY
	6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0x
	vEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVj
	vjDU0xZFpf9x07jwhLnUUUUU=

On loongson controller, RIRBSTS.RINTFL cannot be cleared,
azx_interrupt() is called all the time. We disable RIRB
interrupt, and use polling mode by default.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
Signed-off-by: Yingkun Meng <mengyingkun@loongson.cn>
---
 include/sound/hdaudio.h     | 1 +
 sound/hda/hdac_controller.c | 5 ++++-
 sound/pci/hda/hda_intel.c   | 5 +++++
 3 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/include/sound/hdaudio.h b/include/sound/hdaudio.h
index 97f09acae302..a0bb40a4b721 100644
--- a/include/sound/hdaudio.h
+++ b/include/sound/hdaudio.h
@@ -347,6 +347,7 @@ struct hdac_bus {
 	bool corbrp_self_clear:1;	/* CORBRP clears itself after reset */
 	bool polling_mode:1;
 	bool needs_damn_long_delay:1;
+	bool not_use_interrupts:1;	/* prohibiting the RIRB IRQ */
 
 	int poll_count;
 
diff --git a/sound/hda/hdac_controller.c b/sound/hda/hdac_controller.c
index 3c7af6558249..7f3a000fab0c 100644
--- a/sound/hda/hdac_controller.c
+++ b/sound/hda/hdac_controller.c
@@ -79,7 +79,10 @@ void snd_hdac_bus_init_cmd_io(struct hdac_bus *bus)
 	/* set N=1, get RIRB response interrupt for new entry */
 	snd_hdac_chip_writew(bus, RINTCNT, 1);
 	/* enable rirb dma and response irq */
-	snd_hdac_chip_writeb(bus, RIRBCTL, AZX_RBCTL_DMA_EN | AZX_RBCTL_IRQ_EN);
+	if (bus->not_use_interrupts)
+		snd_hdac_chip_writeb(bus, RIRBCTL, AZX_RBCTL_DMA_EN);
+	else
+		snd_hdac_chip_writeb(bus, RIRBCTL, AZX_RBCTL_DMA_EN | AZX_RBCTL_IRQ_EN);
 	/* Accept unsolicited responses */
 	snd_hdac_chip_updatel(bus, GCTL, AZX_GCTL_UNSOL, AZX_GCTL_UNSOL);
 	spin_unlock_irq(&bus->reg_lock);
diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
index 9c353dc7740c..b7a7a92d03ef 100644
--- a/sound/pci/hda/hda_intel.c
+++ b/sound/pci/hda/hda_intel.c
@@ -1875,6 +1875,11 @@ static int azx_first_init(struct azx *chip)
 	if (chip->driver_type == AZX_DRIVER_GFHDMI)
 		bus->polling_mode = 1;
 
+	if (chip->driver_type == AZX_DRIVER_LOONGSON) {
+		bus->polling_mode = 1;
+		bus->not_use_interrupts = 1;
+	}
+
 	err = pcim_iomap_regions(pci, 1 << 0, "ICH HD audio");
 	if (err < 0)
 		return err;
-- 
2.31.4

