Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03DE415C3
	for <loongarch@lists.linux.dev>; Mon,  9 Jan 2023 01:36:14 +0000 (UTC)
Received: from loongson.cn (unknown [112.20.112.33])
	by gateway (Coremail) with SMTP id _____8DxSuqNb7tjIGoAAA--.1126S3;
	Mon, 09 Jan 2023 09:36:13 +0800 (CST)
Received: from localhost.localdomain (unknown [112.20.112.33])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8DxD7+Ib7tjyngWAA--.1145S5;
	Mon, 09 Jan 2023 09:36:13 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Alessandro Zummo <a.zummo@towertech.it>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	WANG Xuerui <kernel@xen0n.name>
Cc: linux-rtc@vger.kernel.org,
	linux-mips@vger.kernel.org,
	loongarch@lists.linux.dev,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	devicetree@vger.kernel.org,
	Qing Zhang <zhangqing@loongson.cn>,
	Tiezhu Yang <yangtiezhu@loongson.cn>,
	zhaoxiao <zhaoxiao@uniontech.com>,
	WANG Xuerui <git@xen0n.name>
Subject: [PATCH V2 7/7] MIPS: Loongson: Enable LS2X RTC in loongson2k_defconfig
Date: Mon,  9 Jan 2023 09:36:32 +0800
Message-Id: <9711159c9a7ec2e9e2cb12b648a564a6fa5f443e.1673227292.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1673227292.git.zhoubinbin@loongson.cn>
References: <cover.1673227292.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8DxD7+Ib7tjyngWAA--.1145S5
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBjvdXoWrur4fZFykZr43XFyUCr4Uurg_yoW3Gwc_JF
	y7K34kWr4rArWfWa4xXw4rWw1Uuw1UXF48Cry7JF15Xa9Igr13XanrCF15G3Z8W3srKr4Y
	va95CFy7ur1xKjkaLaAFLSUrUUUU0b8apTn2vfkv8UJUUUU8wcxFpf9Il3svdxBIdaVrn0
	xqx4xG64xvF2IEw4CE5I8CrVC2j2Jv73VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUY
	K7kC6x804xWl14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3w
	AFIxvE14AKwVWUXVWUAwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK
	6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwA2z4
	x0Y4vEx4A2jsIE14v26F4j6r4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJwAa
	w2AFwI0_JF0_Jw1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44
	I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_ZF0_GryDMcIj6I8E
	87Iv67AKxVWxJVW8Jr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxkF7I
	0En4kS14v26r126r1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMxCI
	bckI1I0E14v26r126r1DMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_Jr
	I_JrWlx4CE17CEb7AF67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v2
	6F1j6w1UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1lIxAIcVCF04k26cxKx2IYs7
	xG6r1j6r1xMIIF0xvEx4A2jsIE14v26F4j6r4UJwCI42IY6I8E87Iv6xkF7I0E14v26r4j
	6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUxNeODUUUU

From: WANG Xuerui <git@xen0n.name>

This is now supported, enable for Loongson-2K systems.
Other systems are unaffected.

Signed-off-by: WANG Xuerui <git@xen0n.name>
---
 arch/mips/configs/loongson2k_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/mips/configs/loongson2k_defconfig b/arch/mips/configs/loongson2k_defconfig
index 728bef666f7a..8000cf838c17 100644
--- a/arch/mips/configs/loongson2k_defconfig
+++ b/arch/mips/configs/loongson2k_defconfig
@@ -278,6 +278,7 @@ CONFIG_USB_SERIAL=m
 CONFIG_USB_SERIAL_OPTION=m
 CONFIG_RTC_CLASS=y
 CONFIG_RTC_DRV_CMOS=y
+CONFIG_RTC_DRV_LS2X=y
 CONFIG_DMADEVICES=y
 # CONFIG_CPU_HWMON is not set
 CONFIG_PM_DEVFREQ=y
-- 
2.31.1

