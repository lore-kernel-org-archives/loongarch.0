Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.219
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795774189;
	b=lZB5lQnbkKh04H37ZPwtfPv2E5Sq2vCz7rfvGr9Fm1isg7bn5g7ke/Fxg29vMYlZpSVl
	 gzIGj2U9qFii/Mv6Te5x2pm3LAkXxeMkIgNzCeBXUf5VQzHEFPiViDi7CxQ3n7Z2qcZDi
	 5Mjr44v7DY04lhVsgDOdn7ySAZANWkkGNphVA71hrXD0f3ifYt93mvUsZypsHIPYkZuS9
	 Grd3CzZV7BovpnzYRN7x/kNXpVZCpWz4RJk5rcvVzAPwhLoy8Q9icPlh5ntGSZCnh5NWI
	 4s49EG8dvvSKZjpy9UnOzs5nZroeRyVy01eBYDXX+BpKGzmn50lgEd4XzAcWWvw45+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795774189;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=dGnoFEBgCVm56MkoBT8MKD0HmrV4G14vPBlnVkSOEyM=;
	b=l9/cqMb5qzZDMLwj84upUOVB0cuMuDb6CFcEiomOh1ExIIPrV1Mbq2zdHS403STC3+0X
	 fa2Ba3gxBkwVtJdbRMRmp5MVSOIcdGeHQKicA0KLlEnp+9GnphqviN6MYnhxkw4LIBQ8h
	 VNqlPqicTDnHa51PQOelSlonYqVOisKSNReVZkpny4LKHPGdRTk6xGNhhwpu23w7nUA22
	 GNEh82x2+IcLTJi0TwUZIGn61D9x+WZkDhrHS5DkL95yLMMvmsiBZtrJ9/UVxb6u5S3Hb
	 HpyxEmfLheVjHIFDJLXsW0fgvF/0EW8IwRzBdjeEa838uFEvthdQ9Zs1VVwBhvWmYEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=PKZpW3Tl;
	arc=none smtp.remote-ip=113.46.200.219
Received: from canpmsgout04.his.huawei.com (canpmsgout04.his.huawei.com [113.46.200.219])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29E19606A32A
	for <loongarch@lists.linux.dev>; Fri, 27 Nov 2026 10:09:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29E19606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=PKZpW3Tl
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=dGnoFEBgCVm56MkoBT8MKD0HmrV4G14vPBlnVkSOEyM=;
	b=PKZpW3TldN2X5Hq8Lw59PXngxZ/NF6q9MFZDm3TaZW6v5+5DT22UwdkiYGLo5bWBHxPFYrjdq
	Q+PnV4FHo7Z9HbXym1/UlUpNmCZt9cybGLXIH1Q0kQDGgGwQ41IbQ9TOdXpNAazLI02PVGG0vNQ
	akCDvdjencVBLgFg0m2/ftk=
Received: from mail.maildlp.com (unknown [172.19.162.144])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4jbTfW5Tj9z1prMP;
	Fri, 27 Nov 2026 18:09:23 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id F20F140538;
	Fri, 27 Nov 2026 18:09:41 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 27 Nov
 2026 18:09:39 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <mark.rutland@arm.com>,
	<chenhuacai@kernel.org>, <kernel@xen0n.name>, <maddy@linux.ibm.com>,
	<mpe@ellerman.id.au>, <npiggin@gmail.com>, <chleroy@kernel.org>,
	<ritesh.list@gmail.com>, <sshegde@linux.ibm.com>, <pjw@kernel.org>,
	<palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <alex@ghiti.fr>,
	<tglx@kernel.org>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>, <hpa@zytor.com>, <robh@kernel.org>,
	<saravanak@kernel.org>, <akpm@linux-foundation.org>, <baoquan.he@linux.dev>,
	<rppt@kernel.org>, <pasha.tatashin@soleen.com>, <pratyush@kernel.org>,
	<ben@cressey.dev>, <leitao@debian.org>, <mpilaniy@redhat.com>,
	<yeoreum.yun@arm.com>, <coiby.xu@gmail.com>, <Yeking@Red54.com>,
	<prudo@redhat.com>, <bradley.morgan@linux.dev>, <sourabhjain@linux.ibm.com>,
	<blum@kernel.org>, <hbathini@linux.ibm.com>, <qirui.001@bytedance.com>,
	<hui.wang@canonical.com>, <sohammetha01@gmail.com>, <guoren@kernel.org>,
	<gaohan@iscas.ac.cn>, <ionut.nechita@windriver.com>,
	<vishal.l.verma@intel.com>, <seanjc@google.com>, <ardb@kernel.org>,
	<arnd@arndb.de>, <tzimmermann@suse.de>, <kas@kernel.org>,
	<rick.p.edgecombe@intel.com>, <mhklinux@outlook.com>, <piliu@redhat.com>,
	<shradhagupta@linux.microsoft.com>, <thuth@redhat.com>,
	<ebiggers@kernel.org>, <me@linux.beauty>, <mclapinski@google.com>,
	<graf@amazon.com>, <tangyouling@kylinos.cn>, <x86@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <loongarch@lists.linux.dev>,
	<linuxppc-dev@lists.ozlabs.org>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<kexec@lists.infradead.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v9 00/11] kexec: Rework segment loading and fix CMA retries
