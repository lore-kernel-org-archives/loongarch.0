Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.218
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793001211;
	b=ZmHA9oTfa0M4Xan7LC5nwLSDjcqt09JT9I3/TP4SuJWQm4roaMdzsk4BSMJYfs5niQHL
	 na3iTFoDNPzrJR5I73PgNxsHN8Rso7wOTLfMDubU/HDZF4a5xtwmJhxlBSuiJgK9zkFF5
	 huKv6TRe9PHwjUH+0i1BOqgQ66B9D6efxhD/sgtPYLuQx/uzuY3sdM5i+IFB599VTs8Ss
	 Mpr53uuXgOuIwhPW+NS/lI3ZS/BvhTNupD0KujqZ40S+SQLKF/B0+gRsfhZl9zYfvj1hH
	 qrLCN/ybgX4xLACYUoHKl0dgowxV9WvPK1Rm3DWWrS9E3xsSbutIG0XbKnonejUaXEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793001211;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=bRgvT4M6zCmamxWGSrBdW+BlwCux5jgaEyxoifxfGVg=;
	b=GaDQC0c1CfWLT7WINCnLXfCu17isaHW67DYF+24jfXQ/NkZTredNbYIlHejeOv7ZlsTd
	 ARPzpQESEFfPKZK0PQkBLkDUdNy+uB3ZePSMzTO4ClHflKnznDSyLxxMDOPhrSQCGLF9l
	 2sARUSi5rmzENTBCHbir9+PeJYRdYtgNi/2x5Nb3b8q/2Fw2AXMazCsHQSek9VhFrCER3
	 n2gTXEVQ57c/BbZgGHuTfyoMRdNfMxSUEm7I7MwbytUTVxg/VNeiGnjcyEiK6IJb/u0+7
	 16HWr7IpSypDmsuw+WF8W/fKGtLqCHlAaa2aAPvVbsfCGa1HnW0+Mj1Ydu2+QBQuQhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b="i/tDu0hR";
	arc=none smtp.remote-ip=113.46.200.218
