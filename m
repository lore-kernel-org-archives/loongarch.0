Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.223
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793001204;
	b=fSUCCabM+7P1RSEKiEIJ31VYXYj4nSoJPbNDg9KCsPq4ILNS3YPAc88yPCFNn+uXNNkm
	 m5NxTFwfFMQvDUqt7HlKjYJIpLg2TF9Ik/NHJDAgxlYxIhLUzSfp3i413Z7S8FduWxi6l
	 85QTAJIpLbibAYgtfntsH0Qyzz3XP/U00t8pTsq/rv0tiL/KqOzq7+YlUa1xgVC8ZpP4f
	 UtJzKyW7+IwX2cJbNNm0PTjs7rvRrv6x1NQzMDG6OcfHhbK4cG/nM+3s+13uQtZzshdyr
	 S0t8s82gvfc/AAkcBc29WhT6F53KEC/EvG5N9I+Dajl25sh9WS8iN6nbDDAJZJq3hZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793001204;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=jdb+FzIP+JGrz3+cSov7xHfESxVUswVkb1EAdhB48po=;
	b=1Z3rzWENWsplqlidbNJc+tO3vH6SStVVpknBga1lioWa8mn0z8mkYD2Y14KtdnD7G5E4
	 /5xhtQUhmdV8l5lzWQ3hlNQm1J+i1f/DrhKDAmT2kCjAHqGYA7L8o9MGUhXQHh3xfdxQ9
	 8CS0CmwKS8sBBsYMguFXUBb7Oir4Aa/s6AgDdzRMSbmFkelnRk4gm8kO0rlN1S9uJpQCg
	 WSGT25vXfuZMQxpNyUIMGLTElRQYMevPP16Y2y9Q8sdlOnC1IfXepYL+pmO3wtwaeIett
	 X9Q7JMNTHGQ29fK6jsFk/9BDUDbRhPDCeCiCkVAlOURAeQwJ2Y0MmnJ5rh8s51d+AVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b="HG0/QuPq";
	arc=none smtp.remote-ip=113.46.200.223
Received: from canpmsgout08.his.huawei.com (canpmsgout08.his.huawei.com [113.46.200.223])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2238606A33D
	for <loongarch@lists.linux.dev>; Mon, 26 Oct 2026 07:53:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2238606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=HG0/QuPq
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=jdb+FzIP+JGrz3+cSov7xHfESxVUswVkb1EAdhB48po=;
	b=HG0/QuPqcSc5Txc+rnubE/9m3Di5iemqrPfWvL0PKSAMseALjazVprq/ZH0YJuSbx9GcAT3i5
	Bg2wZgbnfUOMPl50jf4lBomnkmrAHoElGSIe9Yi/LeqIDdKD/lRtA7zesXhK0BsxBOXbBrHTrN1
	Oxrh/0lAmGJVvj+weAA+WnI=
Received: from mail.maildlp.com (unknown [172.19.162.92])
	by canpmsgout08.his.huawei.com (SkyGuard) with ESMTPS id 4jCm860Ll1zmV7t;
	Mon, 26 Oct 2026 15:53:10 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 19ECD40586;
	Mon, 26 Oct 2026 15:53:15 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 26 Oct
 2026 15:53:13 +0800
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
Subject: [PATCH v7 10/15] riscv: kexec_file: Simplify load_extra_segments()
Date: Mon, 26 Oct 2026 15:51:56 +0800
Message-ID: <20261026075201.699550-11-ruanjinjie@huawei.com>
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

Pass the kbuf fields to crash_prepare_headers() and set elf_headers
before kexec_add_buffer(), so the error path needs no vfree()
because arch_kimage_file_post_load_cleanup() will do it.

Cc: Palmer Dabbelt <palmer@rivosinc.com>
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Baoquan He <baoquan.he@linux.dev>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/riscv/kernel/machine_kexec_file.c | 28 +++++++++++---------------
 1 file changed, 12 insertions(+), 16 deletions(-)

diff --git a/arch/riscv/kernel/machine_kexec_file.c b/arch/riscv/kernel/machine_kexec_file.c
index 26cd2a8bd0cd..ca921b063920 100644
--- a/arch/riscv/kernel/machine_kexec_file.c
+++ b/arch/riscv/kernel/machine_kexec_file.c
@@ -247,39 +247,35 @@ int load_extra_segments(struct kimage *image, unsigned long kernel_start,
 	int ret;
 	void *fdt;
 	unsigned long initrd_pbase = 0UL;
-	struct kexec_buf kbuf = {};
 	char *modified_cmdline = NULL;
-
-	kbuf.image = image;
-	kbuf.buf_min = kernel_start + kernel_len;
-	kbuf.buf_max = PFN_PHYS(max_low_pfn);
+	struct kexec_buf kbuf = {
+		.image = image,
+		.buf_min = kernel_start + kernel_len,
+		.buf_max = PFN_PHYS(max_low_pfn),
+	};
 
 #ifdef CONFIG_CRASH_DUMP
 	/* Add elfcorehdr */
 	if (image->type == KEXEC_TYPE_CRASH) {
-		void *headers;
-		unsigned long headers_sz;
-		ret = crash_prepare_headers(true, &headers, &headers_sz, NULL);
+		ret = crash_prepare_headers(true, &kbuf.buffer, &kbuf.bufsz, NULL);
 		if (ret) {
 			pr_err("Preparing elf core header failed\n");
 			goto out;
 		}
 
-		kbuf.buffer = headers;
-		kbuf.bufsz = headers_sz;
+		image->elf_headers = kbuf.buffer;
+		image->elf_headers_sz = kbuf.bufsz;
+
 		kbuf.mem = KEXEC_BUF_MEM_UNKNOWN;
-		kbuf.memsz = headers_sz;
+		kbuf.memsz = kbuf.bufsz;
 		kbuf.buf_align = ELF_CORE_HEADER_ALIGN;
 		kbuf.top_down = true;
 
 		ret = kexec_add_buffer(&kbuf);
-		if (ret) {
-			vfree(headers);
+		if (ret)
 			goto out;
-		}
-		image->elf_headers = headers;
+
 		image->elf_load_addr = kbuf.mem;
-		image->elf_headers_sz = headers_sz;
 
 		kexec_dprintk("Loaded elf core header at 0x%lx bufsz=0x%lx memsz=0x%lx\n",
 			      image->elf_load_addr, kbuf.bufsz, kbuf.memsz);
-- 
2.34.1

