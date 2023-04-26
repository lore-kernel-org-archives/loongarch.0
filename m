Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6CAD111F
	for <loongarch@lists.linux.dev>; Wed, 26 Apr 2023 01:49:24 +0000 (UTC)
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8AxdfAcg0hkUdAAAA--.1502S3;
	Wed, 26 Apr 2023 09:49:16 +0800 (CST)
Received: from bogon.localdomain (unknown [113.200.148.30])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Dx97Uag0hkROI7AA--.15428S2;
	Wed, 26 Apr 2023 09:49:14 +0800 (CST)
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
Subject: [PATCH 0/5] LoongArch: ftrace: Add direct call support code simplification
Date: Wed, 26 Apr 2023 09:49:09 +0800
Message-Id: <1682473754-25077-1-git-send-email-tangyouling@loongson.cn>
X-Mailer: git-send-email 2.1.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8Dx97Uag0hkROI7AA--.15428S2
X-CM-SenderInfo: 5wdqw5prxox03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBjvJXoW7uFWUJFWrWF4kJr1xXF15twb_yoW8trWDpr
	W3uasrGF48AFsxWwsI9a45WF13t34xAFyDua15CryYkFyDur4UZrsayFZxG343J3s5GrW2
	qFnrJw18KF13ZaDanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
	qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
	b7xYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
	1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
	wVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4
	x0Y4vEx4A2jsIE14v26F4j6r4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UM2AI
	xVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I8CrVACY4xI64
	kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv67AKxVWUJVW8JwAm
	72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2Ij64vIr41l4I8I3I
	0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWU
	GVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI
	0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0
	rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r
	4UYxBIdaVFxhVjvjDU0xZFpf9x07j1WlkUUUUU=

[Patch 1-2]: Fix build errors and simplify code.

[Patch 3-4]:
This series adds DYNAMIC_FTRACE_WITH_DIRECT_CALLS support for LoongArch.
SAMPLE_FTRACE_DIRECT and SAMPLE_FTRACE_DIRECT_MULTI are also included
here as the samples for testing DIRECT_CALLS related interface.

Part of the code refers to arm64 and riscv.

The following tests have been passed in my local 3A5000 machine.
 - ftrace*.ko
 - tools/testing/selftests/ftrace/

eg:
[loongson@linux linux]$ sudo insmod samples/ftrace/ftrace-direct-too.ko
[root@linux linux]# cat /sys/kernel/debug/tracing/trace | tail
           rmmod-4552    [001] .....  3166.654540: 0xffff800002094040: handle mm fault vma=00000000d0dbdb16 address=7ffff2a793e8 flags=254
           rmmod-4552    [001] .....  3166.654550: 0xffff800002094040: handle mm fault vma=0000000047694d8b address=555570700008 flags=255
           rmmod-4552    [001] .....  3166.654557: 0xffff800002094040: handle mm fault vma=00000000d0dbdb16 address=7ffff29e6eb0 flags=254
           rmmod-4552    [001] .....  3166.654561: 0xffff800002094040: handle mm fault vma=00000000d0dbdb16 address=7ffff297d480 flags=254

[Patch 5]: Abstract DYNAMIC_FTRACE_WITH_ARGS accesses.
Note: This patch depends on regs_set_return_value() in the patch
"LoongArch: Add support for function error injection".

Qing Zhang (1):
  LoongArch: Abstract DYNAMIC_FTRACE_WITH_ARGS accesses

Youling Tang (4):
  LoongArch: Fix build error if CONFIG_DYNAMIC_FTRACE_WITH_REGS is not
    set
  LoongArch: ftrace: Implement ftrace_find_callable_addr() to simplify
    code
  LoongArch: ftrace: Add direct call support
  LoongArch: ftrace: Add direct call trampoline samples support

 arch/loongarch/Kconfig                      |   3 +
 arch/loongarch/include/asm/ftrace.h         |  37 ++++++
 arch/loongarch/kernel/ftrace_dyn.c          | 132 +++++++++++---------
 arch/loongarch/kernel/mcount_dyn.S          |   7 +-
 samples/ftrace/ftrace-direct-modify.c       |  34 +++++
 samples/ftrace/ftrace-direct-multi-modify.c |  41 ++++++
 samples/ftrace/ftrace-direct-multi.c        |  25 ++++
 samples/ftrace/ftrace-direct-too.c          |  27 ++++
 samples/ftrace/ftrace-direct.c              |  23 ++++
 9 files changed, 266 insertions(+), 63 deletions(-)

-- 
2.37.1

