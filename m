Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.219
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794490501;
	b=1AESsFrKG97+ctbFhA6ZVWcjhhu/JnHw4U+AQp9IqafnVoyPCrEEy2xfWG4eHWA7lskq
	 cTbA9W8Efe7z9dHFTjswBMhrtv0w/+z4FvD//6ZPj7IFPA/VPp/hckuZRGUJ6ediz9d9F
	 Mu3g382ILMRWLm/2KKv99SIXSRUZcZ5fKX3W41Z7ebqo/e4XpaHAItLZbQfzZgR1yzKR0
	 1GcH5MyIizNQLibvljuGFEUbG6acsqkaSDYVqnsRND6t4dtaRdWzjbmctaKiFkVpRLcUM
	 t2Ru3iVMpvga9XXWGQDFg0ZKF19hrFvSArJQJjtsjxU/dh4M91l8oYd+OQwD0XpxSYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794490501;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=tIQmeBavWwtlHFLNqUczBSlf/4cBgAc0LbNh8aHp/iA=;
	b=JW0ifrG+i5hpKujOZK8lZKx5unkC8wKVau2SG5e6lskseXwWWCYqbHTnFfLiT4txScHk
	 NT5TsXfXhrCTzKy5mLSsSIprrXJpHTEBOXcuffzPDmoMWJ9qihxiyHXFbq1t2ypdxnAfS
	 wFayCfAOQEIarfoCajv6lEqoFgEFLMnwcxgWYb+okH8EQLMM8SKQVSGwAQCyy0VMlt6aM
	 MjbJEFZpsnzUxy1zYAUGb6X2JAeXQFrsulKWP8dwizVAGhzKhcDywlj/5iM8LTnGuSGVK
	 6PUIMUWoxQdF8FVD0aA7xfC10n9QIYwH73881F6PEVqtjV5espeV5sqgcrxyHcSKwiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=OiDtIf6u;
	arc=none smtp.remote-ip=113.46.200.219
Received: from canpmsgout04.his.huawei.com (canpmsgout04.his.huawei.com [113.46.200.219])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EDE5606A333
	for <loongarch@lists.linux.dev>; Thu, 12 Nov 2026 13:34:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4EDE5606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=OiDtIf6u
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=tIQmeBavWwtlHFLNqUczBSlf/4cBgAc0LbNh8aHp/iA=;
	b=OiDtIf6uHabJJFsJNnuEonq52+w08+gk6rdCnY2NaGXjd5htZSxj7F8mCjUYZPXpl4pZV5PxC
	VGhb+9xcp8qbHZ0/wxqyPQtTdYeyi5kW9zaM8hFzgNvHT1Ikpeeq9Oly0GN6T5u8GrGZuREJAmA
	7mDKp5UskfIYOmb/dwgS9BA=
Received: from mail.maildlp.com (unknown [172.19.163.0])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4jQLwL23jvz1prLQ;
	Thu, 12 Nov 2026 21:34:42 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id B3D3140537;
	Thu, 12 Nov 2026 21:34:51 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 12 Nov
 2026 21:34:50 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <mark.rutland@arm.com>,
	<chenhuacai@kernel.org>, <kernel@xen0n.name>, <maddy@linux.ibm.com>,
	<mpe@ellerman.id.au>, <npiggin@gmail.com>, <chleroy@kernel.org>,
	<ritesh.list@gmail.com>, <sshegde@linux.ibm.com>, <pjw@kernel.org>,
	<palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <alex@ghiti.fr>,
	<tglx@kernel.org>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>, <hpa@zytor.com>, <akpm@linux-foundation.org>,
	<baoquan.he@linux.dev>, <rppt@kernel.org>, <pasha.tatashin@soleen.com>,
	<pratyush@kernel.org>, <ruanjinjie@huawei.com>, <leitao@debian.org>,
	<yeoreum.yun@arm.com>, <mpilaniy@redhat.com>, <robh@kernel.org>,
	<coiby.xu@gmail.com>, <Yeking@Red54.com>, <prudo@redhat.com>,
	<brads@mainlining.org>, <sourabhjain@linux.ibm.com>, <mkchauras@gmail.com>,
	<blum@kernel.org>, <adityag@linux.ibm.com>, <qirui.001@bytedance.com>,
	<hui.wang@canonical.com>, <sohammetha01@gmail.com>, <guoren@kernel.org>,
	<gaohan@iscas.ac.cn>, <ionut.nechita@windriver.com>,
	<vishal.l.verma@intel.com>, <seanjc@google.com>, <ardb@kernel.org>,
	<richard.lyu@suse.com>, <arnd@arndb.de>, <tzimmermann@suse.de>,
	<rick.p.edgecombe@intel.com>, <kai.huang@intel.com>, <kas@kernel.org>,
	<piliu@redhat.com>, <thuth@redhat.com>, <shradhagupta@linux.microsoft.com>,
	<ebiggers@kernel.org>, <jbouron@amazon.com>, <me@linux.beauty>,
	<mclapinski@google.com>, <graf@amazon.com>, <tangyouling@kylinos.cn>,
	<x86@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <loongarch@lists.linux.dev>,
	<linuxppc-dev@lists.ozlabs.org>, <linux-riscv@lists.infradead.org>,
	<kexec@lists.infradead.org>
