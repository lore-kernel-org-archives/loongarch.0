Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.219
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793001206;
	b=d1m327lLTcXtX4vSqEDyTxKzQk6UUYqxmy+3nX9mjesepFLp/4H6SB8RGlKV16/NOzPB
	 7MojyV1VxS3TjxkH78E5dShcFLgHoYwMHYBPYmhNTrEsjX286Ng3h0gnxpO9WUBHdALuc
	 n7mROcUOeb/NcAtB3HYEymQblpn2cG+swjXO5/T1JKmA/tUccIMPxMqJC3nKJbYYiOrL7
	 nSYJha7R0EoBQ0ZAWpRQ+vdOAy6qUtxK53ztocBl7avKFVG5RnVkvrPRqdu8QTeZfOuFp
	 WpLi/dnRHw8778jMtkQpxPeJ+EshRRIRaW6lb0Ec7bjn0LsnkMHbsKUn8SN7/cC+29Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793001206;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=7H64bTVCPsglH5oQkvbahT7Iyth8QZTOTgxkAwcQAL4=;
	b=gOTgj1PZ5eEjEDSBptv0vD9RRp5CNHPti3z0qiOG7xRuP1t7YvHJPjuSawC/r0qml9D7
	 euyQHcTUJJn2i3Jt66zU/ZWv4TxUDOABVeFpNazXH4QgW5f/WZA4Ymh45LTu3EpNsDGOR
	 aasvhG9jeeGM6X8GAFTCcTwt65xPts/R8OuhMRgZMGUiOu53wX9kV++isWHJD9av/j6gK
	 LfUH1oPAys5saDREk2dKAAZi7zcQEO0aXznXTfHT/R2/A9j4fSwxhNmIXG5gGmqXiLXbW
	 0fPByA653fl2pRyIf8LAXu1JxZsALixaYnG3pnkh0yKGmlnrCxKPDHVy7BhCw6OCkUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=LhZdWlpY;
	arc=none smtp.remote-ip=113.46.200.219
Received: from canpmsgout04.his.huawei.com (canpmsgout04.his.huawei.com [113.46.200.219])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0A3D60A3808
	for <loongarch@lists.linux.dev>; Mon, 26 Oct 2026 07:53:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0A3D60A3808
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=LhZdWlpY
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=7H64bTVCPsglH5oQkvbahT7Iyth8QZTOTgxkAwcQAL4=;
	b=LhZdWlpYGh5Hie+QsKe8U5cnQOnd1upYBlst5kgpKz5R7GDhjEr7iJTZ1l/cNnyM20C75+wJG
	HW4zmrjGfKXrqOc80L7Yg//KogmJMJH4e1JSppRFkJ8nr+3Il/1SM4UuC1REW2ybbf1N5LS02LG
	9j6DKQ5fn0Sek6DbtVeb7Fw=
Received: from mail.maildlp.com (unknown [172.19.162.144])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4jCm8C22Pgz1prr8;
	Mon, 26 Oct 2026 15:53:15 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 243DC4056D;
	Mon, 26 Oct 2026 15:53:22 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 26 Oct
 2026 15:53:20 +0800
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
Subject: [PATCH v7 15/15] riscv: kexec_file: Use kexec_load_other_segments() to simplify code
Date: Mon, 26 Oct 2026 15:52:01 +0800
Message-ID: <20261026075201.699550-16-ruanjinjie@huawei.com>
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

Replace load_extra_segments() with the common helper.

The purgatory, DTB and kdump command line move to the setup hook. And the elf
core header is now 64K aligned.

Cc: Palmer Dabbelt <palmer@rivosinc.com>
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Baoquan He <baoquan.he@linux.dev>
Cc: Mike Rapoport <rppt@kernel.org>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/riscv/include/asm/kexec.h         |  4 --
 arch/riscv/kernel/kexec_elf.c          | 11 ++++-
 arch/riscv/kernel/kexec_image.c        | 11 ++++-
 arch/riscv/kernel/machine_kexec_file.c | 65 ++++++--------------------
 4 files changed, 31 insertions(+), 60 deletions(-)

