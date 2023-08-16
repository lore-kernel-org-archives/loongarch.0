Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C58ED302
	for <loongarch@lists.linux.dev>; Wed, 16 Aug 2023 09:50:17 +0000 (UTC)
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8CxruvQm9xkxBQZAA--.48995S3;
	Wed, 16 Aug 2023 17:50:09 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8DxPCPQm9xkOeZbAA--.10301S2;
	Wed, 16 Aug 2023 17:50:08 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	loongson-kernel@lists.loongnix.cn
Subject: [PATCH] LoongArch: Put the body of play_dead() into arch_cpu_idle_dead()
Date: Wed, 16 Aug 2023 17:50:08 +0800
Message-Id: <1692179408-32740-1-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
X-CM-TRANSID:AQAAf8DxPCPQm9xkOeZbAA--.10301S2
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoWxZw1xCw4xGF43tFy7CFy3trc_yoW5Gr15pF
	yUAryDJr4Fgrn7Z34DJ3yrWr98Jr9rGw1a9a17AFWrAa17XF1DXrZYyas0qFnYqayF9a40
	qayrW3yFvF4UuabCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkFb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv
	67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2
	Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s02
	6x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0x
	vE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE
	42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6x
	kF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07j1YL9UUUUU=
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>

The initial aim is to silence the following objtool warning:

arch/loongarch/kernel/process.o: warning: objtool: arch_cpu_idle_dead() falls through to next function start_thread()

According to tools/objtool/Documentation/objtool.txt, this is because
the last instruction of arch_cpu_idle_dead() is a call to a noreturn
function play_dead(). In order to silence the warning, one simple way
is to add the noreturn function play_dead() to objtool's hard-coded
global_noreturns array, that is to say, just put "NORETURN(play_dead)"
into tools/objtool/noreturns.h, it works well.

But I noticed that play_dead() is only defined once and only called by
arch_cpu_idle_dead(), so put the body of play_dead() into the caller
arch_cpu_idle_dead(), then remove the noreturn function play_dead() is
an alternative way which can reduce the overhead of the function call
at the same time.

Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 arch/loongarch/include/asm/smp.h | 2 --
 arch/loongarch/kernel/process.c  | 7 -------
 arch/loongarch/kernel/smp.c      | 2 +-
 3 files changed, 1 insertion(+), 10 deletions(-)

diff --git a/arch/loongarch/include/asm/smp.h b/arch/loongarch/include/asm/smp.h
index 416b653..66ecb48 100644
--- a/arch/loongarch/include/asm/smp.h
+++ b/arch/loongarch/include/asm/smp.h
@@ -98,8 +98,6 @@ static inline void __cpu_die(unsigned int cpu)
 {
 	loongson_cpu_die(cpu);
 }
-
-extern void __noreturn play_dead(void);
 #endif
 
 #endif /* __ASM_SMP_H */
diff --git a/arch/loongarch/kernel/process.c b/arch/loongarch/kernel/process.c
index 2e04eb0..4ee1e9d 100644
--- a/arch/loongarch/kernel/process.c
+++ b/arch/loongarch/kernel/process.c
@@ -61,13 +61,6 @@ EXPORT_SYMBOL(__stack_chk_guard);
 unsigned long boot_option_idle_override = IDLE_NO_OVERRIDE;
 EXPORT_SYMBOL(boot_option_idle_override);
 
-#ifdef CONFIG_HOTPLUG_CPU
-void __noreturn arch_cpu_idle_dead(void)
-{
-	play_dead();
-}
-#endif
-
 asmlinkage void ret_from_fork(void);
 asmlinkage void ret_from_kernel_thread(void);
 
diff --git a/arch/loongarch/kernel/smp.c b/arch/loongarch/kernel/smp.c
index 8ea1bbc..6667b0a 100644
--- a/arch/loongarch/kernel/smp.c
+++ b/arch/loongarch/kernel/smp.c
@@ -317,7 +317,7 @@ void loongson_cpu_die(unsigned int cpu)
 	mb();
 }
 
-void play_dead(void)
+void __noreturn arch_cpu_idle_dead(void)
 {
 	register uint64_t addr;
 	register void (*init_fn)(void);
-- 
2.1.0

