Received: from out-170.mta1.migadu.com (out-170.mta1.migadu.com [95.215.58.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB35623E330
	for <loongarch@lists.linux.dev>; Wed,  1 Jul 2026 16:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782921629; cv=none; b=TIwX0GKI2ysiGQzIlqYaLK2czd4wprNUSGq2VIR/RFzOeyMmIYOVhozzL5l1W/cuHu2Vxbs0vuuOlfJtV7g6amjB8W7wCh4RRLpBIF5WKDf3lo5OAEpHedOP1KT9D079do4BhCz8z4HwMe0yyWAB/YfdfzKNoC2qcaJ6ZKMf6qg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782921629; c=relaxed/simple;
	bh=LNwthRwuoKz1/i5lQqXdBE3RcXtWDWYHUD5lLux5H4I=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Wy28ugplo3Lw6EsKMP72152fSRf6xYQ+GC3MkD/YliGjIZUMBM5Vzbebxwltbp/cnZ70BD4zLbS7JDbHzjBoe/63Zfa6BNY9bo94gzd+Ux/ilYaKFGUIvrZD1Q0J/v17+wz/zVs7HUmgJP6Lpq1ZBmCSeU34Q0OpaGkADfBzd60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=VXcYUQcW; arc=none smtp.client-ip=95.215.58.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="VXcYUQcW"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1782921624;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=k3HcLqq2aTerbmtBhhltkPQXOZSuVLdnfZzN0/Swmac=;
	b=VXcYUQcWxR0y+9Fhk7vxWusk8DYMv804l+P0F3guxSUGgwYyCYXk90jaQdzFPXWuqmEJ8b
	jwZTRWBz8FwbBa7G0pM1QK3W3Ehax1VeR8kItjFnAXO0Y92AcG0IMtk+NTc17tI8X0QdVz
	IXB7myJuRqYmv/1QZjM6h+9htXRbv9I=
From: George Guo <dongtai.guo@linux.dev>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: maobibo@loongson.cn,
	loongarch@lists.linux.dev,
	kexec@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	George Guo <guodongtai@kylinos.cn>
Subject: [PATCH v4 0/2] LoongArch: kexec: avoid clobbering the QEMU FDT
Date: Wed,  1 Jul 2026 23:59:55 +0800
Message-Id: <20260701155957.534779-1-dongtai.guo@linux.dev>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

This series fixes two ways the LoongArch kexec path can clobber the
firmware-provided FDT that QEMU places at physical 0x100000, which made the
second kernel boot silently (earlycon auto-detection reads a corrupted FDT).

Patch 1 moves the relocation trampoline off the hardcoded 0x100000 onto the
kexec core's control_code_page (as arm64/riscv do), so machine_kexec_prepare()
no longer overwrites the FDT.

Patch 2 removes the remaining fixed command-line address (KEXEC_CMDLINE_ADDR,
0x108000).  QEMU's machine FDT declares fdt_totalsize = 1MB and thus claims the
whole [0x100000, 0x200000) upper half of the reserved 2MB, so 0x108000 lives
inside the FDT and only survives because the FDT's real content is small
(~3.6KB) and 0x108000 falls in the trailing slack.  The command line is passed
to the second kernel in register a1, not at a fixed address, so it is loaded
into its own kexec segment instead, removing the overlap regardless of FDT
size.

This addresses the two questions raised on the v3 trampoline patch [1]:
 - "how to avoid the cmdline overlapping FDT" -> patch 2.
 - "how to avoid the control page being corrupted by the new kernel" -> the
   trampoline is executed only by the current kernel and is dead once the new
   kernel starts, so being overwritten afterwards is harmless; the kexec core
   also keeps the control page outside every relocation destination, so it
   cannot be corrupted during relocation.  The command line is different (it is
   read by the new kernel), which is why only the trampoline uses the core page.

Tested with tools/testing/selftests/kho/vmtest.sh on LoongArch (QEMU,
kexec_file_load): the second kernel boots with the full command line and
earlycon, and KHO restore succeeds.

This series depends on [2] ("LoongArch: kexec: Fix address space mismatch in
command line lookup"), whose char head[] change patch 2 builds on.

[1] https://lore.kernel.org/all/20260604114106.391502-1-dongtai.guo@linux.dev/
[2] https://lore.kernel.org/all/20260701023747.56221-1-dongtai.guo@linux.dev/

Changes in v4:
 - Add patch 2: load the command line in its own kexec segment, dropping the
   fixed KEXEC_CMDLINE_ADDR that overlaps the QEMU FDT (addresses the command
   line concern from the v3 review).
 - Patch 1 (relocation trampoline): drop the KEXEC_CMDLINE_ADDR comment added
   in v3 that claimed 0x108000 does not overlap the FDT (it does; patch 2
   removes the fixed address entirely).  No functional change otherwise.

v3: https://lore.kernel.org/all/20260604114106.391502-1-dongtai.guo@linux.dev/
v2: https://lore.kernel.org/all/20260601033820.38805-1-dongtai.guo@linux.dev/
v1: https://lore.kernel.org/all/20260528135828.196953-1-dongtai.guo@linux.dev/

George Guo (2):
  LoongArch: kexec: use core control page for relocation trampoline to
    avoid QEMU FDT conflict
  LoongArch: kexec: load the command line in its own segment

 arch/loongarch/include/asm/kexec.h         |  1 +
 arch/loongarch/kernel/machine_kexec.c      | 38 ++++++++++------------
 arch/loongarch/kernel/machine_kexec_file.c | 33 +++++++++++++++++--
 3 files changed, 49 insertions(+), 23 deletions(-)

-- 
2.25.1

