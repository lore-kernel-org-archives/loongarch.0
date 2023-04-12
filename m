Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CBD03207
	for <loongarch@lists.linux.dev>; Wed, 12 Apr 2023 10:05:09 +0000 (UTC)
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8AxJAxTgjZkpCwbAA--.41820S3;
	Wed, 12 Apr 2023 18:05:08 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8DxSL1SgjZke9wgAA--.34313S2;
	Wed, 12 Apr 2023 18:05:07 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	loongson-kernel@lists.loongnix.cn
Subject: [PATCH v1 0/4] Add uprobes support for LoongArch
Date: Wed, 12 Apr 2023 18:04:57 +0800
Message-Id: <1681293901-24918-1-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
X-CM-TRANSID:AQAAf8DxSL1SgjZke9wgAA--.34313S2
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBjvJXoW7Jr45XF17XrWxAFWxCw4kWFg_yoW8JryrpF
	9rurnxJF45G3s3Jr9xtas3ur1Fyr4xGrW2q3ZIy34rAr42vF15Jr18KrZrJF90k3y5KrW0
	qF1rW3yYga4UJ3DanT9S1TB71UUUUjUqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
	qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
	b3xYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
	1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
	wVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4
	x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr1j6rxdM2kK
	e7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI
	0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUtVWrXwAv7VC2z280
	aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw28Icx
	kI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMxCIbckI1I0E14v26r1Y6r17MI8I3I0E
	5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAV
	WUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r4j6ryUMIIF0xvE2Ix0cI8IcVCY
	1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI
	0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7I
	U8y8BUUUUUU==
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>

v1:
  -- Split the RFC patch #2 into two patches
  -- Use larch_insn_gen_break() to generate break insns
     for kprobes and uprobes
  -- Pass around instruction word instead of union for
     insns_not_supported(), insns_need_simulation() and
     arch_simulate_insn() to avoid type conversion for callers
  -- Add a simple test case for uprobes in the commit message

Tiezhu Yang (4):
  LoongArch: Move three functions from kprobes.c to inst.h
  LoongArch: Add larch_insn_gen_break() to generate break insns
  LoongArch: Use larch_insn_gen_break() for kprobes
  LoongArch: Add uprobes support

 arch/loongarch/Kconfig               |   3 +
 arch/loongarch/include/asm/inst.h    |  63 ++++++++++++++++
 arch/loongarch/include/asm/kprobes.h |   2 +-
 arch/loongarch/include/asm/uprobes.h |  36 ++++++++++
 arch/loongarch/kernel/Makefile       |   1 +
 arch/loongarch/kernel/inst.c         |   9 +++
 arch/loongarch/kernel/kprobes.c      |  67 ++---------------
 arch/loongarch/kernel/traps.c        |   9 ++-
 arch/loongarch/kernel/uprobes.c      | 135 +++++++++++++++++++++++++++++++++++
 9 files changed, 259 insertions(+), 66 deletions(-)
 create mode 100644 arch/loongarch/include/asm/uprobes.h
 create mode 100644 arch/loongarch/kernel/uprobes.c

-- 
2.1.0

