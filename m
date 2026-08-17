Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CBE83FA5E7
	for <loongarch@lists.linux.dev>; Mon, 17 Aug 2026 14:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786975720; cv=none; b=KUFNUSm9UzMQ/Sh4XZOdwXLgcWEJZFslzDvnTF7KmChdepW3kCbpCMJqZ53yyXtIva/gnlYDUYxLKjkkb4Vyok6T6JHU6edD1mAabPdZLb4GAaDyg6evlss+TkP3KHyd17akrG3sHg/WfCqWYkjCYgqCYp2QppkDbq21LkEOsWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786975720; c=relaxed/simple;
	bh=staMQ8i21aT2qMLa/ScVjoos+mmOTXL1+Zprb3aTHN0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P9pWJFQJK3e8/Gtu0SIeMPZr3aHDjIhoNgO5ka07OlCmSxA9DJbY9Z7wpn4nodZ1+z9FQSBS/cVHC99fBm61pQcB0xFLRRipd5fJJ8xw4jHAN3FrCh8NotFmPSWLadNi1tbXNFXpGFh40QkqbONCR4jkTk5in+vNcAOdARouN1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QgYlvCG7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HWF2TvWS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QgYlvCG7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HWF2TvWS"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67HD5ntl2238624
	for <loongarch@lists.linux.dev>; Mon, 17 Aug 2026 14:08:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=w73H4Wybt7wskLAo+yX+hGB0
	G0F78nZdnr+eiPJjGEk=; b=QgYlvCG77oGFmR4vVaqFYH/eiCpR963MafF/bOUm
	04BXHqtg/a5OQatFvxFIdmmlEqlipC1WKdAZ5iudgpTVdGX1p9flt5QMxjuCo5Qq
	dV8XMQo4cwSkBMF+lux6buXG/6QcfEsD5Lf2etMo48byMhPgSR16Es8ZeQp8Pk+C
	gTdp3jhKUaKvQIMEZEtiHDDw/ziUzjIhd8d+iI1zCPc+CdoI5G7zUgeqMtwmzwMO
	hbEVNpk7Rpe9BF4c6wqKAUS0rm6+HKN5PNYFJMFlVXdlito84jeMei35Gd3kuaup
	KGfx2rqMeAZgiWmvskKTFxifbEHAHFPZnn6VwWe6hKjsmw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g3xyk98sv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <loongarch@lists.linux.dev>; Mon, 17 Aug 2026 14:08:37 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92efd2ca21aso597127785a.0
        for <loongarch@lists.linux.dev>; Mon, 17 Aug 2026 07:08:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786975717; x=1787580517; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=w73H4Wybt7wskLAo+yX+hGB0G0F78nZdnr+eiPJjGEk=;
        b=HWF2TvWSX4nWNvf1tMZS00FbLI5f8bQA9ZCyUo1h4+YibKM4gUqNo1RK7lYZMrXIu/
         UFVe0bhO+Rb2AgE48erNzJDCGDRSsRa4qRJPN9LkKs0uAbWrkrNOzt9SfaF2FPDt6gow
         8dSBGe/Mx8NTXWf8fxH8Jh5aJm1BLnH+5no1/nOeTze56x+Twmtt4Whvew/a49hT7Gte
         PFa/sB9F4gzm4dOdWthMCYxPNo9Ls3MHwRpl2Jc0y8ETfRlXST0/DANNyzfQTJy0eK7w
         lJAfVg6dvKswxhWDndzMIcllKBow5RYC/G6VJE3g2EHTgsBQZ9ENiCeyuvQmUV/tDSsp
         gdkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786975717; x=1787580517;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w73H4Wybt7wskLAo+yX+hGB0G0F78nZdnr+eiPJjGEk=;
        b=PlEoonllHD2fOJPQDlWuPUWERbfnMnoUqoiHVtwBGgpvIORn+OVnkej2bcqiurmo1O
         aJhXy0M10q9Mk2bicO7Dx054+UZfZE9rjVByinWsExm0fG2JgsX6JnzeKf86NAZVqhkH
         BwGbP+H9Yp+qwAif8qkYEIa1QRo/VMPPnOaFFVwDojAfD1kehiY1BctCTjqRSWYVoxuf
         gK/oV+8L+SPWOLtVVWs3Kdqjy8Y2JtpDWZN3KWqWWhks0jFeLEffrDgSiLZouGTm9oQd
         VPjlknCw1u5BlSfX/0aa5urh94Bdz1xekTgKIBKeMLSUgiAfOaV9wR/y3UjlOgWdFMkX
         5cfg==
X-Forwarded-Encrypted: i=1; AHgh+Rryr6paYLupC7NU1s2CUvUyBMrm2NgWV2gm3NAGzgmgAYpfOwcYNB2ARD1TCSUGmN5P9QHczDXZOXc=@lists.linux.dev
X-Gm-Message-State: AOJu0YyB8lEUeuGsxQSW6yGedCDXKxHIfyGmL5xzv36nqVHRz95Uyujf
	rWPF13z9+YpbCQdfadi13Pc20cGBflLl0nlLZ5DhIf/IIsuwmEVsvVsIVm69Hm0UZFtSdwQDTKt
	xpt1ZQAGEgWBFSMlc5xg9k6xvalMMEsndSoZWqVJuJcC/uevBH6dlfyKdyNJRAPY=
