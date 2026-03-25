Received: from canpmsgout02.his.huawei.com (canpmsgout02.his.huawei.com [113.46.200.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 648942D7DF1
	for <loongarch@lists.linux.dev>; Wed, 25 Mar 2026 02:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.217
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774407473; cv=none; b=DSMez4BRM6zb8rqlu+lF1SIqWf+S77RsL4IioT4l1zl67t1GUFVZC7wZdUN5N4d//t76hun+ofRsrZ7lP9HkDkYYyq1zjkDi+tLgovm1aIYOijgNa94vIAEgj3fkNp0k6P6yhMiUQRShqA+oSip1Gawr2Csqb6mKIV2NFQJnIKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774407473; c=relaxed/simple;
	bh=DNdoWnaS9CtSg7NxGcAVzWZ4l5rrpnnF03tB35hq5Io=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TfAFQYH5/z6NCHV7U9DYzUG1X6kgCTGiM55sHS52pqk3wa4Wf1XQZtC0mrVD7eOlYvN1RfAUXKkkJknq56Ie8TiMVcqSqsQ8PuqxT+5ErDAt/xIzRw146MOvXmak57i1GVNNrEy8qG+te1x18upOk8h2F47VqCa5GiwhHPVM0v4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=xqNJJTRY; arc=none smtp.client-ip=113.46.200.217
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="xqNJJTRY"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=8E4spcrmYqVzYUlBqOGzHHrelMM+VkOSD8iaO6+byhw=;
	b=xqNJJTRYyggCzXZzuIVa391GmVhP2M1AywiTzUCVIdevfMWk2W0+G2iNIudjPzgYPiCgaIuhE
	5THdqWRaQk7mWGN7AJ7Xy8EnMOPizyjjR001GpeKPLFi3V5PkCr2VJzvHZC7VITILAKNTbQjTE4
	da7qaeuWWHQjW0U1XLO75kc=
Received: from mail.maildlp.com (unknown [172.19.163.0])
	by canpmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4fgWdn6WXHzcb0r;
	Wed, 25 Mar 2026 10:51:57 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 3FA2840561;
	Wed, 25 Mar 2026 10:57:49 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemf500011.china.huawei.com
 (7.185.36.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Wed, 25 Mar
 2026 10:57:46 +0800
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
	<paulmck@kernel.org>, <lirongqing@baidu.com>, <ruanjinjie@huawei.com>,
	<rppt@kernel.org>, <ardb@kernel.org>, <leitao@debian.org>, <osandov@fb.com>,
	<cfsworks@gmail.com>, <tangyouling@kylinos.cn>, <sourabhjain@linux.ibm.com>,
	<ritesh.list@gmail.com>, <eajames@linux.ibm.com>,
	<songshuaishuai@tinylab.org>, <kevin.brodsky@arm.com>,
	<samuel.holland@sifive.com>, <vishal.moola@gmail.com>,
	<junhui.liu@pigmoral.tech>, <coxu@redhat.com>, <liaoyuanhong@vivo.com>,
	<jbohac@suse.cz>, <fuqiang.wang@easystack.cn>, <guoren@kernel.org>,
	<chenjiahao16@huawei.com>, <hbathini@linux.ibm.com>, <james.morse@arm.com>,
	<takahiro.akashi@linaro.org>, <lizhengyu3@huawei.com>, <x86@kernel.org>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <loongarch@lists.linux.dev>,
	<linuxppc-dev@lists.ozlabs.org>, <linux-riscv@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <kexec@lists.infradead.org>
Subject: [PATCH v10 8/8] crash: Fix race condition between crash kernel loading and memory hotplug
Date: Wed, 25 Mar 2026 10:59:04 +0800
Message-ID: <20260325025904.2811960-9-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260325025904.2811960-1-ruanjinjie@huawei.com>
References: <20260325025904.2811960-1-ruanjinjie@huawei.com>
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

During crash_prepare_headers(), the following steps occur:
1. arch_get_system_nr_ranges() queries current memory ranges from memblock
2. alloc_cmem() allocates buffer based on queried count
3. arch_crash_populate_cmem() populates ranges from memblock

If memory hotplug occurs between step 1 and step 3, the number of ranges
can increase, causing out-of-bounds write when populating cmem->ranges[].

This happens because kexec_load() uses kexec_trylock (atomic_t) while
memory hotplug uses device_hotplug_lock (mutex), so they don't serialize
with each other.

Fix by adding lock_device_hotplug()/unlock_device_hotplug() around the
critical section in crash_prepare_headers(). The lock is only acquired
when CONFIG_MEMORY_HOTPLUG is enabled to avoid overhead on systems without
hotplug support.

Fixes: dd5f726076cc ("kexec: support for kexec on panic using new system call")
Fixes: 3751e728cef2 ("arm64: kexec_file: add crash dump support")
Fixes: 8acea455fafa ("RISC-V: Support for kexec_file on panic")
Fixes: 1bcca8620a91 ("LoongArch: Add crash dump support for kexec_file")
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 kernel/crash_core.c | 24 ++++++++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

diff --git a/kernel/crash_core.c b/kernel/crash_core.c
index 300d44ad5471..f01d03d42c67 100644
--- a/kernel/crash_core.c
+++ b/kernel/crash_core.c
@@ -326,15 +326,25 @@ int crash_prepare_headers(int need_kernel_map, void **addr, unsigned long *sz,
 	struct crash_mem *cmem;
 	int ret;
 
+	if (IS_ENABLED(CONFIG_MEMORY_HOTPLUG))
+		lock_device_hotplug();
+
 	max_nr_ranges = arch_get_system_nr_ranges();
-	if (!max_nr_ranges)
-		return -ENOMEM;
+	if (!max_nr_ranges) {
+		ret = -ENOMEM;
+		goto unlock;
+	}
 
 	cmem = alloc_cmem(max_nr_ranges);
-	if (!cmem)
-		return -ENOMEM;
+	if (!cmem) {
+		ret = -ENOMEM;
+		goto unlock;
+	}
 
 	ret = arch_crash_populate_cmem(cmem);
+	if (IS_ENABLED(CONFIG_MEMORY_HOTPLUG))
+		unlock_device_hotplug();
+
 	if (ret)
 		goto out;
 
@@ -355,6 +365,12 @@ int crash_prepare_headers(int need_kernel_map, void **addr, unsigned long *sz,
 out:
 	kvfree(cmem);
 	return ret;
+
+unlock:
+	if (IS_ENABLED(CONFIG_MEMORY_HOTPLUG))
+		unlock_device_hotplug();
+
+	return ret;
 }
 
 /**
-- 
2.34.1

