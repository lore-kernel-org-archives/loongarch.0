Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 962B52571
	for <loongarch@lists.linux.dev>; Mon,  9 Jan 2023 09:08:08 +0000 (UTC)
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8CxYvBx2btjdHUAAA--.1872S3;
	Mon, 09 Jan 2023 17:08:02 +0800 (CST)
Received: from bogon.localdomain (unknown [113.200.148.30])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8DxTuRw2btj_6sWAA--.4042S2;
	Mon, 09 Jan 2023 17:08:01 +0800 (CST)
From: Youling Tang <tangyouling@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>,
	Xi Ruoyao <xry111@xry111.site>,
	Jinyang He <hejinyang@loongson.cn>
Cc: Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] LoongArch: Add kernel relocation and KASLR support
Date: Mon,  9 Jan 2023 17:07:50 +0800
Message-Id: <1673255274-18238-1-git-send-email-tangyouling@loongson.cn>
X-Mailer: git-send-email 2.1.0
X-CM-TRANSID:AQAAf8DxTuRw2btj_6sWAA--.4042S2
X-CM-SenderInfo: 5wdqw5prxox03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBjvJXoW7uF45CFyfuFWUGr15Ww15Jwb_yoW8KFyUpr
	1Yyrn8GFW8GrnxJrW7ta4fur1rtwn2kF13X3ZxtryruFW3XF1UAw18Zr9rXFyDtw4rKrWI
	qrn5Gw1aq3W5ZaDanT9S1TB71UUUUjUqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
	qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
	b3kYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
	1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
	wVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4
	x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJVWxJr1l
	n4kS14v26r1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6x
	ACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r126r1DMcIj6I8E
	87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82
	IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_Jrv_JF1lx2Iq
	xVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r
	126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY
	6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67
	AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x
	07jjWlkUUUUU=
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>

This patch series to support kernel relocation and KASLR (only 64bit).

Both old[1] and new[2] toolchains support this feature, and the test results
are as follows:
1) Enable CONFING_RELOCATABLE
 # cat /proc/iomem 
 00000000-0fffffff : System RAM
   00000000-002c3fff : Reserved
   002c4000-008c3fff : Reserved
   02000000-02f4ffff : Kernel code
   02f50000-0381cbff : Kernel data
   0381cc00-0394ae37 : Kernel bss

2) Enable CONFING_RANDOMIZE_BASE (KASLR)
first:
 # cat /proc/iomem 
 00000000-0fffffff : System RAM
   00000000-002c3fff : Reserved
   002c4000-008c3fff : Reserved
   02550000-0349ffff : Kernel code
   034a0000-03d6cbff : Kernel data
   03d6cc00-03e9ae37 : Kernel bss

second:
 # cat /proc/iomem 
 00000000-0fffffff : System RAM
   00000000-002c3fff : Reserved
   002c4000-008c3fff : Reserved
   02ad0000-03a1ffff : Kernel code
   03a20000-042ecbff : Kernel data
   042ecc00-0441ae37 : Kernel bss

Thanks to @Ruoyao's and @Jinyang's for their help and suggestions.

Links:
[1]: https://github.com/sunhaiyong1978/CLFS-for-LoongArch/releases/download/5.0/loongarch64-clfs-5.1-cross-tools-c-only.tar.xz
[2]: https://github.com/sunhaiyong1978/CLFS-for-LoongArch/releases/download/6.0/loongarch64-clfs-6.3-cross-tools-c-only.tar.xz

Xi Ruoyao (1):
  LoongArch: Use trampoline for exception handlers and kill la.abs

Youling Tang (3):
  LoongArch: Add JUMP_LINK_ADDR macro implementation to avoid using
    la.abs
  LoongArch: Add support for kernel relocation
  LoongArch: Add support for kernel address space layout randomization
    (KASLR)

 arch/loongarch/Kconfig                  |  37 +++++
 arch/loongarch/Makefile                 |   5 +
 arch/loongarch/include/asm/page.h       |   6 +
 arch/loongarch/include/asm/stackframe.h |  16 +-
 arch/loongarch/include/asm/uaccess.h    |   1 -
 arch/loongarch/kernel/Makefile          |   2 +
 arch/loongarch/kernel/entry.S           |   6 +-
 arch/loongarch/kernel/genex.S           |  20 +--
 arch/loongarch/kernel/head.S            |  30 +++-
 arch/loongarch/kernel/relocate.c        | 210 ++++++++++++++++++++++++
 arch/loongarch/kernel/setup.c           |   3 +
 arch/loongarch/kernel/traps.c           |   4 +-
 arch/loongarch/kernel/vmlinux.lds.S     |  11 +-
 arch/loongarch/mm/tlbex.S               |  28 +---
 arch/loongarch/power/suspend_asm.S      |   5 +-
 15 files changed, 333 insertions(+), 51 deletions(-)
 create mode 100644 arch/loongarch/kernel/relocate.c

-- 
2.37.1

