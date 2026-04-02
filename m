Received: from canpmsgout06.his.huawei.com (canpmsgout06.his.huawei.com [113.46.200.221])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F55B3451B3
	for <loongarch@lists.linux.dev>; Thu,  2 Apr 2026 07:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.221
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775114751; cv=none; b=Os6lKm0WRTjTECvgBMwt89lLpz+TlXgjfuQ3qFdkX2PEve1PWSCJrTuQEPqgaN+nerslUj8yCnm4RY0tHjZ0VOUqKvkN4lvSB8ZXWjkDkd8hUNhu7BIzg7/Ej564RVvjLimL45m5uGSgSAvkNvhJjTLC7nhgVZQIUrdaodB9VUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775114751; c=relaxed/simple;
	bh=mTUcFKsbwiD0LIrg49RZV6ZL6jdqAvgndaKIqOJxJTc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=m3rph0F4VenD6ZEcv4/WrZiXq1/NmtG2HWox7WL4RA3sQnMOf/gD9LcUizd5a9WBH/Ns47mAIC3TAN5KQ9PMlmR6h+3A3WplHBETzmyi6z2FRBOjqyP9x2rTXPNKVCW/fMKsbq9j/gSiqQWtEOoMYCR5b5/+aYX6mwqbZPCzPLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=xXm5VJ0g; arc=none smtp.client-ip=113.46.200.221
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="xXm5VJ0g"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=MS+svJjwX+WERXmMYEnQYyI5Mc94faKy2CdWQtmAb8o=;
	b=xXm5VJ0gzjFo5FI6ifJNt2lYYB9fpiEFwKvKrblrK5cZ5X5QR0VEIsC4iprJlRC3urHXpb75e
	XRqctvGI7uS/yew73xY6QXp4G2a2n8T+yKdd4nuZDj5kccyoaXIEo3Ic4MOgmKWA5NZ5J2KJg3p
	VaGi5GtRXJK44kah7P/dE2Q=
Received: from mail.maildlp.com (unknown [172.19.163.0])
	by canpmsgout06.his.huawei.com (SkyGuard) with ESMTPS id 4fmYBv53hPzRhWN;
	Thu,  2 Apr 2026 15:19:35 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 14BA14056B;
	Thu,  2 Apr 2026 15:25:46 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemf500011.china.huawei.com
 (7.185.36.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 2 Apr
 2026 15:25:42 +0800
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
	<pawan.kumar.gupta@linux.intel.com>, <feng.tang@linux.alibaba.com>,
	<dapeng1.mi@linux.intel.com>, <kees@kernel.org>, <elver@google.com>,
	<paulmck@kernel.org>, <lirongqing@baidu.com>, <rppt@kernel.org>,
	<leitao@debian.org>, <ardb@kernel.org>, <jbohac@suse.cz>,
	<cfsworks@gmail.com>, <tangyouling@kylinos.cn>, <sourabhjain@linux.ibm.com>,
	<ritesh.list@gmail.com>, <hbathini@linux.ibm.com>, <eajames@linux.ibm.com>,
	<guoren@kernel.org>, <songshuaishuai@tinylab.org>, <kevin.brodsky@arm.com>,
	<vishal.moola@gmail.com>, <junhui.liu@pigmoral.tech>, <coxu@redhat.com>,
	<fuqiang.wang@easystack.cn>, <liaoyuanhong@vivo.com>,
	<takahiro.akashi@linaro.org>, <james.morse@arm.com>, <lizhengyu3@huawei.com>,
	<x86@kernel.org>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<loongarch@lists.linux.dev>, <linuxppc-dev@lists.ozlabs.org>,
	<linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<kexec@lists.infradead.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v12 01/15] riscv: kexec_file: Fix crashk_low_res not exclude bug
Date: Thu, 2 Apr 2026 15:26:47 +0800
Message-ID: <20260402072701.628293-2-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260402072701.628293-1-ruanjinjie@huawei.com>
References: <20260402072701.628293-1-ruanjinjie@huawei.com>
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

As done in commit 944a45abfabc ("arm64: kdump: Reimplement crashkernel=X")
and commit 4831be702b95 ("arm64/kexec: Fix missing extra range for
crashkres_low.") for arm64, while implementing crashkernel=X,[high,low],
riscv should have excluded the "crashk_low_res" reserved ranges from
the crash kernel memory to prevent them from being exported through
/proc/vmcore, and the exclusion would need an extra crash_mem range.

Just simply tested on qemu with crashkernel=4G with kexec in [1] mentioned
in [2]. And the second kernel can be started normally.

	# dmesg | grep crash
	[    0.000000] crashkernel low memory reserved: 0xf8000000 - 0x100000000 (128 MB)
	[    0.000000] crashkernel reserved: 0x000000017fe00000 - 0x000000027fe00000 (4096 MB)

Cc: Guo Ren <guoren@kernel.org>
Cc: Baoquan He <bhe@redhat.com>
[1]: https://github.com/chenjh005/kexec-tools/tree/build-test-riscv-v2
[2]: https://lore.kernel.org/all/20230726175000.2536220-1-chenjiahao16@huawei.com/
Fixes: 5882e5acf18d ("riscv: kdump: Implement crashkernel=X,[high,low]")
Reviewed-by: Guo Ren <guoren@kernel.org>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/riscv/kernel/machine_kexec_file.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/kernel/machine_kexec_file.c b/arch/riscv/kernel/machine_kexec_file.c
index 54e2d9552e93..3f7766057cac 100644
--- a/arch/riscv/kernel/machine_kexec_file.c
+++ b/arch/riscv/kernel/machine_kexec_file.c
@@ -61,7 +61,7 @@ static int prepare_elf_headers(void **addr, unsigned long *sz)
 	unsigned int nr_ranges;
 	int ret;
 
-	nr_ranges = 1; /* For exclusion of crashkernel region */
+	nr_ranges = 2; /* For exclusion of crashkernel region */
 	walk_system_ram_res(0, -1, &nr_ranges, get_nr_ram_ranges_callback);
 
 	cmem = kmalloc_flex(*cmem, ranges, nr_ranges);
@@ -76,8 +76,16 @@ static int prepare_elf_headers(void **addr, unsigned long *sz)
 
 	/* Exclude crashkernel region */
 	ret = crash_exclude_mem_range(cmem, crashk_res.start, crashk_res.end);
-	if (!ret)
-		ret = crash_prepare_elf64_headers(cmem, true, addr, sz);
+	if (ret)
+		goto out;
+
+	if (crashk_low_res.end) {
+		ret = crash_exclude_mem_range(cmem, crashk_low_res.start, crashk_low_res.end);
+		if (ret)
+			goto out;
+	}
+
+	ret = crash_prepare_elf64_headers(cmem, true, addr, sz);
 
 out:
 	kfree(cmem);
-- 
2.34.1

