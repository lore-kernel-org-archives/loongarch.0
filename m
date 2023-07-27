Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2485C145
	for <loongarch@lists.linux.dev>; Thu, 27 Jul 2023 07:16:16 +0000 (UTC)
Received: from loongson.cn (unknown [112.20.109.108])
	by gateway (Coremail) with SMTP id _____8DxxPC9GcJkXpsKAA--.26890S3;
	Thu, 27 Jul 2023 15:16:14 +0800 (CST)
Received: from localhost.localdomain (unknown [112.20.109.108])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8DxJ8y8GcJkkrY8AA--.56466S2;
	Thu, 27 Jul 2023 15:16:12 +0800 (CST)
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
Subject: [PATCH v2 00/10] stmmac: Add Loongson platform support
Date: Thu, 27 Jul 2023 15:15:44 +0800
Message-Id: <cover.1690439335.git.chenfeiyang@loongson.cn>
X-Mailer: git-send-email 2.39.3
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8DxJ8y8GcJkkrY8AA--.56466S2
X-CM-SenderInfo: hfkh0wphl1t03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoWxJry7Jw1UGryftrWkCr17Arc_yoW8KFyDpF
	9rAa4Yqr97Xr1xJ3Z3Jw1kXF95GayxtF45Ww4IqrsakayIyrZ0qrnI9FWrJF17ZrWDZFya
	qr1UuwnxCF1qkwbCm3ZEXasCq-sJn29KB7ZKAUJUUUU7529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUU9Yb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07
	AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWU
	XVWUAwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7V
	AKI48JMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMxCIbckI1I0E14v2
	6r1Y6r17MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17
	CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF
	0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIx
	AIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIev
	Ja73UjIFyTuYvjxU2MKZDUUUU

Extend stmmac functions and macros for Loongson DWMAC.
Add LS7A support for dwmac_loongson.

Feiyang Chen (10):
  net: stmmac: Pass stmmac_priv and chan in some callbacks
  net: stmmac: dwmac1000: Allow platforms to choose some register
    offsets
  net: stmmac: dwmac1000: Add multi-channel support
  net: stmmac: dwmac1000: Add 64-bit DMA support
  net: stmmac: dwmac1000: Add Loongson register definitions
  net: stmmac: Add Loongson HWIF entry
  net: stmmac: dwmac-loongson: Add LS7A support
  net: stmmac: dwmac-loongson: Disable flow control for GMAC
  net: stmmac: dwmac-loongson: Add 64-bit DMA and multi-vector support
  net: stmmac: dwmac-loongson: Add GNET support

 .../net/ethernet/stmicro/stmmac/chain_mode.c  |  28 +-
 drivers/net/ethernet/stmicro/stmmac/common.h  |   3 +
 drivers/net/ethernet/stmicro/stmmac/descs.h   |   7 +
 .../net/ethernet/stmicro/stmmac/descs_com.h   |  49 +++-
 .../ethernet/stmicro/stmmac/dwmac-loongson.c  | 246 +++++++++++++-----
 .../net/ethernet/stmicro/stmmac/dwmac-sun8i.c |  20 +-
 .../net/ethernet/stmicro/stmmac/dwmac1000.h   |   4 +-
 .../ethernet/stmicro/stmmac/dwmac1000_core.c  |  63 +++--
 .../ethernet/stmicro/stmmac/dwmac1000_dma.c   | 110 +++++++-
 .../ethernet/stmicro/stmmac/dwmac100_core.c   |  12 +-
 .../ethernet/stmicro/stmmac/dwmac100_dma.c    |   2 +-
 .../net/ethernet/stmicro/stmmac/dwmac4_core.c |  11 +-
 .../ethernet/stmicro/stmmac/dwmac4_descs.c    |  19 +-
 .../net/ethernet/stmicro/stmmac/dwmac4_dma.c  |   8 +-
 .../net/ethernet/stmicro/stmmac/dwmac_dma.h   | 210 ++++++++-------
 .../net/ethernet/stmicro/stmmac/dwmac_lib.c   | 156 +++++++++--
 .../ethernet/stmicro/stmmac/dwxgmac2_core.c   |  11 +-
 .../ethernet/stmicro/stmmac/dwxgmac2_descs.c  |  17 +-
 .../ethernet/stmicro/stmmac/dwxgmac2_dma.c    |   8 +-
 .../net/ethernet/stmicro/stmmac/enh_desc.c    |  38 ++-
 drivers/net/ethernet/stmicro/stmmac/hwif.c    |  48 +++-
 drivers/net/ethernet/stmicro/stmmac/hwif.h    |  77 +++---
 .../net/ethernet/stmicro/stmmac/norm_desc.c   |  17 +-
 .../net/ethernet/stmicro/stmmac/ring_mode.c   | 105 ++++++--
 .../ethernet/stmicro/stmmac/stmmac_ethtool.c  |   6 +
 .../net/ethernet/stmicro/stmmac/stmmac_main.c |  38 ++-
 include/linux/stmmac.h                        |  54 ++++
 27 files changed, 997 insertions(+), 370 deletions(-)

-- 
2.39.3

