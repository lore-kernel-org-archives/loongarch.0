Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE0CE1B960
	for <loongarch@lists.linux.dev>; Tue, 26 Mar 2024 09:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711443710; cv=none; b=XeB9yagtKr7bPMtpwZ4QTgibLrZqhGPf3vYgsqsSBMrnRc1yUVlmMtLtQi4VoXS8CL/qD5aRvMyL2kmQMlhU1b3yFvHLWJSj5zXC95SYPbdG07v6R6vHj6I3gb58OnamjUfch3PVlrQN70JRU4FjhT9eWjjK2BuBgK81MmDUlHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711443710; c=relaxed/simple;
	bh=4Xa7Yi6ii5F2ry1j/kHjycqZloDFU2xQFvbslazNrNo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GWjFCF+fdJ+T3BW9hjJIRG1asGsKitSZXA2jO8nchofgja8Kp3qpjU/X4JuMAJ1GF2ASnaYod+rvdQ0WQciPT4x9zyY6KapYCJ1E8KuwcmJWm4aTPnIcOeqHg8Ojh37nO/AbkKT8ooQIixuDJzQC6kkpXG60UPWw5KdJ0BPFvvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [112.20.109.198])
	by gateway (Coremail) with SMTP id _____8BxefD6jgJm1E4eAA--.6902S3;
	Tue, 26 Mar 2024 17:01:46 +0800 (CST)
Received: from localhost.localdomain (unknown [112.20.109.198])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8BxXs3zjgJmdLJoAA--.6145S4;
	Tue, 26 Mar 2024 17:01:46 +0800 (CST)
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
Subject: [PATCH v1 6/8] clk: clk-loongson2: Add Loongson-2K2000 clock support
Date: Tue, 26 Mar 2024 17:01:26 +0800
Message-ID: <861486548d93f4c40b0c054b52eb639cdc68203d.1710926402.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1710926402.git.zhoubinbin@loongson.cn>
References: <cover.1710926402.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8BxXs3zjgJmdLJoAA--.6145S4
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoW3Xw1kKry7KrykKFyrZFWfXrc_yoW7WFWkpF
	9Yy3yfKws5trsYgr95XryDCrZ3AF47X3ZrtanFkr4DZ3Z7tr1IgF4FyF4xGF45WrykJa43
	Zw4q9r42ka1UXwbCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUBvb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r126r13M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
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
	c7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jxhL8UUUUU=

The Loongson-2K2000 and Loongson-2K1000 clock is similar, we add its
support by different configurations.

Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 drivers/clk/clk-loongson2.c | 72 +++++++++++++++++++++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/drivers/clk/clk-loongson2.c b/drivers/clk/clk-loongson2.c
index 4e3b287ff9a0..271de0e10518 100644
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

