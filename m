Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93EF137B022
	for <loongarch@lists.linux.dev>; Sun, 26 Jul 2026 08:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785054941; cv=pass; b=lvf4ewmEsMVfZET5XIt7RAgyZ+eA7GGqONOfLr0v+/YsgMBXlf6nL5ZzA83EwO+UcljO+n/rSUfMHcz4cZorPRYl9mgIqwf/CexvZ9JZ49tvC4ixpzWFxtPdICRM112U1oP0OZDBw/pDQl4h/Eyx1jQf/L0I37jdFG4F61Pzzuo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785054941; c=relaxed/simple;
	bh=EnfebP7aMNSbdO8NGq9HNoA4RZgiWY81yTFuZlrrUpk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d+JJzWnW/toRBk2maNzqv3iMU2q7nXKgVznIJvgw9S1t1AeP5VohWF4vXmf+TAt42ZoKcuWxtQG6c3qU/ZiOgaZGRpgZhQpQ1gantuYW2Puo4gB1MrxJSX+5xo5gZxaI1/VpMmF7SEX0+Bd2yH5T1sfluk+M0cQxDfR+SXVrC+w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MWvBG5jh; arc=pass smtp.client-ip=209.85.161.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MWvBG5jh"
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-6ab05b2f9daso212209eaf.2
        for <loongarch@lists.linux.dev>; Sun, 26 Jul 2026 01:35:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785054938; cv=none;
        d=google.com; s=arc-20260327;
        b=DMhZDIgtJOlzqnwuEsmMfRpOZhVCe6VB8EF2sFdh6hteNvQez2fVayL0UfzpSMoPIc
         jnkdOuM7RYyepRWcwKyCT/eVN7TWQHe0Vf3p6H3Csb+xVpK7AKt4OmNSleMYggDQmV7b
         4kQEf2eY6ySFsLAvLCVc74jge9ELcYUT9pf1yNcWmpkVkicdNW5tCFnv9fmmpHrB4qLW
         zmLpI8A/7NBrycO/XsZeKepoxXP8pc8Sik0zDsCIQeEuLBBO2nwKHFQ2tUlmkXIibiTf
         9mAtUw96gygZJyRfQ6aSOfgrKNO6TVZIvZTEsW7sn2cqoh/J7oCgBvmMDr+U9cd+lnTE
         Ueug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BKmJvDliVsXRF7emQ91eKD3KWYQQya1Q0B4Yo1eQGYY=;
        fh=mZbK1qXIpy88PzabjYd1wkAXD/dJUBLGTBy+WPr7O4Y=;
        b=fFO+ZU6kVviPxxRxgHZLXNQzqNMNB1PmAzXi+lunKnt4Bl3NS0JCjShnGVkcOQs7lM
         wBZTWQccjweB7US0S9CfFtg2wmTMpLF258LvKHn6M/Y1wq4aff5uQkLXaT5FSD5XiOqJ
         UeWnR6BPf4KXj8mw5DnX4L/f76UAha4Rb/MO2K0NomE5071c9+7et5cfkJazMdt7mP7u
         +dgk+zzpF/hPDPOV6kjomtOUwe6bzrIcSWsCiOOCxaB0jVwFn96me3SW5QwAkQ6U6MW4
         FyyYL2ozc0IfFTvjV9LNdaqU00F/udBphPLlLJ6+3wcQ5V/KUJR3HJRutwliy6cciWIS
         CdVw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785054938; x=1785659738; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BKmJvDliVsXRF7emQ91eKD3KWYQQya1Q0B4Yo1eQGYY=;
        b=MWvBG5jhHIG8tr9EeTnlnaTjay8bvw87xMG+IWtyFxfo8VIjkEj04tntb1K27Pf8Te
         fDOIalAXEOJu2aI92lKxVzJEo7vAHaWiprXwJNzFVLDWkCylTodc21e27Jip/EpANVXS
         kWPN23haxyHsI5/aZ2URLZbE1EwPouEVAOrHJlvoO/jjpuoBEtQZSrxVEsDHfvshSj/Y
         LZ3GK/6qbSrgmaEUYzoOa54reij+z4Op/nVsENc25JOPboXKh70+rhRAxuo4CM3ynLTO
         xCOeHFNZBYDq5w4g3VROAH2f2IC0cpuhrfc/F0SmrmpT8Chc0VmHRmbYR1etWRnRCp8G
         GD0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785054938; x=1785659738;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BKmJvDliVsXRF7emQ91eKD3KWYQQya1Q0B4Yo1eQGYY=;
        b=F8Vuntpt8hNEaYgWVMn2frXXIL9Qu9VO26UWdxrFMO3RnzSVk0/CAUPpigbC7M9w0O
         8eVwTRYFoPLCkEFGVNMqCf9PyZjLWspuynU/nheF8PbTnYs7d/MN/GM5SoAlq4nOvR4j
         Xo5PPfdMoOj65j9b0eRXiROz5bCCaHr4rcJo1dzRmsSPPevpxmt6EkWJ6cbsVbGnKMHE
         /xWmObnXg5rdLkdnDaGZM01DFt3mY8e8Ie955YUXwbpG4XdRI25qPXtXEivTLFsA9Io3
         GP7ZJpztdpaAj20NnJSS5v/kIz2+roKDXPMLrbEABsjGRHlyBGwfFodpLsF9AC5LQEKI
         e6Ow==
