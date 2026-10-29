Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.215
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793295047;
	b=uVF7S1jtF3pvAqkCWlKJGdfeMtDtKEPqA0vFrAD8aw8NeYwKfZJOCHAUGGE28H88uKFG
	 1pUh+mdDcWnLP19wTipqVBdR3W00qMTJEMZxUeAo/d81srWxcqZ2PLEUR9mdxhTqY9Nvy
	 dohZl0yE7dPTpXxZ4CRnx2jB4eN6C5M5cNw8cJjfb1vZj/D9+XqGUGArvxWbbKbtfIadU
	 uNU/dAFdd87mPGZcU/Z/3Go0wF/38qJQF6KeZ9+mtZSVOPB1vblSdJ75IHf+nbOhp5yUL
	 t6XM0c5S30z/JdIi54+i/DNc8qoqJeUPrDSn4a1xIdWBGVP6fVB07WJXTCgePZjINyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793295047;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ZMDApzLIDOAKE5Gyc0kBJeDtiPqWtLZVQgfI5VI22BQ=;
	b=zCCY5WYjG7Yq3NGFsBIXRNgYt+mYKP/MyVskKKLhJcfMNU+Xo9dfLOIlh8g+oFlBQhB2
	 XW9J5hBKQ6hbPKhHHDuPlR/ozGKYMMd9mt3zfh+B8kM45H8BmYNtTTLZ30ngL7gvU6xli
	 SQZAkQygnitazilwcDFVuZ5zKu5iib8+O/usrq2jhL/JQ9x+bvJ8mxgmIocaI6xcc8KKv
	 VjrKSpbBOEOGynQNe+oxGkPGTmOnqE3UDQFsMv8hGFsXvWOEkFfZiksQFFILou+Z4XOJU
	 kd3Z/8Q6Qo8XFr18kom368AeWyNXDLS72gkuKt/xwYsiBKslcgfRza91C3dCEHqRriA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=DlimMrOb;
	arc=none smtp.remote-ip=95.215.58.215
Received: from mta1.migadu.com (out-215.mta1.migadu.com [95.215.58.215])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D5AE606A31E
	for <loongarch@lists.linux.dev>; Thu, 29 Oct 2026 17:30:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D5AE606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=DlimMrOb
X-Envelope-To: loongarch@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=LXdJ2wzcp0hoHVE9cbEq+7Hky76xZdetmi2maoCyhPM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793295045; v=1; x=1793899845;
 b=DlimMrObNqkXb5rzzvGt/o5MlLGzTCnpncP0VUWI1dg2+CfU41UO9p3lvJQnz69v18Cywvrp
 px/On5GsE4FyXiNd8EQRj6TXLEiLlr5Mtt1AVGx+tkk2prfJRp1trLFlgy55E+DuthYgyepjnDS
 Ho07kMcgRMyyjJwh4u4XbJzQ=
X-Envelope-To: loongarch@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id 9eed6b1d4b951111;
	Thu, 29 Oct 2026 17:30:45 +0000
X-Mizu-Trace-ID: 9eed6b1d4b951111
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
Subject: [PATCH v6 3/8] kho: Include linux/mm.h in kho_block.c
Date: Fri, 30 Oct 2026 02:29:50 +0900
Message-ID: <20261029172956.20791-4-dongtai.guo@linux.dev>
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

kho_block.c calls virt_to_phys() and phys_to_virt(). With CONFIG_KFENCE=y,
the LoongArch implementations use offset_in_page() and page_address(),
which are provided by <linux/mm.h>.

Include <linux/mm.h> explicitly to avoid implicit-declaration build
errors for these helpers.

Co-developed-by: Kexin Liu <liukexin@kylinos.cn>
Signed-off-by: Kexin Liu <liukexin@kylinos.cn>
Signed-off-by: George Guo <guodongtai@kylinos.cn>
---
 kernel/liveupdate/kho_block.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/kernel/liveupdate/kho_block.c b/kernel/liveupdate/kho_block.c
index 0d2a342ef422..0d56891b2f4c 100644
--- a/kernel/liveupdate/kho_block.c
+++ b/kernel/liveupdate/kho_block.c
@@ -25,6 +25,7 @@
 #include <linux/kho/abi/block.h>
 #include <linux/kho_block.h>
 #include <linux/slab.h>
+#include <linux/mm.h>
 
 /*
  * Safeguard limit for the number of serialization blocks. This is used to
-- 
2.53.0

