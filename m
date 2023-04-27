Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C03F515A9
	for <loongarch@lists.linux.dev>; Thu, 27 Apr 2023 02:12:45 +0000 (UTC)
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8Ax1egV2klkx14BAA--.2391S3;
	Thu, 27 Apr 2023 10:12:37 +0800 (CST)
Received: from bogon.localdomain (unknown [113.200.148.30])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8CxqrYQ2klkZ_U9AA--.18515S3;
	Thu, 27 Apr 2023 10:12:36 +0800 (CST)
From: Youling Tang <tangyouling@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>
Cc: WANG Xuerui <kernel@xen0n.name>,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	loongson-kernel@lists.loongnix.cn
Subject: [PATCH v2 1/5] LoongArch: Fix build error if CONFIG_DYNAMIC_FTRACE_WITH_REGS is not set
Date: Thu, 27 Apr 2023 10:12:28 +0800
Message-Id: <1682561552-32324-2-git-send-email-tangyouling@loongson.cn>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1682561552-32324-1-git-send-email-tangyouling@loongson.cn>
References: <1682561552-32324-1-git-send-email-tangyouling@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8CxqrYQ2klkZ_U9AA--.18515S3
X-CM-SenderInfo: 5wdqw5prxox03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBjvJXoW7tr13Gw1fWr13ur18Xw43ZFb_yoW8Aw4xpr
	W2kw1DJ3yUKFs7KF9F9ryrWrnrWrZrG34aqa17K34FkrWqq3WUXryUZr1DWa45t3s7WrWf
	ZFyfZrWqya17XwUanT9S1TB71UUUUUJqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
	qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
	b3xYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
	1l1IIY67AEw4v_JF0_JFyl8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
	wVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4
	x0Y4vEx4A2jsIE14v26F4j6r4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJwAa
	w2AFwI0_Jrv_JF1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44
	I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jw0_WrylYx0Ex4A2
	jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20x
	vY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km07C267AKxVWUXVWUAwC20s02
	6c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw
	0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvE
	c7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14
	v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7I
	U8TE_tUUUUU==

We can see the following build error on LoongArch if CONFIG_DYNAMIC_FTRACE_WITH_REGS
is not set:

arch/loongarch/kernel/ftrace_dyn.c: In function ‘ftrace_make_call’:
arch/loongarch/kernel/ftrace_dyn.c:167:23: error: implicit declaration of function ‘__get_mod’
  167 |                 ret = __get_mod(&mod, pc);
      |                       ^~~~~~~~~
arch/loongarch/kernel/ftrace_dyn.c:171:24: error: implicit declaration of function ‘get_plt_addr’
  171 |                 addr = get_plt_addr(mod, addr);
      |                        ^~~~~~~~~~~~

The reason is that the __get_mod and get_plt_addr functions will be called
in ftrace_make_{call,nop}.

Signed-off-by: Youling Tang <tangyouling@loongson.cn>
---
 arch/loongarch/kernel/ftrace_dyn.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/loongarch/kernel/ftrace_dyn.c b/arch/loongarch/kernel/ftrace_dyn.c
index 4a3ef8516ccc..c5f4b4681ddc 100644
--- a/arch/loongarch/kernel/ftrace_dyn.c
+++ b/arch/loongarch/kernel/ftrace_dyn.c
@@ -30,8 +30,6 @@ static int ftrace_modify_code(unsigned long pc, u32 old, u32 new, bool validate)
 	return 0;
 }
 
-#ifdef CONFIG_DYNAMIC_FTRACE_WITH_REGS
-
 #ifdef CONFIG_MODULES
 static inline int __get_mod(struct module **mod, unsigned long addr)
 {
@@ -72,6 +70,7 @@ static unsigned long get_plt_addr(struct module *mod, unsigned long addr)
 }
 #endif
 
+#ifdef CONFIG_DYNAMIC_FTRACE_WITH_REGS
 int ftrace_modify_call(struct dyn_ftrace *rec, unsigned long old_addr, unsigned long addr)
 {
 	u32 old, new;
@@ -102,7 +101,6 @@ int ftrace_modify_call(struct dyn_ftrace *rec, unsigned long old_addr, unsigned
 
 	return ftrace_modify_code(pc, old, new, true);
 }
-
 #endif /* CONFIG_DYNAMIC_FTRACE_WITH_REGS */
 
 int ftrace_update_ftrace_func(ftrace_func_t func)
-- 
2.37.1

