Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.204.34.129
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792563751;
	b=0vUdPSOxMtQDPoRsvUIECSM3cZ3IzOoMBAJJetGIgBEqD12urMxhxQXcnzZCitfCbAjy
	 jAhU+fgBQAbCpwBt86TrXoJuH30fkBJaSe7utEVOb8Yo7flT4TiLd4b6n0/btQ914qZHV
	 6xvsbvlvpQSyX0GU+a8IGlgIinSM/3eB0u6a8+OZqI8yp5daSVSAfVdkr+q4h5OODWJ8Z
	 CXMYueRrswuF+vpML4j/OstigPBzl5Rmi100erAT8M2d2aeAfF3OcUz9KuOyoAeyCc7uQ
	 oRej6aobOhqH4VLFjMz5eE78/q6mRI9V5SaW846iAENDI+F48DWm/c2VA5Vj8KtCe0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792563751;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-QQ-SENDSIZE:Feedback-ID:X-QQ-XMAILINFO:
	 X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=AsQZnRDvC0D3gP3oQhOuDZhnSM3XMIz82czrPE7tuD4=;
	b=3bQYKDSHPsQAHoDBtQ/y9MRhFo3YagSAOIgl8nKmdjwQVsvAPbv0yG1QxJNnjTZMMqR+
	 6lrnMBkz5BYfqSokK/p0p4WoJjMswWdyjdXiIq3GhPptOsoyjmRj55p/IJiSuUEF7uTj5
	 m/P4FGsQZ4SqiJiFIj6SMEvl5znczuQPHfpZRLcxzpah8MSJDWAIB3xmk+/WdjfGhs5f4
	 3KYCGm9HaXjFnN5atn+5AtB/tyHdkaasf/kwjc6+eEAw3CtJyLF6/TQ5fppt/JX589dUV
	 b6meqAMGBylhPiYodc5h8SpknyJE0c5dDAfT0J0W98hn4G2qzzIXDe07WSGLUtGXJLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=uniontech.com;
	spf=pass smtp.mailfrom=uniontech.com;
	dkim=pass header.d=uniontech.com header.i=@uniontech.com header.a=rsa-sha256 header.s=onoh2408 header.b=B4Gt3o48;
	arc=none smtp.remote-ip=54.204.34.129
Received: from smtpbguseast1.qq.com (smtpbguseast1.qq.com [54.204.34.129])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85F1D606A336
	for <loongarch@lists.linux.dev>; Wed, 21 Oct 2026 06:22:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85F1D606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=uniontech.com header.i=@uniontech.com header.a=rsa-sha256 header.s=onoh2408 header.b=B4Gt3o48
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1792563701;
	bh=AsQZnRDvC0D3gP3oQhOuDZhnSM3XMIz82czrPE7tuD4=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=B4Gt3o48CKZcdUJM7kKyfvejkS7Od6tMdMud4VBGnIpcWwLkFFYnZwMkKuCHQDNe9
	 EoASmRmAbdE2jN6D4rzQz9ByZH/09MdrHmLifYDPOIPAG2t8VFvq07aIgUXpU0EL9u
	 5Mnb2ojhNhjDuba61y7Fl3A/VVQowsG26fW8x9Ag=
X-QQ-mid: zesmtpip2t1792563681t96cc3f72
X-QQ-Originating-IP: SGYOyl1bUWSgKy+cMFiCAF5bJZnqzi5KC2bcPI92i/4=
Received: from localhost.localdomain ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 21 Oct 2026 14:21:18 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 6018804124745603915
EX-QQ-RecipientCnt: 10
From: Wentao Guan <guanwentao@uniontech.com>
To: chenhuacai@kernel.org
Cc: kernel@xen0n.name,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	akpm@linux-foundation.org,
	rppt@kernel.org,
	david@kernel.org,
	muchun.song@linux.dev,
	Wentao Guan <guanwentao@uniontech.com>
