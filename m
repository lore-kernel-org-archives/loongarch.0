Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=114.242.206.163
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795409413;
	b=haRXwUj4un5Fehes4DQcRQ0L9BJvAlqqBAHcj/NiJ3+dGb0F4n1C34w5lD4qpu6yHcDc
	 QKlbxDMDcEzmNZKSob7lszcZmI1wqQ9GUtVAUBH/Cb5lAJPbDzzkBRLPBCcuue1Gj2Fic
	 PhfFnCZ912WAbsPRBh+pK07V6kZs1WlMh/ZUYbcTXoXtT5x1Jy+R519sCGmlsTTLeB5na
	 edgntdbvF78liV4oRjUzapj0pIF5LJyzR+KTcLOr1RZZco4zMal5nLM7/FLKJciF23xZM
	 dMrjmTqh3XVzStraub0hGJiLs4ym+d2Va6LWHCcPCmFUGzzZ1BR1ZH4x8p5KM6D3swQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795409413;
	h=DMARC-Filter:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-CM-SenderInfo:
	 X-Coremail-Antispam;
	bh=4iuo+qnHY3sqHshJJ3dhJfZ/o44FpiiMLN1F2IDDpgg=;
	b=a41JDSqYFRg8dAXeDMiIw8TUay3K3WTbUqLMnQVo6VgSr2sW9SnYZATRB28GKzcTcPFc
	 OYIL8hqkglkFdvwgF/LBpFuFz3krDjo/tv1Y0fkGYJ6cw57AE7+Txlyu3xbrgz1nwaE/8
	 t4QPJEEvJ4SVa+qPHgTAuB4oEY0ml6DVGTavb6hlPH/4QOMaReLcPj1aX/WfPIec/lzEF
	 E3j16s8edgUdNODZqSlcF5wy+dkMTWV81yom01qZjybsd7rRwv7OAAaNhXA+OXI6K3WDV
	 TB/qSXwmnHpqgDYj8HVDl/esRav0vsTYvR/ThvQwnrWp+fm/AUvzAT+hIwmAXM+842Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=loongson.cn;
	spf=pass smtp.mailfrom=loongson.cn;
	arc=none smtp.remote-ip=114.242.206.163
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3814606AE3A
	for <loongarch@lists.linux.dev>; Mon, 23 Nov 2026 04:50:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3814606AE3A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [123.138.236.242])
	by gateway (Coremail) with SMTP id _____8DxUNEDxgNr9R0iAA--.32224S3;
	Mon, 23 Nov 2026 12:50:11 +0800 (CST)
Received: from linux.localdomain (unknown [123.138.236.242])
	by front1 (Coremail) with SMTP id qMiowJAxX88AxgNrIsw2AA--.43924S5;
	Mon, 23 Nov 2026 12:50:11 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: bpf@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH bpf-next v1 3/3] selftests/bpf: Enable callx related testcases for LoongArch
Date: Mon, 23 Nov 2026 12:50:08 +0800
Message-ID: <20261123045008.23691-4-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20261123045008.23691-1-yangtiezhu@loongson.cn>
References: <20261123045008.23691-1-yangtiezhu@loongson.cn>
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJAxX88AxgNrIsw2AA--.43924S5
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoWxur1ruw1Dtw43Wr1UArWfCrX_yoW5Gr4Upa
	ykA34FkryIkF13K3WxGFWagrZ3GF1kWrWUAF42grs8uFnrJ3yxXr4fKFZ0qFn0g3yFvrZ5
	Zw1xKas3ur48ZwcCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUk2b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1q6r4UM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26rWY6Fy7McIj6I8E87Iv
	67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2
	Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s02
	6x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0x
	vE2Ix0cI8IcVAFwI0_Xr0_Ar1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE
	42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6x
	kF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxU2HqcUUUUU

As the LoongArch JIT supports indirect calls to subprogs, enable the
corresponding callx BPF selftests for LoongArch.

With this patch:
  $ sudo ./test_progs -t callx | tail -1
  Summary: 6/89 PASSED, 6 SKIPPED, 0/0 FAILED

Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 tools/testing/selftests/bpf/prog_tests/callx_func_ptr_map.c | 2 +-
 tools/testing/selftests/bpf/prog_tests/callx_rodata_lskel.c | 2 +-
 tools/testing/selftests/bpf/progs/bpf_misc.h                | 3 ++-
 3 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/bpf/prog_tests/callx_func_ptr_map.c b/tools/testing/selftests/bpf/prog_tests/callx_func_ptr_map.c
index cc63b84e4d94..c052fa7624e8 100644
--- a/tools/testing/selftests/bpf/prog_tests/callx_func_ptr_map.c
+++ b/tools/testing/selftests/bpf/prog_tests/callx_func_ptr_map.c
@@ -9,7 +9,7 @@
 #include <bpf/btf.h>
 
 #if defined(__x86_64__) || defined(__aarch64__) || \
-    (defined(__riscv) && __riscv_xlen == 64)
+    (defined(__riscv) && __riscv_xlen == 64) || defined(__loongarch__)
 
 #define CALLEE_INSN	6
 #define DATA		0x1234
diff --git a/tools/testing/selftests/bpf/prog_tests/callx_rodata_lskel.c b/tools/testing/selftests/bpf/prog_tests/callx_rodata_lskel.c
index acd821fb568f..f89bfe3e429d 100644
--- a/tools/testing/selftests/bpf/prog_tests/callx_rodata_lskel.c
+++ b/tools/testing/selftests/bpf/prog_tests/callx_rodata_lskel.c
@@ -4,7 +4,7 @@
 #include "callx_rodata.lskel.h"
 
 #if defined(__x86_64__) || defined(__aarch64__) || \
-    (defined(__riscv) && __riscv_xlen == 64)
+    (defined(__riscv) && __riscv_xlen == 64) || defined(__loongarch__)
 
 static void run(int prog_fd, int expected, const char *name)
 {
diff --git a/tools/testing/selftests/bpf/progs/bpf_misc.h b/tools/testing/selftests/bpf/progs/bpf_misc.h
index 6b930cb48f8d..523e54383d7e 100644
--- a/tools/testing/selftests/bpf/progs/bpf_misc.h
+++ b/tools/testing/selftests/bpf/progs/bpf_misc.h
@@ -306,7 +306,8 @@
 
 /* clang always emits callx, gcc only when it defines __BPF_FEATURE_CALLX */
 #if (defined(__TARGET_ARCH_arm64) || defined(__TARGET_ARCH_x86) ||	\
-     (defined(__TARGET_ARCH_riscv) && __riscv_xlen == 64)) &&		\
+     (defined(__TARGET_ARCH_riscv) && __riscv_xlen == 64) ||		\
+     defined(__TARGET_ARCH_loongarch)) &&				\
 	(defined(__clang__) || defined(__BPF_FEATURE_CALLX))
 #define CAN_USE_CALLX
 #endif
-- 
2.42.0

