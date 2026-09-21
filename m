Received: from canpmsgout06.his.huawei.com (canpmsgout06.his.huawei.com [113.46.200.221])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B058B469822;
	Mon, 21 Sep 2026 09:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.221
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789981464; cv=none; b=recmK/iemfFCty3wRdOfBYBYhSQCIZuzA5Tk5YsD76xxTrcObun1daGEhjVSScPodEPi7gDwC2yivRC6RUOkQw/bmXHznHVUdCMNXNxjKFDD1oi3c01c6Dt5DUWsqGLLsg5ctRaXGAXL7pOdrV/RmmCDzHR6ZfLxZWNlFvE9nC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789981464; c=relaxed/simple;
	bh=wjR21x1VZ0jBGYVQvbCGyafKMjtbiu05vUZUySil/VY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pOxy+Aqef8cG3gRYZtE0kGNu06EjXBbZrbbeqFRez2D3GR6j2l5qiKTp41jizSzRCMCFy7Ghefd2t6Z5sxV+HtChUxaNhm2VqbsUvKEIkgWjiuXhRl1x4mtjAi2T0JfJ2TtgUFeqGyIBQOHDvgfIvgLRptKC+IKHhDV5MAnmEqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=wVs/Hs9G; arc=none smtp.client-ip=113.46.200.221
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="wVs/Hs9G"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=gl9dOVAVG56ScS9MwUOL4momh5UtqrFy6pN1ShFcuZM=;
	b=wVs/Hs9Gq6VG/cWAMpWvzJmy/oIAMsdmFRrHLaMN8dhT/208NNm+Jy57C8JdLMxP37J0PUlpB
	GvTnqbaNF3Y1buLGfFQc0tAbMgmC9XUKdLppSMLKPgLCRodGAQm9QZNfIEVZADGVfpSUfrMTgAo
	355Yjh2Bx4bZrE0WgEv0YQ0=
Received: from mail.maildlp.com (unknown [172.19.162.140])
	by canpmsgout06.his.huawei.com (SkyGuard) with ESMTPS id 4hpH6N5yyJzRhjW;
	Mon, 21 Sep 2026 16:52:12 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 7F7142011D;
	Mon, 21 Sep 2026 17:04:13 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 21 Sep
 2026 17:04:11 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <mark.rutland@arm.com>,
	<chenhuacai@kernel.org>, <kernel@xen0n.name>, <maddy@linux.ibm.com>,
	<mpe@ellerman.id.au>, <npiggin@gmail.com>, <chleroy@kernel.org>,
	<ritesh.list@gmail.com>, <sshegde@linux.ibm.com>, <tglx@kernel.org>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>,
	<hpa@zytor.com>, <gregkh@linuxfoundation.org>, <rafael@kernel.org>,
	<dakr@kernel.org>, <akpm@linux-foundation.org>, <baoquan.he@linux.dev>,
	<rppt@kernel.org>, <pasha.tatashin@soleen.com>, <pratyush@kernel.org>,
	<ruirui.yang@linux.dev>, <leitao@debian.org>, <yeoreum.yun@arm.com>,
	<sourabhjain@linux.ibm.com>, <robh@kernel.org>, <coxu@redhat.com>,
	<kees@kernel.org>, <tangyouling@kylinos.cn>, <liukexin@kylinos.cn>,
	<zhangtianyang@loongson.cn>, <guodongtai@kylinos.cn>,
	<maqianga@uniontech.com>, <chao.gao@intel.com>, <kai.huang@intel.com>,
	<vishal.l.verma@intel.com>, <seanjc@google.com>, <piliu@redhat.com>,
	<thuth@redhat.com>, <jbouron@amazon.com>, <me@linux.beauty>,
	<mclapinski@google.com>, <graf@amazon.com>, <bgwin@google.com>,
	<hbathini@linux.ibm.com>, <eric.devolder@oracle.com>,
	<takahiro.akashi@linaro.org>, <james.morse@arm.com>, <palmer@rivosinc.com>,
	<x86@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <loongarch@lists.linux.dev>,
	<linuxppc-dev@lists.ozlabs.org>, <driver-core@lists.linux.dev>,
	<kexec@lists.infradead.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v6 09/14] x86/crash: Fix massive out-of-bounds write on 32-bit Highmem
