Received: from out-178.mta1.migadu.com (out-178.mta1.migadu.com [95.215.58.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 431D32C15A5
	for <loongarch@lists.linux.dev>; Wed, 20 Aug 2025 05:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755669462; cv=none; b=Z3jiX9kROaMJlhdDa0pDmKk3xgm0v1V1AeYGrwq+wyHFYWXMZUReVs/QtQWuZmzOOI+/l2yRGiVXNUatKdz/aOS1Qmtlm2W+e+ff1wzcy0+MNbCwiw0mDX2qVdOFjEIzIK5eNYuEOfdSxLxW14pl77p3+58BadWHH7UVTW4SKDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755669462; c=relaxed/simple;
	bh=jUmK03O6qt39sW1JXmuJ0moazBFyYhowvw8E+5VSZXY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Q2RnrbwIWGvqi+QAxCJD/LbgGD5OLWEsaG2DcduxQ0m+kiZG1sqyawyIVt+RQ07udZQnVwIXXzDw1/QHaNnkbdENB9AI75k4YQCYXUZt7znaeXtSCLZsbuI/MIg03rMrWCENnIaRNQuH7j+MufTwdsU7GU/fSWe9OC070FRGOAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=HQ4MeK3j; arc=none smtp.client-ip=95.215.58.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="HQ4MeK3j"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1755669458;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BC7L55YtALYXWh7kK1DKLN5HZDHjt9lPYAHgNVecOSU=;
	b=HQ4MeK3jFv/WjRdqaVKNZXe5Qtn5cM1yAAOwNOYoa3cs7gn6A5n2JAl7Big2pAvy64FpPq
	pJMLE2Wo0xLrJScoX2oQNTDXoehwg67BMTl9KHFWYT8I3QQqHWj9NmMmnZ273y6WkQK2uQ
	5cRKdeM2MbLw+un8+5YLEb7Bsh2HQJc=
From: Youling Tang <youling.tang@linux.dev>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: WANG Xuerui <kernel@xen0n.name>,
	Baoquan He <bhe@redhat.com>,
	Yao Zi <ziyao@disroot.org>,
	kexec@lists.infradead.org,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	youling.tang@linux.dev,
	Youling Tang <tangyouling@kylinos.cn>
Subject: [PATCH v2 4/5] LoongArch/kexec_file: Add crash dump support
Date: Wed, 20 Aug 2025 13:56:59 +0800
Message-Id: <20250820055700.24344-5-youling.tang@linux.dev>
In-Reply-To: <20250820055700.24344-1-youling.tang@linux.dev>
References: <20250820055700.24344-1-youling.tang@linux.dev>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

From: Youling Tang <tangyouling@kylinos.cn>

Enabling crash dump (kdump) includes:
- Prepare contents of ELF header of a core dump file, /proc/vmcore,
  using crash_prepare_elf64_headers().
- Add "elfcorehdr=size@start" to cmdline.
- Add the "mem=size@start" parameter to the command line and pass it to
  the capture kernel.  Limit the runtime memory area of the captured
  kernel to avoid disrupting the production kernel's runtime state.

Signed-off-by: Youling Tang <tangyouling@kylinos.cn>
---
 arch/loongarch/kernel/machine_kexec_file.c | 117 +++++++++++++++++++++
 1 file changed, 117 insertions(+)

diff --git a/arch/loongarch/kernel/machine_kexec_file.c b/arch/loongarch/kernel/machine_kexec_file.c
index dc6e37457559..1d47be06549e 100644
--- a/arch/loongarch/kernel/machine_kexec_file.c
+++ b/arch/loongarch/kernel/machine_kexec_file.c
@@ -35,6 +35,83 @@ int arch_kimage_file_post_load_cleanup(struct kimage *image)
 	return kexec_image_post_load_cleanup_default(image);
 }
 
+#ifdef CONFIG_CRASH_DUMP
+
+static int prepare_elf_headers(void **addr, unsigned long *sz)
+{
+	struct crash_mem *cmem;
+	unsigned int nr_ranges;
+	int ret;
+	u64 i;
+	phys_addr_t start, end;
+
+	nr_ranges = 2; /* for exclusion of crashkernel region */
+	for_each_mem_range(i, &start, &end)
+		nr_ranges++;
+
+	cmem = kmalloc(struct_size(cmem, ranges, nr_ranges), GFP_KERNEL);
+	if (!cmem)
+		return -ENOMEM;
+
+	cmem->max_nr_ranges = nr_ranges;
+	cmem->nr_ranges = 0;
+	for_each_mem_range(i, &start, &end) {
+		cmem->ranges[cmem->nr_ranges].start = start;
+		cmem->ranges[cmem->nr_ranges].end = end - 1;
+		cmem->nr_ranges++;
+	}
+
+	/* Exclude crashkernel region */
+	ret = crash_exclude_mem_range(cmem, crashk_res.start, crashk_res.end);
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
+
+out:
+	kfree(cmem);
+	return ret;
+}
+
+/* Adds the "elfcorehdr=size@start" command line parameter to command line. */
+static void cmdline_add_elfcorehdr(struct kimage *image, unsigned long *cmdline_tmplen,
+				char *modified_cmdline, unsigned long elfcorehdr_sz)
+{
+	int elfcorehdr_strlen = 0;
+
+	elfcorehdr_strlen = sprintf(modified_cmdline + (*cmdline_tmplen), "elfcorehdr=0x%lx@0x%lx ",
+		elfcorehdr_sz, image->elf_load_addr);
+	*cmdline_tmplen += elfcorehdr_strlen;
+}
+
+/*
+ * Adds the "mem=size@start" command line parameter to command line, indicating the
+ * memory region the new kernel can use to boot into.
+ */
+static void cmdline_add_mem(struct kimage *image, unsigned long *cmdline_tmplen,
+				char *modified_cmdline)
+{
+	int mem_strlen = 0;
+
+	mem_strlen = sprintf(modified_cmdline + (*cmdline_tmplen), "mem=0x%llx@0x%llx ",
+		crashk_res.end - crashk_res.start + 1, crashk_res.start);
+	*cmdline_tmplen += mem_strlen;
+
+	if (crashk_low_res.end) {
+		mem_strlen = sprintf(modified_cmdline + (*cmdline_tmplen), "mem=0x%llx@0x%llx ",
+			crashk_low_res.end - crashk_low_res.start + 1, crashk_low_res.start);
+		*cmdline_tmplen += mem_strlen;
+	}
+}
+
+#endif
+
 /* Adds the "initrd=start,size" command line parameter to command line. */
 static void cmdline_add_initrd(struct kimage *image, unsigned long *cmdline_tmplen,
 				char *modified_cmdline, unsigned long initrd)
@@ -76,6 +153,46 @@ int load_other_segments(struct kimage *image,
 	/* Ensure it's nul terminated */
 	modified_cmdline[COMMAND_LINE_SIZE - 1] = '\0';
 
+#ifdef CONFIG_CRASH_DUMP
+	/* load elf core header */
+	void *headers;
+	unsigned long headers_sz;
+
+	if (image->type == KEXEC_TYPE_CRASH) {
+		ret = prepare_elf_headers(&headers, &headers_sz);
+		if (ret) {
+			pr_err("Preparing elf core header failed\n");
+			goto out_err;
+		}
+
+		kbuf.buffer = headers;
+		kbuf.bufsz = headers_sz;
+		kbuf.mem = KEXEC_BUF_MEM_UNKNOWN;
+		kbuf.memsz = headers_sz;
+		kbuf.buf_align = SZ_64K; /* largest supported page size */
+		kbuf.buf_max = ULONG_MAX;
+		kbuf.top_down = true;
+
+		ret = kexec_add_buffer(&kbuf);
+		if (ret) {
+			vfree(headers);
+			goto out_err;
+		}
+		image->elf_headers = headers;
+		image->elf_load_addr = kbuf.mem;
+		image->elf_headers_sz = headers_sz;
+
+		kexec_dprintk("Loaded elf core header at 0x%lx bufsz=0x%lx memsz=0x%lx\n",
+			      image->elf_load_addr, kbuf.bufsz, kbuf.memsz);
+
+		/* Add the elfcorehdr=size@start parameter to the command line */
+		cmdline_add_elfcorehdr(image, &cmdline_tmplen, modified_cmdline, headers_sz);
+
+		/* Add the mem=size@start parameter to the command line */
+		cmdline_add_mem(image, &cmdline_tmplen, modified_cmdline);
+	}
+#endif
+
 	/* load initrd */
 	if (initrd) {
 		kbuf.buffer = initrd;
-- 
2.43.0

