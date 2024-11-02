Received: from smtpbgbr2.qq.com (smtpbgbr2.qq.com [54.207.22.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEA112595
	for <loongarch@lists.linux.dev>; Sat,  2 Nov 2024 05:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.207.22.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730526295; cv=none; b=B4WKZkSXMJHLu18sXn/OUe1DE4fqtBQugXTj2vIkTfG0dWj+b3jh+KZgEVv5GQrFZhPuH9Lmr831KRgqyUqLVME/ale/cXKlANxy7y+ny0wYvOk8QXTS+xr+HemuJGD61AupkavgPz2/D+vfNhIXCMhNOF+T7acY56m+Ovixwbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730526295; c=relaxed/simple;
	bh=yOUQSBsILkKt77B9oalo0ExmSVmo29tUfsF6B6jI7Yg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=R8UKp5+57PIERY1MtLXPO0KnjrdtqKOOvHda9ObijwoW1aSvXYhsIebx5zh1crfM6+SGS7bgaRxpB1lk75cyBmD9fEOZi6h8BbP3xBnL5QwpWhAZPtdgZa0m8xkBeJB40PJKPCVqPhPjlFeJXI6UwvdZjML4Op2qVnh/BnF1IXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=RuV++PyR; arc=none smtp.client-ip=54.207.22.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="RuV++PyR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1730526275;
	bh=BIyYvigQq7UKFOdCDQCsps6q948TUJUQ8Syfr7kRYLc=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=RuV++PyRr6Fv8a9x44KuoMHtz7SGWDFP/pgSG3zLiTNT1ftJZPxD7No4zm1myztFe
	 WXQNNoY4ovxlLWPxGahQivXt9ylyYLSAGwJliBVr+IJB0qR89KEd9fM0f4izPg7Cux
	 Jo44DEKL0UpvAKAlCRda+TO67IAtB6aPm3U4A7UU=
X-QQ-mid: bizesmtpip3t1730526061t8abo2y
X-QQ-Originating-IP: lGcQ/SKHCJLsGWmdKi8OnvoZ3URBdJcfKRGdsM5umzs=
Received: from avenger-OMEN-by-HP-Gaming-Lapto ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sat, 02 Nov 2024 13:40:59 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 2957908697263137939
From: WangYuli <wangyuli@uniontech.com>
To: chenhuacai@kernel.org,
	kernel@xen0n.name,
	tglx@linutronix.de,
	max.kellermann@ionos.com,
	arnd@arndb.de,
	wangyuli@uniontech.com
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	guanwentao@uniontech.com,
	jiaxun.yang@flygoat.com,
	zhanjun@uniontech.com,
	anshuman.khandual@arm.com,
	akpm@linux-foundation.org,
	vbabka@suse.cz,
	geert@linux-m68k.org
Subject: [PATCH] LoongArch: mm/vma: define a default value for VM_DATA_DEFAULT_FLAGS
Date: Sat,  2 Nov 2024 13:40:41 +0800
Message-ID: <1BC681DB785E0181+20241102054042.74847-1-wangyuli@uniontech.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: NV9lVvsB36Opgc9HaoFhVn22rzEGGxleQ1oJM0VrZO/YvRyYHZA6Xq3f
	dVvD1wuaFvp0q3dnYugMDmd3IdyLnrl4o1j2DmO/u2W4uzxgF15YVHzsQZDehhlZlwzFNwb
	GMf9JGCoPWtzJBqlTCnrb4swJ/VcypU8Elm8FKqIaZtsSOLDyMspD/MB+qh10tc9u5dIL6W
	CM6X40r8WGx+C+EQTvs88WPow1DcuVMrPl9j0DpEbMKv1Wkvy3y0UM5tRMTAzG8Fjjfl5xq
	LZ5BA2MqDHaVSJNWjqQwoc2P3K56ebS+mmGJ8nzNA9BgMezWINdImrxWCvIboSbNZYbZkVv
	SfD8IxKAQfjDB8gMfzjQ8HtSJ29bAm7Wwp4v+ewkYUIdUbELjm0zFr4P1gQMYx7nWlI7MYr
	u/4iIzNaapJAtZYO8COCL14hhb5AvcmMxUuf5Dzra4iKi410xc2bhMJKjcMKHh01QHqL/DO
	MI7wpq2/K4RaqXKrCVBRWcDKKbIMdYhucIZvwCJlIZWxMcA3rZ5tAmxsdTpLwOKY89Bq9U+
	+io045ng3Y1OAY3Rc2Oc1njQ9LlAFFueG1Sq4jl/oIMcs58YHdj1inx86QkUIaVxcniMe2v
	P81QJsT+JDYN0xKHDv2eKj7YEbaP4iS6eeorTIuJLtdhqsfmRkvp8YsCKwzdPp1yjAxTkBp
	r83dTdzRhIk/cCDuvLCTcQdTJyo5W332ayoiOl6W0IfDKto4xUTXIx+/820LFRZUjgXR8UD
	n0VrjrWEqOezVjQ7iihGSnDaWUYCMDfeKTNgEQ0YzOYFRFlTEV8OS+NGPfuBA9RUfZz1CeB
	7Ljhk8/+VwF/3LfRK5Vqi9q9aNoFxpK6CX5ry8AqiPKjVVbfXaC/nMKhdtxrEyRCgBAv8L5
	gVfbxAW6JGuL+FHV2HvF+X3naulvwrrhfH+umQLBsEdw2ysUvHFNTTAUsxD5gWihaUF7wkZ
	YLRIqhIH1GuvKpc9ScZ2jR3dZumIS6sdDV9vVQek98BTkm/9t6IPYzixdniaxlnttvnCNx1
	V4LxsMD53Zne1JsOJ6DeimU43nIHWWq7XN7HbKuAREjoCE4rYb
X-QQ-XMRINFO: Mp0Kj//9VHAxr69bL5MkOOs=
X-QQ-RECHKSPAM: 0

Commit c62da0c35d58 ("mm/vma: define a default value for
VM_DATA_DEFAULT_FLAGS") has unified default values of
VM_DATA_DEFAULT_FLAGS across different platforms.

Apply the same consistency to LoongArch.

Suggested-by: Wentao Guan <guanwentao@uniontech.com>
Signed-off-by: WangYuli <wangyuli@uniontech.com>
---
 arch/loongarch/include/asm/page.h | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/arch/loongarch/include/asm/page.h b/arch/loongarch/include/asm/page.h
index e85df33f11c7..8f21567a3188 100644
--- a/arch/loongarch/include/asm/page.h
+++ b/arch/loongarch/include/asm/page.h
@@ -113,10 +113,7 @@ struct page *tlb_virt_to_page(unsigned long kaddr);
 extern int __virt_addr_valid(volatile void *kaddr);
 #define virt_addr_valid(kaddr)	__virt_addr_valid((volatile void *)(kaddr))
 
-#define VM_DATA_DEFAULT_FLAGS \
-	(VM_READ | VM_WRITE | \
-	 ((current->personality & READ_IMPLIES_EXEC) ? VM_EXEC : 0) | \
-	 VM_MAYREAD | VM_MAYWRITE | VM_MAYEXEC)
+#define VM_DATA_DEFAULT_FLAGS	VM_DATA_FLAGS_TSK_EXEC
 
 #include <asm-generic/memory_model.h>
 #include <asm-generic/getorder.h>
-- 
2.45.2

