Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B49CA7C
	for <loongarch@lists.linux.dev>; Thu, 13 Jul 2023 02:47:11 +0000 (UTC)
Received: from loongson.cn (unknown [112.20.109.108])
	by gateway (Coremail) with SMTP id _____8CxbeutZa9koj8EAA--.9228S3;
	Thu, 13 Jul 2023 10:47:09 +0800 (CST)
Received: from localhost.localdomain (unknown [112.20.109.108])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Cx_c6sZa9kuJcrAA--.57200S2;
	Thu, 13 Jul 2023 10:47:09 +0800 (CST)
From: Feiyang Chen <chenfeiyang@loongson.cn>
To: andrew@lunn.ch,
	hkallweit1@gmail.com,
	peppe.cavallaro@st.com,
	alexandre.torgue@foss.st.com,
	joabreu@synopsys.com,
	chenhuacai@loongson.cn
Cc: Feiyang Chen <chenfeiyang@loongson.cn>,
	linux@armlinux.org.uk,
	dongbiao@loongson.cn,
	loongson-kernel@lists.loongnix.cn,
	netdev@vger.kernel.org,
	loongarch@lists.linux.dev,
	chris.chenfeiyang@gmail.com
Subject: [RFC PATCH 00/10] net: phy/stmmac: Add Loongson platform support
Date: Thu, 13 Jul 2023 10:46:52 +0800
Message-Id: <cover.1689215889.git.chenfeiyang@loongson.cn>
X-Mailer: git-send-email 2.39.3
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8Cx_c6sZa9kuJcrAA--.57200S2
X-CM-SenderInfo: hfkh0wphl1t03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoWxuF4rKF1xWr1kWFy8Wr1kXrc_yoW5GFW3pF
	ZrAa4Yqr97Jr1xJ3Z3Aw1kWF95Wa4xtr45Ww4Iqrsa9ayIyF90qrnI9FWrJr17ZrWDZFy2
	qr1UCw13GFn0kwbCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkjb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Gr0_Gr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I
	8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AK
	xVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2Ij64
	vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8G
	jcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2I
	x0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK
	8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I
	0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07jUsqXUUUUU=

Add driver for Loongson PHY. Extend stmmac functions and macros for
Loongson DWMAC. Add LS7A support for dwmac_loongson.

Feiyang Chen (10):
  net: phy: Add driver for Loongson PHY
  net: stmmac: Pass stmmac_priv and chan in some callbacks
  net: stmmac: dwmac1000: Allow platforms to choose some register
    offsets
  net: stmmac: dwmac1000: Add multi-channel support
  net: stmmac: dwmac1000: Add 64-bit DMA support
  net: stmmac: dwmac1000: Add Loongson register definitions
  net: stmmac: Add Loongson HWIF entry
  net: stmmac: dwmac-loongson: Add LS7A support
  net: stmmac: dwmac-loongson: Add 64-bit DMA and multi-vector support
  net: stmmac: dwmac-loongson: Add GNET support

 drivers/net/ethernet/stmicro/stmmac/Kconfig   |   1 +
 .../net/ethernet/stmicro/stmmac/chain_mode.c  |  28 ++-
 drivers/net/ethernet/stmicro/stmmac/common.h  |   3 +
 drivers/net/ethernet/stmicro/stmmac/descs.h   |   7 +
 .../net/ethernet/stmicro/stmmac/descs_com.h   |  49 ++--
 .../ethernet/stmicro/stmmac/dwmac-loongson.c  | 214 +++++++++++++-----
 .../net/ethernet/stmicro/stmmac/dwmac-sun8i.c |  20 +-
 .../net/ethernet/stmicro/stmmac/dwmac1000.h   |   4 +-
 .../ethernet/stmicro/stmmac/dwmac1000_core.c  |  63 ++++--
 .../ethernet/stmicro/stmmac/dwmac1000_dma.c   | 110 +++++++--
 .../ethernet/stmicro/stmmac/dwmac100_core.c   |  12 +-
 .../ethernet/stmicro/stmmac/dwmac100_dma.c    |   2 +-
 .../net/ethernet/stmicro/stmmac/dwmac4_core.c |  11 +-
 .../ethernet/stmicro/stmmac/dwmac4_descs.c    |  19 +-
 .../net/ethernet/stmicro/stmmac/dwmac4_dma.c  |   8 +-
 .../net/ethernet/stmicro/stmmac/dwmac_dma.h   | 210 +++++++++--------
 .../net/ethernet/stmicro/stmmac/dwmac_lib.c   | 156 +++++++++++--
 .../ethernet/stmicro/stmmac/dwxgmac2_core.c   |  11 +-
 .../ethernet/stmicro/stmmac/dwxgmac2_descs.c  |  17 +-
 .../ethernet/stmicro/stmmac/dwxgmac2_dma.c    |   8 +-
 .../net/ethernet/stmicro/stmmac/enh_desc.c    |  38 ++--
 drivers/net/ethernet/stmicro/stmmac/hwif.c    |  48 +++-
 drivers/net/ethernet/stmicro/stmmac/hwif.h    |  77 ++++---
 .../net/ethernet/stmicro/stmmac/norm_desc.c   |  17 +-
 .../net/ethernet/stmicro/stmmac/ring_mode.c   | 105 +++++++--
 .../net/ethernet/stmicro/stmmac/stmmac_main.c |  31 ++-
 drivers/net/phy/Kconfig                       |   5 +
 drivers/net/phy/Makefile                      |   1 +
 drivers/net/phy/loongson-phy.c                |  69 ++++++
 drivers/net/phy/phy_device.c                  |  16 ++
 include/linux/phy.h                           |   2 +
 include/linux/stmmac.h                        |  51 +++++
 32 files changed, 1054 insertions(+), 359 deletions(-)
 create mode 100644 drivers/net/phy/loongson-phy.c

-- 
2.39.3

