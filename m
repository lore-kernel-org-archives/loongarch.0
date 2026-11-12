Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.218
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794490491;
	b=Nl3A1G2WVSkDZlLrLPO55tCPas1AmReKJA5zZJqR/1WsmIVxRK+QdHEhcZXTgDYq7bTk
	 YX8XhKN7oDRI+YtLyjVAfn7sae67QQMnAD4/+C/s5Q1LDbMbyLxNcwwUfOvTgo9u2tFKH
	 jgytq6q9vC1dhAnPD2Y2jTH0CElEGEvtN4cIftnvONg7ibgHIXpxiOhWv+k4l5OcQASbL
	 +SSowo+CRBSm3PdgQTM/hDy0P7Yd24bfUW1U76c0KCZjLoyk519lzvMk2AvErqbKyJnWH
	 pxk9JyO8s380dhzKs/XTIr2s7qwfcLNhNqaqRdu5VwbSJNUdXRzzn0Rk0hYQYdzyh8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794490491;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=aF0m0nqSwM4uqo2e3paTNsAMlJ7uv60BjNcXZG7EYjA=;
	b=NLhh2gYK/EpnkpcSAUnovV36P1x2G4ycSf28hlBxO93gXRY1YMommVbXaAWMFiFl7B8o
	 SyS0VKxzp2FwggzllBBYEYpcTv3fbrPt0U4x7mlS80uVmq7/HNRrbZS6el5X41VC7tBNz
	 iRqlJd4G9Fx9ZiX1ZSHubIz0FjHs86+grPi3mCNGPkKt2twbUHPn5iBm8yYUNOoWASdFD
	 5aVP4ecp9bc548aWerZJjflZLtehsiwTNH9Ao7hOYG0vftytgY7ErbgcorKuIuuB1m4nK
	 tUL1Nj8ehzkJ80uEsxWCCrJ4xHEX+DbrW7UU07eR3vCC0poTRaKJbscQnYygIrHHyLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=YLuP2sUE;
	arc=none smtp.remote-ip=113.46.200.218