Subject: [RFC PATCH] LoongArch: mm: avoid backing vmemmap beyond max_pfn
Date: Wed, 21 Oct 2026 14:21:15 +0800
Message-Id: <20261021062115.116922-1-guanwentao@uniontech.com>
X-Mailer: git-send-email 2.39.5
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
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MjZkc9TfnG+XR3/U2Vek5hNImTnjycVoFb0OssoGpvRmDpaVdTaHlEYh
	I8xIb1fcBjURPhyXLJ/lUNrVI+jmJ/0Pm03Ye28Fl+h1WUkLZYSWUjdHQETqqmfDhs67h+b
	uH7ORoE9K0YBoMxSGEAxRbZoeKyDz98WE3PmkrJRukX53rRZPGxMZg9rvWIZheRd3Iu6DiG
	YN7pfIWW/BAaUPHjvK+JzmbKhCKEmGVyXoOn0GIJnz2QkhXMmqjcjg1AicDBDPAXv61ZYI5
	8rq6SjP9+28IoOX2EuGY/lihMXP+scGGU0gFIRKf8uQEBEu2EvzJCaLCmheOf15n6c6qy+/
	rDjitIYzvXBCVgMH5T25bJSXlY0l2O4ad4kL+yeOsWZZLqxbCUT3xXMuWXCB9qclPiGNwgC
	+UXBLlU2ziFZX2r5K1c52P7rE02GGahzcMqLSAtG7iKTvo1ApqodvtLy1zTN8XWOx5j5V2H
	5b8mSgNHZk9yeFUOCHLLHz048p7kvsJkndddaOmiNt3pvnnqM7+fRVoR5GzrXOGvSNM3/4w
	klkcAp1jlXYSmbEX2y7yaTPUoPxQKwrdyXFdWtHSyQ6PAP0Ml6vhTS6IZQ2R2CfrgumkQJc
	5OfXTdvbQnLUTVxdi2Db42yn3QodxwLzt+4YyZHwU5TJTdavc8ieHbJbhBfmZmHgy5W6Zdy
	hDtHPkSI5GoZ6Yxtpu3QqERonqdRyrn+bIebizcmGvRZ+s8/WwYmcqkSIoXVbwje2L7gdn+
	+ZHA/f0OmJLGyYEcgR8m36vlX0T76CTRZ0TxH4QS/xSvFNtdvLds4ua1Z8wiss5c7MpqnaZ
	2RfxsS16AVPd6VgLUihsAj87+TPX8F1Cdqfk1EP6tvEFEVjOGoxGAueXHiKiC5ZfrmrEURH
	ttk9bPWnB657lkYplt83LLrKh1A+2C76etEFvK4zzLV3F7iFOl69vx3ldruBi3TCrw1jo28
	IsRD6mpjJ76SqUOy4H/eYzNeax/QsWr+PKPyLzeMnlEJqYcM5zqGk85dFAYB+Vtev+BfIjx
	fSvL2RTT0Pz+E8e3MMkowRY+A0NHSBP+7I6aq9scrU8tPYZxUL
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
X-QQ-RECHKSPAM: 0

A PMD maps 32MiB of vmemmap on LoongArch with 16KiB base pages, while a
512MiB section only needs 2MiB.  vmemmap_populate() is called for each
section and vmemmap_populate_hugepages() installs a PMD mapping for the
whole PMD, so the last PMD also backs struct pages for PFNs beyond
max_pfn.

On a 34GiB system 160MiB of vmemmap is mapped although 136MiB is
needed.  The extra 24MiB describes PFNs that do not exist.

Other architectures handle this differently.  On x86, arm64 with 4KiB
pages, and riscv, the PMD covers exactly one section's vmemmap, so the
huge page path never maps beyond the populated range; x86 tracks
partially used PMDs with PAGE_UNUSED for memory hotremove.  arm64 uses
base pages for 16KiB and 64KiB kernels.  s390 deliberately keeps using
1MiB frames even for partially used PMDs because vmemmap_populate() is
called per section and falling back would add page tables.  powerpc
radix falls back to base pages only when the altmap cannot back a full
PMD or the allocation fails, and powerpc hash maps the vmemmap with the
linear mapping page size, which can exceed a section as well.

With 16KiB pages the LoongArch PMD is 16 times the vmemmap of one
section.  Moving the whole vmemmap to base pages, as arm64 does for
16KiB and 64KiB, would also remove the tail, but it would give up PMD
mappings for the 128MiB that is fully populated.  Use base pages only
for the PMD that extends beyond pfn_to_page(max_pfn) and keep huge
mappings for the rest.

The altmap case is left alone because max_pfn does not describe it.

Signed-off-by: Wentao Guan <guanwentao@uniontech.com>
---
 arch/loongarch/mm/init.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/loongarch/mm/init.c b/arch/loongarch/mm/init.c
index 4b46c5d30708d..bb7a17bdb0e51 100644
--- a/arch/loongarch/mm/init.c
+++ b/arch/loongarch/mm/init.c
@@ -146,6 +146,11 @@ int __meminit vmemmap_populate(unsigned long start, unsigned long end,
 #if CONFIG_PGTABLE_LEVELS == 2
 	return vmemmap_populate_basepages(start, end, node, NULL);
 #else
+	unsigned long vmemmap_end = (unsigned long)pfn_to_page(max_pfn);
+
+	if (!altmap && (start & PMD_MASK) + PMD_SIZE > vmemmap_end)
+		return vmemmap_populate_basepages(start, end, node, NULL);
+
 	return vmemmap_populate_hugepages(start, end, node, NULL);
 #endif
 }
-- 
2.39.5

