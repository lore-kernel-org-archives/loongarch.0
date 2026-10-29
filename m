Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793295023;
	b=ptXJbiKsnzGvVsY6IEkhbubgWmyUnDABlbGoqNzv5OSbrazBmWuyRJ2FtY1Ri5giRQNH
	 RzE5OtfpcL81iLcrgFV8wLPiaYbtzVGlYWxtcBxELIfOY7EbeEYbNFd1D8JHPAd/bWFJl
	 iAb0bYPAQRn6oWRJh4pKpFsNsIDkt1QwDzzqGtDA/JvlERtoz5Xp+QmkJtP9IvOJNNIjl
	 ZkGUu4bq4WETuN2J0FAmov2tC32zbc+0TWXrNMd+5CXWUjRD5yL7+65WrtrbApIcuJVhu
	 spkWHFhDY2nnmZAzB5t/kD1KptOWWl4KMiQMBLliObuAzujPjVmPlk+3pWZfGTuimtQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793295023;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=vSsiRYPYB4jWimWdqbg3QYop0paA6TDT/mhOyO7eWso=;
	b=tzzPo8+Cgpq/WFlh3SSkT6B4RaN+a5+ozZlUWqIgu85OnASz4DMyC6asL1rh3QNMtp7w
	 IA+Qw4yUhkydzqMs+/8CUE7Vt4zpsfykDy1JGL6dxAMjefNn5Qfn6NhRGdaO3mdABCB+y
	 ajOANT7t6j/sG0qkjC5eT5c2e5QdjKNKMfYRAfsJ9Jvj1dSSz2tbsd/G6lpnFKCy0fQ4w
	 oUdHyp54FumvN9anG7fpaWANhahnV9J9uXwPb+WffGIiPdU0KAZxIl6Z4NlEkAr7aDQfv
	 Lh3ck1APXipHHVKpE6yGLPo1cHmVdo2/qkPQRQXR65+O69I1nAlOHHIsfEk1To9veKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=BEo4rhso;
	arc=none smtp.remote-ip=95.215.58.195
Received: from mta1.migadu.com (out-195.mta1.migadu.com [95.215.58.195])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9893E606A31A
	for <loongarch@lists.linux.dev>; Thu, 29 Oct 2026 17:30:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9893E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=BEo4rhso
X-Envelope-To: loongarch@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=0F/90IUVwRzQHSP39TV73suxQSXvMV7pstypaG7hBwQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793295020; v=1; x=1793899820;
 b=BEo4rhsoH2DbHb3HC4rtgEZEPRVgr/XlKNw/1eV7i89sqII6hX65zb7CRPRzDbsUXPkfFiXI
 CFewPZjyLIbNPVCPbagOtZabJ9TC5NKO/uE0d4WZwRSyZ4HtckEBfDVraaLPfeVMQFTslGBih3L
 7EhI88gQ8EKnEcXKPDFTB+Bc=
X-Envelope-To: loongarch@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id 75f3584368055110;
	Thu, 29 Oct 2026 17:30:16 +0000
X-Mizu-Trace-ID: 75f3584368055110
X-Migadu-Flow: FLOW_OUT
From: George Guo <dongtai.guo@linux.dev>
To: rppt@kernel.org,
	pasha.tatashin@soleen.com,
	pratyush@kernel.org,
	chenhuacai@kernel.org,
	ardb@kernel.org,
	shuah@kernel.org
Cc: ilias.apalodimas@linaro.org,
	akpm@linux-foundation.org,
	baoquan.he@linux.dev,
	ruirui.yang@linux.dev,
	guodongtai@kylinos.cn,
	kernel@xen0n.name,
	graf@amazon.com,
	liukexin@kylinos.cn,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	kexec@lists.infradead.org,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-efi@vger.kernel.org
Subject: [PATCH v6 2/8] kho: Write KHO state to the EFI table at kexec time
Date: Fri, 30 Oct 2026 02:29:49 +0900
Message-ID: <20261029172956.20791-3-dongtai.guo@linux.dev>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261029172956.20791-1-dongtai.guo@linux.dev>
References: <20261029172956.20791-1-dongtai.guo@linux.dev>
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

From: George Guo <guodongtai@kylinos.cn>

On arm64 and riscv, KHO addresses and sizes are passed through /chosen
properties in the boot FDT prepared for each kexec image. On x86, they
are passed through a SETUP_KEXEC_KHO record linked from the image's boot
parameters. These records are per-image, unlike the shared EFI table.

The EFI table is shared. A KHO-enabled normal image and a crash image
can both be loaded, but need different contents: the normal image needs
the KHO addresses, while the crash image needs an empty table. Updating
the table at load time cannot satisfy both.

Write the table in kernel_kexec() and __crash_kexec(), once the image
that will run is known. kho_update_efi_table() fills the table from that
image, or zeroes it if the image has no KHO state, including images
loaded with kexec_load().

Clear the table even with CONFIG_KEXEC_HANDOVER disabled, since the
kernel may have inherited a populated table. This prevents a later
kernel from trying to revive obsolete KHO state.

