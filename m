Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.220
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793001201;
	b=t0Lu4XD+SEkOKLfOComNA1TmDpopyC0Y0LlOCy1Bro30U80wh3JC2zmjqCtBtR1wIPNF
	 IixZVZp7LEiuQf1MTItIGyxXmq4WEmDZRM9o0aWo9//I1E/sHztJCn9VOP/hy6V3/y3lS
	 u52t+CdJLUZ96PMlS41OSaWj7bWE3EReWmRHqLImj21t5ZF8dCYtnTUFtuNrDqiISgR5g
	 kQH92Ri+eVWoIq3p2D8lN10bGMsucJluezQb8WW8lVrkm+rY5ITD1VoXL5JZ+3JLyHdlD
	 CWt4YoPAMfHkjwSTfmEtDECGmocJHqY0pb9X+efTbETK3ePUmD+pZ5JNQV+VsmYvrHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793001201;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=6STXn7ueeHNDINEMnPhneuMi3nzsPNA8nc98vtIcfN8=;
	b=Fma6hSJsdQoepkpsZoX6K6qTyTJyuxAN4dgIxC4z9uZKA0lFtjkckIq1lpX6Nwi+UEgT
	 he2m5nlfNx/nD1MwY5xQPpAq7JyZTNzaVo877YVoSeE0fchu6ueMI78RuW+oRPm0W8aH9
	 hoJwC5Wk5G/6Y+ETNtxq0OuEzO/tKELleOQ1MP4HqiHg1W+utYppNMpgAZbU7zywdnUT/
	 hbK1fibdNsj+fdpWNMhEyEAmCsSqX4OK8KYnNPYubcom7fVZi+IITX+oWyH91Q/vB9bDr
	 rJ+iUPRi3suxCyucHVE2B9aCuxFrgJo3KkefK+DnW9aLAENIq9vZuEoMtj25ccO3XCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=DlaRQhEG;
	arc=none smtp.remote-ip=113.46.200.220
Received: from canpmsgout05.his.huawei.com (canpmsgout05.his.huawei.com [113.46.200.220])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03FE4606A322
	for <loongarch@lists.linux.dev>; Mon, 26 Oct 2026 07:53:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 03FE4606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=DlaRQhEG
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=6STXn7ueeHNDINEMnPhneuMi3nzsPNA8nc98vtIcfN8=;
	b=DlaRQhEGFNQaco0ZbWOe1mK5uLbb42HPnvx9iQPt7gbKS/UaU3qlvZWXqvVo67/YFl69rjHXs
	i+2YWA0XmmRjJsM/eZj2MctZepbAXNY9sURfGS9+aLB11WvddKSlNvi1tM6jBiXCkuRlMl7vkEJ
	/KBbKSvdYBZ/RGaUkeGfNSo=
Received: from mail.maildlp.com (unknown [172.19.162.197])
	by canpmsgout05.his.huawei.com (SkyGuard) with ESMTPS id 4jCm8K6Ts2z12LHW;
	Mon, 26 Oct 2026 15:53:21 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id DBD4440579;
	Mon, 26 Oct 2026 15:53:17 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 26 Oct
 2026 15:53:16 +0800
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
Subject: [PATCH v7 12/15] kexec: Add kexec_load_other_segments() helper
Date: Mon, 26 Oct 2026 15:51:58 +0800
Message-ID: <20261026075201.699550-13-ruanjinjie@huawei.com>
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

arm64, LoongArch and RISC-V duplicate the elf core header and initrd
loading.  Move it into a common helper with one arch hook for the boot
parameters; a failure releases everything added for the attempt.

Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Baoquan He <baoquan.he@linux.dev>
Cc: Mike Rapoport <rppt@kernel.org>
Suggested-by: Mike Rapoport <rppt@kernel.org>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 include/linux/kexec.h | 15 ++++++++
 kernel/kexec_file.c   | 90 +++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 105 insertions(+)

diff --git a/include/linux/kexec.h b/include/linux/kexec.h
index faba26f871a4..de1d83ddc38b 100644
--- a/include/linux/kexec.h
+++ b/include/linux/kexec.h
@@ -259,6 +259,21 @@ int kexec_kernel_verify_pe_sig(const char *kernel, unsigned long kernel_len);
 extern int kexec_add_buffer(struct kexec_buf *kbuf);
 int kexec_locate_mem_hole(struct kexec_buf *kbuf);
 