X-Forwarded-Encrypted: i=1; AHgh+RoAPIKrloz3Mw5EgWw5k/bWvB2ozU5wCVFZ+wjidEO0Hby8hvAlGZbm2Lyq9UR1MuGDsMBTwxUVC9A=@lists.linux.dev
X-Gm-Message-State: AOJu0YzvMJYDc3986yjxJkCRb9G0zXf1nbO9Z4IQslx/0xfVYh0Z6dnI
	aOuRitBGCGYkzEDzsuld22aGzzJb615cjhbnUb+x1NQ292TYHoUajIlfvBSjQHQ8qZET7Xh25/Y
	YcSNY34LNvwRYCrgbILut30UE+k+G8Ic=
X-Gm-Gg: AR+sD12oSkTAY1XuE38ihKNXJtX0MhqpZbFFrXeDckoO7gAj6GOUX3aJyZ5DZh1vui3
	9bcBLUG36x+PGjZ1k7Fm1SPbgR6V41GxBXCqcdOLRSbDRBVsGzQS8pXJ7CzkitWGOC47oAwZeC9
	KG/FD7C17oWaoR54kpUbe1sKYYaPGGHXGFb3cU3vabn3YgKtPi/y5vG1kgaCkZRlhFLBy2Q9BLm
	talgtrN54GOMtj19WDgN2tEG+3KDr/us/ukT1RG17GZMcquTUBC+EzO8htiaZk=
X-Received: by 2002:a05:6870:c2a8:b0:456:d0c5:5d13 with SMTP id
 586e51a60fabf-457f26ee4demr4248713fac.27.1785054938369; Sun, 26 Jul 2026
 01:35:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260711100956.4351-1-yangtiezhu@loongson.cn> <20260711100956.4351-2-yangtiezhu@loongson.cn>
In-Reply-To: <20260711100956.4351-2-yangtiezhu@loongson.cn>
From: Hengqi Chen <hengqi.chen@gmail.com>
Date: Sun, 26 Jul 2026 16:35:27 +0800
X-Gm-Features: AUfX_mxMpmApX6zp4Hr8BZQo-e-RR8udWaFtTKur81x4KQBBrXXPTnGzNOgdLls
Message-ID: <CAEyhmHRFRTyV=HoRDKz7KzdGUQdg=KkbpHmkauEEKBB6AvdnPA@mail.gmail.com>
Subject: Re: [PATCH v1 1/3] LoongArch: BPF: Remove redundant zext jumping in move_imm()
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, bpf@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 11, 2026 at 6:10=E2=80=AFPM Tiezhu Yang <yangtiezhu@loongson.cn=
> wrote:
>
> In move_imm(), when an immediate hits the 12-bit unsigned range, an
> `ori rd, $zero, imm` instruction is emitted.
>
> According to the manual, the ori instruction inherently performs a
> logical or with zero-extended immediate operands against $zero, so
> the upper 32 bits of the destination register `rd` are already 0.
>

It would be great to add a link to the doc:
  https://loongson.github.io/LoongArch-Documentation/LoongArch-Vol1-EN.html=
#_andi_ori_xori

> However, the existing JIT code unconditionally executes `goto zext;`
> after ori, forcing it to fallthrough into `emit_zext_32()` to clear
> the upper 32 bits for 32-bit ALU operations.
>
> Fix this redundancy by directly returning from the function inside
> the `is_unsigned_imm12` block.
>
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> ---
>  arch/loongarch/net/bpf_jit.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/loongarch/net/bpf_jit.h b/arch/loongarch/net/bpf_jit.h
> index a8e29be35fa8..bb58c42c2f2a 100644
> --- a/arch/loongarch/net/bpf_jit.h
> +++ b/arch/loongarch/net/bpf_jit.h
> @@ -156,7 +156,7 @@ static inline void move_imm(struct jit_ctx *ctx, enum=
 loongarch_gpr rd, long imm
>         /* ori rd, $zero, imm_11_0 */
>         if (is_unsigned_imm12(imm)) {
>                 emit_insn(ctx, ori, rd, LOONGARCH_GPR_ZERO, imm);
> -               goto zext;
> +               return;
>         }
>
>         /* lu52id rd, $zero, imm_63_52 */
> --

Acked-by: Hengqi Chen <hengqi.chen@gmail.com>

> 2.42.0
>
