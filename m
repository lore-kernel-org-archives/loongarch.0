Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com [209.85.210.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1F1737F01D
	for <loongarch@lists.linux.dev>; Wed, 27 May 2026 03:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779852576; cv=none; b=MBkzwNR/gEK6132COD2P5k5cmZn5+nM0gRp7lVBukQnu1IQ1EIqsnlwYXMNVUc4J0xgXeehvjr1eLtcHcNYwxDO69mJpTwYk1+yTt6NlBFFtOShpX3utcsJgRhHjzU2gaZEHjl9Nkn6jsKPQcAD6J7Z59ygZgOUDMJ5hx8r01Lw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779852576; c=relaxed/simple;
	bh=NbPPm51uUAHAnIIFUegQN+gxWwVGNmdlYb+vntB/5X8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VsrZJvSIFXYCYlxoiupD7OxIWV5sQpd9rEF8uIBPMRGBQ6J+CkZJhJzfSVEDXi7kImtbNC2iHSAJtrQ0MeEDDyzBqgCPxgVS1Vnv+4G0wzQphWC3yq/zqS1im60rdCwvjPzjUnjl4kGjmJ9pW+QsAyBBn3ZYQagE9zkynXbEuLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VquhlTNT; arc=none smtp.client-ip=209.85.210.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VquhlTNT"
Received: by mail-pf1-f193.google.com with SMTP id d2e1a72fcca58-82f8893bff3so5229062b3a.2
        for <loongarch@lists.linux.dev>; Tue, 26 May 2026 20:29:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779852571; x=1780457371; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NK9+MAufae3OUHglq3BxF1m5jq3s3djB2nPaLW09hjI=;
        b=VquhlTNT6a/OY+/Lk4gEls5El27VOKesSVMkxE6Q7Lt0Mphq8VJfaJaLn64LRaieUi
         5fOx+t2AOgo19W7mmPvn23LIzA8mdyt0PLHOEL44c+HLAtAkKjlglppU35aInbH+7ZkL
         9+g91+m64jGqiqNo8gqx1+ufShmQVBs49UWyFqSKq3Bg4cnIXOjxpL4OH4tqJTU8/gzL
         5nKv9UGF+fkVLCEtDaPDnCo3UgCHPfd6+qPZftZ4twY4Cz8rI68aPA6eMCz4+N/2NGXU
         weuRjAfAbfu1j//2C+x0QG1maWky/x+Q+pZmCi2xap3rS6NdQhns/s5YZ43ZX0TCUO0L
         lonw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779852571; x=1780457371;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NK9+MAufae3OUHglq3BxF1m5jq3s3djB2nPaLW09hjI=;
        b=qm67qohVp2Xsiw0y66Pk0acDJjIDfOTzw3+wPZt/LSQaWt97v3ZGcx4qzQpGnFiE40
         Fm1IJ7rYs2IgVuDup+pI0WOz4Kpf6ZjXJD0uKmCB4FL8vSUuBidfKIcYAYrawI4ZePQ/
         mg06iKmrhdJY9f5De5l90sUTs2dpIm2kAaQ1OzZjhkJor9AaPQUxP+JqVZmW0nMgARqv
         YVkcB6MaiuU+QS2X1zvGWe69FeJNlKerpFbhxg6euqQ15ZX8EstfhoxcH5fkt1OkRwQ7
         eRVrEwCPHlbyLY9dWMjvfbA3jBJsSto8NDaj/QpJp26IK4WndYFpRnPVERU6Ht+Pw/9I
         D+HQ==
X-Forwarded-Encrypted: i=1; AFNElJ8ovlpw55lwTyTSFNVZm5FHikd2KcSR8IWpqXr9+jCXnxyA3HygIcxNyBtZJww3wIl6koqrKgxXRzg=@lists.linux.dev
X-Gm-Message-State: AOJu0YwDdWA6Ciy11jpgu9ljYyowddC/HyXKKyLOuxeZvhjeAT9uBkYt
	jRmwt7Rfxri+CYUh7Fg5yW0mXARRQFvZrUn4pZ106ECHt8rGSSdZHQ3v
X-Gm-Gg: Acq92OEmAqNX1NZgYIyjV12bgRXNEYpS8Q03EmC52+pyFnPsKoIaXxYl5+OwcpVkVlv
	xA8eueSr7G4U/OuIuEphEIgVzJdxbNoQ7SNbroM6Dyll9JQAGf2AueIF66aG5iCsMNO4xlhPC3d
	FBQkK34jz/EPvnmtOlA7RO8fhmhKdSMyreupyejglpRT7oXorZRMlae2qYUOrXMFraHzjXjRlDf
	WisQv4L+UUWAvfsdb8fZAafqgs6GQD0ZmUIC9C6hZhXO1MODXooIpmt5wRZFVGsJxmfdHFVyP10
	yJOSHg3OX99Lgy4Q4iX4ZgFLAdQR2SEzSQRboWw2JhXYsj+dKn0ZNIAY5ZVxwXGc/0yJU2ByPfu
	RYLngvs0ntGtsYwZ+mcHrxhFhWzNL005G/GQrhHWFAwzstH+lQjMSflbcVUsnoVX8g13iLmkYzg
	u1C1iqBou77VwtPuA63xMX4fwVjVQOuhkV4H9IYYLyEhzjQEc=
X-Received: by 2002:a05:6a00:4f94:b0:82c:6da7:2d3d with SMTP id d2e1a72fcca58-8415f3d0e36mr19286959b3a.11.1779852571354;
        Tue, 26 May 2026 20:29:31 -0700 (PDT)
Received: from intel.company.local ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-841d7307596sm749688b3a.59.2026.05.26.20.29.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 20:29:30 -0700 (PDT)
From: Wandun Chen <chenwandun1@gmail.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	kexec@lists.infradead.org,
	iommu@lists.linux.dev,
	zhaomeijing@lixiang.com
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	robh@kernel.org,
	saravanak@kernel.org,
	akpm@linux-foundation.org,
	bhe@redhat.com,
	rppt@kernel.org,
	pasha.tatashin@soleen.com,
	pratyush@kernel.org,
	ruirui.yang@linux.dev,
	m.szyprowski@samsung.com,
	robin.murphy@arm.com,
	quic_obabatun@quicinc.com
Subject: [PATCH v3 00/11] kdump: reduce vmcore size and capture time
Date: Wed, 27 May 2026 11:29:06 +0800
Message-ID: <20260527032917.3385849-1-chenwandun1@gmail.com>
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

The series is organized as follows:
Patches 1-3: Pre-existing fixes and a small prep change.
Patches 4-5: Restructure to allow appending /memreserve/ entries.
Patches 6-7: Add a dumpable flag and append /memreserve/ entries.
Patch 8: Add generic kdump helpers.
Patches 9-11: Wire the helpers into arm64, riscv and loongarch kdump
              elfcorehdr preparation.

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

Wandun Chen (11):
  of: reserved_mem: handle NULL name in of_reserved_mem_lookup()
  kexec/crash: provide crash_exclude_mem_range() stub when
    CONFIG_CRASH_DUMP=n
  of: reserved_mem: avoid post-init UAF when alloc_reserved_mem_array()
    fails
  of: reserved_mem: zero total_reserved_mem_cnt if no valid
    /reserved-memory entry
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
 drivers/of/fdt.c                           |  11 +-
 drivers/of/of_private.h                    |   3 +
 drivers/of/of_reserved_mem.c               | 117 +++++++++++++++++++--
 include/linux/crash_core.h                 |   6 ++
 include/linux/of_reserved_mem.h            |  15 +++
 kernel/dma/contiguous.c                    |   1 +
 9 files changed, 157 insertions(+), 12 deletions(-)

-- 
2.43.0