Date: Fri, 27 Nov 2026 18:09:14 +0800
Message-ID: <20261127100925.3019877-1-ruanjinjie@huawei.com>
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

ARM64, LoongArch, RISC-V, x86 and Powerpc build the elf core header
and place it together with the initrd and the DTB with almost identical
code.

This series reworks that path into common helpers that the architectures
reuse, and fixes the CMA page and elf core header leaks in the arm64
and LoongArch placement retry loops.

The patch organization is as follows:

- Patch 1 moves the release of the elf core header into the generic
  post-load cleanup, so that the architectures no longer free it
  themselves.

- Patch 2 adds the common helpers for reuse.

- Patches 3-7 convert arm64, LoongArch, RISC-V, X86 and Powerpc to
  reuse the common helpers

- Patches 8-11 fix the CMA pages leaked by the retry loops and
  the loop that makes no progress

Tested with kexec_file_load() on arm64, LoongArch, RISC-V, X86 and
Powerpc under QEMU, including the CMA retry paths, loading a crash
kernel and booting the second kernel, with the agent help.

This series is also available at:
        https://github.com/ruanjinjie-eng/linux/tree/kexec_rework_cma_bugfx_v9

Changes in v9:
- Put kexec_add_fdt() in drivers/of/kexec.c. (Mike)
- Keep the elf core header reservation of crash hotplug in x86. (Mike)
- Rename kexec_add_fdt() to of_kexec_add_fdt().
- Drop the memsz comparison in kexec_add_elf_core_header so the
  architectures that reserve room for crash hotplug now record the size
  themselves, which fix the Sashiko issue related to crash hotplug [1].
- Update the commit message.
- https://lore.kernel.org/all/20261112133418.4044428-1-ruanjinjie@huawei.com/

[1]: https://sashiko.dev/#/patchset/20261112133418.4044428-1-ruanjinjie%40huawei.com

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

 arch/arm64/include/asm/kexec.h             |  4 +-
 arch/arm64/kernel/kexec_image.c            | 15 ++--
 arch/arm64/kernel/machine_kexec_file.c     | 87 +++++-----------------
 arch/loongarch/include/asm/kexec.h         |  3 +-
 arch/loongarch/kernel/kexec_efi.c          | 15 ++--
 arch/loongarch/kernel/kexec_elf.c          |  3 +-
 arch/loongarch/kernel/machine_kexec_file.c | 77 ++++++-------------
 arch/powerpc/kexec/elf_64.c                |  9 +--
 arch/powerpc/kexec/file_load_64.c          | 18 +----
 arch/riscv/include/asm/kexec.h             |  4 +-
 arch/riscv/kernel/kexec_elf.c              |  3 +-
 arch/riscv/kernel/kexec_image.c            |  3 +-
 arch/riscv/kernel/machine_kexec_file.c     | 83 ++++++---------------
 arch/x86/kernel/crash.c                    | 34 ++++-----
 arch/x86/kernel/kexec-bzimage64.c          |  8 +-
 arch/x86/kernel/machine_kexec_64.c         |  4 -
 drivers/of/kexec.c                         | 35 +++++++++
 include/linux/kexec.h                      |  9 +++
 include/linux/of.h                         |  4 +
 kernel/kexec_core.c                        | 25 ++++---
 kernel/kexec_file.c                        | 81 ++++++++++++++++++++
 21 files changed, 251 insertions(+), 273 deletions(-)

-- 
2.34.1

