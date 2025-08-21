Received: from out-172.mta0.migadu.com (out-172.mta0.migadu.com [91.218.175.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3667F277C90
	for <loongarch@lists.linux.dev>; Thu, 21 Aug 2025 03:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755745511; cv=none; b=mQGuhFaBCjrh4RbLYMyzhXyjA6NJgWSYSD659tUCNbailoZ0eJFUv7XGyJZy7eFRFgXPkqrw3/iuHer9ZkklpV8rDp1Nk3+mDoSgo/gfdOhjIssljaooBIEcAe0gaNp4sNnJsvRlgkVM1WZYV1Q2WmABvJF9mapKZaw4kWTGi2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755745511; c=relaxed/simple;
	bh=d10fWJ455lOnSHgv7woEzv6izVvATF7GDZbKY2mVr2g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Sf2nwBswhTdWX+O9wq7iCWZlZaxJ8bOo4mqKoSK82QdmtXHonTiDumu8kT3SyWdxmvgwAey2FbZtBt2TIAo0X9Vx6KDdiCjoTkbXp+lDeY9yeNDj8MLmQQYG+BY5/ff+HcawnlV147YEWpMB5Vjj7WqTtAI1jjvDk7nEK/hjBhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Sax2rce4; arc=none smtp.client-ip=91.218.175.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Sax2rce4"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1755745506;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=F1sAVvn7LbemSMUfxHZc8glfDco9wmhXxyAHOOiBBXM=;
	b=Sax2rce4TbLAp28hZo8lvRT+QMeThXSFds3loL4TSfSY5ys27Y+a0dTc5+DkoYs0kh0rDB
	I8cIhbrzimewej3GR7tlurwwnc6rMNM/Bs9DEivwc2baXH+je7Nxg/q6FJyE80DtbLKjsy
	JLZk5IYhkkwrqccVC5Bd0YAwe8GnIWE=
From: george <dongtai.guo@linux.dev>
To: chenhuacai@kernel.org,
	kernel@xen0n.name,
	hengqi.chen@gmail.com
Cc: akpm@linux-foundation.org,
	dave.hansen@linux.intel.com,
	geert@linux-m68k.org,
	guoweikang.kernel@gmail.com,
	loongarch@lists.linux.dev,
	George Guo <guodongtai@kylinos.cn>
Subject: [PATCH v2] LoongArch: mm: remove redundant pte occupancy check in __set_fixmap()
Date: Thu, 21 Aug 2025 11:05:00 +0800
Message-ID: <20250821030500.373806-1-dongtai.guo@linux.dev>
In-Reply-To: <20250513101948.000036d6@linux.dev>
References: <20250513101948.000036d6@linux.dev>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

From: George Guo <guodongtai@kylinos.cn>

This check could falsely report errors when PTEs are remapped:
arch/loongarch/mm/init.c:204: bad pte 0000000107b601c3.

The check was unnecessary because:
- Fixmap slots are designed to be reusable
- Callers are responsible for proper mapping management

Changes in v2:
- modify commit messages

Signed-off-by: George Guo <guodongtai@kylinos.cn>
---
 arch/loongarch/mm/init.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/loongarch/mm/init.c b/arch/loongarch/mm/init.c
index c3e4586a7975..626c99b803a3 100644
--- a/arch/loongarch/mm/init.c
+++ b/arch/loongarch/mm/init.c
@@ -192,10 +192,6 @@ void __init __set_fixmap(enum fixed_addresses idx,
 	BUG_ON(idx <= FIX_HOLE || idx >= __end_of_fixed_addresses);
 
 	ptep = populate_kernel_pte(addr);
-	if (!pte_none(ptep_get(ptep))) {
-		pte_ERROR(*ptep);
-		return;
-	}
 
 	if (pgprot_val(flags))
 		set_pte(ptep, pfn_pte(phys >> PAGE_SHIFT, flags));
-- 
2.34.1

