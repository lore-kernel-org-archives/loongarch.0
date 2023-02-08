Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 286452109
	for <loongarch@lists.linux.dev>; Wed,  8 Feb 2023 10:08:39 +0000 (UTC)
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8CxNummdONjvuwPAA--.23873S3;
	Wed, 08 Feb 2023 18:08:38 +0800 (CST)
Received: from localhost.localdomain (unknown [113.200.148.30])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8BxtOWldONjv1gtAA--.52925S2;
	Wed, 08 Feb 2023 18:08:37 +0800 (CST)
From: Qing Zhang <zhangqing@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>,
	Oleg Nesterov <oleg@redhat.com>,
	WANG Xuerui <kernel@xen0n.name>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] LoongArch: Add hardware breakpoints/watchpoints support
Date: Wed,  8 Feb 2023 18:08:35 +0800
Message-Id: <20230208100837.2451-1-zhangqing@loongson.cn>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8BxtOWldONjv1gtAA--.52925S2
X-CM-SenderInfo: x2kd0wptlqwqxorr0wxvrqhubq/
X-Coremail-Antispam: 1Uk129KBjvJXoW7uF4DWw1DKr45tFyxGFWfZrb_yoW8try3pF
	ZI9rn5Kr4DKrZ3Xwsrt3y8uryrGFn7C3yaq3W7t342ywnFqF1FvrsakryDXa45J3yfJ340
	qr1rWw4Fga1UAaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
	qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
	b7kYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
	1l1IIY67AEw4v_JrI_Jryl8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
	wVC0I7IYx2IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwA2z4
	x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26F4UJVW0owAS
	0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc02F40EFcxC0V
	AKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1l
	Ox8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw28IcxkI7VAKI48JMxC20s
	026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_
	JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14
	v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xva
	j40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJV
	W8JbIYCTnIWIevJa73UjIFyTuYvjxUzZ2-UUUUU

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
- userspace debug is not yet enabled: work on ptrace/gdb is in progress
- no support for virtualization

Can be tested: e.g.
1. see samples/hw_breakpoint and register_wide_hw_breakpoint.
2. ptrace(PTRACE_SINGLESTEP/..., pid, NULL, NULL)

TODO:
- Add hardware breakpoints/watchpoints for gdb, kgdb

Qing Zhang (2):
  LoongArch: Add hardware breakpoints/watchpoints support
  LoongArch: Add ptrace single step support

 arch/loongarch/Kconfig                     |   1 +
 arch/loongarch/include/asm/hw_breakpoint.h | 145 ++++++
 arch/loongarch/include/asm/loongarch.h     |  32 +-
 arch/loongarch/include/asm/processor.h     |  11 +-
 arch/loongarch/include/asm/ptrace.h        |   2 +
 arch/loongarch/include/asm/switch_to.h     |   1 +
 arch/loongarch/kernel/Makefile             |   1 +
 arch/loongarch/kernel/hw_breakpoint.c      | 525 +++++++++++++++++++++
 arch/loongarch/kernel/process.c            |   7 +
 arch/loongarch/kernel/ptrace.c             |  68 +++
 arch/loongarch/kernel/traps.c              |  31 +-
 11 files changed, 803 insertions(+), 21 deletions(-)
 create mode 100644 arch/loongarch/include/asm/hw_breakpoint.h
 create mode 100644 arch/loongarch/kernel/hw_breakpoint.c

-- 
2.36.0

