Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com [209.85.210.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3635B39D6CF
	for <loongarch@lists.linux.dev>; Wed, 29 Apr 2026 06:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777445926; cv=none; b=ikTRuvbaIujdYt4Qfi9YNuUCYVPUvJycy0EL1GWQNu/G6ADVfQx8lCuqxUEVT0CWIXOix/4p0Q1/p3QNoZYrqdMK75Zum8cdCtPhKYicMSFtnyiwgBg2SpeJyegaZ3cPgyWtd3e5w3wQtJ1pxSqnAqNtvBS6ZuvaQf+LiYfm0Qs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777445926; c=relaxed/simple;
	bh=z8QrbyEQ9Qhmn8e7bcE+J1PUsYSh4gHOBxd0HU0dPH0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JRmm4cEu461cvZyEPLcptdlCCvQpXWn2z39+cuqykQeoz2HmfCWiMlKWfckdGfZMZnfD6ygUQZoiSXTxNRkJOZgUsGS6I0i4ICZWJYNatIrxeh7hT1VO8W9PN9C5brsAPfcK0fF7HvFz/xn9ztgz9+E5TKpKS99IbVSiJ4ypPd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oRQiB6No; arc=none smtp.client-ip=209.85.210.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oRQiB6No"
Received: by mail-pf1-f194.google.com with SMTP id d2e1a72fcca58-834da62e52dso976548b3a.3
        for <loongarch@lists.linux.dev>; Tue, 28 Apr 2026 23:58:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777445924; x=1778050724; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2YAMiQdl0y9iAuHJeag5d0legeH39piZcT0MdhE3hIc=;
        b=oRQiB6NoAhFTuj5BzBdTMP82FAMDeScEfh38YZDs77pB2FQOJnu5g29fFEOtvj2CnI
         sjESqoBZrT3YkFXFRNutRkQeNmkkFevWAzD9pGAlQbfNjZKy7vPnD7FQxujTd6EUFRsd
         PuUIPMyKZ/PZMmfc5P9aYWx9CZA4QVHTaNGL+xCbCYZmpMn3zJ+pTQ8MzKr5Ge4awcEy
         RE4Te1tAZhEgmfP0LIOREF7uaNoyM6hI/Ni46cDxdvOXU6x7PCKquhrp5l1yWWaF5gOl
         9Pv3p37BHmCeT8hVqvnA/gJahdKhroceYHlTXfbz4yAH57jOaN4jz9mV0CvQLHOJKpn7
         evYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777445924; x=1778050724;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2YAMiQdl0y9iAuHJeag5d0legeH39piZcT0MdhE3hIc=;
        b=dWl2SFeGTcNElW8gNTimEt60j5XGXU2TPI8FE+Mn7RA2wIAVXX1a0aXKguDmMCjCH4
         LpkPYvXnG5jcu2T0SsIKW+32kI7I9tt/L8nyTjqEvzB+6rGBYhlQAMTkhTpgPQBW6+lF
         XcJcWN//g2vqasFcqY7aUjtbk/5RCZxFD13ew305kYYsUk7O7pByi/Z0DvuBjYjOYBJr
         1jgxc6l4ym6wdlDc0RhRlIAAIkoLIlNrWTpHkOnXu9SI7QJJjGxODttKlmf8u4f01WnK
         8OsfToF5HhqrdeiqP2hAgvSVt4vscbo9OSscG6AiBoi684VHzbWxvS4ND23jgj6Ph7bt
         C3DA==
X-Forwarded-Encrypted: i=1; AFNElJ864UvaqTsYduiAqpv1M2Gn+DY0E8fkJ3ioQzyv05Nbv1NAd/DLR6tUsmp+fwd2L38IX+b3N5PH03I=@lists.linux.dev
X-Gm-Message-State: AOJu0YzYfFcnBv5cfUv6wRi7gltof4X3h8UYHSMhJzLljwMfDHOCJnfT
	LSDqK2r1Q+9LoVVV4F1rKrOk7/f+17X/G87UeOPEs/hmIL96XQNv7Ss1
X-Gm-Gg: AeBDieu91JTCwUBx04RJ3MTSw0tyTwz2Sj9l5Djk5ubZj1SyzUb6YA/FMy2oYRxsZJf
	XCfVtlXSEv7VHkIgyyxZ8dVCjSHGLtxYOqsHw7pTUfJ2a92jIgzwJg3YCg1JreI5HAdQCrewg20
	qGRi07n/fJek/laYFQvM5LEj1rH0T8agJyWdDnnqI1bgfpHfM8M79Yfm6Ipy8F/3QxJ3p7OIRN+
	NwkisyN++16Dmx5UTRrwiiEKQOqBcGVBHHpAXVWEAMn/VV2dg1cOV8tpbeetpnQ+4X60vtjBs/M
	5I4Iemuggp/xSiW0SLh/NfrdsyiGwVOyuWYzcV/Si2KfmALxg7qoYGACg5qAeMy6p96MsOevzXj
	3rQd17AgoHmDnIiPhliY3VN/MT3vx6Hrh2TeSdta52VYceW5uv5pF3KDsQaOkj+wrfkbijX8M27
	WS1fLMt8ML+vbQC7AJ+iGyF35wQ8sRz/CxjSCJ4fEnqnVXs/xl
X-Received: by 2002:a05:6a00:883:b0:829:7d31:dd99 with SMTP id d2e1a72fcca58-834ddbd42f5mr6432638b3a.38.1777445924448;
        Tue, 28 Apr 2026 23:58:44 -0700 (PDT)
Received: from intel.company.local ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-834ed7eaf93sm1043146b3a.40.2026.04.28.23.58.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 23:58:43 -0700 (PDT)
From: Chen Wandun <chenwandun1@gmail.com>
X-Google-Original-From: Chen Wandun <chenwandun@lixiang.com>
To: kexec@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org
Cc: akpm@linux-foundation.org,
	bhe@redhat.com,
	rppt@kernel.org,
	pasha.tatashin@soleen.com,
	pratyush@kernel.org,
	ruirui.yang@linux.dev,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	robh@kernel.org,
	saravanak@kernel.org,
	chenwandun@lixiang.com,
	zhaomeijing@lixiang.com,
	everyzhao@126.com
Subject: [PATCH 00/11] kdump: reduce vmcore size and capture time via linux,no-dump
Date: Wed, 29 Apr 2026 14:58:20 +0800
Message-ID: <20260429065831.1510858-1-chenwandun@lixiang.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series has two parts:

 - Patches 1-4 are OF reserved_mem bug fixes and small hardening
   changes. They stand on their own and at the same time prepare the
   ground for the feature work that follows (accurate region counts,
   consistent two-pass save/reserve state, and an early-out when the
   array is empty).

 - Patches 5-11 introduce a new 'linux,no-dump' reserved-memory
   device tree property and the kdump plumbing to honour it, split
   further as:

     * Patches 5-7: core OF changes - parse 'linux,no-dump' on
       /reserved-memory/ children, save /memreserve/ firmware regions
       into reserved_mem[] with no_dump defaulted on, and add generic
       no-dump crash_mem exclusion helpers.

     * Patches 8-10: arch kdump consumers - arm64, riscv and
       loongarch each call the helpers from patch 7 in their
       prepare_elf_headers() so that 'linux,no-dump' /reserved-memory/
       children and /memreserve/ regions are filtered out of the
       vmcore ELF PT_LOAD segments.

     * Patch 11: user-facing documentation in
       Documentation/admin-guide/kdump/kdump.rst.

Motivation
==========

On SoCs that carve out large firmware-owned reserved memory (GPU
firmware, DSP, modem, camera ISP, NPU, ...), kdump currently dumps
those carveouts as part of system RAM even though their contents are
firmware state that is not useful for kernel crash analysis. On a
machine with several hundred MiB of such carveouts, the overhead per
vmcore is substantial.

This series adds a declarative way for DT authors to mark such
regions:

    reserved-memory {
        npu_fw@a0000000 {
            reg = <0x0 0xa0000000 0x0 0x10000000>;
            linux,no-dump;
        };
    };

and also defaults /memreserve/ firmware regions (Trusted Firmware /
BL31 images, secondary-CPU spin-table pens, bootloader scratch per
Documentation/arch/arm64/booting.rst and upstream DTS files) to
no_dump=true.

Interaction with existing reserved-memory flags is kept simple:
'linux,no-dump' is an OS hint, it is redundant (but harmless) when
combined with 'no-map' and silently ignored on 'reusable' (CMA)
regions whose contents are relevant for crash analysis. The 'linux,'
prefix follows existing precedents like 'linux,cma-default' since
kdump is a Linux-specific concept.

Benefits
========

 - Smaller vmcore. The excluded firmware carveouts are omitted from
   the ELF PT_LOAD segments entirely, so the resulting dump file is
   smaller by roughly the sum of the tagged regions - on SoCs with
   hundreds of MiB of GPU/DSP/modem/NPU carveouts this is a
   substantial saving, both on disk and in transit to a dump server.

 - Faster kdump. The dump-capture kernel writes less data to storage
   or over the network, which directly shortens the crash-to-dump
   turnaround. Tools that walk the dump (makedumpfile, crash) also
   spend less time on regions that were never going to be useful
   anyway.

 - No existing behaviour change for DTs that do not opt in: regions
   without 'linux,no-dump' and systems without /memreserve/ entries
   are dumped exactly as before.

DT binding
==========

The 'linux,no-dump' property is maintained in dt-schema
(reserved-memory.yaml moved there from the kernel tree).
Corresponding PR:

  https://github.com/devicetree-org/dt-schema/pull/193

Follow-ups
==========

 - powerpc also uses kexec_file and /reserved-memory/, but its
   arch/powerpc/kexec/ranges.c uses the _guarded variant of
   crash_exclude_mem_range with dynamic realloc and collects
   additional RTAS/OPAL firmware ranges. Adapting it needs a small
   extra helper; left as a follow-up.

---

Chen Wandun (11):
  of: reserved_mem: fix region count for nodes with multiple reg entries
  of: reserved_mem: reject reserved memory outside physical address
    range
  of: reserved_mem: avoid unconditional save of reg entries in
    fdt_scan_reserved_mem_late()
  of: reserved_mem: skip reserved_mem array allocation when there is
    nothing to save
  of: reserved_mem: add linux,no-dump property support for reserved
    memory regions
  of: reserved_mem: save /memreserve/ entries into reserved_mem array
  of: reserved_mem: add no-dump crash_mem exclusion helpers
  arm64: kdump: exclude no-dump reserved memory regions from vmcore
  riscv: kdump: exclude no-dump reserved memory regions from vmcore
  loongarch: kdump: exclude no-dump reserved memory regions from vmcore
  Documentation: admin-guide: kdump: document linux,no-dump DT property

 Documentation/admin-guide/kdump/kdump.rst  |  59 ++++++
 arch/arm64/kernel/machine_kexec_file.c     |   6 +
 arch/loongarch/kernel/machine_kexec_file.c |   6 +
 arch/riscv/kernel/machine_kexec_file.c     |   4 +
 drivers/of/of_reserved_mem.c               | 233 ++++++++++++++++++---
 include/linux/of_reserved_mem.h            |  16 ++
 6 files changed, 295 insertions(+), 29 deletions(-)

-- 
2.43.0

