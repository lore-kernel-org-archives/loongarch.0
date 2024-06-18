Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF88016DC28
	for <loongarch@lists.linux.dev>; Tue, 18 Jun 2024 07:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718696590; cv=none; b=KtZh/ZfnpvpzgkRsQwVUKF/ek9NrPJOMY6AA941ejHxUeom3HMwv9odGpw2p3fE3tNriu1HK+pw7ddU6kp6e73B0NsRVVAZ9qQ/mVNm6WSTr7opdrp6WpvkpoLpVUuFBC7K/8LYWPSUwC4McNc0iRy3lYAgGKPSnYPGuYu6QQpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718696590; c=relaxed/simple;
	bh=n10iwKfxRCvi76p1Tj2T6pOSgIaURlmFqBmXQXkUkcA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tgS9LA2TmFy3f/U8kRIdlsZKfAsiv6lAZgaAteax5he4YPqCiXxRYcI9y+1yrCRbddgmVvWHK/gP9z5w6zqdL6wzR8/jY+n5QE2KZcFDjy9Ai8rBBPuJF/Gaf0X93svaQ/F3ypg0q+/ls0pk/q+3MB8ttxxa9ef/hAkMHCW4NtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8Bx3+uJOnFmo9YHAA--.15613S3;
	Tue, 18 Jun 2024 15:43:05 +0800 (CST)
Received: from localhost.localdomain (unknown [113.200.148.30])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8AxTceIOnFmqBMnAA--.29300S3;
	Tue, 18 Jun 2024 15:43:05 +0800 (CST)
From: Hui Li <lihui@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	loongson-kernel@lists.loongnix.cn,
	Jinyang He <hejinyang@loongson.cn>
Subject: [PATCH v3 1/3] LoongArch: ptrace: Fix watchpoint setting error
Date: Tue, 18 Jun 2024 15:43:01 +0800
Message-Id: <20240618074303.17869-2-lihui@loongson.cn>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20240618074303.17869-1-lihui@loongson.cn>
References: <20240618074303.17869-1-lihui@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8AxTceIOnFmqBMnAA--.29300S3
X-CM-SenderInfo: 5olk3xo6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoW3WrWUuw1kGw18Cw4UXFWxZrc_yoW7uF1xpr
	y7ur95trWUGw17Ganxtws8uw45Ga9rurW2vFy5t3yakr98WryfWw1Fkr9rXFWYk348G34F
	va4Fg3Wa9a1UCwbCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkFb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv
	67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2
	Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s02
	6x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0x
	vE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE
	42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6x
	kF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07jUsqXUUUUU=

In the current code, when debugging the following code using gdb,
"invalid argument ..." message will be displayed.

lihui@bogon:~$ cat test.c
  #include <stdio.h>
  int a = 0;
  int main()
  {
	a = 1;
	return 0;
  }
lihui@bogon:~$ gcc -g test.c -o test
lihui@bogon:~$ gdb test
...
(gdb) watch a
Hardware watchpoint 1: a
(gdb) r
...
Invalid argument setting hardware debug registers

It mainly includes the two types of issues.

1. Some incorrect judgment condition existed in user_watch_state
   argument parsing, causing -EINVAL to be returned.

When setting up a watchpoint, gdb uses the ptrace interface,
ptrace(PTRACE_SETREGSET, tid, NT_LOONGARCH_HW_WATCH, (void *) &iov)).
Register values in user_watch_state as follows:

  addr[0] = 0x0, mask[0] = 0x0, ctrl[0] = 0x0
  addr[1] = 0x0, mask[1] = 0x0, ctrl[1] = 0x0
  addr[2] = 0x0, mask[2] = 0x0, ctrl[2] = 0x0
  addr[3] = 0x0, mask[3] = 0x0, ctrl[3] = 0x0
  addr[4] = 0x0, mask[4] = 0x0, ctrl[4] = 0x0
  addr[5] = 0x0, mask[5] = 0x0, ctrl[5] = 0x0
  addr[6] = 0x0, mask[6] = 0x0, ctrl[6] = 0x0
  addr[7] = 0x12000803c, mask[7] = 0x0, ctrl[7] = 0x610

In arch_bp_generic_fields(), return -EINVAL when ctrl.len is
LOONGARCH_BREAKPOINT_LEN_8(0b00). Delete incorrect judgment here.

In ptrace_hbp_fill_attr_ctrl(), when note_type is NT_LOONGARCH_HW_WATCH
and ctrl[0] == 0x0, if ((type & HW_BREAKPOINT_RW) != type) will return
-EINVAL. Here, ctrl.type should be set based on note_type, and unnecessary
judgments can be removed.

2. The watchpoint argument was not set correctly due to unnecessary
   offset and alignment_mask.

Modify ptrace_hbp_fill_attr_ctrl() and hw_breakpoint_arch_parse(). Ensure
the watchpont argument is set correctly.

All changes according to the LoongArch Reference Manual:
https://loongson.github.io/LoongArch-Documentation/LoongArch-Vol1-EN.html#control-and-status-registers-related-to-watchpoints

Signed-off-by: Hui Li <lihui@loongson.cn>
---
 arch/loongarch/include/asm/hw_breakpoint.h |  2 +-
 arch/loongarch/kernel/hw_breakpoint.c      | 20 ++++----------
 arch/loongarch/kernel/ptrace.c             | 32 ++++++++++------------
 3 files changed, 21 insertions(+), 33 deletions(-)

