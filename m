Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7E3A39B4A6
	for <loongarch@lists.linux.dev>; Wed, 29 Apr 2026 09:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777453466; cv=pass; b=gsc14PKIisxz5wPQGy2DMlmfV14GaoFfrMWOgwjuIudKi2ZI23Ivy7HwS09j3RDEC1NQZWPSwapndehVr0FoMptnSViG63uakqSfiTa7sZH97AmhGDivuRiPIV3l1e3XOsT2cNAT2sFhqyZ+EolnHICI9gW7MU7P/ETVLZcnRB0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777453466; c=relaxed/simple;
	bh=ZMyxqcIFaP9OJPmN8xllVR/qPV5bDUfWiOPhSHyGVtg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q3BCqZPN9ZKHcf2r7SKOGuCEO96hwfjSohDkyXSHIG24/gSwj2xf0nhgkFI6f5pwaWW0xPyB1fcKqPe/2wt5qNfqskbDfJMH6wv6YtJ5PU/ObTPJE5EWo2lfKByy+zT4CWMucPqKbj8BGVJnHRyG+9merFjCLgf4sAreomHCrgU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hev.cc; spf=pass smtp.mailfrom=hev.cc; dkim=pass (2048-bit key) header.d=hev-cc.20251104.gappssmtp.com header.i=@hev-cc.20251104.gappssmtp.com header.b=sYyE8C2j; arc=pass smtp.client-ip=74.125.224.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hev.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hev.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hev-cc.20251104.gappssmtp.com header.i=@hev-cc.20251104.gappssmtp.com header.b="sYyE8C2j"
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-651bf695701so11223230d50.2
        for <loongarch@lists.linux.dev>; Wed, 29 Apr 2026 02:04:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777453464; cv=none;
        d=google.com; s=arc-20240605;
        b=ChgZtcTXPBqbeS8ib+rMnUtsw34YHQBu3UFYwbVQGygECKlQIq4AjWOsa9Lb11thcD
         AUCJaaTSdPi5a4awKg0cnM7CYGJPl/8KKXXepRTmRTJnqoEMU5g25wgvZBetTXFKFhys
         VbQAWSRnyKzfIxPdtnnzoSXgzjaU6fLKxXcKF4UXCV3yfwlqtfuSoWS9qUCQ8YbZ9n8P
         t6cdKPuayyuSAJuY/d0lAd4Hi+QGTepNCzRVVUGhnIjvhzxlJB27nkxpx3Hl4byc0zC0
         T0IjGjdzHWcxtdcfWp3WNPGcMiolDbsvR+3yI3HYpL5rm28FRuTm3QilETQ83dpZqv2d
         O2+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=H/hCEm95VzRETV93q9jodeYGEMcpGO34GjU4Jtkr8Lc=;
        fh=U4fjWP435SGpHlxdTJjpkzl8KcHowzY5CNr1iZuwSYY=;
        b=Ck71NXoHmLNvjJRa3+V5jdLvx29Ngp3Bn75WWK3kNikLYRIwvWgUXqLqnNUxXv+x7t
         S8KVCcrsXU4rBw/ZbwIDSgZNaMnUzc7ANVTsUz2gqA2xsdXO+PYo1Q6MKK3uEDg2uOTP
         NY6IuEwsdKTQqybDuUb8CYz7/Qqrb7UeFwbNvAMD6qLalwrPFAwZGiCsszW11ndjEteb
         aaelwr/sRsH64YQ5fBhpsXUVq5poc7z2//MH6zg41P1+nUdWtEcNUJV1PnyclmlBfbhG
         s6YEu11mQ4u1gtQ2ZosTbFXcLeizUnzzDjgVP7rTxlEDSIzNa9poqBvHS4bUxckWVFGR
         g7Sg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hev-cc.20251104.gappssmtp.com; s=20251104; t=1777453464; x=1778058264; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H/hCEm95VzRETV93q9jodeYGEMcpGO34GjU4Jtkr8Lc=;
        b=sYyE8C2jy3d0RhTYrwLg/69cJYGoBaf35xVo2pVdNtVfsMesdAse0mp0ibmj0vP4hW
         fhI/RSfPDViLZefjT4OBF4fCdgjkKv6DxPRyS4ldCLzDgi2fDsIroxqFctUcWBYZKlLe
         /+wYf/ksiPAAPHP40tzJq4h8LIvfOxx7WFpTh7IGISO/HCeU+j4CVrY/WtZBLEZWMspp
         d2yYU2ZZGtQpzFhBuq7T7jD8vlPLgOGBOeVDWQxwAIlv8nJIfwcZ4nyVf31skLNuDDyC
         HfrKBvrY7TgxE9sleaarFy5ilD/JOhXQAPKS+AdCed2jsoHPpayN/GJgt+ebibqGq7ev
         SHOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777453464; x=1778058264;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=H/hCEm95VzRETV93q9jodeYGEMcpGO34GjU4Jtkr8Lc=;
        b=s4C+vDm+Rn+8qXofCO5RmAqhktl96yoSv5TYFG7pGiwJ0j85R8JYh/29WI+2goSlUc
         tkN/s3z/f/kI6UGP7J7tDeQ+685CuNbuAgpg5og9GvgI3LVwGMMY/F6Ls0SDompN31Be
         5gRiu+xOO7lPrVBhyREewNakfuzswh0bQQaa8XNhweiBvbbzCVY+6OTYZ0qo0L9e1f4G
         6K5CB8wSJQF+HCRioVqDRq3PDr2IBs9+qasbQ2fg1LCTXLxLG9jw1ruJfUG4WQ8S8yHU
         Fgv0AvgXf2xA0313KzmrXC1guFC55zLRFTDK+7VpwxG1iTb8SNrdHFnvBG3SIvFl0aYV
         kJWA==
