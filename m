Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C18843ACA4B
	for <loongarch@lists.linux.dev>; Mon, 17 Aug 2026 09:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786958332; cv=none; b=V1qK8w9DgGUuRnxcUcKY+cuIvOZImtlQgI2lOQXJ3c3Fbhiv6XDILxHM1DsRqsI2UyR4qL8R6riksIXC41Sbb5BQLYO/DmLi9gH56EgkCsEpEC+k0z+s0YW+Gf2U7EkthtYcS/gkzGLF2VjEBEIfnsBFfyH9+Af/ZsM/Qf26Usc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786958332; c=relaxed/simple;
	bh=h96GbcJ+H2KiMkqz0n7zgVQYhpM7HYbdC/QaxS6PAjA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fjENx8FClYNCqMq1moDxO8QyWnif0mZFuc2zsH/M3CpAihp32/Gw7p+w1Tu+Y6VmfnsNZ5hlTpF5TQQGQFq0S/GRxvHztMBLJPbOpix7znVdeE9Dfs0GbsQAqd3fap5pq8aiNv32M2TfRGriIh+TCT06MoX9fSx3WKuSxniMwiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oRsMzJcR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bey7zeiL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oRsMzJcR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bey7zeiL"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67H8ceNp1632400
	for <loongarch@lists.linux.dev>; Mon, 17 Aug 2026 09:18:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=z/Re6YGkB/5+NfHRAlgNFlF6
	0vE4TkJcD1A6bUVVMlM=; b=oRsMzJcRJIrqyGSqbpQPaQbyEqlkYaQCNtdwFGF+
	GdB++fE8KnO1AVWprWX+sc+uxF0CNHcXfIPtHLd8mzMCMtjCHgtaraUhrV1uDwYP
	tEWvle6cEV5tn1ZRFGNVLi3y6h9wfI/SwZIZGzft30C0gsLAVxEhSNay3L2iOIhF
	k0qtiYcftyMyOLOo3WL4DsOvY14hvXIYCX85bw53/XPIH7wrdohhepHoDb7zsgjy
	phlUoGh5LW/WevwkenMKLhdmNI9zYYAqQtiSy9da2sTUP3RIdFK+hAU5SH/mOrfS
	ew1cu68JHzwB34Up/mdv5T2lHuh7XMEeR1Ip42GfLg95iw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g3xyk85un-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <loongarch@lists.linux.dev>; Mon, 17 Aug 2026 09:18:49 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c1d137a68so22998701cf.3
        for <loongarch@lists.linux.dev>; Mon, 17 Aug 2026 02:18:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786958328; x=1787563128; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=z/Re6YGkB/5+NfHRAlgNFlF60vE4TkJcD1A6bUVVMlM=;
        b=bey7zeiLdKZWIgVJ/CCSV+hdg2axdJaAymquCLVXLMetE64UM1V/OmX38grnl97QzZ
         XfrrKxNCnHGfvC5/O3CRAbXA/I8I2ePHIyL2oUHzxK8+k5OxqxCEi+mtvNI+22c+hvx2
         DPpwqNgQCfy5g1MAdWIG+4TCaLEainHEwhVBhwQVJemj+0EeY+wuntdJTOz1LbBBjKgf
         rJG5FzSyu95pdtUgmOkFF02KXmme9EK2MK5e4T5YRb1FFSTvXw2xpkAkAmrw/2hLWy+l
         YCmUd5Wb2C2lutcF68+GtCJm3GlWDoAibLWI/lRfCWrziI+fCxJMX2n6fKnK6zaHDOXM
         CXNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786958328; x=1787563128;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z/Re6YGkB/5+NfHRAlgNFlF60vE4TkJcD1A6bUVVMlM=;
        b=Tiq8knLEmdDYl5ThQZqzceh5uDR/JEIJ37M2VS5wzjfxpiNTuwyC4UkMgUHE5xXFu4
         ERgeRO5mIMzcTFQPrIOGgboFVIu1dTL9pQpiwm6Fu+aDHCgv6RNPlu6LZntf2hVrXz+H
         kedgspT1uNUxjlzQOzxKbTPQF+puxHE4CLiXqFCdpR5JH03OUYvOfjMGhlgO1Sv3nsbt
         cMAlKbq+T3ZJmusyubYwe2VGDSsMcXDkn8G7oAderP2lsPLd/6JkCctEeg0Ck3bzPzLu
         xAW1U/7/jKYsDRmz2d5Cenz2EcshJ9qPlkNLqjVcwoFjaIZWWDbkV/OnB87fgZQ3Inp1
         BrkA==
X-Forwarded-Encrypted: i=1; AHgh+Rraric7mDS8TKDPmFhehh5LWDkU1Y9lcxBlZ3TApJKKoZqcJpHdK6dsz7OJxyftv+ZQKq47mrWjJUM=@lists.linux.dev
X-Gm-Message-State: AOJu0YyyjLFyT3VfABk8Rhyw6X4UhSwhgtC1O49yvEEAq5xpo8WHipV/
	3iBu+405GuY0KKPn/TNi/boA04MhfW6+aT631RdYl7ma9bBFz1pSDSPTfP9REi9HnK/0RkfpuBR
	cYfD+mITa3XRHmj1B5Ynvts4fbRH/lphMRVNsKNxrDquQ73ldsW7RkVct22pot9Q=
