Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC4C93EF647
	for <loongarch@lists.linux.dev>; Fri, 10 Jul 2026 08:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783671752; cv=none; b=ue1RGFEsOE2uDalLbfFsGaIygGzDamei/6Nt2ASJFkg9GqiKIBJPfEi0HoSzWf3szvsDvYuVmvwXMkZzc10Np1Qfi5NT3v1jV7n7MWVTiblaYcm3R/dXRP7sDpbsulnDDyVWNfI7iRMRnbJaY9pVWfUSfwRnVYLpyOTpvtxMZis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783671752; c=relaxed/simple;
	bh=aED7ufYo1vygFoo6t2ncQD4nn7zxb2QWqvAIH0G29LQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kU/tZ6eeegBC2M1J8y/p1sNFfYSvBcKhVAqRM4ChsHn6g1DFDVijgTGSyHzup6bLAJB3kwWh4Cwafx4eX1rcqeT44BQLIlN9fD+dHYulfN3hqUKIdVDyyoTg2tJzX2wGh56u/RodzhIeo9Ju5Bpr7nF7ZIYB5LbiT8dUOsO2f2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.155])
	by gateway (Coremail) with SMTP id _____8BxGfDCq1Bq1DMCAA--.9333S3;
	Fri, 10 Jul 2026 16:22:26 +0800 (CST)
Received: from kernelserver (unknown [223.64.68.155])
	by front1 (Coremail) with SMTP id qMiowJAxTOW8q1Bqex0IAA--.25035S2;
	Fri, 10 Jul 2026 16:22:22 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Vincent Mailhol <mailhol@kernel.org>,
	Bingxiong Li <libingxiong@loongson.cn>
Cc: Huacai Chen <chenhuacai@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	linux-can@vger.kernel.org,
	jeffbai@aosc.io,
	Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH v5 0/2] Add Loongson CAN-FD controller driver
Date: Fri, 10 Jul 2026 16:22:12 +0800
Message-ID: <cover.1783670733.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJAxTOW8q1Bqex0IAA--.25035S2
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/1tbiAgEECGpQeKwEYgAAsH
X-Coremail-Antispam: 1Uk129KBj93XoWxCryDuFWkGr47KF18trW5urX_yoWrJw18pF
	45C3srurn8Kr4xArs3JayrCF15Aw1fJr13WFZIyw10kas0vw4jg34Sk3W5uryUurZ8CFWj
	vrWfuryrK3Z8ZFgCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkFb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv
	67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2
	Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s02
	6x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0x
	vE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE
	42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6x
	kF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07j0FALUUUUU=

Hi all:

This patchset adds support for the CAN-FD controller found on Loongson
CPUs.

Patch 1 introduces the basic CAN-FD controller driver with support
for classic CAN and CAN FD, including bit timing, error handling,
NAPI-based RX, and multiple TX buffers.

Patch 2 adds optional DMA support for RX path using the Loongson APB
CMC DMA engine, which significantly reduces CPU load under high
receive throughput.

The driver has been tested on Loongson-2K3000 platforms with various
CAN/CAN FD traffic patterns.

Finally, I'd like to thank Bingxiong, the original author of this driver,
for his efforts in working on the patch.

Thanks.
Binbin

=========
V5:
Patch (1/2):
 - Fix tseg1_max const value;
 - Empty FIFO when SKB allocate failed.
 - Use REG_FRAME_META1_RWCNT as the playload read count value;
 - Only clean processed interrupt flags in
   loongson_canfd_err_interrupt();
 - Refact loongson_canfd_tx_interrupt();
 - Add LOONGSON_CANFD_TRV_DLY into loongson_canfd_volatile_reg();
Patch (2/2):
 - Fix dma_request_chan() error path;
 - Fix build error;
 - Fix loongson_canfd_rxdma_init() error path;

Link to V4:
https://lore.kernel.org/all/cover.1783391759.git.zhoubinbin@loongson.cn/

V4:
- Fix some issues from sashiko.
Patch (1/2):
 - Update commit message;
 - Use common APIs to calculate DLC;
 - Correct CAN_RTR_FLAG judgement;
 - Add skb check for CAN_STATE_ERROR_ACTIVE case;
 - Use regmap_write() rather than regmap_update_bits() to
   disable all interrupts;
 - Add napi_disable() in error paths;
 - Add `clock-frequency` return value check;
 - More comments for macros.

Link to V3:
https://lore.kernel.org/all/cover.1782787997.git.zhoubinbin@loongson.cn/

V3:
Patch (1/2):
 - Replace the switch-case statement with a calculated mask in
   `loongson_canfd_get_txbuf_sts()`;
 - Change `loongson_canfd_reset()` return type to `void`;
 - Drop old code in `loongson_canfd_set_btr()`;
 - Rename `loongson_canfd_set_mode()` to `loongson_canfd_set_conf_mode()`;
 - Drop `cf->__res*` usage;
 - Drop unnecessary macro definitions;
 - Add `netif_napi_del()` in probe error route path;
 - Replace ternary operator with `if-else`;
 - Drop stats->rx_packets and stats->rx_bytes count in CAN error frames;
 - Add ethtool_ops;
 - Add CAN_CTRLMODE_CC_LEN8_DLC;

Patch (2/2):
 - Fix W=2 warning;
 - Rename get_rx_frc() -> get_rxbuf_empty();
 - Put `loongson_canfd_rxdma_remove()` before free_candev();
 - Adjust the RXDMA probe process.

Link to V2:
https://lore.kernel.org/all/cover.1780908445.git.zhoubinbin@loongson.cn/

V2:
Patch (1/2):
 - Put all code into one file;
 - Add COMPILE_TEST Kconfig option;
 - Rewrite Kconfig description;
 - Use `regmap_test_bits()` to simplify bit field checks;
 - Drop odd FIELD_GET() usage;
 - Don't use FIELD_GET() for a single bit;
 - Use an if/else instead of the ternary operator;
 - Use the CAN TDC framework to get the SSP value;
 - Use guard(spinlock)/scoped_guard(spinlock);
 - Use netdev_debug() to be less verboss;
 - Check for memory allocation failure;
 - Add CAN_ERR_CNT flag;
 - Drop unused REG_DATA_xx_yy_W_DATA_yy definition;
 - Add more function comment;

Link to V1:
https://lore.kernel.org/all/cover.1777273055.git.zhoubinbin@loongson.cn/

Binbin Zhou (2):
  can: Add Loongson CAN-FD controller driver
  can: loongson_canfd: Add RXDMA support

 MAINTAINERS                      |    7 +
 drivers/net/can/Kconfig          |   11 +
 drivers/net/can/Makefile         |    1 +
 drivers/net/can/loongson_canfd.c | 1897 ++++++++++++++++++++++++++++++
 4 files changed, 1916 insertions(+)
 create mode 100644 drivers/net/can/loongson_canfd.c


base-commit: b266bacba796ff5c4dcd2ae2fc08aacf7ab39153
-- 
2.52.0

