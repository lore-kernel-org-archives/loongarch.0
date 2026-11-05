Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.223
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793883571;
	b=lsX0a+7STYTbCZGSnQC+MV60Ur429ZQFInAFGkJxhu5g00xY33ERyuj8YYzySFAArUSa
	 foWiCnyyktAYXDctlKBZ/YlYV5W5ldMIqiogwFvCPEVo0f3GkpPG4O8fdmv4gDXEj3q7D
	 yWPs4JEn0Uo19kycrhHSplmhEo25WxyYyo97XGumC3N9KAS6HMnyvBBd7khrwUmty0uzW
	 Wy8yulTHKj2jqJ8n+CCYhukX02/bBEQ6wPYqtsGD9wn1U+n2HD/FhVoWleGRFiivAzaMW
	 oWlc/k+vBUXBT9tzekfNomAmo31nXCjo5feQ2Jtk52Y6oOuBkk0LeniJRQbTIIldtGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793883571;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=+E22eGQ2MJjCILPPn9RP6s1QVwt1VQHo3HCnxy0O66A=;
	b=gFw9j0MnvwKWGm2EFYG8kuI6eIX75rx5t/7lFelvzA2tTiRJ2R4462ArMKMgb8ViNd+5
	 J/9Z4ZTVpcagnmupocTD3kDQNtXSi1XpSNiAj+0S3FHizJNgxQ0IdmzDdjLzTfbjA89V0
	 EarwhB8CpQuFfcn38V+Fys4km7R4ujCqkgxO2LX5gNeigAs7Q+9dRZnqKl2xURP/4dtfs
	 YSAD/kHjeUwH3U5xKinAe4seefcd2hYmw9STwHJ9+wRauc+VTfqvZAyyyXqUDYNb7m/Qs
	 RRUDkiMSnTFtmy078Notz/NSxeeMzB/IhRzzEBNLAVlWgYTzHcu0rjtbR7k7E5k+Rjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=cS7ul+wi;
	arc=none smtp.remote-ip=113.46.200.223
Received: from canpmsgout08.his.huawei.com (canpmsgout08.his.huawei.com [113.46.200.223])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAD8B606A32D
	for <loongarch@lists.linux.dev>; Thu,  5 Nov 2026 12:59:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BAD8B606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=cS7ul+wi
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=+E22eGQ2MJjCILPPn9RP6s1QVwt1VQHo3HCnxy0O66A=;
	b=cS7ul+wikj1KUf5rkKa9MyhHiH+s2IyoUyiP3zfHwGpPZvSjuxGmIlG1V83ZLRyMoquvSCW/Q
	EBHGUFzgMAtkI1p3cogsaEq9/V4qlMyLiBOzbqv9LOoKDbF9fWMFWLKnOjz+nybHE7ms9vpcoZb
	4mnnLjDnA+Tp+92Uc+YBlQ0=
Received: from mail.maildlp.com (unknown [172.19.163.163])
	by canpmsgout08.his.huawei.com (SkyGuard) with ESMTPS id 4jL2Sb68VbzmVBV;
	Thu,  5 Nov 2026 20:59:11 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 4BCF44057A;
	Thu,  5 Nov 2026 20:59:23 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 5 Nov
 2026 20:59:22 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <chenhuacai@kernel.org>, <kernel@xen0n.name>, <rppt@kernel.org>,
	<tangyouling@kylinos.cn>, <baoquan.he@linux.dev>,
	<loongarch@lists.linux.dev>, <linux-kernel@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v8] LoongArch: kexec_file: Fix elf_headers memory leak in retry loop
Date: Thu, 5 Nov 2026 20:59:06 +0800
Message-ID: <20261105125906.2284169-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
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
Content-Type: text/plain
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemk200008.china.huawei.com (7.202.194.74)

A retry allocates new elf headers and overwrites image->elf_headers,
leaking the previous buffer.

Free it before assigning.

Cc: Huacai Chen <chenhuacai@kernel.org>
Cc: WANG Xuerui <kernel@xen0n.name>
Cc: Youling Tang <tangyouling@kylinos.cn>
Cc: Mike Rapoport (Microsoft) <rppt@kernel.org>
Cc: Sourabh Jain <sourabhjain@linux.ibm.com>
Cc: Kees Cook <kees@kernel.org>
Cc: stable@vger.kernel.org
Link: https://sashiko.dev/#/patchset/20260729031235.2840255-1-ruanjinjie%40huawei.com
Fixes: 55d990f0084c ("LoongArch: Add EFI binary support for kexec_file")
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
v7 -> v8:
- Split out from the patch set as Mike suggested.
- Link to v7: https://lore.kernel.org/all/20261026075201.699550-1-ruanjinjie@huawei.com/
---
 arch/loongarch/kernel/machine_kexec_file.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/loongarch/kernel/machine_kexec_file.c b/arch/loongarch/kernel/machine_kexec_file.c
index 5412aa9f3568..0fe60907b97f 100644
--- a/arch/loongarch/kernel/machine_kexec_file.c
+++ b/arch/loongarch/kernel/machine_kexec_file.c
@@ -166,6 +166,10 @@ int load_other_segments(struct kimage *image,
 			vfree(headers);
 			goto out_err;
 		}
+
+		if (unlikely(image->elf_headers))
+			vfree(image->elf_headers);
+
 		image->elf_headers = headers;
 		image->elf_load_addr = kbuf.mem;
 		image->elf_headers_sz = headers_sz;
-- 
2.34.1

