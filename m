Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4550E1384BE
	for <loongarch@lists.linux.dev>; Wed, 17 Apr 2024 09:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713348000; cv=none; b=o4tmoTHSmA1AjdJhXvkyU3HyOYkq2pHoryeSIMFdqHytuQhvlYc88rWCQZVjkGmcwocFNmCzeOjBiC3RI7EldVxIRt/kICdLZFW/Embuj1IZ8E9kvjj6ujXb0aCdkC/fN0+5CXIR1qjnObjkDe7IjC3wIXf0gZxL1obKeal77iY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713348000; c=relaxed/simple;
	bh=mHgaZJegfQ+stN8+YXhVA3PdfM0vALppszIpJsvRwX4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dein+2utIaudPaNK/YmVITZUn5dtb8lKr9mqFBwa6y8ft/+Ql8WImu5ZBh917S3q6W6mcWFYMg6slWskTxmbmHsQqFpUL2PRN2Qpu85hYk7EVbpbPRQaL+D++osws2LWQ/qomiXRW59gFTl35EhlbFAHmhm00wLusyv4tZsupZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8AxSbqanR9mFLgoAA--.11262S3;
	Wed, 17 Apr 2024 17:59:54 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8CxKBKYnR9muOR9AA--.32535S2;
	Wed, 17 Apr 2024 17:59:52 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Arnd Bergmann <arnd@arndb.de>,
	Marc Zyngier <maz@kernel.org>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	loongson-kernel@lists.loongnix.cn
Subject: [PATCH v4 0/3] Give chance to build under !CONFIG_SMP for LoongArch
Date: Wed, 17 Apr 2024 17:59:48 +0800
Message-ID: <20240417095951.2635-1-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8CxKBKYnR9muOR9AA--.32535S2
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7AFy3AF4DZrWkury8tw45twc_yoW8Gry8pF
	W09r4DJF48Gr93Aayak348uF98trnxGry2gay7C34UAF1DXayjgr1vvF9rXF1jq3yfWr40
	qFs3G34avFyUA3XCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkYb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVWxJr0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
	Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE
	14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x
	0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E
	7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcV
	C0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF
	04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7
	CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8zwZ7UUUUU==

The changes of irqchip have been merged into the irq/core branch of tip.

https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git/commit/?id=42a7d887664b
https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git/commit/?id=a64003da0ef8

This version is only related with arch/loongarch and based on 6.9-rc4,
drop the patch "LoongArch: Move CONFIG_HAVE_SETUP_PER_CPU_AREA related
code to smp.c" to use the generic setup_per_cpu_areas() if CONFIG_NUMA
is not set.

The first 2 patches with detailed commit message are preparations for
patch #3.

Tested with the following configs:
(1) CONFIG_NUMA=n, CONFIG_SMP=n
(2) CONFIG_NUMA=n, CONFIG_SMP=y
(3) CONFIG_NUMA=y, CONFIG_SMP=n (not allowed due to NUMA select SMP)
(4) CONFIG_NUMA=y, CONFIG_SMP=y

Tiezhu Yang (3):
  LoongArch: Modify acpi_parse_processor() for non-SMP
  LoongArch: Modify ACPI S3 state function for non-SMP
  LoongArch: Give chance to build under !CONFIG_SMP

 arch/loongarch/Kconfig                | 2 +-
 arch/loongarch/include/asm/acpi.h     | 1 +
 arch/loongarch/include/asm/smp.h      | 5 +++++
 arch/loongarch/kernel/acpi.c          | 9 ++++++++-
 arch/loongarch/kernel/irq.c           | 2 ++
 arch/loongarch/kernel/machine_kexec.c | 2 +-
 arch/loongarch/power/suspend.c        | 4 +++-
 7 files changed, 21 insertions(+), 4 deletions(-)

-- 
2.42.0

