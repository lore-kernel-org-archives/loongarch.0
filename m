Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0424217F3
	for <loongarch@lists.linux.dev>; Thu, 15 Dec 2022 04:02:17 +0000 (UTC)
Received: from loongson.cn (unknown [111.9.175.10])
	by gateway (Coremail) with SMTP id _____8AxjutHnJpj67kFAA--.13301S3;
	Thu, 15 Dec 2022 12:02:15 +0800 (CST)
Received: from localhost.localdomain (unknown [111.9.175.10])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8BxtOVDnJpjVBkAAA--.887S5;
	Thu, 15 Dec 2022 12:02:15 +0800 (CST)
From: Jinyang He <hejinyang@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Qing Zhang <zhangqing@loongson.cn>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH 3/6] LoongArch: Adjust PC value when unwind next frame in prologue unwinder
Date: Thu, 15 Dec 2022 12:01:38 +0800
Message-Id: <20221215040141.18610-4-hejinyang@loongson.cn>
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
X-CM-TRANSID:AQAAf8BxtOVDnJpjVBkAAA--.887S5
X-CM-SenderInfo: pkhmx0p1dqwqxorr0wxvrqhubq/
X-Coremail-Antispam: 1Uk129KBjvJXoW7ZryUAFyftFyrGr4kGrykZrb_yoW8JFy8p3
	93AFZ5Gr4jqr13G39rtr4Dur95CrykGr42gFWDtry8u3Z0qFn7urnI9ryqvanYq34kJr10
	qw1Fg3ya9F4UJwUanT9S1TB71UUUUUJqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
	qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
	b3AYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
	1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
	wVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4
	x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJVWxJr1l
	n4kS14v26r1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6x
	ACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q6rW5McIj6I8E
	87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82
	IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_Jrv_JF1lx2Iq
	xVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r
	1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Xr0_Ar1lIxAIcVC0I7IYx2IY
	6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67
	AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuY
	vjxU4AhLUUUUU

When state->first is not set, the PC is a return address in the
previous frame. We need to adjust it value in case overflow to the
next symbol.

Signed-off-by: Jinyang He <hejinyang@loongson.cn>
---
 arch/loongarch/kernel/unwind_prologue.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/loongarch/kernel/unwind_prologue.c b/arch/loongarch/kernel/unwind_prologue.c
index 35cab7f77c6b..d464c533c64f 100644
--- a/arch/loongarch/kernel/unwind_prologue.c
+++ b/arch/loongarch/kernel/unwind_prologue.c
@@ -48,7 +48,7 @@ static bool unwind_by_prologue(struct unwind_state *state)
 {
 	long frame_ra = -1;
 	unsigned long frame_size = 0;
-	unsigned long size, offset, pc = state->pc;
+	unsigned long size, offset, pc;
 	struct pt_regs *regs;
 	struct stack_info *info = &state->stack_info;
 	union loongarch_instruction *ip, *ip_end;
@@ -70,6 +70,10 @@ static bool unwind_by_prologue(struct unwind_state *state)
 		return true;
 	}
 
+	/* When first is not set, the PC is a return address in the previous frame.
+	 * We need to adjust it value in case overflow to the next symbol.
+	 */
+	pc = state->pc - (state->first ? 0 : LOONGARCH_INSN_SIZE);
 	if (!kallsyms_lookup_size_offset(pc, &size, &offset))
 		return false;
 
-- 
2.34.3

