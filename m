Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B60B3A5E6C
	for <loongarch@lists.linux.dev>; Tue,  8 Sep 2026 07:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788853878; cv=none; b=rV5/uh4fP3tY+3ieXoAFM4/DXSdM3s9cd8PjzSD12ZF+Ou6Q+F3Y7AS+eUoBOHNlT5idGthbsHjTEv+k/2ro52MmAKvPhi6zHHTpqfjbBWtn8pYxnNlw5gg7PH7jVkgoYCKiSdwXVGLPaizeVQ/sD0yCcKcAtB9bo2BxHvlZhTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788853878; c=relaxed/simple;
	bh=Jg5tDVPmF5oeZV8LoLBnyYdxhYER8WsGFszl9uMXRW4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X6vU5BIbhuG1BlTvpZghyG2/bOIyBJdxi9bOz5szwb3AhfxgQpjHrFsDWLLQNvh89Lyd2xKx5iQ7pD4ldXy34p8irbCWHLKTqhoJ8dh5ik44t3R2hYKv53rhZeXg5SmmP4H9FuJIn9iI33RqqgyCkFgroM+QlEvLfgWLkuH2bd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [123.138.236.242])
	by gateway (Coremail) with SMTP id _____8BxLtNxvp9qCrkJAA--.28030S3;
	Tue, 08 Sep 2026 15:51:13 +0800 (CST)
Received: from linux.localdomain (unknown [123.138.236.242])
	by front1 (Coremail) with SMTP id qMiowJBx5cxrvp9qVRAdAA--.35215S8;
	Tue, 08 Sep 2026 15:51:13 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 6/6] LoongArch: Fix one-shot limitation for perf hardware breakpoints
Date: Tue,  8 Sep 2026 15:51:06 +0800
Message-ID: <20260908075106.5039-7-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20260908075106.5039-1-yangtiezhu@loongson.cn>
References: <20260908075106.5039-1-yangtiezhu@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJBx5cxrvp9qVRAdAA--.35215S8
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoWxur1DAFykGFyxJw1xJFy5GFX_yoWrtr18pF
	9xAF1kKrW8KFn3u3ZIka1Y9F43ta97uw429a4fta4aywnF9ryrtF4IvasIqFy8Xws5XFy0
	qw1xArsa93W7Z3XCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUk2b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q6rW5McIj6I8E87Iv
	67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2
	Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s02
	6x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1Y6r17MIIYrxkI7VAKI48JMIIF0x
	vE2Ix0cI8IcVAFwI0_Xr0_Ar1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE
	42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6x
	kF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUcCD7UUUUU

In breakpoint_handler() and watchpoint_handler(), the code disables the
hardware slot by executing update_bp_registers(regs, 0, ...). This design
forces the active hardware breakpoint configuration to be wiped out upon
its first hit, turning standard perf hardware breakpoints into "one-shot"
events.

Furthermore, while the ptrace single-step path in do_watch() executes a
hardware single-step skip mechanism to advance the PC, the standard perf
path lacks any mechanism to bypass the original triggering instruction.

Modify the parameter of update_bp_registers() (passing 1 instead of 0)
to keep the breakpoint enabled to maintain its long-term persistence for
perf usage.

Concurrently, execute a single, unified register write outside the loop
to atomize the state transition and explicitly enforce the hardware skip
mechanism once per exception return, ensuring the processor safely steps
forward without lockups or losing events.

Here is a user-space reproducer to demonstrate the issue.

(1) Test program (test_perf_continuous.c):

  #include <stdio.h>
  #include <unistd.h>
  #include <sys/syscall.h>
  #include <sys/ioctl.h>
  #include <linux/perf_event.h>
  #include <linux/hw_breakpoint.h>

  static int var = 0;

  int main(void)
  {
  	size_t count = 0;
  	struct perf_event_attr attr = {
  		.type = PERF_TYPE_BREAKPOINT,
  		.size = sizeof(attr),
  		.bp_type = HW_BREAKPOINT_W,
  		.bp_addr = (unsigned long)&var,
  		.bp_len = HW_BREAKPOINT_LEN_1,
  		.exclude_kernel = 1,
  	};

  	int fd = syscall(__NR_perf_event_open, &attr, 0, -1, -1, 0);
  	ioctl(fd, PERF_EVENT_IOC_ENABLE, 0);

  	asm volatile("st.b %1, %0" : "=m"(var) : "r"(11) : "memory");
  	asm volatile("st.b %1, %0" : "=m"(var) : "r"(22) : "memory");
  	asm volatile("st.b %1, %0" : "=m"(var) : "r"(33) : "memory");

  	ioctl(fd, PERF_EVENT_IOC_DISABLE, 0);
  	read(fd, &count, sizeof(size_t));

  	printf("Watchpoint counts: expected = 3, actual = %zu\n", count);

  	close(fd);
  	return 0;
  }

