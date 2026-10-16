Received: from mail-pj2-f6.google.com (mail-pj2-f6.google.com [74.125.227.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F7B0391E73
	for <loongarch@lists.linux.dev>; Fri, 16 Oct 2026 03:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.134
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792120154; cv=none; b=TSfJW02PG2CHE/tCgNrwiqO/CNhdzEeMC3gaeRcPQr/9T+QzQyvUKyJmzgV4ssj7I0bxddxRuUiwe6jQ1a49T3G+lDbTmXtvVfIKVyM4PvK02s+ZJS0EQFwXc4tTGGoAFHW7kdCAzKa6OCyKi8cCfd6VtlNXEfq5aBoQkHuJfWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792120154; c=relaxed/simple;
	bh=PpYg3/Cmk2CzPlG98OVhEDOXoUWD9dGaoWaQvMSxYs8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jeyUicS98mEuCafaOIvVmn94L9DFq2LmnPqnxCZA+2FS8LYgvIuXFMQNetT/+YcKl2oJqbp7jXzx7Gc5BKHHbr3/TnxDtv9R9odW9BCn6AyygZtR7pGclu88fCRPBQMNpmHyG2eNxH6fRC4OX+Odufe/YrC/eN60CBkoHvsBX70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JB5CV4wC; arc=none smtp.client-ip=74.125.227.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JB5CV4wC"
Received: by mail-pj2-f6.google.com with SMTP id 98e67ed59e1d1-3acc610014eso196356a91.0
        for <loongarch@lists.linux.dev>; Thu, 15 Oct 2026 20:09:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792120153; x=1792724953; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ed5L209SneTzZcWvCiPDVyFxWV1jqEY6cKUsalB6bvY=;
        b=JB5CV4wCkGIhJRYmj+YGGHiy2T+FGWqvT49Fy+jVyZo9tBoQsI7zupJvl9onnY5F/J
         Czeqy6XpTR59GSzTqVbOyUUuvOOJqXf9q9fYWgrItRXloMyR/EwLnLL/W3Mej0dnsfPw
         dHataR9r2loHdvtjHplc87EFUFJ/ZazlfEgApl0VPCcZ02uo51lgN3NjEs0XSWIJ/kNU
         oxzUKXs7Oa3bXP0aR/N8HAHfIBcDF4t6VMj2WIkk1JV807yN9rZoeFEdIzqZPTk/jrMe
         Ob+RXYw5XYRWee7b7sMqloiRYR1Qwphv4NmFe4gqWnW31p62EIXkfLC+vns+KwEDBBYK
         RH5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792120153; x=1792724953;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ed5L209SneTzZcWvCiPDVyFxWV1jqEY6cKUsalB6bvY=;
        b=GR2KxwpLPRhVek81Y412L/f14jFEEfZA4B7CnBRUMkbHzU1IDk6ishPQumwB3DRhQ2
         6SexVQeGneaV4mAmmgeNk/k443ygmsxLM4EHr1Z0HM37BmeNy35LM0UbWC0x/I6K1fZK
         fTdYhsRybWb8hv1Mss5tEIQmZCj6qCmFf6UFkydTRRqIJnmK84sxzk866U1aaaU60nlE
         K9QTdfPSy7rPp4XzuBns5sdeqCRYOZ9UvqRVekB11QLjhRmLkKDAs3avUJVmnzXaYVmF
         wn1tJhDOKLExJVg3GXhGpgshVXyDwpO6BKPP1uWS1wg57DtMyXIgQWQLNm02qdz1V95P
         bngw==
X-Forwarded-Encrypted: i=1; AKwUvBwfMQEemYUE3O/1iHsVjoBmcPr02oxvd8G2YvS0zvhRfYIeSjYN7PdSzd257adhNaS1B90aPRweWuw=@lists.linux.dev
X-Gm-Message-State: AFq9FYKx5TSRtHR3gx5URR4MID5pjNpHvtPo277eVtLW2wTU5lTcuMIe
	gtN2tPAbf3GWFJ+F68sLtYJEpYwM76I6r5HmuOa+vnBD7GFl3luo0xUL
X-Gm-Gg: AYBFou3pJMHzkSLrMErqE2m7l610Nh9mFaDTxi3lnhbxDhbOCnB4xNrVK5OHREXdXET
	3fknlyBUDWulEC7xbgYLOnwJYFLXheBoe3QNi9t1V8LRygItabskBXhvS4T3UcBOwdp2m2gdiJ1
	7OQpxzQ9WVZAsKV1EBjvGdUZnUFl8A7Z5tx/6vWjwTQ9VINFdDmSZq1b32i39Nezuf6LaPQIK4H
	7kOT8b7DG0edON6PjZNfGbYwcISQjo3/054FwuYvOsQe1epdbQ+Luqidev1SlnnHBS/czdXxjI+
	L+F7gadwNwtKixVuMWVUsMD4n5Mkd4Xto1MrWAWeAKVskxDXgmMJ76Fv2fpFtB5GIAGJSaklqiL
	0rg6cXF74Ti4/vFhVsFiy2sq/nmUm8qpVmMufW8ROMPCRd9HYoj55WgJRxbdFc1rl7346nGnT7N
	ZlqgU+JwVqvLVczKdme5AITBczgJdfrjSd76hVGnrkN/qXGXFIcZrdqmCg2H+ocMB1rnkDDpAzo
	VKxmb50Wuq9X50ruWDgVA==
X-Received: by 2002:a17:90a:d44d:b0:3a4:b0f3:6597 with SMTP id 98e67ed59e1d1-3ab39fea5c6mr19481452a91.0.1792120152572;
        Thu, 15 Oct 2026 20:09:12 -0700 (PDT)
Received: from intel.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acd3cc73c7sm370085a91.4.2026.10.15.20.08.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 20:09:11 -0700 (PDT)
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
Subject: [PATCH v8 0/8] kdump: reduce vmcore size and capture time
Date: Fri, 16 Oct 2026 11:08:47 +0800
Message-ID: <20261016030855.4062882-1-chenwandun1@gmail.com>
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

v6 --> v8 (v7 mainly tried to fix the initrd issue on release in v6,
that approach is superseded here):

1. Stop marking /memreserve/ regions with NODUMP. v6 marked
   /memreserve/ regions with NODUMP. But a bootloader may specify
   a /memreserve/ entry for memory that the kernel later frees
   (e.g. the initrd), and those pages would then be wrongly
   filtered out of the vmcore after being reused as normal memory.
   The v7 fix (clearing the flag in free_reserved_area()) caused
   a lockless runtime mutation of memblock.memory [1]. Better solutions
   exist but need extra preparation, so they are left out to keep
   this series simple in v8.

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

Every patch in this series now carries an Acked-by or Reviewed-by tag.
Patches 2 and 3 have changed since v6, but the changes (a build fix and
a riscv hotplug adaptation) do not alter the logic the tags were given
for, so their tags are kept. If any tag should not be carried, please
let me know and I will drop it.


v6 --> v7:
1. Fix a stale MEMBLOCK_NODUMP flag issue [2]. Memory reserved and
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

[1] https://lore.kernel.org/lkml/20260922090252.B01541F000FF@smtp.kernel.org/
[2] https://sashiko.dev/#/message/20260917220750.GA4013814-robh%40kernel.org

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
 drivers/of/of_reserved_mem.c               | 15 ++++++
 include/linux/crash_core.h                 |  2 +
 include/linux/memblock.h                   |  9 ++++
 include/linux/of_reserved_mem.h            |  1 +
 kernel/crash_core.c                        | 53 +++++++++++++++++++++-
 kernel/dma/contiguous.c                    |  1 +
 mm/memblock.c                              | 16 +++++++
 15 files changed, 100 insertions(+), 94 deletions(-)

-- 
2.43.0

