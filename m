Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B297E39FCB9
	for <loongarch@lists.linux.dev>; Wed, 15 Apr 2026 08:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776240301; cv=pass; b=QM6CZme28xyjKDG3v2fTvxa8+28k9SF/jDLBKl/WHQppOcdLEGCkfQucZwY2h7JBu5Yugtcb1fZny9UTl2I9Hd8aRpnuTaxP0W3cQv6vajQAkaIBUlMZsvQYv83t1ApsxZG+lj3d8wb/k3sakPZ2VdBp+ov6pCG86TQUGiNEWRc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776240301; c=relaxed/simple;
	bh=kfcd9q6Z0ioBpdkvgpVuAuvfnXjTDjar8HFSlAulTIg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cryLIcWOg40C0wfPp3QVK8gmcqdED52r31U7xm9/xBDdH1MlcDO26nqu1VV5pkj6VTTv8zI7F95OZGlNWn+OybQWWtvXzWDvtWyu1tVq03OMYTQldjnMkr8vWUy4be0TompFJ5U1ZnBA+mOkcLcgITCi+lfX4EZ/fYD7ckHMhu8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bytefly.space; spf=pass smtp.mailfrom=bytefly.space; dkim=pass (2048-bit key) header.d=bytefly-space.20251104.gappssmtp.com header.i=@bytefly-space.20251104.gappssmtp.com header.b=W0Eo/EkL; arc=pass smtp.client-ip=209.85.161.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bytefly.space
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytefly.space
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytefly-space.20251104.gappssmtp.com header.i=@bytefly-space.20251104.gappssmtp.com header.b="W0Eo/EkL"
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-679f6ee3fb0so2291192eaf.2
        for <loongarch@lists.linux.dev>; Wed, 15 Apr 2026 01:04:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776240299; cv=none;
        d=google.com; s=arc-20240605;
        b=e2Fq0or1yVBkd2BCqCFCPvxoKjAEMGAWUfhlIsRFo9ICJSLvdjLh5Fku8YtKZpVCUr
         dYALPf3Z7hx92EIsRITVKIK2M+YFlhM5eR0zRbU1vBiZkSLFFYpCqiVRS/odQds19iR/
         B8xAG7QgV90ekZcBNibOqURwaeDb1sF3baoEaXgnFrZBH+c1Htn/YBhxkonnzphRsKVw
         t8eWXmkYrf7/WG+BGaFliGlDMW2s+PWr1TaLBec/DzG+TSyjLy2zp7L3CFubFucpcy7B
         IwrpqbHpjMyiCsI7RGBP4JTAvFx5lpEkIJ3rg67FTTC8dcTuBVTnE8Ky6J1wX7Su1yu1
         M+XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=S8O0xXOpqpfEkTs0dCcIHCT2wNZjWBhDyaFIjLeYq7A=;
        fh=sH5UdF4GfMcKQJuD6kTKM82dTRp99c0K7wGueS0E/Vo=;
        b=ip5+mCIb86CSrO8OzZAgZl4ut9d3RMWyOhN/scxpRRRoSxsZoUcIKAyVRyVflAHbit
         ZPQLc0zjaWP1oen+LFgOLPkV3nmsfdsSoi0nXjS4jBkS6pUN4MkCgSd0Zdh4ycnRHmSr
         nhvzESftGR9zXbBTyOfmg+xVvZ8a/I1utv9QAeybtUWYgNsuqLPfqHf3SWJZ/07rpY4c
         i68zQoho6C/idEwdT4FTruZMtQpaHfuUgIkSHdVI1hSxU1SpiUniWWCVpfGaq/cMC/ys
         IQGC7gZdR0+KzW2Ika3uMiB5GQik9cdvZqoP04w4dGgJFR17Q9qbl5DXjwfIjC9IjeI7
         QZKg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytefly-space.20251104.gappssmtp.com; s=20251104; t=1776240299; x=1776845099; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S8O0xXOpqpfEkTs0dCcIHCT2wNZjWBhDyaFIjLeYq7A=;
        b=W0Eo/EkLGafw02dmxm3ZUEa4rxUzVzSzB2Tt9wHiDziPgaNOcBtAS9e5IgP/y0YTRw
         KpevFiKVxYWkjC3nDzj+EMCBqHNNz//GCIMp8vBYs7dPJSLpJSaBdjA0WWCaf8jYA4rf
         mUh5zq1E5+djBw+ibBhmGKhi6WuctOc5znQthCW31J+NC4VSaLWHUTiboJFvNaxkekBB
         PKZR3sGVqhSsSOaLsa4A/yuj1JkKfplUXIxreyOf3ZVc0xbdKNv+tPKLkN0H8QV4wbId
         BFfdyntobx+X5jp4CDwImJzd0N7aZ9gA5UIU4h4NCi3+BEWUT6fX4WBasoWzVp63qzkm
         hFdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776240299; x=1776845099;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=S8O0xXOpqpfEkTs0dCcIHCT2wNZjWBhDyaFIjLeYq7A=;
        b=UgEeMd7MbylDW6yglXLlOa1dKn/c+ialuGurzG+XJ1lUJqtcJOJyKXsKpJOinKNqQe
         CJ7bYrOEfeQE4XwjK9JGbg6dOVAlXDYhteu3JWkOJ0/dEDg+mLZMWjadRt1bsQV/YhSr
         vpXxzyaAsTkN0MWjcgBysHtrftcQuExif0MwzfKcELcdtvUeAFqrjsdjUZRhlmbPYGs+
         +VnMX43UTCFDMNzhiqM0WVnnIk4dRASgPoDDT683mvapcwQLNzC5nyWFhuuWNNwSFxQC
         EIEokyamm2ly7S98M5O2SF3UQWYej1oWuKbyuTvTaZZmyElct4Twe5BsNDPyZUdQduX2
         p8rw==
