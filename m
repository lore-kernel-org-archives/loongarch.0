Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4115C17A58F
	for <loongarch@lists.linux.dev>; Tue, 21 Jan 2025 07:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737443261; cv=none; b=mRHdtVSJ4SO7JX85HkfAU46UVqnhwA/ljbx8GEE8lK7NidQU+GqRL7yFrZTyHKx3+5uSXFLi/zKN/izbOchARg2y6oQ0OCnbIm5t8UqOiSJ5ZUfD+MMyYTLsZRpKKtf2+c114iJdGFsh1rjCOPgxVIAu8LYUME/R1HOxX/jGMuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737443261; c=relaxed/simple;
	bh=huSeITqo7Cu+eAJtFTFBm7C6wz91s4RH7X6s9wJOI40=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=enAMLD/doBP0nLL3rBAF8cMpm/bKBRZQjJnJ4Pp/UoiE7psoZULlThW9qT4Img5ZhpMenVyfkFFzjoDhotAUSLtKnCBwidn02iJJwi6zg7nx1YlOIS5cUqKGoUBKTUSST0VQiOU5BI10CUD0LMODXLfeoG7QZQxburR4JibPQ2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8DxWOFtR49nRqlmAA--.8333S3;
	Tue, 21 Jan 2025 15:06:21 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowMCxYMZqR49nzawpAA--.24913S4;
	Tue, 21 Jan 2025 15:06:21 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] LoongArch: Extend the maximum number of watchpoints
Date: Tue, 21 Jan 2025 15:06:17 +0800
Message-ID: <20250121070617.3214-3-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20250121070617.3214-1-yangtiezhu@loongson.cn>
References: <20250121070617.3214-1-yangtiezhu@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMCxYMZqR49nzawpAA--.24913S4
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoWxCr4kZF48trWfJr17tF45XFc_yoW5AF1DpF
	ZrCasrGa1UJF47Wr1aqw4kursrWrn7CryIga4Ik34SkFn3Xw1ruFy0kr98ZFWfC3y8G34f
	X3W09ryYqFWDAwcCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ36c02F40EFcxC0VAKzVAqx4xG6I80ewCIccxYrVCFb4Uv73VFW2AGmfu7
	bjvjm3AaLaJ3UjIYCTnIWjp_UUUYo7kC6x804xWl14x267AKxVWUJVW8JwAFc2x0x2IEx4
	CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AKwVWUAVWUZwA2ocxC64kIII0Yj41l84x0
	c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2
	IY6xkF7I0E14v26r4j6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280
	aVCY1x0267AKxVWxJr0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa02
	0Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JF0_Jw1l
	Yx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrw
	CF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j
	6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jrv_JF1lIxkvb40E47
	kJMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF
	7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxV
	WUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07bz
	F4_UUUUU=

The maximum number of load/store watchpoints and fetch instruction
watchpoints is 14 each according to LoongArch Reference Manual, so
extend the maximum number of watchpoints from 8 to 14 for ptrace.

By the way, just simply change 8 to 14 for the definition in struct
user_watch_state at the beginning, but it may corrupt uapi, then add
a new struct user_watch_state_v2 directly.

As far as I can tell, the only users for this struct in the userspace
are GDB and LLDB, there are no any problems of software compatibility
between the application and kernel according to the analysis.

Link: https://loongson.github.io/LoongArch-Documentation/LoongArch-Vol1-EN.html#control-and-status-registers-related-to-watchpoints
Fixes: 1a69f7a161a7 ("LoongArch: ptrace: Expose hardware breakpoints to debuggers")
Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 arch/loongarch/include/uapi/asm/ptrace.h | 10 ++++++++++
 arch/loongarch/kernel/ptrace.c           |  6 +++---
 2 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/arch/loongarch/include/uapi/asm/ptrace.h b/arch/loongarch/include/uapi/asm/ptrace.h
index ac915f841650..aafb3cd9e943 100644
--- a/arch/loongarch/include/uapi/asm/ptrace.h
+++ b/arch/loongarch/include/uapi/asm/ptrace.h
@@ -72,6 +72,16 @@ struct user_watch_state {
 	} dbg_regs[8];
 };
 
+struct user_watch_state_v2 {
+	uint64_t dbg_info;
+	struct {
+		uint64_t    addr;
+		uint64_t    mask;
+		uint32_t    ctrl;
+		uint32_t    pad;
+	} dbg_regs[14];
+};
+
 #define PTRACE_SYSEMU			0x1f
 #define PTRACE_SYSEMU_SINGLESTEP	0x20
 
diff --git a/arch/loongarch/kernel/ptrace.c b/arch/loongarch/kernel/ptrace.c
index 19dc6eff45cc..5e2402cfcab0 100644
--- a/arch/loongarch/kernel/ptrace.c
+++ b/arch/loongarch/kernel/ptrace.c
@@ -720,7 +720,7 @@ static int hw_break_set(struct task_struct *target,
 	unsigned int note_type = regset->core_note_type;
 
 	/* Resource info */
-	offset = offsetof(struct user_watch_state, dbg_regs);
+	offset = offsetof(struct user_watch_state_v2, dbg_regs);
 	user_regset_copyin_ignore(&pos, &count, &kbuf, &ubuf, 0, offset);
 
 	/* (address, mask, ctrl) registers */
@@ -920,7 +920,7 @@ static const struct user_regset loongarch64_regsets[] = {
 #ifdef CONFIG_HAVE_HW_BREAKPOINT
 	[REGSET_HW_BREAK] = {
 		.core_note_type = NT_LOONGARCH_HW_BREAK,
-		.n = sizeof(struct user_watch_state) / sizeof(u32),
+		.n = sizeof(struct user_watch_state_v2) / sizeof(u32),
 		.size = sizeof(u32),
 		.align = sizeof(u32),
 		.regset_get = hw_break_get,
@@ -928,7 +928,7 @@ static const struct user_regset loongarch64_regsets[] = {
 	},
 	[REGSET_HW_WATCH] = {
 		.core_note_type = NT_LOONGARCH_HW_WATCH,
-		.n = sizeof(struct user_watch_state) / sizeof(u32),
+		.n = sizeof(struct user_watch_state_v2) / sizeof(u32),
 		.size = sizeof(u32),
 		.align = sizeof(u32),
 		.regset_get = hw_break_get,
-- 
2.42.0

