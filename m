Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.227
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795774205;
	b=T0yJi4+9F8Z+4pZMJ2F0NQxIb0Jyr20g2ERrFu3bGf4KPnpBTL+NxFarFSmXHLOZ7T6o
	 baz/wdO3NZ+AyLahjJL+PoHtrvEYTBmbKZRNbE2OKd0JcDY1kmKLCJOcXlvhBn4UNV79t
	 gLXEvZSpPvTB2/zhOnSm86M7HkHIsQaxkTlPpLqv/QvF1Hl08+Sb0rOUyDcNRQgvJ0Wa6
	 4Qty2z33BJs+o5yVZgrmreCkk6eB2cFvTzQkXUfxGGJMUbp6DAuM03UGHPcJEs39cUoXN
	 TCBwvyIabj0npv1tsLze/Dk9Bt+FYZ/QZ7rdo7u/Wp1DEJ1CwtYTJVWrlzhWuw14GRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795774205;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=Y+8esIzy3HGc7baFOxr0J9l5i1aOQIteFiEEQAEe5Wc=;
	b=0mUa5aQNgUDpak1gyU2DmuflkDyy3jQ/XMr/Tyi3nlhP79D6DW0+n1ezrs2l3NrYhDpR
	 oZssjY7G/qxsuxbxl9JULgfYid6dzPZH4vbFDzgLGobLZXg1vgDcfRL+VhZE/fUb0P10S
	 Yy2AOCdS3JNP5MCOstFxtQKf6IDJE8LURjTdyp5KQryzF0Np/YxQBYYgS/++T/wnlT260
	 HzS3nz3c54o3wsQ0LQhpiRHPFMEUCFgaXUsb3p8g0VImWxSj0HqShXCK/3dOuOxWcQjjn
	 GaO1m15o2Azz02GOhmp4bAeWMUx9ox+Zf89aAqjqlafbVvf424dLy86m/AqP+i3M2gg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=ralukStp;
	arc=none smtp.remote-ip=113.46.200.227
Received: from canpmsgout12.his.huawei.com (canpmsgout12.his.huawei.com [113.46.200.227])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 946B3606A698
	for <loongarch@lists.linux.dev>; Fri, 27 Nov 2026 10:10:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 946B3606A698
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=ralukStp
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=Y+8esIzy3HGc7baFOxr0J9l5i1aOQIteFiEEQAEe5Wc=;
	b=ralukStpMnZCFDbjsBNKi23H9eY1q0Ay52QwscAWmLrQ5o4Hvw/ZRgVZV5BhNn7F6HqgzyKk9
	Fm/nX3ahDDG4/8JaE7Buydy1FOnlrXMkK2iOd1mAUlm3kZ73EiJAyJy1yaKuGn1ggbZT1T4G0fm
	Gc47bnfBIesSI/2v9ZkaSFE=
Received: from mail.maildlp.com (unknown [172.19.163.127])
	by canpmsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4jbTf35gbbznTWH;
	Fri, 27 Nov 2026 18:08:59 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 9C6C140561;
	Fri, 27 Nov 2026 18:09:47 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 27 Nov
 2026 18:09:45 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <mark.rutland@arm.com>,
	<chenhuacai@kernel.org>, <kernel@xen0n.name>, <maddy@linux.ibm.com>,
	<mpe@ellerman.id.au>, <npiggin@gmail.com>, <chleroy@kernel.org>,
	<ritesh.list@gmail.com>, <sshegde@linux.ibm.com>, <pjw@kernel.org>,
	<palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <alex@ghiti.fr>,
	<tglx@kernel.org>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>, <hpa@zytor.com>, <robh@kernel.org>,
	<saravanak@kernel.org>, <akpm@linux-foundation.org>, <baoquan.he@linux.dev>,
	<rppt@kernel.org>, <pasha.tatashin@soleen.com>, <pratyush@kernel.org>,
	<ben@cressey.dev>, <leitao@debian.org>, <mpilaniy@redhat.com>,
	<yeoreum.yun@arm.com>, <coiby.xu@gmail.com>, <Yeking@Red54.com>,
	<prudo@redhat.com>, <bradley.morgan@linux.dev>, <sourabhjain@linux.ibm.com>,
	<blum@kernel.org>, <hbathini@linux.ibm.com>, <qirui.001@bytedance.com>,
	<hui.wang@canonical.com>, <sohammetha01@gmail.com>, <guoren@kernel.org>,
	<gaohan@iscas.ac.cn>, <ionut.nechita@windriver.com>,
	<vishal.l.verma@intel.com>, <seanjc@google.com>, <ardb@kernel.org>,
	<arnd@arndb.de>, <tzimmermann@suse.de>, <kas@kernel.org>,
	<rick.p.edgecombe@intel.com>, <mhklinux@outlook.com>, <piliu@redhat.com>,
	<shradhagupta@linux.microsoft.com>, <thuth@redhat.com>,
	<ebiggers@kernel.org>, <me@linux.beauty>, <mclapinski@google.com>,
	<graf@amazon.com>, <tangyouling@kylinos.cn>, <x86@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <loongarch@lists.linux.dev>,
	<linuxppc-dev@lists.ozlabs.org>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<kexec@lists.infradead.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v9 03/11] arm64: kexec_file: Load the other segments with common helpers
