Received: from out-172.mta0.migadu.com (out-172.mta0.migadu.com [91.218.175.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D83A72DECBF
	for <loongarch@lists.linux.dev>; Fri,  7 Aug 2026 10:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786099140; cv=none; b=aPb7MamIqb1vnZ2c3PwAZDIp5vaOSp06ri3T0Tb2Mi4IB9FqakEGPuz07Pqz5oZ/iEDz1uq+e8lne9TC+UdYCT8dF1HtOxx9iIormEOOcCwavg25TCdHc4ipIzp0bbB3B0p5TxPQMP/vGua/9Rxgrgg6cmjUG9gq4RpCQwCBUf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786099140; c=relaxed/simple;
	bh=fqqsQaloq3X7EORELDdRzN6fv5y1opQI77hHeUsPE5o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kUqmEJ/RdwP4/ejnFln2Nj4KBmlvrstFMZxdl0qaS3449JODvLqbbuC+Iq9yyQGHR67oEKmj7V6nuk0ti05DFIvcKsS3Qjcn2mPjJ6uD6uCx323EPcY2ekOmWxfU3jpYlumedtW7RrPFwCvDVP9ZXeZIpvYM7DbjPKbmMNCV29c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=K/B1TZEE; arc=none smtp.client-ip=91.218.175.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="K/B1TZEE"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1786099136;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IhT9Nbnrmy1FCrntkD6IOlFelDNdobApjep1pMDJx7k=;
	b=K/B1TZEEloG3kmATLa01mpjHRXTcYT8OdEuMPA08x4VuWBrroYrXT6NA0bUekvtBpiPO5j
	d3a39YO2i1b2WEXhstvivoHKfRapFZFDDTQ68bYv28/okWZKG0ykMrfKDqI3vj1LeU5hwp
	VCQRU7Y6V/hVnlzk62RoS48vudn7TtY=
From: George Guo <dongtai.guo@linux.dev>
To: chenhuacai@kernel.org,
	rppt@kernel.org,
	pasha.tatashin@soleen.com,
	pratyush@kernel.org,
	shuah@kernel.org,
	ardb@kernel.org
Cc: guodongtai@kylinos.cn,
	kernel@xen0n.name,
	graf@amazon.com,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	kexec@lists.infradead.org,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-efi@vger.kernel.org,
	Kexin Liu <liukexin@kylinos.cn>
Subject: [PATCH v4 3/4] liveupdate: luo_session: include linux/mm.h for virt/phys translation
Date: Fri,  7 Aug 2026 18:37:13 +0800
Message-ID: <20260807103714.33074-4-dongtai.guo@linux.dev>
In-Reply-To: <20260807103714.33074-1-dongtai.guo@linux.dev>
References: <20260807103714.33074-1-dongtai.guo@linux.dev>
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
Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 kernel/liveupdate/luo_session.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/kernel/liveupdate/luo_session.c b/kernel/liveupdate/luo_session.c
index f38b5b18f3f8..31490ac7b63d 100644
--- a/kernel/liveupdate/luo_session.c
+++ b/kernel/liveupdate/luo_session.c
@@ -94,6 +94,7 @@
 #include <linux/kho/abi/luo.h>
 #include <linux/list.h>
 #include <linux/liveupdate.h>
+#include <linux/mm.h>
 #include <linux/mutex.h>
 #include <linux/rwsem.h>
 #include <linux/slab.h>
-- 
2.53.0

