Received: from mailbox.box.xen0n.name (mail.xen0n.name [115.28.160.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A01B6AA0
	for <loongarch@lists.linux.dev>; Sat, 22 Apr 2023 17:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xen0n.name; s=mail;
	t=1682184897; bh=+ZrHDg9+4BoJK5h4IyR0hgHgfzA4HILIAEHUhkMc+l8=;
	h=From:To:Cc:Subject:Date:From;
	b=bl8VCWuLcfxwE9RBHFKRNd/SBtjFhsheiyZebWuCUkIYIhujGv2x0qRlIQmaluksW
	 YlNKTGLmmTO1nWVaRi+E2vLMAX9Ft3muLOkKzBorOI9Pyhee9VaQ28vK+izLyxZeVZ
	 ibrIaNdiWWTzbi8mrrbxA4SklANZMqwvYOkZSW9g=
Received: from ld50.lan (unknown [101.228.138.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 902E4600DA;
	Sun, 23 Apr 2023 01:34:57 +0800 (CST)
From: WANG Xuerui <kernel@xen0n.name>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	WANG Xuerui <git@xen0n.name>
Subject: [PATCH v6 00/13] LoongArch: Better backtraces
Date: Sun, 23 Apr 2023 01:34:42 +0800
Message-Id: <20230422173455.3354690-1-kernel@xen0n.name>
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

> [   34.320373] pc 9000000001691640 ra 90000000021e8e30 tp 90000000025d4000 sp 90000000025d7db0
> [   34.328673] a0 0000000000000000 a1 90000000024cee38 a2 0000000000000001 a3 7fffffffffffffff
> [   34.336972] a4 0000000000000002 a5 90000000023316a8 a6 0000000000000001 a7 0000000000000004
> [   34.345271] t0 0000000000000000 t1 0000000000000001 t2 0000000000000001 t3 90000000025ee550
> [   34.353570] t4 ffffffffffffffff t5 00000000cc620ce7 t6 0000000000000000 t7 0000000000000041
> [   34.361869] t8 0000000000001492 u0 0000000000000001 s9 9000000002510340 s0 0000000000000004
> [   34.370167] s1 90000000025ee5d0 s2 90000000025ee528 s3 0000000000000000 s4 0000000000000004
> [   34.378466] s5 9000000000571880 s6 90000000005718b2 s7 0000000000000000 s8 9000000002510340
> [   34.386765]    ra: 90000000021e8e30 arch_cpu_idle+0x1c/0x34
> [   34.392309]   ERA: 9000000001691640 __arch_cpu_idle+0x20/0x24
> [   34.398018]  CRMD: 000000b0 (PLV0 -IE -DA +PG DACF=CC DACM=CC -WE)
> [   34.404169]  PRMD: 00000004 (PPLV0 +PIE -PWE)
> [   34.408498]  EUEN: 00000000 (-FPE -SXE -ASXE -BTE)
> [   34.413259]  ECFG: 00071c1d (LIE=0,2-4,10-12 VS=7)
> [   34.418021] ESTAT: 00000004 [INT] (IS=2 ECode=0 EsubCode=0)
> [   34.423471]  PRID: 0014c010 (Loongson-64bit, Loongson-3A5000)

I've been told privately that the quirk I discovered in patch 12
(concerning BCE and CSR.BADV) may actually be expected, in which case
the patch wouldn't be needed at all. (Huacai: please feel free to drop
that patch when applying if this turns out to be the case.)

Changes in v6:

- show PC/ERA in place of $zero
- swap the symbolized $ra and ERA lines to make all CSRs appear together
- humanize all CSR fields from LSB to MSB
- show the CPU model name along with the family name

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

WANG Xuerui (13):
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
  LoongArch: Also include current CPU's full name in show_regs output

 arch/loongarch/include/asm/loongarch.h |  51 +++---
 arch/loongarch/kernel/irq.c            |   2 +-
 arch/loongarch/kernel/perf_event.c     |   2 +-
 arch/loongarch/kernel/time.c           |   2 +-
 arch/loongarch/kernel/traps.c          | 225 +++++++++++++++++++++----
 5 files changed, 221 insertions(+), 61 deletions(-)

-- 
2.40.0

