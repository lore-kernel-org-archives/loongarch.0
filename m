Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4C7E303A2B
	for <loongarch@lists.linux.dev>; Tue,  9 Sep 2025 07:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757402404; cv=none; b=TRcuEjgMb50TEfJucO+F+pQxE89rp2j9hmiOjJtzL8bpGjxphktHJd/fBdKrcAHX30Epj0oUdSjzHMnbsV6GIr5fcf+NVy5yFgUuM9yy8QPypa9iXDbP3VMpFJp4uXBfYaTI5RoQrXjKd/BIOww0CwtffUSp8DfLOJ1vIsa0a9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757402404; c=relaxed/simple;
	bh=S/5Rvz7e8FRVyPmtxt5eOlYi3u9O3wh6EDo/i6igZ8k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LQaoDDA77jbYWa4JfWSkpNW1n3WUj7PZCQlGi7rUFQIjaZN4hAEJtMoGnQjwkh1TO+jpBv6WFueNYaY84RSlNPe46L0bt7hPDOOtYlHnNhuaers+GjAZuZkQAbAz0ZzC9hZpJICw7+AwaOz7gdBkZG4x0BSj9yw+hTbOj+I4t3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 6295c25a8d4d11f0b29709d653e92f7d-20250909
X-CTIC-Tags:
	HR_CC_COUNT, HR_CC_DOMAIN_COUNT, HR_CC_NAME, HR_CC_NO_NAME, HR_CTE_8B
	HR_CTT_MISS, HR_DATE_H, HR_DATE_WKD, HR_DATE_ZONE, HR_FROM_NAME
	HR_SJ_DIGIT_LEN, HR_SJ_LANG, HR_SJ_LEN, HR_SJ_LETTER, HR_SJ_NOR_SYM
	HR_SJ_PHRASE, HR_SJ_PHRASE_LEN, HR_SJ_WS, HR_TO_COUNT, HR_TO_DOMAIN_COUNT
	HR_TO_NO_NAME, IP_TRUSTED, SRC_TRUSTED, DN_TRUSTED, SA_UNTRUSTED
	SA_LOWREP, SA_EXISTED, SN_UNTRUSTED, SN_LOWREP, SN_EXISTED
	SPF_NOPASS, DKIM_NOPASS, DMARC_NOPASS, CIE_BAD, CIE_GOOD
	CIE_GOOD_SPF, GTI_FG_BS, GTI_RG_COMM, GTI_C_CI, GTI_FG_IT
	GTI_RG_INFO, GTI_C_BU, AMN_T1, AMN_GOOD, AMN_C_TI
	AMN_C_BU, ABX_MISS_RDNS
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:407287ae-b91a-4e22-a617-5a1fc46c2fef,IP:15,
	URL:0,TC:0,Content:-5,EDM:25,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,AC
	TION:release,TS:20
X-CID-INFO: VERSION:1.1.45,REQID:407287ae-b91a-4e22-a617-5a1fc46c2fef,IP:15,UR
	L:0,TC:0,Content:-5,EDM:25,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:20
X-CID-META: VersionHash:6493067,CLOUDID:6a574abd7be5b7c4ad38620fadfd79b1,BulkI
	D:250909151958BHQ3YCED,BulkQuantity:0,Recheck:0,SF:17|19|24|38|44|66|78|10
	2,TC:nil,Content:0|50,EDM:5,IP:-2,URL:99|1,File:nil,RT:nil,Bulk:nil,QS:nil
	,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_FAS,TF_CID_SPAM_FSD,TF_CID_SPAM_FSI,
	TF_CID_SPAM_ULS
X-UUID: 6295c25a8d4d11f0b29709d653e92f7d-20250909
X-User: cuitao@kylinos.cn
Received: from ctao-ubuntu.. [(39.156.73.13)] by mailgw.kylinos.cn
	(envelope-from <cuitao@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1595949212; Tue, 09 Sep 2025 15:19:55 +0800
From: cuitao <cuitao@kylinos.cn>
To: chenhuacai@kernel.org,
	loongarch@lists.linux.dev
Cc: kernel@xen0n.name,
	linux-kernel@vger.kernel.org,
	cuitao <cuitao@kylinos.cn>
Subject: [PATCH v2] LoongArch: Add a check for the return value when creating the kobj
Date: Tue,  9 Sep 2025 15:19:42 +0800
Message-ID: <20250909071942.1846204-1-cuitao@kylinos.cn>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a check for the return value of kobject_create_and_add to ensure
that the kobj allocation succeeds.

Signed-off-by: cuitao <cuitao@kylinos.cn>
---
v2: Removed the unnecessary modifications.
https://lore.kernel.org/all/CAAhV-H7ECnVeOgf93SEXLHLc4wvhQMjQXDbGKCR-KXKWf8Vgtg@mail.gmail.com/
---
 arch/loongarch/kernel/env.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/loongarch/kernel/env.c b/arch/loongarch/kernel/env.c
index c0a5dc9aeae2..f4ae894f4219 100644
--- a/arch/loongarch/kernel/env.c
+++ b/arch/loongarch/kernel/env.c
@@ -109,6 +109,10 @@ static int __init boardinfo_init(void)
 	struct kobject *loongson_kobj;
 
 	loongson_kobj = kobject_create_and_add("loongson", firmware_kobj);
+	if (!loongson_kobj) {
+		pr_warn("loongson: Firmware registration failed.\n");
+		return -ENOMEM;
+	}
 
 	return sysfs_create_file(loongson_kobj, &boardinfo_attr.attr);
 }
-- 
2.48.1

