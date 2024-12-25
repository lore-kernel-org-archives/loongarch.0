Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE83F25634
	for <loongarch@lists.linux.dev>; Wed, 25 Dec 2024 06:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735106779; cv=none; b=gSwaxni4SMYqUJGHWx08zVbz3KU+qtAgI6PYenY6zpjCmcjzJe5BBZnPYPEPuIF2ngAD9jnevB9vVBavrIEAxyY3NN2dBYTIGyiLoNMoxGV54avMG6BajzMK+eTamkRqRCzECQSdFt7mnYhdAs32g+4CE4uRmhiakZl2uxkf7OU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735106779; c=relaxed/simple;
	bh=TZbcHTFnuugWaCI/UvMSIRSwvn8uWrQVBEjHxp9ZNDw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RTLCGZT+Kge4bZYkZ9orV2Pzy19xVe22VubvDm/DsQFB8dHWfjUoFVuEkStxIkwvyhr4A6RDJYo71VZHqrjY4Nec5irX6yZm12GFir5pxoXHIi7qtXu/lUL4yoGd4IyNvXYyTgs2SbTwd9Dh6aE0bAd1cRW9d2ht9saYN+89ELE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.63])
	by gateway (Coremail) with SMTP id _____8CxMK_WoGtnf0laAA--.22405S3;
	Wed, 25 Dec 2024 14:06:14 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.68.63])
	by front1 (Coremail) with SMTP id qMiowMBxXcfUoGtnl4MIAA--.45830S3;
	Wed, 25 Dec 2024 14:06:14 +0800 (CST)
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
	Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH] clk: clk-loongson2: Switch to use devm_clk_hw_register_fixed_rate_parent_data()
Date: Wed, 25 Dec 2024 14:06:00 +0800
Message-ID: <20241225060600.3094154-2-zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20241225060600.3094154-1-zhoubinbin@loongson.cn>
References: <20241225060600.3094154-1-zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMBxXcfUoGtnl4MIAA--.45830S3
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj9xXoW7Jw1rtrWxKrWftw47Cr13Jrc_yoWkCFXE9a
	yIvr18Gr1DAwna93Wjy3W7ZrWS9ws7ur1xZa4YgFs3J340vFn5GFZ7ZF4jkwnrAa1UWry3
	G3WkWryfuw1kGosvyTuYvTs0mTUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUb7AYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	WUJVW8JwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
	Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ex4A2jsIE
	14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x
	0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E
	7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcV
	C0I7IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF
	04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7
	CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU82g43UUUUU==

Since commit 706ae6446494 ("clk: fixed-rate: add
devm_clk_hw_register_fixed_rate_parent_data()"), we can use the
devm_clk_hw_register_fixed_rate_parent_data() helper and from then on
there is no need to manually unregister the fixed rate hw.

Since clk_hw_unregister_fixed_rate() was not called before, we also fix
the memory leak that was present.

Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 drivers/clk/clk-loongson2.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/clk-loongson2.c b/drivers/clk/clk-loongson2.c
index 7082b4309c6f..6bf51d5a49a1 100644
--- a/drivers/clk/clk-loongson2.c
+++ b/drivers/clk/clk-loongson2.c
@@ -335,8 +335,8 @@ static int loongson2_clk_probe(struct platform_device *pdev)
 						       &clp->clk_lock);
 			break;
 		case CLK_TYPE_FIXED:
-			hw = clk_hw_register_fixed_rate_parent_data(dev, p->name, pdata,
-								    0, p->fixed_rate);
+			hw = devm_clk_hw_register_fixed_rate_parent_data(dev, p->name, pdata,
+									 0, p->fixed_rate);
 			break;
 		default:
 			return dev_err_probe(dev, -EINVAL, "Invalid clk type\n");
-- 
2.43.5

