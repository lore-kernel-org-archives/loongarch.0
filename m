Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7512381EB3
	for <loongarch@lists.linux.dev>; Thu, 30 Jul 2026 06:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785393963; cv=none; b=pO58tC471wmwyJvp15Tgq7aBRu+v85c3mOFxufyA/1Nj73SfnEh7Yww71LMWg/TiStmjjA8VIVjHaCIeYygxdc8ZcBKhXEsiITtb74rOr4EBg3Sasc+rMUcps5t83WC4vyXT6FYguFu9qK2an9ppwB1seIjxhXbak9yM91i4LeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785393963; c=relaxed/simple;
	bh=ylycxjZ3wBes2V3A+JmJcjeDIO2FwGbhtP2dFVzrKHY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V3T9htXVe1M48JBy3RwWT+wRbGJCh0IBDV29rzd6Njk3KN0SZSvenvqxmeiXudxFP3LDBsh1A5G6uBBhgT4Qxu0VGBll+C91eDsAQex9rjtyXol6WA+Sg6l3zM34YS4Ft6mdDHQ3Ubm8PTzPRbX8+sAqcknuaQm3jOtfG3NqdD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.40.54.123])
	by gateway (Coremail) with SMTP id _____8BxOqEn82pqssQIAA--.6755S3;
	Thu, 30 Jul 2026 14:45:59 +0800 (CST)
Received: from localhost.localdomain (unknown [10.40.54.123])
	by front1 (Coremail) with SMTP id qMiowJAxSsQU82pq8IUdAA--.41200S4;
	Thu, 30 Jul 2026 14:45:59 +0800 (CST)
From: Qunqin Zhao <zhaoqunqin@loongson.cn>
To: bp@alien8.de
Cc: tony.luck@intel.com,
	linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	Qunqin Zhao <zhaoqunqin@loongson.cn>,
	Wusheng <wusheng@loongson.cn>,
	Wang Jinwei <wangjinwei@loongson.cn>
Subject: [PATCH 3/3] EDAC/loongson: Add CS4-7 timeout filter for cross-node access
Date: Thu, 30 Jul 2026 14:30:35 +0800
Message-ID: <20260730063035.230686-3-zhaoqunqin@loongson.cn>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20260730063035.230686-1-zhaoqunqin@loongson.cn>
References: <20260730063035.230686-1-zhaoqunqin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJAxSsQU82pq8IUdAA--.41200S4
X-CM-SenderInfo: 52kd01pxqtx0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoWxXFWUWrWkCw47JF1DGr4Dtrc_yoW5Aw4xpF
	45Ca9xtrW0grn29w1ktrWUZFy5uFZ7tFZ7WrZ3A3yfur9Iy34DZrySgry2vFn8CryrtFyY
	v3Z5Kw47Ca17AabCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkFb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
	Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jw0_WrylYx0Ex4A2jsIE
	14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x
	0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E
	7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcV
	C0I7IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF
	04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7
	CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jOdb8UUUUU=

On Loongson 3C6000 multi-node systems, when the EDAC driver running
on one node accesses the memory controller registers of another node,
the read operation may timeout and return random values. This causes
false CE error reports because the random values in CS0-3 (low 32 bits)
are misinterpreted as valid ECC error counts.

For cross-node accesses, check CS4-7 (high 32 bits) of the ECC
count register. If non-zero, it indicates a timeout/random value,
so skip the report and return the previous count.

Signed-off-by: Wusheng <wusheng@loongson.cn>
Signed-off-by: Wang Jinwei <wangjinwei@loongson.cn>
Signed-off-by: Qunqin Zhao <zhaoqunqin@loongson.cn>
---
 drivers/edac/loongson_edac.c | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/drivers/edac/loongson_edac.c b/drivers/edac/loongson_edac.c
index b458f81dfe..33ca2670d2 100644
--- a/drivers/edac/loongson_edac.c
+++ b/drivers/edac/loongson_edac.c
@@ -27,6 +27,7 @@ struct loongson_edac_pvt {
 	 */
 	int last_ce_count;
 	int mc_per_node;
+	int valid_cs_bits;
 	bool mc_idx_valid;
 };
 
@@ -37,11 +38,21 @@ static int read_ecc(struct mem_ctl_info *mci)
 	int cs;
 
 	ecc = readq(pvt->ecc_base + ECC_CS_COUNT_REG);
-	/* cs0 -- cs3 */
+	/* Discard the read value if any invalid bit is set to 1 */
+	if (ecc >> pvt->valid_cs_bits) {
+		edac_mc_printk(mci, KERN_DEBUG, "ECC read invalid, skip: 0x%llx\n", ecc);
+		return pvt->last_ce_count;
+	}
+
+	/* cs0 -- cs7 */
 	cs = ecc & 0xff;
 	cs += (ecc >> 8) & 0xff;
 	cs += (ecc >> 16) & 0xff;
 	cs += (ecc >> 24) & 0xff;
+	cs += (ecc >> 32) & 0xff;
+	cs += (ecc >> 40) & 0xff;
+	cs += (ecc >> 48) & 0xff;
+	cs += (ecc >> 56) & 0xff;
 
 	return cs;
 }
@@ -114,7 +125,7 @@ static void dimm_config_init(struct mem_ctl_info *mci)
 }
 
 static void pvt_init(struct mem_ctl_info *mci, void __iomem *vbase,
-		bool mc_idx_valid, int mc_per_node)
+		     bool mc_idx_valid, int mc_per_node, int valid_cs_bits)
 {
 	struct loongson_edac_pvt *pvt = mci->pvt_info;
 
@@ -122,6 +133,7 @@ static void pvt_init(struct mem_ctl_info *mci, void __iomem *vbase,
 	pvt->last_ce_count = read_ecc(mci);
 	pvt->mc_idx_valid = mc_idx_valid;
 	pvt->mc_per_node = mc_per_node;
+	pvt->valid_cs_bits = valid_cs_bits;
 }
 
 static int edac_probe(struct platform_device *pdev)
@@ -130,7 +142,7 @@ static int edac_probe(struct platform_device *pdev)
 	struct mem_ctl_info *mci;
 	struct device *dev = &pdev->dev;
 	void __iomem *vbase;
-	u32 mc_per_node;
+	u32 mc_per_node, valid_cs_bits;
 	int ret;
 	bool mc_idx_valid;
 
@@ -170,7 +182,10 @@ static int edac_probe(struct platform_device *pdev)
 	if (device_property_read_u32(dev, "mc-per-node", &mc_per_node))
 		mc_per_node = 4;
 
-	pvt_init(mci, vbase, mc_idx_valid, mc_per_node);
+	if (device_property_read_u32(dev, "valid_cs_bits", &valid_cs_bits))
+		valid_cs_bits = 32;
+
+	pvt_init(mci, vbase, mc_idx_valid, mc_per_node, valid_cs_bits);
 	dimm_config_init(mci);
 
 	ret = edac_mc_add_mc(mci);
-- 
2.47.2

