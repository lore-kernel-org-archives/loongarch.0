Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FC8723DA
	for <loongarch@lists.linux.dev>; Fri, 10 Feb 2023 10:09:09 +0000 (UTC)
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8Cxe+rDF+Zjc8YQAA--.33005S3;
	Fri, 10 Feb 2023 18:09:08 +0800 (CST)
Received: from localhost.localdomain (unknown [113.200.148.30])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8AxHuTDF+ZjXFIwAA--.54176S2;
	Fri, 10 Feb 2023 18:09:07 +0800 (CST)
From: Qing Zhang <zhangqing@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>,
	Oleg Nesterov <oleg@redhat.com>,
	WANG Xuerui <kernel@xen0n.name>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] LoongArch: Add hardware breakpoints/watchpoints support
Date: Fri, 10 Feb 2023 18:09:03 +0800
Message-Id: <20230210100906.16169-1-zhangqing@loongson.cn>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8AxHuTDF+ZjXFIwAA--.54176S2
X-CM-SenderInfo: x2kd0wptlqwqxorr0wxvrqhubq/
X-Coremail-Antispam: 1Uk129KBjvJXoWxZry8uw1DKF1fKF4fAr13urg_yoW5GF1UpF
	ZIkrn5Kr4DKrW3Zwsxtw48urn3GF1xCrW2qa17A34YywnFqr1Fvrn3KryDXa43J3yfJry0
	qr1rWw1Fga4UZaUanT9S1TB71UUUUj7qnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
	qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
	bSxYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
	1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
	wVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1l84
	ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxVWxJr0_GcWl
	n4kS14v26r126r1DM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6x
	ACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q6rW5McIj6I8E
	87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lc7CjxV
	Aaw2AFwI0_JF0_Jw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxY
	O2xFxVAFwI0_JF0_Jw1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGV
	WUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_
	Gr0_Xr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rV
	WUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4U
	JbIYCTnIWIevJa73UjIFyTuYvjxUcYiiDUUUU

Use perf framework to manage hardware instruction and data breakpoints.
LoongArch defines hardware watchpoint functions for instruction fetch
and load/store operations, after the software configures hardware watchpoints
for instruction fetch and load/store operations. The processor hardware will
monitor the access address of the instruction fetch and load/store operation,
and will trigger the exception of the watchpoint when it meets the conditions
set by the watchpoint.

The hardware monitoring points for instruction fetching and load/store operations
each have a register for the overall configuration of all monitoring points,
a register for recording the status of all monitoring points, and four registers
required for configuration of each watchpoint individually.

Watchpoint related control status register chapters:
https://github.com/loongson/LoongArch-Documentation/releases/download/2022.08.12/
LoongArch-Vol1-v1.02-CN.pdf

Initial version has the following limitations:
- no support for virtualization

Can be tested: e.g.
1. see samples/hw_breakpoint and register_wide_hw_breakpoint.
2. ptrace(PTRACE_SINGLESTEP/..., pid, NULL, NULL)
3. ptrace (PTRACE_SETREGSET, tid, ... , ...)

TODO:
- Add hardware breakpoints/watchpoints for gdb, kgdb

Changes v1 -> v2:
Suggested by Huacai:
- Use irqentry_enter()/irqentry_exit() instead of
  exception_enter()/exception_exit()
- Add ptrace interface to expose hw-breakpoints to debuggers
- Use 2022-2023.
- Some other changes.

Qing Zhang (3):
  LoongArch: Add hardware breakpoints/watchpoints support
  LoongArch: Add ptrace single step support
  LoongArch: ptrace: expose hardware breakpoints to debuggers

 arch/loongarch/Kconfig                     |   1 +
 arch/loongarch/include/asm/hw_breakpoint.h | 145 ++++++
 arch/loongarch/include/asm/loongarch.h     |  32 +-
 arch/loongarch/include/asm/processor.h     |  11 +-
 arch/loongarch/include/asm/ptrace.h        |   2 +
 arch/loongarch/include/asm/switch_to.h     |   1 +
 arch/loongarch/include/uapi/asm/ptrace.h   |   9 +
 arch/loongarch/kernel/Makefile             |   1 +
 arch/loongarch/kernel/hw_breakpoint.c      | 540 +++++++++++++++++++++
 arch/loongarch/kernel/process.c            |   7 +
 arch/loongarch/kernel/ptrace.c             | 484 ++++++++++++++++++
 arch/loongarch/kernel/traps.c              |  27 +-
 include/uapi/linux/elf.h                   |   2 +
 13 files changed, 1241 insertions(+), 21 deletions(-)
 create mode 100644 arch/loongarch/include/asm/hw_breakpoint.h
 create mode 100644 arch/loongarch/kernel/hw_breakpoint.c

-- 
2.36.0

