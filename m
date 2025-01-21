Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C20841C07CF
	for <loongarch@lists.linux.dev>; Tue, 21 Jan 2025 09:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737452248; cv=none; b=ruliQ9oJHRHNB7GH+w58crqP/BDqcbGkoM/gB0c2rs/mvOdy50qw7XHt0HTKGCA55U1RH8dFY2JUURKfGHxfJYU+E08qZPv+pfMN6s7ahxfmh2KrJy2kGgtS873FWvX3eMs57XDarsxBBo8kiMYWEfXQhWp2hYLAmqAu7YlJ/II=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737452248; c=relaxed/simple;
	bh=mArYv62I2thEnmMUnL9Bh+biQc+10qSbAX4piUIO/pM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CJoOPSuBbYsK5SOQ7ehZ+mVV5BWcQq/kCCzkMLjR8nuyh0rpRbD8qPa8Q1p7DDs4qP751+MCVX/M0xKjCnZfrs/D8jcgjgC8ESRTx4RwpPgBbqhp/7iPzYNHOtmFsAeAQ/mQeFm75fnZc2ahDA9f6GkiT9679f95jMYQzBR/AvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.63])
	by gateway (Coremail) with SMTP id _____8CxieHRao9nDLVmAA--.8301S3;
	Tue, 21 Jan 2025 17:37:21 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.68.63])
	by front1 (Coremail) with SMTP id qMiowMAx_8XLao9nQLwpAA--.20753S2;
	Tue, 21 Jan 2025 17:37:20 +0800 (CST)
From: Huacai Chen <chenhuacai@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>
Cc: Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	loongarch@lists.linux.dev,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Huacai Chen <chenhuacai@loongson.cn>,
	stable@vger.kernel.org,
	Chong Qiao <qiaochong@loongson.cn>
Subject: [PATCH] net: stmmac: dwmac-loongson: Set correct {tx,rx}_fifo_size
Date: Tue, 21 Jan 2025 17:37:03 +0800
Message-ID: <20250121093703.2660482-1-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMAx_8XLao9nQLwpAA--.20753S2
X-CM-SenderInfo: hfkh0x5xdftxo6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoW7KFWkCF1rJFWfKr18tr4fWFX_yoW8Gryrpr
	W3Ca4ag34avr43C3Z8Z3yUCry5uayUWrZrWFWIk34fCFZ5A34qqryY9ayYgrZrAFZ5WFy2
	vr1DCr4fGF1DGwbCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUk0b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v2
	6F4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc
	02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAF
	wI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw28IcxkI7V
	AKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCj
	r7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6x
	IIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAI
	w20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x
	0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxU7_MaUUUUU

Now for dwmac-loongson {tx,rx}_fifo_size are uninitialised, which means
zero. This means dwmac-loongson doesn't support changing MTU, so set the
correct tx_fifo_size and rx_fifo_size for it (16KB multiplied by channel
counts).

Note: the Fixes tag is not exactly right, but it is a key commit of the
dwmac-loongson series.

Cc: stable@vger.kernel.org
Fixes: ad72f783de06827a1f ("net: stmmac: Add multi-channel support")
Signed-off-by: Chong Qiao <qiaochong@loongson.cn>
Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
index bfe6e2d631bd..79acdf38c525 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
@@ -574,6 +574,9 @@ static int loongson_dwmac_probe(struct pci_dev *pdev, const struct pci_device_id
 	if (ret)
 		goto err_disable_device;
 
+	plat->tx_fifo_size = SZ_16K * plat->tx_queues_to_use;
+	plat->rx_fifo_size = SZ_16K * plat->rx_queues_to_use;
+
 	if (dev_of_node(&pdev->dev))
 		ret = loongson_dwmac_dt_config(pdev, plat, &res);
 	else
-- 
2.47.1

