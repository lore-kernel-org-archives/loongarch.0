Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com [209.85.216.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAEF53E2ADA
	for <loongarch@lists.linux.dev>; Tue, 30 Jun 2026 07:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782805651; cv=none; b=Fqt12c+o6nxNiTRDyaCiPnbJB0mjvglx1PWWgBUOXbtZVT14mzvyInPALUh1jcWjADDG6ccEg6qsRJbyqe9EcisD1E4OF2L2/R9RR//brxOtEQa6sBEY6HPdKbGtQnt5hQ6gNThfBX9uZKV5Yu6zzLMaJaz83YC4Xv0DBcNBxoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782805651; c=relaxed/simple;
	bh=heKSEPDt49FyXQkUR7yX+hI6qaeXiquq+AzKfj9m46s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AJw+Q3BxBU9rK3dN3h4trcZDMLa0zUP6HQGJJsc1+tsESDKFVqH+gjz13Jm6dohWKSJmJlD7UuUGeWCRB7kcqrQZ30O0MoOaie5QICAsKTewP/sxn1XT7JvyVKXpG2iDqMGIEE6B4+pBK2MBjup5JKSZTq4ekdXT7B2u9JgLgB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mUxYEyqe; arc=none smtp.client-ip=209.85.216.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mUxYEyqe"
Received: by mail-pj1-f66.google.com with SMTP id 98e67ed59e1d1-380544d00b1so232722a91.0
        for <loongarch@lists.linux.dev>; Tue, 30 Jun 2026 00:47:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782805649; x=1783410449; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+GS4Pj9gB+OIxG6eqcIUsdmhCCBXu3Ye2u2fsYJSw7Q=;
        b=mUxYEyqeEiNKSyhDE3ZKm61Q9+SlLReltxM7xexAZchQ47vtgjFsSz+XooOsBpomk5
         cH4JED0DnZJuRdvy9CbupG7Guj2iEFAmqFzII8zu0dq2Spajgo0h4WFwf0PdTWLuZMWM
         +l9EdsPO2xVV25jPM+tXJzENxYTemJiB47W2HJvijEfnu+e+oeoOS0c4iyYhiRtl5vyj
         gjhaJf0sa5lN5eKw0TBXD4h9uG2ngRk99Kx7GG23DpQgtFLdlJ8HvJzLSWeNHvDV7PdN
         yb67NGCa0kxp9SkxI4Af7D0VTS+nrMWIc6N3F2SmYQFoDNj7Iiwtc+DpSHS/tTzUecvM
         nsVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782805649; x=1783410449;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+GS4Pj9gB+OIxG6eqcIUsdmhCCBXu3Ye2u2fsYJSw7Q=;
        b=kEBcoH0WhRDXDoP3k+Dgf3VTzW3RnLEMOvLFWRiSYCSwcjRJkndmhLPhFsAFMgqeQ0
         7BAR7GsgI/n1vrXYhsu7A3zoPJt9w8KA3cFHK3LmrjlmCDLu8XvaNidO6+zWVPHB2eKE
         D/g+9iGzuxf3DdXOtuaNqt6lURg8BcIEEq6LUbp89wtCn/MLbCsf4z/UHMrGOMJHVLoI
         49ff9aajq5fvlzE1+wbLKc6KRXi4i+I6+2dExIbpJwrdCYFR4azKPWbvGpyGefQGthky
         zj9trPoO0PzkqFLbfjbWcRCZ3vFO55Bi9Ji+zLyylyGBl0lPrkTSoXB4J23B9MZYBLT3
         FPCA==
X-Forwarded-Encrypted: i=1; AHgh+RpusIL2BQUiB9Noa3YRPaP/z3S2X0tf8qoPTcE2RQroNzFMR3rZmbBCBlCYGPvol71aLoLdoIy7/o4=@lists.linux.dev
X-Gm-Message-State: AOJu0YwXLSvqwSzSDTFP8NqN6cKx90dpJPHtWjbr/mgki/3HjxKfxHa4
	h78K0lBOwmC2BOtlX/s/LPHQd/N5xbCC4f6AudBtbGMsbs5rM7WsVHh0
X-Gm-Gg: AfdE7cnWal9JndNouYwj7T20IYMYbYM8I2CHXfCFcmOWgApL2RLYyatEsIlE1Ho9N0f
	yMvsRwg9zgflQg+ACp0k19L6RbYJACPU36QDTWPoBzPLH6wT4Y1c8h8gQlRdWrPzQ0JTTr1M2Ah
	utLJHwpWhnIP1deG3iNYX92Ib62MnXM6JNBMLa6xKwTVUvqrOvEDCg/CuGE01L4dJo2DtEamh+c
	V+unHyVE4u7Pi4YouL4hEKf41IdJORRF5EizQ2mnc+Btyt7FZ9YnEW7gj40/e5nn7UivbfGwPl/
	FKA5b9kKYaLEs2uLzqsIJFdRAik8XFlpPA3kFAbrjx1VC41wj/5lJES5Tino+Oe9fjaMp+j6FQc
	C5c3PkCJraqQX731Kx67JmjRErxdrpXhMdMTGvs2z9eXzZahoTKllNe06qjT2p7Js+v0bAJpsVG
	lNb6l4JDMaF5M7B1PuZgbtziE64Q==
X-Received: by 2002:a17:903:46cf:b0:2c9:f0e3:e20a with SMTP id d9443c01a7336-2ca2ea178a7mr21382995ad.33.1782805648953;
        Tue, 30 Jun 2026 00:47:28 -0700 (PDT)
Received: from intel.company.local ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca382a2d3dsm7821045ad.55.2026.06.30.00.47.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 00:47:28 -0700 (PDT)
From: Wandun Chen <chenwandun1@gmail.com>
To: chenhuacai@kernel.org,
	kernel@xen0n.name,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	robh@kernel.org,
	saravanak@kernel.org,
	bhe@redhat.com,
	rppt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	kexec@lists.infradead.org,
	iommu@lists.linux.dev,
	zhaomeijing@lixiang.com
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	alex@ghiti.fr,
	akpm@linux-foundation.org,
	pasha.tatashin@soleen.com,
	pratyush@kernel.org,
	ruirui.yang@linux.dev,
	m.szyprowski@samsung.com,
	robin.murphy@arm.com
Subject: [PATCH v4 00/10] kdump: reduce vmcore size and capture time
Date: Tue, 30 Jun 2026 15:47:04 +0800
Message-ID: <20260630074715.4126796-1-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wandun Chen <chenwandun@lixiang.com>

On SoCs that carve out large firmware-owned reserved memory (GPU
firmware, DSP, modem, camera ISP, NPU, ...), kdump currently dumps
those carveouts as part of system RAM even though their contents are
firmware state that is not useful for kernel crash analysis.

This series introduces an opt-in 'dumpable' flag [1] on struct
reserved_mem and uses it to filter the elfcorehdr PT_LOAD ranges on
DT-based architectures (arm64, riscv, loongarch). By default reserved
regions are treated as non-dumpable; CMA regions are explicitly opted
in because their pages are returned to the buddy allocator and may
carry key crash-analysis data.

Since the reserved memory regions are filtered out, the vmcore is
smaller in size and faster to produce. The reserved memory
has already been filtered out in x86; the optimizations in this series
apply to systems that use DTS such as arm64/riscv/loongarch.

The series is organized as follows:
Patches 1-4: Small prepare changes and cleanups.
Patches 5: Add dumpable flag to opt-in vmcore.
Patches 6: Append /memreserve/ entries into reserved_mem[].
Patch 7: Add generic kdump helpers.
Patches 8-10: Wire the helpers into arm64, riscv and loongarch kdump
              elfcorehdr preparation.

v3 --> v4:
1. Rebase this series on v7.2-rc1.
2. Add two cleanup patches (patch 02/03).
3. Simplify patch 03 to avoid checking whether initial_boot_params is
   NULL multiple times, suggested by Rob.

v2 --> v3:
1. Fix out-of-bounds issue if device tree lacks /reserved-memory node.[2]
2. Fix UAF issue when alloc_reserved_mem_array() fails.
3. Add some prepare patches.

v1 --> v2:
1. v1 added an opt-out DT property ('linux,no-dump'). Per Rob's
   feedback [1], v2 drop that property and exclude reserve memory
   by default.
2. Split some prepared patches from the original patches.
3. Address coding-style comments on patch 5 from Rob.

[1] https://lore.kernel.org/lkml/20260506144542.GA2072596-robh@kernel.org/
[2] https://sashiko.dev/#/patchset/20260520091844.592753-1-chenwandun%40lixiang.com?part=4


Wandun Chen (10):
  kexec/crash: provide crash_exclude_mem_range() stub when
    CONFIG_CRASH_DUMP=n
  of: reserved_mem: dedup and relocate reserved-memory messages
  of: reserved_mem: skip late scan when no regions are reserved
  of: reserved_mem: split alloc_reserved_mem_array() from
    fdt_scan_reserved_mem_late()
  of: reserved_mem: add dumpable flag to opt-in vmcore
  of: reserved_mem: save /memreserve/ entries into the reserved_mem
    array
  of: reserved_mem: add kdump helpers to exclude non-dumpable regions
  arm64: kdump: exclude non-dumpable reserved memory regions from vmcore
  riscv: kdump: exclude non-dumpable reserved memory regions from vmcore
  loongarch: kdump: exclude non-dumpable reserved memory regions from
    vmcore

 arch/arm64/kernel/machine_kexec_file.c     |   6 ++
 arch/loongarch/kernel/machine_kexec_file.c |   6 ++
 arch/riscv/kernel/machine_kexec_file.c     |   4 +
 drivers/of/fdt.c                           |  11 ++-
 drivers/of/of_private.h                    |   3 +
 drivers/of/of_reserved_mem.c               | 108 ++++++++++++++++++---
 include/linux/crash_core.h                 |   6 ++
 include/linux/of_reserved_mem.h            |  15 +++
 kernel/dma/contiguous.c                    |   1 +
 9 files changed, 142 insertions(+), 18 deletions(-)

-- 
2.43.0