X-Gm-Gg: AR+sD109PFQlDfPAT/PZZA2a5ssVWTGV6BIjmD++odwZfqB9o0cfXKCpAysPZDgtxtw
	DIzuolQyl9+NPCLc6JXkLEDyBsFdeFllBaKCDjDgjqem3wgWxX+qhQg4VMpRB6lYBGMQcl0Zhyx
	iz17rh/hO0Tctrr6AZoXPIN7JyNNDx4TudKIc4c2/Yzix4s/Yuanhce66YqqRh9nFDwbOjz26US
	cdljvhwyNzAQIrsouPq+CGZnv+waHJm++nSSyIGXO8cUrzKOnpVIDiFn2t6BilTzzOYlUliwhLp
	VV9zF3BpVWThBI5bhsBUULluKEfOZKpYKIbpAtcf1DeQ3pf0sUp8v2XKoyQ+23cSK34yEGOt70k
	WKXOLhQVlCFbYnu568TxT6PfW9NBaNDYnVoOTPISmfikIvHkS2D00kYTkVoe6dDQufLJVBHqi6t
	8=
X-Received: by 2002:a05:620a:231a:10b0:923:8612:f15 with SMTP id af79cd13be357-936d2025d63mr2020381485a.18.1786975715671;
        Mon, 17 Aug 2026 07:08:35 -0700 (PDT)
X-Received: by 2002:a05:620a:231a:10b0:923:8612:f15 with SMTP id af79cd13be357-936d2025d63mr2020345785a.18.1786975713522;
        Mon, 17 Aug 2026 07:08:33 -0700 (PDT)
Received: from leviathan ([2a0d:3344:316:5100:f22f:74ff:fe21:6f68])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482a5a31543sm5005404f8f.4.2026.08.17.07.08.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 07:08:32 -0700 (PDT)
Date: Mon, 17 Aug 2026 15:08:29 +0100
From: Leif Lindholm <leif.lindholm@oss.qualcomm.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: linux-efi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
        loongarch@lists.linux.dev
Subject: Re: [PATCH 2/3] efi: Pass EFI boot memmap struct address to core
 kernel
Message-ID: <aoMV3TX0hgTsj3_m@leviathan>
References: <20260813074506.643472-5-ardb@kernel.org>
 <20260813074506.643472-7-ardb@kernel.org>
 <an8xTBiCy_PEuwZi@leviathan>
 <a0d10b63-bf9a-4ad7-a9d8-ab748a9c0c2c@app.fastmail.com>
 <aoLR9BPGt4Kzbr3y@leviathan>
 <92baff04-d30b-4174-b5f5-87b24e6a1cc0@app.fastmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <92baff04-d30b-4174-b5f5-87b24e6a1cc0@app.fastmail.com>
X-Proofpoint-GUID: SaeyG9hzLVA9gJMqo5wGuULT9AvAdV4m
X-Proofpoint-ORIG-GUID: SaeyG9hzLVA9gJMqo5wGuULT9AvAdV4m
X-Authority-Analysis: v=2.4 cv=dLaWXuZb c=1 sm=1 tr=0 ts=6a8315e5 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=otMJZyyn8YdxdvHBrc4A:9
 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDEwOCBTYWx0ZWRfX1jtUudl8YR3E
 5uyfeM63Talao+JDr4BargWpftv4XDvJcqql71wW4F5U+YudF8MMmhah3pU186Vjdc4EfXijCNr
 YuYOxegexACtO0iiLDoE8NopLBKQI6daNTMJw02cFz41uuvAHmrKEzWXCSx/3pLU1hEQeS1R/qd
 PyhCal7oRQqVxdHK7MkyVhLv2tSmC6kkqSKzCQdaB4RKotr/EGY39C04H7WmIt1WW/w+SKlcicA
 V3BFNQfzBOArS9jypuRkDti2+2gBe0Iu9EID2AoQMrEEpezRi91NA/00kgtoh6fOgsaxq0KJhqY
 6tZSt5OnTI0b4SM0ZMP4ePJXzG/7tzwYobM7XUPyMR5PcGm4q2mCpUHUBNl6fBeH3DnY34Pns9h
 SdvYcNh/wnnnGmZY33At3NeI8mihlnpApdPYau9AyBOji1siDjbDx+jIxSHa5UojNb5Rb35DvFL
 ADPXiB8xcyW2tJsw60g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDEwOCBTYWx0ZWRfXxhzQbPC2J/Ar
 BSda6fd9VQvBI4Y66ShCFSfpqSHBb3aae18Lsqm8qNotRBkTfWmG7R4CkeOhmdOR1Yw/D4b59p/
 bAR8yJZ3rkw9V+LOfMDgywdzShvmhkw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_01,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608170108