Date: Mon, 21 Sep 2026 17:04:45 +0800
Message-ID: <20260921090450.807575-10-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260921090450.807575-1-ruanjinjie@huawei.com>
References: <20260921090450.807575-1-ruanjinjie@huawei.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemk200008.china.huawei.com (7.202.194.74)

On 32-bit x86 systems with HIGHMEM, kmap_local_page() only maps a single
4KB page. However, the elfcorehdr segment can span several pages (up to
hundreds of kilobytes).

The original code blindly copies 'elfsz' bytes at once via
memcpy_flushcache(), overwriting adjacent fixmap entries or critical
virtual addresses.

Fix this by copying the new elfcorehdr page by page.

Cc: Thomas Gleixner <tglx@kernel.org>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>
Cc: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Cc: Vishal Verma <vishal.l.verma@intel.com>
Cc: Baoquan He <baoquan.he@linux.dev>
Cc: Chao Gao <chao.gao@intel.com>
Cc: Sean Christopherson <seanjc@google.com>
Cc: Eric DeVolder <eric.devolder@oracle.com>
Cc: Hari Bathini <hbathini@linux.ibm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Sourabh Jain <sourabhjain@linux.ibm.com>
Cc: stable@vger.kernel.org
Fixes: ea53ad9cf73b ("x86/crash: add x86 crash hotplug support")
Link: https://sashiko.dev/#/patchset/20260907125404.922123-1-ruanjinjie%40huawei.com
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/x86/kernel/crash.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/arch/x86/kernel/crash.c b/arch/x86/kernel/crash.c
index e681ec9cf1dc..3c9f4fbbe7ff 100644
--- a/arch/x86/kernel/crash.c
+++ b/arch/x86/kernel/crash.c
@@ -447,9 +447,10 @@ unsigned int arch_crash_get_elfcorehdr_size(void)
  */
 void arch_crash_handle_hotplug_event(struct kimage *image, void *arg)
 {
-	void *elfbuf = NULL, *old_elfcorehdr;
 	unsigned long mem, memsz;
 	unsigned long elfsz = 0;
+	void *elfbuf = NULL;
+	unsigned long done;
 
 	/*
 	 * As crash_prepare_elf64_headers() has already described all
@@ -484,21 +485,20 @@ void arch_crash_handle_hotplug_event(struct kimage *image, void *arg)
 
 	/*
 	 * Copy new elfcorehdr over the old elfcorehdr at destination.
-	 */
-	old_elfcorehdr = kmap_local_page(pfn_to_page(mem >> PAGE_SHIFT));
-	if (!old_elfcorehdr) {
-		pr_err("mapping elfcorehdr segment failed\n");
-		goto out;
-	}
-
-	/*
-	 * Temporarily invalidate the crash image while the
-	 * elfcorehdr is updated.
+	 * The segment is physically contiguous but can span several pages.
+	 * On 32-bit Highmem architectures, kmap_local_page() maps only a
+	 * single page at a time, so copy page by page.
 	 */
 	xchg(&kexec_crash_image, NULL);
-	memcpy_flushcache(old_elfcorehdr, elfbuf, elfsz);
+	for (done = 0; done < elfsz; ) {
+		size_t chunk = min_t(size_t, PAGE_SIZE, elfsz - done);
+		void *dst = kmap_local_page(pfn_to_page((mem + done) >> PAGE_SHIFT));
+
+		memcpy_flushcache(dst, elfbuf + done, chunk);
+		kunmap_local(dst);
+		done += chunk;
+	}
 	xchg(&kexec_crash_image, image);
-	kunmap_local(old_elfcorehdr);
 	pr_debug("updated elfcorehdr\n");
 
 out:
-- 
2.34.1

