Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB3312C326F
	for <loongarch@lists.linux.dev>; Tue,  3 Jun 2025 05:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748928395; cv=none; b=n8ZdWUVDx0/rDrlXO2eHDP7jiOi/9Z754zosVX/5wZbFbEoBqKw9EyjhfAzg3IaMRprCz12Vap0usC2eDG7NsiR1kG6Ng7uBbQRvW1tHWDPvltpoaeKHBkudK1eJ0RVoDZXhPhvCskgAw1WN30U+Oi+ZI9c0V3HPmBNWpRcX5SY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748928395; c=relaxed/simple;
	bh=KfYvwiCmokBx/a1Rmyi2YE4MIW8rjmU9pulgR89dDM4=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=TUGEBo1Xkiiys0Rv3JLhRITkr9TpvNvxYCrs8mlPSOOxTrE8aep8Fvcdcsxg08dlzFhcXmpg44ejB53YoX9ZGfRBMadC5nGPRwISGHcSrl2bHCpZeV2W4Ak1qgtGDXKypxWFtp5AFG6I5CCaYM6aZ2CFxgKbAAuQrvtgfQt38O8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 4b1ef5f6403b11f0b29709d653e92f7d-20250603
X-CTIC-Tags:
	HR_CC_AS_FROM, HR_CC_COUNT, HR_CC_DOMAIN_COUNT, HR_CC_NO_NAME, HR_CTE_8B
	HR_CTT_TXT, HR_DATE_H, HR_DATE_WKD, HR_DATE_ZONE, HR_FROM_DIGIT_LEN
	HR_FROM_NAME, HR_SJ_LANG, HR_SJ_LEN, HR_SJ_LETTER, HR_SJ_NOR_SYM
	HR_SJ_PHRASE, HR_SJ_PHRASE_LEN, HR_SJ_PRE_RE, HR_SJ_WS, HR_TO_COUNT
	HR_TO_DOMAIN_COUNT, HR_TO_NAME, HR_TO_NO_NAME, IP_TRUSTED, SRC_TRUSTED
	DN_TRUSTED, SA_EXISTED, SN_EXISTED, SPF_NOPASS, DKIM_NOPASS
	DMARC_NOPASS
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:61a1d907-ff46-4547-82a4-06f4d0b6b1ac,IP:10,
	URL:0,TC:0,Content:0,EDM:0,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:-5
X-CID-INFO: VERSION:1.1.45,REQID:61a1d907-ff46-4547-82a4-06f4d0b6b1ac,IP:10,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:6493067,CLOUDID:53736bfd1726ad950de57c46108b6eb9,BulkI
	D:250603092025XIA4LIXU,BulkQuantity:2,Recheck:0,SF:17|19|24|38|44|64|66|78
	|80|81|82|83|102|841,TC:nil,Content:4|50,EDM:-3,IP:-2,URL:0,File:nil,RT:ni
	l,Bulk:40,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,B
	RR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_FAS,TF_CID_SPAM_FSD,TF_CID_SPAM_FSI,TF_CID_SPAM_SNR
X-UUID: 4b1ef5f6403b11f0b29709d653e92f7d-20250603
X-User: lijun01@kylinos.cn
Received: from [192.168.31.86] [(223.70.159.239)] by mailgw.kylinos.cn
	(envelope-from <lijun01@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1132898947; Tue, 03 Jun 2025 13:26:25 +0800
Message-ID: <c4f90f7e786a17c7f07ab6bc8cb0d1778945573e.camel@kylinos.cn>
Subject: Re: [PATCH] loongarch: kgdb: remove unnecessary init variable
From: lijun <lijun01@kylinos.cn>
To: Yanteng Si <si.yanteng@linux.dev>, chenhuacai@kernel.org,
 kernel@xen0n.name,  loongarch@lists.linux.dev
Cc: lijun01@kylinos.cn
In-Reply-To: <8bcf144a-398e-4d78-8848-624502e7a85d@linux.dev>
References: <20250530070902.410248-1-lijun01@kylinos.cn>
	 <8bcf144a-398e-4d78-8848-624502e7a85d@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 03 Jun 2025 10:55:51 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Evolution 3.36.1-2kord0k2.4.25.1 
Content-Transfer-Encoding: 8bit

it is not a wrong, just look clean.



--------------------------
> 在 5/30/25 3:09 PM, Li Jun 写道:
> > the get_step_address(regs, &addr) should assign a value
> > to 'error' before it is read.so the var don't need init
> > to 0.
> 
> So, is it wrong to initialize it to 0 now?
> 
> 
> Thanks,
> Yanteng
> > Signed-off-by: Li Jun <
> > lijun01@kylinos.cn
> > >
> > ---
> >   arch/loongarch/kernel/kgdb.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/arch/loongarch/kernel/kgdb.c
> > b/arch/loongarch/kernel/kgdb.c
> > index 7be5b4c0c900..df3c7a5565e9 100644
> > --- a/arch/loongarch/kernel/kgdb.c
> > +++ b/arch/loongarch/kernel/kgdb.c
> > @@ -379,7 +379,7 @@ static int get_step_address(struct pt_regs
> > *regs, unsigned long *next_addr)
> >   
> >   static int do_single_step(struct pt_regs *regs)
> >   {
> > -	int error = 0;
> > +	int error;
> >   	unsigned long addr = 0; /* Determine where the target
> > instruction will send us to */
> >   
> >   	error = get_step_address(regs, &addr);

