Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.218
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794490481;
	b=Aw7gVtBZDlPGiA2fq9wPpChwVGSF5uGGuakZg/siwpA6ooJJsBdxlckFNP3iCIVoEaue
	 6Y3kRt0IYgdCamZGRWAc/JpnG/UkQoBaz9XsK6c5l6a957tEXINmf+BKHuB4yZnlj1Q3A
	 FLI46w1yqFHmk/MNhJeNWn/UTtWNAA4NZElSa0bTZNSsip+boIqLGyGusvW86d+/BGLbL
	 a6YqmhcmgV4is7kEBThL9WMv1GFoovK7EJSvqhiUzkowVFzH7ZLeCYI78t7g/77TnxXxl
	 F1qlQ57axToGwDnNHnHedM7GFIM92bS5EFuUnd+QjmlUKDT06/R6Fh4anZjJ434oL6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794490481;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=ZBHTfkePstkdhYPStihPwpZhe6evYsJ4HxGFWI7xQIQ=;
	b=aY0HFQDJU7lU7hF3PXOAMmrdntzOB3Ha9J5BczQrBFiw59bIicQcvxsqIEBNCOr4dIp3
	 5kTya0lst5Bi/ltMOR7YwMoR9L7hnkuuNVSX7eu2ZXTWqZj6c1mW/lMwQbw86m8XCt0pa
	 o0OKiP9BD20vA/Gp0XuItbm29BvKXeP8U4MegcDwSm3wYB1AA9yIrGq/WpnKYnxkfj+DI
	 QyL9ttrTKl0RTmBbyeBcqCzDR5H6nKYWN4aP4gqiR4/34w/rm1Yb7XbA6VBghxRP1QAaw
	 V7xcRZxspyB4rOrG84KejI6xK1KGKp4JWebfWU0dmN/L+vmkcIDTlAhb3ORl2fJDwvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=WXo9wn0N;
	arc=none smtp.remote-ip=113.46.200.218
