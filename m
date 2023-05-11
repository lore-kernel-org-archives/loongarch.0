Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58D701B911
	for <loongarch@lists.linux.dev>; Thu, 11 May 2023 08:06:24 +0000 (UTC)
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8CxlfD_oVxkTa0HAA--.13046S3;
	Thu, 11 May 2023 16:06:23 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Cxqjr5oVxk7XNVAA--.21787S7;
	Thu, 11 May 2023 16:06:21 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	loongson-kernel@lists.loongnix.cn
Subject: [PATCH v4 5/6] LoongArch: Check atomic instructions in insns_not_supported()
Date: Thu, 11 May 2023 16:06:11 +0800
Message-Id: <1683792372-29338-6-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1683792372-29338-1-git-send-email-yangtiezhu@loongson.cn>
References: <1683792372-29338-1-git-send-email-yangtiezhu@loongson.cn>
X-CM-TRANSID:AQAAf8Cxqjr5oVxk7XNVAA--.21787S7
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBjvJXoWxWw45Zw4xZF1rXF4fZr4xWFg_yoWrZw1kpF
	ZrZr95Gr48W3Z3Gr9rt3Z3ur4Utw4v9398XF13Z34xC3y7Xr15Jr1xKry7XFn8t395Kr4F
	qrW7JrZIva13JaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
	qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
	b28YFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
	1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
	wVC0I7IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4
	x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJVWxJr1l
	e2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4xG64xvF2
	IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jw0_WrylYx0Ex4A2jsIE14v26r4j6F4U
	McvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x0EwIxGrwCFx2
	IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v2
	6r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67
	AKxVW5JVW7JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IY
	s7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr
	0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07j8CztUUUUU=
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>

Like llsc instructions, the atomic memory access instructions should
not be supported for probing, check them in insns_not_supported().

Here is a simple example with CONFIG_UPROBE_EVENTS=y:

  # cat pthread.c
  #include <stdio.h>
  #include <stdlib.h>
  #include <pthread.h>

  static pthread_spinlock_t lock;
  static pthread_t t1, t2;
  static int count = 0;

  void *t1_start(void *arg)
  {
  	  for (int i = 0; i < 10000; i++)
	  {
		  pthread_spin_lock(&lock);
		  count++;
		  pthread_spin_unlock(&lock);
	  }
  }

  void *t2_start(void *arg)
  {
	  for (int i = 0; i < 20000; i++)
	  {
		  pthread_spin_lock(&lock);
		  count++;
		  pthread_spin_unlock(&lock);
	  }
  }

  int main()
  {
	  int ret;

	  ret = pthread_spin_init(&lock, PTHREAD_PROCESS_PRIVATE);
	  if (ret)
		  return -1;

	  ret = pthread_create(&t1, NULL, t1_start, NULL);
	  if (ret)
		  exit(1);

	  ret = pthread_create(&t2, NULL, t2_start, NULL);
	  if (ret)
		  exit(1);

	  pthread_join(t1, NULL);
	  pthread_join(t2, NULL);
	  pthread_spin_destroy(&lock);

	  printf("%d\n", count);
	  return 0;
  }
  # gcc pthread.c -o /tmp/pthread
  # objdump -d /lib64/libc.so.6 | grep -w "pthread_spin_lock" -A 5 | head -5
  00000000000886a4 <pthread_spin_lock@@GLIBC_2.36>:
     886a4:	  0280040d 	  addi.w      	  $t1, $zero, 1(0x1)
     886a8:	  3869348c 	  amswap_db.w 	  $t0, $t1, $a0
     886ac:	  0040818c 	  slli.w      	  $t0, $t0, 0x0
     886b0:	  44003180 	  bnez        	  $t0, 48(0x30)	  # 886e0 <pthread_spin_lock@@GLIBC_2.36+0x3c>
  # cd /sys/kernel/debug/tracing
  # echo > uprobe_events
  # echo "p:myuprobe /lib64/libc.so.6:0x886a4" > uprobe_events

Without this patch:

  # echo 1 > events/uprobes/enable
  # echo 1 > tracing_on
  # /tmp/pthread
  Trace/breakpoint trap (core dumped)