diff --git a/arch/riscv/include/asm/kexec.h b/arch/riscv/include/asm/kexec.h
index b9ee8346cc8c..b0400de9acfd 100644
--- a/arch/riscv/include/asm/kexec.h
+++ b/arch/riscv/include/asm/kexec.h
@@ -69,10 +69,6 @@ struct kimage;
 int arch_kimage_file_post_load_cleanup(struct kimage *image);
 #define arch_kimage_file_post_load_cleanup arch_kimage_file_post_load_cleanup
 
-int load_extra_segments(struct kimage *image, unsigned long kernel_start,
-			unsigned long kernel_len, char *initrd,
-			unsigned long initrd_len, char *cmdline,
-			unsigned long cmdline_len);
 #endif
 
 #endif
diff --git a/arch/riscv/kernel/kexec_elf.c b/arch/riscv/kernel/kexec_elf.c
index 3e9a32acb8f2..202600760f91 100644
--- a/arch/riscv/kernel/kexec_elf.c
+++ b/arch/riscv/kernel/kexec_elf.c
@@ -110,6 +110,12 @@ static void *elf_kexec_load(struct kimage *image, char *kernel_buf,
 	unsigned long new_kernel_pbase = 0UL;
 	struct elfhdr ehdr;
 	struct kexec_elf_info elf_info;
+	struct kexec_load_params params = {
+		.initrd = initrd,
+		.initrd_len = initrd_len,
+		.cmdline = cmdline,
+		.cmdline_len = cmdline_len,
+	};
 
 	ret = kexec_build_elf_info(kernel_buf, kernel_len, &ehdr, &elf_info);
 	if (ret)
@@ -126,8 +132,9 @@ static void *elf_kexec_load(struct kimage *image, char *kernel_buf,
 	if (ret)
 		goto out;
 
-	ret = load_extra_segments(image, image->start, kernel_len,
-				  initrd, initrd_len, cmdline, cmdline_len);
+	params.kernel_load_addr = image->start;
+	params.kernel_size = kernel_len;
+	ret = kexec_load_other_segments(image, &params, true);
 out:
 	kexec_free_elf_info(&elf_info);
 	return ret ? ERR_PTR(ret) : NULL;
diff --git a/arch/riscv/kernel/kexec_image.c b/arch/riscv/kernel/kexec_image.c
index 51dc89259f16..e0d0aa912a76 100644
--- a/arch/riscv/kernel/kexec_image.c
+++ b/arch/riscv/kernel/kexec_image.c
@@ -42,6 +42,12 @@ static void *image_load(struct kimage *image,
 	u64 flags;
 	bool be_image, be_kernel;
 	struct kexec_buf kbuf = {};
+	struct kexec_load_params params = {
+		.initrd = initrd,
+		.initrd_len = initrd_len,
+		.cmdline = cmdline,
+		.cmdline_len = cmdline_len,
+	};
 	int ret;
 
 	/* Check Image header */
@@ -83,8 +89,9 @@ static void *image_load(struct kimage *image,
 	pr_info("Loaded kernel at 0x%lx bufsz=0x%lx memsz=0x%lx\n",
 		kbuf.mem, kbuf.bufsz, kbuf.memsz);
 
-	ret = load_extra_segments(image, kbuf.mem, kbuf.memsz,
-				  initrd, initrd_len, cmdline, cmdline_len);
+	params.kernel_load_addr = kbuf.mem;
+	params.kernel_size = kbuf.memsz;
+	ret = kexec_load_other_segments(image, &params, true);
 
 out:
 	return ret ? ERR_PTR(ret) : NULL;
diff --git a/arch/riscv/kernel/machine_kexec_file.c b/arch/riscv/kernel/machine_kexec_file.c
index d191351c6055..e79b71a8b7aa 100644
--- a/arch/riscv/kernel/machine_kexec_file.c
+++ b/arch/riscv/kernel/machine_kexec_file.c
@@ -234,51 +234,26 @@ int arch_kexec_apply_relocations_add(struct purgatory_info *pi,
 	return 0;
 }
 
-
-int load_extra_segments(struct kimage *image, unsigned long kernel_start,
-			    unsigned long kernel_len, char *initrd,
-			    unsigned long initrd_len, char *cmdline,
-			    unsigned long cmdline_len)
+int arch_kexec_setup_other_segments(struct kimage *image,
+				    struct kexec_load_params *params,
+				    unsigned long initrd_load_addr)
 {
-	int ret;
-	void *fdt;
-	unsigned long initrd_pbase = 0UL;
-	char *modified_cmdline = NULL;
+	unsigned long kernel_start = params->kernel_load_addr;
+	char *cmdline = params->cmdline;
 	struct kexec_buf kbuf = {
 		.image = image,
-		.buf_min = kernel_start + kernel_len,
+		.buf_min = kernel_start + params->kernel_size,
 		.buf_max = PFN_PHYS(max_low_pfn),
 	};
+	char *modified_cmdline = NULL;
+	void *fdt;
+	int ret;
 
 #ifdef CONFIG_CRASH_DUMP
-	/* Add elfcorehdr */
+	/* Setup cmdline for kdump kernel case */
 	if (image->type == KEXEC_TYPE_CRASH) {
-		ret = crash_prepare_headers(true, &kbuf.buffer, &kbuf.bufsz, NULL);
-		if (ret) {
-			pr_err("Preparing elf core header failed\n");
-			goto out;
-		}
-
-		image->elf_headers = kbuf.buffer;
-		image->elf_headers_sz = kbuf.bufsz;
-
-		kbuf.mem = KEXEC_BUF_MEM_UNKNOWN;
-		kbuf.memsz = kbuf.bufsz;
-		kbuf.buf_align = ELF_CORE_HEADER_ALIGN;
-		kbuf.top_down = true;
-
-		ret = kexec_add_buffer(&kbuf);
-		if (ret)
-			goto out;
-
-		image->elf_load_addr = kbuf.mem;
-
-		kexec_dprintk("Loaded elf core header at 0x%lx bufsz=0x%lx memsz=0x%lx\n",
-			      image->elf_load_addr, kbuf.bufsz, kbuf.memsz);
-
-		/* Setup cmdline for kdump kernel case */
 		modified_cmdline = setup_kdump_cmdline(image, cmdline,
-						       cmdline_len);
+						       params->cmdline_len);
 		if (!modified_cmdline) {
 			pr_err("Setting up cmdline for kdump kernel failed\n");
 			ret = -EINVAL;
@@ -306,23 +281,9 @@ int load_extra_segments(struct kimage *image, unsigned long kernel_start,
 		pr_err("Error update purgatory ret=%d\n", ret);
 #endif /* CONFIG_ARCH_SUPPORTS_KEXEC_PURGATORY */
 
-	/* Add the initrd to the image */
-	if (initrd != NULL) {
-		kbuf.buffer = initrd;
-		kbuf.bufsz = kbuf.memsz = initrd_len;
-		kbuf.buf_align = PAGE_SIZE;
-		kbuf.top_down = true;
-		kbuf.mem = KEXEC_BUF_MEM_UNKNOWN;
-		ret = kexec_add_buffer(&kbuf);
-		if (ret)
-			goto out;
-		initrd_pbase = kbuf.mem;
-		kexec_dprintk("Loaded initrd at 0x%lx\n", initrd_pbase);
-	}
-
 	/* Add the DTB to the image */
-	fdt = of_kexec_alloc_and_setup_fdt(image, initrd_pbase,
-					   initrd_len, cmdline, 0);
+	fdt = of_kexec_alloc_and_setup_fdt(image, initrd_load_addr,
+					   params->initrd_len, cmdline, 0);
 	if (!fdt) {
 		pr_err("Error setting up the new device tree.\n");
 		ret = -EINVAL;
-- 
2.34.1

