Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85F43345CDD
	for <loongarch@lists.linux.dev>; Tue, 14 Apr 2026 06:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776147939; cv=none; b=mPaVnLKMK0f58UuVPXoeMv3UqLHDQNbqw1AmsAUS3FMxal9G7Mh6gCAcpiiFKwT3foKuUcaxXKKUomKnOEyT3hhI1nlKGYLKFklpTeNrDI8ANZFs/uq/2/ESdQKXINWXuDS+b2a2aCFnfPYcny0Yxt7SMJnA2IZXlQwvdC2ybR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776147939; c=relaxed/simple;
	bh=YfH3otYUPNpeAPZ1DPD5mKSRm4D4HznLLb9DnVMsQIE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ltdn/yzz0ya43toaWCxB4VYENU/U392y4h/9Y+2s1oxeaDekMzx4gLWFcw+rECfn8wMiycBMok95rogwr5U8PkEblf5XdI3TBWRq3INnXKvYljNsA/oFn3YKXbH3oG6JHZUZrB8Q8srdrzwl4zkYO6gC3HNp5QChzN99435kqK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.8])
	by gateway (Coremail) with SMTP id _____8DxhunW3d1pymYAAA--.1993S3;
	Tue, 14 Apr 2026 14:25:27 +0800 (CST)
Received: from kernelserver (unknown [223.64.68.8])
	by front1 (Coremail) with SMTP id qMiowJDxSMHR3d1pq7JsAA--.62093S2;
	Tue, 14 Apr 2026 14:25:23 +0800 (CST)
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
Subject: [PATCH v8 0/2] i2c: Add Loongson-2K0300 I2C controller support
Date: Tue, 14 Apr 2026 14:25:09 +0800
Message-ID: <cover.1776135865.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJDxSMHR3d1pq7JsAA--.62093S2
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/1tbiAgERCGnchacURgABse
X-Coremail-Antispam: 1Uk129KBj93XoWxWF4DGF4kArW7Cw13JryUtwc_yoW5Zw1rpa
	y5C39xKF1qgr42vrs3JFWfur1SvayfJa1Sgr4xA34F9F4DZ3yUZ3ySkFs0vFWDAFWxCF42
	qrZrKr10ka4DZFXCm3ZEXasCq-sJn29KB7ZKAUJUUUU7529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUB2b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1ln4kS14v26r1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12
	xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r12
	6r1DMcIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64
	vIr41lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_
	Jr0_Gr1l4IxYO2xFxVAFwI0_Jrv_JF1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8Gjc
	xK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0
	cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8V
	AvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E
	14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxU7hiSDUUUU

Hi all:

This patch set describes the I2C controller integrated the
Loongson-2K0300 chip.

It has a significantly different design from the previous I2C
controller(i2c-ls2x), such as support for master-slave transfer mode,
and  DMA transfers (implementation in progress), etc. Therefore, we try
to name it i2c-ls2x-v2.

Thanks.

======
V8:
Patch (2/2):
 - Since the physical unit is specific, revert the change made in v7
   to replace `MHz` with `mhz`.

Link to V7:
https://lore.kernel.org/all/cover.1775900045.git.zhoubinbin@loongson.cn/

V7:
- Add Reviewed-by tag from Huacai & Andy, thanks.
Patch (2/2):
 - Add the REGMAP_MMIO Kconfig dependency;
 - parent_rate_MHz -> parent_rate_mhz to avoid CamelCase.

Link to V6:
https://lore.kernel.org/all/cover.1773991081.git.zhoubinbin@loongson.cn/

V6:
- Rebase on linux-i2c/i2c-next;
Patch (2/2):
  - Update comment;
  - Use regmap_get_device();

Link to V5:
https://lore.kernel.org/all/cover.1773142933.git.zhoubinbin@loongson.cn/

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
 drivers/i2c/busses/Kconfig                    |  11 +
 drivers/i2c/busses/Makefile                   |   1 +
 drivers/i2c/busses/i2c-ls2x-v2.c              | 544 ++++++++++++++++++
 5 files changed, 561 insertions(+)
 create mode 100644 drivers/i2c/busses/i2c-ls2x-v2.c


base-commit: 8fc326e15895c9f0403e6243dd4ad468b10aab3d
-- 
2.52.0

