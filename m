Received: from canpmsgout06.his.huawei.com (canpmsgout06.his.huawei.com [113.46.200.221])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 129442E6CD9
	for <loongarch@lists.linux.dev>; Thu, 12 Feb 2026 10:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.221
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770890955; cv=none; b=VKWKhE0TNsAhzR3GhvJwekngjtMlhGqVt0/WrvCt6oRMqq1GCVL0C8baR6UycUNr2zeT9abnQjmifn6XHLjKX3UxcOiUwcJ6lotFH8owCWxHynZDvCU/bALovsPjhLd5Gw44FhY310hknIcS1KBDfjkwilNO59ghCvx1lqWd5YM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770890955; c=relaxed/simple;
	bh=Z3/yqr5/aYsIp4SbahJ37hdAqlUbKuLTT6ft2jLHBJY=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ru9gexEd+ZVl/3BtZ2wJDZiIPow0EW0t47bTpCeSe1Ei/LRrIsn8re3y9luiA0LmWHpKlM9pyw+9xqL+WMll5coA5F9yk8kx4N2oFj6bWATyHiV0m3GlOPMMFNtYQuYmM457gL1ym5uX0iqhqUl/v0njKk1XZtg8sDug4voS/pw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=N1Lb/dyT; arc=none smtp.client-ip=113.46.200.221
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="N1Lb/dyT"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=DJBahsVO2buYBRo6uanQ4akOube4lASCcn5Wc5JuHA0=;
	b=N1Lb/dyTE2h5HOJHrh+NRJNvn9yj1KvCbqkIn6VqWUGF70dIauXoQMrrYoYNwdNWlg3+8a/E2
	vGe1QBnODc9pH2mKsoaHcQbTyBL1aa76SvP3u+XYQm95+qiCFBlYzCsJrRLeFozkScfrLE4vows
	heKtPwy0ISFWrMHfm+RuWZA=
Received: from mail.maildlp.com (unknown [172.19.162.140])
	by canpmsgout06.his.huawei.com (SkyGuard) with ESMTPS id 4fBW9p5KLtzRhTq;
	Thu, 12 Feb 2026 18:04:30 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id C35A4201EB;
	Thu, 12 Feb 2026 18:09:08 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemf500011.china.huawei.com
 (7.185.36.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 12 Feb
 2026 18:09:06 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <corbet@lwn.net>, <skhan@linuxfoundation.org>, <catalin.marinas@arm.com>,
	<will@kernel.org>, <chenhuacai@kernel.org>, <kernel@xen0n.name>,
	<maddy@linux.ibm.com>, <mpe@ellerman.id.au>, <npiggin@gmail.com>,
	<chleroy@kernel.org>, <pjw@kernel.org>, <palmer@dabbelt.com>,
	<aou@eecs.berkeley.edu>, <alex@ghiti.fr>, <tglx@kernel.org>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>,
	<hpa@zytor.com>, <akpm@linux-foundation.org>, <bhe@redhat.com>,
	<vgoyal@redhat.com>, <dyoung@redhat.com>, <rdunlap@infradead.org>,
	<kees@kernel.org>, <elver@google.com>, <paulmck@kernel.org>, <arnd@arndb.de>,
	<ruanjinjie@huawei.com>, <fvdl@google.com>, <thuth@redhat.com>,
	<ardb@kernel.org>, <leitao@debian.org>, <rppt@kernel.org>, <osandov@fb.com>,
	<cfsworks@gmail.com>, <sourabhjain@linux.ibm.com>, <ryan.roberts@arm.com>,
	<tangyouling@kylinos.cn>, <eajames@linux.ibm.com>, <hbathini@linux.ibm.com>,
	<ritesh.list@gmail.com>, <songshuaishuai@tinylab.org>, <bjorn@rivosinc.com>,
	<samuel.holland@sifive.com>, <kevin.brodsky@arm.com>,
	<junhui.liu@pigmoral.tech>, <vishal.moola@gmail.com>, <dwmw@amazon.co.uk>,
	<pbonzini@redhat.com>, <kai.huang@intel.com>, <ubizjak@gmail.com>,
	<coxu@redhat.com>, <fuqiang.wang@easystack.cn>, <liaoyuanhong@vivo.com>,
	<brgerst@gmail.com>, <jbohac@suse.cz>, <x86@kernel.org>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <loongarch@lists.linux.dev>,
	<linuxppc-dev@lists.ozlabs.org>, <linux-riscv@lists.infradead.org>,
	<kexec@lists.infradead.org>
Subject: [PATCH v5 0/4] arm64/riscv: Add support for crashkernel CMA reservation
Date: Thu, 12 Feb 2026 18:09:57 +0800
Message-ID: <20260212101001.343158-1-ruanjinjie@huawei.com>
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

Exclude crash kernel memory in crash core to avoid duplication. Also move
the size calculation (and the realloc if needed) into crash core.

And add support for crashkernel CMA reservation for arm64 and riscv.

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

Jinjie Ruan (3):
  crash: Exclude crash kernel memory in crash core
  arm64: kexec: Add support for crashkernel CMA reservation
  riscv: kexec: Add support for crashkernel CMA reservation

Sourabh Jain (1):
  powerpc/crash: sort crash memory ranges before preparing elfcorehdr

 .../admin-guide/kernel-parameters.txt         |  16 +--
 arch/arm64/include/asm/kexec.h                |   9 +-
 arch/arm64/kernel/machine_kexec_file.c        |  43 +++-----
 arch/arm64/mm/init.c                          |   5 +-
 arch/loongarch/include/asm/kexec.h            |   9 +-
 arch/loongarch/kernel/machine_kexec_file.c    |  41 +++----
 arch/powerpc/include/asm/kexec.h              |  13 +++
 arch/powerpc/include/asm/kexec_ranges.h       |   1 -
 arch/powerpc/kexec/crash.c                    |  67 ++++++-----
 arch/powerpc/kexec/file_load_64.c             |  17 +--
 arch/powerpc/kexec/ranges.c                   | 103 +----------------
 arch/riscv/include/asm/kexec.h                |   9 +-
 arch/riscv/kernel/machine_kexec_file.c        |  39 +++----
 arch/riscv/mm/init.c                          |   5 +-
 arch/x86/include/asm/kexec.h                  |   9 ++
 arch/x86/kernel/crash.c                       | 104 ++----------------
 include/linux/crash_core.h                    |  75 ++++++++++++-
 kernel/crash_core.c                           |  85 ++++++++++++--
 18 files changed, 314 insertions(+), 336 deletions(-)

-- 
2.34.1

