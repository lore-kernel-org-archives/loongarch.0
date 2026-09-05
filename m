Received: from mail.srv.csmantle.top (mail.srv.csmantle.top [77.93.157.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35FB72B2D7;
	Sat,  5 Sep 2026 04:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.93.157.103
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788584327; cv=none; b=OffUOEpGOk1MBvfbMKAP5+pvZkvdzJHs40mnQMHLdEPe0pFE/8LOuW7hmoUTz0964/J1Inb1Jzbjw1afS+varOhFXsXXEyNo+fXSbH8DRaVTZGMw1vBU3sT/q6p4YrTYnB450c0EBSco+QhgrG1wCIQBz58Kro9JRO+hbiBNDqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788584327; c=relaxed/simple;
	bh=pe/Lf0PXrbKmjngMOxU1mql1O49yjS/j/qe2h0AqvGY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m96vdQJvcsskbepPpi0aZZ4kw+cKwXlshm7ice2TY4Co5skJaMIuuwfrIdNzLySgflpCR9tXh8G+oQykKfR6kGh/uFMaakFWX6BntxYky8bd4Xf3hHKToNuIf0Lo5MeTBcJitiZRsNHcFiEkAzRt92OH4PTh/A67MZMXN8LhtIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csmantle.top; spf=pass smtp.mailfrom=csmantle.top; dkim=permerror (0-bit key) header.d=csmantle.top header.i=@csmantle.top header.b=ldpfHgfk; dkim=pass (3072-bit key) header.d=csmantle.top header.i=@csmantle.top header.b=qbOZ3GGS; arc=none smtp.client-ip=77.93.157.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csmantle.top
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csmantle.top
Authentication-Results: smtp.subspace.kernel.org;
	dkim=permerror (0-bit key) header.d=csmantle.top header.i=@csmantle.top header.b="ldpfHgfk";
	dkim=pass (3072-bit key) header.d=csmantle.top header.i=@csmantle.top header.b="qbOZ3GGS"
DKIM-Signature: v=1; a=ed25519-sha256; q=dns/txt; c=relaxed/relaxed;
	d=csmantle.top; s=self-ed25519; h=BIMI-Selector:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:In-Reply-To:
	References:BIMI-Selector; bh=FSaB5xDtXQyzU08ZMhYPOoJuvqh5Lgns8wSEoK5Xpwk=;
	t=1788584326; x=1789189126; b=ldpfHgfkcyluR+FoMLt3f0k822uhz46Nm0KTqXquA8dyVfG
	kopbh/5G1AlrSf5B1JPopVeZB9keu7fqS/6AjAA==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=csmantle.top; s=self-rsa3072; h=BIMI-Selector:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:In-Reply-To:
	References:BIMI-Selector; bh=FSaB5xDtXQyzU08ZMhYPOoJuvqh5Lgns8wSEoK5Xpwk=;
	t=1788584326; x=1789189126; b=qbOZ3GGSUqZ2E7nJhOioQnoYkxv67PGUw75dmeAerTr6VNL
	85ccmTIxeujGD6CPRzqXWHruel8AUc3/lTVgjosU0jVX99PJDEdR6aPuRA0uRUQxuvbqSk2VpdN1L
	88nXoSBKI1/KWViC/St3gzZ0Xiv7aTP+ctqpRkbmsp3+o/fNSBpscNt/zYCX3r63VkQ0xLsJLaEc4
	yXERw2sranNyLYuV45bNryvrCJioFe14vKsrilFMUAdoh0u9meX56DsIO5xthn5ITwgUQNt003eEI
	Fs3QCcDk02zSIDN3n1Gz8dtu2KjCxVGG0zJhjv7lXEb4Ggc2RpXF5B/KStPo3Horv3dm7Z0UBiGjE
	m4gjr2q8wHzJtEX+H0FNqne5Sfr1sXZRDFsbcB29bgjphaHhGB+Mkx5e/Ecn16Vsqv0D78YMaqdXm
	u/uvVjRxB1g4ZLisu4iiT/roox24i/vM7EjPRw/uDMEc3A8U+d5qANJh+kcowJdk0cdDGigGzXgeh
	dlM;
Received: from [103.167.64.98] (helo=[IPV6:240e:390:1a0c:f1d0:c9e9:1415:404c:c6a9])
	by mail.srv.csmantle.top with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.98.2)
	(envelope-from <rong.bao@csmantle.top>)
	id 1x2iTu-00000000EcG-3DwA;
	Sat, 05 Sep 2026 12:58:23 +0800
Message-ID: <7d309743-8e87-47a7-b2df-515e424db724@csmantle.top>
Date: Sat, 5 Sep 2026 12:58:19 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH] loongarch: expose LAMCAS existence via cpuinfo and hwcap
To: Huacai Chen <chenhuacai@kernel.org>
Cc: WANG Xuerui <kernel@xen0n.name>, Hengqi Chen <hengqi.chen@gmail.com>,
 Tiezhu Yang <yangtiezhu@loongson.cn>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Arnd Bergmann <arnd@arndb.de>, George Guo <dongtai.guo@linux.dev>,
 Yangyang Lian <lianyangyang@kylinos.cn>, Kexy Biscuit <kexybiscuit@aosc.io>,
 Mingcong Bai <jeffbai@aosc.io>, Rong Bao <baorong2005@126.com>,
 Yawei Li <liyawei@loongson.cn>, loongarch@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20260905032010.4962-1-rong.bao@csmantle.top>
 <CAAhV-H7nyh5bU1uHRY9HdMyz44VEPov3oa4rFCGu=Y-HSoVPZQ@mail.gmail.com>
