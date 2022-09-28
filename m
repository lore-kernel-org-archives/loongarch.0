Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D660F7FF
	for <loongarch@lists.linux.dev>; Wed, 28 Sep 2022 00:50:13 +0000 (UTC)
Received: from linux.localdomain (unknown [113.200.148.30])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8DxvmtBmjNjVwIjAA--.53900S6;
	Wed, 28 Sep 2022 08:50:12 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>,
	Masami Hiramatsu <mhiramat@kernel.org>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/5] samples/kprobes: Add LoongArch support
Date: Wed, 28 Sep 2022 08:50:08 +0800
Message-Id: <1664326209-13995-5-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1664326209-13995-1-git-send-email-yangtiezhu@loongson.cn>
References: <1664326209-13995-1-git-send-email-yangtiezhu@loongson.cn>
X-CM-TRANSID:AQAAf8DxvmtBmjNjVwIjAA--.53900S6
X-Coremail-Antispam: 1UD129KBjvJXoWrZw4rWrW5CF1fJw1xZFWDJwb_yoW8JF1fpF
	n0y3W5t3yFyw13WFW3Jayvgry0yryjkay8u3ykC34Yya429ry5AF1rKayjyw4kur90qF43
	tr1FvryUGF1xZrJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUBab7Iv0xC_Cr1lb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI
	8067AKxVWUAVCq3wA2048vs2IY020Ec7CjxVAFwI0_Gr0_Xr1l8cAvFVAK0II2c7xJM28C
	jxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI
	8IcVCY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E
	87Iv6xkF7I0E14v26r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2
	IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4U
	McvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCY02Avz4vE14v_twCF04k20x
	vY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I
	3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIx
	AIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAI
	cVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2js
	IEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07j-qXdUUUUU=
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>

Add LoongArch specific info in handler_pre() and handler_post().

Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 samples/kprobes/kprobe_example.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/samples/kprobes/kprobe_example.c b/samples/kprobes/kprobe_example.c
index fd346f5..ef44c61 100644
--- a/samples/kprobes/kprobe_example.c
+++ b/samples/kprobes/kprobe_example.c
@@ -55,6 +55,10 @@ static int __kprobes handler_pre(struct kprobe *p, struct pt_regs *regs)
 	pr_info("<%s> p->addr, 0x%p, ip = 0x%lx, flags = 0x%lx\n",
 		p->symbol_name, p->addr, regs->psw.addr, regs->flags);
 #endif
+#ifdef CONFIG_LOONGARCH
+	pr_info("<%s> p->addr = 0x%p, era = 0x%lx, estat = 0x%lx\n",
+		p->symbol_name, p->addr, regs->csr_era, regs->csr_estat);
+#endif
 
 	/* A dump_stack() here will give a stack backtrace */
 	return 0;
@@ -92,6 +96,10 @@ static void __kprobes handler_post(struct kprobe *p, struct pt_regs *regs,
 	pr_info("<%s> p->addr, 0x%p, flags = 0x%lx\n",
 		p->symbol_name, p->addr, regs->flags);
 #endif
+#ifdef CONFIG_LOONGARCH
+	pr_info("<%s> p->addr = 0x%p, estat = 0x%lx\n",
+		p->symbol_name, p->addr, regs->csr_estat);
+#endif
 }
 
 static int __init kprobe_init(void)
-- 
2.1.0