+struct kexec_load_params {
+	unsigned long kernel_load_addr;
+	unsigned long kernel_size;
+	char *initrd;
+	unsigned long initrd_len;
+	char *cmdline;
+	unsigned long cmdline_len;
+};
+
+int arch_kexec_setup_other_segments(struct kimage *image,
+				    struct kexec_load_params *params,
+				    unsigned long initrd_load_addr);
+int kexec_load_other_segments(struct kimage *image,
+			      struct kexec_load_params *params, bool top_down);
+
 #ifndef arch_kexec_locate_mem_hole
 /**
  * arch_kexec_locate_mem_hole - Find free memory to place the segments.
diff --git a/kernel/kexec_file.c b/kernel/kexec_file.c
index 62d4cba278a5..8b80f1186875 100644
--- a/kernel/kexec_file.c
+++ b/kernel/kexec_file.c
@@ -1295,3 +1295,93 @@ int kexec_purgatory_get_set_symbol(struct kimage *image, const char *name,
 	return 0;
 }
 #endif /* CONFIG_ARCH_SUPPORTS_KEXEC_PURGATORY */
+
+int __weak arch_kexec_setup_other_segments(struct kimage *image,
+					   struct kexec_load_params *params,
+					   unsigned long initrd_load_addr)
+{
+	return 0;
+}
+
+int kexec_load_other_segments(struct kimage *image,
+			      struct kexec_load_params *params, bool top_down)
+{
+	struct kexec_buf kbuf = {
+		.image = image,
+		/* Do not allocate anything below the kernel */
+		.buf_min = params->kernel_load_addr + params->kernel_size,
+		.buf_max = top_down ? PFN_PHYS(max_low_pfn) : ULONG_MAX,
+	};
+
+	unsigned long orig_segments = image->nr_segments;
+	unsigned long initrd_load_addr = 0;
+	int ret = 0;
+
+#ifdef CONFIG_CRASH_DUMP
+	if (image->type == KEXEC_TYPE_CRASH) {
+		ret = crash_prepare_headers(true, &kbuf.buffer, &kbuf.bufsz, NULL);
+		if (ret) {
+			pr_err("Preparing elf core header failed\n");
+			goto out_err;
+		}
+
+		if (unlikely(image->elf_headers))
+			vfree(image->elf_headers);
+
+		image->elf_headers = kbuf.buffer;
+		image->elf_headers_sz = kbuf.bufsz;
+
+		kbuf.mem = KEXEC_BUF_MEM_UNKNOWN;
+		kbuf.memsz = kbuf.bufsz;
+		kbuf.buf_align = SZ_64K; /* largest supported page size */
+		kbuf.top_down = true;
+
+		ret = kexec_add_buffer(&kbuf);
+		if (ret)
+			goto out_err;
+
+		image->elf_load_addr = kbuf.mem;
+
+		kexec_dprintk("Loaded elf core header at 0x%lx bufsz=0x%lx memsz=0x%lx\n",
+			      image->elf_load_addr, kbuf.bufsz, kbuf.memsz);
+	}
+#endif
+
+	if (params->initrd) {
+		kbuf.buffer = params->initrd;
+		kbuf.bufsz = params->initrd_len;
+		kbuf.mem = KEXEC_BUF_MEM_UNKNOWN;
+		kbuf.memsz = params->initrd_len;
+		kbuf.buf_align = 0;
+		/* within 1GB-aligned window of up to 32GB in size */
+		if (!top_down)
+			kbuf.buf_max = round_down(params->kernel_load_addr, SZ_1G) +
+					(unsigned long)SZ_1G * 32;
+		kbuf.top_down = top_down;
+
+		ret = kexec_add_buffer(&kbuf);
+		if (ret)
+			goto out_err;
+		initrd_load_addr = kbuf.mem;
+
+		kexec_dprintk("Loaded initrd at 0x%lx bufsz=0x%lx memsz=0x%lx\n",
+			      initrd_load_addr, kbuf.bufsz, kbuf.memsz);
+	}
+
+	ret = arch_kexec_setup_other_segments(image, params,
+					      initrd_load_addr);
+	if (ret)
+		goto out_err;
+
+	return 0;
+
+out_err:
+	while (image->nr_segments > orig_segments) {
+		kexec_free_segment_cma(image, image->nr_segments - 1);
+		image->nr_segments--;
+	}
+
+	kexec_free_elf_headers(image);
+
+	return ret;
+}
-- 
2.34.1