With this patch:

  # echo 1 > events/uprobes/enable
  bash: echo: write error: Invalid argument

Reported-by: Hengqi Chen <hengqi.chen@gmail.com>
Closes: https://lore.kernel.org/all/SY4P282MB351877A70A0333C790FE85A5C09C9@SY4P282MB3518.AUSP282.PROD.OUTLOOK.COM/
Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 arch/loongarch/include/asm/inst.h | 26 ++++++++++++++++++++++++++
 arch/loongarch/kernel/inst.c      |  6 ++++++
 arch/loongarch/kernel/uprobes.c   |  9 +++++----
 3 files changed, 37 insertions(+), 4 deletions(-)

diff --git a/arch/loongarch/include/asm/inst.h b/arch/loongarch/include/asm/inst.h
index 01fb789..ea625c4 100644
--- a/arch/loongarch/include/asm/inst.h
+++ b/arch/loongarch/include/asm/inst.h
@@ -178,6 +178,32 @@ enum reg3_op {
 	amord_op	= 0x70c7,
 	amxorw_op	= 0x70c8,
 	amxord_op	= 0x70c9,
+	ammaxw_op	= 0x70ca,
+	ammaxd_op	= 0x70cb,
+	amminw_op	= 0x70cc,
+	ammind_op	= 0x70cd,
+	ammaxwu_op	= 0x70ce,
+	ammaxdu_op	= 0x70cf,
+	amminwu_op	= 0x70d0,
+	ammindu_op	= 0x70d1,
+	amswapdbw_op	= 0x70d2,
+	amswapdbd_op	= 0x70d3,
+	amadddbw_op	= 0x70d4,
+	amadddbd_op	= 0x70d5,
+	amanddbw_op	= 0x70d6,
+	amanddbd_op	= 0x70d7,
+	amordbw_op	= 0x70d8,
+	amordbd_op	= 0x70d9,
+	amxordbw_op	= 0x70da,
+	amxordbd_op	= 0x70db,
+	ammaxdbw_op	= 0x70dc,
+	ammaxdbd_op	= 0x70dd,
+	ammindbw_op	= 0x70de,
+	ammindbd_op	= 0x70df,
+	ammaxdbwu_op	= 0x70e0,
+	ammaxdbdu_op	= 0x70e1,
+	ammindbwu_op	= 0x70e2,
+	ammindbdu_op	= 0x70e3,
 	fldgts_op	= 0x70e8,
 	fldgtd_op	= 0x70e9,
 	fldles_op	= 0x70ea,
diff --git a/arch/loongarch/kernel/inst.c b/arch/loongarch/kernel/inst.c
index 1d7d579..ce25a63 100644
--- a/arch/loongarch/kernel/inst.c
+++ b/arch/loongarch/kernel/inst.c
@@ -135,6 +135,12 @@ void simu_branch(struct pt_regs *regs, union loongarch_instruction insn)
 
 bool insns_not_supported(union loongarch_instruction insn)
 {
+	switch (insn.reg3_format.opcode) {
+	case amswapw_op ... ammindbdu_op:
+		pr_notice("atomic memory access instructions are not supported\n");
+		return true;
+	}
+
 	switch (insn.reg2i14_format.opcode) {
 	case llw_op:
 	case lld_op:
diff --git a/arch/loongarch/kernel/uprobes.c b/arch/loongarch/kernel/uprobes.c
index f966b66..cab29e1 100644
--- a/arch/loongarch/kernel/uprobes.c
+++ b/arch/loongarch/kernel/uprobes.c
@@ -15,10 +15,11 @@ int arch_uprobe_analyze_insn(struct arch_uprobe *auprobe,
 	if (addr & 0x3)
 		return -EILSEQ;
 
-	insn.word = auprobe->insn[0];
-
-	if (insns_not_supported(insn))
-		return -EINVAL;
+	for (int idx = ARRAY_SIZE(auprobe->insn) - 1; idx >= 0; idx--) {
+		insn.word = auprobe->insn[idx];
+		if (insns_not_supported(insn))
+			return -EINVAL;
+	}
 
 	if (insns_need_simulation(insn)) {
 		auprobe->ixol[0] = larch_insn_gen_nop();
-- 
2.1.0

