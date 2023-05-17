Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C01438830
	for <loongarch@lists.linux.dev>; Wed, 17 May 2023 07:31:57 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.35])
	by gateway (Coremail) with SMTP id _____8BxqOnrgmRkLGoJAA--.16504S3;
	Wed, 17 May 2023 15:31:55 +0800 (CST)
Received: from user-pc.202.106.0.20 (unknown [10.20.42.35])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Axmr3lgmRk_1plAA--.41619S2;
	Wed, 17 May 2023 15:31:55 +0800 (CST)
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
Subject: [PATCH v1 0/3] soc: loongson2_pm: add power management support
Date: Wed, 17 May 2023 15:31:46 +0800
Message-Id: <20230517073149.31980-1-zhuyinbo@loongson.cn>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8Axmr3lgmRk_1plAA--.41619S2
X-CM-SenderInfo: 52kx5xhqerqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBjvdXoW7GFWrJr18Xr4kXw1xtry8AFb_yoW3XwbE9a
	s7Xay8ur47GFZrJa4DXw15Xry5WFWxJ3Z093Wqqr1I93WYyr15Jr4UZ343CF12qFWUuFs8
	XrW8KryFyryFyjkaLaAFLSUrUUUUbb8apTn2vfkv8UJUUUU8wcxFpf9Il3svdxBIdaVrn0
	xqx4xG64xvF2IEw4CE5I8CrVC2j2Jv73VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUY
	c7CY07I20VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2
	IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84AC
	jcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM2
	8EF7xvwVC2z280aVCY1x0267AKxVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l
	57IF6xkI12xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20x
	vE14v26r1Y6r17McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xv
	r2IYc2Ij64vIr41lc7CjxVAaw2AFwI0_JF0_Jw1l42xK82IYc2Ij64vIr41l42xK82IY6x
	8ErcxFaVAv8VWrMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4l
	x2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVW8ZVWrXwCIc40Y0x0EwIxGrw
	CI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI
	42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z2
	80aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxU7TKuUUUUU

Loongson-2 platform support Power Management Controller (ACPI) and this
series patch was to add PM driver that base on dts and PM binding support.

Yinbo Zhu (3):
  loongarch: export loongarch pm interface
  dt-bindings: soc: add loongson-2 pm
  soc: loongson2_pm: add power management support

 .../soc/loongson/loongson,ls2k-pmc.yaml       |  47 ++++
 MAINTAINERS                                   |   7 +
 arch/loongarch/include/asm/acpi.h             |   5 +-
 arch/loongarch/include/asm/suspend.h          |  10 +
 arch/loongarch/power/suspend.c                |  10 +-
 arch/loongarch/power/suspend_asm.S            |   8 +-
 drivers/soc/loongson/Kconfig                  |  10 +
 drivers/soc/loongson/Makefile                 |   1 +
 drivers/soc/loongson/loongson2_pm.c           | 237 ++++++++++++++++++
 9 files changed, 323 insertions(+), 12 deletions(-)

-- 
2.20.1