Received: from canpmsgout03.his.huawei.com (canpmsgout03.his.huawei.com [113.46.200.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1AA9606A31C
	for <loongarch@lists.linux.dev>; Thu, 12 Nov 2026 13:34:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1AA9606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=WXo9wn0N
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=ZBHTfkePstkdhYPStihPwpZhe6evYsJ4HxGFWI7xQIQ=;
	b=WXo9wn0NXhZX7pp7ZUMh/iOPIRLVlUIH2p8LTgXE7ANDOBqTMLMcJn+ioAx56LEYcQClNy3LR
	fhpJPlEmx97/Kbdl53DCIYli9z7cMxKnOY197T93hS34sNl3vH29acpUDwGroc1TguVRSPeD6C6
	amzAd2VIz8neRJeZS5pH9T0=
Received: from mail.maildlp.com (unknown [172.19.162.197])
	by canpmsgout03.his.huawei.com (SkyGuard) with ESMTPS id 4jQLvT1RGbzpSt9;
	Thu, 12 Nov 2026 21:33:57 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id B50E040579;
	Thu, 12 Nov 2026 21:34:36 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 12 Nov
 2026 21:34:35 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <mark.rutland@arm.com>,
	<chenhuacai@kernel.org>, <kernel@xen0n.name>, <maddy@linux.ibm.com>,
	<mpe@ellerman.id.au>, <npiggin@gmail.com>, <chleroy@kernel.org>,
	<ritesh.list@gmail.com>, <sshegde@linux.ibm.com>, <pjw@kernel.org>,
	<palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <alex@ghiti.fr>,
	<tglx@kernel.org>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>, <hpa@zytor.com>, <akpm@linux-foundation.org>,
	<baoquan.he@linux.dev>, <rppt@kernel.org>, <pasha.tatashin@soleen.com>,
	<pratyush@kernel.org>, <ruanjinjie@huawei.com>, <leitao@debian.org>,
	<yeoreum.yun@arm.com>, <mpilaniy@redhat.com>, <robh@kernel.org>,
	<coiby.xu@gmail.com>, <Yeking@Red54.com>, <prudo@redhat.com>,
	<brads@mainlining.org>, <sourabhjain@linux.ibm.com>, <mkchauras@gmail.com>,
	<blum@kernel.org>, <adityag@linux.ibm.com>, <qirui.001@bytedance.com>,
	<hui.wang@canonical.com>, <sohammetha01@gmail.com>, <guoren@kernel.org>,
	<gaohan@iscas.ac.cn>, <ionut.nechita@windriver.com>,
	<vishal.l.verma@intel.com>, <seanjc@google.com>, <ardb@kernel.org>,
	<richard.lyu@suse.com>, <arnd@arndb.de>, <tzimmermann@suse.de>,
	<rick.p.edgecombe@intel.com>, <kai.huang@intel.com>, <kas@kernel.org>,
	<piliu@redhat.com>, <thuth@redhat.com>, <shradhagupta@linux.microsoft.com>,
	<ebiggers@kernel.org>, <jbouron@amazon.com>, <me@linux.beauty>,
	<mclapinski@google.com>, <graf@amazon.com>, <tangyouling@kylinos.cn>,
	<x86@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <loongarch@lists.linux.dev>,
	<linuxppc-dev@lists.ozlabs.org>, <linux-riscv@lists.infradead.org>,
	<kexec@lists.infradead.org>
Subject: [PATCH v8 00/11] kexec: Rework segment loading and fix CMA retries
Date: Thu, 12 Nov 2026 21:34:07 +0800
Message-ID: <20261112133418.4044428-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
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
Content-Type: text/plain
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemk200008.china.huawei.com (7.202.194.74)

ARM64, LoongArch, RISC-V, x86 and powerpc build the elf core header
and place it together with the initrd and the DTB with almost identical
code.

This series reworks that path into common helpers that the architectures
reuse, and fixes the CMA page and elf core header leaks in the arm64
and LoongArch placement retry loops.

The patch organization is as follows:

- Patch 1 moves the release of the elf core header into the generic
  post-load cleanup, so that the architectures no longer free it
  themselves.

- Patch 2 adds the common helpers

- Patches 3-7 convert arm64, LoongArch, RISC-V, X86 and Powerpc to
  reuse the common helpers

- Patches 8-11 fix the CMA pages leaked by the retry loops and
  the loop that makes no progress

Tested with kexec_file_load() on arm64, LoongArch, RISC-V, X86 and
Powerpc under QEMU, including the CMA retry paths, loading a crash
kernel and booting the second kernel, with the agent help.

This series is also available at:
	https://github.com/ruanjinjie-eng/linux/tree/kexec_rework_cma_bugfx_v9

Changes in v8:
- Rework the common code as Mike suggested: the core provides building
  blocks and the architectures uses them (Mike)
- Build the elf core header once and only place it on the retries (Mike)
- Keep the segment order and the arch placement policy unchanged (Mike)
- Convert x86 and powerpc as well
- Move the CMA fixes to the end of the series (Mike)
- Link to v7: https://lore.kernel.org/all/20261026075201.699550-1-ruanjinjie@huawei.com/

Previous Versions are as below:
- v6: https://lore.kernel.org/all/20260921090450.807575-1-ruanjinjie@huawei.com/
- v5: https://lore.kernel.org/all/20260918100442.3841135-1-ruanjinjie@huawei.com/
- v4: https://lore.kernel.org/all/20260907125404.922123-1-ruanjinjie@huawei.com/
- v3: https://lore.kernel.org/all/20260826092541.3905933-1-ruanjinjie@huawei.com/
- v2: https://lore.kernel.org/all/20260729031235.2840255-1-ruanjinjie@huawei.com/
- v1: https://lore.kernel.org/all/20260723131242.1537633-1-ruanjinjie@huawei.com/#t

Jinjie Ruan (11):
  kexec: Free the elf core header in kimage_file_post_load_cleanup()
  kexec: Add helpers to load the elf core header, initrd and FDT
  arm64: kexec_file: Load the other segments with common helpers
  LoongArch: kexec_file: Load the other segments with common helpers
  riscv: kexec_file: Load the extra segments with common helpers
  x86: kexec_file: Use the common segment helpers
  powerpc: kexec_file: Use the common segment helpers
  kexec: Extract kexec_free_segment_cma() from kimage_free_cma()
  kexec: Add kexec_rollback_segments() helper
  arm64: kexec_file: Fix CMA segment placement retries
  LoongArch: kexec_file: Fix CMA segment placement retries

 arch/arm64/include/asm/kexec.h             |   4 +-
 arch/arm64/kernel/kexec_image.c            |  15 ++-
 arch/arm64/kernel/machine_kexec_file.c     |  87 ++++----------
 arch/loongarch/include/asm/kexec.h         |   3 +-
 arch/loongarch/kernel/kexec_efi.c          |  15 ++-
 arch/loongarch/kernel/kexec_elf.c          |   3 +-
 arch/loongarch/kernel/machine_kexec_file.c |  80 +++++--------
 arch/powerpc/kexec/elf_64.c                |   9 +-
 arch/powerpc/kexec/file_load_64.c          |  18 +--
 arch/riscv/include/asm/kexec.h             |   4 +-
 arch/riscv/kernel/kexec_elf.c              |   3 +-
 arch/riscv/kernel/kexec_image.c            |   3 +-
 arch/riscv/kernel/machine_kexec_file.c     |  83 ++++----------
 arch/x86/kernel/crash.c                    |  25 +----
 arch/x86/kernel/kexec-bzimage64.c          |   8 +-
 arch/x86/kernel/machine_kexec_64.c         |   4 -
 include/linux/kexec.h                      |  14 +++
 kernel/kexec_core.c                        |  25 +++--
 kernel/kexec_file.c                        | 125 +++++++++++++++++++++
 19 files changed, 254 insertions(+), 274 deletions(-)

-- 
2.34.1

