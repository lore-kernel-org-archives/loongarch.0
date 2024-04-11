Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C07FF13AD2E
	for <loongarch@lists.linux.dev>; Thu, 11 Apr 2024 02:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712804337; cv=none; b=jXWKNRkJ2EQZ0x2gdJWmZANES3/O0OLqeCXWcbvQSEY1bnfmE9Z584OrbZAACivv99qb+uJ2hgI1ajjeSDJACzMvCrAV8aA7jxOiWevcCthF9nB2vBV1pykRiwTIddTlR09R2i+xTMJOXoLNAxx1rKTbRZKhur6fMuxu9paPAjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712804337; c=relaxed/simple;
	bh=p5Ei0pRudkJ70dgUX671etY5Qn39dG0h5raf+4rXBZM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YBjKq2eN2eEJArW74brlJEWnRFy5vatT6sHiaQb0HhavP18P19Prs3DcanFPXLBrDn6o4kDq9Y8/HoRHAeMKsP9fMtB/9R6zmPUmvQI3rWBlbQ0uVweqqnhNQ7EOrN4tlQP0+OEZNkwdGwRuMmmvNtFinWhJ+1b5gg1lMPhxmPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [112.20.109.80])
	by gateway (Coremail) with SMTP id _____8CxbevtURdmNp0lAA--.20687S3;
	Thu, 11 Apr 2024 10:58:53 +0800 (CST)
Received: from localhost.localdomain (unknown [112.20.109.80])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8DxfRPlURdmFcp3AA--.1321S4;
	Thu, 11 Apr 2024 10:58:51 +0800 (CST)
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
Subject: [PATCH v3 6/6] clk: clk-loongson2: Add Loongson-2K2000 clock support
Date: Thu, 11 Apr 2024 10:58:33 +0800
Message-ID: <8b0b5851783acf8ebe13b50391d15b58cc181613.1712731524.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1712731524.git.zhoubinbin@loongson.cn>
References: <cover.1712731524.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8DxfRPlURdmFcp3AA--.1321S4
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoW3Xw1kKry7KrykKFyrZFWfXrc_yoW7WFWkpF
	9Yy3yfKws5trsYgr95XryDCrZ3AF47X3ZrtanFkr4DZ3Z7tr1IgF4FyFWxGF45WrykJa43
	Zw4q9r47Ca1UXwbCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUBvb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAF
	wI0_Gr1j6F4UJwAaw2AFwI0_Jrv_JF1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2
	xF0cIa020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_
	Wrv_ZF1lYx0Ex4A2jsIE14v26F4j6r4UJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2
	Ij64vIr41lc7CjxVAaw2AFwI0_JF0_Jw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Y
	z7v_Jr0_Gr1l4IxYO2xFxVAFwI0_Jrv_JF1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x
	8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE
	2Ix0cI8IcVAFwI0_Ar0_tr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwCI42IY6x
	AIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Cr0_Gr1UMIIF0xvEx4A2jsIE
	c7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jVeHDUUUUU=

The Loongson-2K2000 and Loongson-2K1000 clock is similar, we add its
support by different configurations.

Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 drivers/clk/clk-loongson2.c | 72 +++++++++++++++++++++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/drivers/clk/clk-loongson2.c b/drivers/clk/clk-loongson2.c
index b5dd9d028826..0d82aeeadb45 100644
--- a/drivers/clk/clk-loongson2.c
+++ b/drivers/clk/clk-loongson2.c
@@ -22,6 +22,8 @@ enum loongson2_clk_type {
 	CLK_TYPE_PLL,
 	CLK_TYPE_SCALE,
 	CLK_TYPE_DIVIDER,
+	CLK_TYPE_GATE,
+	CLK_TYPE_FIXED,
 	CLK_TYPE_NONE,
 };
 
@@ -46,11 +48,13 @@ struct loongson2_clk_board_info {
 	enum loongson2_clk_type type;
 	const char *name;
 	const char *parent_name;
+	unsigned long fixed_rate;
 	u8 reg_offset;
 	u8 div_shift;
 	u8 div_width;
 	u8 mult_shift;
 	u8 mult_width;
+	u8 bit_idx;
 };
 
 #define CLK_DIV(_id, _name, _pname, _offset, _dshift, _dwidth)	\
@@ -90,6 +94,25 @@ struct loongson2_clk_board_info {
 		.div_width	= _dwidth,			\
 	}
 
