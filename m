Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 904017E
	for <loongarch@lists.linux.dev>; Mon, 19 Dec 2022 12:28:13 +0000 (UTC)
Received: from loongson.cn (unknown [112.20.108.31])
	by gateway (Coremail) with SMTP id _____8BxGenbWKBjof4GAA--.12437S3;
	Mon, 19 Dec 2022 20:28:11 +0800 (CST)
Received: from localhost.localdomain (unknown [112.20.108.31])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8BxtOXYWKBjtOIEAA--.21337S2;
	Mon, 19 Dec 2022 20:28:09 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Wolfram Sang <wsa@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andy Shevchenko <andy@kernel.org>,
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
Subject: [PATCH V7 0/4] i2c: ls2x: Add support for the Loongson-2K/LS7A I2C controller
Date: Mon, 19 Dec 2022 20:28:30 +0800
Message-Id: <cover.1671451604.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.31.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8BxtOXYWKBjtOIEAA--.21337S2
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBjvJXoWxXrW3uw4UXryDtw4UZr1DZFb_yoWrGry8p3
	y5u398Kr1qyr17KFn3J3WruFyF9ws3Gayjgr47Kwnxua1DC34UZw4fKa4a9rnrCr98GrWj
	qrZ0g3W5uFyDArJanT9S1TB71UUUUUJqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
	qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
	b3kYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
	1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
	wVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwA2z4
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

This patch series adds support for the I2C module found on various
Loongson systems with the Loongson-2K SoC or the Loongson LS7A bridge chip.

For now, the I2C driver is suitable for DT-based or ACPI-based systems.

I have tested on Loongson-3A5000LA+LS7A1000/LS7A2000, Loongson-2K1000LA
and Loongson-2K0500.

Thanks.

Changes since V6:
- patch (1/4)
  - Add Reviewed-by tag.
- patch (3/4)
  - GPL-2.0 -> GPL-2.0-only;
  - Add property.h;
  - writew() should be used to operate I2C_LS2X_PRER, and drop the
    suffix of I2C_LS2X_PRER_LO/I2C_LS2X_PRER_HI;
  - Drop ls2x_i2c_priv->dev, for it can be completely replaced by
    'adapter.dev.parent';
  - Reasonable return value handling in ls2x_i2c_xfer_one();
  - Dropping the I2C_M_STOP flag judgment, the stop parameter of
    ls2x_i2c_xfer_one() represents the last msg;
  - Add comments for subsys_initcall();
  - Code formatting, such as dropping unnecessary blank lines.

Changes since V5:
- patch (1/4)
  - Add property.h.
- patch (3/4)
  - Put the ls2x_i2c_reginit() in front of irq requst;
  - Refact ls2x_i2c_adjust_bus_speed: discard the magic value of
    the divider register and LS2X_I2C_FREQ_STD is used to calculate
    the frequency;
  - Drop useless parameters: priv->suspended, and also disable I2C
    interrupts during suspend;
  - Drop ls2x_i2c_remove(), for the adapter will be auto deleted on
    driver detach;
  - Drop MODULE_ALIAS;
  - Code formatting, such as alignment.

Thanks Andy for your comments.

Changes since V4:
- patch (1/4)
  - Drop unneeded headers: of.h;
  - xxx_props -> xxx_properties.
- patch (2/4)
  - Add interrupt headers to fix syntax error found by Rob.
- patch (3/4)
  - Drop atmoic loop in ls2x_i2c_master_xfer(), I have tested it on the
    appropriate environment with no problems;
  - Define the corresponding bits in I2C_LS2X_CTR to avoid magic
    numbers;
  - dev_get_drvdata() is used to get ls2x_i2c_priv() in
    ls2x_i2c_suspend();
  - i2c_add_adapter() -> devm_i2c_add_adapter();
  - SET_SYSTEM_SLEEP_PM_OPS() -> DEFINE_RUNTIME_DEV_PM_OPS();
  - Code formatting, such as alignment.

    Details: https://lore.kernel.org/all/Y4e%2F6KewuHjAluSZ@smile.fi.intel.com/

Changes since V3:
- Addressed all review comments from v3
  - Change the changelog text to make it clearer (1/5);
  - Fix some minor bugs, such as formatting issues (2/5);
  - Fix some formatting issues (3/5);
  - Deep refactoring of code for clarity (4/5).
     Details: https://lore.kernel.org/all/Y4S2cnlAm3YYvZ8E@smile.fi.intel.com/

Thanks to all for their suggestions.

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

Binbin Zhou (4):
  i2c: gpio: Add support on ACPI-based system
  dt-bindings: i2c: add Loongson LS2X I2C controller
  i2c: ls2x: Add driver for Loongson-2K/LS7A I2C controller
  LoongArch: Enable LS2X I2C in loongson3_defconfig

 .../bindings/i2c/loongson,ls2x-i2c.yaml       |  51 +++
 arch/loongarch/configs/loongson3_defconfig    |   1 +
 drivers/i2c/busses/Kconfig                    |  11 +
 drivers/i2c/busses/Makefile                   |   1 +
 drivers/i2c/busses/i2c-gpio.c                 |  28 +-
 drivers/i2c/busses/i2c-ls2x.c                 | 369 ++++++++++++++++++
 6 files changed, 451 insertions(+), 10 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/i2c/loongson,ls2x-i2c.yaml
 create mode 100644 drivers/i2c/busses/i2c-ls2x.c

-- 
2.31.1

