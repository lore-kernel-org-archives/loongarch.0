Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA1AF7F
	for <loongarch@lists.linux.dev>; Wed, 16 Nov 2022 08:07:34 +0000 (UTC)
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8BxLLZFmnRjOrIHAA--.10891S3;
	Wed, 16 Nov 2022 16:07:33 +0800 (CST)
Received: from localhost.localdomain (unknown [113.200.148.30])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Dx9VY6mnRjQ54UAA--.36317S10;
	Wed, 16 Nov 2022 16:07:33 +0800 (CST)
From: Qing Zhang <zhangqing@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ingo Molnar <mingo@redhat.com>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v8 8/9] LoongArch: modules/ftrace: Initialize PLT at load time
Date: Wed, 16 Nov 2022 16:07:21 +0800
Message-Id: <20221116080722.4745-9-zhangqing@loongson.cn>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20221116080722.4745-1-zhangqing@loongson.cn>
References: <20221116080722.4745-1-zhangqing@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8Dx9VY6mnRjQ54UAA--.36317S10
X-CM-SenderInfo: x2kd0wptlqwqxorr0wxvrqhubq/
X-Coremail-Antispam: 1Uk129KBjvJXoWfGF47Jr13WF1UJFW8ZF17GFg_yoWDKF1rpF
	yqywn5GrWUGFn3Wa4v9wn8ur15GFZ7W342gFW3G34akw42qry5AF10kr90yFyjqws8uFWS
	ga1fur4j9FW7Xw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
	qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
	b2kYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
	1l1IIY67AEw4v_JrI_Jryl8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
	wVC0I7IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4
	x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26F4UJVW0owAS
	0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc02F40EFcxC0V
	AKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWrXVW3AwAv7VC2z280aVAFwI0_Gr1j6F4U
	JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2Ij64vIr41l4I
	8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AK
	xVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcV
	AFwI0_Ar0_tr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8I
	cIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWxJVW8Jr1lIxAIcVC2z280aVCY1x0267AKxV
	W8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU0wiSJUUUUU==

To Implement ftrace trampiones through plt entry.

Tested by forcing ftrace_make_call() to use the module PLT, and then
loading up a module after setting up ftrace with:

| echo ":mod:<module-name>" > set_ftrace_filter;
| echo function > current_tracer;
| modprobe <module-name>

Since FTRACE_ADDR/FTRACE_REGS_ADDR is only defined when CONFIG_DYNAMIC_FTRACE
is selected, we wrap its use along with most of module_init_ftrace_plt() with
ifdeffery rather than using IS_ENABLED().

Signed-off-by: Qing Zhang <zhangqing@loongson.cn>
---
 arch/loongarch/include/asm/ftrace.h     |  4 ++
 arch/loongarch/include/asm/inst.h       |  3 +
 arch/loongarch/include/asm/module.h     |  5 +-
 arch/loongarch/include/asm/module.lds.h |  1 +
 arch/loongarch/kernel/ftrace_dyn.c      | 79 +++++++++++++++++++++++++
 arch/loongarch/kernel/inst.c            | 11 ++++
 arch/loongarch/kernel/module-sections.c | 11 ++++
 arch/loongarch/kernel/module.c          | 22 +++++++
 8 files changed, 135 insertions(+), 1 deletion(-)

diff --git a/arch/loongarch/include/asm/ftrace.h b/arch/loongarch/include/asm/ftrace.h
index 6c6187a01c68..e8b58d8f99ec 100644
--- a/arch/loongarch/include/asm/ftrace.h
+++ b/arch/loongarch/include/asm/ftrace.h
@@ -8,6 +8,10 @@
 
 #define GRAPH_FAKE_OFFSET (sizeof(struct pt_regs) - offsetof(struct pt_regs, regs[1]))
 
+#define FTRACE_PLT_IDX		0
+#define FTRACE_REGS_PLT_IDX	1
+#define NR_FTRACE_PLTS		2
+
 #ifdef CONFIG_FUNCTION_TRACER
 #define MCOUNT_INSN_SIZE 4		/* sizeof mcount call */
 
diff --git a/arch/loongarch/include/asm/inst.h b/arch/loongarch/include/asm/inst.h
index 59fee75590e9..417d6b8bc43e 100644
--- a/arch/loongarch/include/asm/inst.h
+++ b/arch/loongarch/include/asm/inst.h
@@ -13,10 +13,12 @@
 
 #define ADDR_IMMMASK_LU52ID	0xFFF0000000000000
 #define ADDR_IMMMASK_LU32ID	0x000FFFFF00000000
