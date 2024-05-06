Received: from out0-214.mail.aliyun.com (out0-214.mail.aliyun.com [140.205.0.214])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65E72156220
	for <loongarch@lists.linux.dev>; Mon,  6 May 2024 16:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.205.0.214
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715012581; cv=none; b=MSIGCS4Tq9l3A12TSoZy/eLdDljllWzQkX7PHtyB/1xqBoVz1GUAGy4DT2PpbHuIigzVF2j2xEW7bA8KL0H2UbzYTdEPsebW5oe78tkXrsdOhAvaDntup0M9YykOEIXixk3qxpMYx8jNjN4zdCnwJN8524E9vCXvTw0CoqxENGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715012581; c=relaxed/simple;
	bh=9Yh85VzIOU/V0hUFMa4Ncpa3uq6U/PD5BfSD0II4KQo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=f4KW5bKe5yb4N/uA0I4VkQKpvg/k0SJ8KaB3xWzhxQbUThK09WdWBBqzRx4Cns4IpOrVd+DwtmcrjqO3PHaCi5UDiu+oAe9PR4OrjHO56TDfaxa5vN40j5Tjq8ZiuvvajRIByvip03NOwzJufUUSFVoaxTzd/sUFsOij6a9T7B4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=antgroup.com; spf=pass smtp.mailfrom=antgroup.com; dkim=pass (1024-bit key) header.d=antgroup.com header.i=@antgroup.com header.b=03Z25AFH; arc=none smtp.client-ip=140.205.0.214
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=antgroup.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antgroup.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antgroup.com header.i=@antgroup.com header.b="03Z25AFH"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=antgroup.com; s=default;
	t=1715012575; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=V5hA+ZyI44gZD58G2AfJieyG2gwT3Fy83Cv7WPpLrX0=;
	b=03Z25AFHdVHJMQMDkoD25JasGdYCjC4kTjfhEvJ42tO75zvwlZZ9TP61ykoJv/F/NpSvFtL4YAgHmR/j9gXNvsceQyFBkuj/VmAzIT0/vgG1VmofmPdCX8Q1igHhOxNnK4DdvR6c+ZKnktCy9/QGSY4mZnbrRIw/JjeIhTtZccA=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R161e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018047202;MF=libang.li@antgroup.com;NM=1;PH=DS;RN=16;SR=0;TI=SMTPD_---.XTd3Clf_1715010725;
Received: from localhost(mailfrom:libang.li@antgroup.com fp:SMTPD_---.XTd3Clf_1715010725)
          by smtp.aliyun-inc.com;
          Mon, 06 May 2024 23:52:06 +0800
From: "Bang Li" <libang.li@antgroup.com>
To: akpm@linux-foundation.org,
	chenhuacai@kernel.org,
	tsbogend@alpha.franken.de,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	chris@zankel.net,
	jcmvbkbc@gmail.com
Cc:  <linux-kernel@vger.kernel.org>,
   <linux-mm@kvack.org>,
   <loongarch@lists.linux.dev>,
   <linux-riscv@lists.infradead.org>,
   <david@redhat.com>,
   <ryan.roberts@arm.com>,
   <ioworker0@gmail.com>,
   <libang.linux@gmail.com>,
  "Bang Li" <libang.li@antgroup.com>
Subject: [PATCH v2 3/5] riscv: Add update_mmu_tlb_range()
Date: Mon, 06 May 2024 23:51:18 +0800
Message-Id: <20240506155120.83105-4-libang.li@antgroup.com>
X-Mailer: git-send-email 2.19.1.6.gb485710b
In-Reply-To: <20240506155120.83105-1-libang.li@antgroup.com>
References: <20240506155120.83105-1-libang.li@antgroup.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Added update_mmu_tlb_range function, we can batch update tlb of an
address range.

Signed-off-by: Bang Li <libang.li@antgroup.com>
---
 arch/riscv/include/asm/pgtable.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 661b2b4fe758..f784c6dd2c66 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -489,6 +489,10 @@ static inline void update_mmu_cache_range(struct vm_fault *vmf,
 #define __HAVE_ARCH_UPDATE_MMU_TLB
 #define update_mmu_tlb update_mmu_cache
 
+#define __HAVE_ARCH_UPDATE_MMU_TLB_RANGE
+#define update_mmu_tlb_range(vma, addr, ptep, nr) \
+	update_mmu_cache_range(NULL, vma, addr, ptep, nr)
+
 static inline void update_mmu_cache_pmd(struct vm_area_struct *vma,
 		unsigned long address, pmd_t *pmdp)
 {
-- 
2.19.1.6.gb485710b

