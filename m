Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55ED353BA
	for <loongarch@lists.linux.dev>; Thu, 15 Jun 2023 09:18:11 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.35])
	by gateway (Coremail) with SMTP id _____8DxRulM14pkQ4AFAA--.9816S3;
	Thu, 15 Jun 2023 17:18:04 +0800 (CST)
Received: from user-pc.202.106.0.20 (unknown [10.20.42.35])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8DxVeRH14pkxssbAA--.13716S2;
	Thu, 15 Jun 2023 17:18:03 +0800 (CST)
From: Yinbo Zhu <zhuyinbo@loongson.cn>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Pavel Machek <pavel@ucw.cz>,
	Marc Zyngier <maz@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev
Cc: Jianmin Lv <lvjianmin@loongson.cn>,
	wanghongliang@loongson.cn,
	Liu Peibao <liupeibao@loongson.cn>,
	loongson-kernel@lists.loongnix.cn,
	Yinbo Zhu <zhuyinbo@loongson.cn>
Subject: [PATCH v3 0/3] soc: loongson2_pm: add power management support
Date: Thu, 15 Jun 2023 17:17:54 +0800
Message-Id: <20230615091757.24686-1-zhuyinbo@loongson.cn>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8DxVeRH14pkxssbAA--.13716S2
X-CM-SenderInfo: 52kx5xhqerqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7
	ZEXasCq-sGcSsGvfJ3UbIjqfuFe4nvWSU5nxnvy29KBjDU0xBIdaVrnUUvcSsGvfC2Kfnx
	nUUI43ZEXa7xR_UUUUUUUUU==

Loongson-2 platform support Power Management Controller (ACPI) and this
series patch was to add PM driver that base on dts and PM binding support.

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

Yinbo Zhu (3):
  loongarch: export some arch-specific pm interfaces
  soc: dt-bindings: add loongson-2 pm
  soc: loongson2_pm: add power management support

 .../soc/loongson/loongson,ls2k-pmc.yaml       |  53 +++++
 MAINTAINERS                                   |   7 +
 arch/loongarch/include/asm/acpi.h             |   3 +-
 arch/loongarch/include/asm/suspend.h          |  10 +
 arch/loongarch/power/suspend.c                |   8 +-
 drivers/soc/loongson/Kconfig                  |  10 +
 drivers/soc/loongson/Makefile                 |   1 +
 drivers/soc/loongson/loongson2_pm.c           | 218 ++++++++++++++++++
 8 files changed, 304 insertions(+), 6 deletions(-)

-- 
2.20.1

