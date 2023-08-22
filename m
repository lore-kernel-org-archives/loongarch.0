Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACDFE8C10
	for <loongarch@lists.linux.dev>; Tue, 22 Aug 2023 08:54:02 +0000 (UTC)
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8Cx7+uod+RkP9waAA--.53752S3;
	Tue, 22 Aug 2023 16:54:00 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8CxvM6ld+RkwS5gAA--.37979S4;
	Tue, 22 Aug 2023 16:54:00 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	loongson-kernel@lists.loongnix.cn
Subject: [PATCH v4 2/3] LoongArch: Return earlier in die() if notify_die() returns NOTIFY_STOP
Date: Tue, 22 Aug 2023 16:53:56 +0800
Message-Id: <1692694437-27077-3-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1692694437-27077-1-git-send-email-yangtiezhu@loongson.cn>
References: <1692694437-27077-1-git-send-email-yangtiezhu@loongson.cn>
X-CM-TRANSID:AQAAf8CxvM6ld+RkwS5gAA--.37979S4
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj9xXoWrKrWrur1xZF43CryfGF4rZwc_yoWDXrc_Gr
	yIkw1DurW8Cw15Xw1UCayrWFyqgayjvF1ak3Z2krZ7CF98JrW5Gw4rX3WYkrWqqrZ5uwsx
	Z3ykJ3yv9Fy2kosvyTuYvTs0mTUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUb7AYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_JrI_Jryl8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
	Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jw0_WrylYx0Ex4A2jsIE
	14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x
	0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E
	7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcV
	C0I7IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF
	04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7
	CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8QJ57UUUUU==
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>

After the call to oops_exit(), it should not panic or execute
the crash kernel if the oops is to be suppressed.

Suggested-by: Maciej W. Rozycki <macro@orcam.me.uk>
Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 arch/loongarch/kernel/traps.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/loongarch/kernel/traps.c b/arch/loongarch/kernel/traps.c
index bbdfc5b..7d0ddd2 100644
--- a/arch/loongarch/kernel/traps.c
+++ b/arch/loongarch/kernel/traps.c
@@ -404,6 +404,9 @@ void die(const char *str, struct pt_regs *regs)
 
 	oops_exit();
 
+	if (ret == NOTIFY_STOP)
+		return;
+
 	if (regs && kexec_should_crash(current))
 		crash_kexec(regs);
 
@@ -413,8 +416,7 @@ void die(const char *str, struct pt_regs *regs)
 	if (panic_on_oops)
 		panic("Fatal exception");
 
-	if (ret != NOTIFY_STOP)
-		make_task_dead(SIGSEGV);
+	make_task_dead(SIGSEGV);
 }
 
 static inline void setup_vint_size(unsigned int size)
-- 
2.1.0

