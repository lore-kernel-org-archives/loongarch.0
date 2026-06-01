Received: from canpmsgout05.his.huawei.com (canpmsgout05.his.huawei.com [113.46.200.220])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E66639A806
	for <loongarch@lists.linux.dev>; Mon,  1 Jun 2026 09:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.220
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780307342; cv=none; b=mAP8W9gdHAUr1X7XJv6xNEd4iaDb4KRIkIy9Y0+fPvx0hWsvCLVAPKSB0IGaO3H+2joeUMSgS1kn/2umtGgnxX2STos5PZipPc2AEHbiEqYiwdsQLmJ2sRu1D2R5t0Tshll0iLEQVOdmSca3jzpG36afWPsMJAco4FY38omIlU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780307342; c=relaxed/simple;
	bh=woXlGWieJalGqSw6QQi+xOgOx9A94sAzqf4CS1duDU8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pJBtGJbF4P1swp41zUvqMmtvy73Xyr/Wz2lgPuhHYg54G971vD5m4qXhT8pOi47QMYZDyNw8cOrL/Wp4ppCYf/67OLHXNjyOD7QfUe8DMCrITH0C4frPzdaQ9/cRWLMm6BC6sTEmyj3MQVgGN86sfoKov9yCGOB6oG8w1bW4SkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=6KPOa2av; arc=none smtp.client-ip=113.46.200.220
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="6KPOa2av"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=4eT52ydG2t54NS/b5dXPgA7jwihQzEhqa1y7/Wo7/ig=;
	b=6KPOa2avTUx1m2s1M1NqpwzXyvocvApJn4LiFv0Fj9rEPMgVobIxbK7O1QwldATXBoob5fmmd
	8dmxCFHqe5YvdPmuS6cpdFMFC6WcjElx/b56lcNYqMuGSoWq16uU6xAHPAZcffBCM8/T3UjgXFo
	n8DkXNneauhrog+mHvXzWT4=
Received: from mail.maildlp.com (unknown [172.19.163.104])
	by canpmsgout05.his.huawei.com (SkyGuard) with ESMTPS id 4gTTV90cdgz12LGX;
	Mon,  1 Jun 2026 17:40:49 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id E5B004048F;
	Mon,  1 Jun 2026 17:48:45 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemf500011.china.huawei.com
 (7.185.36.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 1 Jun
 2026 17:48:41 +0800
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
Subject: [PATCH v15 03/23] powerpc/kexec_file: Fix NULL pointer dereference in kexec_extra_fdt_size_ppc64()
Date: Mon, 1 Jun 2026 17:47:45 +0800
Message-ID: <20260601094805.2928614-4-ruanjinjie@huawei.com>
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

A static Sashiko AI review identified a potential NULL pointer dereference
in kexec_extra_fdt_size_ppc64().

When get_reserved_memory_ranges() successfully returns 0 on platforms
without any reserved memory regions, the allocated 'rmem' pointer remains
NULL. Passing this unallocated pointer directly to
kexec_extra_fdt_size_ppc64() leads to a kernel panic when evaluating
'rmem->nr_ranges'.

Fix this by adding a defensive NULL pointer check at the beginning of
kexec_extra_fdt_size_ppc64(), returning 0 extra space immediately if
no reserved memory structure exists.

Cc: Sourabh Jain <sourabhjain@linux.ibm.com>
Cc: Hari Bathini <hbathini@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: stable@vger.kernel.org
Fixes: 0d3ff067331e ("powerpc/kexec_file: fix extra size calculation for kexec FDT")
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/powerpc/kexec/file_load_64.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/powerpc/kexec/file_load_64.c b/arch/powerpc/kexec/file_load_64.c
index 8c72e12ea44e..fdeedf102c38 100644
--- a/arch/powerpc/kexec/file_load_64.c
+++ b/arch/powerpc/kexec/file_load_64.c
@@ -649,6 +649,9 @@ unsigned int kexec_extra_fdt_size_ppc64(struct kimage *image, struct crash_mem *
 	struct device_node *dn;
 	unsigned int cpu_nodes = 0, extra_size = 0;
 
+	if (!rmem)
+		return 0;
+
 	// Budget some space for the password blob. There's already extra space
 	// for the key name
 	if (plpks_is_available())
-- 
2.34.1

