Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=114.242.206.163
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794213748;
	b=iLC25gUDIU3JYYT4HlEZL1Q5ImRtrsX5FIh00yAQHLFQVhXMmu1dACuf5fiLkxaw/1Q9
	 JF+vthcYlZJzL7TuOFDF2JhcV0GXwP13IFe+OtNwCHdwElVZK0riPIMn9P/S4B5xwACuX
	 K3++KJPu1MTifTn3CFPmVNdcqrkiPGu6odexgcrlMc1mUA5jlIvvuL1k5IZ2tOZ0nvVY/
	 OsQFZCD962Y2rubO5FKEGSE85bfzrELspWSsoLZPlkLBk1vUoiFmrSyFvfVkBKmlJcFJe
	 xHY7MQDA37Um7vK2rrSNvklQG4JN3yoR4oIFjOHJX8RlFSIkJtzcnEz/lQCpc30JZsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794213748;
	h=DMARC-Filter:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:X-CM-TRANSID:
	 X-CM-SenderInfo:X-Coremail-Antispam;
	bh=PtS0W981U/nxZ5sxl304PswdtbM/S0T+To3or/yNvBQ=;
	b=A9NRj/hDSf2z8Kr4YW2UbAisVqRv28felQlJqOT0qE8J0kUYOLFC6KEvz5vgH+EEoqGk
	 JtIef7jqmatZ6YNPb73Zep1A6eCHRm3JLdLQkqMSAbLTH1s2yaYhVCto7s6Xmf6OR1k5C
	 2o6XqJWb3ct9z2rlKm5HaDKSMc62WwGshJA83dMHTMiV4PM1raYbPKrF+U9a7COIcBkQz
	 B5S7+ASxKGpNItszhIG7OG67BfRmzanLzGO2vJpBztKGF+NV4VZyPWyq9gs+VcwS3VxWM
	 J9Hxkd7zWsEwnEGvVOhma5xcScdtoM2I7vy+vBNA3o1KTxOCeNYZOd3B9xl4t65Z+iw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=loongson.cn;
	spf=pass smtp.mailfrom=loongson.cn;
	arc=none smtp.remote-ip=114.242.206.163
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4E8B606A323
	for <loongarch@lists.linux.dev>; Mon,  9 Nov 2026 08:42:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4E8B606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.69.17])
	by gateway (Coremail) with SMTP id _____8Bxn9Fvh_FqPcIdAA--.19612S3;
	Mon, 09 Nov 2026 16:42:23 +0800 (CST)
Received: from kernelserver (unknown [223.64.69.17])
	by front1 (Coremail) with SMTP id qMiowJCxf89sh_FqUCYzAA--.40908S2;
	Mon, 09 Nov 2026 16:42:21 +0800 (CST)
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
Subject: [PATCH v9 0/2] Add Loongson CAN-FD controller driver
Date: Mon,  9 Nov 2026 16:42:11 +0800
Message-ID: <cover.1794213427.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.52.0
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJCxf89sh_FqUCYzAA--.40908S2
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/1tbiAQEGCGrxKfoGRAAAsE
X-Coremail-Antispam: 1Uk129KBj93XoW3WFyfCF4fKry7GFyxXw45CFX_yoWfGr15pF
	W5Cw4Dur1DKr1UAws3Jay8CF15Ca1rJr43WFZ3J34Ikas0v3WjvrySk3WUuryUCrZ8CFy2
	vrWF9ay8Ca4DuFXCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkSb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv
	67AKxVWxJVW8Jr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw28Icx
	kI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2Iq
	xVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42
	IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY
	6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Cr0_Gr1UMIIF0xvEx4A2js
	IEc7CjxVAFwI0_Gr1j6F4UJbIYCTnIWIevJa73UjIFyTuYvjxUFwZ2UUUUU

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
V9:
Patch (1/2):
 - Add hardware timestamping support;
 - Refactor RX into descriptor parsing/validation/delivery;
 - Improve IRQ handling: add DOI overrun handlinga;
 - Improve TX path: add free TX buffer helper, support CC_LEN8_DLC;
 - Split error reporting into state-change/arb-loss/bus-error helpers;
 - Cancel restart_work before free_irq();
Patch (2/2):
 - Enlarge RX DMA ring to 32K and use 4K cyclic DMA periods.
 - Split DMA init from start/stop; start DMA before chip_start(),
   stop after chip_stop(), and restart DMA on CAN_MODE_START.
 - Add DMA RX empty/overrun/bad-header recovery, partial-header -EAGAIN
   retry with bounded cpu_relax(), and pointer resync.
 - Rename RX callbacks to read_rx_word/rx_is_empty/process_rx;
 - Release DMA on probe/register error and in remove().

