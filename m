Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA0BF356A12
	for <loongarch@lists.linux.dev>; Mon, 27 Apr 2026 07:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777276176; cv=pass; b=qph25YMR+XV9zlmR+ardohdaAFZvJqlr9DHyd/5qJ4xXCCf8PfiX6wL4YECMsQROjknBosCLZ3qQRuYlOL425Vs7vf3VeaDjneVViWWKFy3Wiy6j7qFjZ9x7taQpprkxbA1/7K7IurWDqtxM/wNuXfi3zo8q+gpJYezVZqrPyNk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777276176; c=relaxed/simple;
	bh=wkYbww2o5xmCP3bgyEgxz6IUQJUNogIt6RMdvCb7Ykw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qvgOJhne1393FxQwow9ha+gaZ/R9VQ2YXFypEaeQ2hYQL+G9aTKiO2F9H7m3fejPwuzb0ai/oEMGRE02yJAQstieLj81e2un/L3wwNVKOsY09SsUbDyoFyA32A9HAwzu1NG2zp+bi7wL8+9cc57E2nwZUYn/ZoROx4fsp6EqwMc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hev.cc; spf=pass smtp.mailfrom=hev.cc; dkim=pass (2048-bit key) header.d=hev-cc.20251104.gappssmtp.com header.i=@hev-cc.20251104.gappssmtp.com header.b=FIJmXdx2; arc=pass smtp.client-ip=74.125.224.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hev.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hev.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hev-cc.20251104.gappssmtp.com header.i=@hev-cc.20251104.gappssmtp.com header.b="FIJmXdx2"
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-64937edbc9eso8389596d50.2
        for <loongarch@lists.linux.dev>; Mon, 27 Apr 2026 00:49:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777276174; cv=none;
        d=google.com; s=arc-20240605;
        b=Dsog9Q6uYadCewbiTOdOcqG3bR3JL9C7Q9NDdFhyzWnx4Kzm6hc/u2+bv19z9d2Bt6
         iz8RFTVqUXe+O6GFpdmofPJhMsnswXQfX8zgWcqjn10rekiq9b+dt0UraayCHqVUVRjQ
         piqIFEci+JBPAg4ESKU40lv/JZB3SiYpncgAF7uyMrptRq6/PZuUKlSdRu3AhCodlsKQ
         pWXHmwkUL2RJ4DUtnC177rlazSsq+RWsNOX4OytMFYPxY+7sl9nBqL/xtDpZrNN3jo1b
         wrJKGyp9RoNoj2iNw6Ma217Y3W2g9kV9jtZ1hE/nBWfOWSBuNNtfwTg1jdT8EhyFf3YQ
         nyuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ek9ChqVeqeA30OwQ3fqBFJmD6gbZl8V4G3Ph/Tn1DBw=;
        fh=c8GhnynQObM8V2tOc9ZT3cWk9AbWmuf3WLBQCRXvNWA=;
        b=HzScZ0TAzSXjrAu6biBmhwIWnz9fw2XiWyJ+Q643crqKjUforiLSgnmTTcqqqVLbam
         gsgUesgCDjQHsboVhwCuCizIgvqJopQwNHEG6A80V2aioTsQIU5g5xfdr6j8CiPOprwz
         RJOU1e5/cT81bq6THFtMXwitYFiMD2fbJGdfPyu86Nz3PTwkpU9caVS5WeeidBwE3Q3p
         nKLfUElymfioBIHLljkeoqykKrm/e487fAK18+j0Gl5OMJhcwzfOzcBEJbgJH81xp9sU
         MX1ju//mdzcEkXHLV4MlllJUZVkROmgNG9u4b0Le+0lH3sJN5SqfxltOb/baHsCOAPvv
         d+OA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hev-cc.20251104.gappssmtp.com; s=20251104; t=1777276174; x=1777880974; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ek9ChqVeqeA30OwQ3fqBFJmD6gbZl8V4G3Ph/Tn1DBw=;
        b=FIJmXdx2EP18dEaL/SKXqid/RmFaA8upCa/ey7EGCiTUXQVND7RnOfVZQRzZgKnyCL
         ozqlkwiYo315A+i1iV2tQXC6AZrJ70ZwhO/55cc7Ci86C4yUjyE5nwWs2ODcw+FLbl32
         AvFypWK0p2OnKIaWdu8EdirCpwFfzFAnFo+Zhp7r2EFzVE17HCofgCg8qW+/AAp7Hw0f
         AHOVtCfqi0GwpKgsvS7aoKwqFvcPH9D+EfJGxNmABtR3QvIC1TTK/XyOrf0JYXnR+U6a
         QNeFFp2zyL6/sdWlEBWXc0vWCO7HmgXBPqtJK9g15py6GRXcEMMCbECAuJHAAIRi7fHW
         eueQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777276174; x=1777880974;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ek9ChqVeqeA30OwQ3fqBFJmD6gbZl8V4G3Ph/Tn1DBw=;
        b=fHkEJ8EtPYf+eEXe7DYlkT3kyjZTlcUX8tVvo1Mv7673GpuF81O/3ClY0FJcg8x2Rv
         NyDurKfL/5JccaGuBJoVU2xe5nrBcyWU5CajGm7SI5E2OscwpsPesVpM3QQQkGh7hXFa
         JUi2E7mbFBhyA0FtWje7jUxzIgyct0Kdu5pu4vsgTky0mXbu0amZQTsaiWkNo0L5UMxr
         RRYNPb0ymMagp8NRzb4QjSNkdjRnHK80znMgEJkp60IPZ1TQRr9bKaWe+s3868KJ99A6
         ei4A0g0b+4C4sCflYOADyIr9v4vSRUQPgD5rlN28hG6n9RsCLHbw3VIGJxaE2B+V5XSf
         h4Yw==