X-Gm-Gg: AR+sD12NPpfoFbOjZ68c+FyvIlu13NCJW8Z4FRvoulrlz+v6M+dNpsyaoL67pNCU77K
	9TaL36Pc9L3r80fbDFsjTJdTxSmWlO4Rs27Iq9rbSjQPKEk4hXpz2b3FJXxJeIgadEW/mQTTJW3
	hbenBUgATi2M6vch9qfHZ7kWvJwfWU0u1zMO/FNulVJKk/XQI0a4bW7pqggAOeLr8dDKUG2462p
	yYo4u/Dp3485Qpw5W66lROxEUY8lp8mm9G+LI6dYZoVMkOk17w5BdD4EdbwQQ0fMt37AgNaSo/S
	Kd5r/Bz5CefijIQm3P9fAkYQw7QweiIK1wAYZgm8JanZ25NNNKGlHRUX8GNc1FIfB/Oc8symPp6
	FTkXNyDhKPUDsLBsMG4o46VtK1c4a+dUgoQCToBH/pYuFpV+rsJXYGusmxXz1IS0KrQCQ8OQ9QQ
	g=
X-Received: by 2002:a05:622a:5c14:b0:516:e249:e30f with SMTP id d75a77b69052e-52d8557d9b4mr267662071cf.42.1786958328448;
        Mon, 17 Aug 2026 02:18:48 -0700 (PDT)
X-Received: by 2002:a05:622a:5c14:b0:516:e249:e30f with SMTP id d75a77b69052e-52d8557d9b4mr267661831cf.42.1786958327989;
        Mon, 17 Aug 2026 02:18:47 -0700 (PDT)
Received: from leviathan ([2a0d:3344:316:5100:f22f:74ff:fe21:6f68])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4999d10be27sm32706235e9.14.2026.08.17.02.18.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 02:18:46 -0700 (PDT)
Date: Mon, 17 Aug 2026 10:18:44 +0100
From: Leif Lindholm <leif.lindholm@oss.qualcomm.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: linux-efi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
        loongarch@lists.linux.dev
Subject: Re: [PATCH 2/3] efi: Pass EFI boot memmap struct address to core
 kernel
Message-ID: <aoLR9BPGt4Kzbr3y@leviathan>
References: <20260813074506.643472-5-ardb@kernel.org>
 <20260813074506.643472-7-ardb@kernel.org>
 <an8xTBiCy_PEuwZi@leviathan>
 <a0d10b63-bf9a-4ad7-a9d8-ab748a9c0c2c@app.fastmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a0d10b63-bf9a-4ad7-a9d8-ab748a9c0c2c@app.fastmail.com>
X-Proofpoint-GUID: tBaXP_GYL17DVuNGI_Pz0xOE9e_51PjE
X-Proofpoint-ORIG-GUID: tBaXP_GYL17DVuNGI_Pz0xOE9e_51PjE
X-Authority-Analysis: v=2.4 cv=dLaWXuZb c=1 sm=1 tr=0 ts=6a82d1f9 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=TWCjO1UoqHXKrXYG5nYA:9
 a=4OldKtP1pka_piUj:21 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDA2OSBTYWx0ZWRfX9QmRd4ssjaRY
 iHA3AZST8fSyA4AJvumS0JJHmHDBYhhdudl2xkvcEUhEiTpjp49E/n74wzLE/vbj3NaoV4Q2rIX
 Ts77YXMQlTe/65BvHWs0LyJq+s0/6sMDje3CJi/P9uDDNo7WxEhFCeGXn4nalUYHoZdEK+b89Ym
 ExVXBWddRUIiMnAWNsGSI7UM4m15zSkwtfZc0C3C3Erjx1XBLSn85F2dBoBupG0mpKFLP3cGMt+
 gMZZ2obhlkvezExFtKVQU8I2+2KJbpuBpYguBs6eylbqvXdgh1mZVvEb3ss4NRU8Lox2hwSLXXU
 79j2hIUdCQxr1mmXg/ncoXsdWDBZSCkxpDkPa5IUut9Up281j4J73i7JH4uoK4fBFPNL/UDoeUj
 ScGozM0tQCpTIh4/p6EfDkI2HhdA0RDuG3AU2R42y7AG7dSwlJBW7MuuZXY7CTWVlHJZ0iCCYeP
 +JbXRbcrNXo4Es/432g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDA2OSBTYWx0ZWRfXwUwDZUezuJfE
 7ake6+FIjT+JQYz8YHKa9uwnXkPDkkI6JIAovZL7SDxQXY0yl/kf9YoN6UwargkcVDPgv+X44ro
 4qywzC6+vk0c9uUAmFqUDzjjA8gfPTA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-16_06,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608170069

