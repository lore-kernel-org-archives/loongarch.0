Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DE7220F981
	for <loongarch@lists.linux.dev>; Tue, 14 Jan 2025 13:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736859652; cv=none; b=OzAhjzlOqqSkiM5/gbWrQB2JSCevhQ3xu9Q+lHVw66hPflmjx8U7X3JB5C9WPlPHkGyI8q9T4XJ7rFKxsBHMWS4BYr1/jeRNdasXU6S2NPE/Q08fyzB3aLRuwBnBVGvD9G+t47RAZyNLEnoIhVZ2UFV6yHeL/9ye5vhATNubQpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736859652; c=relaxed/simple;
	bh=TZbcHTFnuugWaCI/UvMSIRSwvn8uWrQVBEjHxp9ZNDw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KVrIpL0NStomvLkbHS8NEIFE4p/48YHf8J22hrTjHfY+gEO047ggKj9ayf7x5XsdH+eNkN6HOORhHx7530yj680AAKAkdoXyh1TbBhUVnwo7cOsIZEmZjuekP/Xu0BBgA6MGIPji4GUmfWDQ2Ii+9BxmPAHODNOx4CxPBoVUr4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.63])
	by gateway (Coremail) with SMTP id _____8Axjq_+X4ZnFzdjAA--.39650S3;
	Tue, 14 Jan 2025 21:00:46 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.68.63])
	by front1 (Coremail) with SMTP id qMiowMAx7+X6X4ZnhBwiAA--.3371S3;
	Tue, 14 Jan 2025 21:00:45 +0800 (CST)
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
Subject: [PATCH v3 1/2] clk: clk-loongson2: Switch to use devm_clk_hw_register_fixed_rate_parent_data()
Date: Tue, 14 Jan 2025 21:00:28 +0800
Message-ID: <8733a7485619bdb791de25201a3d7984d1849c9f.1736856470.git.zhoubinbin@loongson.cn>
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
X-CM-TRANSID:qMiowMAx7+X6X4ZnhBwiAA--.3371S3
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj9xXoW7Jw1rtrWxKrWftw47Cr13Jrc_yoWkCFXE9a
	yIvr18Gr1DAwna93Wjy3W7ZrWS9ws7ur1xZa4YgFs3J340vFn5GFZ7ZF4jkwnrAa1UWry3
	G3WkWryfuw1kGosvyTuYvTs0mTUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUbzAYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0
	oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc02F4
	0EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUAVWUtwAv7VC2z280aVAFwI0_
	Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw28IcxkI7VAKI4
	8JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xv
	wVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjx
	v20xvE14v26r1I6r4UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20E
	Y4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267
	AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxU2nYFDUUUU

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

