Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B20017B51A
	for <loongarch@lists.linux.dev>; Tue, 11 Jun 2024 11:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718106587; cv=none; b=kz7NFPR7c2dPDW/Jc/hRpY9M/GO1nykJxP9krwaE+H/JoK8qhNk7CC+6ApIwEQxRetE05BFBISEyqRx0O9Bc1dm8C6C7l0ivRjGozZlv0LliVbaZYVu5KikSQz9sB0OZ/7pt1ttxz+PzvV//uWKl08biiH6NQgb6rmmN9q1zlqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718106587; c=relaxed/simple;
	bh=BjbOblEWLQ7MljF4g2flK9TkBVOhA8l5AqpJ82IV2tw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=T6XD2VlDHbQoXVIbZSO6zi1oAzr2jITKmhR1673+qeKx+E/L2s1wJMBgXlm55w46GIl6n7pGMWk9YL0IMsYx5YHksDGnnogNP3Mcl5r4d/8HZ01kKEpoN96mPMmNgYIVmnCUw+UfrlllarcwiZWuDb42tRjozXT03IQ4sFrCJpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8BxrOrWOWhmY6YFAA--.23079S3;
	Tue, 11 Jun 2024 19:49:43 +0800 (CST)
Received: from localhost.localdomain (unknown [113.200.148.30])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8AxjsfTOWhmnfcbAA--.2891S2;
	Tue, 11 Jun 2024 19:49:40 +0800 (CST)
From: Hui Li <lihui@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	loongson-kernel@lists.loongnix.cn,
	Jinyang He <hejinyang@loongson.cn>
Subject: [PATCH v2 0/3] LoongArch: ptrace: Fix some watchpoint function
Date: Tue, 11 Jun 2024 19:49:36 +0800
Message-Id: <20240611114939.23586-1-lihui@loongson.cn>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8AxjsfTOWhmnfcbAA--.2891S2
X-CM-SenderInfo: 5olk3xo6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoW7Ary5XFW8Cr1UuF4DuF17Jwc_yoW8XFWUpF
	WSkFnxKrs8tr43Xwnaqw17uFy5W3Z7GrW7Ww47K34Yyw1q93WY9w48ArWDZa47C34fGw1F
	qr18Ww10ga4DZacCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUk2b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r126r1DMcIj6I8E87Iv
	67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2
	Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s02
	6x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0x
	vE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE
	42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6x
	kF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxU7tx6UUUUU

LoongArch defines hardware watchpoint functions for fetch and load/store
operations. After the software configures the watchpoints for fetch and
load/store, the processor hardware will monitor the access addresses of
the fetch and load/store operations and trigger a watchpoint exception
when the watchpoint setting conditions are met.

Fix some hardware watchpoint issues on user-space and kernel interface.

All changes are made according to the LoongArch Reference Manual:
https://loongson.github.io/LoongArch-Documentation/LoongArch-Vol1-EN.html#control-and-status-registers-related-to-watchpoints

Testing for this series can use this gdb patch:
https://sourceware.org/pipermail/gdb-patches/2024-June/209856.html

Changes v1 -> v2:
Suggested by Jinyang and Huacai:
- Modify the commit message.
- Modify the privilege level judgment in ptrace_hbp_set_ctrl() and
  move the settings of regs->csr_prmd to hw_breakpoint_control().
- Add judgment in ptrace_hbp_set_addr() to ensure that kernel-space
  address cannot be monitored in user mode.

Hui Li (3):
  LoongArch: ptrace: Fix watchpoint setting error
  LoongArch: Trigger user-space watchpoints correctly
  LoongArch: Fix multiple hardware watchpoint issues

 arch/loongarch/include/asm/hw_breakpoint.h |  3 +-
 arch/loongarch/kernel/hw_breakpoint.c      | 86 ++++++++++++----------
 arch/loongarch/kernel/ptrace.c             | 48 +++++++-----
 3 files changed, 77 insertions(+), 60 deletions(-)

-- 
2.38.1

