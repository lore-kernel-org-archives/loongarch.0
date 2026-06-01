Received: from canpmsgout03.his.huawei.com (canpmsgout03.his.huawei.com [113.46.200.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 516033A382B
	for <loongarch@lists.linux.dev>; Mon,  1 Jun 2026 09:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780307377; cv=none; b=DBpz565mjLCIHPOyCuKLibwnJRSSMkDiexZ3yhWpa80x6nxVJLrB92te+fc/5qfWA0vZUtRPSVbcZR/JjiHYG93kiABpE1kFxYp+b4tTKbDMiRdYbW9VDX/ILVgfi3c1TcgmiWz0C8sgOSrQZaLrpR/B0LmjYibs24Dp3dcZbg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780307377; c=relaxed/simple;
	bh=u7ZzLF0Hb1ZVFevOmbl2C8PBqk0xuxiknP7FKKuanf4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uzPWOEIW7n9QtEuRDrlIG3rvldtCl8R283D2VJVj9qoRK2Qcdn4HczB5/2BaEplxQvqWQDEEhBZ07B9FL57LRlEgjdFeoQk3iZAu1DU5HbZ9VxITpo+KSFmfRs8Wh0qV5NB+6MT2QmTdnqA7qNHfkXkCpOF/AvOHZgSr29zp6/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=VhBDZrFR; arc=none smtp.client-ip=113.46.200.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="VhBDZrFR"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=s72FvUjFSjSJ20RjP7SnGlVB1x5o5hIMnFQNqmBErV8=;
	b=VhBDZrFR76i+VElm85yQCdwAmgLAAAj/GvMjgfKMrBNw8K6sW8djbL99FteZAzdBUPwmwpKFk
	D4rYAMPPIAddb5+2EpnwbeiRUn1efqXA6Jhh4h/Ib5wbAcxehRl+0QOXweoQyRt6xn/C6WYYscJ
	hWU4wb+ZmFTyxSIQZRnfEyA=
Received: from mail.maildlp.com (unknown [172.19.162.197])
	by canpmsgout03.his.huawei.com (SkyGuard) with ESMTPS id 4gTTWL17qkzpStn;
	Mon,  1 Jun 2026 17:41:50 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 1440340569;
	Mon,  1 Jun 2026 17:49:25 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemf500011.china.huawei.com
 (7.185.36.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 1 Jun
 2026 17:49:21 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <corbet@lwn.net>, <skhan@linuxfoundation.org>, <catalin.marinas@arm.com>,
	<will@kernel.org>, <chenhuacai@kernel.org>, <kernel@xen0n.name>,
	<maddy@linux.ibm.com>, <mpe@ellerman.id.au>, <npiggin@gmail.com>,
	<chleroy@kernel.org>, <pjw@kernel.org>, <palmer@dabbelt.com>,
	<aou@eecs.berkeley.edu>, <alex@ghiti.fr>, <tglx@kernel.org>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>,
	<hpa@zytor.com>, <robh@kernel.org>, <saravanak@kernel.org>,
	<akpm@linux-foundation.org>, <bhe@redhat.com>, <rppt@kernel.org>,
	<pasha.tatashin@soleen.com>, <pratyush@kernel.org>, <ruirui.yang@linux.dev>,
	<rdunlap@infradead.org>, <feng.tang@linux.alibaba.com>,
	<dapeng1.mi@linux.intel.com>, <kees@kernel.org>, <elver@google.com>,
	<kuba@kernel.org>, <lirongqing@baidu.com>, <ebiggers@kernel.org>,
	<paulmck@kernel.org>, <sourabhjain@linux.ibm.com>, <thuth@redhat.com>,
	<ardb@kernel.org>, <masahiroy@kernel.org>, <gshan@redhat.com>,
	<james.morse@arm.com>, <maz@kernel.org>, <leitao@debian.org>,
	<yeoreum.yun@arm.com>, <coxu@redhat.com>, <suzuki.poulose@arm.com>,
	<cfsworks@gmail.com>, <osandov@fb.com>, <jbohac@suse.cz>,
	<ryan.roberts@arm.com>, <tangyouling@kylinos.cn>, <ritesh.list@gmail.com>,
	<adityag@linux.ibm.com>, <hbathini@linux.ibm.com>, <bjorn@rivosinc.com>,
	<songshuaishuai@tinylab.org>, <vishal.moola@gmail.com>,
	<junhui.liu@pigmoral.tech>, <djordje.todorovic@htecgroup.com>,
	<austin.kim@lge.com>, <namcao@linutronix.de>, <djbw@kernel.org>,
	<chao.gao@intel.com>, <seanjc@google.com>, <fuqiang.wang@easystack.cn>,
	<liaoyuanhong@vivo.com>, <makb@juniper.net>, <graf@amazon.com>,
	<piliu@redhat.com>, <rafael.j.wysocki@intel.com>,
	<mario.limonciello@amd.com>, <jbouron@amazon.com>, <chenjiahao16@huawei.com>,
	<guoren@kernel.org>, <bauerman@linux.ibm.com>, <bgwin@google.com>,
	<takahiro.akashi@linaro.org>, <x86@kernel.org>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<loongarch@lists.linux.dev>, <linuxppc-dev@lists.ozlabs.org>,
	<linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<kexec@lists.infradead.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v15 13/23] riscv: kexec_file: Fix TOCTOU buffer overflow via memory region padding
Date: Mon, 1 Jun 2026 17:47:55 +0800
Message-ID: <20260601094805.2928614-14-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260601094805.2928614-1-ruanjinjie@huawei.com>
References: <20260601094805.2928614-1-ruanjinjie@huawei.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 dggpemf500011.china.huawei.com (7.185.36.131)

Sashiko AI code review pointed out there is a TOCTOU (Time-of-Check to
Time-of-Use) race condition in prepare_elf_headers() between the initial
pass that counts System RAM ranges and the second pass that populates them.
If a memory hotplug event occurs between these two steps, the number of
memory regions may increase, causing an out-of-bounds write to
the cmem->ranges[] array.

Fix this fundamentally by using `CRASH_HOTPLUG_SAFETY_PADDING` (128 slots)
to expand the flexible array allocation ceiling upfront. This safely
absorbs any concurrent memory region expansion. Concurrently, add
a defensive boundary check inside the callback to return -EAGAIN on
unexpected overrun, fully eradicating the overflow window and ensuring
system stability.

Cc: Paul Walmsley <pjw@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>
Cc: Alexandre Ghiti <alex@ghiti.fr>
Cc: songshuaishuai@tinylab.org
Cc: bjorn@rivosinc.com
Cc: leitao@debian.org
Fixes: 8acea455fafa ("RISC-V: Support for kexec_file on panic")
Reviewed-by: Guo Ren <guoren@kernel.org>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/riscv/kernel/machine_kexec_file.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/machine_kexec_file.c b/arch/riscv/kernel/machine_kexec_file.c
index 3f7766057cac..f3576dc0513f 100644
--- a/arch/riscv/kernel/machine_kexec_file.c
+++ b/arch/riscv/kernel/machine_kexec_file.c
@@ -48,6 +48,9 @@ static int prepare_elf64_ram_headers_callback(struct resource *res, void *arg)
 {
 	struct crash_mem *cmem = arg;
 
+	if (unlikely(cmem->nr_ranges >= cmem->max_nr_ranges))
+		return -EAGAIN;
+
 	cmem->ranges[cmem->nr_ranges].start = res->start;
 	cmem->ranges[cmem->nr_ranges].end = res->end;
 	cmem->nr_ranges++;
@@ -61,7 +64,8 @@ static int prepare_elf_headers(void **addr, unsigned long *sz)
 	unsigned int nr_ranges;
 	int ret;
 
-	nr_ranges = 2; /* For exclusion of crashkernel region */
+	/* For exclusion of crashkernel region */
+	nr_ranges = 2 + CRASH_HOTPLUG_SAFETY_PADDING;
 	walk_system_ram_res(0, -1, &nr_ranges, get_nr_ram_ranges_callback);
 
 	cmem = kmalloc_flex(*cmem, ranges, nr_ranges);
-- 
2.34.1