+#define ADDR_IMMMASK_LU12IW	0x00000000FFFFF000
 #define ADDR_IMMMASK_ADDU16ID	0x00000000FFFF0000
 
 #define ADDR_IMMSHIFT_LU52ID	52
 #define ADDR_IMMSHIFT_LU32ID	32
+#define ADDR_IMMSHIFT_LU12IW	12
 #define ADDR_IMMSHIFT_ADDU16ID	16
 
 #define ADDR_IMM(addr, INSN)	((addr & ADDR_IMMMASK_##INSN) >> ADDR_IMMSHIFT_##INSN)
@@ -361,6 +363,7 @@ u32 larch_insn_gen_or(enum loongarch_gpr rd, enum loongarch_gpr rj,
 			enum loongarch_gpr rk);
 u32 larch_insn_gen_move(enum loongarch_gpr rd, enum loongarch_gpr rj);
 
+u32 larch_insn_gen_lu12iw(enum loongarch_gpr rd, int imm);
 u32 larch_insn_gen_lu32id(enum loongarch_gpr rd, int imm);
 u32 larch_insn_gen_lu52id(enum loongarch_gpr rd, enum loongarch_gpr rj, int imm);
 u32 larch_insn_gen_jirl(enum loongarch_gpr rd, enum loongarch_gpr rj, unsigned long pc, unsigned long dest);
