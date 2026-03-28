Received: from canpmsgout08.his.huawei.com (canpmsgout08.his.huawei.com [113.46.200.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A966D371D0A
	for <loongarch@lists.linux.dev>; Sat, 28 Mar 2026 07:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774683690; cv=none; b=ocG6cFNTN8ksy186rOOIWO6F+3eS56pXYzx6ev6ic+qsmSm6Ruo9C0tO6U/g2K1DqIEynm+8d0HCa3OsRbKR+2F8zPHGt+2RU/2mlcTYlA3vFTdVEJS/FkYJPt3ZfZ4X+JMISVteVXKthCHDznWcADUf5zIxXv25kZm1VIzzT9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774683690; c=relaxed/simple;
	bh=oRiYEfWW8B8+q+W+pg6ahpLNTqPCS5g3jklGtmt7M5A=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=CqVbVUBzHRmU58zPc63I50c6JreQDA60DLvNpOOp2FMnjTx+wYv8gkNDAjz4V9B5Yw8cXam6gNhuLS+zgy3BfMeeqEP55PbxjHlIm9Kk38kJo3Hlq3OD5em8scp6dc4SoIH/n7snsLEKD9AVwJlFp50cnixgDTxXPfaFb9Fo8Z0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=uvotX97y; arc=none smtp.client-ip=113.46.200.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="uvotX97y"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=ipRmD0/2OdKsTaPJkmq5XYbzQlr05HqxdeagwMOmVUI=;
	b=uvotX97yDNtH1amJpIj2s4O197fY2nMqoozQvJt0womhY4365jCUitbUFDPvBhpuA8STynNi/
	ZU7ilNRpKFmtww5v2wwSEX29aCu+HIF3+GAuZ/Llme4Gqgl8ZAUxTkZxDkHCNv0fWU90Gupbsjx
	MVXXqh9Hj2VDeQ9DmNh3DMw=
Received: from mail.maildlp.com (unknown [172.19.163.127])
	by canpmsgout08.his.huawei.com (SkyGuard) with ESMTPS id 4fjTn767Z5zmV79;
	Sat, 28 Mar 2026 15:35:07 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 9CAE440363;
	Sat, 28 Mar 2026 15:41:16 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemf500011.china.huawei.com
 (7.185.36.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Sat, 28 Mar
 2026 15:41:13 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <corbet@lwn.net>, <skhan@linuxfoundation.org>, <catalin.marinas@arm.com>,
	<will@kernel.org>, <chenhuacai@kernel.org>, <kernel@xen0n.name>,
	<maddy@linux.ibm.com>, <mpe@ellerman.id.au>, <npiggin@gmail.com>,
	<chleroy@kernel.org>, <pjw@kernel.org>, <palmer@dabbelt.com>,
	<aou@eecs.berkeley.edu>, <alex@ghiti.fr>, <tglx@kernel.org>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>,
	<hpa@zytor.com>, <robh@kernel.org>, <saravanak@kernel.org>,
	<akpm@linux-foundation.org>, <bhe@redhat.com>, <vgoyal@redhat.com>,
	<dyoung@redhat.com>, <rdunlap@infradead.org>, <peterz@infradead.org>,
	<feng.tang@linux.alibaba.com>, <pawan.kumar.gupta@linux.intel.com>,
	<dapeng1.mi@linux.intel.com>, <kees@kernel.org>, <elver@google.com>,
	<paulmck@kernel.org>, <lirongqing@baidu.com>, <rppt@kernel.org>,
	<leitao@debian.org>, <ardb@kernel.org>, <cfsworks@gmail.com>,
	<osandov@fb.com>, <jbohac@suse.cz>, <tangyouling@kylinos.cn>,
	<sourabhjain@linux.ibm.com>, <ritesh.list@gmail.com>,
	<eajames@linux.ibm.com>, <songshuaishuai@tinylab.org>,
	<kevin.brodsky@arm.com>, <vishal.moola@gmail.com>,
	<junhui.liu@pigmoral.tech>, <coxu@redhat.com>, <fuqiang.wang@easystack.cn>,
	<liaoyuanhong@vivo.com>, <guoren@kernel.org>, <chenjiahao16@huawei.com>,
	<hbathini@linux.ibm.com>, <takahiro.akashi@linaro.org>,
	<james.morse@arm.com>, <lizhengyu3@huawei.com>, <x86@kernel.org>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <loongarch@lists.linux.dev>,
	<linuxppc-dev@lists.ozlabs.org>, <linux-riscv@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <kexec@lists.infradead.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v11 00/11] arm64/riscv: Add support for crashkernel CMA reservation
Date: Sat, 28 Mar 2026 15:40:02 +0800
Message-ID: <20260328074013.3589544-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 dggpemf500011.china.huawei.com (7.185.36.131)

The crash memory allocation, and the exclude of crashk_res, crashk_low_res
and crashk_cma memory are almost identical across different architectures,
This patch set handle them in crash core in a general way, which eliminate
a lot of duplication code.

And add support for crashkernel CMA reservation for arm64 and riscv.

Rebased on v7.0-rc1.

Basic second kernel boot test were performed on QEMU platforms for x86,
ARM64, and RISC-V architectures with the following parameters:

>-------"cma=256M crashkernel=256M crashkernel=64M,cma"

Changes in v11:
- Avoid silently drop crash memory if the crash kernel is built without
  CONFIG_CMA.
- Remove unnecessary "cmem->nr_ranges = 0" for arch_crash_populate_cmem()
  as we use kvzalloc().
- Provide a separate patch for each architecture to fix the existing
  buffer overflow issue.
- Add Acked-bys for arm64.

Changes in v10:
- Fix crashk_low_res not excluded bug in the existing
  RISC-V code.
- Fix an existing memory leak issue in the existing PowerPC code.
- Fix the ordering issue of adding CMA ranges to
  "linux,usable-memory-range".
- Fix an existing concurrency issue. A Concurrent memory hotplug may occur
  between reading memblock and attempting to fill cmem during kexec_load()
  for almost all existing architectures.
- Link to v9: https://lore.kernel.org/all/20260323072745.2481719-1-ruanjinjie@huawei.com/

Changes in v9:
- Collect Reviewed-by and Acked-by, and prepare for Sashiko AI review.
- Link to v8: https://lore.kernel.org/all/20260302035315.3892241-1-ruanjinjie@huawei.com/

Changes in v8:
- Fix the build issues reported by kernel test robot and Sourabh.
- Link to v7: https://lore.kernel.org/all/20260226130437.1867658-1-ruanjinjie@huawei.com/

Changes in v7:
- Correct the inclusion of CMA-reserved ranges for kdump kernel in of/kexec
  for arm64 and riscv.
- Add Acked-by.
- Link to v6: https://lore.kernel.org/all/20260224085342.387996-1-ruanjinjie@huawei.com/

Changes in v6:
- Update the crash core exclude code as Mike suggested.
- Rebased on v7.0-rc1.
- Add acked-by.
- Link to v5: https://lore.kernel.org/all/20260212101001.343158-1-ruanjinjie@huawei.com/

Changes in v5:
- Fix the kernel test robot build warnings.
- Sort crash memory ranges before preparing elfcorehdr for powerpc
- Link to v4: https://lore.kernel.org/all/20260209095931.2813152-1-ruanjinjie@huawei.com/

Changes in v4:
- Move the size calculation (and the realloc if needed) into the
  generic crash.
- Link to v3: https://lore.kernel.org/all/20260204093728.1447527-1-ruanjinjie@huawei.com/

Jinjie Ruan (10):
  riscv: kexec_file: Fix crashk_low_res not exclude bug
  powerpc/crash: Fix possible memory leak in update_crash_elfcorehdr()
  x86/kexec: Fix potential buffer overflow in prepare_elf_headers()
  arm64: kexec_file: Fix potential buffer overflow in
    prepare_elf_headers()
  riscv: kexec_file: Fix potential buffer overflow in
    prepare_elf_headers()
  LoongArch: kexec: Fix potential buffer overflow in
    prepare_elf_headers()
  crash: Exclude crash kernel memory in crash core
  crash: Use crash_exclude_core_ranges() on powerpc
  arm64: kexec: Add support for crashkernel CMA reservation
  riscv: kexec: Add support for crashkernel CMA reservation

Sourabh Jain (1):
  powerpc/crash: sort crash memory ranges before preparing elfcorehdr

 .../admin-guide/kernel-parameters.txt         |  16 +--
 arch/arm64/kernel/machine_kexec_file.c        |  43 +++-----
 arch/arm64/mm/init.c                          |   5 +-
 arch/loongarch/kernel/machine_kexec_file.c    |  43 +++-----
 arch/powerpc/include/asm/kexec_ranges.h       |   1 -
 arch/powerpc/kexec/crash.c                    |   7 +-
 arch/powerpc/kexec/ranges.c                   | 101 +-----------------
 arch/riscv/kernel/machine_kexec_file.c        |  42 +++-----
 arch/riscv/mm/init.c                          |   5 +-
 arch/x86/kernel/crash.c                       |  92 +++-------------
 drivers/of/fdt.c                              |   9 +-
 drivers/of/kexec.c                            |   9 ++
 include/linux/crash_core.h                    |   9 ++
 include/linux/crash_reserve.h                 |   4 +-
 kernel/crash_core.c                           |  89 ++++++++++++++-
 15 files changed, 194 insertions(+), 281 deletions(-)

-- 
2.34.1