X-Forwarded-Encrypted: i=1; AFNElJ/J2HnnXdvETUXy5RxEdAIJCpzelke29YeMRs9J2sazQrrV4YOKLJShREnjz0JDvFSAFOUkNp60V3I=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx6KgT7YNx4NXHVCy6YbxNSE6k++LH/FpPcUguruANLvQ4foonD
	V2PSFlQqSNHYc5EURI1Jnv9+yEGcEJBat50zfP+rYyBnRZm+ftcmNXAOYdgctnJFei9Fno95dVg
	0B48ya37FYKoIS9dKKL9O+EiaXjR43Y1ykBafC+7lTw==
X-Gm-Gg: AeBDieubXpapv2fkT/KCDBrO/zwjXMNnUKwxDQrpm2TELFBf3R9bM5KzJdi0Da8oKLb
	63A65LRjWNinYycwSQVDuLChTKLu4+IFeidWP3eRbBWQTo5Emmpur5ajB1ljdqIjxCXcpihZ9Rr
	UaAX/QW1mA4RqY3uRBRl/VefsHbjY0cDm/3Xhu6TxDK90qbEhxATvAz9ORuMce+bON/+pTHgiD1
	vsz1BQQkcWQG0V44AeD0CLqPrmcM202g6qi/2UhYcUhmLPWhx4nj265tMYhhVXL8p4an/7Sb8IP
	hNxjoj3XriKbV2/+OBT6+q6cApStDPjXYTQe1aW8Y086R+fM4+0=
X-Received: by 2002:a05:690e:484e:b0:650:131b:6ee4 with SMTP id
 956f58d0204a3-65beed7791emr4448465d50.20.1777453463614; Wed, 29 Apr 2026
 02:04:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260429051318.1581350-1-r@hev.cc> <20260429051318.1581350-2-r@hev.cc>
 <cdbbe14e-c677-4c32-b7e6-19e76a716171@app.fastmail.com>
In-Reply-To: <cdbbe14e-c677-4c32-b7e6-19e76a716171@app.fastmail.com>
From: WANG Rui <r@hev.cc>
Date: Wed, 29 Apr 2026 17:04:11 +0800
X-Gm-Features: AVHnY4KZA8Yvg_6QGfU5v96qrCiBFIQkfKN0rmWvrlYlZQXk3i65J-hrRobuDxM
Message-ID: <CAHirt9hCLMmfhyYisWGB+84OauMx1_w1maEpEZhx34dPX6xiyA@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] efi/loongarch: Randomize kernel preferred address
 for KASLR
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, Haiyong Sun <sunhaiyong@loongson.cn>, 
	Lisa Robinson <lisa@bytefly.space>, loongarch@lists.linux.dev, linux-efi@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ard,

