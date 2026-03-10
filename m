Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3143389477
	for <loongarch@lists.linux.dev>; Tue, 10 Mar 2026 11:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773143354; cv=none; b=PLQH10vFpNLU73X+Lu53Txlv7VBIQUla2upwUIxwHM7mLptQn2bI+xotOfasqDGvoXiCmDXAXQZErz1zdWavWnN3GpbEeVmHvOgG1uHUAlLnuU8mpvuSrFVFke7loVNwtdeVJyJ/P1SMZ/0q+2BSFxpajO5HVfx7CTOPlVl1lKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773143354; c=relaxed/simple;
	bh=IUkRPHIot277CiZO8e3LlXsRohijimQweFY17BnM9BI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QDB2eYHXQlaxe2CqemrmZn4y59inJxWv8Nn7UzhHpEzVNnl9kb+oi/xzIg79sDZwp0MzntBvqq8LgtKYeqqQddGWhHgLr3LXDDkj/N3OmKcgUB4bbodMBA0QwHL/fjajpTSAUFkeQjpliyeLn3x3hIXEuAp1sP3fDF2uFYeoSBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.227])
	by gateway (Coremail) with SMTP id _____8Dx7qk0BbBpRH4ZAA--.15557S3;
	Tue, 10 Mar 2026 19:49:08 +0800 (CST)
Received: from kernelserver (unknown [223.64.68.227])
	by front1 (Coremail) with SMTP id qMiowJBxacEwBbBp4RdSAA--.11422S2;
	Tue, 10 Mar 2026 19:49:05 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andy Shevchenko <andy@kernel.org>,
	linux-i2c@vger.kernel.org
Cc: Huacai Chen <chenhuacai@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	devicetree@vger.kernel.org,
	Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH v5 0/2] i2c: Add Loongson-2K0300 I2C controller support
Date: Tue, 10 Mar 2026 19:48:51 +0800
Message-ID: <cover.1773142933.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJBxacEwBbBp4RdSAA--.11422S2
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/1tbiAgEBCGmuYSIJLgAFss
X-Coremail-Antispam: 1Uk129KBj93XoWxWF4fGrWfuw4UurWkAFyfXwc_yoW5Gryxpa
	y5C39xKF1qgr1I9rs3JFWruryava1fJa13Wr4xA34F9a1DZ3yUZ3yakF4YvFWDCrWxCF42
	qrZrGr1UCa4DZFXCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkFb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv
	67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2
	Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s02
	6x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0x
	vE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE
	42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6x
	kF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07jUsqXUUUUU=

Hi all:

This patch set describes the I2C controller integrated the
Loongson-2K0300 chip.

It has a significantly different design from the previous I2C
controller(i2c-ls2x), such as support for master-slave transfer mode,
and  DMA transfers (implementation in progress), etc. Therefore, we try
to name it i2c-ls2x-v2.

Thanks.

======
V5:
- Rebase on linux-i2c/i2c-next;
Patch (2/2):
  - Add time.h header file;
  - Add the `MHz` suffix to `parent_rate` and `freq`;
  - Define an iterator within the for loop, with its type being
    `unsigned int`;
  - Use dev_err_probe() in loongson2_i2c_adjust_bus_speed();
  - i2c_adapter_set_node()->device_set_node().

Link to V4:
https://lore.kernel.org/all/cover.1772714348.git.zhoubinbin@loongson.cn/

V4:
- Rebase on linux-i2c/i2c-next;
Patch (2/2):
 - The parent_rate parameter type should be `unsigned long`;
 - Drop fallthrough and add missing break;
 - device_set_node()->i2c_adapter_set_node();
 - Use i2c_parse_fw_timings();
 - Use i2c_t.bus_freq_hz instead of priv->speed;
 - Sperate loongson2_i2c_handle_read() into loongson2_i2c_handle_read()
   and loongson2_i2c_handle_rx_done().

Link to V3:
https://lore.kernel.org/all/cover.1772001073.git.zhoubinbin@loongson.cn/

V3:
- Rebase on linux-i2c/i2c-next;
Patch (2/2):
 - Reorder header file follow IWYU principle;
 - Better indentation and coding style;
 - Use generic macro definitions;
 - Amend *all* struct data types;
 - Correct unreasonable variable type definitions;
 - Refact loongson2_i2c_isr_error();
 - of_property_read_u32()->device_property_read_u32();
 - Remove meaningless blank lines and output.

Link to V2:
https://lore.kernel.org/all/cover.1769476820.git.zhoubinbin@loongson.cn/

V2:
Patch (1/2):
 - Add Acked-by tag from Conor, thanks.

Patch (2/2):
 - Reorder the definitions of read() and write();
 - Adjust the calculation method for bus speed.

Link to V1:
https://lore.kernel.org/all/cover.1763018288.git.zhoubinbin@loongson.cn/

Binbin Zhou (2):
  dt-bindings: i2c: loongson,ls2x: Add ls2k0300-i2c compatible
  i2c: ls2x-v2: Add driver for Loongson-2K0300 I2C controller

 .../bindings/i2c/loongson,ls2x-i2c.yaml       |   4 +
 MAINTAINERS                                   |   1 +
 drivers/i2c/busses/Kconfig                    |  10 +
 drivers/i2c/busses/Makefile                   |   1 +
 drivers/i2c/busses/i2c-ls2x-v2.c              | 544 ++++++++++++++++++
 5 files changed, 560 insertions(+)
 create mode 100644 drivers/i2c/busses/i2c-ls2x-v2.c


base-commit: b82316862bea929265725c077dffcec42e3dc20b
-- 
2.52.0