+#define CLK_GATE(_id, _name, _pname, _offset, _bidx)		\
+	{							\
+		.id		= _id,				\
+		.type		= CLK_TYPE_GATE,		\
+		.name		= _name,			\
+		.parent_name	= _pname,			\
+		.reg_offset	= _offset,			\
+		.bit_idx	= _bidx,			\
+	}
+
+#define CLK_FIXED(_id, _name, _pname, _rate)			\
+	{							\
+		.id		= _id,				\
+		.type		= CLK_TYPE_FIXED,		\
+		.name		= _name,			\
+		.parent_name	= _pname,			\
+		.fixed_rate	= _rate,			\
+	}
+
 static const struct loongson2_clk_board_info ls2k0500_clks[] = {
 	CLK_PLL(LOONGSON2_NODE_PLL,   "pll_node", 0,    16, 8, 8, 6),
 	CLK_PLL(LOONGSON2_DDR_PLL,    "pll_ddr",  0x8,  16, 8, 8, 6),
@@ -138,6 +161,44 @@ static const struct loongson2_clk_board_info ls2k1000_clks[] = {
 	{ /* Sentinel */ },
 };
 
+static const struct loongson2_clk_board_info ls2k2000_clks[] = {
+	CLK_PLL(LOONGSON2_DC_PLL,     "pll_0",    0,    21, 9, 32, 6),
+	CLK_PLL(LOONGSON2_DDR_PLL,    "pll_1",    0x10, 21, 9, 32, 6),
+	CLK_PLL(LOONGSON2_NODE_PLL,   "pll_2",    0x20, 21, 9, 32, 6),
+	CLK_PLL(LOONGSON2_PIX0_PLL,   "pll_pix0", 0x30, 21, 9, 32, 6),
+	CLK_PLL(LOONGSON2_PIX1_PLL,   "pll_pix1", 0x40, 21, 9, 32, 6),
+	CLK_GATE(LOONGSON2_OUT0_GATE, "out0_gate", "pll_0",    0,    40),
+	CLK_GATE(LOONGSON2_GMAC_GATE, "gmac_gate", "pll_0",    0,    41),
+	CLK_GATE(LOONGSON2_RIO_GATE,  "rio_gate",  "pll_0",    0,    42),
+	CLK_GATE(LOONGSON2_DC_GATE,   "dc_gate",   "pll_1",    0x10, 40),
+	CLK_GATE(LOONGSON2_DDR_GATE,  "ddr_gate",  "pll_1",    0x10, 41),
+	CLK_GATE(LOONGSON2_GPU_GATE,  "gpu_gate",  "pll_1",    0x10, 42),
+	CLK_GATE(LOONGSON2_HDA_GATE,  "hda_gate",  "pll_2",    0x20, 40),
+	CLK_GATE(LOONGSON2_NODE_GATE, "node_gate", "pll_2",    0x20, 41),
+	CLK_GATE(LOONGSON2_EMMC_GATE, "emmc_gate", "pll_2",    0x20, 42),
+	CLK_GATE(LOONGSON2_PIX0_GATE, "pix0_gate", "pll_pix0", 0x30, 40),
+	CLK_GATE(LOONGSON2_PIX1_GATE, "pix1_gate", "pll_pix1", 0x40, 40),
+	CLK_DIV(LOONGSON2_OUT0_CLK,   "clk_out0", "out0_gate", 0,    0,  6),
+	CLK_DIV(LOONGSON2_GMAC_CLK,   "clk_gmac", "gmac_gate", 0,    7,  6),
+	CLK_DIV(LOONGSON2_RIO_CLK,    "clk_rio",  "rio_gate",  0,    14, 6),
+	CLK_DIV(LOONGSON2_DC_CLK,     "clk_dc",   "dc_gate",   0x10, 0,  6),
+	CLK_DIV(LOONGSON2_GPU_CLK,    "clk_gpu",  "gpu_gate",  0x10, 7,  6),
+	CLK_DIV(LOONGSON2_DDR_CLK,    "clk_ddr",  "ddr_gate",  0x10, 14, 6),
+	CLK_DIV(LOONGSON2_HDA_CLK,    "clk_hda",  "hda_gate",  0x20, 0,  6),
+	CLK_DIV(LOONGSON2_NODE_CLK,   "clk_node", "node_gate", 0x20, 7,  6),
+	CLK_DIV(LOONGSON2_EMMC_CLK,   "clk_emmc", "emmc_gate", 0x20, 14, 6),
+	CLK_DIV(LOONGSON2_PIX0_CLK,   "clk_pix0", "pll_pix0",  0x30, 0,  6),
+	CLK_DIV(LOONGSON2_PIX1_CLK,   "clk_pix1", "pll_pix1",  0x40, 0,  6),
+	CLK_SCALE(LOONGSON2_SATA_CLK, "clk_sata", "clk_out0",  0x50, 12, 3),
+	CLK_SCALE(LOONGSON2_USB_CLK,  "clk_usb",  "clk_out0",  0x50, 16, 3),
+	CLK_SCALE(LOONGSON2_APB_CLK,  "clk_apb",  "clk_node",  0x50, 20, 3),
+	CLK_SCALE(LOONGSON2_BOOT_CLK, "clk_boot", NULL,        0x50, 23, 3),
+	CLK_SCALE(LOONGSON2_DES_CLK,  "clk_des",  "clk_node",  0x50, 40, 3),
+	CLK_SCALE(LOONGSON2_I2S_CLK,  "clk_i2s",  "clk_node",  0x50, 44, 3),
+	CLK_FIXED(LOONGSON2_MISC_CLK, "clk_misc", NULL, 50000000),
+	{ /* Sentinel */ },
+};
+
 static inline struct loongson2_clk_data *to_loongson2_clk(struct clk_hw *hw)
 {
 	return container_of(hw, struct loongson2_clk_data, hw);
@@ -266,6 +327,16 @@ static int loongson2_clk_probe(struct platform_device *pdev)
 							  CLK_DIVIDER_ONE_BASED,
 							  &clp->clk_lock);
 			break;
+		case CLK_TYPE_GATE:
+			hw = devm_clk_hw_register_gate(dev, p->name, p->parent_name, 0,
+						       clp->base + p->reg_offset,
+						       p->bit_idx, 0,
+						       &clp->clk_lock);
+			break;
+		case CLK_TYPE_FIXED:
+			hw = clk_hw_register_fixed_rate_parent_data(dev, p->name, pdata,
+								    0, p->fixed_rate);
+			break;
 		default:
 			return dev_err_probe(dev, -EINVAL, "Invalid clk type\n");
 		}
@@ -284,6 +355,7 @@ static int loongson2_clk_probe(struct platform_device *pdev)
 static const struct of_device_id loongson2_clk_match_table[] = {
 	{ .compatible = "loongson,ls2k0500-clk", .data = &ls2k0500_clks },
 	{ .compatible = "loongson,ls2k-clk", .data = &ls2k1000_clks },
+	{ .compatible = "loongson,ls2k2000-clk", .data = &ls2k2000_clks },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, loongson2_clk_match_table);
-- 
2.43.0