On Wed, Apr 29, 2026 at 4:55=E2=80=AFPM Ard Biesheuvel <ardb@kernel.org> wr=
ote:
>
>
>
> On Wed, 29 Apr 2026, at 07:13, WANG Rui wrote:
> > Introduce efi_get_kimg_kaslr_address() to compute the preferred
> > kernel image address dynamically when CONFIG_RANDOMIZE_BASE is
> > enabled. The function derives a random offset using EFI-provided
> > randomness combined with the timer value, and constrains it within
> > CONFIG_RANDOMIZE_BASE_MAX_OFFSET.
> >
> > Update EFI_KIMG_PREFERRED_ADDRESS to call this helper so that the
> > EFI stub can select a randomized load address when KASLR is active,
> > while preserving the original base address behavior when KASLR is
> > disabled or nokaslr is specified.
> >
> > Signed-off-by: WANG Rui <r@hev.cc>
> > ---
> >  arch/loongarch/include/asm/efi.h         |  4 +++-
> >  drivers/firmware/efi/libstub/loongarch.c | 16 ++++++++++++++++
> >  2 files changed, 19 insertions(+), 1 deletion(-)
> >
> > diff --git a/arch/loongarch/include/asm/efi.h b/arch/loongarch/include/=
asm/efi.h
> > index eddc8e79b3fa..f831320efd41 100644
> > --- a/arch/loongarch/include/asm/efi.h
> > +++ b/arch/loongarch/include/asm/efi.h
> > @@ -30,6 +30,8 @@ static inline unsigned long efi_get_kimg_min_align(vo=
id)
> >       return SZ_2M;
> >  }
> >
> > -#define EFI_KIMG_PREFERRED_ADDRESS   PHYSADDR(VMLINUX_LOAD_ADDRESS)
> > +unsigned long efi_get_kimg_kaslr_address(void);
> > +
>
> Where is the call to this function being added?
>
> > +#define EFI_KIMG_PREFERRED_ADDRESS   efi_get_kimg_kaslr_address()

1. drivers/firmware/efi/libstub/loongarch-stub.c

  efi_status_t handle_kernel_image(...)
  {
      ...
      status =3D efi_relocate_kernel(&kernel_addr, kernel_fsize, kernel_asi=
ze,
               EFI_KIMG_PREFERRED_ADDRESS, efi_get_kimg_min_align(), 0x0);
      ...
  }

2. drivers/firmware/efi/libstub/zboot.c

  static unsigned long alloc_preferred_address(...)
  {
  #ifdef EFI_KIMG_PREFERRED_ADDRESS
      efi_physical_addr_t efi_addr =3D EFI_KIMG_PREFERRED_ADDRESS;

      if (efi_bs_call(allocate_pages, EFI_ALLOCATE_ADDRESS, EFI_LOADER_DATA=
,
              alloc_size / EFI_PAGE_SIZE, &efi_addr) =3D=3D EFI_SUCCESS)
          return efi_addr;
  #endif
      return ULONG_MAX;
  }

Thanks,
Rui

> >
> >  #endif /* _ASM_LOONGARCH_EFI_H */
> > diff --git a/drivers/firmware/efi/libstub/loongarch.c
> > b/drivers/firmware/efi/libstub/loongarch.c
> > index 9825f5218137..51997a0e83bd 100644
> > --- a/drivers/firmware/efi/libstub/loongarch.c
> > +++ b/drivers/firmware/efi/libstub/loongarch.c
> > @@ -38,6 +38,22 @@ static efi_status_t exit_boot_func(struct
> > efi_boot_memmap *map, void *priv)
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
> > +             random_offset ^=3D (random_get_entropy() << 16);
> > +             random_offset &=3D (CONFIG_RANDOMIZE_BASE_MAX_OFFSET - 1)=
;
> > +             random_offset =3D ALIGN(random_offset + SZ_64K, SZ_64K);
> > +     }
> > +#endif
> > +
> > +     return PHYSADDR(VMLINUX_LOAD_ADDRESS) + random_offset;
> > +}
> > +
> >  unsigned long __weak kernel_entry_address(unsigned long kernel_addr,
> >               efi_loaded_image_t *image)
> >  {
> > --
> > 2.54.0