Received: from canpmsgout03.his.huawei.com (canpmsgout03.his.huawei.com [113.46.200.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AE4260A2636
	for <loongarch@lists.linux.dev>; Mon, 26 Oct 2026 07:53:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7AE4260A2636
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=i/tDu0hR
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=bRgvT4M6zCmamxWGSrBdW+BlwCux5jgaEyxoifxfGVg=;
	b=i/tDu0hR4P8PU+U8oPjyPQ9EF8alWIFqXGzv9qPyFbKCx309eZreFwDTG8P/PU+Az2OFHivnW
	dAukHMVSlOpNoil+ylf3dggtFS+JbQEj9vm+QAD3pPqNTSUJ2NZ/u6rHuupD1GkwERJcPZI/tpz
	ylHUt5cJqjHbMlOR32GhfdM=
Received: from mail.maildlp.com (unknown [172.19.162.140])
	by canpmsgout03.his.huawei.com (SkyGuard) with ESMTPS id 4jCm87640HzpStt;
	Mon, 26 Oct 2026 15:53:11 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id B1FE1202E6;
	Mon, 26 Oct 2026 15:53:20 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 26 Oct
 2026 15:53:19 +0800
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
Subject: [PATCH v7 14/15] LoongArch: kexec_file: Use kexec_load_other_segments() to simplify code
Date: Mon, 26 Oct 2026 15:52:00 +0800
Message-ID: <20261026075201.699550-15-ruanjinjie@huawei.com>
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

Replace the local copy with the common helper.  The retry loop stays
and the command line is built in the setup hook.

Cc: Huacai Chen <chenhuacai@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Baoquan He <baoquan.he@linux.dev>
Cc: Mike Rapoport <rppt@kernel.org>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/loongarch/include/asm/kexec.h         |  4 -
 arch/loongarch/kernel/kexec_efi.c          | 12 ++-
 arch/loongarch/kernel/kexec_elf.c          | 11 ++-
 arch/loongarch/kernel/machine_kexec_file.c | 94 ++++------------------
 4 files changed, 32 insertions(+), 89 deletions(-)

diff --git a/arch/loongarch/include/asm/kexec.h b/arch/loongarch/include/asm/kexec.h
index 6be136e9f0a0..e58cf7e282a9 100644
--- a/arch/loongarch/include/asm/kexec.h
+++ b/arch/loongarch/include/asm/kexec.h
@@ -49,10 +49,6 @@ extern const struct kexec_file_ops kexec_elf_ops;
 
 int arch_kimage_file_post_load_cleanup(struct kimage *image);
 #define arch_kimage_file_post_load_cleanup arch_kimage_file_post_load_cleanup
-
-extern int load_other_segments(struct kimage *image,
-		unsigned long kernel_load_addr, unsigned long kernel_size,
-		char *initrd, unsigned long initrd_len, char *cmdline, unsigned long cmdline_len);
 #endif
 
 typedef void (*do_kexec_t)(unsigned long efi_boot,
diff --git a/arch/loongarch/kernel/kexec_efi.c b/arch/loongarch/kernel/kexec_efi.c
index d42711b895a2..1362e51e9171 100644
--- a/arch/loongarch/kernel/kexec_efi.c
+++ b/arch/loongarch/kernel/kexec_efi.c
@@ -44,6 +44,12 @@ static void *efi_kexec_load(struct kimage *image,
 	unsigned long text_offset, kernel_segment_number;
 	struct kexec_buf kbuf = {};
 	struct kexec_segment *kernel_segment;
+	struct kexec_load_params params = {
+		.initrd = initrd,
+		.initrd_len = initrd_len,
+		.cmdline = cmdline,
+		.cmdline_len = cmdline_len,
+	};
 	struct loongarch_image_header *h;
 
 	h = (struct loongarch_image_header *)kernel;
@@ -76,9 +82,9 @@ static void *efi_kexec_load(struct kimage *image,
 	while ((ret = kexec_add_buffer(&kbuf)) == 0) {
 		/* Try to load additional data */
 		kernel_segment = &image->segment[kernel_segment_number];
-		ret = load_other_segments(image, kernel_segment->mem,
-					  kernel_segment->memsz, initrd,
-					  initrd_len, cmdline, cmdline_len);
+		params.kernel_load_addr = kernel_segment->mem;
+		params.kernel_size = kernel_segment->memsz;
+		ret = kexec_load_other_segments(image, &params, false);
 		if (!ret)
 			break;
 
diff --git a/arch/loongarch/kernel/kexec_elf.c b/arch/loongarch/kernel/kexec_elf.c
index 1b6b64744c7f..47272cfa990d 100644
--- a/arch/loongarch/kernel/kexec_elf.c
+++ b/arch/loongarch/kernel/kexec_elf.c
@@ -62,6 +62,12 @@ static void *elf_kexec_load(struct kimage *image,
 	struct kexec_buf kbuf = {};
 	struct kexec_elf_info elf_info;
 	struct kexec_segment *kernel_segment;
+	struct kexec_load_params params = {
+		.initrd = initrd,
+		.initrd_len = initrd_len,
+		.cmdline = cmdline,
+		.cmdline_len = cmdline_len,
+	};
 
 	ret = kexec_build_elf_info(kernel, kernel_len, &ehdr, &elf_info);
 	if (ret < 0)
@@ -83,8 +89,9 @@ static void *elf_kexec_load(struct kimage *image,
 
 	/* Load additional data */
 	kernel_segment = &image->segment[kernel_segment_number];
-	ret = load_other_segments(image, kernel_segment->mem, kernel_segment->memsz,
-				  initrd, initrd_len, cmdline, cmdline_len);
+	params.kernel_load_addr = kernel_segment->mem;
+	params.kernel_size = kernel_segment->memsz;
+	ret = kexec_load_other_segments(image, &params, false);
 	if (ret < 0)
 		goto out;
 
diff --git a/arch/loongarch/kernel/machine_kexec_file.c b/arch/loongarch/kernel/machine_kexec_file.c
index c0a799f0d240..d65cb40ef047 100644
--- a/arch/loongarch/kernel/machine_kexec_file.c
+++ b/arch/loongarch/kernel/machine_kexec_file.c
@@ -110,112 +110,46 @@ static void cmdline_add_elfcorehdr(struct kimage *image, unsigned long *cmdline_
 
 #endif
 
-/*
- * Try to add the initrd to the image. If it is not possible to find valid
- * locations, this function will undo changes to the image and return non zero.
- */
-int load_other_segments(struct kimage *image,
-			unsigned long kernel_load_addr, unsigned long kernel_size,
-			char *initrd, unsigned long initrd_len, char *cmdline, unsigned long cmdline_len)
+int arch_kexec_setup_other_segments(struct kimage *image,
+				    struct kexec_load_params *params,
+				    unsigned long initrd_load_addr)
 {
-	int ret = 0;
 	unsigned long cmdline_tmplen = 0;
-	unsigned long initrd_load_addr = 0;
-	unsigned long orig_segments = image->nr_segments;
-	char *modified_cmdline = NULL;
-	struct kexec_buf kbuf = {
-		.image = image,
-		/* Don't allocate anything below the kernel */
-		.buf_min = kernel_load_addr + kernel_size,
-		.buf_max = ULONG_MAX,
-	};
+	unsigned long cmdline_len = params->cmdline_len;
+	const char *cmdline = params->cmdline;
+	char *modified_cmdline;
 
 	modified_cmdline = kzalloc(COMMAND_LINE_SIZE, GFP_KERNEL);
 	if (!modified_cmdline)
-		return -EINVAL;
+		return -ENOMEM;
 
 	cmdline_add_loader(&cmdline_tmplen, modified_cmdline);
 	/* Ensure it's null terminated */
 	modified_cmdline[COMMAND_LINE_SIZE - 1] = '\0';
 
 #ifdef CONFIG_CRASH_DUMP
-	/* Load elf core header */
 	if (image->type == KEXEC_TYPE_CRASH) {
-		ret = crash_prepare_headers(true, &kbuf.buffer, &kbuf.bufsz, NULL);
-		if (ret < 0) {
-			pr_err("Preparing elf core header failed\n");
-			goto out_err;
-		}
-
-		if (unlikely(image->elf_headers))
-			vfree(image->elf_headers);
-
-		image->elf_headers = kbuf.buffer;
-		image->elf_headers_sz = kbuf.bufsz;
-
-		kbuf.mem = KEXEC_BUF_MEM_UNKNOWN;
-		kbuf.memsz = kbuf.bufsz;
-		kbuf.buf_align = SZ_64K; /* largest supported page size */
-		kbuf.top_down = true;
-
-		ret = kexec_add_buffer(&kbuf);
-		if (ret < 0)
-			goto out_err;
-
-		image->elf_load_addr = kbuf.mem;
-
-		kexec_dprintk("Loaded elf core header at 0x%lx bufsz=0x%lx memsz=0x%lx\n",
-			      image->elf_load_addr, kbuf.bufsz, kbuf.memsz);
-
 		/* Add the mem=size@start parameter to the command line */
 		cmdline_add_mem(&cmdline_tmplen, modified_cmdline);
 
 		/* Add the elfcorehdr=size@start parameter to the command line */
-		cmdline_add_elfcorehdr(image, &cmdline_tmplen, modified_cmdline, kbuf.bufsz);
+		cmdline_add_elfcorehdr(image, &cmdline_tmplen, modified_cmdline,
+				       image->elf_headers_sz);
 	}
 #endif
 
-	/* Load initrd */
-	if (initrd) {
-		kbuf.buffer = initrd;
-		kbuf.bufsz = initrd_len;
-		kbuf.mem = KEXEC_BUF_MEM_UNKNOWN;
-		kbuf.memsz = initrd_len;
-		kbuf.buf_align = 0;
-		/* within 1GB-aligned window of up to 32GB in size */
-		kbuf.buf_max = round_down(kernel_load_addr, SZ_1G) + (unsigned long)SZ_1G * 32;
-		kbuf.top_down = false;
-
-		ret = kexec_add_buffer(&kbuf);
-		if (ret < 0)
-			goto out_err;
-		initrd_load_addr = kbuf.mem;
-
-		kexec_dprintk("Loaded initrd at 0x%lx bufsz=0x%lx memsz=0x%lx\n",
-			      initrd_load_addr, kbuf.bufsz, kbuf.memsz);
-
-		/* Add the initrd=start,size parameter to the command line */
+	/* Add the initrd=start,size parameter to the command line */
+	if (initrd_load_addr)
 		cmdline_add_initrd(image, &cmdline_tmplen, modified_cmdline, initrd_load_addr);
-	}
 
 	if (cmdline_len + cmdline_tmplen > COMMAND_LINE_SIZE) {
 		pr_err("Appending command line exceeds COMMAND_LINE_SIZE\n");
-		ret = -EINVAL;
-		goto out_err;
+		kfree(modified_cmdline);
+		return -EINVAL;
 	}
 
 	memcpy(modified_cmdline + cmdline_tmplen, cmdline, cmdline_len);
-	cmdline = modified_cmdline;
-	image->arch.cmdline_ptr = (unsigned long)cmdline;
+	image->arch.cmdline_ptr = (unsigned long)modified_cmdline;
 
 	return 0;
-
-out_err:
-	while (image->nr_segments > orig_segments) {
-		kexec_free_segment_cma(image, image->nr_segments - 1);
-		image->nr_segments--;
-	}
-
-	kfree(modified_cmdline);
-	return ret;
 }
-- 
2.34.1

