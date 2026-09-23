Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87CD4417BDE
	for <loongarch@lists.linux.dev>; Wed, 23 Sep 2026 05:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790142978; cv=none; b=c9WpSg2rNPYi1cBd83o53crYIxi+ts9Kk/3d+cLP8VDtshNvOhu13X0IbHwLZQW1P7rngpyekuWtmkoiDSCY5ok4W8bKKDD/3CoZxHUVrEcHyS5+5hiFK0r7SbyDhu6WTvkesFsVLcPQX83g90Rp3OddE9iDO2+556VKoWniw0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790142978; c=relaxed/simple;
	bh=H+qJAKye2VwOk6NjMOsoAlqoEDHxgsJEC/6qIC9WV5M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ghb329lnZtEKrAze7I6nuzTdBjs4e80CAiS83bhstlIVKAlC16aPPYGASlhZKIAivIDQiFB87kiHqyIqL+P5MjpEeviey4iCp9ID34E12Clx+MKlqip+fTPLGdLE0TttuWI0rs6WnxJnCBKbjUr2G2kaC7276EHKBV+v8KfSdwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [123.138.236.242])
	by gateway (Coremail) with SMTP id _____8BxLtO_abNqm+0OAA--.43723S3;
	Wed, 23 Sep 2026 13:55:11 +0800 (CST)
Received: from linux.localdomain (unknown [123.138.236.242])
	by front1 (Coremail) with SMTP id qMiowJCx9cy7abNqphMkAA--.48859S7;
	Wed, 23 Sep 2026 13:55:11 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 5/7] LoongArch: Fix perf hardware breakpoint failure via installation
Date: Wed, 23 Sep 2026 13:55:04 +0800
Message-ID: <20260923055506.29221-6-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20260923055506.29221-1-yangtiezhu@loongson.cn>
References: <20260923055506.29221-1-yangtiezhu@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJCx9cy7abNqphMkAA--.48859S7
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoWxJw1xGw13ZF13Ar4UKrWfWFX_yoW5Gw1Upr
	ZrAF1vqrW5J3y7G3Zrtan8Aw15JrZru3y7W34akrWYy3ZFvr13tFs29FnrXF18A39Yqa40
	gr1kWr1SvF4UXabCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkFb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
	Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jw0_WrylYx0Ex4A2jsIE
	14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x
	0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E
	7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jrv_JF1lIxkGc2Ij64vIr41lIxAIcV
	C0I7IYx2IY67AKxVW8JVW5JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF
	04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7
	CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07josjUUUUUU=

In hw_breakpoint_control(), the logic to enable CSR_PRMD_PWE (global
watchpoint enable) incorrectly relies on TIF_LOAD_WATCH. This thread
flag is only set during ptrace operations, meaning that the standard
hardware breakpoints created via perf_event_open() will never have
this flag set.

As a result, the CSR_PRMD_PWE switch is skipped, leaving the hardware
breakpoint completely inactive in perf usage.

Fix this by decoupling the CSR_PRMD_PWE from the ptrace specific flag
TIF_LOAD_WATCH, which ensures that CSR_PRMD_PWE is enabled whenever a
hardware breakpoint is installed.

Here is a user-space reproducer to demonstrate the issue:

(1) Test program (test_perf_install.c):

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

  	ioctl(fd, PERF_EVENT_IOC_DISABLE, 0);
  	read(fd, &count, sizeof(size_t));

  	printf("Watchpoint counts: expected = 1, actual = %zu\n", count);

  	close(fd);
  	return 0;
  }

(2) Test steps:

  $ gcc test_perf_install.c -o test_perf_install
  $ ./test_perf_install

(3) Test results:

Without this patch:

  Watchpoint counts: expected = 1, actual = 0

With this patch:

  Watchpoint counts: expected = 1, actual = 1

Fixes: 3892b11eac5a ("LoongArch: Check TIF_LOAD_WATCH to enable user space watchpoint")
Cc: stable@vger.kernel.org
Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 arch/loongarch/kernel/hw_breakpoint.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/loongarch/kernel/hw_breakpoint.c b/arch/loongarch/kernel/hw_breakpoint.c
index 3683a52b2368..9dcb122218c2 100644
--- a/arch/loongarch/kernel/hw_breakpoint.c
+++ b/arch/loongarch/kernel/hw_breakpoint.c
@@ -233,7 +233,7 @@ static int hw_breakpoint_control(struct perf_event *bp,
 		}
 		enable = csr_read64(LOONGARCH_CSR_CRMD);
 		csr_write64(CSR_CRMD_WE | enable, LOONGARCH_CSR_CRMD);
-		if (bp->hw.target && test_tsk_thread_flag(bp->hw.target, TIF_LOAD_WATCH))
+		if (bp->hw.target)
 			regs->csr_prmd |= CSR_PRMD_PWE;
 		break;
 	case HW_BREAKPOINT_UNINSTALL:
-- 
2.42.0

