Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.132
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795770462;
	b=3vNinvCkTfc2AbVa1t/GwhGuKtRMNr4OVBpz8o6LS6Zlrr5+ltb7UmOVcgDBoQTocAww
	 icLT2Qoj6bNFDyWmOOAuSDnuEDKwCJJKhY+64rhl3KgL6JyG3M33t/ynNz40NEj1i4/c9
	 DYOctuvWV7e0FEPbunBrDqyN/VUQpfkUX/Pq8gF/3nZZNSVniavaqckaVkwCEpdDkL528
	 r+GMIolrBsIhWJuA41/SWSQbmbuu4gaD6+tYws0o+EYho/tXHayt0UDC47i/ijKBTZ4SF
	 5sVJ5c7EiUTSXUE4s+FmNi8Mfi/5zYnYLJCM7D/B0X85OYq5tv3B4Mnnq8utHTTJTNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795770462;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Y/UMHkeyUCY25NbdTw5rz9oJMH9U+JYd8hruRProdo8=;
	b=tl3Ysd+Fx39oOWj5fFOZgsErtg4NQ/Xj5thW6ArBOYX0mOxDmFVRuyA3n63cslDxP5KQ
	 EcmNsC3miHgdT1nKek2Z8UuNTa6Npa0k3BWgo6leGsliwkgI3OLs3p/CH//b+jQRS/m3i
	 6c59tpF+h4+cnTLJHipKiaGXdoEZe+dSxRvGDZ0pLAfefkHQ0y3cOMLMhwn2XD+RnYcwy
	 IVKBusqLHd2RrTFEVxqX1qyGK6cO2AutmJ2RxP6WhAFVJQiRuzIpl9D1IbZJAx0iQkHa4
	 rSj+fNouzWEiw3fU06sQKlXc5SgpnjmD7oJQe1HxDlI3afx8sNAv2qunMVkcjqbra6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=er0dBdVc;
	arc=none smtp.remote-ip=74.125.227.132
Received: from mail-pj2-f4.google.com (mail-pj2-f4.google.com [74.125.227.132])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81A9B606A323
	for <loongarch@lists.linux.dev>; Fri, 27 Nov 2026 09:07:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81A9B606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=er0dBdVc
Received: by mail-pj2-f4.google.com with SMTP id 98e67ed59e1d1-3b426133d98so2052774a91.1
        for <loongarch@lists.linux.dev>; Fri, 27 Nov 2026 01:07:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795770461; x=1796375261; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y/UMHkeyUCY25NbdTw5rz9oJMH9U+JYd8hruRProdo8=;
        b=er0dBdVcQhvlKo6n8ondjyF3IFNB0wpq9fwsoKyGtLxwGqk6K/+KeZCLHL6BtqSB/u
         NN3vCdFMO/Iv02oZ8iDLbPnc7yC3zL6nSnNEeFR9Q7slNemByWRfS3YieXQfQpBAFr+N
         yovOpOmr1V6/nhVQiYMUF4uT0sVZRGdfYF00oeYeSsO3xngoMcPz+vwqLFX86alk57LM
         ak5prgjj/i/352YuS3BMAzu6OWAdZOiHXrqpwGZ+rkiOHWHMkw86FA+Huw2olHtHpnr7
         1yW5IIkG8DdmWAJY97SRqYOERht9HkVJC0MWXKdcUzD9ICYNWwQVTU/wWm+4eAM1nUf5
         KIZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795770461; x=1796375261;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y/UMHkeyUCY25NbdTw5rz9oJMH9U+JYd8hruRProdo8=;
        b=0OLoh/sqoGEMvWZObrnGbj0XxNnBJ9Hp7DiNIn2EKvggsA63GkiDrps2rUWEZ6YViK
         Bt/S/9IVu5gfFTvY9Ygd6OfQE6dF1oY1Ft6iSE7Ms4AJI1C/2LLyU/MpYhmS49M3xy8D
         0HyI48Z8iQ82S174zJEP0fQGsnHvtEREIhB83EXxJPFwZdv3ZQtX8Qn3qN1gxIsaGLmS
         M3d754cHejvNsPWiOVBefEjH2muj9XKhV1ewLVdmjELc9dJy5AtpIZqpbYor/7RJqCge
         l7L/m6DumRP8eDVWSqNXned8svassBCwC4xTbIpAeNegDutm/4uDx7B0CorZduHpmHET
         j8Kw==
