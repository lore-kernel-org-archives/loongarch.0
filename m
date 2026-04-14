Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C77B82899
	for <loongarch@lists.linux.dev>; Tue, 14 Apr 2026 02:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776134830; cv=none; b=n0g9zDCLPIGt8hGosDxE7vFRFB1qLDPd3BErXwn4nT67G05U4fZq8Bwd9GNntoa0vFRrAumFDMtfgkkHLUESFwBAoQxp2eXKn429n096++AzY4Cpd8XRk+BnkS3ALPyMWz6Zm4iGILLeMSJwIFj0YOt25gEHOMq8Gf1OfPhECZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776134830; c=relaxed/simple;
	bh=+8zPNqcN3YBQMaFLHoUKRyNS/BJvpu2lOre3IxoydNA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=H9ALy10ucLQxG5ljS0z+11S6BFmCsFuGx8SZ7T50+yCNhAJdBFbby56BuDRu+MGa6Vf6uQe8nwVwKIHkCBAmQwluez9MZOj3ptLZhpEceFNEDerjC78ggQ4mQbNxlwAnf14dtIDzBQTUp7hlDm4pikrFpZBnNEFPXx208QE82QQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 3577c7f037ac11f1aa26b74ffac11d73-20260414
X-CTIC-Tags:
	HR_CC_COUNT, HR_CC_DOMAIN_COUNT, HR_CC_NO_NAME, HR_CTE_8B, HR_CTT_TXT
	HR_DATE_H, HR_DATE_WKD, HR_DATE_ZONE, HR_FROM_NAME, HR_SJ_LANG
	HR_SJ_LEN, HR_SJ_LETTER, HR_SJ_NOR_SYM, HR_SJ_PHRASE, HR_SJ_PHRASE_LEN
	HR_SJ_PRE_RE, HR_SJ_WS, HR_TO_COUNT, HR_TO_DOMAIN_COUNT, HR_TO_NO_NAME
	IP_TRUSTED, SRC_TRUSTED, DN_TRUSTED, SA_EXISTED, SN_EXISTED
	SPF_NOPASS, DKIM_NOPASS, DMARC_NOPASS, CIE_BAD, CIE_GOOD
	CIE_GOOD_SPF, GTI_FG_BS, GTI_RG_INFO, GTI_C_BU, AMN_GOOD
	ABX_MISS_RDNS
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:7bc386f6-533f-42e7-97ec-b2a08df466f7,IP:20,
	URL:0,TC:0,Content:0,EDM:25,RT:0,SF:-5,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:40
X-CID-INFO: VERSION:1.3.12,REQID:7bc386f6-533f-42e7-97ec-b2a08df466f7,IP:20,UR
	L:0,TC:0,Content:0,EDM:25,RT:0,SF:-5,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:40
X-CID-META: VersionHash:e7bac3a,CLOUDID:098355b903f51cc116d49be131cd188e,BulkI
	D:2604141034401UO5DLWB,BulkQuantity:1,Recheck:0,SF:17|19|66|78|81|82|83|10
	2|127|841|898,TC:nil,Content:0|15|50,EDM:5,IP:-2,URL:0,File:nil,RT:nil,Bul
	k:40,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,
	BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_FAS,TF_CID_SPAM_FSD,TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 3577c7f037ac11f1aa26b74ffac11d73-20260414
X-User: cuitao@kylinos.cn
Received: from ctao-book.. [(183.242.174.20)] by mailgw.kylinos.cn
	(envelope-from <cuitao@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 317174353; Tue, 14 Apr 2026 10:46:59 +0800
From: cuitao <cuitao@kylinos.cn>
To: maobibo@loongson.cn
Cc: chenhuacai@kernel.org,
	cuitao@kylinos.cn,
	kernel@xen0n.name,
	loongarch@lists.linux.dev,
	zhaotianrui@loongson.cn
Subject: Re: [PATCH] LoongArch: KVM: Fix data race in kvm_ipi_regs_access
Date: Tue, 14 Apr 2026 10:46:09 +0800
Message-ID: <20260414024610.308114-1-cuitao@kylinos.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <ce3d170a-56a4-9343-49fa-2d8b3cbc9ebe@loongson.cn>
References: <ce3d170a-56a4-9343-49fa-2d8b3cbc9ebe@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

I didn't think it through carefully enough. Thank you.

Best regards,
cuitao