Date: Fri, 27 Nov 2026 18:09:17 +0800
Message-ID: <20261127100925.3019877-4-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261127100925.3019877-1-ruanjinjie@huawei.com>
References: <20261127100925.3019877-1-ruanjinjie@huawei.com>
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

Use the common segment helpers to load the elf core header, the initrd
and the DTB instead of open coding them.  The initrd and the command line
come from the image.

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Baoquan He <baoquan.he@linux.dev>
Cc: Mike Rapoport <rppt@kernel.org>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/arm64/include/asm/kexec.h         |  4 +-
 arch/arm64/kernel/kexec_image.c        |  3 +-
 arch/arm64/kernel/machine_kexec_file.c | 81 ++++++--------------------
 3 files changed, 20 insertions(+), 68 deletions(-)

diff --git a/arch/arm64/include/asm/kexec.h b/arch/arm64/include/asm/kexec.h
index 0be042ec22c1..f844fb5fe3ef 100644
--- a/arch/arm64/include/asm/kexec.h
+++ b/arch/arm64/include/asm/kexec.h
@@ -127,9 +127,7 @@ int arch_kimage_file_post_load_cleanup(struct kimage *image);
 #define arch_kimage_file_post_load_cleanup arch_kimage_file_post_load_cleanup
 
 extern int load_other_segments(struct kimage *image,
-		unsigned long kernel_load_addr, unsigned long kernel_size,
-		char *initrd, unsigned long initrd_len,
-		char *cmdline);
+		unsigned long kernel_load_addr, unsigned long kernel_size);
 #endif
 
 #endif /* __ASSEMBLER__ */
diff --git a/arch/arm64/kernel/kexec_image.c b/arch/arm64/kernel/kexec_image.c
index f4ad22447259..a2a7c283b331 100644
--- a/arch/arm64/kernel/kexec_image.c
+++ b/arch/arm64/kernel/kexec_image.c
@@ -104,8 +104,7 @@ static void *image_load(struct kimage *image,
 		/* Try to load additional data */
 		kernel_segment = &image->segment[kernel_segment_number];
 		ret = load_other_segments(image, kernel_segment->mem,
-					  kernel_segment->memsz, initrd,
-					  initrd_len, cmdline);
+					  kernel_segment->memsz);
 		if (!ret)
 			break;
 
diff --git a/arch/arm64/kernel/machine_kexec_file.c b/arch/arm64/kernel/machine_kexec_file.c
index 097ee397e949..dff2cd613f87 100644
--- a/arch/arm64/kernel/machine_kexec_file.c
+++ b/arch/arm64/kernel/machine_kexec_file.c
@@ -68,54 +68,33 @@ int arch_crash_populate_cmem(struct crash_mem *cmem)
  * valid locations, this function will undo changes to the image and return non
  * zero.
  */
