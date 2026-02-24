Received: from canpmsgout08.his.huawei.com (canpmsgout08.his.huawei.com [113.46.200.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A08E368276
	for <loongarch@lists.linux.dev>; Tue, 24 Feb 2026 08:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771923294; cv=none; b=L3kJZDtDhZHCJvSDhc3PCpxsMP4YpHlzqWYcGlAsWrHaNz6/sTLStgR2cT/oJq0pwLjFmtkAeKaLNT4nXUIpOPZA3q8Dzy+AXs+N9uH3gcmtKwwdqvO7Vh1l+vs4G7g/er13q1GkHxse6lGUPCK54oyRwiJKMmu+o97rfKU/bYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771923294; c=relaxed/simple;
	bh=dGe5AJtuOi6pa16sbmTvjxhS4yVaLIp+mOvklFl9JzM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=oReCszu1gf3uK99YNMkTF8VahUy2RAK0VL+8oXbE/NeSQ4nZSMIA9W6m+YgwVQU1aee7VjXHvOEy/pwKNpXE482DrI0jc1KSI1zYunt4okka/NKiQpUPf1gXa9va9dWtg9kTOnabRJrXSkeZ0FEsAVUGqKeB+zyBdx9zr2gzu/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=6mvmQ08n; arc=none smtp.client-ip=113.46.200.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="6mvmQ08n"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=Rj8PWSOYXTg3Y1UAvq0lqqf9rZsdqg+RR9xCPK5IpV8=;
	b=6mvmQ08nBnbmNo9FUuiDx7FDue6lBFgQt7AUs+gx3RTWTiDgPE+gw1gkK22WPQTYkiigF7hzj
	oKnNTJO9H4HyXuToRa6ZTLbUlVEb3aDAYC4b8Cn/w6SsXs8Swi3h54VflsSnBGgCmFBXx/mikzw
	OjkCq3N15kKzXu+kDCHJdKk=
Received: from mail.maildlp.com (unknown [172.19.163.127])
	by canpmsgout08.his.huawei.com (SkyGuard) with ESMTPS id 4fKryK20m6zmVBy;
	Tue, 24 Feb 2026 16:50:01 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 6A252402AB;
	Tue, 24 Feb 2026 16:54:48 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemf500011.china.huawei.com
 (7.185.36.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 24 Feb
 2026 16:54:45 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <corbet@lwn.net>, <skhan@linuxfoundation.org>, <catalin.marinas@arm.com>,
	<will@kernel.org>, <chenhuacai@kernel.org>, <kernel@xen0n.name>,
	<maddy@linux.ibm.com>, <mpe@ellerman.id.au>, <npiggin@gmail.com>,
	<chleroy@kernel.org>, <pjw@kernel.org>, <palmer@dabbelt.com>,
	<aou@eecs.berkeley.edu>, <alex@ghiti.fr>, <tglx@kernel.org>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>,
	<hpa@zytor.com>, <akpm@linux-foundation.org>, <bhe@redhat.com>,
	<vgoyal@redhat.com>, <dyoung@redhat.com>, <rdunlap@infradead.org>,
	<pmladek@suse.com>, <dapeng1.mi@linux.intel.com>, <kees@kernel.org>,
	<paulmck@kernel.org>, <lirongqing@baidu.com>, <arnd@arndb.de>,
	<ardb@kernel.org>, <leitao@debian.org>, <rppt@kernel.org>,
	<cfsworks@gmail.com>, <ryan.roberts@arm.com>, <sourabhjain@linux.ibm.com>,
	<tangyouling@kylinos.cn>, <eajames@linux.ibm.com>, <hbathini@linux.ibm.com>,
	<ritesh.list@gmail.com>, <songshuaishuai@tinylab.org>,
	<samuel.holland@sifive.com>, <kevin.brodsky@arm.com>,
	<vishal.moola@gmail.com>, <junhui.liu@pigmoral.tech>, <coxu@redhat.com>,
	<liaoyuanhong@vivo.com>, <fuqiang.wang@easystack.cn>, <jbohac@suse.cz>,
	<brgerst@gmail.com>, <x86@kernel.org>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<loongarch@lists.linux.dev>, <linuxppc-dev@lists.ozlabs.org>,
	<linux-riscv@lists.infradead.org>, <kexec@lists.infradead.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v6 0/5] arm64/riscv: Add support for crashkernel CMA reservation
Date: Tue, 24 Feb 2026 16:53:37 +0800
Message-ID: <20260224085342.387996-1-ruanjinjie@huawei.com>
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

Basic test were performed on QEMU platforms for x86, ARM64, and RISC-V
architectures with the following parameters:

	"cma=256M crashkernel=256M crashkernel=64M,cma"

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

Changs in v3:
- Exclude crash kernel memory in crash core as Mike suggested.
- Add acked-by.

Jinjie Ruan (4):
  crash: Exclude crash kernel memory in crash core
  crash: Use crash_exclude_core_ranges() on powerpc
  arm64: kexec: Add support for crashkernel CMA reservation
  riscv: kexec: Add support for crashkernel CMA reservation

Sourabh Jain (1):
  powerpc/crash: sort crash memory ranges before preparing elfcorehdr

 .../admin-guide/kernel-parameters.txt         |  16 +--
 arch/arm64/kernel/machine_kexec_file.c        |  41 +++----
 arch/arm64/mm/init.c                          |   5 +-
 arch/loongarch/kernel/machine_kexec_file.c    |  39 +++----
 arch/powerpc/include/asm/kexec_ranges.h       |   4 +-
 arch/powerpc/kexec/crash.c                    |   5 +-
 arch/powerpc/kexec/ranges.c                   | 101 +-----------------
 arch/riscv/kernel/machine_kexec_file.c        |  40 ++++---
 arch/riscv/mm/init.c                          |   5 +-
 arch/x86/kernel/crash.c                       |  89 +++------------
 include/linux/crash_core.h                    |   9 ++
 kernel/crash_core.c                           |  89 ++++++++++++++-
 12 files changed, 178 insertions(+), 265 deletions(-)

-- 
2.34.1

