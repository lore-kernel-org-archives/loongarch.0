Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F4ED17F4
	for <loongarch@lists.linux.dev>; Thu, 15 Dec 2022 04:02:17 +0000 (UTC)
Received: from loongson.cn (unknown [111.9.175.10])
	by gateway (Coremail) with SMTP id _____8BxnutJnJpj97kFAA--.13436S3;
	Thu, 15 Dec 2022 12:02:17 +0800 (CST)
Received: from localhost.localdomain (unknown [111.9.175.10])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8BxtOVDnJpjVBkAAA--.887S7;
	Thu, 15 Dec 2022 12:02:16 +0800 (CST)
From: Jinyang He <hejinyang@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Qing Zhang <zhangqing@loongson.cn>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH 5/6] LoongArch: Add raw_show_trace to enable guess unwinder default
Date: Thu, 15 Dec 2022 12:01:40 +0800
Message-Id: <20221215040141.18610-6-hejinyang@loongson.cn>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20221215040141.18610-1-hejinyang@loongson.cn>
References: <20221215040141.18610-1-hejinyang@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8BxtOVDnJpjVBkAAA--.887S7
X-CM-SenderInfo: pkhmx0p1dqwqxorr0wxvrqhubq/
X-Coremail-Antispam: 1Uk129KBjvJXoW7AF13WF43Jw4kXF43XFWrKrg_yoW8JF4Dpa
	ykCF9Ygr4fWFW2g347Xr1DuF98JF95Zw13uFZxAw1rCFsxK3W7Jr1Fv34Yva9Yyry8JryI
	qFsYkryj9ayjy3JanT9S1TB71UUUUUJqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
	qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
	b3AYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
	1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
	wVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4
	x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJVWxJr1l
	n4kS14v26r1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6x
	ACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26rWY6Fy7McIj6I8E
	87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82
	IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_Jrv_JF1lx2Iq
	xVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r
	1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Xr0_Ar1lIxAIcVC0I7IYx2IY
	6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67
	AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuY
	vjxUVCD7UUUUU

Inspired by MIPS, add cmdline parameter named 'raw_show_trace' to
enable guess unwinder in prologue unwinder unwind_start() default.
In some cases the guess is more efficient than prologue.

Signed-off-by: Jinyang He <hejinyang@loongson.cn>
---
 arch/loongarch/kernel/unwind_prologue.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/loongarch/kernel/unwind_prologue.c b/arch/loongarch/kernel/unwind_prologue.c
index 9677e13c4b4c..441641227c10 100644
--- a/arch/loongarch/kernel/unwind_prologue.c
+++ b/arch/loongarch/kernel/unwind_prologue.c
@@ -122,11 +122,22 @@ static bool unwind_by_prologue(struct unwind_state *state)
 	return !!__kernel_text_address(state->pc);
 }
 
+static int raw_show_trace;
+static int __init set_raw_show_trace(char *str)
+{
+	raw_show_trace = 1;
+	return 1;
+}
+__setup("raw_show_trace", set_raw_show_trace);
+
 static void start(struct unwind_state *state, struct task_struct *task,
 		    struct pt_regs *regs)
 {
 	state->first = true;
 
+	if (raw_show_trace)
+		unwind_register_unwinder(state, guard_unwinder);
+
 	/*
 	 * The current PC is not kernel text address, we cannot find its
 	 * relative symbol. Thus, prologue analysis will be broken. Luckly,
-- 
2.34.3

