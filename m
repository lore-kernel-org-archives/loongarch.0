Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5F1F2D05E
	for <loongarch@lists.linux.dev>; Thu, 26 Oct 2023 11:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from loongson.cn (unknown [111.9.175.10])
	by gateway (Coremail) with SMTP id _____8DxVug_UTpl9c40AA--.2294S3;
	Thu, 26 Oct 2023 19:45:03 +0800 (CST)
Received: from localhost.localdomain (unknown [111.9.175.10])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Dx3t47UTpl7bMzAA--.4952S3;
	Thu, 26 Oct 2023 19:45:03 +0800 (CST)
From: Huang Pei <huangpei@loongson.cn>
To: Huacai Chen <chenhuacai@loongson.cn>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] LoongArch: Add RSEQ_SIG break code definition
Date: Thu, 26 Oct 2023 19:44:46 +0800
Message-Id: <20231026114446.5932-2-huangpei@loongson.cn>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20231026114446.5932-1-huangpei@loongson.cn>
References: <20231026114446.5932-1-huangpei@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8Dx3t47UTpl7bMzAA--.4952S3
X-CM-SenderInfo: xkxd0whshlqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj9xXoWrWF18Gw17ZrWDAw1UAF1kJFc_yoWxGFX_Jw
	13Jw48CrWxWFWxJ3Wqv3sxJr1jgw48Krn0vF9Iqr1UuF98tr43Jws7JasrZr1qk3yDur4r
	ZFyFvrWY9w1YkosvyTuYvTs0mTUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUb7AYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
	Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE
	14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x
	0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E
	7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcV
	C0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF
	04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7
	CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8zwZ7UUUUU==

Signed-off-by: Huang Pei <huangpei@loongson.cn>
---
 arch/loongarch/include/uapi/asm/break.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/loongarch/include/uapi/asm/break.h b/arch/loongarch/include/uapi/asm/break.h
index bb9b82ba59f2..e0fcfc304834 100644
--- a/arch/loongarch/include/uapi/asm/break.h
+++ b/arch/loongarch/include/uapi/asm/break.h
@@ -20,4 +20,6 @@
 #define BRK_UPROBE_BP		12	/* See <asm/uprobes.h> */
 #define BRK_UPROBE_XOLBP	13	/* See <asm/uprobes.h> */
 
+#define BRK_RSEQ_SIG		16	/* See rseq */
+
 #endif /* __UAPI_ASM_BREAK_H */
-- 
2.20.1