X-Forwarded-Encrypted: i=1; AFNElJ9Z9HoaPW9cen0Pnw4Isuqo4b14oKeNztcSY004g8B3Hk1mTCfmVvGMxMRomjY/IAZ2YAIRymw791Q=@lists.linux.dev
X-Gm-Message-State: AOJu0YxtLJR9IDTz2HkAGoyFSBjIXjN8Hc40jQezfaxFeqdhLLnKmUR+
	oAIoXGKoYGL2VUAEIw1ZsQoW9sg6PoUMyF3Szi6pw2ChlZgzGqGhGpMQmDbHtJrzogF8XLIAPGU
	eIO/M2f5yJeE2npB88unK9PpMzOYdxRymXaef7m6syA==
X-Gm-Gg: AeBDiev1movCAl1SckqxxFyNGFQ5sgnOjhKtrC1wmoddUAQnDlrEbA9VxRVKNDlfJMK
	7GZ3ahDmGCv5WCxDuPdoSz0gxdvQ9qD8Rcz6oVTYSl2Qjg1MYmOQ4/S5o4lTM3t6Fdph2mMR4Eb
	U6CXDCygrQQIJRGSnDqBrTJlPj5AzDCO2aZ6gfh4cQYHzIN1Q3uY6b1LhaETRkyr73yhy5GAzRh
	rtVgyL1mM3oByLSf+nZ6kU9gourDY8h3XAOXu8phvnPjqoJI51qfKg/CEkIldqPs411FCIoCIBH
	J8uvxtWAjMi/M+cFkrEwZjXRLxUTAL2l+3/T/QtojGeUWq6/vWbt
X-Received: by 2002:a05:690e:4192:b0:64e:a335:95cd with SMTP id
 956f58d0204a3-65310a427edmr30609822d50.41.1777276173956; Mon, 27 Apr 2026
 00:49:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260426120231.532644-3-r@hev.cc> <20260427050735.3410-1-lisa@bytefly.space>
In-Reply-To: <20260427050735.3410-1-lisa@bytefly.space>
From: hev <r@hev.cc>
Date: Mon, 27 Apr 2026 15:49:21 +0800
X-Gm-Features: AVHnY4LBFt0fuBq3TwLhwZHYG4J8y27cuFb-KgWDFe-BpI0G6t-52Sf-oj0Bl4A
Message-ID: <CAHirt9jfnSFQfRHEANGeNGE2JowTcPV1Tz8L4cX=boJ6vSOa7Q@mail.gmail.com>
Subject: Re: [RFC PATCH 2/3] efi/loongarch: Randomize kernel preferred address
 for KASLR
To: Lisa Robinson <lisa@bytefly.space>
Cc: ardb@kernel.org, chenhuacai@kernel.org, ilias.apalodimas@linaro.org, 
	kernel@xen0n.name, linux-efi@vger.kernel.org, linux-kernel@vger.kernel.org, 
	loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Lisa,

On Mon, Apr 27, 2026 at 1:08=E2=80=AFPM Lisa Robinson <lisa@bytefly.space> =
wrote:
>
> Hi Rui
>
> > diff --git a/drivers/firmware/efi/libstub/loongarch.c b/drivers/firmwar=
e/efi/libstub/loongarch.c
> > index 9825f5218137..80ba7d69e1b3 100644
> > --- a/drivers/firmware/efi/libstub/loongarch.c
> > +++ b/drivers/firmware/efi/libstub/loongarch.c
> > @@ -38,6 +38,21 @@ static efi_status_t exit_boot_func(struct efi_boot_m=
emmap *map, void *priv)
> >       return EFI_SUCCESS;
> >  }
> >
> > +unsigned long efi_get_kimg_kaslr_address(void)
> > +{
> > +     unsigned int random_offset =3D 0;
> > +
> > +#ifdef CONFIG_RANDOMIZE_BASE
> > +     if (!efi_nokaslr) {
> > +             efi_get_random_bytes(sizeof(random_offset), (u8 *)&random=
_offset);
> > +             random_offset ^=3D (rdtime_l() << 16);
>
> random_offset &=3D ~(efi_get_kimg_min_align() - 1);

Thanks for pointing that out.

Aligning to 64K here seems preferable. Otherwise, it reduces the entropy.

Thanks,
Rui


>
> > +             random_offset &=3D (CONFIG_RANDOMIZE_BASE_MAX_OFFSET - 1)=
;
> > +     }
> > +#endif
> > +
> > +     return PHYSADDR(VMLINUX_LOAD_ADDRESS) + random_offset;
> > +}
> > +
> >  unsigned long __weak kernel_entry_address(unsigned long kernel_addr,
> >               efi_loaded_image_t *image)
> >  {
>
> --
> Lisa
