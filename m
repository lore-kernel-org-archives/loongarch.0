Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.217
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793001205;
	b=KdI+tqpM4lt1LlWs3Io4gusCzhEPq6rpBkLgeshmibQ+SfcjM/WnrZFCO5EIlbPtEgwj
	 Ws+D+DYxBXBjT/oXmcT1J65ntNJbbjkeUcweAwMp4XcNjLAHohFvUp2NV8hdnyTJU6YSg
	 /dlGCFvmJ20vNNPcjx/tH22x2Sci5u3Yensf11bVzdstMyMI8Y1QyeCJUqvJ6f5iEmh/r
	 gPtLehDs77pzegwrqtJ6O1ayt1LP6pwxHvu+8e5uuVrzTnnez13DJEOyDBeKQ6a4uNgfG
	 47XEA4FuS50yt+Ha4cWZqe0OpIyZUQKsSao5fraKKFPxTAozhFDNo542VbBX3xK9+NA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793001205;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=pSoiTisTdLyDABRny0EfLWIR/8NTweVskkbiFhCdYRI=;
	b=2bnrNHYrOugSaM4g3zdErUgY1fIT5OLhCovbtVOAetpZH5ilJK5AkQ09rg77S4v8c0F4
	 JnLDOj1elj7m3gaCOQ1UF+qX8l7wMcv7BBDMS670Cb4P7SBX+Zs+owGtUoM+pIB9l31Tq
	 wao10VTUzIA89fHnizAOOLvxbn6hkisFlvYrZBnBg9RPpOywgL7sO6EHC4QXHBBQGCP62
	 bP+W83dfwfxw+x7hjQkoNxsHFdlXHRaDFbfqkoC4zStFswJWrEsp2HbYkIufkjRsY/G06
	 ZndfGV4mGaEBpVf0tX15QxdL0//V0cPyvgV/2yzPGPdH35rdkrvT+cYoZ4KlNEFcE9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=may1eVbI;
	arc=none smtp.remote-ip=113.46.200.217
