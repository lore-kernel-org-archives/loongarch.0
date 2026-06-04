Received: from out-180.mta0.migadu.com (out-180.mta0.migadu.com [91.218.175.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ABF42E54D3
	for <loongarch@lists.linux.dev>; Thu,  4 Jun 2026 09:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780564918; cv=none; b=MyLfgudQ8MsALZMQmiszPxXf/OaCQkp2GrAluNUQlR18J0lCye/eUiPfSwi6IONYn6arnSxKzTYbtt4luP4NmFqG1ENuV0R/AdTJBjXjnwCScUnpJgr3G1x+3ukm8imRGfPFaA4NXYb7fgDql8/PcMKkIz5aq1e6fvVAz/TyyyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780564918; c=relaxed/simple;
	bh=rcSokezPtOhcmxFsI5Wjm+Dyp0dcdRxlmM64NQ3fje0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=C/uxwhtHdEW4ozWS741Ia1x/Db576VMpjpzA4KpQ/gPGEMvK5FpBaKX+ADJFGo0etBnodval9Nv41kN+caPqwGARJ2WLJP1hHCOhZ2pp6GqNEdHy/ZI7FO75vkNaISSr8pEsA1d4O4lMxiqLugnwCN2APOBs6f3qeZ0PY44l114=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=fY9klKKl; arc=none smtp.client-ip=91.218.175.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="fY9klKKl"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1780564913;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=MpDsKqtekJF/ott3Wm9QFal8yf1kb3vz/4aJWlmRjiw=;
	b=fY9klKKlP4cXfhABmPRlqYQP+b6Iu9wu75MwA7pQElSgeZMor7qdyydSudzS3Kjz5MZkDy
	iPnHz85+14rrN+cZvmJi2kNolTohKYjYGyKWSM+sCV6IOktlJOTj6H+bZOVbNIGyJgE+JC
	0+7Mi11pATjgp3/WiglhFnDG+hcyIQw=
From: George Guo <dongtai.guo@linux.dev>
To: pasha.tatashin@soleen.com,
	rppt@kernel.org,
	pratyush@kernel.org
Cc: kexec@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	chenhuacai@kernel.org,
	loongarch@lists.linux.dev,
	George Guo <guodongtai@kylinos.cn>,
	Kexin Liu <liukexin@kylinos.cn>
Subject: [PATCH v2] liveupdate: luo_session: include linux/mm.h for virt/phys translation
Date: Thu,  4 Jun 2026 17:19:13 +0800
Message-Id: <20260604091913.306603-1-dongtai.guo@linux.dev>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

From: George Guo <guodongtai@kylinos.cn>

luo_session.c calls virt_to_phys() and phys_to_virt(). On LoongArch with
CONFIG_KFENCE=y, these macros (in arch/loongarch/include/asm/io.h) expand
to offset_in_page() and page_address(), both declared in <linux/mm.h>.

Since luo_session.c only includes <linux/io.h>, the translation unit fails
to build with CONFIG_KFENCE=y:

  asm/io.h: error: implicit declaration of function 'offset_in_page'
  asm/io.h: error: implicit declaration of function 'page_address'

Add the missing include to fix these build errors.

Co-developed-by: Kexin Liu <liukexin@kylinos.cn>
Signed-off-by: Kexin Liu <liukexin@kylinos.cn>
Signed-off-by: George Guo <guodongtai@kylinos.cn>
---
v2: Move the include from arch/loongarch/include/asm/io.h to the consumer
    luo_session.c, instead of pulling the heavy <linux/mm.h> into the
    low-level asm/io.h header (per review feedback). The 0-day report
    confirmed the v1 approach introduces a circular include
    (slab.h -> kasan.h -> asm/kasan.h -> asm/io.h -> mm.h, where mm.h
    needs kfree() before slab.h declares it).
Link: https://lore.kernel.org/r/20260521063310.52926-1-dongtai.guo@linux.dev/ # v1

 kernel/liveupdate/luo_session.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/kernel/liveupdate/luo_session.c b/kernel/liveupdate/luo_session.c
index 7a42385dabe2..4ce7128a4ae9 100644
--- a/kernel/liveupdate/luo_session.c
+++ b/kernel/liveupdate/luo_session.c
@@ -62,6 +62,7 @@
 #include <linux/libfdt.h>
 #include <linux/list.h>
 #include <linux/liveupdate.h>
+#include <linux/mm.h>
 #include <linux/mutex.h>
 #include <linux/rwsem.h>
 #include <linux/slab.h>
-- 
2.25.1

