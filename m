Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51B17230BE3
	for <loongarch@lists.linux.dev>; Wed,  4 Jun 2025 02:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749005870; cv=none; b=UdAUvNlIxaw+K/e2bE5ePL+sp+vH7nd5Tmm/Xu9CkLxtodrgikjIrFVvhTz9O4+Eq1bsMhmw9xm8FWobODEEtPmHjSVHRMIe7K0MB4wRSGNv+coEPgc9C+w01+lxgKsvucU0Q5roQyPdXOlWJDlgwgBKXnnPq89VnT8tm9htDNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749005870; c=relaxed/simple;
	bh=IljnK1lwamDpANHDIpq3oT0jBy1hCWXKt0CcbszNWw8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=TkBVF2/34uZn8V3qUWR3KrRTzxVAmfDschZEE1qPUU/k2TaS8sAVlkSQVddfGlCxQsQ99rnq5LEMJprW2zuc9r2e1aeEP60TDP5hM5MOtNSWzjFwdnffqILttDgKdrSdMDBqdEKwg0Ws365HdpZg+bx4FfM0tr+/P+fgURCGtdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: abf6339440ef11f0b29709d653e92f7d-20250604
X-CTIC-Tags:
	HR_CC_AS_FROM, HR_CC_COUNT, HR_CC_DOMAIN_COUNT, HR_CC_NO_NAME, HR_CHARSET
	HR_CHARSET_NUM, HR_CTE_7B, HR_CTT_TXT, HR_DATE_H, HR_DATE_WKD
	HR_DATE_ZONE, HR_FROM_DIGIT_LEN, HR_FROM_NAME, HR_SJ_CHARSET, HR_SJ_LANG
	HR_SJ_LEN, HR_SJ_LETTER, HR_SJ_NOR_SYM, HR_SJ_PHRASE, HR_SJ_PHRASE_LEN
	HR_SJ_WS, HR_TO_COUNT, HR_TO_DOMAIN_COUNT, HR_TO_NAME, HR_TO_NO_NAME
	IP_TRUSTED, SRC_TRUSTED, DN_TRUSTED, SA_EXISTED, SN_EXISTED
	SPF_NOPASS, DKIM_NOPASS, DMARC_NOPASS, CIE_BAD, CIE_GOOD_SPF
	GTI_FG_BS, GTI_RG_INFO, GTI_C_BU, AMN_T1, AMN_GOOD
	AMN_C_TI, AMN_C_BU
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:8c53bbba-876d-440a-a049-7d7cd8311244,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:-5,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-INFO: VERSION:1.1.45,REQID:8c53bbba-876d-440a-a049-7d7cd8311244,IP:0,URL
	:0,TC:0,Content:0,EDM:0,RT:0,SF:-5,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:-5
X-CID-META: VersionHash:6493067,CLOUDID:4a14333a5cc6fb9c5eaacffbcb31d2fa,BulkI
	D:250604105739N3T5PDXO,BulkQuantity:0,Recheck:0,SF:17|19|38|66|78|81|82|83
	|102,TC:nil,Content:0|50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:n
	il,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC
	:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_FSD,TF_CID_SPAM_SNR,TF_CID_SPAM_FAS
X-UUID: abf6339440ef11f0b29709d653e92f7d-20250604
X-User: lijun01@kylinos.cn
Received: from [172.30.70.202] [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <lijun01@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1643032536; Wed, 04 Jun 2025 10:57:37 +0800
Message-ID: <dc09a2348981cd08bf4788bfce2f187960d5fc5e.camel@kylinos.cn>
Subject: =?gb2312?Q?Re=A3=BA=5BPATCH=5D?= loongarch: kgdb: remove
 unnecessary init variable
From: lijun <lijun01@kylinos.cn>
To: Yanteng Si <si.yanteng@linux.dev>, chenhuacai@kernel.org,
 kernel@xen0n.name,  loongarch@lists.linux.dev
Cc: lijun01@kylinos.cn
Date: Wed, 04 Jun 2025 10:57:28 +0800
In-Reply-To: <d18b3955-e57d-44df-b9da-5efd7f571d1a@linux.dev>
References: <20250530070902.410248-1-lijun01@kylinos.cn>
	 <8bcf144a-398e-4d78-8848-624502e7a85d@linux.dev>
	 <137e7f072eebeb319188ddaead471074db7ba792.camel@kylinos.cn>
	 <d18b3955-e57d-44df-b9da-5efd7f571d1a@linux.dev>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.1-2kord0k2.4.25.1 
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

The compiler generates initialization instructions, which consume
additional CPU cycles

--------------------------------------
Alright, as you said, just for the clean. First, you deleted
one line and added another, so the number of code lines remains
unchanged, and the original line of code wasn't complicated to
begin with. Second, your patch only deletes two characters,
and I don't think this will significantly improve the code's 
readability. Finally, creating a patch for this consumes the
limited energy of reviewers and maintainers (many of whom are
working outside of regular working hours), and a lot of CI
infrastructure will consume electricity to test your patch.
It's not that I'm against your patch; I just want to know
if it's worth it?

BTW, We don't accept the top reply.


Thanks,
Yanteng

