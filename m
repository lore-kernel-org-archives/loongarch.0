Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A8B1A52
	for <loongarch@lists.linux.dev>; Thu,  8 Jun 2023 02:22:38 +0000 (UTC)
Received: from loongson.cn (unknown [192.168.100.1])
	by gateway (Coremail) with SMTP id _____8CxOupsO4FkGVMAAA--.1158S3;
	Thu, 08 Jun 2023 10:22:36 +0800 (CST)
Received: from lingfengzhe-ms7c94.loongson.cn (unknown [192.168.100.1])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8BxjcpsO4FkLEAGAA--.12263S2;
	Thu, 08 Jun 2023 10:22:36 +0800 (CST)
From: Qi Hu <huqi@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>
Cc: Qing Zhang <zhangqing@loongson.cn>,
	Enze Li <lienze@kylinos.cn>,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Qi Hu <huqi@loongson.cn>,
	Miao HAO <haomiao19@mails.ucas.ac.cn>
Subject: [PATCH] LoongArch: Fix function write_fcsr
Date: Thu,  8 Jun 2023 10:22:33 +0800
Message-Id: <20230608022233.1859773-1-huqi@loongson.cn>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8BxjcpsO4FkLEAGAA--.12263S2
X-CM-SenderInfo: pkxtxqxorr0wxvrqhubq/1tbiAQAPCWSAc4EIFQAlsp
X-Coremail-Antispam: 1Uk129KBj9xXoW7Gw1DJw18uF48uryDXw4DJrc_yoW3XrX_X3
	W3Jw4kur48Jay7Xwn0vF93Jr10g3W8JFnIvF95Zr4xJ3W5Jr13Jw48Xw1DZr4Yk3yv9Fs3
	CFWrt345Aw13KosvyTuYvTs0mTUanT9S1TB71UUUUUJqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUbh8YFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_JrI_Jryl8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwA2z4x0Y4vEx4A2jsIE14v26F4j6r4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Gr1j6F4UJwAaw2AFwI0_Jrv_JF1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0c
	Ia020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0EF7xvrVAajcxG14v26r1j
	6r4UMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv67AKxVWxJVW8Jr1lOx8S6xCaFV
	Cjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCj
	c4AY6r1j6r4UMxCIbckI1I0E14v26r1Y6r17MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxV
	Cjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY
	6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6x
	AIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY
	1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxU2AR6DUUUU

Function "write_fcsr" uses wrong asm dest. Fix it!

Reported-by: Miao HAO <haomiao19@mails.ucas.ac.cn>
Signed-off-by: Qi Hu <huqi@loongson.cn>
---
 arch/loongarch/include/asm/loongarch.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/loongarch/include/asm/loongarch.h b/arch/loongarch/include/asm/loongarch.h
index b3323ab5b78d..60cadb95f611 100644
--- a/arch/loongarch/include/asm/loongarch.h
+++ b/arch/loongarch/include/asm/loongarch.h
@@ -1488,7 +1488,7 @@ __BUILD_CSR_OP(tlbidx)
 	unsigned int __res;	\
 \
 	__asm__ __volatile__(	\
-	"	movfcsr2gr	%0, "__stringify(source)" \n"	\
+	"	movfcsr2gr	"__stringify(source)", %0 \n"	\
 	: "=r" (__res));	\
 	__res;	\
 })
-- 
2.40.1