On Mon, Aug 17, 2026 at 14:00:16 +0300, Ard Biesheuvel wrote:
> >> > Is it time to update the boot ABI to say x0 will hold the physical
> >> > address of "device tree blob (dtb) or EFI System Table in system RAM"?
> >> > They can be distinguished by 0xd00dfeed / "IBI SYST".
> >> 
> >> Let's avoid 'boot ABI' here, given that we are talking about an internal
> >> interface between the EFI stub and the kernel proper.
> >
> > It's an internal business in the topic under discussion, but if we
> > were to change it, that would mean updating booting.rst, which I
> > consider an ABI.
> >
> 
> But not an external ABI. It documents specifically how the EFI stub
> interfaces with the kernel proper. This might change at any point,
> without any obligation whatsoever to remain compatible with the
> previous method.

So you're saying if the kernel proper decides to use x1 for something
else, we'll move to x2?

I agree that in the context of how the stub calls the kernel proper,
this is not ABI, but x1 is one of the registers currently marked as
"reserved for future use" in booting.rst. So it feels weird for me to
allocate one of those registers for this internal use then not mention
it.

In that case, couldn't we instead pick a register outside of the
reserved ones?

> ...
> >> > Minor bikeshedding below.
> >> >
> >> >> @@ -123,8 +134,24 @@ u64 __init efi_get_fdt_params(struct efi_memory_map_data *mm)
> >> >>  			pr_err("Can't find property '%s' in DT!\n", pname);
> >> >>  			return 0;
> >> >>  		}
> >> >> -		if (dt_params[i].paravirt)
> >> >> +		if (IS_ENABLED(CONFIG_XEN) && dt_params[i].paravirt) {
> >> >>  			set_bit(EFI_PARAVIRT, &efi.flags);
> >> >> +		} else {
> >> >
> >> > This condition branch doesn't in fact have anything to do with the fdt.
> >> > Should it still live in fdtparams.c?
> >> >
> >> 
> >> I don't follow. The EFI_PARAVIRT flag is set based on whether we are 
> >> using the generic or the Xen-specific set of DT properties. What would
> >> be a better place to decide this?
> >
> > Apologies, I may have commented confusingly - my comment was about the
> > else branch:
> >
> > +
> > +                       bm = early_memremap_ro(memmap, sizeof(*bm));
> > +                       if (!bm) {
> > +                               pr_err("Cannot remap EFI boot memory map\n");
> > +                               return 0;
> > +                       }
> > +
> > +                       mm->phys_map            = memmap + sizeof(*bm);
> > +                       mm->size                = bm->map_size;
> > +                       mm->desc_size           = bm->desc_size;
> > +                       mm->desc_version        = bm->desc_ver;
> > +
> > +                       early_memunmap(bm, sizeof(*bm));
> >
> > So to restate - this function is called from efi_init():
> > ---
> >         /* Grab UEFI information placed in FDT by stub */
> >         efi_system_table = efi_get_fdt_params(&data);
> >         if (!efi_system_table)
> >                 return;
> > ---
> >
> > Before this set, this function called get_fdt_params() indeed gets
> > "params" from a device tree. After this set, this function gets params
> > from a device tree in some instances, and not in others.
> > Which feels suboptimal.
> >
> > We could rename the function, but then there's still DT-unrelated
> > code held in fdtparams.c.
> >
> > If we go down the route of passing the system table in x1 on boot,
> > then I guess the effect of assigning efi_system_table will already be
> > broken out. But should we then split the mm struct initialisation into
> > separate DT and config table helper functions?
> >
> 
> Not disagreeing but I think it is fine to leave it as I suggested at this
> point.
> 
> Some additional work is needed to get rid of linux,uefi-boot-memmap
> entirely, and until that happens, passing the EFI system table via
> X1 and linux,uefi-boot-memmap via DT is not a huge improvement.
> 
> linux,uefi-boot-memmap is needed when SetVirtualAddressMap() is called
> [with a non-1:1 mapping], as the EFI system table contains a remapped
> address of the config table array in that case.

Of course, the devil on my shoulder suggests the stub could always
add an address fixup handler for the config table too...

> There are currently two remaining reasons why calling
> SetVirtualAddressMap() is required:
> - some Ampere boxes crash otherwise (but these systems tolerate SVAM
> being called with a 1:1 mapping)
> - kernel configs with a VA space < 48 bits are not guaranteed to be
> able to map the EFI runtime services 1:1, so there, SVAM is still
> needed as well.
> 
> Both can be fixed, and I have been meaning to address the latter by
> always making the EFI runtime map (which is essentially a 1:1 map)
> use 48 bits of VA in all configs. (The ID map already does the same)
> 
> Then, the former can be addressed by installing a 1:1 mapping when
> calling SVAM.
> 
> That would remove the need entirely to ever call SVAM() on arm64,
> and therefore the need to pass the address of the EFI memory map
> separately.

Makes sense.

/
    Leif
