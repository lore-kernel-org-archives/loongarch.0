Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F4675247
	for <loongarch@lists.linux.dev>; Mon,  5 Jun 2023 06:39:15 +0000 (UTC)
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8CxT_ASg31kAQYAAA--.170S3;
	Mon, 05 Jun 2023 14:39:14 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Axa9YPg31kHQcAAA--.72S7;
	Mon, 05 Jun 2023 14:39:13 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	loongson-kernel@lists.loongnix.cn
Subject: [PATCH v5 5/6] LoongArch: Check atomic instructions in insns_not_supported()
Date: Mon,  5 Jun 2023 14:39:09 +0800
Message-Id: <1685947150-4949-6-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1685947150-4949-1-git-send-email-yangtiezhu@loongson.cn>
References: <1685947150-4949-1-git-send-email-yangtiezhu@loongson.cn>
X-CM-TRANSID:AQAAf8Axa9YPg31kHQcAAA--.72S7
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoWxWw45Zw4xZF4rWryrKF13Jrc_yoWrurW3pF
	ZrZrn5Gr48W3Z3Cr9rtasa9r4Utw4ku390q3W3Z34xC347Xr15Jr1xKry7XFn8t395Kr4F
	qrW7Jr9Fva13JagCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUk0b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Gr0_Gr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I
	8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q6rW5McIj6I8E87Iv67AK
	xVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2Ij64
	vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8G
	jcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2I
	x0cI8IcVAFwI0_Xr0_Ar1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK
	8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I
	0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxU2F4iUUUUU
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
Tested-by: Jeff Xie <xiehuan09@gmail.com>
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
index 3aa0046..3a56443 100644
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

