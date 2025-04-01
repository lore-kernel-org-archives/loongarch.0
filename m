Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CD1E1FC0F3
	for <loongarch@lists.linux.dev>; Tue,  1 Apr 2025 12:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743510008; cv=none; b=f+Ao33njydIB7Foq7th/2kPcMgXiUBo7SY7mhp5MeeDmCwrzeToYM4j5tDHOkOjXV64XAL7rSo0b2r7it9DNkl3A7W/0N0Noh8WQY1A2SVk/k49MhPGFVFnwIm/iPcwq4VoSNogpCsJRe7RmylbikThaz/nF8o2P73o21rIirhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743510008; c=relaxed/simple;
	bh=DpGxsgVgr/Xpff/beTHEZQp3I9HuOTYslzz02JBPytQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=NMYkDVsx59AmLr0P/RmM2uDZtYUwegbfGDycX3YJAl1fX752CFkXG/CDTkqwPG2SExkj0ub/YGgky4E41MdINJpCZ5JsYNjODugWlrtEHAk2dCKaf1CNWxjHf/ya5wK4H3GTFJavAmwDrltOY/BfAYRtmfhhIBV3ri+pQNfOp5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.198])
	by gateway (Coremail) with SMTP id _____8Cxqmry2etnT8CtAA--.29152S3;
	Tue, 01 Apr 2025 20:20:02 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.68.198])
	by front1 (Coremail) with SMTP id qMiowMBxGcTp2etnLbhqAA--.28868S2;
	Tue, 01 Apr 2025 20:20:01 +0800 (CST)
From: Huacai Chen <chenhuacai@loongson.cn>
To: Linus Torvalds <torvalds@linux-foundation.org>,
	Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Guo Ren <guoren@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Huacai Chen <chenhuacai@loongson.cn>
Subject: [GIT PULL] LoongArch changes for v6.15
Date: Tue,  1 Apr 2025 20:19:44 +0800
Message-ID: <20250401121945.3814892-1-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMBxGcTp2etnLbhqAA--.28868S2
X-CM-SenderInfo: hfkh0x5xdftxo6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoWxXFy7uw47XrWrJF1DAF47GFX_yoW5XF1xpr
	y3uFnxGr4DGr9xJwnrK343Wr1DtF1fGr1xXa13G348Cr1UZr1UWr1xGFZ5XFyUt3yktr10
	qr1rG3ZxKF1UA3cCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUyEb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4
	xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v2
	6r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x0EwI
	xGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480
	Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7
	IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k2
	6cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxV
	AFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8zwZ7UUUUU==

The following changes since commit 38fec10eb60d687e30c8c6b5420d86e8149f7557:

  Linux 6.14 (2025-03-24 07:02:41 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loongson.git tags/loongarch-6.15

for you to fetch changes up to 17ba839c3c6c95562f329340e67da432309dd0d4:

  LoongArch: Update Loongson-3 default config file (2025-03-30 16:31:16 +0800)

----------------------------------------------------------------
LoongArch changes for v6.15

1, Add jump table support for objtool;
2, Always select HAVE_VIRT_CPU_ACCOUNTING_GEN;
3, Enable UBSAN (Undefined Behavior Sanitizer);
4, Increase MAX_IO_PICS up to 8;
5, Increase ARCH_DMA_MINALIGN up to 16;
6, Fix and improve BPF JIT;
7, Fix and improve vDSO implementation;
8, Update the default config file;
9, Some bug fixes and other small changes.

Note: There is conflicts in arch/loongarch/Kconfig and rust/Makefile,
but can be simply fixed by adjusting context as Stephen Rothwell done
in linux-next.

----------------------------------------------------------------
Bibo Mao (1):
      LoongArch: Always select HAVE_VIRT_CPU_ACCOUNTING_GEN

Hengqi Chen (3):
      LoongArch: BPF: Fix off-by-one error in build_prologue()
      LoongArch: BPF: Use move_addr() for BPF_PSEUDO_FUNC
      LoongArch: BPF: Don't override subprog's return value

Huacai Chen (4):
      Merge Merge tag 'objtool-core-2025-03-22' into loongarch-next
      LoongArch: Increase MAX_IO_PICS up to 8
      LoongArch: Increase ARCH_DMA_MINALIGN up to 16
      LoongArch: Update Loongson-3 default config file

Miaoqian Lin (1):
      LoongArch: Fix device node refcount leak in fdt_cpu_clk_init()

WANG Rui (1):
      rust: Fix enabling Rust and building with GCC for LoongArch

Xi Ruoyao (2):
      LoongArch: vDSO: Remove --hash-style=sysv
      LoongArch: vDSO: Make use of the t8 register for vgetrandom-chacha

Yuli Wang (2):
      LoongArch: Enable UBSAN (Undefined Behavior Sanitizer)
      LoongArch: Rework the arch_kgdb_breakpoint() implementation

谢致邦 (XIE Zhibang) (1):
      LoongArch: Fix help text of CMDLINE_EXTEND in Kconfig

 arch/loongarch/Kconfig                     |  7 ++++---
 arch/loongarch/configs/loongson3_defconfig | 11 ++++++++++-
 arch/loongarch/include/asm/cache.h         |  2 ++
 arch/loongarch/include/asm/irq.h           |  2 +-
 arch/loongarch/kernel/env.c                |  2 ++
 arch/loongarch/kernel/kgdb.c               |  5 +++--
 arch/loongarch/net/bpf_jit.c               | 12 ++++++++++--
 arch/loongarch/net/bpf_jit.h               |  5 +++++
 arch/loongarch/vdso/Makefile               |  3 +--
 arch/loongarch/vdso/vgetrandom-chacha.S    | 13 +++----------
 rust/Makefile                              |  4 +++-
 11 files changed, 44 insertions(+), 22 deletions(-)

