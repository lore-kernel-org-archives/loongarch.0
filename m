Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C27532F3F
	for <loongarch@lists.linux.dev>; Mon, 26 Sep 2022 13:01:12 +0000 (UTC)
Received: from localhost.localdomain (unknown [112.20.108.220])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Bx5OGUojFjdz4iAA--.62163S6;
	Mon, 26 Sep 2022 21:01:11 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Wolfram Sang <wsa@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	linux-i2c@vger.kernel.org
Cc: loongarch@lists.linux.dev,
	linux-acpi@vger.kernel.org,
	WANG Xuerui <kernel@xen0n.name>,
	Jianmin Lv <lvjianmin@loongson.cn>,
	Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH V2 4/4] LoongArch: Enable LS2X I2C in loongson3_defconfig
Date: Mon, 26 Sep 2022 21:00:07 +0800
Message-Id: <503ee2a1ded618e458a6e99a09fcada49df768c1.1664193316.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1664193316.git.zhoubinbin@loongson.cn>
References: <cover.1664193316.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8Bx5OGUojFjdz4iAA--.62163S6
X-Coremail-Antispam: 1UD129KBjvdXoW7JF17Kr43Xr47Aw1UCr17Wrg_yoWxKFc_JF
	y7Kw1kWr48JFZ7W3WIqw4rGw4DA3W7XF1SyFnrZw1xX3Wagr13trWDC3W3Cwn09ayDWr43
	ZaykAF9F9r18tjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbhxFF20E14v26rWj6s0DM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI8067AKxVWUAVCq3wA2048vs2
	IY020Ec7CjxVAFwI0_Xr0E3s1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28E
	F7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr
	1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1l
	e2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI
	8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwAC
	jcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc2xSY4AK67AK6ry8MxAIw2
	8IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4l
	x2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrw
	CI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI
	42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z2
	80aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUjg_-JUUUUU==
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/

This is now supported, enable for Loongson-3 systems. Other systems are
affected.

Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 arch/loongarch/configs/loongson3_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/loongarch/configs/loongson3_defconfig b/arch/loongarch/configs/loongson3_defconfig
index 4083d3051109..7910adf20887 100644
--- a/arch/loongarch/configs/loongson3_defconfig
+++ b/arch/loongarch/configs/loongson3_defconfig
@@ -558,6 +558,7 @@ CONFIG_HW_RANDOM_VIRTIO=m
 CONFIG_I2C_CHARDEV=y
 CONFIG_I2C_PIIX4=y
 CONFIG_I2C_GPIO=y
+CONFIG_I2C_LS2X=y
 CONFIG_SPI=y
 CONFIG_GPIO_SYSFS=y
 CONFIG_GPIO_LOONGSON=y
-- 
2.31.1

