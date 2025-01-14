Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF266234D0C
	for <loongarch@lists.linux.dev>; Tue, 14 Jan 2025 13:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736859651; cv=none; b=TjjMqnGBtbNlc/+bTqcM7SGb5pTuHCdaF/sgqjmpCULckT+lnDpt0m4OFaJxo1SPi5kqslASVIdcgyXcYEBZH+743H7IB1o64z/p8mjBzFQcDRSNRusFGN+AFHdl/eWuGw7QWw2w3XzMNgb/ydFEeldr/AlDvP8JkmNNBR9+2WY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736859651; c=relaxed/simple;
	bh=5XQtxZtfh+GUMxrNIRh/5FPe+1/vNIZvE7kIluUM1cU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HMj163xMd+o3DsIvbU3P5p1UszfrMjyotroGBCdchICd/EyXX7XGnMV+OKhhbW124K0BYwtJRuA5RB6FDFtSmINo0NOTVlSphKKnYd4rU8r8JQxP9cMdgbD6kuU9+PTKL+xd+pU/TAXgW4vvNuxpg0wTOWyV0wCgFj8Q4uYmxhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.63])
	by gateway (Coremail) with SMTP id _____8CxieD_X4ZnHjdjAA--.62771S3;
	Tue, 14 Jan 2025 21:00:47 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.68.63])
	by front1 (Coremail) with SMTP id qMiowMAx7+X6X4ZnhBwiAA--.3371S4;
	Tue, 14 Jan 2025 21:00:47 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Yinbo Zhu <zhuyinbo@loongson.cn>
Cc: Huacai Chen <chenhuacai@kernel.org>,
	linux-clk@vger.kernel.org,
	Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	Binbin Zhou <zhoubinbin@loongson.cn>,
	stable@vger.kernel.org,
	"Gustavo A . R . Silva" <gustavoars@kernel.org>
Subject: [PATCH v3 2/2] clk: clk-loongson2: Fix the number count of clk provider
Date: Tue, 14 Jan 2025 21:00:29 +0800
Message-ID: <82e43d89a9a6791129cf8ea14f4eeb666cd87be4.1736856470.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <cover.1736856470.git.zhoubinbin@loongson.cn>
References: <cover.1736856470.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMAx7+X6X4ZnhBwiAA--.3371S4
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoW7AF13ZF43XryUZry5JryfXwc_yoW8Ww1fpF
	W7A34jkrW8ta1rZ3WDJwn2gFyYy34FvFyrCFW7C3WkZrn8W34j9F1rAFy0qay3JF48uF1a
	qFyqkrW8CFW09FXCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkjb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4
	xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jw0_WrylYx0Ex4A2jsIE14v2
	6r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x0EwI
	xGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480
	Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7
	IYx2IY67AKxVW8JVW5JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k2
	6cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxV
	AFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07josjUUUUUU=

Since commit 02fb4f008433 ("clk: clk-loongson2: Fix potential buffer
overflow in flexible-array member access"), the clk provider register is
failed.

The count of `clks_num` is shown below:

	for (p = data; p->name; p++)
		clks_num++;

In fact, `clks_num` represents the number of SoC clocks and should be
expressed as the maximum value of the clock binding id in use (p->id + 1).

Now we fix it to avoid the following error when trying to register a clk
provider:

[ 13.409595] of_clk_hw_onecell_get: invalid index 17

Cc: stable@vger.kernel.org
Cc: Gustavo A. R. Silva <gustavoars@kernel.org>
Fixes: 02fb4f008433 ("clk: clk-loongson2: Fix potential buffer overflow in flexible-array member access")
Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 drivers/clk/clk-loongson2.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/clk-loongson2.c b/drivers/clk/clk-loongson2.c
index 6bf51d5a49a1..27e632edd484 100644
--- a/drivers/clk/clk-loongson2.c
+++ b/drivers/clk/clk-loongson2.c
@@ -294,7 +294,7 @@ static int loongson2_clk_probe(struct platform_device *pdev)
 		return -EINVAL;
 
 	for (p = data; p->name; p++)
-		clks_num++;
+		clks_num = max(clks_num, p->id + 1);
 
 	clp = devm_kzalloc(dev, struct_size(clp, clk_data.hws, clks_num),
 			   GFP_KERNEL);
@@ -309,6 +309,9 @@ static int loongson2_clk_probe(struct platform_device *pdev)
 	clp->clk_data.num = clks_num;
 	clp->dev = dev;
 
+	/* Avoid returning NULL for unused id */
+	memset_p((void **)clp->clk_data.hws, ERR_PTR(-ENOENT), clks_num);
+
 	for (i = 0; i < clks_num; i++) {
 		p = &data[i];
 		switch (p->type) {
-- 
2.43.5

