Received: from canpmsgout04.his.huawei.com (canpmsgout04.his.huawei.com [113.46.200.219])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F83B3093CF
	for <loongarch@lists.linux.dev>; Mon,  9 Feb 2026 09:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.219
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770631127; cv=none; b=Z8+LMTm6ZF7WWtt0ClnXv8HReyG2NBhywKbO+lZ7l3ITRBgZWOqmJVBgfzXc+gBDvOP1Py28juMGS/PG828/tOVbKUNvuCLPDxGQQ52qhHvpiTL3by6SFl2XmeotdUvoFLt0pdSWHaOmycdOYNNYCobgTREXaesIMyec07PNs5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770631127; c=relaxed/simple;
	bh=tjAel91j+ZwmAoA9VzZWq7P/u9EIkEtALE7VuTsR/kQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NI5dbF9PFwlQNp774hKe0t3bl1E1gVuXzKXguL0Z3jaFdRznTh6BAeFZe87Pe99wiuJ580+iOj6vjvjIZuzaAX4drKdrSwcloTG/EIgH/P+D2lIIggTQx6flRwDiqCJ6Vg+W+FSapF6MViKQcwLYhK4LvTjVmN8hnYWENX9ukck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=lZ9hS/qn; arc=none smtp.client-ip=113.46.200.219
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="lZ9hS/qn"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=A7QSD0FZxPYGa9nM/vOmRlehchcq+wPFipR/HtdIIvk=;
	b=lZ9hS/qnzUPwxNJd4kCYOh4uN0Q8ShB745NEqXHiPySEmqU1DMVTtzwGtCeICu9S654aPh3kb
	Y3CbKrQ74CjPdXLzIdQlWGIOPaWwJWngtd2Ywql6AzsZvRZ+esf6OoGrXNPpEUzCPVqt8ZDrvNY
	dpjJ/qmocCnQODqgczGI8fE=
Received: from mail.maildlp.com (unknown [172.19.162.197])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4f8g581GmGz1prMr;
	Mon,  9 Feb 2026 17:54:04 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id C96AD40363;
	Mon,  9 Feb 2026 17:58:43 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemf500011.china.huawei.com
 (7.185.36.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 9 Feb
 2026 17:58:40 +0800
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
Subject: [PATCH v4 2/3] arm64: kexec: Add support for crashkernel CMA reservation
Date: Mon, 9 Feb 2026 17:59:30 +0800
Message-ID: <20260209095931.2813152-3-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260209095931.2813152-1-ruanjinjie@huawei.com>
References: <20260209095931.2813152-1-ruanjinjie@huawei.com>
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

Commit 35c18f2933c5 ("Add a new optional ",cma" suffix to the
crashkernel= command line option") and commit ab475510e042 ("kdump:
implement reserve_crashkernel_cma") added CMA support for kdump
crashkernel reservation.

Crash kernel memory reservation wastes production resources if too
large, risks kdump failure if too small, and faces allocation difficulties
on fragmented systems due to contiguous block constraints. The new
CMA-based crashkernel reservation scheme splits the "large fixed
reservation" into a "small fixed region + large CMA dynamic region": the
CMA memory is available to userspace during normal operation to avoid
waste, and is reclaimed for kdump upon crash—saving memory while
improving reliability.

So extend crashkernel CMA reservation support to arm64. The following
changes are made to enable CMA reservation:

- Parse and obtain the CMA reservation size along with other crashkernel
  parameters.
- Call reserve_crashkernel_cma() to allocate the CMA region for kdump.
- Include the CMA-reserved ranges for kdump kernel to use, which is
  the crash core default implementation, so nothing needs to be done.
- Exclude the CMA-reserved ranges from the crash kernel memory to
  prevent them from being exported through /proc/vmcore, which is already
  done in the crash core.

Update kernel-parameters.txt to document CMA support for crashkernel on
arm64 architecture.

Acked-by: Ard Biesheuvel <ardb@kernel.org>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
v3:
- Add Acked-by.
v2:
- Free cmem in prepare_elf_headers()
- Add the mtivation.
---
 Documentation/admin-guide/kernel-parameters.txt | 2 +-
 arch/arm64/mm/init.c                            | 5 +++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 1058f2a6d6a8..36bb642a7edd 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -1119,7 +1119,7 @@ Kernel parameters
 			It will be ignored when crashkernel=X,high is not used
 			or memory reserved is below 4G.
 	crashkernel=size[KMG],cma
-			[KNL, X86, ppc] Reserve additional crash kernel memory from
+			[KNL, X86, ARM64, ppc] Reserve additional crash kernel memory from
 			CMA. This reservation is usable by the first system's
 			userspace memory and kernel movable allocations (memory
 			balloon, zswap). Pages allocated from this memory range
diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
index 524d34a0e921..28165d94af08 100644
--- a/arch/arm64/mm/init.c
+++ b/arch/arm64/mm/init.c
@@ -96,8 +96,8 @@ phys_addr_t __ro_after_init arm64_dma_phys_limit;
 
 static void __init arch_reserve_crashkernel(void)
 {
+	unsigned long long crash_base, crash_size, cma_size = 0;
 	unsigned long long low_size = 0;
-	unsigned long long crash_base, crash_size;
 	bool high = false;
 	int ret;
 
@@ -106,11 +106,12 @@ static void __init arch_reserve_crashkernel(void)
 
 	ret = parse_crashkernel(boot_command_line, memblock_phys_mem_size(),
 				&crash_size, &crash_base,
-				&low_size, NULL, &high);
+				&low_size, &cma_size, &high);
 	if (ret)
 		return;
 
 	reserve_crashkernel_generic(crash_size, crash_base, low_size, high);
+	reserve_crashkernel_cma(cma_size);
 }
 
 static phys_addr_t __init max_zone_phys(phys_addr_t zone_limit)
-- 
2.34.1

