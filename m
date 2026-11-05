Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.221
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793883696;
	b=QobFmfDfRm8qMO+rKI79cjjlEtucjkHXXIx1395qZPG5v3LhmeHPbakV5g07r7Kul9CH
	 FdDtVUfIz4gl/IZjIgPXGtEDlcg9fZJhZYsp5s7W+G2JA7y+yryo4mOC68bNTHROOF4S2
	 7FGjCsRW82jTyU+69HeJg5tHRwTDSEWBrejJDvUD7ehDOd7PQJn45V8jm+kY5cKaz1VKx
	 n1sQW4oYFrecmBPnr5mLAmUnsWY5psp6G9SHcSk91vQU3vz4HqUtY5YBsOGjzuNuTqfbS
	 ZDfRAz9hBBs+0ujYTEj/D5sc9vatdRv8dmGdQoWDcP2pEF+sshpQOyGy5j6Mzinimnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793883696;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=PU/FIz15JXZpFNfzPT/NKA0ktSqGeC0/uUKobt6aQcs=;
	b=cfUPv7thBc0cztQodAO0CQcldRCSvlIvD24Kg64fiPCab/T69RkpU/RsMPmP0sx6O9Gn
	 uVAGwjnUdIdKlj69YBXGhVz9LsHJjEkOkgIvn5p0hvsBqey799iCFzLAs8SQhP8gCkax1
	 Pz1bKeaKkiByVQZ6UT3zu+yjxNjrAXcQ8pxNCcXJN8eR6mC8FP/lCt82oOXA37ostdjOB
	 63EbIr3C6T4Ok8/SiINry0GOzA5zUzdXR+ntW9Q1MuZIJ45oni/9MnTjSXC7qntYi4Hnb
	 6Saq44LobiAwvedep9AfN32PwogNZsmGu1j+zvdvwx5c69+6Add+QlsSCdFYNp7jHsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=nrYvSKWQ;
	arc=none smtp.remote-ip=113.46.200.221
Received: from canpmsgout06.his.huawei.com (canpmsgout06.his.huawei.com [113.46.200.221])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C0C2606A333
	for <loongarch@lists.linux.dev>; Thu,  5 Nov 2026 13:01:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C0C2606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=nrYvSKWQ
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=PU/FIz15JXZpFNfzPT/NKA0ktSqGeC0/uUKobt6aQcs=;
	b=nrYvSKWQoD72jLY8eqX20KRZScdaXrfd6JXFGHw8ECltbPTnMwErLIst3YwaDyTrwZn3oPQDM
	18JUNVpZkAxU834BA7snNuOY9SFfcOubyrCutUB0fPWS03DcqSMW64f2UWbgoqoc5gvkyqBYcFq
	xqMMFKaMbuo2toYbnZTIczw=
Received: from mail.maildlp.com (unknown [172.19.163.104])
	by canpmsgout06.his.huawei.com (SkyGuard) with ESMTPS id 4jL2W76XpnzRhRx;
	Thu,  5 Nov 2026 21:01:23 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id D29874058F;
	Thu,  5 Nov 2026 21:01:30 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 5 Nov
 2026 21:01:30 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <chenhuacai@kernel.org>, <kernel@xen0n.name>, <guodongtai@kylinos.cn>,
	<liukexin@kylinos.cn>, <zhangtianyang@loongson.cn>, <maqianga@uniontech.com>,
	<tangyouling@kylinos.cn>, <loongarch@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v8] LoongArch: kexec_file: Fix a modified_cmdline leak
Date: Thu, 5 Nov 2026 21:01:13 +0800
Message-ID: <20261105130113.2284690-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemk200008.china.huawei.com (7.202.194.74)

machine_kexec_prepare() copies it to KEXEC_CMDLINE_ADDR
and overwrites the pointer.

Free the heap buffer after the copy.

Cc: Huacai Chen <chenhuacai@kernel.org>
Cc: WANG Xuerui <kernel@xen0n.name>
Cc: Kexin Liu <liukexin@kylinos.cn>
Cc: Youling Tang <tangyouling@kylinos.cn>
Cc: Qiang Ma <maqianga@uniontech.com>
Cc: Tianyang Zhang <zhangtianyang@loongson.cn>
Cc: George Guo <guodongtai@kylinos.cn>
Cc: stable@vger.kernel.org
Fixes: d162feec6b6e ("LoongArch: Add preparatory infrastructure for kexec_file")
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
v7 -> v8:
- Split out from the patch set as Mike suggested.
- Link to v7: https://lore.kernel.org/all/20261026075201.699550-1-ruanjinjie@huawei.com/
---
 arch/loongarch/kernel/machine_kexec.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/loongarch/kernel/machine_kexec.c b/arch/loongarch/kernel/machine_kexec.c
index 1883cae93bc3..19ccc91b6f2a 100644
--- a/arch/loongarch/kernel/machine_kexec.c
+++ b/arch/loongarch/kernel/machine_kexec.c
@@ -14,6 +14,7 @@
 #include <linux/mm.h>
 #include <linux/of_fdt.h>
 #include <linux/reboot.h>
+#include <linux/slab.h>
 #include <linux/sched.h>
 #include <linux/sched/task_stack.h>
 
@@ -56,6 +57,7 @@ int machine_kexec_prepare(struct kimage *kimage)
 		 */
 		memcpy((void *)KEXEC_CMDLINE_ADDR, (void *)kimage->arch.cmdline_ptr,
 					strlen((char *)kimage->arch.cmdline_ptr) + 1);
+		kfree((void *)kimage->arch.cmdline_ptr);
 		kimage->arch.cmdline_ptr = (unsigned long)KEXEC_CMDLINE_ADDR;
 	} else {
 		/* Find the command line */
-- 
2.34.1