Subject: [PATCH v8 11/11] LoongArch: kexec_file: Fix CMA segment placement retries
Date: Thu, 12 Nov 2026 21:34:18 +0800
Message-ID: <20261112133418.4044428-12-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261112133418.4044428-1-ruanjinjie@huawei.com>
References: <20261112133418.4044428-1-ruanjinjie@huawei.com>
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
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemk200008.china.huawei.com (7.202.194.74)

The file-based kexec system call places segments with kexec_add_buffer(),
which takes them from CMA when kexec_alloc_contig() succeeds, to avoid
copying the payload at kexec time.

When load_other_segments() cannot place the initrd, the segments of the
attempt are dropped but their CMA pages are leaked.  Release them with
kexec_rollback_segments() in the retry loop and in the error path of
load_other_segments().

The loop makes progress by advancing buf_min past a segment placed by the
walk.  kexec_alloc_contig() ignores buf_min, so once the pages of a CMA
segment are released, the next attempt can get the same region again and
the retry makes no progress.  Disable CMA for the retry.

A CMA segment can be anywhere in RAM, so moving buf_min to its end can
raise the walk's lower bound close to the top of memory and leave the
retry with too little space for the initrd, failing with -EADDRNOTAVAIL.
Only advance buf_min for segments found by the walk.

Tested with a non-crash kexec_file_load() on QEMU virt, 2 GiB RAM and
cma=64M@0xe8000000, which leaves only 64 MiB above the CMA area.

Before the fix:
	The retry leaks the CMA pages and kexec_file_load() returns
	-EADDRNOTAVAIL even though RAM below CMA is free.

After the fix:
	The kernel and initrd are placed below CMA and the second
	kernel boots.

Cc: Huacai Chen <chenhuacai@kernel.org>
Cc: WANG Xuerui <kernel@xen0n.name>
Cc: Youling Tang <tangyouling@kylinos.cn>
Cc: Mike Rapoport (Microsoft) <rppt@kernel.org>
Cc: Sourabh Jain <sourabhjain@linux.ibm.com>
Cc: Kees Cook <kees@kernel.org>
Cc: stable@vger.kernel.org
Link: https://sashiko.dev/#/patchset/20260729031235.2840255-1-ruanjinjie%40huawei.com
Fixes: 55d990f0084c ("LoongArch: Add EFI binary support for kexec_file")
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/loongarch/kernel/kexec_efi.c          | 12 ++++++++----
 arch/loongarch/kernel/machine_kexec_file.c |  2 +-
 2 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/arch/loongarch/kernel/kexec_efi.c b/arch/loongarch/kernel/kexec_efi.c
index 4824c47907ac..1fbd0ee1deb6 100644
--- a/arch/loongarch/kernel/kexec_efi.c
+++ b/arch/loongarch/kernel/kexec_efi.c
@@ -82,11 +82,15 @@ static void *efi_kexec_load(struct kimage *image,
 			break;
 
 		/*
-		 * We couldn't find space for the other segments; erase the
-		 * kernel segment and try the next available hole.
+		 * kexec_alloc_contig() ignores buf_min and always returns
+		 * CMA memory, so disable it and keep buf_min.
 		 */
-		image->nr_segments -= 1;
-		kbuf.buf_min = kernel_segment->mem + kernel_segment->memsz;
+		if (image->segment_cma[kernel_segment_number])
+			image->no_cma = true;
+		else
+			kbuf.buf_min = kernel_segment->mem + kernel_segment->memsz;
+
+		kexec_rollback_segments(image, kernel_segment_number);
 		kbuf.mem = KEXEC_BUF_MEM_UNKNOWN;
 	}
 
diff --git a/arch/loongarch/kernel/machine_kexec_file.c b/arch/loongarch/kernel/machine_kexec_file.c
index 5a3d5026303e..0341dfd04b1f 100644
--- a/arch/loongarch/kernel/machine_kexec_file.c
+++ b/arch/loongarch/kernel/machine_kexec_file.c
@@ -191,7 +191,7 @@ int load_other_segments(struct kimage *image,
 	return 0;
 
 out_err:
-	image->nr_segments = orig_segments;
+	kexec_rollback_segments(image, orig_segments);
 	kfree(modified_cmdline);
 	return ret;
 }
-- 
2.34.1

