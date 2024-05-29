Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3628B7F6
	for <loongarch@lists.linux.dev>; Wed, 29 May 2024 01:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716946236; cv=none; b=NJC+oWBEoVG8tKU7gTOtCzOL9Y+NUIP3F7QyxMtMCbZu6cE+2hUV5RqPQ05aSs0ASdZvpsfXBteUK6QL/TiwAFrFDx3OYZlfZQNV04aCeGjxxvFBBeSnptRoVGOCyxN2b4AVSaqoHp8yuZuGMlSnnh3F1RGj46chs48NftM9m98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716946236; c=relaxed/simple;
	bh=EBfIrHQBl+f6Y0bzQ8K2OySP32cdyvA/VP0mFuVPF38=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rJKvXu+NxJhuUZ7N2wqK2VmXHf9k/+sqSwD/GKpZmLStpksLQDxr87oR9eMINu5QcTjRt0OMN8vUlufO9G8ZkdLSdKN6HxN5WN/htZ1X2178Sf/eBqU/z2F2s/FWDTxdiYlOQtaayZSn7Xycn5pAtbX7eh80eslpLnnTOmC9HjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8Cxe+oyhVZmT+0AAA--.3858S3;
	Wed, 29 May 2024 09:30:26 +0800 (CST)
Received: from localhost.localdomain (unknown [113.200.148.30])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8DxusYrhVZm5nEMAA--.32890S3;
	Wed, 29 May 2024 09:30:25 +0800 (CST)
From: Hui Li <lihui@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	loongson-kernel@lists.loongnix.cn
Subject: [PATCH 1/3] LoongArch: ptrace: Fix watchpoint setting error
Date: Wed, 29 May 2024 09:30:17 +0800
Message-Id: <20240529013019.15235-2-lihui@loongson.cn>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20240529013019.15235-1-lihui@loongson.cn>
References: <20240529013019.15235-1-lihui@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8DxusYrhVZm5nEMAA--.32890S3
X-CM-SenderInfo: 5olk3xo6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoW3WrWUuw1UAr4kKr1kJF47Awc_yoW7WF4kpr
	47Zryktr4DGr17Wanxtws8uw45G39rWrW2qa4Yq34YyrW5WrW3Wr1Fkr9FqFWYk348G34F
	vryFg3WagF1UZ3XCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ36c02F40EFcxC0VAKzVAqx4xG6I80ewCIccxYrVCFb4Uv73VFW2AGmfu7
	bjvjm3AaLaJ3UjIYCTnIWjp_UUUYO7kC6x804xWl14x267AKxVWUJVW8JwAFc2x0x2IEx4
	CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AKwVWUAVWUZwA2ocxC64kIII0Yj41l84x0
	c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2
	IY6xkF7I0E14v26r4j6F4UM28EF7xvwVC2z280aVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv
	6xkF7I0E14v26r4j6r4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8V
	C2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUAVWUtwAv
	7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMx
	AIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_
	Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUXVWUAwCIccxYrVCFb4
	1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7Cj
	xVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r
	1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU5_C
	zJUUUUU==

In the current code, when debugging the following code using gdb,
"invalid argument ..." message will be displayed.

lihui@bogon:~$ cat test.c
  #include <stdio.h>
  int a = 0;
  int main()
  {
    printf("start test\n");
    a = 1;
    printf("a = %d\n", a);
    printf("end test\n");
    return 0;
  }
lihui@bogon:~$ gcc -g test.c -o test
lihui@bogon:~$ gdb test
...
(gdb) start
...
Temporary breakpoint 1, main () at test.c:5
5        printf("start test\n");
(gdb) watch a
Hardware watchpoint 2: a
(gdb) c
Continuing.
Invalid argument setting hardware debug registers

The root cause is that the existing kernel ptrace interface
has some issues on watchpoint argument parsing and setting.
It mainly includes the two types of issues.

1. Some incorrect judgment condition existed in ptrace watchpoints
   argument parsing, causing -EINVAL to be returned.

2. The watchpoint argument was not set correctly due to unnecessary
   addr offset.

Modify the relevant code to solve the above problem. Ensure the watchpont
argument is set correctly.

All changes according to the LoongArch Reference Manual:
https://loongson.github.io/LoongArch-Documentation/LoongArch-Vol1-EN.html#control-and-status-registers-related-to-watchpoints

with this patch:

lihui@bogon:~$ gdb test
...
(gdb) start
...
Temporary breakpoint 1, main () at test.c:5
5        printf("start test\n");
(gdb) watch a
Hardware watchpoint 2: a
(gdb) c
Continuing.
start test
a = 1
...

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