Received: from canpmsgout03.his.huawei.com (canpmsgout03.his.huawei.com [113.46.200.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A4E160A2607
	for <loongarch@lists.linux.dev>; Thu, 12 Nov 2026 13:34:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A4E160A2607
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=YLuP2sUE
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=aF0m0nqSwM4uqo2e3paTNsAMlJ7uv60BjNcXZG7EYjA=;
	b=YLuP2sUEmJchwn4zsu7nGYAFFX0oppBEnsVCc3AQoH7ldJMk/l/QqhJfRvPxVOhmep+L1kTAs
	imzeWBfOLWaD3D7EjIHtkOsPd1IcBiHJ4meOueDCppdIMY+bR/jnvlfkGVG2DQL892cgl7b+Kw9
	Kt/r6Gld6fFLI9uohxdmsEE=
Received: from mail.maildlp.com (unknown [172.19.162.144])
	by canpmsgout03.his.huawei.com (SkyGuard) with ESMTPS id 4jQLvd2kHVzpSt9;
	Thu, 12 Nov 2026 21:34:05 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id E2E4940538;
	Thu, 12 Nov 2026 21:34:44 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 12 Nov
 2026 21:34:43 +0800
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
Subject: [PATCH v8 06/11] x86: kexec_file: Use the common segment helpers
Date: Thu, 12 Nov 2026 21:34:13 +0800
Message-ID: <20261112133418.4044428-7-ruanjinjie@huawei.com>
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

crash_load_segments() open codes the elf core header loading: it builds
the header, accounts for crash hotplug and places the segment.

Use kexec_prepare_elf_core_header() and kexec_add_elf_core_header()
instead.

bzImage64_load() also loads the initrd by hand, use kexec_add_initrd()
for it.

Cc: Thomas Gleixner <tglx@kernel.org>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: H. Peter Anvin <hpa@zytor.com>
Cc: x86@kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Baoquan He <baoquan.he@linux.dev>
Cc: Mike Rapoport <rppt@kernel.org>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/x86/kernel/crash.c           | 25 +++++--------------------
 arch/x86/kernel/kexec-bzimage64.c |  8 +-------
 2 files changed, 6 insertions(+), 27 deletions(-)

diff --git a/arch/x86/kernel/crash.c b/arch/x86/kernel/crash.c
index e6f23933a6df..8d56d39ebbd5 100644
--- a/arch/x86/kernel/crash.c
+++ b/arch/x86/kernel/crash.c
@@ -354,14 +354,12 @@ int crash_load_segments(struct kimage *image)
 				  .buf_max = ULONG_MAX, .top_down = false };
 
 	/* Prepare elf headers and add a segment */
-	ret = crash_prepare_headers(IS_ENABLED(CONFIG_X86_64), &kbuf.buffer,
-				    &kbuf.bufsz, &pnum);
+	ret = kexec_prepare_elf_core_header(image, IS_ENABLED(CONFIG_X86_64),
+					    &pnum);
 	if (ret)
 		return ret;
 
-	image->elf_headers	= kbuf.buffer;
-	image->elf_headers_sz	= kbuf.bufsz;
-	kbuf.memsz		= kbuf.bufsz;
+	kbuf.memsz = image->elf_headers_sz;
 
 #ifdef CONFIG_CRASH_HOTPLUG
 	/*
@@ -374,28 +372,15 @@ int crash_load_segments(struct kimage *image)
 		pnum += 2 + CONFIG_NR_CPUS;
 
 	if (pnum < (unsigned long)PN_XNUM) {
-		kbuf.memsz = pnum * sizeof(Elf64_Phdr);
-		kbuf.memsz += sizeof(Elf64_Ehdr);
-
-		image->elfcorehdr_index = image->nr_segments;
-
-		/* Mark as usable to crash kernel, else crash kernel fails on boot */
-		image->elf_headers_sz = kbuf.memsz;
+		kbuf.memsz = pnum * sizeof(Elf64_Phdr) + sizeof(Elf64_Ehdr);
 	} else {
 		pr_err("number of Phdrs %lu exceeds max\n", pnum);
 	}
 #endif
 
 	kbuf.buf_align = ELF_CORE_HEADER_ALIGN;
-	kbuf.mem = KEXEC_BUF_MEM_UNKNOWN;
-	ret = kexec_add_buffer(&kbuf);
-	if (ret)
-		return ret;
-	image->elf_load_addr = kbuf.mem;
-	kexec_dprintk("Loaded ELF headers at 0x%lx bufsz=0x%lx memsz=0x%lx\n",
-		      image->elf_load_addr, kbuf.bufsz, kbuf.memsz);
 
-	return ret;
+	return kexec_add_elf_core_header(image, &kbuf);
 }
 #endif /* CONFIG_KEXEC_FILE */
 
diff --git a/arch/x86/kernel/kexec-bzimage64.c b/arch/x86/kernel/kexec-bzimage64.c
index 3aa77006adab..c8e285c9a4c6 100644
--- a/arch/x86/kernel/kexec-bzimage64.c
+++ b/arch/x86/kernel/kexec-bzimage64.c
@@ -626,19 +626,13 @@ static void *bzImage64_load(struct kimage *image, char *kernel,
 
 	/* Load initrd high */
 	if (initrd) {
-		kbuf.buffer = initrd;
-		kbuf.bufsz = kbuf.memsz = initrd_len;
 		kbuf.buf_align = PAGE_SIZE;
 		kbuf.buf_min = MIN_INITRD_LOAD_ADDR;
-		kbuf.mem = KEXEC_BUF_MEM_UNKNOWN;
-		ret = kexec_add_buffer(&kbuf);
+		ret = kexec_add_initrd(image, &kbuf);
 		if (ret)
 			goto out_free_params;
 		initrd_load_addr = kbuf.mem;
 
-		kexec_dprintk("Loaded initrd at 0x%lx bufsz=0x%lx memsz=0x%lx\n",
-			      initrd_load_addr, initrd_len, initrd_len);
-
 		setup_initrd(params, initrd_load_addr, initrd_len);
 	}
 
-- 
2.34.1

