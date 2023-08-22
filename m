Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EC871BF1D
	for <loongarch@lists.linux.dev>; Tue, 22 Aug 2023 09:41:25 +0000 (UTC)
Received: from loongson.cn (unknown [112.20.109.102])
	by gateway (Coremail) with SMTP id _____8AxZ+jDguRkReAaAA--.18988S3;
	Tue, 22 Aug 2023 17:41:23 +0800 (CST)
Received: from localhost.localdomain (unknown [112.20.109.102])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Ax3c7AguRkqTVgAA--.38684S3;
	Tue, 22 Aug 2023 17:41:22 +0800 (CST)
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
	guyinggang@loongson.cn,
	siyanteng@loongson.cn,
	loongson-kernel@lists.loongnix.cn,
	netdev@vger.kernel.org,
	loongarch@lists.linux.dev,
	chris.chenfeiyang@gmail.com
Subject: [PATCH v4 09/11] net: stmmac: dwmac-loongson: Disable flow control for GMAC
Date: Tue, 22 Aug 2023 17:41:17 +0800
Message-Id: <3a1380123ae8a95ae993641d5914c43eb0895fec.1692696115.git.chenfeiyang@loongson.cn>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <cover.1692696115.git.chenfeiyang@loongson.cn>
References: <cover.1692696115.git.chenfeiyang@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8Ax3c7AguRkqTVgAA--.38684S3
X-CM-SenderInfo: hfkh0wphl1t03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoW7CryDXrW5GFy3ur47KF1xJFc_yoW8tF1xpa
	nrAa48WrnrtF47Jan5Aw4kZFy5Wa47KFW7uayxCws3WFZ2k34qqr1YgFWjyF17urWDWFya
	qrWUCr4DCFnxArbCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUU90b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E
	14v26r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44
	I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_ZF0_GryDMcIj6I8E
	87Iv67AKxVW8Jr0_Cr1UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwACjc
	xG6xCI17CEII8vrVW3JVW8Jr1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_
	Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17
	CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_tr0E3s1lIxAIcVC0
	I7IYx2IY6xkF7I0E14v26F4j6r4UJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcV
	C2z280aVAFwI0_Cr0_Gr1UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVj
	vjDU0xZFpf9x07b5yIUUUUUU=

Loongson GMAC does not support Flow Control feature. Set dwmac_flag
to disable it.

Signed-off-by: Feiyang Chen <chenfeiyang@loongson.cn>
Signed-off-by: Yinggang Gu <guyinggang@loongson.cn>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c | 2 ++
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c    | 6 ++++--
 include/linux/stmmac.h                               | 1 +
 3 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
index 9fb27fc94d2a..1f466b1e80d9 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
@@ -182,6 +182,8 @@ static int loongson_gmac_config(struct pci_dev *pdev,
 		break;
 	}
 
+	plat->dwegmac_flags |= FIELD_PREP(DWEGMAC_DISABLE_FLOW_CONTROL, 1);
+
 	return ret;
 }
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 1d67e5ec5fac..a98bcd797720 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -1213,8 +1213,10 @@ static int stmmac_phy_setup(struct stmmac_priv *priv)
 		xpcs_get_interfaces(priv->hw->xpcs,
 				    priv->phylink_config.supported_interfaces);
 
-	priv->phylink_config.mac_capabilities = MAC_ASYM_PAUSE | MAC_SYM_PAUSE |
-		MAC_10 | MAC_100;
+	priv->phylink_config.mac_capabilities = MAC_10 | MAC_100;
+	if (!FIELD_GET(DWEGMAC_DISABLE_FLOW_CONTROL, priv->plat->dwegmac_flags))
+		priv->phylink_config.mac_capabilities |=
+			MAC_ASYM_PAUSE | MAC_SYM_PAUSE;
 
 	if (!max_speed || max_speed >= 1000)
 		priv->phylink_config.mac_capabilities |= MAC_1000;
diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
index e4088d2a0f39..e97774efd451 100644
--- a/include/linux/stmmac.h
+++ b/include/linux/stmmac.h
@@ -208,6 +208,7 @@ struct dwmac4_addrs {
 };
 
 #define DWEGMAC_FIX_CHANNEL_NUM		BIT(0)
+#define DWEGMAC_DISABLE_FLOW_CONTROL	BIT(1)
 
 struct plat_stmmacenet_data {
 	int bus_id;
-- 
2.39.3

