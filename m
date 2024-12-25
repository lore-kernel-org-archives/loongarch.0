Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BD8013D29A
	for <loongarch@lists.linux.dev>; Wed, 25 Dec 2024 06:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735106780; cv=none; b=t0luEBnnlgmw3MpMYuPkYXfyomlebmPPzdLkfKPVVBLIyz50uFdbLRgs0pcdWLZFNZZ8z7r975M1RCUrJHDoZmckfzKG0p0GI5KtkoH0X2DjVIyJ6p1SiltImL+2fEZEUAAhHRJWAVTq7fenLZ8wkUFQwFN0QwXeWNEcieJGPc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735106780; c=relaxed/simple;
	bh=4U28UYnwj12Gq2+kx1+ZWtNsWRUIugmWnDtIZTB+2W4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LM96gWAq2+16FpSINX6E05PaLIxt1w4dRHBRTaTMMhLn5CLnnJFfVtpwba2f02lBUuf16iqhDxGgz6JQXIZKD33m8NvV/NtvlQEY+/3R2w6skqZWimb4o+Eh4NIfTsCt5O2pIncEBDJoCYZeoeEe6FI31+msN7aFMa0euwo4DhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.63])
	by gateway (Coremail) with SMTP id _____8AxaeDWoGtneUlaAA--.25966S3;
	Wed, 25 Dec 2024 14:06:14 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.68.63])
	by front1 (Coremail) with SMTP id qMiowMBxXcfUoGtnl4MIAA--.45830S2;
	Wed, 25 Dec 2024 14:06:13 +0800 (CST)
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
	stable@vger.kernel.org
Subject: [PATCH] clk: clk-loongson2: Fix the number count of clk provider
Date: Wed, 25 Dec 2024 14:05:59 +0800
Message-ID: <20241225060600.3094154-1-zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.43.5
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMBxXcfUoGtnl4MIAA--.45830S2
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoW7AF13ZF43XryUZry5JryfXwc_yoW8Jw1UpF
	ZxA34UCr48ta1rZF1ktw1IgFy5u34FvFyUCFW7C3WDZrn8W34jgF1rAFW0grW3JF48uF1a
	gFyvk3y8CFy0vFXCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkFb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv
	67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2
	Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s02
	6x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0x
	vE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE
	42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6x
	kF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07j8yCJUUUUU=

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

Fixes: 02fb4f008433 ("clk: clk-loongson2: Fix potential buffer overflow in flexible-array member access")
Cc: stable@vger.kernel.org
Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 drivers/clk/clk-loongson2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/clk-loongson2.c b/drivers/clk/clk-loongson2.c
index 6bf51d5a49a1..b1b2038acd0b 100644
--- a/drivers/clk/clk-loongson2.c
+++ b/drivers/clk/clk-loongson2.c
@@ -294,7 +294,7 @@ static int loongson2_clk_probe(struct platform_device *pdev)
 		return -EINVAL;
 
 	for (p = data; p->name; p++)
-		clks_num++;
+		clks_num = max(clks_num, p->id + 1);
 
 	clp = devm_kzalloc(dev, struct_size(clp, clk_data.hws, clks_num),
 			   GFP_KERNEL);
-- 
2.43.5