X-Forwarded-Encrypted: i=1; AL+hErGlJONYuy9iRW56PYDidV+x1wn1l1Ob0Wf3koe701/ZG5D7CLd+RUF3D5mvG2I+gxULEM4z2+tozkc=@lists.linux.dev
X-Gm-Message-State: APuU4Z9GT5vIRtGYjAZR7Pt1+jMhClcKBotofHtLMhYkasp6JMwUUQbE
	cvsv6AB7VM6QuibmDk/bAUANN2s+CJTdbD5Ejr1UozbkQpHehZ2J+0sf
X-Gm-Gg: AZFdTZeoECVcMZ+iTXYcv8225ceA1m4Rn3QZ1VlO2oSfB+Fqa9kt1syoyZ0TWS5X4F8
	2QAtAeUY/3lVsZMtNmxYJ98exYzXXUYZHe70Pq1sk1EFb/JXjvvNvjB9/aMSFQR2058dMhlLzsd
	AbNd0ywpdQsk0lQ0nIAlXB91d3I/jz+EKcYBoGSq5srcdN9IhMFbTenz+jpqdgOfaBn47BAkhsD
	+7j/If11l/115e9q24VsoKZZsYQbME6mfS1vZ0TfleiQtNHIF0A1ySJmJ6MMXkwLGvBplRIdGRt
	fgcSPbj//k3Da5SmJsz1xk8VeRPqAe4zPHyTmMofTYn3VaaPEWlHlSNBAUoOMTV/qIp+mntfyUa
	qNSJ5tP2BMEIpXNTxGvPiuEXS5U44jy28uEjjZGaiab2jETXTCSzVBvwHP+mSqc0KB5mADCZxzy
	EvCv8X3dDBrJfmRt8k0YLm831n9QBdTr8Frq2Jy+612pICv0cJgJIIm2mrUmjZ+j6BF7lJRxjuf
	6cSkJmTEejPFepjyZ7Z1loZCotUbuDEAQMtiWOpBvTaM/i1RUSiG+08jbwPccMGwzY5XZTAqcct
	zw8klrMgHJeYw6xgOFUX7RMMV1a6j3D6kOdfApcH8Q==
X-Received: by 2002:a17:90b:5287:b0:3b0:d35d:bb86 with SMTP id 98e67ed59e1d1-3b41c8fe261mr23255612a91.15.1795770460754;
        Fri, 27 Nov 2026 01:07:40 -0800 (PST)
Received: from intel.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6d06ee37sm11718725a12.28.2026.11.27.01.07.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 01:07:39 -0800 (PST)
From: Wandun Chen <chenwandun1@gmail.com>
To: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	robh@kernel.org,
	baoquan.he@linux.dev,
	rppt@kernel.org,
	m.szyprowski@samsung.com
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	mark.rutland@arm.com,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	saravanak@kernel.org,
	akpm@linux-foundation.org,
	pasha.tatashin@soleen.com,
	pratyush@kernel.org,
	ruirui.yang@linux.dev,
	robin.murphy@arm.com,
	ruanjinjie@huawei.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	kexec@lists.infradead.org,
	linux-mm@kvack.org,
	iommu@lists.linux.dev
Subject: [PATCH v10 0/8] kdump: reduce vmcore size and capture time
Date: Fri, 27 Nov 2026 17:07:15 +0800
Message-ID: <20261127090723.741253-1-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wandun Chen <chenwandun@lixiang.com>

On SoCs that carve out large firmware-owned reserved memory (GPU,
camera ISP, ...), kdump currently dumps those carveouts as part of
system RAM even though their contents are firmware state that is not
useful for kernel crash analysis.

ACPI systems already filter reserved memory out of the vmcore through
their existing path: firmware reports those carveouts as unusable in
the EFI memory map, they get MEMBLOCK_NOMAP set in memblock.memory
(is_usable_memory(), efi-init.c), and the ELF header builder has
always skipped nomap regions; only DT-based systems currently fail
to filter these regions, which is what this series addresses.

This series introduces a MEMBLOCK_NODUMP flag (suggested by Rob) in
memblock to filter reserved memory on DT-based architectures. A new
flag is needed because MEMBLOCK_NOMAP can only express regions without
a linear mapping, while MEMBLOCK_NODUMP can filter regions that are
linearly mapped. Reserved regions are marked MEMBLOCK_NODUMP by default
so kdump omits them; reusable CMA regions are different because their
pages are handed back to the buddy allocator and may carry crash-relevant
data.

