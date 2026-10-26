Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.221
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793001198;
	b=WkpF8bgcfCWxMru+ElraiYbXPDGxvIrxUogmbWXLR0Vi0eTom8XQneDRaamHFVapAO/Z
	 MeKxvIkeGFi5L6SvwGEet+cy/ne7za5rdatZUdJgfAt6mRQ2cBt28AnL4DSLJmm+QEZRq
	 AJFQh6X0a7QybwU3NSiSdk02MUXR5YtX4C44KRufrA/Bs7HTBJSch40omrk0/IuXNB/e0
	 4j6FMu8N12O07YzFE3hfLf3T6oPl1nYJMIh8ohRI1beYcCWlhJ+PPVKJ70y6no/rGipqJ
	 YNXw27p5Yr2aGwIwg3S4M1q7e1aFtU8wDC9EwFcfBxn5DdvtpAoeb2OBt8KQrBxXsmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793001198;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=lBSbdzk+KpYEiCHxWrAteC3XLGeLckgVtqnmcjJZpgY=;
	b=zdyUYPFG+JXBYCTTIm4/gwn8zBQ+8M//mjSuRNJN15+yA4o0tGhQ6DhoNe1TG4EbZxO4
	 3a8EUJV6JYy3rqdit0rsZSHLc6966ue4YLuwUCyYWBYj02Y750YEPbAw1EhvIbbdnbF4h
	 BHOHbzYXph/hU2ktEx9prx7FotziELj5yvyaRTXYR1rcVHiOC9N/PGLUMe5RwN9JYrFPi
	 7W4T0H/RBqnmH3V4q9swCiQVkIdZCGmBKxQpDXnR+ys+7xoBbLjhkqQ7msE8eR8cctKfp
	 uEmeeK8kpNMPVoIcYUa6e/pO2Du+zwq/rusEqyzta0nXJwHzxFuzvN2V/wrSqYFPyig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b="Gj5/t9dR";
	arc=none smtp.remote-ip=113.46.200.221
Received: from canpmsgout06.his.huawei.com (canpmsgout06.his.huawei.com [113.46.200.221])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFDAD606A31A
	for <loongarch@lists.linux.dev>; Mon, 26 Oct 2026 07:53:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DFDAD606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=Gj5/t9dR
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=lBSbdzk+KpYEiCHxWrAteC3XLGeLckgVtqnmcjJZpgY=;
	b=Gj5/t9dR6uOb/sqObo2h1c/mp6cZN7VBilYQfUIrG/i+x8sCpOcXGqEw8baxq4BJiJtEemTtj
	avT/h1u17G2sOm3QwQ5jDeh6P3wvU5ls3/yzd113WKg/LqnH1WS7t6RNMaOcVggchNQOpJRYUe6
	AVvszeWa48DheR658dsdWC8=
Received: from mail.maildlp.com (unknown [172.19.162.223])
	by canpmsgout06.his.huawei.com (SkyGuard) with ESMTPS id 4jCm823HPrzRhXR;
	Mon, 26 Oct 2026 15:53:06 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id B859340561;
	Mon, 26 Oct 2026 15:53:13 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 26 Oct
 2026 15:53:12 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <mark.rutland@arm.com>,
	<chenhuacai@kernel.org>, <kernel@xen0n.name>, <maddy@linux.ibm.com>,
	<mpe@ellerman.id.au>, <npiggin@gmail.com>, <chleroy@kernel.org>,
	<ritesh.list@gmail.com>, <sshegde@linux.ibm.com>, <pjw@kernel.org>,
	<palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <alex@ghiti.fr>,
	<tglx@kernel.org>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>, <hpa@zytor.com>, <akpm@linux-foundation.org>,
	<baoquan.he@linux.dev>, <rppt@kernel.org>, <pasha.tatashin@soleen.com>,
	<pratyush@kernel.org>, <thuth@redhat.com>, <ruanjinjie@huawei.com>,
	<leitao@debian.org>, <yeoreum.yun@arm.com>, <robh@kernel.org>,
	<sourabhjain@linux.ibm.com>, <kees@kernel.org>, <coiby.xu@gmail.com>,
	<Yeking@Red54.com>, <tangyouling@kylinos.cn>, <maqianga@uniontech.com>,
	<zhangtianyang@loongson.cn>, <guodongtai@kylinos.cn>, <blum@kernel.org>,
	<adityag@linux.ibm.com>, <hui.wang@canonical.com>, <sohammetha01@gmail.com>,
	<guoren@kernel.org>, <gaohan@iscas.ac.cn>, <kai.huang@intel.com>,
	<kas@kernel.org>, <vishal.l.verma@intel.com>, <piliu@redhat.com>,
	<jbouron@amazon.com>, <mclapinski@google.com>, <me@linux.beauty>,
	<graf@amazon.com>, <bgwin@google.com>, <x86@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<loongarch@lists.linux.dev>, <linuxppc-dev@lists.ozlabs.org>,
	<linux-riscv@lists.infradead.org>, <kexec@lists.infradead.org>
