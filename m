Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1CF948096B
	for <loongarch@lists.linux.dev>; Thu,  2 Jul 2026 14:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783003027; cv=none; b=s1MAygJL0HXUZ9caMovZDFzSeCYVCAO2DefqzZ3+QolCn3O2vGEcBz/j6hrrtGx/EOVlVCp8SbaY/93W7/kII/hsusrXShak8QixMBBYvCiTibbgejV7l/GS4ogfbT2KN2B3T5K6XDox/hNauOotyj80sGNiGqKBmu4r6ZlqyU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783003027; c=relaxed/simple;
	bh=+FPfZS/c77gotwQPojZBZEOmzXuPmFh7Vdga9iYTI6E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BqV/xTD8xYpz5YFGjJFTAyM3fUiKK8lSqFe4r9stvyvHfJ6Ms0rbkWDWQkgRqKMFIJotZFe1kpELH+b3OpAT4EJVRIgJknQb5pbs2q4EnZMUyE6sQZWG0ewe8qBbn9ERXABEE0/ldFOIpD+2fkXAxvMNx8h0231hVxmliWAxVxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8Axd_CPd0ZqePEAAA--.5333S3;
	Thu, 02 Jul 2026 22:37:03 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowJDxaeCKd0ZqzkW8AA--.30423S4;
	Thu, 02 Jul 2026 22:37:01 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	KaFai Wan <kafai.wan@linux.dev>
Cc: bpf@vger.kernel.org,
	loongarch@lists.linux.dev,
	Leon Hwang <leon.hwang@linux.dev>,
	Puranjay Mohan <puranjay@kernel.org>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>
Subject: [PATCH bpf-next v7 2/2] bpf: Reject programs with inlined helpers if JIT is unavailable
Date: Thu,  2 Jul 2026 22:36:56 +0800
Message-ID: <20260702143656.28845-3-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20260702143656.28845-1-yangtiezhu@loongson.cn>
References: <20260702143656.28845-1-yangtiezhu@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJDxaeCKd0ZqzkW8AA--.30423S4
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7CFy8Ar4xKr1UGr4UZw45twc_yoW8CFyDpr
	9Ykw4ak39rXF1I9ay7tw4xuw13Xw48CF47GFs5CFZ2k3WaqFn2qF4agr18uFyfGr4v9F1S
	yr4Iy340934UGFXCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUBqb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07
	AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWU
	tVWrXwAv7VC2z280aVAFwI0_Cr0_Gr1UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x
	0EwIxGrwCY1x0262kKe7AKxVWUAVWUtwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkE
	bVWUJVW8JwCFI7km07C267AKxVWUXVWUAwC20s026c02F40E14v26r1j6r18MI8I3I0E74
	80Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_GFv_WrylIxkGc2Ij64vIr41lIxAIcVC0
	I7IYx2IY67AKxVW8JVW5JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04
	k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26F4j6r4UJwCI42IY6I8E87Iv6xkF
	7I0E14v26r4UJVWxJrUvcSsGvfC2KfnxnUUI43ZEXa7IU8a9aPUUUUU==

When an architecture implements bpf_jit_inlines_helper_call() (such as
LoongArch, ARM64, PowerPC, and RISC-V), the verifier skips rewriting the
helper call offset (insn->imm) during the bpf_do_misc_fixups() phase,
because the helper is expected to be inlined by the JIT compiler. As a
result, insn->imm remains as the raw helper enum ID.

However, if JIT is disabled at runtime (net.core.bpf_jit_enable=0) or
if the JIT compilation later dynamically fails (e.g., due to OOM), the
core BPF subsystem falls back to the BPF interpreter.

When the interpreter executes (__bpf_call_base + insn->imm) with the
unpatched raw helper ID, it jumps into an unaligned invalid address
space, triggering an instruction alignment fault or a memory access
panic.

Fix this by setting 'jit_required' to 1 when helper call rewriting is
skipped for JIT inlining. During runtime selection, if JIT compilation
is not available, explicitly reject loading with -ENOTSUPP based on
this flag to safely prevent the kernel panic.

Fixes: 2ddec2c80b44 ("riscv, bpf: inline bpf_get_smp_processor_id()")
Suggested-by: Alexei Starovoitov <ast@kernel.org>
Suggested-by: KaFai Wan <kafai.wan@linux.dev>
Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 kernel/bpf/fixups.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/kernel/bpf/fixups.c b/kernel/bpf/fixups.c
index 12a8a4eb757f..94e0457a0aa3 100644
--- a/kernel/bpf/fixups.c
+++ b/kernel/bpf/fixups.c
@@ -1841,8 +1841,10 @@ int bpf_do_misc_fixups(struct bpf_verifier_env *env)
 		}
 
 		/* Skip inlining the helper call if the JIT does it. */
-		if (bpf_jit_inlines_helper_call(insn->imm))
+		if (bpf_jit_inlines_helper_call(insn->imm)) {
+			prog->jit_required = 1;
 			goto next_insn;
+		}
 
 		if (insn->imm == BPF_FUNC_get_route_realm)
 			prog->dst_needed = 1;
-- 
2.42.0