Received: from canpmsgout02.his.huawei.com (canpmsgout02.his.huawei.com [113.46.200.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46FEE60A3802
	for <loongarch@lists.linux.dev>; Mon, 26 Oct 2026 07:53:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46FEE60A3802
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=may1eVbI
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=pSoiTisTdLyDABRny0EfLWIR/8NTweVskkbiFhCdYRI=;
	b=may1eVbIKnuT6BzXZGd+NgHQQZeS2C22Sh0ddpHdZC/MsL8bbJ2wiRJl8W19/bVNF7htVTpdw
	Utg5LTu8wkXOuRJVY/F8wORx45uYrl6cxuI7LrsKF/ulXl6Hoo2pu30AYBvB/ZxgBOi2iFXJg7e
	ShCHlMcj0jEVzhi5AfNUT1Y=
Received: from mail.maildlp.com (unknown [172.19.162.140])
	by canpmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4jCm823KDCzcbZ1;
	Mon, 26 Oct 2026 15:53:06 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 7716E202E6;
	Mon, 26 Oct 2026 15:53:16 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 26 Oct
 2026 15:53:14 +0800
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
Subject: [PATCH v7 11/15] kexec: Free the elf core header in kimage_file_post_load_cleanup()
Date: Mon, 26 Oct 2026 15:51:57 +0800
Message-ID: <20261026075201.699550-12-ruanjinjie@huawei.com>
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

The elf core header buffer is generic state, but arm64, LoongArch,
RISC-V, x86 and powerpc each free it in their post-load cleanup.  Move
it into the generic cleanup, which also gives the loader a helper to
release it on error.

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Huacai Chen <chenhuacai@kernel.org>
Cc: Palmer Dabbelt <palmer@rivosinc.com>
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Baoquan He <baoquan.he@linux.dev>
Cc: Mike Rapoport <rppt@kernel.org>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/arm64/kernel/machine_kexec_file.c     | 4 ----
 arch/loongarch/kernel/machine_kexec_file.c | 4 ----
 arch/powerpc/kexec/file_load_64.c          | 4 ----
 arch/riscv/kernel/machine_kexec_file.c     | 4 ----
 arch/x86/kernel/machine_kexec_64.c         | 4 ----
 kernel/kexec_file.c                        | 9 +++++++++
 6 files changed, 9 insertions(+), 20 deletions(-)

diff --git a/arch/arm64/kernel/machine_kexec_file.c b/arch/arm64/kernel/machine_kexec_file.c
index d3d191a5ac89..e7f280915e8d 100644
--- a/arch/arm64/kernel/machine_kexec_file.c
+++ b/arch/arm64/kernel/machine_kexec_file.c
@@ -32,10 +32,6 @@ int arch_kimage_file_post_load_cleanup(struct kimage *image)
 	kvfree(image->arch.dtb);
 	image->arch.dtb = NULL;
 
-	vfree(image->elf_headers);
-	image->elf_headers = NULL;
-	image->elf_headers_sz = 0;
-
 	return kexec_image_post_load_cleanup_default(image);
 }
 
diff --git a/arch/loongarch/kernel/machine_kexec_file.c b/arch/loongarch/kernel/machine_kexec_file.c
index 6ea60e0faa2c..c0a799f0d240 100644
--- a/arch/loongarch/kernel/machine_kexec_file.c
+++ b/arch/loongarch/kernel/machine_kexec_file.c
@@ -28,10 +28,6 @@ const struct kexec_file_ops * const kexec_file_loaders[] = {
 
 int arch_kimage_file_post_load_cleanup(struct kimage *image)
 {
-	vfree(image->elf_headers);
-	image->elf_headers = NULL;
-	image->elf_headers_sz = 0;
-
 	return kexec_image_post_load_cleanup_default(image);
 }
 
diff --git a/arch/powerpc/kexec/file_load_64.c b/arch/powerpc/kexec/file_load_64.c
index bd80c5fb1b1f..0cf03cee35a7 100644
--- a/arch/powerpc/kexec/file_load_64.c
+++ b/arch/powerpc/kexec/file_load_64.c
@@ -841,10 +841,6 @@ int arch_kimage_file_post_load_cleanup(struct kimage *image)
 	vfree(image->arch.backup_buf);
 	image->arch.backup_buf = NULL;
 
-	vfree(image->elf_headers);
-	image->elf_headers = NULL;
-	image->elf_headers_sz = 0;
-
 	kvfree(image->arch.fdt);
 	image->arch.fdt = NULL;
 
diff --git a/arch/riscv/kernel/machine_kexec_file.c b/arch/riscv/kernel/machine_kexec_file.c
index ca921b063920..d191351c6055 100644
--- a/arch/riscv/kernel/machine_kexec_file.c
+++ b/arch/riscv/kernel/machine_kexec_file.c
@@ -29,10 +29,6 @@ int arch_kimage_file_post_load_cleanup(struct kimage *image)
 	kvfree(image->arch.fdt);
 	image->arch.fdt = NULL;
 
-	vfree(image->elf_headers);
-	image->elf_headers = NULL;
-	image->elf_headers_sz = 0;
-
 	return kexec_image_post_load_cleanup_default(image);
 }
 
diff --git a/arch/x86/kernel/machine_kexec_64.c b/arch/x86/kernel/machine_kexec_64.c
index c3f4a389992d..0a66cc268ee7 100644
--- a/arch/x86/kernel/machine_kexec_64.c
+++ b/arch/x86/kernel/machine_kexec_64.c
@@ -600,10 +600,6 @@ int arch_kexec_apply_relocations_add(struct purgatory_info *pi,
 
 int arch_kimage_file_post_load_cleanup(struct kimage *image)
 {
-	vfree(image->elf_headers);
-	image->elf_headers = NULL;
-	image->elf_headers_sz = 0;
-
 	return kexec_image_post_load_cleanup_default(image);
 }
 #endif /* CONFIG_KEXEC_FILE */
diff --git a/kernel/kexec_file.c b/kernel/kexec_file.c
index 59fb9d71e9d8..62d4cba278a5 100644
--- a/kernel/kexec_file.c
+++ b/kernel/kexec_file.c
@@ -100,6 +100,13 @@ int kexec_image_post_load_cleanup_default(struct kimage *image)
 	return image->fops->cleanup(image->image_loader_data);
 }
 
+static void kexec_free_elf_headers(struct kimage *image)
+{
+	vfree(image->elf_headers);
+	image->elf_headers = NULL;
+	image->elf_headers_sz = 0;
+}
+
 /*
  * Free up memory used by kernel, initrd, and command line. This is temporary
  * memory allocation which is not needed any more after these buffers have
@@ -118,6 +125,8 @@ void kimage_file_post_load_cleanup(struct kimage *image)
 	kfree(image->cmdline_buf);
 	image->cmdline_buf = NULL;
 
+	kexec_free_elf_headers(image);
+
 	vfree(pi->purgatory_buf);
 	pi->purgatory_buf = NULL;
 
-- 
2.34.1

