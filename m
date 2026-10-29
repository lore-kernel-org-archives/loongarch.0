Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.89
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793270072;
	b=2gVvfFq5qn+JymZOx06KXC5pFA6lyrKPcJynBq52jPDajUhTIwaGh0sUQ+5ZMuS3oMM2
	 Lt2C22BKkMo8P5qOz2Sno1sRPsFnCo1YrDHdiH6CrA5pSUy140ZxVFlPiIao9U0kXY523
	 S4hBJR18z8OP3FowYH7HFI/CdjQgUYE2iPEE1J67gxg6efHrl5k3+78zXXaViJ87JSdEp
	 k4ezSAiPgIHPzFby505sdC5hwul+2UODxzZ7JWgZqTZbBqt70ncL7fE5QUXpXvIvqPPGr
	 J8CH+PaWsAKvhatQyVgi1x7GcJx7NbE5d/wxIwUzkP68VpW5jKCMIpYDbigG9JHyalQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793270072;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=AOkwsWmwjY7T0BagmEwjwy19sbGkrNkf9+nM9gVRFeA=;
	b=cc0RyzfPAqNfxMHMoI18+vy+vT2BXXbq6BPaBVEik+9ivmhxys78+ojJcHoESEVHijmN
	 W9bRjTYImeFwffzOviMV6SN+As0nHDK+DgLkRDznOQHF78Dex59ruePpox2eN7+BRQWSC
	 dxlRsz7J0j3Fw+1SI3Kp5SMBLBzTT47kbntNhE/1rye/YsLT/rp6OSyYRMtqfhdDsPRFw
	 Nxmy7OIjFIJBXAB/fNMeLwG6VelW3QGC0Nz0yJcA6+rMh2Y8pL9ZWj6oEe8ww/VtjL/JM
	 yp0HiMk5OrR0/jPEHLmFDWQTBBuWpHIqv2OgdIgg7jHIcaU4NrIWVMxRCcCrvxqGfRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=UXOfp9RY;
	arc=none smtp.remote-ip=95.215.58.89
Received: from mta1.migadu.com (out-89.mta1.migadu.com [95.215.58.89])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 367BC606A327
	for <loongarch@lists.linux.dev>; Thu, 29 Oct 2026 10:34:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 367BC606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=UXOfp9RY
X-Envelope-To: loongarch@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=V9eKCFzwICKE4rFO7Nmsc0WCMFzPWjs4u+0Fk0qiHkg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793270069; v=1; x=1793874869;
 b=UXOfp9RYEVzG9pxkQUlobs6A4jb1xYE3cZWLzCOHQGck1nZV/9xfA585SJTqLRsuzC5Wd36Q
 lj4xBsZMIOrGWoGZb2gahqDlSCr3eNASR11V9aCanvfVTk8onkRsgfuJQ5v8PN8sabF8JzeIo+U
 24AXxMU3ShTpP0llLmIiyVxQ=
X-Envelope-To: loongarch@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id dd12de82c714536d;
	Thu, 29 Oct 2026 10:34:29 +0000
X-Mizu-Trace-ID: dd12de82c714536d
X-Migadu-Flow: FLOW_OUT
From: George Guo <dongtai.guo@linux.dev>
To: rppt@kernel.org,
	pasha.tatashin@soleen.com,
	pratyush@kernel.org
Cc: graf@amazon.com,
	changyuanl@google.com,
	akpm@linux-foundation.org,
	chenhuacai@kernel.org,
	sourabhjain@linux.ibm.com,
	liukexin@kylinos.cn,
	guodongtai@kylinos.cn,
	kexec@lists.infradead.org,
	linux-mm@kvack.org,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] liveupdate: kho: calculate per-node bootmem sizes before allocating any
Date: Thu, 29 Oct 2026 19:34:25 +0900
Message-ID: <20261029103425.14689-1-dongtai.guo@linux.dev>
X-Mailer: git-send-email 2.53.0
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

kho_reserve_bootmem() calculated the per-node bootmem sizes inside the
allocation loop, after the lowmem and global areas had been allocated.

Without CONFIG_NUMA, memblock_get_region_node() returns 0 for every
region, and memblock_reserved_kern_size() attributes a region to a node
by memblock_get_region_node(). Since allocations are marked
MEMBLOCK_RSRV_KERN, the newly allocated lowmem and global areas enter
node 0's baseline and are scaled again by bootmem_size_node().

In the original 1 GiB QEMU reproducer, the default 200% scale made
node 0 request 672 MiB: twice the sum of the 98.45 MiB baseline and
224 MiB lowmem area, rounded up to 32 MiB alignment. The reservation
failed and KHO disabled itself.

