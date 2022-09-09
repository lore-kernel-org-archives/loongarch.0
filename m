Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F93A622
	for <loongarch@lists.linux.dev>; Fri,  9 Sep 2022 03:20:40 +0000 (UTC)
Received: from bogon.localdomain (unknown [113.200.148.30])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8CxkOD1sBpjCwEVAA--.19681S2;
	Fri, 09 Sep 2022 11:20:22 +0800 (CST)
From: Youling Tang <tangyouling@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>,
	Baoquan He <bhe@redhat.com>,
	Eric Biederman <ebiederm@xmission.com>
Cc: WANG Xuerui <kernel@xen0n.name>,
	Vivek Goyal <vgoyal@redhat.com>,
	Dave Young <dyoung@redhat.com>,
	Guo Ren <guoren@kernel.org>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Jinyang He <hejinyang@loongson.cn>,
	kexec@lists.infradead.org,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] LoongArch: Add kexec/kdump support
Date: Fri,  9 Sep 2022 11:20:18 +0800
Message-Id: <1662693621-31053-1-git-send-email-tangyouling@loongson.cn>
X-Mailer: git-send-email 2.1.0
X-CM-TRANSID:AQAAf8CxkOD1sBpjCwEVAA--.19681S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Cw1xGFy7tF1rWw4ruFy8Xwb_yoW8KFW7pF
	17urn8Kr4kGFn3Jws3tw1DuryrJwn7Gw13W3ZFy34rZF42qF1UZrnYqFnrXFn8tws3Kr40
	qFnYgw4293WUJaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9j14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxV
	WxJr0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2Wl
	Yx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbV
	WUJVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7Cj
	xVA2Y2ka0xkIwI1lc2xSY4AK67AK6r48MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4
	AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE
	17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMI
	IF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4l
	IxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvf
	C2KfnxnUUI43ZEXa7VUj5l1PUUUUU==
X-CM-SenderInfo: 5wdqw5prxox03j6o00pqjv00gofq/
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>

This patch series to support kexec/kdump (only 64bit).

Kexec is a system call that enables you to load and boot into another kernel
from the currently running kernel. This is useful for kernel developers or
other people who need to reboot very quickly without waiting for the whole
BIOS boot process to finish. 

Kdump uses kexec to quickly boot to a dump-capture kernel whenever a
dump of the system kernel's memory needs to be taken (for example, when
the system panics). The system kernel's memory image is preserved across
the reboot and is accessible to the dump-capture kernel.

For details, see Documentation/admin-guide/kdump/kdump.rst.

User tools kexec-tools see link [1].

TODO:
Currently kdump does not support the same binary image, the production kernel
and the capture kernel will be generated with different configurations. I will
support kernel relocation support in the near future. Then will go to implement
the same binary support based on kernel relocation support.

[1] Link: https://github.com/tangyouling/kexec-tools

Changes in v2:
 - Add ibar.
 - Access via IOCSR.
 - Remove the settings of the tp, sp registers.
 - Remove the crash.c file and merge the relevant code into machine_kexec.c.
 - Adjust the use of CONFIG_SMP macro to avoid build errors under !SMP
   configuration.
 - Change the default value of PHYSICAL_START of the capture kernel to
   0x90000000a0000000.

Youling Tang (3):
  LoongArch: Add kexec support
  LoongArch: Add kdump support
  LoongArch: Enable CONFIG_KEXEC

 arch/loongarch/Kconfig                     |  33 +++
 arch/loongarch/Makefile                    |   4 +
 arch/loongarch/configs/loongson3_defconfig |   1 +
 arch/loongarch/include/asm/kexec.h         |  58 +++++
 arch/loongarch/kernel/Makefile             |   3 +
 arch/loongarch/kernel/crash_dump.c         |  19 ++
 arch/loongarch/kernel/head.S               |   7 +-
 arch/loongarch/kernel/machine_kexec.c      | 271 +++++++++++++++++++++
 arch/loongarch/kernel/mem.c                |   6 +
 arch/loongarch/kernel/relocate_kernel.S    | 112 +++++++++
 arch/loongarch/kernel/setup.c              |  49 ++++
 arch/loongarch/kernel/traps.c              |   4 +
 12 files changed, 566 insertions(+), 1 deletion(-)
 create mode 100644 arch/loongarch/include/asm/kexec.h
 create mode 100644 arch/loongarch/kernel/crash_dump.c
 create mode 100644 arch/loongarch/kernel/machine_kexec.c
 create mode 100644 arch/loongarch/kernel/relocate_kernel.S

-- 
2.36.0