The table stores the size of the bootmem area list (bufsz), not of its
page-aligned segment, as the FDT and x86 code do. If updating or clearing
the table fails, kernel_kexec() returns before liveupdate_reboot(), so
LUO does not save state that the next kernel would not find.
__crash_kexec() ignores the error so the crash boot can still proceed.

Signed-off-by: George Guo <guodongtai@kylinos.cn>
---
 kernel/crash_core.c                |  6 ++++++
 kernel/kexec_core.c                |  5 +++++
 kernel/kexec_internal.h            |  8 ++++++++
 kernel/liveupdate/kexec_handover.c | 26 ++++++++++++++++++++++++++
 4 files changed, 45 insertions(+)

diff --git a/kernel/crash_core.c b/kernel/crash_core.c
index 2b36aa9fade0..0f77adc0928b 100644
--- a/kernel/crash_core.c
+++ b/kernel/crash_core.c
@@ -138,6 +138,12 @@ void __noclone __crash_kexec(struct pt_regs *regs)
 		if (kexec_crash_image) {
 			struct pt_regs fixed_regs;
 
+			/*
+			 * A crash image has no KHO state.  Zero the EFI
+			 * table so the crash kernel has no inherited KHO state.
+			 */
+			(void)kho_update_efi_table(kexec_crash_image);
+
 			crash_setup_regs(&fixed_regs, regs);
 			crash_save_vmcoreinfo();
 			machine_crash_shutdown(&fixed_regs);
diff --git a/kernel/kexec_core.c b/kernel/kexec_core.c
index dc770b9a6d05..37597091770a 100644
--- a/kernel/kexec_core.c
+++ b/kernel/kexec_core.c
@@ -1146,6 +1146,11 @@ int kernel_kexec(void)
 		goto Unlock;
 	}
 
+	/* Write this image's KHO state into the EFI table. */
+	error = kho_update_efi_table(kexec_image);
+	if (error)
+		goto Unlock;
+
 	if (!kexec_image->preserve_context) {
 		error = liveupdate_reboot();
 		if (error)
diff --git a/kernel/kexec_internal.h b/kernel/kexec_internal.h
index 228bb88c018b..cfdd0b158f72 100644
--- a/kernel/kexec_internal.h
+++ b/kernel/kexec_internal.h
@@ -2,6 +2,7 @@
 #ifndef LINUX_KEXEC_INTERNAL_H
 #define LINUX_KEXEC_INTERNAL_H
 
+#include <linux/efi.h>
 #include <linux/kexec.h>
 
 struct kexec_segment;
@@ -46,6 +47,7 @@ struct kexec_buf;
 int kho_locate_mem_hole(struct kexec_buf *kbuf,
 			int (*func)(struct resource *, void *));
 int kho_fill_kimage(struct kimage *image);
+int kho_update_efi_table(struct kimage *image);
 #else
 static inline int kho_locate_mem_hole(struct kexec_buf *kbuf,
 				      int (*func)(struct resource *, void *))
@@ -54,5 +56,11 @@ static inline int kho_locate_mem_hole(struct kexec_buf *kbuf,
 }
 
 static inline int kho_fill_kimage(struct kimage *image) { return 0; }
+
+static inline int kho_update_efi_table(struct kimage *image)
+{
+	/* The previous kernel may have left KHO state in the EFI table. */
+	return efi_kho_update(0, 0, 0, 0);
+}
 #endif /* CONFIG_KEXEC_HANDOVER */
 #endif /* LINUX_KEXEC_INTERNAL_H */
diff --git a/kernel/liveupdate/kexec_handover.c b/kernel/liveupdate/kexec_handover.c
index 9a53d7750367..74c4633f5afc 100644
--- a/kernel/liveupdate/kexec_handover.c
+++ b/kernel/liveupdate/kexec_handover.c
@@ -15,6 +15,7 @@
 #include <linux/crash_dump.h>
 #include <linux/kmemleak.h>
 #include <linux/count_zeros.h>
+#include <linux/efi.h>
 #include <linux/kasan.h>
 #include <linux/kexec.h>
 #include <linux/kexec_handover.h>
@@ -2094,6 +2095,31 @@ int kho_fill_kimage(struct kimage *image)
 	return 0;
 }
 
+/*
+ * Write the KHO state of @image into the EFI table, or zero the table if
+ * @image has none.
+ *
+ * There is one table, but the normal and the crash image can both be loaded,
+ * so the table is written just before @image runs rather than at load time.
+ * Crash images, images loaded with kexec_load() and images loaded with KHO
+ * disabled have no KHO state. Zeroing the table for them makes the next
+ * kernel boot without inherited KHO state instead of reading stale addresses.
+ */
+int kho_update_efi_table(struct kimage *image)
+{
+	int err;
+
+	if (!image->kho.fdt || !image->kho.bootmem)
+		return efi_kho_update(0, 0, 0, 0);
+
+	err = efi_kho_update(image->kho.fdt, PAGE_SIZE,
+			     image->kho.bootmem->mem, image->kho.bootmem->bufsz);
+	if (err)
+		pr_warn("failed to update EFI config table: %pe\n", ERR_PTR(err));
+
+	return err;
+}
+
 static int kho_walk_bootmem(struct kexec_buf *kbuf,
 			    int (*func)(struct resource *, void *))
 {
-- 
2.53.0