diff --git a/arch/loongarch/include/asm/module.h b/arch/loongarch/include/asm/module.h
index b29b19a46f42..a311cfec2b23 100644
--- a/arch/loongarch/include/asm/module.h
+++ b/arch/loongarch/include/asm/module.h
@@ -20,6 +20,9 @@ struct mod_arch_specific {
 	struct mod_section got;
 	struct mod_section plt;
 	struct mod_section plt_idx;
+
+	/* for CONFIG_DYNAMIC_FTRACE */
+	struct plt_entry *ftrace_trampolines;
 };
 
 struct got_entry {
@@ -49,7 +52,7 @@ static inline struct plt_entry emit_plt_entry(unsigned long val)
 {
 	u32 lu12iw, lu32id, lu52id, jirl;
 
-	lu12iw = (lu12iw_op << 25 | (((val >> 12) & 0xfffff) << 5) | LOONGARCH_GPR_T1);
+	lu12iw = larch_insn_gen_lu12iw(LOONGARCH_GPR_T1, ADDR_IMM(val, LU12IW));
 	lu32id = larch_insn_gen_lu32id(LOONGARCH_GPR_T1, ADDR_IMM(val, LU32ID));
 	lu52id = larch_insn_gen_lu52id(LOONGARCH_GPR_T1, LOONGARCH_GPR_T1, ADDR_IMM(val, LU52ID));
 	jirl = larch_insn_gen_jirl(0, LOONGARCH_GPR_T1, 0, (val & 0xfff));
diff --git a/arch/loongarch/include/asm/module.lds.h b/arch/loongarch/include/asm/module.lds.h
index a3d1bc0fcc72..438f09d4ccf4 100644
--- a/arch/loongarch/include/asm/module.lds.h
+++ b/arch/loongarch/include/asm/module.lds.h
@@ -5,4 +5,5 @@ SECTIONS {
 	.got : { BYTE(0) }
 	.plt : { BYTE(0) }
 	.plt.idx : { BYTE(0) }
+	.ftrace_trampoline : { BYTE(0) }
 }
diff --git a/arch/loongarch/kernel/ftrace_dyn.c b/arch/loongarch/kernel/ftrace_dyn.c
index cd64887e26b5..b070ce225989 100644
--- a/arch/loongarch/kernel/ftrace_dyn.c
+++ b/arch/loongarch/kernel/ftrace_dyn.c
@@ -9,6 +9,7 @@
 #include <linux/uaccess.h>
 
 #include <asm/inst.h>
+#include <asm/module.h>
 
 static int ftrace_modify_code(unsigned long pc, u32 old, u32 new,
 			      bool validate)
@@ -72,12 +73,63 @@ int ftrace_init_nop(struct module *mod, struct dyn_ftrace *rec)
 	return ftrace_modify_code(pc, old, new, true);
 }
 
+static inline int __get_mod(struct module **mod, unsigned long addr)
+{
+	preempt_disable();
+	*mod = __module_text_address(addr);
+	preempt_enable();
+
+	if (WARN_ON(!(*mod)))
+		return -EINVAL;
+
+	return 0;
+}
+
+static struct plt_entry *get_ftrace_plt(struct module *mod, unsigned long addr)
+{
+	struct plt_entry *plt = mod->arch.ftrace_trampolines;
+
+	if (addr == FTRACE_ADDR)
+		return &plt[FTRACE_PLT_IDX];
+	if (addr == FTRACE_REGS_ADDR &&
+			IS_ENABLED(CONFIG_DYNAMIC_FTRACE_WITH_REGS))
+		return &plt[FTRACE_REGS_PLT_IDX];
+
+	return NULL;
+}
+
+static unsigned long get_plt_addr(struct module *mod, unsigned long addr)
+{
+	struct plt_entry *plt;
+
+	plt = get_ftrace_plt(mod, addr);
+	if (!plt) {
+		pr_err("ftrace: no module PLT for %ps\n", (void *)addr);
+		return -EINVAL;
+	}
+
+	return (unsigned long)plt;
+}
+
 int ftrace_make_call(struct dyn_ftrace *rec, unsigned long addr)
 {
 	unsigned long pc;
+	long offset;
 	u32 old, new;
 
 	pc = rec->ip + LOONGARCH_INSN_SIZE;
+	offset = (long)pc - (long)addr;
+
+	if (offset < -SZ_128M || offset >= SZ_128M) {
+		int ret;
+		struct module *mod;
+
+		ret = __get_mod(&mod, pc);
+		if (ret)
+			return ret;
+
+		addr = get_plt_addr(mod, addr);
+	}
 
 	old = larch_insn_gen_nop();
 	new = larch_insn_gen_bl(pc, addr);
@@ -89,9 +141,22 @@ int ftrace_make_nop(struct module *mod, struct dyn_ftrace *rec,
 		    unsigned long addr)
 {
 	unsigned long pc;
+	long offset;
 	u32 old, new;
 
 	pc = rec->ip + LOONGARCH_INSN_SIZE;
+	offset = (long)pc - (long)addr;
+
+	if (offset < -SZ_128M || offset >= SZ_128M) {
+		int ret;
+		struct module *mod;
+
+		ret = __get_mod(&mod, pc);
+		if (ret)
+			return ret;
+
+		addr = get_plt_addr(mod, addr);
+	}
 
 	new = larch_insn_gen_nop();
 	old = larch_insn_gen_bl(pc, addr);
@@ -108,6 +173,20 @@ int ftrace_modify_call(struct dyn_ftrace *rec, unsigned long old_addr,
 	u32 old, new;
 
 	pc = rec->ip + LOONGARCH_INSN_SIZE;
+	offset = (long)pc - (long)addr;
+
+	if (offset < -SZ_128M || offset >= SZ_128M) {
+		int ret;
+		struct module *mod;
+
+		ret = __get_mod(&mod, pc);
+		if (ret)
+			return ret;
+
+		addr = get_plt_addr(mod, addr);
+
+		old_addr = get_plt_addr(mod, old_addr);
+	}
 
 	old = larch_insn_gen_bl(pc, old_addr);
 	new = larch_insn_gen_bl(pc, addr);
diff --git a/arch/loongarch/kernel/inst.c b/arch/loongarch/kernel/inst.c
index 2d2e942eb06a..0d6bd7000ba6 100644
--- a/arch/loongarch/kernel/inst.c
+++ b/arch/loongarch/kernel/inst.c
@@ -103,6 +103,17 @@ u32 larch_insn_gen_bl(unsigned long pc, unsigned long dest)
 	return insn.word;
 }
 
+u32 larch_insn_gen_lu12iw(enum loongarch_gpr rd, int imm)
+{
+	union loongarch_instruction insn;
+
+	insn.reg1i20_format.opcode = lu12iw_op;
+	insn.reg1i20_format.rd = rd;
+	insn.reg1i20_format.immediate = imm;
+
+	return insn.word;
+}
+
 u32 larch_insn_gen_lu32id(enum loongarch_gpr rd, int imm)
 {
 	union loongarch_instruction insn;
diff --git a/arch/loongarch/kernel/module-sections.c b/arch/loongarch/kernel/module-sections.c
index d296a70b758f..bd1a96691c98 100644
--- a/arch/loongarch/kernel/module-sections.c
+++ b/arch/loongarch/kernel/module-sections.c
@@ -4,6 +4,7 @@
  */
 
 #include <linux/elf.h>
+#include <linux/ftrace.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 
@@ -103,6 +104,7 @@ int module_frob_arch_sections(Elf_Ehdr *ehdr, Elf_Shdr *sechdrs,
 			      char *secstrings, struct module *mod)
 {
 	unsigned int i, num_plts = 0, num_gots = 0;
+	Elf_Shdr *tramp = NULL;
 
 	/*
 	 * Find the empty .plt sections.
@@ -114,6 +116,8 @@ int module_frob_arch_sections(Elf_Ehdr *ehdr, Elf_Shdr *sechdrs,
 			mod->arch.plt.shdr = sechdrs + i;
 		else if (!strcmp(secstrings + sechdrs[i].sh_name, ".plt.idx"))
 			mod->arch.plt_idx.shdr = sechdrs + i;
+		else if (!strcmp(secstrings + sechdrs[i].sh_name, ".ftrace_trampoline"))
+			tramp = sechdrs + i;
 	}
 
 	if (!mod->arch.got.shdr) {
@@ -166,5 +170,12 @@ int module_frob_arch_sections(Elf_Ehdr *ehdr, Elf_Shdr *sechdrs,
 	mod->arch.plt_idx.num_entries = 0;
 	mod->arch.plt_idx.max_entries = num_plts;
 
+	if (tramp) {
+		tramp->sh_type = SHT_NOBITS;
+		tramp->sh_flags = SHF_EXECINSTR | SHF_ALLOC;
+		tramp->sh_addralign = __alignof__(struct plt_entry);
+		tramp->sh_size = NR_FTRACE_PLTS * sizeof(struct plt_entry);
+	}
+
 	return 0;
 }
diff --git a/arch/loongarch/kernel/module.c b/arch/loongarch/kernel/module.c
index 825fcf77f9e7..8dc6ea0a981e 100644
--- a/arch/loongarch/kernel/module.c
+++ b/arch/loongarch/kernel/module.c
@@ -10,6 +10,7 @@
 
 #include <linux/moduleloader.h>
 #include <linux/elf.h>
+#include <linux/ftrace.h>
 #include <linux/mm.h>
 #include <linux/numa.h>
 #include <linux/vmalloc.h>
@@ -18,6 +19,7 @@
 #include <linux/string.h>
 #include <linux/kernel.h>
 #include <asm/alternative.h>
+#include <asm/inst.h>
 
 static int rela_stack_push(s64 stack_value, s64 *rela_stack, size_t *rela_stack_top)
 {
@@ -458,6 +460,24 @@ void *module_alloc(unsigned long size)
 			GFP_KERNEL, PAGE_KERNEL, 0, NUMA_NO_NODE, __builtin_return_address(0));
 }
 
+static int module_init_ftrace_plt(const Elf_Ehdr *hdr, const Elf_Shdr *sechdrs,
+				  struct module *mod)
+{
+#ifdef CONFIG_DYNAMIC_FTRACE
+	struct plt_entry *ftrace_plts;
+
+	ftrace_plts = (void *)sechdrs->sh_addr;
+
+	ftrace_plts[FTRACE_PLT_IDX] = emit_plt_entry(FTRACE_ADDR);
+
+	if (IS_ENABLED(CONFIG_DYNAMIC_FTRACE_WITH_REGS))
+		ftrace_plts[FTRACE_REGS_PLT_IDX] = emit_plt_entry(FTRACE_REGS_ADDR);
+
+	mod->arch.ftrace_trampolines = ftrace_plts;
+#endif
+	return 0;
+}
+
 int module_finalize(const Elf_Ehdr *hdr,
 		    const Elf_Shdr *sechdrs, struct module *mod)
 {
@@ -467,6 +487,8 @@ int module_finalize(const Elf_Ehdr *hdr,
 	for (s = sechdrs, se = sechdrs + hdr->e_shnum; s < se; s++) {
 		if (!strcmp(".altinstructions", secstrs + s->sh_name))
 			apply_alternatives((void *)s->sh_addr, (void *)s->sh_addr + s->sh_size);
+		if (!strcmp(".ftrace_trampoline", secstrs + s->sh_name))
+			module_init_ftrace_plt(hdr, s, mod);
 	}
 
 	return 0;
-- 
2.36.0