Since the reserved memory regions are filtered out, the vmcore is
smaller in size and faster to produce.

The series is based on linux-next and is organized as follows:

Patches 1-3: Preparation and bugfixes: switch riscv crash_mem to
             memblock, fold the duplicated per-arch memblock walks
             into the weak defaults, and serialize crash header
             preparation against memory hotplug.
Patches 4-7: NODUMP infrastructure: switch crash_core to
             for_each_mem_region(), introduce the MEMBLOCK_NODUMP
             flag, add a dumpable flag to struct reserved_mem, and
             mark /reserved-memory entries with MEMBLOCK_NODUMP.
Patch 8:     Skip MEMBLOCK_NODUMP regions when building the vmcore
             ELF header.


v9 --> v10:
1. Rebased on the latest linux-next, which includes the
   reserved-memory rework.

2. Patch 7: fix two issues found by Sashiko [1], by skipping
   the NODUMP marking entirely when early reservation fail
   and clamping the marked range to page boundaries.

   The changes only tighten the conditions for marking NODUMP
   and the overall logic is unchanged, so the Acked-by and
   Reviewed-by tags are kept -- Marek, Rob, please let me know
   if you disagree and I will drop them.

3. The remaining x86-specific race in patch 3 found by Sashiko [2]
   (Xen balloon inserting a System RAM resource outside
   device_hotplug_lock) is pre-existing, and fixing it depends on
   resolving other pre-existing issues first, so it will be sent
   separately.

[1] https://sashiko.dev/#/message/sashiko-outbox-181183@kernel.org
[2] https://sashiko.dev/#/message/sashiko-outbox-181179@kernel.org

An Ack for patch 1 from the riscv maintainers is still pending:
I have pinged them, but no response yet. The Ack will be added
once received.

v8 --> v9:
1. Patch 7: Avoid a potential boot panic on SH when NODUMP marking requires
   memblock resizing before it is allowed. SH supports neither
   CONFIG_KEXEC_FILE nor CONFIG_CRASH_HOTPLUG, so skip marking when both
   are disabled.

v7: https://lore.kernel.org/lkml/20260922084256.1515554-1-chenwandun1@gmail.com/
v6: https://lore.kernel.org/lkml/20260902073116.802752-1-chenwandun1@gmail.com/
v5: https://lore.kernel.org/lkml/20260806093519.2907771-1-chenwandun1@gmail.com/
v4: https://lore.kernel.org/lkml/20260630074715.4126796-1-chenwandun1@gmail.com/


Wandun Chen (8):
  riscv: build crash_mem ranges from memblock instead of resource tree
  crash_core: fold duplicated memblock arch hooks into the weak default
  crash_core: serialize crash header preparation against hotplug
  crash_core: replace for_each_mem_range() with for_each_mem_region()
  memblock: introduce MEMBLOCK_NODUMP flag
  of: reserved_mem: add dumpable flag to opt-in vmcore
  of: reserved_mem: mark /reserved-memory entries with MEMBLOCK_NODUMP
  crash_core: skip MEMBLOCK_NODUMP regions when building vmcore ELF
    header

 arch/arm64/kernel/machine_kexec_file.c     | 29 ------------
 arch/loongarch/kernel/machine_kexec_file.c | 27 -----------
 arch/riscv/Kconfig                         |  2 +-
 arch/riscv/kernel/crash.c                  |  2 +-
 arch/riscv/kernel/machine_kexec_file.c     | 33 --------------
 arch/x86/kernel/crash.c                    |  2 +-
 drivers/of/fdt.c                           |  2 +
 drivers/of/of_private.h                    |  1 +
 drivers/of/of_reserved_mem.c               | 30 ++++++++++++
 include/linux/crash_core.h                 |  2 +
 include/linux/memblock.h                   |  9 ++++
 include/linux/of_reserved_mem.h            |  1 +
 kernel/crash_core.c                        | 53 +++++++++++++++++++++-
 kernel/dma/contiguous.c                    |  1 +
 mm/memblock.c                              | 16 +++++++
 15 files changed, 116 insertions(+), 94 deletions(-)

-- 
2.43.0