Content-Language: en-US
From: Rong Bao <rong.bao@csmantle.top>
In-Reply-To: <CAAhV-H7nyh5bU1uHRY9HdMyz44VEPov3oa4rFCGu=Y-HSoVPZQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rcpt-Check: Accepted by authentication
X-42: Don't panic! 
BIMI-Selector: v=BIMI1; s=me

Hi Huacai,


On 2026-09-05 12:46, Huacai Chen wrote:
> [...]
>>          Features                : cpucfg lam lam_bh scq ual fpu lsx lasx
>>          crc32 complex crypto lspw lvz lbt_x86 lbt_arm lbt_mips
>>          Hardware Watchpoint     : yes, iwatch count: 8, dwatch count: 4
>>
>> ... while the CPUCFG 2 instruction reads "0x7e7ccfcf", whose bit 28 is 1,
>> indicating the actual presence of LAMCAS.
> Can we use LAM_CAS in the code, which is similar to LAM_BH?


I originally chose "LAMCAS" and not "LAM_CAS" deliberately to match the 
manual spelling. For example, in "LoongArch Reference Manual, Volume 1 
(version 1.10)"[^0], Table 3 reads as follows:

 > 27	LAM_BH	1 indicates support AM{SWAP/ADD}[_DB].{B/H}.
 > 28	LAMCAS	1 indicates support AMCAS[_DB].{B/H/W/D}.

Also, in "Toolchain Conventions of the LoongArch(tm) Architecture, 
Version 1.2"[^1], these two extensions are also stylized with different 
hyphenation:

 > -mlam-bh	-m[no-]lam-bh	Enable atomic operations 
am{swap/add}[_db].{b/h}.	LoongArch V1.1
 > -mlamcas	-m[no-]lamcas	Enable atomic compare-and-swap instructions 
amcas[_db].{b/h/w/d}.	LoongArch V1.1

So I think the name "LAMCAS" maintains the consistency with existing 
specifications and literature better than "LAM_CAS".

> [...] And please use LoongArch in the subject.


Sure. I will fix this in v2.


[^0]: 
https://loongson.github.io/LoongArch-Documentation/LoongArch-Vol1-EN.html#the-configuration-information-accessible-by-the-cpucfg-instruction
[^1]: 
https://github.com/loongson/la-toolchain-conventions/blob/36d207cd76301618624d10e67daf7b7f1c060411/LoongArch-toolchain-conventions-EN.adoc?plain=1#L176-L184

-- 
Regards,
Rong Bao
