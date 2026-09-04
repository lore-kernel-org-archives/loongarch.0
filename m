Received: from mta0.migadu.com (out-119.mta0.migadu.com [91.218.175.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14B8238D40B
	for <loongarch@lists.linux.dev>; Fri,  4 Sep 2026 02:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.119
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788490283; cv=none; b=YMhCawojEOo2D9v6z8T3cDd5kMVG3/nAXWqaUOBDaks59TaeXrBQO/oxPYOo2a1ljvdzDGVzR/l7JLmufRFqQFNbpla0SZwyjeKsBRXprUX/H7ATeuPMOHpSFfQ8jdEfpv+pu0gmU/fCUOP9fEaPvKdgtjA/Od1xpHMEOZ3Zf0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788490283; c=relaxed/simple;
	bh=R8hp6kP4f0zaqRkny35jyzu+c4C1uLJKHJHYlP03c7k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tRD64ttXMW1uUfyABM4hvM4ASmwdy4MKVOIcIakpb4BH71wQFlyZqm0mFrkpWtRvwGZjSulHT94OadsO6AmLWhA2yQqp7oadMP9xAHpvVJqN5rG423hptHDl+psoJTS5zgKvVGdaFRROvpGvcikSd28EGsn2pvbzhCDFOldP8sM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=AL+WAFr3; arc=none smtp.client-ip=91.218.175.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="AL+WAFr3"
X-Envelope-To: loongarch@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=R8hp6kP4f0zaqRkny35jyzu+c4C1uLJKHJHYlP03c7k=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788490279; v=1; x=1789095079;
 b=AL+WAFr3ogafpzc8Iw1pwLdy71ZuCuyBEr09f+s3dzaDM/eirhn4zzE2+kGEGUA1BFkBkdDU
 JrjLFJNan8+AN0qvaR855NQjOtRL1TQbhUuPbpwtudUphx4AodHrUpKM4OKC/kl5lUhFv+5KTO6
 A/fPgnbcWpuEqIeKrQ/nrfJo=
X-Envelope-To: loongarch@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id 0b116a6762a44da4;
	Fri, 04 Sep 2026 02:51:18 +0000
X-Mizu-Trace-ID: 0b116a6762a44da4
X-Migadu-Flow: FLOW_OUT
From: George Guo <dongtai.guo@linux.dev>
To: rppt@kernel.org,
	pasha.tatashin@soleen.com,
	pratyush@kernel.org
Cc: graf@amazon.com,
	changyuanl@google.com,
	akpm@linux-foundation.org,
	chenhuacai@kernel.org,
	liukexin@kylinos.cn,
	guodongtai@kylinos.cn,
	kexec@lists.infradead.org,
	linux-mm@kvack.org,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] liveupdate: kho: calculate per-node scratch sizes before allocation
Date: Fri,  4 Sep 2026 10:51:01 +0800
Message-ID: <20260904025101.9959-1-dongtai.guo@linux.dev>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: George Guo <guodongtai@kylinos.cn>

The default percentage-based policy sizes scratch areas from the current
kernel's MEMBLOCK_RSRV_KERN footprint. This is a reasonable heuristic for
predicting the early memory demand of the next kernel.

scratch_size_update() calculates the lowmem and global sizes before either
area is allocated. However, kho_reserve_scratch() calculates each per-node
size only after allocating the lowmem and global areas. Since memblock
allocations are marked MEMBLOCK_RSRV_KERN, the per-node calculation
includes those newly allocated scratch areas and scales them again.

This feedback substantially inflates the per-node request. On a 1 GiB
LoongArch QEMU guest, the relevant reservation baseline is about
98.45 MiB. With the default 200% scale and 32 MiB alignment, the old
ordering allocates 224 MiB of lowmem scratch, then requests 672 MiB for
node 0, for a total of 896 MiB. The node allocation fails and KHO is
disabled. The same incorrect calculation is hidden on the tested 1 GiB
x86 guest because its baseline is smaller and its memory map can satisfy
the inflated request.

Calculate and save all per-node sizes in the scratch descriptors before
reserving any scratch areas, then use the saved sizes during allocation.
This keeps the percentage heuristic while preventing scratch memory from
becoming input to the sizing of more scratch memory. On the LoongArch
guest, the aligned total is reduced from 896 MiB to 448 MiB.

The KHO vmtest passes on 1 GiB LoongArch and x86 QEMU guests with this
change.

Fixes: 3dc92c311498 ("kexec: add Kexec HandOver (KHO) generation helpers")
Reported-by: Kexin Liu <liukexin@kylinos.cn>
Co-developed-by: Kexin Liu <liukexin@kylinos.cn>
Signed-off-by: Kexin Liu <liukexin@kylinos.cn>
Signed-off-by: George Guo <guodongtai@kylinos.cn>
---
 kernel/liveupdate/kexec_handover.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/kernel/liveupdate/kexec_handover.c b/kernel/liveupdate/kexec_handover.c
index 7c4d86daf86d..39f489a258d9 100644
--- a/kernel/liveupdate/kexec_handover.c
+++ b/kernel/liveupdate/kexec_handover.c
@@ -847,6 +847,17 @@ static void __init kho_reserve_scratch(void)
 		goto err_disable_kho;
 	}
 
+	/*
+	 * Calculate the per-node sizes before reserving any scratch areas.
+	 * memblock allocations are marked MEMBLOCK_RSRV_KERN, so calculating
+	 * them later would count the lowmem and global scratch areas as kernel
+	 * allocations and scale them again.
+	 */
+	i = 2;
+	for_each_node_state(nid, N_MEMORY)
+		kho_scratch[i++].size = scratch_size_node(nid);
+	i = 0;
+
 	/*
 	 * reserve scratch area in low memory for lowmem allocations in the
 	 * next kernel
@@ -880,7 +891,7 @@ static void __init kho_reserve_scratch(void)
 	 * memoryless nodes, as we can not allocate scratch areas there.
 	 */
 	for_each_node_state(nid, N_MEMORY) {
-		size = scratch_size_node(nid);
+		size = kho_scratch[i].size;
 		addr = memblock_alloc_range_nid(size, SCRATCH_ALIGNMENT_BYTES,
 						0, MEMBLOCK_ALLOC_ACCESSIBLE,
 						nid, true);
-- 
2.53.0

