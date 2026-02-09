Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3534366069
	for <loongarch@lists.linux.dev>; Mon,  9 Feb 2026 09:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770631130; cv=none; b=NDYnh6Dbsi2g3Ju5jf/H2jLPnHOp2463wQJuIqCxKQq0+iY2s0OiGfiq2WmBmpbmQUab1LIHY8Y49h7VaIgJ1MOVbnuB+OfKIu7ex5XOxf+nbgC/Kz9GOYqL0QyK3uBA9IzJvNyPi7Rs9AG0ZtJyhWCYDFXC2wO3QguIdwdAHJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770631130; c=relaxed/simple;
	bh=/HC/BDgTxAA05XgjcRY8O6PN0xJnJsh9iwfK7lnJUE0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Ko1+awrqStOHbdMwb4ECrdGwvkUtWNZqFaIalLkZu1FJbEtyZtMbeUmI+c+Ygtz80uyLtm5M6Gr8M6xPiHt5gV7w+/LvGkCQeSf3FgAu8Iu9sg1PDry9FJZ2u8HX44Aq9/Mgbli1lD8kCzyVZaao8wtAYIIcBVvO4AfVNxH+mDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=hhs9dNsd; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=hhs9dNsd; arc=none smtp.client-ip=45.249.212.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="hhs9dNsd";
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="hhs9dNsd"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=rZbn2DX+TpOyjPxTrik+wvw3h17J9tL/MLsovlvAZxo=;
	b=hhs9dNsdwe4qkbK7HPFjHzXVe+tEdgWvlYgxvjQ+66g+iSMAe6/pwiihzhDiak6cf8lDusHvs
	OcMhzeSKNnSvqdRfFEnMQI0HtAxRMeSjpqLj8wOnfenTD8HasNqQUnmpYZapopvoOtj8aqI1qqk
	Qk1z6f7tD12iwcZTC7CUEcw=
Received: from canpmsgout01.his.huawei.com (unknown [172.19.92.178])
	by szxga01-in.huawei.com (SkyGuard) with ESMTPS id 4f8g9b2CKQz1BFyb
	for <loongarch@lists.linux.dev>; Mon,  9 Feb 2026 17:57:55 +0800 (CST)
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=rZbn2DX+TpOyjPxTrik+wvw3h17J9tL/MLsovlvAZxo=;
	b=hhs9dNsdwe4qkbK7HPFjHzXVe+tEdgWvlYgxvjQ+66g+iSMAe6/pwiihzhDiak6cf8lDusHvs
	OcMhzeSKNnSvqdRfFEnMQI0HtAxRMeSjpqLj8wOnfenTD8HasNqQUnmpYZapopvoOtj8aqI1qqk
	Qk1z6f7tD12iwcZTC7CUEcw=
Received: from mail.maildlp.com (unknown [172.19.162.144])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4f8g5D4r3jz1T4K2;
	Mon,  9 Feb 2026 17:54:08 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 1E25840538;
	Mon,  9 Feb 2026 17:58:38 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemf500011.china.huawei.com
 (7.185.36.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 9 Feb
 2026 17:58:35 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <corbet@lwn.net>, <catalin.marinas@arm.com>, <will@kernel.org>,
	<chenhuacai@kernel.org>, <kernel@xen0n.name>, <maddy@linux.ibm.com>,
	<mpe@ellerman.id.au>, <npiggin@gmail.com>, <chleroy@kernel.org>,
	<pjw@kernel.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<alex@ghiti.fr>, <tglx@kernel.org>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>, <hpa@zytor.com>, <akpm@linux-foundation.org>,
	<bhe@redhat.com>, <vgoyal@redhat.com>, <dyoung@redhat.com>,
	<rdunlap@infradead.org>, <pmladek@suse.com>, <feng.tang@linux.alibaba.com>,
	<pawan.kumar.gupta@linux.intel.com>, <kees@kernel.org>, <elver@google.com>,
	<arnd@arndb.de>, <lirongqing@baidu.com>, <fvdl@google.com>,
	<leitao@debian.org>, <rppt@kernel.org>, <ardb@kernel.org>, <jbohac@suse.cz>,
	<sourabhjain@linux.ibm.com>, <osandov@fb.com>, <ryan.roberts@arm.com>,
	<cfsworks@gmail.com>, <tangyouling@kylinos.cn>, <ritesh.list@gmail.com>,
	<thuth@redhat.com>, <hbathini@linux.ibm.com>, <eajames@linux.ibm.com>,
	<bjorn@rivosinc.com>, <songshuaishuai@tinylab.org>, <kevin.brodsky@arm.com>,
	<samuel.holland@sifive.com>, <vishal.moola@gmail.com>,
	<junhui.liu@pigmoral.tech>, <dwmw@amazon.co.uk>, <pbonzini@redhat.com>,
	<thomas.lendacky@amd.com>, <kai.huang@intel.com>, <ubizjak@gmail.com>,
	<coxu@redhat.com>, <liaoyuanhong@vivo.com>, <fuqiang.wang@easystack.cn>,
	<brgerst@gmail.com>, <x86@kernel.org>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<loongarch@lists.linux.dev>, <linuxppc-dev@lists.ozlabs.org>,
	<linux-riscv@lists.infradead.org>, <kexec@lists.infradead.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v4 0/3] arm64/riscv: Add support for crashkernel CMA reservation
Date: Mon, 9 Feb 2026 17:59:28 +0800
Message-ID: <20260209095931.2813152-1-ruanjinjie@huawei.com>
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

Changes in v4:
- Move the size calculation (and the realloc if needed) into the
  generic crash.

Changs in v3:
- Exclude crash kernel memory in crash core as Mike suggested.
- Add acked-by.


Jinjie Ruan (3):
  crash: Exclude crash kernel memory in crash core
  arm64: kexec: Add support for crashkernel CMA reservation
  riscv: kexec: Add support for crashkernel CMA reservation

 .../admin-guide/kernel-parameters.txt         |  16 +--
 arch/arm64/kernel/machine_kexec_file.c        |  47 +-------
 arch/arm64/mm/init.c                          |   5 +-
 arch/loongarch/kernel/machine_kexec_file.c    |  45 +------
 arch/powerpc/include/asm/kexec.h              |  13 ++
 arch/powerpc/kexec/crash.c                    |  52 ++++----
 arch/powerpc/kexec/file_load_64.c             |  17 +--
 arch/powerpc/kexec/ranges.c                   |  18 +--
 arch/riscv/include/asm/kexec.h                |  10 ++
 arch/riscv/kernel/machine_kexec_file.c        |  39 +++---
 arch/riscv/mm/init.c                          |   5 +-
 arch/x86/include/asm/kexec.h                  |  10 ++
 arch/x86/kernel/crash.c                       | 104 ++--------------
 include/linux/crash_core.h                    | 114 +++++++++++++++++-
 kernel/crash_core.c                           |  71 +++++++++--
 15 files changed, 290 insertions(+), 276 deletions(-)

-- 
2.34.1

