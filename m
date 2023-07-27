Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F202CA951
	for <loongarch@lists.linux.dev>; Thu, 27 Jul 2023 07:18:56 +0000 (UTC)
Received: from loongson.cn (unknown [112.20.109.108])
	by gateway (Coremail) with SMTP id _____8CxNvFfGsJkcZwKAA--.26496S3;
	Thu, 27 Jul 2023 15:18:55 +0800 (CST)
Received: from localhost.localdomain (unknown [112.20.109.108])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Ax8uReGsJkn7c8AA--.31333S2;
	Thu, 27 Jul 2023 15:18:54 +0800 (CST)
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
Subject: [PATCH v2 08/10] net: stmmac: dwmac-loongson: Disable flow control for GMAC
Date: Thu, 27 Jul 2023 15:18:51 +0800
Message-Id: <0ec0ae938964697010b3d035b7885e4dda89b012.1690439335.git.chenfeiyang@loongson.cn>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <cover.1690439335.git.chenfeiyang@loongson.cn>
References: <cover.1690439335.git.chenfeiyang@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8Ax8uReGsJkn7c8AA--.31333S2
X-CM-SenderInfo: hfkh0wphl1t03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoW7ZFyrWrWDCFy3Ww13KF15Awc_yoW8CF4Upa
	9rAa4I9r97Jr47A3Z8Aw4DZFy5XayUKrZrWayxKw4fWFZ2kr9FqryYqayYvFy7ArW5XFya
	gr4jkr4UCF1DGrgCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkmb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E
	14v26r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44
	I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_ZF0_GryDMcIj6I8E
	87Iv67AKxVWxJVW8Jr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw2
	8IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4l
	x2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrw
	CI42IY6xIIjxv20xvE14v26F1j6w1UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1l
	IxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26F4j6r4UJwCI42IY6I
	8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxU4EfOUUUUU

Loongson GMAC does not support Flow Control featurei. Use
disable_flow_control flag to disable it.

Signed-off-by: Feiyang Chen <chenfeiyang@loongson.cn>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c | 2 ++
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c    | 5 +++++
 include/linux/stmmac.h                               | 1 +
 3 files changed, 8 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
index 3ab55340a6b8..439a5f8bcabe 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
@@ -61,6 +61,8 @@ static int loongson_gmac_data(struct pci_dev *pdev,
 	plat->phy_addr = -1;
 	plat->phy_interface = PHY_INTERFACE_MODE_RGMII_ID;
 
+	plat->disable_flow_control = true;
+
 	return 0;
 }
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 829de274e75d..4f69cad0be42 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -3829,6 +3829,11 @@ static int __stmmac_open(struct net_device *dev,
 				   __func__, ret);
 			goto init_phy_error;
 		}
+
+		if (priv->plat->disable_flow_control) {
+			phy_support_sym_pause(dev->phydev);
+			phy_set_sym_pause(dev->phydev, false, false, true);
+		}
 	}
 
 	/* Extra statistics */
diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
index e21076f57205..54b9f308aabb 100644
--- a/include/linux/stmmac.h
+++ b/include/linux/stmmac.h
@@ -345,5 +345,6 @@ struct plat_stmmacenet_data {
 	const struct dwmac_regs *dwmac_regs;
 	bool dwmac_is_loongson;
 	int has_lgmac;
+	bool disable_flow_control;
 };
 #endif
-- 
2.39.3

