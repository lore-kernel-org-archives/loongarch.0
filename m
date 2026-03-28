Received: from canpmsgout07.his.huawei.com (canpmsgout07.his.huawei.com [113.46.200.222])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE8F833F370
	for <loongarch@lists.linux.dev>; Sat, 28 Mar 2026 07:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.222
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774683690; cv=none; b=rZiUkMVVxhKOTtF/GqB3oO+agKKeLE03nIsmMs74A73GmkBBU/Mt8nPRKtuj2RiAt87+mf7tYiP0GaZqp0YpP+dj5QAOyAwDBpxUoibEGAwwtNkEEgESTDcKHn7BjArbXoXKGY9l/aDX7qpw7C2g3ww3eyy4LKfz797LjHlYe84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774683690; c=relaxed/simple;
	bh=OA3+t3ouF/KCmvhWfwe6D8gPaFUhyyKtS76vvWewtHI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jQGkHKSusgKgf4dVygZsFHq4olV+H8nMNpZqI0RjdQoE2vapQvrMQZfBZNCBxArPqGAHhuNM1DXNch/tbS9zKGici6C6lt46VByi+YMJq+eiChDESVUKsFZamsA57eToXxudDqiXI65BC/zWeS62cNQbDIS5+Pl+kCty0BAYFu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=PCikQ7pI; arc=none smtp.client-ip=113.46.200.222
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="PCikQ7pI"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=7Ej/nGP6D4OZlN2NP0wOiKbhFa+CLfU7f01IuTLoNYc=;
	b=PCikQ7pIzeaKrzAs1XH/O8ZmZYPB9pV0fBIUYs2VLOstWE8QiBMRuVM3CIvEXipATIGW3TQ8X
	gcrx6UYl2RFLLYRjDgwBg3lAQFmP1VJZr1v/vi26ia8fHvOPtkTiccABS/ORh8k+igGZUfzsNYX
	1sRHQpEli+zR1tX+CITCvDo=
Received: from mail.maildlp.com (unknown [172.19.163.214])
	by canpmsgout07.his.huawei.com (SkyGuard) with ESMTPS id 4fjTnL4BJGzLlsZ;
	Sat, 28 Mar 2026 15:35:18 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 1B7C44056C;
	Sat, 28 Mar 2026 15:41:25 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemf500011.china.huawei.com
 (7.185.36.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Sat, 28 Mar
 2026 15:41:22 +0800
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
Subject: [PATCH v11 03/11] x86/kexec: Fix potential buffer overflow in prepare_elf_headers()
Date: Sat, 28 Mar 2026 15:40:05 +0800
Message-ID: <20260328074013.3589544-4-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260328074013.3589544-1-ruanjinjie@huawei.com>
References: <20260328074013.3589544-1-ruanjinjie@huawei.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 dggpemf500011.china.huawei.com (7.185.36.131)

There is a race condition between the kexec_load() system call
(crash kernel loading path) and memory hotplug operations that can lead
to buffer overflow and potential kernel crash.

During prepare_elf_headers(), the following steps occur:
1. get_nr_ram_ranges_callback() queries current System RAM memory ranges
2. Allocates buffer based on queried count
3. prepare_elf64_ram_headers_callback() populates ranges from memblock

If memory hotplug occurs between step 1 and step 3, the number of ranges
can increase, causing out-of-bounds write when populating cmem->ranges[].

This happens because kexec_load() uses kexec_trylock (atomic_t) while
memory hotplug uses device_hotplug_lock (mutex), so they don't serialize
with each other.

Just add bounds checking in prepare_elf64_ram_headers_callback() to
prevent out-of-bounds (OOB) access,

Fixes: 8d5f894a3108 ("x86: kexec_file: lift CRASH_MAX_RANGES limit on crash_mem buffer")
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/x86/kernel/crash.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/x86/kernel/crash.c b/arch/x86/kernel/crash.c
index 335fd2ee9766..7fa6d45ebe3f 100644
--- a/arch/x86/kernel/crash.c
+++ b/arch/x86/kernel/crash.c
@@ -225,6 +225,9 @@ static int prepare_elf64_ram_headers_callback(struct resource *res, void *arg)
 {
 	struct crash_mem *cmem = arg;
 
+	if (cmem->nr_ranges >= cmem->max_nr_ranges)
+		return -ENOMEM;
+
 	cmem->ranges[cmem->nr_ranges].start = res->start;
 	cmem->ranges[cmem->nr_ranges].end = res->end;
 	cmem->nr_ranges++;
-- 
2.34.1