Subject: [PATCH v7 09/15] LoongArch: kexec_file: Simplify load_other_segments()
Date: Mon, 26 Oct 2026 15:51:55 +0800
Message-ID: <20261026075201.699550-10-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261026075201.699550-1-ruanjinjie@huawei.com>
References: <20261026075201.699550-1-ruanjinjie@huawei.com>
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

Pass the kbuf fields to crash_prepare_headers() and set
elf_headers before kexec_add_buffer(), so the error path needs
no vfree() because arch_kimage_file_post_load_cleanup() will do it.

Cc: Huacai Chen <chenhuacai@kernel.org>
Cc: Baoquan He <baoquan.he@linux.dev>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/loongarch/kernel/machine_kexec_file.c | 38 +++++++++-------------
 1 file changed, 16 insertions(+), 22 deletions(-)

diff --git a/arch/loongarch/kernel/machine_kexec_file.c b/arch/loongarch/kernel/machine_kexec_file.c
index 3beb6977ecc6..6ea60e0faa2c 100644
--- a/arch/loongarch/kernel/machine_kexec_file.c
+++ b/arch/loongarch/kernel/machine_kexec_file.c
@@ -127,11 +127,12 @@ int load_other_segments(struct kimage *image,
 	unsigned long initrd_load_addr = 0;
 	unsigned long orig_segments = image->nr_segments;
 	char *modified_cmdline = NULL;
-	struct kexec_buf kbuf = {};
-
-	kbuf.image = image;
-	/* Don't allocate anything below the kernel */
-	kbuf.buf_min = kernel_load_addr + kernel_size;
+	struct kexec_buf kbuf = {
+		.image = image,
+		/* Don't allocate anything below the kernel */
+		.buf_min = kernel_load_addr + kernel_size,
+		.buf_max = ULONG_MAX,
+	};
 
 	modified_cmdline = kzalloc(COMMAND_LINE_SIZE, GFP_KERNEL);
 	if (!modified_cmdline)
@@ -144,35 +145,28 @@ int load_other_segments(struct kimage *image,
 #ifdef CONFIG_CRASH_DUMP
 	/* Load elf core header */
 	if (image->type == KEXEC_TYPE_CRASH) {
-		void *headers;
-		unsigned long headers_sz;
-
-		ret = crash_prepare_headers(true, &headers, &headers_sz, NULL);
+		ret = crash_prepare_headers(true, &kbuf.buffer, &kbuf.bufsz, NULL);
 		if (ret < 0) {
 			pr_err("Preparing elf core header failed\n");
 			goto out_err;
 		}
 
-		kbuf.buffer = headers;
-		kbuf.bufsz = headers_sz;
+		if (unlikely(image->elf_headers))
+			vfree(image->elf_headers);
+
+		image->elf_headers = kbuf.buffer;
+		image->elf_headers_sz = kbuf.bufsz;
+
 		kbuf.mem = KEXEC_BUF_MEM_UNKNOWN;
-		kbuf.memsz = headers_sz;
+		kbuf.memsz = kbuf.bufsz;
 		kbuf.buf_align = SZ_64K; /* largest supported page size */
-		kbuf.buf_max = ULONG_MAX;
 		kbuf.top_down = true;
 
 		ret = kexec_add_buffer(&kbuf);
-		if (ret < 0) {
-			vfree(headers);
+		if (ret < 0)
 			goto out_err;
-		}
-
-		if (unlikely(image->elf_headers))
-			vfree(image->elf_headers);
 
-		image->elf_headers = headers;
 		image->elf_load_addr = kbuf.mem;
-		image->elf_headers_sz = headers_sz;
 
 		kexec_dprintk("Loaded elf core header at 0x%lx bufsz=0x%lx memsz=0x%lx\n",
 			      image->elf_load_addr, kbuf.bufsz, kbuf.memsz);
@@ -181,7 +175,7 @@ int load_other_segments(struct kimage *image,
 		cmdline_add_mem(&cmdline_tmplen, modified_cmdline);
 
 		/* Add the elfcorehdr=size@start parameter to the command line */
-		cmdline_add_elfcorehdr(image, &cmdline_tmplen, modified_cmdline, headers_sz);
+		cmdline_add_elfcorehdr(image, &cmdline_tmplen, modified_cmdline, kbuf.bufsz);
 	}
 #endif
 
-- 
2.34.1

