Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795082543;
	b=3YTkaj/KJe8VTLUrmHuW+Wjg/cmXfXK9ezJyhFVGjv9UNrf4E//leK5dOX8K/xuF8Whh
	 KhDTbWyRH5kF7vOYpsxvAlYPRuWTGbAI2z13A72QsZpTA/vP4WHuriMdANVJN1D69RMIQ
	 IDs8YOQZU/2q32y8ozoDW8INPujzIyTFOyqShGQlecUErQydt1zX6isxoFg1kEbf61F1u
	 KsgWGS49K8oXyDraK8W6KWkYnhGnKyK5SihUWcLT04/W8w9whmovjdiO2IxNPtEnRY2wA
	 ekoRlfF+CyXowpwC39041NSxxQ13ztW4molm+cypkqk8aBvf+JTCwbGvX61pH9Ph+3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795082543;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=6SenI4mOj1mO3410qGPpVUgFUHJmec0t3Tk7LJoTcF4=;
	b=LiZifO0nLgIo61evoyPlRrT/ewPB2c+KWGP0BXoNamnVXVNIQv3o0D3rz9Lt8oo33Mqq
	 atqQhDGvETFAn4LW/K3aWz6L5ib1kDMZSkdOqDHdcAKepYUX8RqxcEQ2Ty24K8tHQaRe7
	 2wd4bDyQHkiu6NAsEW9QWyvUqcuTQqUbFu65MAiaB4BuGOwzq54PTC1wKyw/91xpZkemR
	 EvNnIr4Inhy1n//YPlxl5q3yNKRBOmiS/rZWEY094PPEg5xlGtLzFKP3FBwRGloW/XEW3
	 oy5ay50rxLgxRujxdlBNlRNAjbifHCb5o+JH9wWvmtj9l1ww2YqYDp1cHvZBtB3tY/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=o5JH2Rt7;
	arc=none smtp.remote-ip=91.218.175.72
Received: from mta0.migadu.com (out-72.mta0.migadu.com [91.218.175.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C84BD606A32C
	for <loongarch@lists.linux.dev>; Thu, 19 Nov 2026 10:02:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C84BD606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=o5JH2Rt7
X-Envelope-To: loongarch@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=ZvPZUStYyZqiE1rcutwmPpn5KDJpY/jNBe9EWDim99w=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795082540; v=1; x=1795687340;
 b=o5JH2Rt7ArgHEghvZnio6UWTdvSfvwMeuFm6zNC4QSaQUhXz/2TLcRqktaesDvGhkMbDrZix
 yZ7Inc9jbKlrpuhfXAtSSW78d96K7tpaLgDNEFoo77l6Wys1K/nOcbCB7bg+UYNU1ZlsLaLpLPp
 GwLO2axTm+ANhoHSO/s/NBec=
X-Envelope-To: loongarch@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id 09177ad08c17784d;
	Thu, 19 Nov 2026 10:02:20 +0000
X-Mizu-Trace-ID: 09177ad08c17784d
X-Migadu-Flow: FLOW_OUT
From: George Guo <dongtai.guo@linux.dev>
To: chenhuacai@kernel.org,
	kernel@xen0n.name
Cc: rppt@kernel.org,
	liukexin@kylinos.cn,
	guodongtai@kylinos.cn,
	loongarch@lists.linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] LoongArch: Allow memblock arrays to resize
Date: Thu, 19 Nov 2026 19:02:16 +0900
Message-ID: <20261119100216.10182-1-dongtai.guo@linux.dev>
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

LoongArch never calls memblock_allow_resize(), so the memblock region
arrays cannot grow beyond their static sizes. For the reserved array
that is INIT_MEMBLOCK_RESERVED_REGIONS (INIT_MEMBLOCK_REGIONS +
NR_CPUS) entries. Once it is full, the next reservation that needs a
new region panics:

  Kernel panic - not syncing: memblock: cannot resize reserved array

The memory setup code was derived from MIPS, which never enables
resizing either. Nothing on LoongArch needs the arrays to stay static.

When an array is full, memblock allocates a bigger one from free
memory, so resizing is only safe once all memory in use is reserved.
By the time setup_arch() calls arch_mem_init(), the kernel image, the
initrd, the firmware memory map, the device tree reserved-memory
regions and the crash kernel are reserved, so enable resizing there.

Co-developed-by: Kexin Liu <liukexin@kylinos.cn>
Signed-off-by: Kexin Liu <liukexin@kylinos.cn>
Signed-off-by: George Guo <guodongtai@kylinos.cn>
---
This was patch 5/8 of the LoongArch KHO series v6 [1]. Mike suggested
fixing it independently of KHO, and Huacai preferred arch_mem_init()
to platform_init() [1].

KHO for LoongArch needs this: after kexec, kho_memory_init() reserves
every preserved range, and luo_stress_files with 500 files overflows
the reserved array without CONFIG_SMP. A bigger array cannot land on
preserved memory, because KHO limits memblock allocations to its
bootmem areas by then.

Changes since v6 5/8:
- Sent on its own, without the KHO series.
- Reworded the commit message and the comment so they do not depend
  on KHO.

[1] https://lore.kernel.org/all/20261029172956.20791-6-dongtai.guo@linux.dev/

 arch/loongarch/kernel/setup.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/loongarch/kernel/setup.c b/arch/loongarch/kernel/setup.c
index 6fa4a22a58fd..8c33346a123a 100644
--- a/arch/loongarch/kernel/setup.c
+++ b/arch/loongarch/kernel/setup.c
@@ -402,6 +402,9 @@ static void __init arch_mem_init(char **cmdline_p)
 
 	check_kernel_sections_mem();
 
+	/* All memory in use is reserved now, so memblock can grow its arrays. */
+	memblock_allow_resize();
+
 	memblock_set_bottom_up(true);
 
 	swiotlb_init(true, SWIOTLB_VERBOSE);

base-commit: 422e532809572ba1043192bf6a0c653bc68b3140
-- 
2.53.0

