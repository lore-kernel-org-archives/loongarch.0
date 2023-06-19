Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1952023C0
	for <loongarch@lists.linux.dev>; Mon, 19 Jun 2023 07:47:21 +0000 (UTC)
Received: from loongson.cn (unknown [10.180.13.124])
	by gateway (Coremail) with SMTP id _____8Cxd+kHCJBkg8gGAA--.12063S3;
	Mon, 19 Jun 2023 15:47:19 +0800 (CST)
Received: from localhost.localdomain (unknown [10.180.13.124])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8CxXMoECJBkZf8fAA--.15854S4;
	Mon, 19 Jun 2023 15:47:16 +0800 (CST)
From: YingKun Meng <mengyingkun@loongson.cn>
To: broonie@kernel.org,
	lgirdwood@gmail.com
Cc: harshit.m.mogalapalli@oracle.com,
	krzysztof.kozlowski@linaro.org,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	loongarch@lists.linux.dev,
	loongson-kernel@lists.loongnix.cn,
	YingKun Meng <mengyingkun@loongson.cn>
Subject: [PATCH v1] ASoC: loongson: change the type of variable irq to int
Date: Mon, 19 Jun 2023 15:46:49 +0800
Message-Id: <20230619074649.3608726-1-mengyingkun@loongson.cn>
X-Mailer: git-send-email 2.33.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8CxXMoECJBkZf8fAA--.15854S4
X-CM-SenderInfo: 5phqw55lqjy33q6o00pqjv00gofq/1tbiAQAHDGSO9AIDRgAEsX
X-Coremail-Antispam: 1Uk129KBj9xXoWrury5KryDXw1kCrWfKFW7trc_yoWDCrX_Ga
	42qan5uryUJFy7Wa4UWrW8AryaqFyfA3W5CF17tFn7W3W7tr1Sk34kCr15uFy3XrW0vFZx
	Zr48Wr4xZw1FyosvyTuYvTs0mTUanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUb28YFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
	Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE
	14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x
	0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E
	7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcV
	C0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF
	04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7
	CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07j1WlkUUUUU=

We use variable 'irq' to store the return value of fwnode_get_irq_byname().
A negative value indicates that the operation failed. If the type of 'irq'
is unsigned int, we never know if the operation failed.

Reported-by: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
Closes: https://lore.kernel.org/loongarch/325dd825-6fa5-0ebc-4b7e-7acf2d2840e4@loongson.cn/
Signed-off-by: YingKun Meng <mengyingkun@loongson.cn>
---
 sound/soc/loongson/loongson_i2s.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/loongson/loongson_i2s.h b/sound/soc/loongson/loongson_i2s.h
index 52788f6a94ad..89492eebf834 100644
--- a/sound/soc/loongson/loongson_i2s.h
+++ b/sound/soc/loongson/loongson_i2s.h
@@ -45,7 +45,7 @@
 struct loongson_dma_data {
 	dma_addr_t dev_addr;		/* device physical address for DMA */
 	void __iomem *order_addr;	/* DMA order register */
-	u32 irq;			/* DMA irq */
+	int irq;			/* DMA irq */
 };
 
 struct loongson_i2s {
-- 
2.33.0

