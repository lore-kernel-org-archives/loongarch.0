Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91FDC79DD
	for <loongarch@lists.linux.dev>; Mon, 22 May 2023 09:32:05 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.35])
	by gateway (Coremail) with SMTP id _____8AxnOqTNmtkteEKAA--.18597S3;
	Mon, 22 May 2023 17:32:03 +0800 (CST)
Received: from user-pc.202.106.0.20 (unknown [10.20.42.35])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8BxkrCNNmtkfuNuAA--.55564S2;
	Mon, 22 May 2023 17:32:02 +0800 (CST)
From: Yinbo Zhu <zhuyinbo@loongson.cn>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Pavel Machek <pavel@ucw.cz>,
	Tiezhu Yang <yangtiezhu@loongson.cn>,
	Marc Zyngier <maz@kernel.org>,
	Youling Tang <tangyouling@loongson.cn>,
	Baoqi Zhang <zhangbaoqi@loongson.cn>,
	Arnd Bergmann <arnd@arndb.de>,
	Yun Liu <liuyun@loongson.cn>,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev
Cc: Jianmin Lv <lvjianmin@loongson.cn>,
	wanghongliang@loongson.cn,
	Liu Peibao <liupeibao@loongson.cn>,
	loongson-kernel@lists.loongnix.cn,
	Yinbo Zhu <zhuyinbo@loongson.cn>
Subject: [PATCH v2 0/3] soc: loongson2_pm: add power management support
Date: Mon, 22 May 2023 17:31:53 +0800
Message-Id: <20230522093156.7108-1-zhuyinbo@loongson.cn>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8BxkrCNNmtkfuNuAA--.55564S2
X-CM-SenderInfo: 52kx5xhqerqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBjvdXoW7GFW5Kw4kWF1kZw4fXrWkJFb_yoWfKwcE9a
	srWay8Wr47WFZrJayDXw4SvryDuay8Gas093Wjqr1xW3Wayr13JF18Z343Cr42qFWUZFs8
	XFW8KryrCrySyjkaLaAFLSUrUUUUbb8apTn2vfkv8UJUUUU8wcxFpf9Il3svdxBIdaVrn0
	xqx4xG64xvF2IEw4CE5I8CrVC2j2Jv73VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUY
	07CY07I20VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2
	IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84AC
	jcxK6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84
	ACjcxK6I8E87Iv6xkF7I0E14v26F4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc80
	4VCY07AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67
	AKxVWUXVWUAwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48I
	cxkI7VAKI48JMxkF7I0En4kS14v26r126r1DMxAIw28IcxkI7VAKI48JMxAIw28IcVCjz4
	8v1sIEY20_WwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I
	3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_GFv_WrylIxAIcVC0I7IYx2IY67
	AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IY
	s7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr
	0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jea0PUUUUU=

Loongson-2 platform support Power Management Controller (ACPI) and this
series patch was to add PM driver that base on dts and PM binding support.

Change in v2:
		1. Fixup the "suspend-address" description.
		2. Remove the "return -EINVAL" in PM driver probe when firmware
		   no configure "suspend-address" property in dts in oder to
		   other PM state to work.

Yinbo Zhu (3):
  loongarch: export loongarch pm interface
  dt-bindings: soc: add loongson-2 pm
  soc: loongson2_pm: add power management support

 .../soc/loongson/loongson,ls2k-pmc.yaml       |  51 ++++
 MAINTAINERS                                   |   7 +
 arch/loongarch/include/asm/acpi.h             |   5 +-
 arch/loongarch/include/asm/suspend.h          |  10 +
 arch/loongarch/power/suspend.c                |  10 +-
 arch/loongarch/power/suspend_asm.S            |   8 +-
 drivers/soc/loongson/Kconfig                  |  10 +
 drivers/soc/loongson/Makefile                 |   1 +
 drivers/soc/loongson/loongson2_pm.c           | 235 ++++++++++++++++++
 9 files changed, 325 insertions(+), 12 deletions(-)

-- 
2.20.1