(2) Test steps:

  $ gcc test_perf_continuous.c -o test_perf_continuous
  $ ./test_perf_continuous

(3) Test results:

Without this patch:

  Watchpoint counts: expected = 3, actual = 1

With this patch:

  Watchpoint counts: expected = 3, actual = 3

Fixes: 3eb2a8b23598 ("LoongArch: Fix multiple hardware watchpoint issues")
Cc: stable@vger.kernel.org
Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 arch/loongarch/include/asm/loongarch.h |  3 +++
 arch/loongarch/kernel/hw_breakpoint.c  | 16 ++++++++++++----
 2 files changed, 15 insertions(+), 4 deletions(-)

diff --git a/arch/loongarch/include/asm/loongarch.h b/arch/loongarch/include/asm/loongarch.h
index 32bbff337c5c..28eff8b49d1b 100644
--- a/arch/loongarch/include/asm/loongarch.h
+++ b/arch/loongarch/include/asm/loongarch.h
@@ -1133,6 +1133,9 @@
 #define CSR_FWPS_SKIP_SHIFT		16
 #define CSR_FWPS_SKIP			(_ULCAST_(1) << CSR_FWPS_SKIP_SHIFT)
 
+#define CSR_MWPS_SKIP_SHIFT		16
+#define CSR_MWPS_SKIP			(_ULCAST_(1) << CSR_MWPS_SKIP_SHIFT)
+
 /*
  * CSR_ECFG IM
  */
diff --git a/arch/loongarch/kernel/hw_breakpoint.c b/arch/loongarch/kernel/hw_breakpoint.c
index 9dcb122218c2..61c7f59363f7 100644
--- a/arch/loongarch/kernel/hw_breakpoint.c
+++ b/arch/loongarch/kernel/hw_breakpoint.c
@@ -487,6 +487,7 @@ bool breakpoint_handler(struct pt_regs *regs)
 	int i;
 	struct perf_event *bp, **slots;
 	bool need_sigtrap = false;
+	unsigned int clear_mask = 0;
 
 	slots = this_cpu_ptr(bp_on_reg);
 
@@ -500,11 +501,14 @@ bool breakpoint_handler(struct pt_regs *regs)
 			if (bp->attr.sigtrap)
 				need_sigtrap = true;
 
-			csr_write32(0x1 << i, LOONGARCH_CSR_FWPS);
-			update_bp_registers(regs, 0, 0);
+			clear_mask |= (0x1 << i);
+			update_bp_registers(regs, 1, 0);
 		}
 	}
 
+	if (clear_mask)
+		csr_write32(clear_mask | CSR_FWPS_SKIP, LOONGARCH_CSR_FWPS);
+
 	return need_sigtrap;
 }
 NOKPROBE_SYMBOL(breakpoint_handler);
@@ -514,6 +518,7 @@ bool watchpoint_handler(struct pt_regs *regs)
 	int i;
 	struct perf_event *wp, **slots;
 	bool need_sigtrap = false;
+	unsigned int clear_mask = 0;
 
 	slots = this_cpu_ptr(wp_on_reg);
 
@@ -527,11 +532,14 @@ bool watchpoint_handler(struct pt_regs *regs)
 			if (wp->attr.sigtrap)
 				need_sigtrap = true;
 
-			csr_write32(0x1 << i, LOONGARCH_CSR_MWPS);
-			update_bp_registers(regs, 0, 1);
+			clear_mask |= (0x1 << i);
+			update_bp_registers(regs, 1, 1);
 		}
 	}
 
+	if (clear_mask)
+		csr_write32(clear_mask | CSR_MWPS_SKIP, LOONGARCH_CSR_MWPS);
+
 	return need_sigtrap;
 }
 NOKPROBE_SYMBOL(watchpoint_handler);
-- 
2.42.0

