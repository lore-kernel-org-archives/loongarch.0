Received: from mail-pj2-f11.google.com (mail-pj2-f11.google.com [74.125.227.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61D444CDDCD
	for <loongarch@lists.linux.dev>; Tue, 22 Sep 2026 08:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790066594; cv=none; b=pmQuizbE4ljVVYauLO82Ed+D1qUcApeclZ/2sOfXi6oXx0QsJh23IoXSPqKdFY0nUIXZOZqDO2hK570uzfgd9nPhQ8dBFYCAajDMyjnv7G9TrCXrPi1h2HsaEG055J0U6g6L2lZhGqBylwoF6oKDfAbp3Q+5zL2U8+zoR2pnLVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790066594; c=relaxed/simple;
	bh=7cjsUBv8hgI4oUGBx2XTEPgSKQM575FA4pH4DaXNaDU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mfH+omlYdxfg0q7SZpbllqJF5r2x92bDLa5mILz6tUT2cGSip0p1DXyFSUi2FrAqMvdJm7CQazMDB+9blhJjTKx1TU+g/XotCjtuic8Pmc3ZkY1JgfdnH5cT+3JXgmUmdvVsW7rrhK3HsLAz/JFPzx6vYsk8bEzVzRnzSUFdM1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=agg8s5xU; arc=none smtp.client-ip=74.125.227.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="agg8s5xU"
Received: by mail-pj2-f11.google.com with SMTP id 98e67ed59e1d1-398a384b5f7so2319986a91.0
        for <loongarch@lists.linux.dev>; Tue, 22 Sep 2026 01:43:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790066592; x=1790671392; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9UsbLRFUse88WvBnvQ2Q7a6jE7KnWiu4inPojM0/Ln8=;
        b=agg8s5xUyNncNhSiAerd3MUSoui2L8kZt7Napc+7CNosMOlkPINFk86Nc8yHypRLRw
         ddM83FSFUq5sYoe9/9tyWnX7bKRTI5ubGOnYAaTXPp+BcURvjYaIhWJJUM+xAIwBXgh8
         OudmGng4cwv07T7POCgvVBqVG5p4Fd0aZzvPJH7CRbseFwfV0OQBr1OIem95ifwbOfho
         M4+K3Rf/Xp8zvMHJULH88gJz1SWrUjqntOFuqe4oOiZ8ihWY7QRf8leNFOP0og0vhDah
         NouRl9chEK2WJDRjH3p1UWkA3scrZ+Fl8xtAHc5ELNAHlDM1z6MO/Bv1/ky69aFGkSxw
         2YVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790066592; x=1790671392;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9UsbLRFUse88WvBnvQ2Q7a6jE7KnWiu4inPojM0/Ln8=;
        b=lQb66UjjAjTsUhJfFa9rPUQIqQEXZdFMV1qNAy66JLvQR6josgXRGbEQecDJMVWlOq
         yNkGciAbHFWeJ38JkNdDyj76/ysfGFdsw7Aka7Du5e7fOtnJKYVJRxhbIMzw3rqJk8yr
         r/1mo5japRhBCposhwwbXtKuFLDtDwJfABxkUQc+rhWcCYtpxr2OcTjzH4oQkocf1ixR
         BszXxHiVTl0wqV+Ypszh1jLxdRq2EySMrrf+GxP8UomPAX6Ag+1P9OOOUfkfjVd/fqVH
         j7idYFaiv4hq5UDonQeVU9vhjOY6ZAQV+c8N0n5/mvBMigg0rwc3CguE6weOX6qBzSzd
         n2lQ==
X-Forwarded-Encrypted: i=1; AKwUvBwj4LHilP3hlXXMu8TWbwsK+C+8o5t1QRKAtzoev8sYZFw7esOfskKy9W208RUtEfpEOlw+dvpd38o=@lists.linux.dev
X-Gm-Message-State: AFuF++li5y75gkqHhi9Cm+sGCG9yc5jxVOKvLENB8WiceENQMcVoCAIm
	KRxCzv6uHH40jVu2yhFo+5NyzsgsUZ11tJFmxZzRZOWQJeNzZkfhDptX
X-Gm-Gg: AYBFou0JOd02MRdX0zFtDPwdSR3InFl7PPStXmtsY5AZ52qSDKWg7H3Vy+TlsX9Fv7a
	OtBX9TMbxiSZUexFBiNRwqP+uRBsDIYcNbIGNbqdlvKcrcGUgiBPfJ1iXYgi/UoSruPBU6L38ec
	sht0d2IxR0tv4mIBfljD1d8fPaQj+HwlrN/4EdxhhG4kWaeE0JLSj9pPI+1E71yZA4IqFdWSc0L
	/tPiHpB5tLPdyWLoGkRXfxWj9h99LatxPPw0TpSjBpAEInknwCgKr3n2neO7cdFj0vjc167KgJc
	OwoNPjbv440qHMyi6VcLoTNMIW9ld9GY+Y02GNHCGGnOycLeFypkaw8GM/iJE1tqQD2F1PPPLl7
	kngnaO9lGPmuGTRJLLOEWfPBdIglNTZnV8fVbi1rHu0+y7QYlOAX/fzLhuHEP9Mw826AY+4cWZk
	K8IFCJzcVoRkCv/QwE9qAQF0WBrti1+Gg6KaNbDPjX1pSPCDs+OQ5KzzgA1KmmmzPtA4YFqz0++
	KEIK8DvNnpBNumlxCDX0A==
X-Received: by 2002:a17:90b:4cca:b0:39e:423:bb8f with SMTP id 98e67ed59e1d1-3a0730988bdmr477897a91.1.1790066591638;
        Tue, 22 Sep 2026 01:43:11 -0700 (PDT)
Received: from intel.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0674a5ae4sm3670016a91.12.2026.09.22.01.43.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 01:43:10 -0700 (PDT)
From: Wandun Chen <chenwandun1@gmail.com>
To: robh@kernel.org,
	baoquan.he@linux.dev,
	rppt@kernel.org,
	m.szyprowski@samsung.com
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	mark.rutland@arm.com,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
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
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	kexec@lists.infradead.org,
	linux-mm@kvack.org,
	iommu@lists.linux.dev
Subject: [PATCH v7 0/9] kdump: reduce vmcore size and capture time
Date: Tue, 22 Sep 2026 16:42:47 +0800
Message-ID: <20260922084256.1515554-1-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wandun Chen <chenwandun@lixiang.com>

On SoCs that carve out large firmware-owned reserved memory (GPU,
camera ISP, ...), kdump currently dumps those carveouts as part of
system RAM even though their contents are firmware state that is not
useful for kernel crash analysis.

This series introduces a MEMBLOCK_NODUMP flag in memblock to filter
reserved memory on DT-based architectures (arm64, riscv, loongarch).
Reserved regions are marked MEMBLOCK_NODUMP by default so kdump omits
them; reusable CMA regions are different because their pages are handed
back to the buddy allocator and may carry crash-relevant data.

ACPI systems already filter reserved memory out of the vmcore through
their existing path; only DT-based systems currently fail to filter these
regions, which is what this series addresses. The flag lives in memblock
itself rather than in a DT-only structure, so both ACPI and DT systems
can benefit from it (suggested by Rob, thanks).

Since the reserved memory regions are filtered out, the vmcore is
smaller in size and faster to produce.

The series is based on linux-next and is organized as follows:

Patches 1-3: Preparation and bugfixes: switch riscv crash_mem to memblock,
	     fold the duplicated per-arch memblock walks into the weak
             defaults, and serialize crash header preparation against
             memory hotplug.
Patches 4-8: NODUMP infrastructure: switch crash_core to
             for_each_mem_region(), introduce the MEMBLOCK_NODUMP flag,
	     add a dumpable flag to struct reserved_mem, and mark
	     /reserved-memory and /memreserve/ entries with MEMBLOCK_NODUMP
	     flag.
Patch 9:     Exclude MEMBLOCK_NODUMP regions from the vmcore ELF
             header.

v6 --> v7:
1. Fix a stale MEMBLOCK_NODUMP flag issue [1]. Memory reserved and
   marked as NODUMP may later be freed (the initrd, for example),
   so the NODUMP flag must be cleared accordingly. Since the fix is
   part of the NODUMP infrastructure introduced by patch 5, it has
   been folded into that patch.

2. Drop the "generic" related description in the cover letter.

3. Collect the Acked-by and Reviewed-by tags received during the v6
   review (thanks to Baoquan, Mike, Rob and Marek). Patch 5 is the
   only one without a tag, as its Reviewed-by was dropped when the
   fix was folded in.

4. Drop patch 1 of v6, which has been merged separately.


v5 --> v6:
1. Serialize crash header preparation against memory hotplug to avoid
   out-of-bounds or use-after-free issues.
2. MEMBLOCK_NODUMP marking is now done after memblock allows resizing,
   avoiding a panic from too few regions before resize is permitted.
3. Reordered the patches, put pre-existing bugfixes earlier in the series.


v4 --> v5:
1. Rework the mechanism around a memblock-level MEMBLOCK_NODUMP flag
   (suggested by Rob) instead of the v4 opt-in 'dumpable' flag on
   DT-only struct reserved_mem [2].
2. Switch the riscv vmcore elf header preparation to use memblock
   instead of the resource tree, aligning it with arm64 and loongarch,
   so riscv also can exclude reserved memory from vmcore.
3. Deduplicate the vmcore elf header preparation: arm64, riscv and
   loongarch open-coded the same logic, so fold it into shared
    __weak defaults in crash_core.
4.  Drop the v4 patch that saved /memreserve/ entries into the
    reserved_mem array; /memreserve/ is now marked MEMBLOCK_NODUMP
    directly.

v3 --> v4:
1. Rebase this series on v7.2-rc1.
2. Add two cleanup patches (patch 02/03).
3. Simplify patch 03 to avoid checking whether initial_boot_params is
   NULL multiple times, suggested by Rob.

v2 --> v3:
1. Fix out-of-bounds issue if device tree lacks /reserved-memory node.
2. Fix UAF issue when alloc_reserved_mem_array() fails.
3. Add some prepare patches.

v1 --> v2:
1. v1 added an opt-out DT property ('linux,no-dump'). Per Rob's
   feedback [3], v2 drop that property and exclude reserve memory
   by default.
2. Split some prepared patches from the original patches.
3. Address coding-style comments on patch 5 from Rob.

[1] https://sashiko.dev/#/message/20260917220750.GA4013814-robh%40kernel.org
[2] https://lore.kernel.org/lkml/20260723234126.GA3253409-robh@kernel.org/
[3] https://lore.kernel.org/lkml/20260506144542.GA2072596-robh@kernel.org/



Wandun Chen (9):
  riscv: build crash_mem ranges from memblock instead of resource tree
  crash_core: fold duplicated memblock arch hooks into the weak default
  crash_core: serialize crash header preparation against hotplug
  crash_core: replace for_each_mem_range() with for_each_mem_region()
  memblock: introduce MEMBLOCK_NODUMP flag
  of: reserved_mem: add dumpable flag to opt-in vmcore
  of: reserved_mem: mark /reserved-memory entries with MEMBLOCK_NODUMP
  of: reserved_mem: mark /memreserve/ entries as MEMBLOCK_NODUMP
  crash_core: skip MEMBLOCK_NODUMP regions when building vmcore ELF
    header

 arch/arm64/kernel/machine_kexec_file.c     | 29 ------------
 arch/loongarch/kernel/machine_kexec_file.c | 27 ------------
 arch/riscv/Kconfig                         |  2 +-
 arch/riscv/kernel/machine_kexec_file.c     | 33 --------------
 arch/x86/kernel/crash.c                    |  2 +-
 drivers/of/fdt.c                           |  2 +
 drivers/of/of_private.h                    |  2 +
 drivers/of/of_reserved_mem.c               | 48 ++++++++++++++++++++
 include/linux/crash_core.h                 |  2 +
 include/linux/memblock.h                   |  9 ++++
 include/linux/of_reserved_mem.h            |  1 +
 kernel/crash_core.c                        | 51 ++++++++++++++++++++--
 kernel/dma/contiguous.c                    |  1 +
 mm/memblock.c                              | 43 +++++++++++++++++-
 14 files changed, 155 insertions(+), 97 deletions(-)

-- 
2.43.0

