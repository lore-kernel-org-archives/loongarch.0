Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5153224C3
	for <loongarch@lists.linux.dev>; Wed, 13 Dec 2023 10:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [112.20.109.254])
	by gateway (Coremail) with SMTP id _____8CxueiWg3llEKEAAA--.3853S3;
	Wed, 13 Dec 2023 18:12:38 +0800 (CST)
Received: from localhost.localdomain (unknown [112.20.109.254])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8CxguOPg3llXjMCAA--.15020S2;
	Wed, 13 Dec 2023 18:12:32 +0800 (CST)
From: Yanteng Si <siyanteng@loongson.cn>
To: andrew@lunn.ch,
	hkallweit1@gmail.com,
	peppe.cavallaro@st.com,
	alexandre.torgue@foss.st.com,
	joabreu@synopsys.com
Cc: Yanteng Si <siyanteng@loongson.cn>,
	fancer.lancer@gmail.com,
	Jose.Abreu@synopsys.com,
	chenhuacai@loongson.cn,
	linux@armlinux.org.uk,
	guyinggang@loongson.cn,
	netdev@vger.kernel.org,
	loongarch@lists.linux.dev,
	chris.chenfeiyang@gmail.com
Subject: [PATCH v6 0/9] stmmac: Add Loongson platform support
Date: Wed, 13 Dec 2023 18:12:22 +0800
Message-Id: <cover.1702458672.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.31.4
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8CxguOPg3llXjMCAA--.15020S2
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
X-Coremail-Antispam: 1Uk129KBj93XoWxCF45Wr45Wr47CFWDJr1UArc_yoW5CF18pF
	W7Aa4YgrZ7tr1xA3Z5Jw1DXFy5Wayayr47Wa1Iqw1Ska9rKryjqrya9FWYvFy7ArZ8uFy2
	qr1UCr1DCF1qk3cCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkFb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv
	67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2
	Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s02
	6x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0x
	vE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE
	42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6x
	kF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07j8yCJUUUUU=

v6:

* Refer to Serge's suggestion:
  - Add new platform feature flag:
    include/linux/stmmac.h:
    +#define STMMAC_FLAG_HAS_LGMAC			BIT(13)

  - Add the IRQs macros specific to the Loongson Multi-channels GMAC:
     drivers/net/ethernet/stmicro/stmmac/dwmac_dma.h:
     +#define DMA_INTR_ENA_NIE_LOONGSON 0x00060000	/* Normal Loongson Tx/Rx Summary */
     #define DMA_INTR_ENA_NIE 0x00010000	/* Normal Summary */
     ...

  - Drop all of redundant changes that don't require the
    prototypes being converted to accepting the stmmac_priv
    pointer.

* Refer to andrew's suggestion:
  - Drop white space changes.
  - break patch up into lots of smaller parts.
     Some small patches have been put into another series as a preparation
     see <https://lore.kernel.org/loongarch/cover.1702289232.git.siyanteng@loongson.cn/T/#t>
     
     *note* : This series of patches relies on the three small patches above.
* others
  - Drop irq_flags changes.
  - Changed patch order.



v4 -> v5:

* Remove an ugly and useless patch (fix channel number).
* Remove the non-standard dma64 driver code, and also remove
  the HWIF entries, since the associated custom callbacks no
  longer exist.
* Refer to Serge's suggestion: Update the dwmac1000_dma.c to
  support the multi-DMA-channels controller setup.

See:
v4: <https://lore.kernel.org/loongarch/cover.1692696115.git.chenfeiyang@loongson.cn/>
v3: <https://lore.kernel.org/loongarch/cover.1691047285.git.chenfeiyang@loongson.cn/>
v2: <https://lore.kernel.org/loongarch/cover.1690439335.git.chenfeiyang@loongson.cn/>
v1: <https://lore.kernel.org/loongarch/cover.1689215889.git.chenfeiyang@loongson.cn/>

Yanteng Si (9):
  net: stmmac: Pass stmmac_priv and chan in some callbacks
  net: stmmac: dwmac-loongson: Refactor code for loongson_dwmac_probe()
  net: stmmac: dwmac-loongson: Add full PCI support
  net: stmmac: Add multi-channel supports
  net: stmmac: Add Loongson-specific register definitions
  net: stmmac: dwmac-loongson: Add MSI support
  net: stmmac: dwmac-loongson: Add GNET support
  net: stmmac: dwmac-loongson: Disable flow control for GMAC
  net: stmmac: Disable coe for some Loongson GNET

 drivers/net/ethernet/stmicro/stmmac/common.h  |   1 +
 .../ethernet/stmicro/stmmac/dwmac-loongson.c  | 296 ++++++++++++++----
 .../net/ethernet/stmicro/stmmac/dwmac-sun8i.c |   2 +-
 .../ethernet/stmicro/stmmac/dwmac1000_dma.c   |  61 +++-
 .../ethernet/stmicro/stmmac/dwmac100_dma.c    |   2 +-
 .../net/ethernet/stmicro/stmmac/dwmac4_dma.c  |   2 +-
 .../net/ethernet/stmicro/stmmac/dwmac_dma.h   |  47 ++-
 .../net/ethernet/stmicro/stmmac/dwmac_lib.c   |  65 ++--
 .../ethernet/stmicro/stmmac/dwxgmac2_dma.c    |   2 +-
 drivers/net/ethernet/stmicro/stmmac/hwif.c    |   8 +-
 drivers/net/ethernet/stmicro/stmmac/hwif.h    |  11 +-
 .../ethernet/stmicro/stmmac/stmmac_ethtool.c  |   6 +
 .../net/ethernet/stmicro/stmmac/stmmac_main.c |  13 +-
 include/linux/stmmac.h                        |   4 +
 14 files changed, 413 insertions(+), 107 deletions(-)

-- 
2.31.4