Testing & Validation:
----------------------
To validate the robustness and data integrity of this driver patch, extensive stress
tests were conducted across two different speed configurations under high bus load. 

To prove both system stability and data correctness, the test suite introduced
strict data integrity checks at the payload level:

1. Traffic Generation & Load Control:
   - Traffic consists of both periodic business PDUs (20ms, 50ms, 100ms, 200ms)
     and 64-byte fill frames.
   - An accumulator-based algorithm is used to precisely maintain an 80% total bus
     load on both ends without bursting the driver queues.

2. Data Integrity Verification:
   - Each frame payload embeds a 32-bit sequence number (SEQ32), a deterministic data
     fingerprint, and a CRC32 checksum.
   - The receiving ends strictly verify every received frame (including fill frames)
     against these metrics to detect any bit flips, payload corruption, or frame
     duplication.

3. Test Case A: 500 kbps / 2 Mbps (Industry Baseline)
   - Duration: ~66 hours.
   - Throughput: Over 20 million business frames and 160 million fill frames.
   - Results: 0 CRC errors, 0 fingerprint mismatches, and 0 duplicated frames. The overall
     frame loss rate was 0.00%. The driver handled transient bus interference gracefully
     (2 "error-warn" events) without any Bus-Off.

4. Test Case B: 1 Mbps / 4 Mbps (High-Speed Stress)
   - Duration: ~45.5 hours.
   - Throughput: Over 13.9 million business frames and 227 million fill frames.
   - Data Integrity: 0 CRC errors and 0 fingerprint mismatches across all hundreds of millions
     of frames.
   - Driver Recovery: During this high-speed test, minor physical layer interference triggered
     the `ERROR-PASSIVE` state (TEC=128). However, the driver successfully recovered, and no
     Bus-Off was observed.

The complete test suite (C and Python) and raw test logs have been published for reproducibility
and can be found here:

zlg python link: https://gist.github.com/AaronDot/e33f48c6c89d64e6b3564d9125ac2b82
linux C link: https://gist.github.com/AaronDot/6b7bbbc07a378fc263ccbc9f4c42e23a
500k+2M result link: https://gist.github.com/AaronDot/2ec489b1175d52f87bb9ba043168b80c
1M+4M result link: https://gist.github.com/AaronDot/a91fb52ffcec859b0eddc4f89b64eb3c

Link to V8:
https://lore.kernel.org/all/cover.1788945497.git.zhoubinbin@loongson.cn/

V8:
Patch (1/2):
 - Use local copy of can_bittiming in set_btr to avoid corrupting
   persistent structure;
 - Fix endianness and strict aliasing in TX/RX data paths;
 - Fixed spelling errors;
Patch (2/2):
 - Add overflow detection for RXDMA;
 - Simplified callback function names

Link to V7:
https://lore.kernel.org/all/cover.1785898181.git.zhoubinbin@loongson.cn/

V7:
Patch (1/2):
 - Fix can_bittiming_const->tseg1_max;
 - Fix TX buffer id in loongson_canfd_start_xmit();
 - Add rwcnt checking in loongson_canfd_rx()
 - Add netdev stats spinlock;
 - Add net_ratelimit() to control log output in
   loongson_canfd_err_interrupt);
 - Rewrite `loongson_canfd_rx_napi()` to clearly distinguish between the
   two scenarios: "no more data to process" and "quota exhausted".

Patch (2/2):
 - Put dmaengine_terminate_sync() before loongson_canfd_rxdma_free();

Link to V6:
https://lore.kernel.org/all/cover.1784597141.git.zhoubinbin@loongson.cn/

V6:
- Rebase on linux-can/master;
Patch (1/2):
 - Drop CAN_CTRLMODE_3_SAMPLES ctrlmode;
 - Replace kfree_skb() with dev_kfree_skb_any();
 - Drop REG_CMD_ERCRST operation;
 - Rewrite `loongson_canfd_tx_interrupt()` to prevent duplicate handling
   of TX completion';
Patch (2/2):
 - Added a fallback to true when dmaengine_tx_status() returns an error;
 - Replaced all direct regmap_read() from LOONGSON_CANFD_RX_DATA with
   the priv->get_rx_data() callback;
 - Release the DMA channel and clear priv->rx_ch on dma_alloc_coherent()
   failure;

Link to V5:
https://lore.kernel.org/all/cover.1783670733.git.zhoubinbin@loongson.cn/

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
 drivers/net/can/loongson_canfd.c | 3075 ++++++++++++++++++++++++++++++
 4 files changed, 3094 insertions(+)
 create mode 100644 drivers/net/can/loongson_canfd.c


base-commit: 647b81ddefc6364290e67bf33c89d54971f8995e
-- 
2.52.0

