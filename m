Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F0246D1B
	for <loongarch@lists.linux.dev>; Thu,  3 Aug 2023 06:37:21 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.201])
	by gateway (Coremail) with SMTP id _____8Cxh+ggS8tkDYYPAA--.195S3;
	Thu, 03 Aug 2023 14:37:20 +0800 (CST)
Received: from localhost.localdomain (unknown [10.20.42.201])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8CxF80aS8tkMsZGAA--.49295S2;
	Thu, 03 Aug 2023 14:37:17 +0800 (CST)
From: Yinbo Zhu <zhuyinbo@loongson.cn>
To: Arnd Bergmann <arnd@arndb.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	soc@kernel.org,
	Ulf Hansson <ulf.hansson@linaro.org>
Cc: Jianmin Lv <lvjianmin@loongson.cn>,
	wanghongliang@loongson.cn,
	Liu Peibao <liupeibao@loongson.cn>,
	loongson-kernel@lists.loongnix.cn,
	Yinbo Zhu <zhuyinbo@loongson.cn>,
	loongarch@lists.linux.dev,
	Liu Yun <liuyun@loongson.cn>
Subject: [PATCH v6 0/2] soc: loongson2_pm: add power management support
Date: Thu,  3 Aug 2023 14:37:01 +0800
Message-Id: <20230803063703.5659-1-zhuyinbo@loongson.cn>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8CxF80aS8tkMsZGAA--.49295S2
X-CM-SenderInfo: 52kx5xhqerqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7
	ZEXasCq-sGcSsGvfJ3UbIjqfuFe4nvWSU5nxnvy29KBjDU0xBIdaVrnUUvcSsGvfC2Kfnx
	nUUI43ZEXa7xR_UUUUUUUUU==

Loongson-2 platform support Power Management Controller (ACPI) and this
series patch was to add PM driver that base on dts and PM binding support.

Change in v6:
		1. The patch "[PATCH v3 1/3] loongarch: export some arch-specific
		   pm interfaces" had been merged into mainline tree in v6.5-rc1
		   thus this v6 series patch need drop it and need depend on it
		   and it's patch link was:
https://lore.kernel.org/all/20230615091757.24686-2-zhuyinbo@loongson.cn/
		2. Adding Ulf Hansson to Cc.
		3. Adding soc@kernel.org to Cc.
		4. Keep indented with one tab +2 spaces in Kconfig help text.
Change in v5:
		1. The patch "[PATCH v3 1/3] loongarch: export some arch-specific
		   pm interfaces" had been merged into linux-next tree thus this
		   v4 series patch need drop it and need depend on it and it's
		   patch link was:
https://lore.kernel.org/all/20230615091757.24686-2-zhuyinbo@loongson.cn/
		2. Swap the positions of compatible for 2k1000 and 2k0500.
Change in v4:
		1. The patch "[PATCH v3 1/3] loongarch: export some arch-specific
		   pm interfaces" had been merged into linux-next tree thus this
		   v4 series patch need drop it and need depend on it and it's
		   patch link was:
https://lore.kernel.org/all/20230615091757.24686-2-zhuyinbo@loongson.cn/
		2. Remove the pmc label in dt-binding patch.
		3. Add the Co-developed-by for driver patch.
		4. Simplify the loongson2_suspend_valid_state that "return
		   (state == PM_SUSPEND_MEM)".
		5. Use Using loongson2_pm_irq_enable() to replace.
		   loongson2_power_button_irq_enable().
		6. Remove the "oneOf" in dt-bindings patch.
		7. Replace "suspend-address" that use "loongson,suspend-address".
		8. Use u64 type that for "loongson,suspend-address".
		9. Rename "pm" to "power-mangement" in dt-bindings patch.
		10. Add the reivewed-by for dt-bindings patch.
Change in v3:
		1. Reword the [1/3] patch commit log and title.
		2. Use the old naming for suspend interface for the [1/3] and
		   [3/3] patch.
		3. Combine some small function in the driver patch.
		4. Rename 'pwrbt' to 'button' in the driver patch.
		5. Use the specific compatible in yaml file.
Change in v2:
		1. Fixup the "suspend-address" description.
		2. Remove the "return -EINVAL" in PM driver probe when firmware
		   no configure "suspend-address" property in dts in oder to
		   other PM state to work.

Yinbo Zhu (2):
  soc: dt-bindings: add loongson-2 pm
  soc: loongson2_pm: add power management support

 .../soc/loongson/loongson,ls2k-pmc.yaml       |  52 +++++
 MAINTAINERS                                   |   7 +
 drivers/soc/loongson/Kconfig                  |  10 +
 drivers/soc/loongson/Makefile                 |   1 +
 drivers/soc/loongson/loongson2_pm.c           | 215 ++++++++++++++++++
 5 files changed, 285 insertions(+)

-- 
2.20.1

