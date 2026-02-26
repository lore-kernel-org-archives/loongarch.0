Received: from canpmsgout07.his.huawei.com (canpmsgout07.his.huawei.com [113.46.200.222])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4CF4305064
	for <loongarch@lists.linux.dev>; Thu, 26 Feb 2026 13:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.222
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772111131; cv=none; b=k1GcvF8xJJlL0LMjgYCPVsNYm5UVDoOoMNy+cu8JKFwQEOkz2cWBI4r8TyEdaaPEYYdo/KOyScqdgyOlCoJpwwsibo9j3zvqARaMr+dhe/wgHOcY27xQ1lw8znbJgSnjZYPK34HNe4AQa9gNPouw/urJGE7oIN5HIrQs9HQyFtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772111131; c=relaxed/simple;
	bh=YJ2vEoKI21Pda9T+D0eLyWpMc1zg7vf8W2SjYumUkgQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=BNKjwHwznwoQ8ny/Vmg4tc1ai/yJ8zxzCxf0XTo4kH4o7ODQIz5/CK9eneNCgn9eJS6D/pB9Ab+/oLIJyxF3Nr9zxFMhMbRbmjvMi4d8n4qrBqU+1KKU08L6XbS7gm/nNEbY07lmtzYBtP65bpzjfMyAJ2qwZ0THtNFen4lx+9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=H4QxefMV; arc=none smtp.client-ip=113.46.200.222
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="H4QxefMV"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=c6xFMKoxg63nYEi1UYNDiwkwCF4sOPCLNDyxwSSgRCU=;
	b=H4QxefMVwG8veBcdZ9tmP73AdBXRpAshNGNhyQNRY08lhYV0tuwuE+MJrKpCE8jCPEEWPHz5b
	cBmqyb91JJC0zMqVgdifrNwTDaZKz78VY1R9OrB9PBzfOH1YUUNdJTdYY3glOTCVUq+Z58b5Oda
	HvRIqziT6VrChMVpF0PmT9I=
Received: from mail.maildlp.com (unknown [172.19.163.15])
	by canpmsgout07.his.huawei.com (SkyGuard) with ESMTPS id 4fMBQW07m0zLlZF;
	Thu, 26 Feb 2026 21:00:35 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 6541D40539;
	Thu, 26 Feb 2026 21:05:22 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemf500011.china.huawei.com
 (7.185.36.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 26 Feb
 2026 21:05:19 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <corbet@lwn.net>, <skhan@linuxfoundation.org>, <catalin.marinas@arm.com>,
	<will@kernel.org>, <chenhuacai@kernel.org>, <kernel@xen0n.name>,
	<maddy@linux.ibm.com>, <mpe@ellerman.id.au>, <npiggin@gmail.com>,
	<chleroy@kernel.org>, <pjw@kernel.org>, <palmer@dabbelt.com>,
	<aou@eecs.berkeley.edu>, <alex@ghiti.fr>, <tglx@kernel.org>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>,
	<hpa@zytor.com>, <robh@kernel.org>, <saravanak@kernel.org>,
	<akpm@linux-foundation.org>, <bhe@redhat.com>, <vgoyal@redhat.com>,
	<dyoung@redhat.com>, <pmladek@suse.com>, <rdunlap@infradead.org>,
	<dapeng1.mi@linux.intel.com>, <kees@kernel.org>, <paulmck@kernel.org>,
	<lirongqing@baidu.com>, <arnd@arndb.de>, <rppt@kernel.org>,
	<ardb@kernel.org>, <leitao@debian.org>, <sourabhjain@linux.ibm.com>,
	<jbohac@suse.cz>, <cfsworks@gmail.com>, <ryan.roberts@arm.com>,
	<tangyouling@kylinos.cn>, <ritesh.list@gmail.com>, <hbathini@linux.ibm.com>,
	<eajames@linux.ibm.com>, <songshuaishuai@tinylab.org>,
	<samuel.holland@sifive.com>, <kevin.brodsky@arm.com>,
	<vishal.moola@gmail.com>, <junhui.liu@pigmoral.tech>, <coxu@redhat.com>,
	<liaoyuanhong@vivo.com>, <brgerst@gmail.com>, <fuqiang.wang@easystack.cn>,
	<x86@kernel.org>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<loongarch@lists.linux.dev>, <linuxppc-dev@lists.ozlabs.org>,
	<linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<kexec@lists.infradead.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v7 0/5] arm64/riscv: Add support for crashkernel CMA reservation
Date: Thu, 26 Feb 2026 21:04:32 +0800
Message-ID: <20260226130437.1867658-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 dggpemf500011.china.huawei.com (7.185.36.131)

The crash memory allocation, and the exclude of crashk_res, crashk_low_res
and crashk_cma memory are almost identical across different architectures,
This patch set handle them in crash core in a general way, which eliminate
a lot of duplication code.

And add support for crashkernel CMA reservation for arm64 and riscv.

Rebased on v7.0-rc1.

Basic second kernel boot test were performed on QEMU platforms for x86, ARM64,
and RISC-V architectures with the following parameters:

	"cma=256M crashkernel=256M crashkernel=64M,cma"

Changes in v7:
- Correct the inclusion of CMA-reserved ranges for kdump kernel in of/kexec
  for arm64 and riscv.
- Add Acked-by.

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

Jinjie Ruan (4):
  crash: Exclude crash kernel memory in crash core
  crash: Use crash_exclude_core_ranges() on powerpc
  arm64: kexec: Add support for crashkernel CMA reservation
  riscv: kexec: Add support for crashkernel CMA reservation

Sourabh Jain (1):
  powerpc/crash: sort crash memory ranges before preparing elfcorehdr

 .../admin-guide/kernel-parameters.txt         |  16 +--
 arch/arm64/kernel/machine_kexec_file.c        |  39 +++----
 arch/arm64/mm/init.c                          |   5 +-
 arch/loongarch/kernel/machine_kexec_file.c    |  39 +++----
 arch/powerpc/include/asm/kexec_ranges.h       |   4 +-
 arch/powerpc/kexec/crash.c                    |   5 +-
 arch/powerpc/kexec/ranges.c                   | 101 +-----------------
 arch/riscv/kernel/machine_kexec_file.c        |  38 +++----
 arch/riscv/mm/init.c                          |   5 +-
 arch/x86/kernel/crash.c                       |  89 +++------------
 drivers/of/fdt.c                              |   9 +-
 drivers/of/kexec.c                            |  13 ++-
 include/linux/crash_core.h                    |   9 ++
 kernel/crash_core.c                           |  89 ++++++++++++++-
 14 files changed, 183 insertions(+), 278 deletions(-)

-- 
2.34.1

