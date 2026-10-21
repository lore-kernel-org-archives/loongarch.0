Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.228.2
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792571431;
	b=jYE2NVfaumZUTAytmxueYDk+fd0NreJtBl8oSARb+Hy4IuHBvyWkysggTGiCR6n9ZUEZ
	 7PZj0CxsduuQgTfTV0Xf3sEOJ2WlrJQYPn62BOG/f6462qBonYfJXZ1oHu7SYS8jrj9hN
	 ySbkuhYLchIYr7U/609zqT92GesyrmgnXZnXgg98r6Do3OLQKN7aNon4PQIC+CXIkD8nO
	 ye2bneeDA6LqulJOw1qh8hktGmbNTQz+Lng6rI75UihrHbLMyxCFCYYAZeCHww8tXY9if
	 3x5cgKgh/+CLCNLVPxKeNtdz+ia3W8RHyJNMwujAJ564YkNL1iMpPKs3LyOwp3/lGZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792571431;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=z2i7Do+cloqJgPeb5aYLDs8IqOGcJVVvWxpYdA4Y6+Q=;
	b=YZWId0O0O/CC1f8dqMzejKnTHtifeBjwI9zhGCWu2ZBLydqQ73T2C5mKpbyZT5eU1lJK
	 OmILP6sv2Rt8wUOpsrtMm8voaHwBgoW0/49VusufhOSMrOM2J47LXaFZ+iJt0i+rDgdFB
	 Gu1SnRJ2wcK3BPbWtEPBR1PxUQjGdSpZZ2APffkWrhOJD50AG0j0RTT9fYtXNNqv775bP
	 SObBzElymXAq06VkPmEqjyecpXv0uRiFxwegdigcJZrpgCobJjDgukP2oazFF/4AC2Kja
	 q1msW/asjnCRhfenkQbzh/fR1QtM419EtR4wDWwvMpJWwQbskPBC9nZzUgWMvHHsmlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=C3X75oLK;
	arc=none smtp.remote-ip=74.125.228.2
Received: from mail-pz2-f2.google.com (mail-pz2-f2.google.com [74.125.228.2])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8A32606A31D
	for <loongarch@lists.linux.dev>; Wed, 21 Oct 2026 08:30:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8A32606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=C3X75oLK
Received: by mail-pz2-f2.google.com with SMTP id 41be03b00d2f7-ccc451ef3a7so38480a12.1
        for <loongarch@lists.linux.dev>; Wed, 21 Oct 2026 01:30:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792571430; x=1793176230; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=z2i7Do+cloqJgPeb5aYLDs8IqOGcJVVvWxpYdA4Y6+Q=;
        b=C3X75oLKXR8/5+DI3bIoPwiWXV9ReiT54/GW5X+uM2BDMwnnTnHMyKZfFBZ0aMZkJO
         WL9XPiMBtr5rNbvg851386WFWRhnk2sESIy6cp+S7kwQGR47FL35AmK63WMecVN5w+lC
         gVOW9zOgZ/Wz19gKZCK33zYSFHYMg1BzmrMft4DuZJzleCONaigcRsF0aaIpiwWmlCKZ
         YHd9SgDvtlGJNDabQXuMXg/Mfk3g+R/BlsN1VbYeMgRi+FfJ+4bm9Mrg8nniEVr7rnj2
         Yg5AgKPJaaF7ToADURgC81YxVoOBdMKwAq6PN+W8w38wzd5R9sSnijg5bUkZ/eMctDQ/
         yBAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792571430; x=1793176230;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z2i7Do+cloqJgPeb5aYLDs8IqOGcJVVvWxpYdA4Y6+Q=;
        b=mBNBU6KOJHm/PmF8CD0V2bGa4Ky7XBimeqiczBjvPFwEnEnAw0O0lFdHY1gU3hUUHQ
         aZKZiAfVtr1CmTiG0aCaUcaSgaM15M3eeXgmZiZJpILxJxyySSB+ZszAEyXQUvZCwvGX
         FEs1cHqbhZz80RxJZEW8v99ykiLqzYlep0g8SFVKg9bZ0zzWQe0M8GeDEmzM+dwmoxDJ
         QYRtQt0nBenHGfHcaKtvSim9CEp7y5sF1OSi48Bl0ssifEuXtU6FOHVG+MmezueR51UN
         sK5bVoRKyBpKGj1jQhpqB/YAIASkuKtPbQbPHOEGwSDeo06eHZZqakNM8Tf1GK9CdcuP
         89hQ==
X-Forwarded-Encrypted: i=1; AKwUvBzgeQXKXbM6OHAjPa3g6GP3knWxbpeDODyPbUeTHCHZ7PJ4bDmWX0G/mSRobRjUxYxSHfiBlc4j948=@lists.linux.dev
X-Gm-Message-State: AFq9FYIo2cZKHlrozDiamw3UAh96oP7H7DeiltkiYv5LHbg1YIerrZPG
	dZ/FpYmVJXLLvF61oJzOUhu75bNo173+TqERiaPeDcfBEU22T4G0Rrwi
