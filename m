Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E41238B
	for <loongarch@lists.linux.dev>; Tue,  3 Jun 2025 03:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748921450; cv=none; b=tOgfsiSKIretE0f+b4ik4CFY+IEvLzzZbJ8JhdeSNCGBxVxS9hkQzCMbFktBl/QxdEbnsdjo56FI/zijMMg1L5b2PfYY14NTkZud+RXkwXqX1tBq+DVH+Y06BW6QTyTbOcT62Gskaf8dJjS1p8M6nB4faA/XJScu2oDpToc5r3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748921450; c=relaxed/simple;
	bh=9RvN91ZBJbVuXK1tx/2BoNDTfZA5fsotY7gLVid5CgQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=tg+1aFHi+0gDSUMddNb7wP6+Ln+Wd/2LozikWJLE0JwOsrqyLGw/A7thH9QGjtz/+Tpn5dh8iS9qL0ulLhYNQvYqB2cigv3deo55VEpQlI1puT2YU0LknJzQB2aHv7H/72ggSnMtFUD8raHpjHqAdRa4NjEF/nlqwW1kJuDmfWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 1a00a1d2402b11f0b29709d653e92f7d-20250603
X-CTIC-Tags:
	HR_CC_AS_FROM, HR_CC_COUNT, HR_CC_DOMAIN_COUNT, HR_CC_NO_NAME, HR_CTE_8B
	HR_CTT_TXT, HR_DATE_H, HR_DATE_WKD, HR_DATE_ZONE, HR_FROM_DIGIT_LEN
	HR_FROM_NAME, HR_SJ_LANG, HR_SJ_LEN, HR_SJ_LETTER, HR_SJ_NOR_SYM
	HR_SJ_PHRASE, HR_SJ_PHRASE_LEN, HR_SJ_PRE_RE, HR_SJ_WS, HR_TO_COUNT
	HR_TO_DOMAIN_COUNT, HR_TO_NAME, HR_TO_NO_NAME, IP_TRUSTED, SRC_TRUSTED
	DN_TRUSTED, SA_EXISTED, SN_EXISTED, SPF_NOPASS, DKIM_NOPASS
	DMARC_NOPASS, CIE_BAD, CIE_GOOD_SPF, GTI_FG_BS, GTI_RG_INFO
	GTI_C_BU, AMN_T1, AMN_GOOD, AMN_C_TI, AMN_C_BU
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:52158414-8635-4248-bd76-b495af71260d,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:-5,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-INFO: VERSION:1.1.45,REQID:52158414-8635-4248-bd76-b495af71260d,IP:0,URL
	:0,TC:0,Content:0,EDM:0,RT:0,SF:-5,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:-5
X-CID-META: VersionHash:6493067,CLOUDID:e1983213bf323ebc7f7ee17f49441f6b,BulkI
	D:250603092025XIA4LIXU,BulkQuantity:1,Recheck:0,SF:17|19|38|64|66|78|80|81
	|82|83|102|841,TC:nil,Content:4|50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bul
	k:40,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,
	BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_FAS,TF_CID_SPAM_FSD
X-UUID: 1a00a1d2402b11f0b29709d653e92f7d-20250603
X-User: lijun01@kylinos.cn
Received: from [172.30.70.202] [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <lijun01@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 2069535449; Tue, 03 Jun 2025 11:30:31 +0800
Message-ID: <137e7f072eebeb319188ddaead471074db7ba792.camel@kylinos.cn>
Subject: Re: [PATCH] loongarch: kgdb: remove unnecessary init variable
From: lijun <lijun01@kylinos.cn>
To: Yanteng Si <si.yanteng@linux.dev>, chenhuacai@kernel.org,
 kernel@xen0n.name,  loongarch@lists.linux.dev
Cc: lijun01@kylinos.cn
Date: Tue, 03 Jun 2025 11:30:24 +0800
In-Reply-To: <8bcf144a-398e-4d78-8848-624502e7a85d@linux.dev>
References: <20250530070902.410248-1-lijun01@kylinos.cn>
	 <8bcf144a-398e-4d78-8848-624502e7a85d@linux.dev>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.1-2kord0k2.4.25.1 
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
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
> > 
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