With CONFIG_NUMA=y, node-specific accounting excludes the NUMA_NO_NODE
reservations.

The lowmem and global sizes are already calculated by
bootmem_size_update() before any allocation. Calculate the per-node
sizes into the kho_bootmem descriptors before reserving any bootmem
area as well, and allocate the per-node areas from the stored sizes.
Use separate read and write indices to preserve the saved sizes when
zero-sized per-node areas are skipped.

Fixes: 3dc92c311498 ("kexec: add Kexec HandOver (KHO) generation helpers")
Reported-by: Kexin Liu <liukexin@kylinos.cn>
Co-developed-by: Kexin Liu <liukexin@kylinos.cn>
Signed-off-by: Kexin Liu <liukexin@kylinos.cn>
Signed-off-by: George Guo <guodongtai@kylinos.cn>
---
Changes in v2:
- Calculate every size before any allocation (Mike). The lowmem and
  global sizes are already calculated by bootmem_size_update(), so only
  the per-node sizes move out of the allocation loop.
- Rebase onto liveupdate-7.4: follow the "scratch" to "bootmem" rename,
  and keep the zero-size node skip added by "kho: do not reserve empty
  per-node bootmem areas" by reading the saved sizes with a separate
  index.
- Explain why only CONFIG_NUMA=n kernels are affected (Pratyush, Sourabh).
- The global size over-allocation on NUMA systems, which I planned to
  look at as a follow-up, is handled by Sourabh's "kho: fix global
  scratch size calculation" [1]. Mike asked there for a broader rework
  of the sizing; this patch only fixes the CONFIG_NUMA=n double
  counting.
- No Assisted-by tag, although I said on v1 that I would add one: the
  Assisted-by references have since been removed from the documentation
  in mainline.

Tested with the KHO vmtest on a 1 GiB LoongArch QEMU guest, with the
LoongArch KHO series on top: it passes with both CONFIG_NUMA=n and
CONFIG_NUMA=y. Without this patch, KHO disables itself in the
CONFIG_NUMA=n run.

v1: https://lore.kernel.org/all/20260904025101.9959-1-dongtai.guo@linux.dev/
[1] https://lore.kernel.org/all/20260922131217.698809-1-sourabhjain@linux.ibm.com/

 kernel/liveupdate/kexec_handover.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/kernel/liveupdate/kexec_handover.c b/kernel/liveupdate/kexec_handover.c
index 6f1f55fe3181..9a53d7750367 100644
--- a/kernel/liveupdate/kexec_handover.c
+++ b/kernel/liveupdate/kexec_handover.c
@@ -831,7 +831,7 @@ bool kho_bootmem_overlap(phys_addr_t phys, size_t size)
  */
 static void __init kho_reserve_bootmem(void)
 {
-	int nid, i = 0, max_nr_bootmem;
+	int nid, i, j, max_nr_bootmem;
 	phys_addr_t addr, size;
 
 	if (!kho_enable)
@@ -848,6 +848,15 @@ static void __init kho_reserve_bootmem(void)
 		goto err_disable_kho;
 	}
 
+	/*
+	 * Save the per-node sizes before allocating bootmem areas. Without
+	 * CONFIG_NUMA, new lowmem and global allocations would otherwise be
+	 * counted as node 0 kernel reservations and scaled again.
+	 */
+	j = 2;
+	for_each_node_state(nid, N_MEMORY)
+		kho_bootmem[j++].size = bootmem_size_node(nid);
+
 	/*
 	 * reserve bootmem area in low memory for lowmem allocations in the
 	 * next kernel
@@ -860,6 +869,7 @@ static void __init kho_reserve_bootmem(void)
 		goto err_free_bootmem_desc;
 	}
 
+	i = 0;
 	kho_bootmem[i].addr = addr;
 	kho_bootmem[i].size = size;
 	i++;
@@ -879,9 +889,12 @@ static void __init kho_reserve_bootmem(void)
 	/*
 	 * Loop over nodes that have both memory and are online. Skip
 	 * memoryless nodes, as we can not allocate bootmem areas there.
+	 * Skipping zero-sized areas leaves i behind j, so writes to
+	 * kho_bootmem[i] cannot overwrite unread sizes.
 	 */
+	j = i;
 	for_each_node_state(nid, N_MEMORY) {
-		size = bootmem_size_node(nid);
+		size = kho_bootmem[j++].size;
 		if (!size)
 			continue;
 

base-commit: 9a6a70aefe77f6fb9ff2b3037dcf87f6dff65c8c
-- 
2.53.0

