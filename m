Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80896A4D
	for <loongarch@lists.linux.dev>; Fri, 14 Apr 2023 09:33:11 +0000 (UTC)
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8AxlF3THTlkjWIcAA--.43822S3;
	Fri, 14 Apr 2023 17:33:08 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Dxjb7SHTlkpYkkAA--.885S2;
	Fri, 14 Apr 2023 17:33:06 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	loongson-kernel@lists.loongnix.cn
Subject: [PATCH v2 0/4] Add uprobes support for LoongArch
Date: Fri, 14 Apr 2023 17:32:57 +0800
Message-Id: <1681464781-4428-1-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
X-CM-TRANSID:AQAAf8Dxjb7SHTlkpYkkAA--.885S2
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBjvJXoW7tF4kWFyxXr15ZFy3Zw1DJrb_yoW8GF1fpF
	nrursxGr4rG3s3Jr9xtas3ur1rtr4xGrZFqFnxt3yrAr4Iqr15Jr18KrZ8JF90y3y5KrW0
	qF1rG3yYga1UA37anT9S1TB71UUUUjUqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
	qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
	b3kYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
	1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
	wVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4
	x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJVWxJr1l
	n4kS14v26r1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6x
	ACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q6rW5McIj6I8E
	87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82
	IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_Jrv_JF1lx2Iq
	xVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r
	126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY
	6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67
	AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x
	07j5GYJUUUUU=
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>

v2:
  -- Move the functions to inst.c in patch #1
  -- Pass around union for insns_not_supported(),
     insns_need_simulation() and arch_simulate_insn()

v1:
  -- Split the RFC patch #2 into two patches
  -- Use larch_insn_gen_break() to generate break insns
     for kprobes and uprobes
  -- Pass around instruction word instead of union for
     insns_not_supported(), insns_need_simulation() and
     arch_simulate_insn() to avoid type conversion for callers
  -- Add a simple test case for uprobes in the commit message

Tiezhu Yang (4):
  LoongArch: Move three functions from kprobes.c to inst.c
  LoongArch: Add larch_insn_gen_break() to generate break insns
  LoongArch: Use larch_insn_gen_break() for kprobes
  LoongArch: Add uprobes support

 arch/loongarch/Kconfig               |   3 +
 arch/loongarch/include/asm/inst.h    |  16 ++++
 arch/loongarch/include/asm/kprobes.h |   2 +-
 arch/loongarch/include/asm/uprobes.h |  36 +++++++++
 arch/loongarch/kernel/Makefile       |   1 +
 arch/loongarch/kernel/inst.c         |  48 ++++++++++++
 arch/loongarch/kernel/kprobes.c      |  75 ++++--------------
 arch/loongarch/kernel/traps.c        |   9 +--
 arch/loongarch/kernel/uprobes.c      | 142 +++++++++++++++++++++++++++++++++++
 9 files changed, 265 insertions(+), 67 deletions(-)
 create mode 100644 arch/loongarch/include/asm/uprobes.h
 create mode 100644 arch/loongarch/kernel/uprobes.c

-- 
2.1.0

