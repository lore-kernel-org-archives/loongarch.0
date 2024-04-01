Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB19DD268
	for <loongarch@lists.linux.dev>; Mon,  1 Apr 2024 08:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711959865; cv=none; b=rEj2hSb3Nzu66OAthotWaWVt7oJwxUyEsUtryNU1a06valbqIL2QxQjtskgeJ5606YEXfxhqOXKUwXI/u5MkYKudsfjXCTfPbkNhYC6sp082Z+MW9luyQo/45iR5DNwskDQ0ydp2K84sZCdmaKWRsP+zvT5vRK0jitzyfbHVqzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711959865; c=relaxed/simple;
	bh=POWtEBcgJvIVxTse4KGEElw27PRmCPHPNJThgQdCcHo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Hc0S0Gy5Ax8WtFrktek9o/KCJsM0cAGpxofzgrPE4UWxZKUffBIhOw+wIWsDF8SOgKvJ3xrRwuBF5Qn8lTMG+dTWhlZ69doR5gKL7criLlJ8dofhKLkc+JL8hMj2znY+yuMsnnCVpJQVXt5OONfRS4XBEgtR4M1GjJU1+QwpMUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [112.20.109.80])
	by gateway (Coremail) with SMTP id _____8Bxieg2bwpm5ughAA--.59056S3;
	Mon, 01 Apr 2024 16:24:22 +0800 (CST)
Received: from localhost.localdomain (unknown [112.20.109.80])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8BxGBI0bwpmFydwAA--.10364S2;
	Mon, 01 Apr 2024 16:24:21 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yinbo Zhu <zhuyinbo@loongson.cn>
Cc: Huacai Chen <chenhuacai@kernel.org>,
	loongson-kernel@lists.loongnix.cn,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH v2 4/8] clk: clk-loongson2: Add Loongson-2K0500 clock support
Date: Mon,  1 Apr 2024 16:24:16 +0800
Message-ID: <3142fb197a2f1a1f78fd49a938ead4264371a04d.1711504700.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1711504700.git.zhoubinbin@loongson.cn>
References: <cover.1711504700.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8BxGBI0bwpmFydwAA--.10364S2
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoW7KFWfKrWDWr13Cr45JF45XFc_yoW8KrW5pr
	1fCw43G34rtF40grnxJ34Uuw43ZrW7Xasrtay2kr1Duan7JF10qF1FyF4xJFsxGryvyFy3
	Zr4q9rsIka1UXrbCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUBSb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAF
	wI0_Gr1j6F4UJwAaw2AFwI0_Jrv_JF1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2
	xF0cIa020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_
	Wrv_ZF1lYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x
	0EwIxGrwCY1x0262kKe7AKxVWUAVWUtwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkE
	bVWUJVW8JwCFI7km07C267AKxVWUXVWUAwC20s026c02F40E14v26r1j6r18MI8I3I0E74
	80Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0
	I7IYx2IY67AKxVW5JVW7JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UMIIF0xvE42
	xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF
	7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxU36RRDUUUU

The Loongson-2K0500 and Loongson-2K1000 clock is similar, we add its
support by different configurations.

Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 drivers/clk/clk-loongson2.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/clk/clk-loongson2.c b/drivers/clk/clk-loongson2.c
index ff2ade6a471a..b5dd9d028826 100644
--- a/drivers/clk/clk-loongson2.c
+++ b/drivers/clk/clk-loongson2.c
@@ -90,6 +90,27 @@ struct loongson2_clk_board_info {
 		.div_width	= _dwidth,			\
 	}
 
+static const struct loongson2_clk_board_info ls2k0500_clks[] = {
+	CLK_PLL(LOONGSON2_NODE_PLL,   "pll_node", 0,    16, 8, 8, 6),
+	CLK_PLL(LOONGSON2_DDR_PLL,    "pll_ddr",  0x8,  16, 8, 8, 6),
+	CLK_PLL(LOONGSON2_DC_PLL,     "pll_soc",  0x10, 16, 8, 8, 6),
+	CLK_PLL(LOONGSON2_PIX0_PLL,   "pll_pix0", 0x18, 16, 8, 8, 6),
+	CLK_PLL(LOONGSON2_PIX1_PLL,   "pll_pix1", 0x20, 16, 8, 8, 6),
+	CLK_DIV(LOONGSON2_NODE_CLK,   "clk_node", "pll_node", 0,    24, 6),
+	CLK_DIV(LOONGSON2_DDR_CLK,    "clk_ddr",  "pll_ddr",  0x8,  24, 6),
+	CLK_DIV(LOONGSON2_HDA_CLK,    "clk_hda",  "pll_ddr",  0xc,  8,  6),
+	CLK_DIV(LOONGSON2_GPU_CLK,    "clk_gpu",  "pll_soc",  0x10, 24, 6),
+	CLK_DIV(LOONGSON2_DC_CLK,     "clk_sb",   "pll_soc",  0x14, 0,  6),
+	CLK_DIV(LOONGSON2_GMAC_CLK,   "clk_gmac", "pll_soc",  0x14, 8,  6),
+	CLK_DIV(LOONGSON2_PIX0_CLK,   "clk_pix0", "pll_pix0", 0x18, 24, 6),
+	CLK_DIV(LOONGSON2_PIX1_CLK,   "clk_pix1", "pll_pix1", 0x20, 24, 6),
+	CLK_SCALE(LOONGSON2_BOOT_CLK, "clk_boot", "clk_sb",   0x28, 8,  3),
+	CLK_SCALE(LOONGSON2_SATA_CLK, "clk_sata", "clk_sb",   0x28, 12, 3),
+	CLK_SCALE(LOONGSON2_USB_CLK,  "clk_usb",  "clk_sb",   0x28, 16, 3),
+	CLK_SCALE(LOONGSON2_APB_CLK,  "clk_apb",  "clk_sb",   0x28, 20, 3),
+	{ /* Sentinel */ },
+};
+
 static const struct loongson2_clk_board_info ls2k1000_clks[] = {
 	CLK_PLL(LOONGSON2_NODE_PLL,   "pll_node", 0,    32, 10, 26, 6),
 	CLK_PLL(LOONGSON2_DDR_PLL,    "pll_ddr",  0x10, 32, 10, 26, 6),
@@ -261,6 +282,7 @@ static int loongson2_clk_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id loongson2_clk_match_table[] = {
+	{ .compatible = "loongson,ls2k0500-clk", .data = &ls2k0500_clks },
 	{ .compatible = "loongson,ls2k-clk", .data = &ls2k1000_clks },
 	{ }
 };
-- 
2.43.0

