Received: from mailbox.box.xen0n.name (mail.xen0n.name [115.28.160.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 467E928E2
	for <loongarch@lists.linux.dev>; Fri, 21 Apr 2023 11:49:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xen0n.name; s=mail;
	t=1682077761; bh=qM4Wy31EH+0rQDRPg6wyU11HuVjTbUetccDPKvMZrXE=;
	h=From:To:Cc:Subject:Date:From;
	b=fsZg0BYWlTAeti9pWymXTW8PhqvXx2L1fbJgaogiOElHTUaTMo+8zM0awNEY1ZD7r
	 m/gm9+UfoTekW8qjblIiisnuozGhu8l2vn+RYcOEgdlkV4V1AAAsxIIfCtHHg4V5ps
	 2o0QvxEg2aHWeKOOMGEdZPyHuVCgBWBdzBegMwPE=
Received: from ld50.lan (unknown [101.228.138.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mailbox.box.xen0n.name (Postfix) with ESMTPSA id F188B60103;
	Fri, 21 Apr 2023 19:49:19 +0800 (CST)
From: WANG Xuerui <kernel@xen0n.name>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	WANG Xuerui <git@xen0n.name>
Subject: [PATCH v5 00/12] LoongArch: Better backtraces
Date: Fri, 21 Apr 2023 19:48:56 +0800
Message-Id: <20230421114908.2970567-1-kernel@xen0n.name>
X-Mailer: git-send-email 2.40.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: WANG Xuerui <git@xen0n.name>

Hi,

Here are a bunch of tweaks to the backtrace code, so the Quality of Life
for unfortunate LoongArch kernel devs (including but not limited to,
myself) could be marginally improved by relieving them of having to
mentally decode the register names and CSR bitfields.

Finally, the long-awaited bikeshedding has happened after v4 was posted,
although outside of the mailing lists because everyone else preferred to
talk in Chinese real-time ;-) Notably v5 has retained the 4x8 grid
layout of GPRs because many developers on Loongson hardware are used to
the previous style. The CSR names and the name for the CPUCFG.PRID leaf
are also shown in upper-case for consistency with the official manuals.

Before:

> [   17.879976] $ 0   : 0000000000000000 9000000000cc980c 90000001002cc000 90000001002cfe30
> [   17.887936] $ 4   : 0000000000000010 9000000000f1f770 90000001002cc000 9000000000cc3468
> [   17.895895] $ 8   : 900000010028fd00 0000000000000001 000055558e569190 0000000000000004
> [   17.903853] $12   : 0000000000000000 0000000000000004 9000000001026000 900000000132b2d8
> [   17.911811] $16   : 9000000001026000 000000006674b539 9000000000d51d10 0000000000000001
> [   17.919769] $20   : 0000000000000000 900000000025c27c 0000000000000004 0000000000000002
> [   17.927727] $24   : 900000000102e5b0 900000000102e508 0000000000000000 0000000000000004
> [   17.935686] $28   : 9000000009007840 0000000000000004 0000000000000000 0000000000000004
> [   17.943644] era   : 90000000002215a0 __arch_cpu_idle+0x20/0x24
> [   17.949438] ra    : 9000000000cc980c default_idle_call+0x34/0x5c
> [   17.955406] CSR crmd: 000000b0
> [   17.955408] CSR prmd: 00000004
> [   17.958521] CSR euen: 00000000
> [   17.961635] CSR ecfg: 00071c1c
> [   17.964748] CSR estat: 00001000
> [   17.971062] ExcCode : 0 (SubCode 0)
> [   17.974522] PrId  : 0014c010 (Loongson-64bit)

After:

> [  187.882746]                     ra 9000000002ea8e30 tp 9000000003294000 sp 9000000003297db0
> [  187.891047] a0 0000000000000000 a1 900000000318ede8 a2 0000000000000001 a3 000000000000000a
> [  187.899347] a4 9000000100297e00 a5 0000000000000001 a6 000000000000002d a7 0000000000000004
> [  187.907646] t0 0000000000000000 t1 0000000000000001 t2 0000000000003c00 t3 0000000000cccccd
> [  187.915946] t4 ffffffffffffffff t5 000000045f5d556c t6 0000000000000000 t7 0000000000000001
> [  187.924245] t8 0000000000000000 u0 0000002b6fd7b000 s9 90000000031d02f0 s0 0000000000000004
> [  187.932543] s1 90000000032ae5d0 s2 90000000032ae528 s3 0000000000000000 s4 0000000000000004
> [  187.940842] s5 9000000000571880 s6 90000000005718b2 s7 0000000000000000 s8 90000000031d02f0
> [  187.949141]   ERA: 9000000002351640 __arch_cpu_idle+0x20/0x24
> [  187.954852]    ra: 9000000002ea8e30 arch_cpu_idle+0x1c/0x34
> [  187.960391]  CRMD: 000000b0 (-WE DACM=CC DACF=CC +PG -DA -IE PLV0)
> [  187.966542]  PRMD: 00000004 (-PWE +PIE PPLV0)
> [  187.970871]  EUEN: 00000000 (-BTE -ASXE -SXE -FPE)
> [  187.975633]  ECFG: 00071c1d (VS=7 LIE=0,2-4,10-12)
> [  187.980394] ESTAT: 00000004 [INT] (EsubCode=0 ECode=0 IS=2)
> [  187.985931]  PRID: 0014c010 (Loongson-64bit)

Changes in v5:

- rebased on top of current loongarch-next
- reverted to 4x8 layout for the GPRs
- show $ra twice (once in the GPRs, once below with symbol info) for
  prettier grid
- use upper-case field names where applicable

Changes in v4:

- rebased on top of current loongarch-next
- show CSR.BADV in case of BCE too

Changes in v3:

- rebased and tested on top of v6.2-rc8
- restored the "era" name for PC per review suggestion
- show "u0" in case of r21 according to kernel register convention
- removed redundant print of $ra
- print the syscall restart flag if non-zero

Changes in v2:

- rebased and tested on top of next-20221226
- removed the mass symbol renamings per Huacai's suggestion (but the
  output still uses the ISA manual names because users are expected to
  be more familiar with those)

WANG Xuerui (12):
  LoongArch: Clean up the architectural interrupt definitions
  LoongArch: Add exception subcode definitions for the watchpoint
    exception
  LoongArch: Print GPRs with ABI names when showing registers
  LoongArch: Print symbol info for CSR.ERA and $ra only for kernel-mode
    contexts
  LoongArch: Fix format of CSR lines during show_regs
  LoongArch: Humanize the CRMD line when showing registers
  LoongArch: Humanize the PRMD line when showing registers
  LoongArch: Humanize the EUEN line when showing registers
  LoongArch: Humanize the ECFG line when showing registers
  LoongArch: Humanize the ESTAT line when showing registers
  LoongArch: Use ISA manual names for BADV and CPUCFG.PRID lines in
    show_regs
  LoongArch: Include CSR.BADV in show_regs in case of BCE exceptions

 arch/loongarch/include/asm/loongarch.h |  51 +++---
 arch/loongarch/kernel/irq.c            |   2 +-
 arch/loongarch/kernel/perf_event.c     |   2 +-
 arch/loongarch/kernel/time.c           |   2 +-
 arch/loongarch/kernel/traps.c          | 225 +++++++++++++++++++++----
 5 files changed, 222 insertions(+), 60 deletions(-)

-- 
2.40.0