diff --git a/arch/loongarch/include/asm/hw_breakpoint.h b/arch/loongarch/include/asm/hw_breakpoint.h
index 21447fb1efc7..a8ce580f4fc6 100644
--- a/arch/loongarch/include/asm/hw_breakpoint.h
+++ b/arch/loongarch/include/asm/hw_breakpoint.h
@@ -101,7 +101,7 @@ struct perf_event;
 struct perf_event_attr;
 
 extern int arch_bp_generic_fields(struct arch_hw_breakpoint_ctrl ctrl,
-				  int *gen_len, int *gen_type, int *offset);
+				  int *gen_len, int *gen_type);
 extern int arch_check_bp_in_kernelspace(struct arch_hw_breakpoint *hw);
 extern int hw_breakpoint_arch_parse(struct perf_event *bp,
 				    const struct perf_event_attr *attr,
diff --git a/arch/loongarch/kernel/hw_breakpoint.c b/arch/loongarch/kernel/hw_breakpoint.c
index fc55c4de2a11..2d311aff91af 100644
--- a/arch/loongarch/kernel/hw_breakpoint.c
+++ b/arch/loongarch/kernel/hw_breakpoint.c
@@ -283,7 +283,7 @@ int arch_check_bp_in_kernelspace(struct arch_hw_breakpoint *hw)
  * to generic breakpoint descriptions.
  */
 int arch_bp_generic_fields(struct arch_hw_breakpoint_ctrl ctrl,
-			   int *gen_len, int *gen_type, int *offset)
+			   int *gen_len, int *gen_type)
 {
 	/* Type */
 	switch (ctrl.type) {
@@ -303,11 +303,6 @@ int arch_bp_generic_fields(struct arch_hw_breakpoint_ctrl ctrl,
 		return -EINVAL;
 	}
 
-	if (!ctrl.len)
-		return -EINVAL;
-
-	*offset = __ffs(ctrl.len);
-
 	/* Len */
 	switch (ctrl.len) {
 	case LOONGARCH_BREAKPOINT_LEN_1:
@@ -386,22 +381,17 @@ int hw_breakpoint_arch_parse(struct perf_event *bp,
 			     struct arch_hw_breakpoint *hw)
 {
 	int ret;
-	u64 alignment_mask, offset;
+	u64 alignment_mask;
 
 	/* Build the arch_hw_breakpoint. */
 	ret = arch_build_bp_info(bp, attr, hw);
 	if (ret)
 		return ret;
 
-	if (hw->ctrl.type != LOONGARCH_BREAKPOINT_EXECUTE)
-		alignment_mask = 0x7;
-	else
+	if (hw->ctrl.type == LOONGARCH_BREAKPOINT_EXECUTE) {
 		alignment_mask = 0x3;
-	offset = hw->address & alignment_mask;
-
-	hw->address &= ~alignment_mask;
-	hw->ctrl.len <<= offset;
-
+		hw->address &= ~alignment_mask;
+	}
 	return 0;
 }
 
diff --git a/arch/loongarch/kernel/ptrace.c b/arch/loongarch/kernel/ptrace.c
index c114c5ef1332..16b756c6049b 100644
--- a/arch/loongarch/kernel/ptrace.c
+++ b/arch/loongarch/kernel/ptrace.c
@@ -494,28 +494,14 @@ static int ptrace_hbp_fill_attr_ctrl(unsigned int note_type,
 				     struct arch_hw_breakpoint_ctrl ctrl,
 				     struct perf_event_attr *attr)
 {
-	int err, len, type, offset;
+	int err, len, type;
 
-	err = arch_bp_generic_fields(ctrl, &len, &type, &offset);
+	err = arch_bp_generic_fields(ctrl, &len, &type);
 	if (err)
 		return err;
 
-	switch (note_type) {
-	case NT_LOONGARCH_HW_BREAK:
-		if ((type & HW_BREAKPOINT_X) != type)
-			return -EINVAL;
-		break;
-	case NT_LOONGARCH_HW_WATCH:
-		if ((type & HW_BREAKPOINT_RW) != type)
-			return -EINVAL;
-		break;
-	default:
-		return -EINVAL;
-	}
-
 	attr->bp_len	= len;
 	attr->bp_type	= type;
-	attr->bp_addr	+= offset;
 
 	return 0;
 }
@@ -609,7 +595,19 @@ static int ptrace_hbp_set_ctrl(unsigned int note_type,
 		return PTR_ERR(bp);
 
 	attr = bp->attr;
-	decode_ctrl_reg(uctrl, &ctrl);
+
+	switch (note_type) {
+	case NT_LOONGARCH_HW_BREAK:
+		ctrl.type = LOONGARCH_BREAKPOINT_EXECUTE;
+		ctrl.len = LOONGARCH_BREAKPOINT_LEN_4;
+		break;
+	case NT_LOONGARCH_HW_WATCH:
+		decode_ctrl_reg(uctrl, &ctrl);
+		break;
+	default:
+		return -EINVAL;
+	}
+
 	err = ptrace_hbp_fill_attr_ctrl(note_type, ctrl, &attr);
 	if (err)
 		return err;
-- 
2.38.1