X-Forwarded-Encrypted: i=1; AFNElJ9VhtL11IdDsnzoP1VcjPIrrMMRvfJiAkoB+KoTK1SrPizY4PJ23SIz7/thxbdYNHKRCI3yRCWXbYc=@lists.linux.dev
X-Gm-Message-State: AOJu0YyQAUezvgKmID99/Wk55Gu1z/jAZCBqtXsnpNNS7K1AcNtQqops
	OMQAKzKNBcIEUHA1YKa3MbaGn9yjrL5mu1faI2PtuTrBTzRL9+02MNj7ouohRG4HkNz7AUJVA0f
	OgHDedE/zvhBDi+7rvRsGYqYZuY0vKOqS8psUV3FPlA==
X-Gm-Gg: AeBDiesF6pEDtbUdBk5F8QmvPGmoQtUpdc+rKzwU1Hekw28/+8vw7rBJCGcpdYoVq4E
	qFOgLW4x7EgOrLeKeBCOubC2i0cT9td9Ly1uRoVdo9xHCZepzzDWEXNnD2iVE8DYQqHhmvyr6mh
	P+BqZcW6bCUt67D71EzhpEEYpXh1QV3lux133xHPQOAWM87SlRVhJiBz/So5bRBwbk1DU+W0Ht6
	fMd5dIKIYSc+stgl1ExmRt5lTz6S/KmPsHYjo4USEcXx7R0WHx0OzUcJ5SgMiIwBSdajFd0ScIO
	hm4cICgaWuWSLIzcVeRXx7wqemfvZ3SrHXrcFz1WSw==
X-Received: by 2002:a05:6820:2221:b0:687:c295:5a8f with SMTP id
 006d021491bc7-68be671e099mr10024682eaf.28.1776240298604; Wed, 15 Apr 2026
 01:04:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260330094845.39-1-lisa@bytefly.space> <CAAhV-H6Ur5RFRkhX8PGp2gfJuFBptnr9V_UuLGueqF1Uzj-GTA@mail.gmail.com>
 <CAAhV-H68O-Wz-HAma1SpPzbhcp7BQ-1UspaLSPMr4EqGODrhvQ@mail.gmail.com> <CAAhV-H4NnPTX+ov7NhwiTo7bqCBgFv-RvsodsZ_cc==N0Sd7UA@mail.gmail.com>
In-Reply-To: <CAAhV-H4NnPTX+ov7NhwiTo7bqCBgFv-RvsodsZ_cc==N0Sd7UA@mail.gmail.com>
From: Lisa Robinson <lisa@bytefly.space>
Date: Wed, 15 Apr 2026 16:04:37 +0800
X-Gm-Features: AQROBzCLOGCxIxtfyTeeUMTloG0aCu4TW_Xe9EtdNi8uqoVLZjrB4x6wMp1IuF4
Message-ID: <CA+=oZ7J+_WL6r5eovirkugAGqQULDsJU7pfuxgk1z7xvqT_fcA@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: Align FPU register state to 32 bytes
To: Huacai Chen <chenhuacai@kernel.org>
Cc: WANG Xuerui <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 14, 2026 at 9:02=E2=80=AFPM Huacai Chen <chenhuacai@kernel.org>=
 wrote:
>
> On Tue, Apr 14, 2026 at 4:20=E2=80=AFPM Huacai Chen <chenhuacai@kernel.or=
g> wrote:
> >
> > On Sat, Apr 11, 2026 at 9:10=E2=80=AFPM Huacai Chen <chenhuacai@kernel.=
org> wrote:
> > >
> > > Applied, thanks.
> > I'm sorry, I reverted this patch because it breaks the partial copy
> > optimization in arch_dup_task_struct().
> Fixed as this:
> https://github.com/chenhuacai/linux/commit/c1365bc97d609438809d5d44d338ad=
fc09767d6f

Thanks for catching and fixing this.

Lisa

>
> Huacai
>
> >
> > Huacai
> >
> > >
> > > Huacai
> > >
> > > On Mon, Mar 30, 2026 at 5:49=E2=80=AFPM Lisa Robinson <lisa@bytefly.s=
pace> wrote:
> > > >
> > > > Move fpr to the beginning of struct loongarch_fpu so it is naturall=
y
> > > > aligned to FPU_ALIGN (32 bytes), improving 256-bit SIMD (LASX) cont=
ext
> > > > switch performance.
> > > >
> > > > Signed-off-by: Lisa Robinson <lisa@bytefly.space>
> > > > ---
> > > >  arch/loongarch/include/asm/processor.h | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >
> > > > diff --git a/arch/loongarch/include/asm/processor.h b/arch/loongarc=
h/include/asm/processor.h
> > > > index c3bc44b5f5b3..ce8b953f8c79 100644
> > > > --- a/arch/loongarch/include/asm/processor.h
> > > > +++ b/arch/loongarch/include/asm/processor.h
> > > > @@ -80,10 +80,10 @@ BUILD_FPR_ACCESS(32)
> > > >  BUILD_FPR_ACCESS(64)
> > > >
> > > >  struct loongarch_fpu {
> > > > +       union fpureg    fpr[NUM_FPU_REGS];
> > > >         uint64_t        fcc;    /* 8x8 */
> > > >         uint32_t        fcsr;
> > > >         uint32_t        ftop;
> > > > -       union fpureg    fpr[NUM_FPU_REGS];
> > > >  };
> > > >
> > > >  struct loongarch_lbt {
> > > > --
> > > > 2.53.0
> > > >
