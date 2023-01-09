Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C31E815C3
	for <loongarch@lists.linux.dev>; Mon,  9 Jan 2023 01:35:08 +0000 (UTC)
Received: from loongson.cn (unknown [112.20.112.33])
	by gateway (Coremail) with SMTP id _____8BxKupEb7tjw2kAAA--.1107S3;
	Mon, 09 Jan 2023 09:35:00 +0800 (CST)
Received: from localhost.localdomain (unknown [112.20.112.33])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8BxsOQ_b7tjZ3gWAA--.3588S5;
	Mon, 09 Jan 2023 09:35:00 +0800 (CST)
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
	Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH V2 3/7] LoongArch: Enable LS2X RTC in loongson3_defconfig
Date: Mon,  9 Jan 2023 09:35:13 +0800
Message-Id: <1281386ef23b1513c98774dfdcdde1e40d31a197.1673227292.git.zhoubinbin@loongson.cn>
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
X-CM-TRANSID:AQAAf8BxsOQ_b7tjZ3gWAA--.3588S5
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBjvdXoW7Jry5XrWkuF48uF15Ww1fXrb_yoWxKwb_XF
	y7Kw4kWw48Aa97uas7Zw1rWw4Du3W7AF1FkrnrZr1xXa12gr13J3yDA3W3C3Z093yUWr43
	XaykAF9F9r10yjkaLaAFLSUrUUUU0b8apTn2vfkv8UJUUUU8wcxFpf9Il3svdxBIdaVrn0
	xqx4xG64xvF2IEw4CE5I8CrVC2j2Jv73VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUY
	W7kC6x804xWl14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3w
	AFIxvE14AKwVWUAVWUZwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK
	6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7
	xvwVC2z280aVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVCY1x0267AKxVW8JVW8Jr1ln4kS
	14v26r126r1DM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26rWY6Fy7McIj6I8E87Iv
	67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lc7CjxVAaw2
	AFwI0_JF0_Jw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xF
	xVAFwI0_JF0_Jw1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWw
	C2zVAF1VAY17CE14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Xr0_
	Ar1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJV
	WUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIY
	CTnIWIevJa73UjIFyTuYvjxUV5ETDUUUU

This is now supported, enable for Loongson-3 systems.
Other systems are unaffected.

Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 arch/loongarch/configs/loongson3_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/loongarch/configs/loongson3_defconfig b/arch/loongarch/configs/loongson3_defconfig
index 5677c4f8576e..43f46cfc73af 100644
--- a/arch/loongarch/configs/loongson3_defconfig
+++ b/arch/loongarch/configs/loongson3_defconfig
@@ -714,6 +714,7 @@ CONFIG_UCSI_ACPI=m
 CONFIG_INFINIBAND=m
 CONFIG_RTC_CLASS=y
 CONFIG_RTC_DRV_EFI=y
+CONFIG_RTC_DRV_LS2X=y
 CONFIG_DMADEVICES=y
 CONFIG_UIO=m
 CONFIG_UIO_PDRV_GENIRQ=m
-- 
2.31.1