-int load_other_segments(struct kimage *image,
-			unsigned long kernel_load_addr,
-			unsigned long kernel_size,
-			char *initrd, unsigned long initrd_len,
-			char *cmdline)
+int load_other_segments(struct kimage *image, unsigned long kernel_load_addr,
+			unsigned long kernel_size)
 {
-	struct kexec_buf kbuf = {};
+	unsigned long initrd_load_addr = 0, orig_segments = image->nr_segments;
+	struct kexec_buf kbuf = {
+		.image = image,
+		/* not allocate anything below the kernel */
+		.buf_min = kernel_load_addr + kernel_size,
+		.buf_max = ULONG_MAX,
+	};
 	void *dtb = NULL;
-	unsigned long initrd_load_addr = 0, dtb_len,
-		      orig_segments = image->nr_segments;
 	int ret = 0;
 
-	kbuf.image = image;
-	/* not allocate anything below the kernel */
-	kbuf.buf_min = kernel_load_addr + kernel_size;
-
 #ifdef CONFIG_CRASH_DUMP
 	/* load elf core header */
-	void *headers;
-	unsigned long headers_sz;
 	if (image->type == KEXEC_TYPE_CRASH) {
-		ret = crash_prepare_headers(true, &headers, &headers_sz, NULL);
-		if (ret) {
-			pr_err("Preparing elf core header failed\n");
+		ret = kexec_prepare_elf_core_header(image, true, NULL);
+		if (ret)
 			goto out_err;
-		}
 
-		kbuf.buffer = headers;
-		kbuf.bufsz = headers_sz;
-		kbuf.mem = KEXEC_BUF_MEM_UNKNOWN;
-		kbuf.memsz = headers_sz;
 		kbuf.buf_align = SZ_64K; /* largest supported page size */
-		kbuf.buf_max = ULONG_MAX;
 		kbuf.top_down = true;
+		kbuf.memsz = image->elf_headers_sz;
 
-		ret = kexec_add_buffer(&kbuf);
-		if (ret) {
-			vfree(headers);
+		ret = kexec_add_elf_core_header(image, &kbuf);
+		if (ret)
 			goto out_err;
-		}
-
-		vfree(image->elf_headers);
-		image->elf_headers = headers;
-		image->elf_load_addr = kbuf.mem;
-		image->elf_headers_sz = headers_sz;
-
-		kexec_dprintk("Loaded elf core header at 0x%lx bufsz=0x%lx memsz=0x%lx\n",
-			      image->elf_load_addr, kbuf.bufsz, kbuf.memsz);
 
 		ret = crash_load_dm_crypt_keys(image);
 		if (ret)
@@ -124,56 +103,32 @@ int load_other_segments(struct kimage *image,
 #endif
 
 	/* load initrd */
-	if (initrd) {
-		kbuf.buffer = initrd;
-		kbuf.bufsz = initrd_len;
-		kbuf.mem = KEXEC_BUF_MEM_UNKNOWN;
-		kbuf.memsz = initrd_len;
+	if (image->initrd_buf) {
 		kbuf.buf_align = 0;
 		/* within 1GB-aligned window of up to 32GB in size */
 		kbuf.buf_max = round_down(kernel_load_addr, SZ_1G)
 						+ (unsigned long)SZ_1G * 32;
 		kbuf.top_down = false;
 
-		ret = kexec_add_buffer(&kbuf);
+		ret = kexec_add_initrd(image, &kbuf);
 		if (ret)
 			goto out_err;
 		initrd_load_addr = kbuf.mem;
-
-		kexec_dprintk("Loaded initrd at 0x%lx bufsz=0x%lx memsz=0x%lx\n",
-			      initrd_load_addr, kbuf.bufsz, kbuf.memsz);
 	}
 
 	/* load dtb */
-	dtb = of_kexec_alloc_and_setup_fdt(image, initrd_load_addr,
-					   initrd_len, cmdline, 0);
-	if (!dtb) {
-		pr_err("Preparing for new dtb failed\n");
-		ret = -EINVAL;
-		goto out_err;
-	}
-
-	/* trim it */
-	fdt_pack(dtb);
-	dtb_len = fdt_totalsize(dtb);
-	kbuf.buffer = dtb;
-	kbuf.bufsz = dtb_len;
-	kbuf.mem = KEXEC_BUF_MEM_UNKNOWN;
-	kbuf.memsz = dtb_len;
 	/* not across 2MB boundary */
 	kbuf.buf_align = SZ_2M;
 	kbuf.buf_max = ULONG_MAX;
 	kbuf.top_down = true;
 
-	ret = kexec_add_buffer(&kbuf);
+	ret = of_kexec_add_fdt(image, &kbuf, initrd_load_addr,
+			       image->cmdline_buf, &dtb);
 	if (ret)
 		goto out_err;
 	image->arch.dtb = dtb;
 	image->arch.dtb_mem = kbuf.mem;
 
-	kexec_dprintk("Loaded dtb at 0x%lx bufsz=0x%lx memsz=0x%lx\n",
-		      kbuf.mem, kbuf.bufsz, kbuf.memsz);
-
 	return 0;
 
 out_err:
-- 
2.34.1

