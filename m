Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70490171C1
	for <loongarch@lists.linux.dev>; Tue, 30 May 2023 10:10:05 +0000 (UTC)
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8CxpPB7y3Vk24UCAA--.5594S3;
	Tue, 30 May 2023 18:10:04 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Axo8B6y3Vk_WqAAA--.12905S2;
	Tue, 30 May 2023 18:10:02 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: linux-perf-users@vger.kernel.org,
	loongarch@lists.linux.dev
Subject: [PATCH RESEND v3 0/5] perf tools: Modify mksyscalltbl
Date: Tue, 30 May 2023 18:09:56 +0800
Message-Id: <1685441401-8709-1-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
X-CM-TRANSID:AQAAf8Axo8B6y3Vk_WqAAA--.12905S2
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBjvJXoW7ZFWfKrWkJrW7Ar18tF43Jrb_yoW8Gr13pF
	4Sk3srtrs5Xry8Aw1fur42qFWFkw1xJa4jqry0yrWYyrn8u34YyryrXas5GFWxX34fGrWU
	ZF48Xry5JF1SqF7anT9S1TB71UUUUjUqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
	qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
	b3kYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
	1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
	wVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4
	x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1ln4kS
	14v26r1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q6rW5McIj6I8E87Iv
	67AKxVWxJVW8Jr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw28Icx
	kI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMxCIbckI1I0E14v26r1Y6r17MI8I3I0E
	5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAV
	WUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r4j6ryUMIIF0xvE2Ix0cI8IcVCY
	1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI
	0_Cr0_Gr1UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x
	07UMGQDUUUUU=
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>

I'm sorry, somehow the patchset didn't reach mailing lists.
Resending with a fewer people in the cc list, which probably
was the reason.

Thanks Alexander, Leo and Ian for your reviews and suggestions.

v3:
  -- Add a new patch to declare syscalltbl_*[] as const for all archs,
     suggested by Ian.
  -- Add a new patch to use max_nr to define SYSCALLTBL_ARM64_MAX_ID.

v2:
  -- Add a new patch to rename create_table_from_c()
     to create_sc_table(), suggested by Leo.
  -- Simplify the shell script, suggested by Alexander.

Tiezhu Yang (5):
  perf tools: Declare syscalltbl_*[] as const for all archs
  perf arm64: Rename create_table_from_c() to create_sc_table()
  perf arm64: Handle __NR3264_ prefixed syscall number
  perf arm64: Use max_nr to define SYSCALLTBL_ARM64_MAX_ID
  perf LoongArch: Simplify mksyscalltbl

 tools/perf/arch/arm64/entry/syscalls/mksyscalltbl  | 17 ++++-----
 .../arch/loongarch/entry/syscalls/mksyscalltbl     | 40 +++++++---------------
 tools/perf/arch/mips/entry/syscalls/mksyscalltbl   |  2 +-
 .../perf/arch/powerpc/entry/syscalls/mksyscalltbl  |  2 +-
 tools/perf/arch/s390/entry/syscalls/mksyscalltbl   |  2 +-
 tools/perf/arch/x86/entry/syscalls/syscalltbl.sh   |  2 +-
 tools/perf/util/syscalltbl.c                       | 14 ++++----
 7 files changed, 32 insertions(+), 47 deletions(-)

-- 
2.1.0

