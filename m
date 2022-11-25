Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B761A2560
	for <loongarch@lists.linux.dev>; Fri, 25 Nov 2022 08:56:55 +0000 (UTC)
Received: from loongson.cn (unknown [112.20.109.110])
	by gateway (Coremail) with SMTP id _____8CxbetQg4BjYeIAAA--.2250S3;
	Fri, 25 Nov 2022 16:56:48 +0800 (CST)
Received: from localhost.localdomain (unknown [112.20.109.110])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8AxBldOg4BjghMaAA--.49336S2;
	Fri, 25 Nov 2022 16:56:47 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Wolfram Sang <wsa@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	linux-i2c@vger.kernel.org
Cc: loongarch@lists.linux.dev,
	devicetree@vger.kernel.org,
	Huacai Chen <chenhuacai@loongson.cn>,
	WANG Xuerui <kernel@xen0n.name>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Jianmin Lv <lvjianmin@loongson.cn>,
	Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH V3 0/5] i2c: ls2x: Add support for the Loongson-2K/LS7A I2C controller
Date: Fri, 25 Nov 2022 16:54:10 +0800
Message-Id: <cover.1669359515.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.31.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8AxBldOg4BjghMaAA--.49336S2
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBjvJXoW7tFWkAFyxJr45tFy3tF47Arb_yoW8Ww4Dpa
	1a939Ikr1UtF12qFn3JFyxuryfuws3J3yDWFsrGw1DWFWUCa4UX3y3KFyY9rnrCrWrGrWj
	qrykKFW7uFyDA37anT9S1TB71UUUUUJqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
	qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
	b3kYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
	1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
	wVC0I7IYx2IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwA2z4
	x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJVWxJr1l
	n4kS14v26r1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6x
	ACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E
	87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82
	IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_Jrv_JF1lx2Iq
	xVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r
	1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY
	6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67
	AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x
	07jepB-UUUUU=

Hi all:

Sorry, it may have been a while since the V2 patchset.

This patch series adds support for the I2C module found on various
Loongson systems with the Loongson-2K SoC or the Loongson LS7A bridge chip.

For now, the I2C driver is suitable for DT-based or ACPI-based systems.

I have tested on Loongson-3A5000LA+LS7A1000/LS7A2000, Loongson-2K1000LA
and Loongson-2K0500.

Thanks.

Changes since V2:
- Addressed all review comments from v2
  - Drop of_match_ptr() in i2c-gpio to avoid potential unused warnings
    (1/5);
  - Introduce i2c_gpio_get_props() function as the generic interface
    to get i2c-gpio props from DT or ACPI table (2/5);
  - Refact ls2x i2c code, similar to removing excessive goto tags (4/5).

Thanks to Andy and Mika for their suggestions.

Changes since V1:
- Remove the function of getting the static i2c bus number from ACPI "_UID";
- Fix build warning from kernel test robot.

Binbin Zhou (5):
  i2c: gpio: Fix potential unused warning for 'i2c_gpio_dt_ids'
  i2c: gpio: Add support on ACPI-based system
  dt-bindings: i2c: add bindings for Loongson LS2X I2C
  i2c: ls2x: Add driver for Loongson-2K/LS7A I2C controller
  LoongArch: Enable LS2X I2C in loongson3_defconfig

 .../bindings/i2c/loongson,ls2x-i2c.yaml       |  48 ++
 arch/loongarch/configs/loongson3_defconfig    |   1 +
 drivers/i2c/busses/Kconfig                    |  11 +
 drivers/i2c/busses/Makefile                   |   1 +
 drivers/i2c/busses/i2c-gpio.c                 |  30 +-
 drivers/i2c/busses/i2c-ls2x.c                 | 415 ++++++++++++++++++
 6 files changed, 494 insertions(+), 12 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/i2c/loongson,ls2x-i2c.yaml
 create mode 100644 drivers/i2c/busses/i2c-ls2x.c

-- 
2.31.1