On Mon, Aug 17, 2026 at 11:41:51 +0300, Ard Biesheuvel wrote:
> On Fri, 14 Aug 2026, at 18:16, Leif Lindholm wrote:
> > On Thu, Aug 13, 2026 at 09:45:09 +0200, Ard Biesheuvel wrote:
> >> The EFI stub already passes a struct efi_boot_memmap populated with the
> >> information of the EFI memory map as a configuration table, and so
> >> passing the physical address, size, descriptor size and descriptor
> >> version via 4 different DT properties is kind of redundant.
> >> 
> >> Instead, pass the physical address of this struct in memory so that the
> >> kernel can just retrieve the values directly.
> >> 
> >> Unfortunately, the scheme with four separate properties is boot ABI for
> >> Xen, and so this needs to remain supported.
> >
> > To clarify, you mean boot ABI when running under Xen?
> >
> 
> Yes. We've allowed Xen dom0 to omit the EFI stub entirely, and boot the
> kernel proper in EFI mode, passing the EFI system table and memory map
> addresses via these special DT properties.
> 
> >> But for the EFI stub itself,
> >> this is just an internal ABI that can be modified.
> >
> > Hmm...
> >
> > So this leaves only three properties that cannot be derived from the
> > System Table:
> > - The System Table address itself
> > - kaslr-seed
> > - bootargs
> >
> > The latter two could also be given the config table treatment.
> >
> 
> The latter two are generic boot ABI for the arm64 kernel, and there
> is no need to treat them differently for EFI boot. Note that we also
> support passing the initrd directly via DT when doing EFI boot, rather
> than via the EFI specific device path.

Ah, yes, noted.

> > Is it time to update the boot ABI to say x0 will hold the physical
> > address of "device tree blob (dtb) or EFI System Table in system RAM"?
> > They can be distinguished by 0xd00dfeed / "IBI SYST".
> 
> Let's avoid 'boot ABI' here, given that we are talking about an internal
> interface between the EFI stub and the kernel proper.

It's an internal business in the topic under discussion, but if we
were to change it, that would mean updating booting.rst, which I
consider an ABI.

> This internal interface uses DT under the hood, even on ACPI platforms,
> because it simplifies the early boot code. I don't think we should change
> this.
> 
> Also, the DT provided by the bootloader (if any) may differ from the one
> passed by the EFI stub, and so discovering the DT from the EFI system
> table is not straight-forward - they are not the same, and making them
> the same may have unintended side effects.

Right, but this confusion exists precisely because of the two ways the
device tree can be accessed with the curreent design.

> > The use of a generated DT when none was provided by firmware has led
> > to both confusion and shenanigans, and might be nice to get rid of?
> >
> 
> I don't disagree with that. But that would imply adding new code to the
> early startup code doing command line parsing and KASLR randomization to
> reason about whether these assets are passed via DT or via some other means.

I take your point about the invasiveness, so won't pursue that further
at this time. But I can't promise I won't bring it up again eventually :)

> What would make sense imo is to pass the EFI system table address via X1
> when doing EFI boot, so we don't have to get anything at all from the DT.

That certainly sounds like a clear improvement.

> > Either way, it would be nice to get rid of all four of the
> > linux,uefi-mmap nodes if they're now completely redundant.
> >
> 
> Indeed.
> 
> > Minor bikeshedding below.
> >
> >> @@ -123,8 +134,24 @@ u64 __init efi_get_fdt_params(struct efi_memory_map_data *mm)
> >>  			pr_err("Can't find property '%s' in DT!\n", pname);
> >>  			return 0;
> >>  		}
> >> -		if (dt_params[i].paravirt)
> >> +		if (IS_ENABLED(CONFIG_XEN) && dt_params[i].paravirt) {
> >>  			set_bit(EFI_PARAVIRT, &efi.flags);
> >> +		} else {
> >
> > This condition branch doesn't in fact have anything to do with the fdt.
> > Should it still live in fdtparams.c?
> >
> 
> I don't follow. The EFI_PARAVIRT flag is set based on whether we are 
> using the generic or the Xen-specific set of DT properties. What would
> be a better place to decide this?

Apologies, I may have commented confusingly - my comment was about the
else branch:

+
+                       bm = early_memremap_ro(memmap, sizeof(*bm));
+                       if (!bm) {
+                               pr_err("Cannot remap EFI boot memory map\n");
+                               return 0;
+                       }
+
+                       mm->phys_map            = memmap + sizeof(*bm);
+                       mm->size                = bm->map_size;
+                       mm->desc_size           = bm->desc_size;
+                       mm->desc_version        = bm->desc_ver;
+
+                       early_memunmap(bm, sizeof(*bm));

So to restate - this function is called from efi_init():
---
        /* Grab UEFI information placed in FDT by stub */
        efi_system_table = efi_get_fdt_params(&data);
        if (!efi_system_table)
                return;
---

Before this set, this function called get_fdt_params() indeed gets
"params" from a device tree. After this set, this function gets params
from a device tree in some instances, and not in others.
Which feels suboptimal.

We could rename the function, but then there's still DT-unrelated
code held in fdtparams.c.

If we go down the route of passing the system table in x1 on boot,
then I guess the effect of assigning efi_system_table will already be
broken out. But should we then split the mm struct initialisation into
separate DT and config table helper functions?

/
    Leif