X-Gm-Gg: AYBFou37Xjtrl2DHoQkyXp+35D4i67R1WIshniibwq7qeZyTLUDRoQlBLpbIM/3Y/qc
	qMzqP8cJC6mUWAdt8xMZVYxCLcCYCN3BfVf/WSz65okrEcsJygt1P/2CGLBKJ/609b5VyHwp0yo
	4QVmsc2wURVedAPIlIR2pZlRn8hg7beM9YWG6BauRb26cCRflXT+avFCMUnmuvi45QdZ1I/rrPX
	5ASb1vsTCfG+7WDnp0M0fiykfzPpFZh5ecMHUwn/ZAbt9uIz+1ef3RT14XEUK3c/QE5GAM7JrrF
	9ThzD8VsnEB+rZwG67wredGt7aSaK9AwHAYBVX9eeYMS4Y4th18aCiclej2OWfA9995h/IoFrd4
	qkx+SoX+1KYsktlol/729xxtbaS0XqrtblH0jGs23gwh1i17cDRvl7r2HNsDHAm8gXQZ5Gom9hD
	JnfGo6NBuAA9+UJrOUF2m9QOJBybX3QVfKu0ITIZbujElLFti2AQMQfvpwyp0foVo+wPWSM+WX+
	/16rVotwjRWR+q37vnmv4EDLx3OfoOh4SjnEJj3wqlAgy0HAmBky7RUeK7mwjHdH97P
X-Received: by 2002:a05:6a00:918c:b0:8a0:2344:c44b with SMTP id d2e1a72fcca58-8a089d5de3cmr958437b3a.40.1792571429981;
        Wed, 21 Oct 2026 01:30:29 -0700 (PDT)
Received: from intel.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a0895e273bsm600653b3a.41.2026.10.21.01.30.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 01:30:28 -0700 (PDT)
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
Subject: [PATCH v9 0/8] kdump: reduce vmcore size and capture time
Date: Wed, 21 Oct 2026 16:30:03 +0800
Message-ID: <20261021083011.2170525-1-chenwandun1@gmail.com>
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

v8 --> v9:
1. Patch 7: Avoid a potential boot panic on SH when NODUMP marking requires
   memblock resizing before it is allowed, found by Sashiko in [1]. SH supports
   neither CONFIG_KEXEC_FILE nor CONFIG_CRASH_HOTPLUG, so skip marking when
   both are disabled.

v6 --> v8 (v7 mainly tried to fix the initrd issue on release in v6,
that approach is superseded here):
1. Stop marking /memreserve/ regions with NODUMP. v6 marked
   /memreserve/ regions with NODUMP. But a bootloader may specify
   a /memreserve/ entry for memory that the kernel later frees
   (e.g. the initrd), and those pages would then be wrongly
   filtered out of the vmcore after being reused as normal memory.
   The v7 fix (clearing the flag in free_reserved_area()) caused
   a lockless runtime mutation of memblock.memory [2]. Better solutions
   exist but need extra preparation, so temporarily dropped the patch
   that introduced the problem to keep this series simple in v8.
2. Fix a build failure in patch 2 with both ARCH_KEEP_MEMBLOCK and
   MEMORY_HOTPLUG are unset. There the memblock arrays live in
   .init.data, and the weak defaults referencing them create section
   mismatches, which turn into build errors when SECTION_MISMATCH_WARN_ONLY
   is also unset.
3. RISCV recently gained crash hotplug support, so adapt its handler
   like x86 in patch 3: use __crash_prepare_headers() instead of
   crash_prepare_headers() to avoid self-deadlock.
4. Update the cover letter per review feedback: describe how ACPI
   systems filter reserved memory and why a new flag is needed
   instead of reusing NOMAP.

v6 --> v7:
1. Fix a stale MEMBLOCK_NODUMP flag issue [3]. Memory reserved and
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

[1] https://sashiko.dev/#/patchset/20261016061549.4181390-1-chenwandun1@gmail.com?part=7
[2] https://lore.kernel.org/lkml/20260922090252.B01541F000FF@smtp.kernel.org/
[3] https://sashiko.dev/#/message/20260917220750.GA4013814-robh%40kernel.org

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
 drivers/of/fdt.c                           |  1 +
 drivers/of/of_private.h                    |  1 +
 drivers/of/of_reserved_mem.c               | 18 ++++++++
 include/linux/crash_core.h                 |  2 +
 include/linux/memblock.h                   |  9 ++++
 include/linux/of_reserved_mem.h            |  1 +
 kernel/crash_core.c                        | 53 +++++++++++++++++++++-
 kernel/dma/contiguous.c                    |  1 +
 mm/memblock.c                              | 16 +++++++
 15 files changed, 103 insertions(+), 94 deletions(-)

-- 
2.43.0

