Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67805125AF
	for <loongarch@lists.linux.dev>; Fri, 10 Nov 2023 09:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from loongson.cn (unknown [112.20.112.120])
	by gateway (Coremail) with SMTP id _____8BxJvGW901lULQ4AA--.46305S3;
	Fri, 10 Nov 2023 17:27:50 +0800 (CST)
Received: from localhost.localdomain (unknown [112.20.112.120])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8BxK9yQ901l5_o9AA--.4030S5;
	Fri, 10 Nov 2023 17:27:49 +0800 (CST)
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
	dongbiao@loongson.cn,
	guyinggang@loongson.cn,
	netdev@vger.kernel.org,
	loongarch@lists.linux.dev,
	chris.chenfeiyang@gmail.com
Subject: [PATCH v5 8/9] net: stmmac: dwmac-loongson: Disable flow control for GMAC
Date: Fri, 10 Nov 2023 17:27:33 +0800
Message-Id: <286060399a5b9787a86053c10c5fad93cbf5d0cc.1699533745.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.31.4
In-Reply-To: <cover.1699533745.git.siyanteng@loongson.cn>
References: <cover.1699533745.git.siyanteng@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8BxK9yQ901l5_o9AA--.4030S5
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
X-Coremail-Antispam: 1Uk129KBj93XoW7ArWkuF1rXF43JF1ftw4rCrX_yoW8KFyrpw
	srAa4j9ryDKF17Jan5Aw1kZFy5WayUKFW7uayIkwsa9a92k34qqr1FvFWjyF17urWDWFWa
	qr1UCr1DCFnxJrbCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkqb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r126r13M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAF
	wI0_Gr1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI
	0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWrXVW3AwAv7VC2z280
	aVAFwI0_Cr0_Gr1UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20x
	vY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I
	3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIx
	AIcVC0I7IYx2IY67AKxVW7JVWDJwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UMIIF
	0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWxJVW8Jr1lIxAIcVC2z2
	80aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU8uyxtUUUUU==

Loongson GMAC does not support Flow Control feature. Set flags to
disable it.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
Signed-off-by: Feiyang Chen <chenfeiyang@loongson.cn>
Signed-off-by: Yinggang Gu <guyinggang@loongson.cn>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c | 2 ++
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c    | 6 +++---
 include/linux/stmmac.h                               | 1 +
 3 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
index 575ec2d96741..306b8d53e19c 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
@@ -171,6 +171,8 @@ static int loongson_gmac_config(struct pci_dev *pdev,
 		break;
 	}
 
+	plat->flags |= FIELD_PREP(STMMAC_FLAG_DISABLE_FLOW_CONTROL, 1);
+
 	return ret;
 }
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index aafc75fa14a0..b5cbdbdabebd 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -1235,9 +1235,9 @@ static int stmmac_phy_setup(struct stmmac_priv *priv)
 		xpcs_get_interfaces(priv->hw->xpcs,
 				    priv->phylink_config.supported_interfaces);
 
-	priv->phylink_config.mac_capabilities = MAC_ASYM_PAUSE | MAC_SYM_PAUSE |
-						MAC_10FD | MAC_100FD |
-						MAC_1000FD;
+	priv->phylink_config.mac_capabilities = MAC_10FD | MAC_100FD | MAC_1000FD;
+	if (!FIELD_GET(STMMAC_FLAG_DISABLE_FLOW_CONTROL, priv->plat->flags))
+		priv->phylink_config.mac_capabilities |= MAC_ASYM_PAUSE | MAC_SYM_PAUSE;
 
 	stmmac_set_half_duplex(priv);
 
diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
index 2b8f5dc09920..f3e1b68c2946 100644
--- a/include/linux/stmmac.h
+++ b/include/linux/stmmac.h
@@ -222,6 +222,7 @@ struct dwmac4_addrs {
 #define STMMAC_FLAG_HWTSTAMP_CORRECT_LATENCY	BIT(12)
 #define STMMAC_FLAG_DISABLE_HALF_DUPLEX	BIT(13)
 #define STMMAC_FLAG_DISABLE_FORCE_1000	BIT(14)
+#define STMMAC_FLAG_DISABLE_FLOW_CONTROL	BIT(15)
 
 struct plat_stmmacenet_data {
 	int bus_id;
-- 
2.31.4

