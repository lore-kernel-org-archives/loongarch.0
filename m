Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE0A233554B
	for <loongarch@lists.linux.dev>; Mon, 27 Apr 2026 15:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777303784; cv=pass; b=Htd1DTpDOe2wt5P6sNcZZBBHb+N2H265JQjkl0GldFVqH2qRuzj+0UU5xc4XU0z1mJfQmRc7CIhkPwmowTZL3gPD3l2yjrHNq81PAEwYplSLGZfjKpcIwKgzpi9aX2Ht6FrL6ogyvgu9D9CXlO5DwrTdJgWO0EZqeyEZ3qE477E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777303784; c=relaxed/simple;
	bh=Eh7zr/BqVsQKOgqqfc20nbSQ8t2vvAKGnTHPEyknoz0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mLVb4D4ZjUyY6cugg0u4Od4ak2+T+j4OU5RA2GrOu7K93RgosY5sb3V52BgSvdld2rkQd9tsCHGWHwKTP5LGFkG7NPaSlGDNk9R/3DoYqujKo7FY7yVrxUGeLMaRj7EmKZcQxu6WKC/uMG5IIIxoeLsdP81UNen1HwR6Egx7l4c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hev.cc; spf=pass smtp.mailfrom=hev.cc; dkim=pass (2048-bit key) header.d=hev-cc.20251104.gappssmtp.com header.i=@hev-cc.20251104.gappssmtp.com header.b=EW9eGfEt; arc=pass smtp.client-ip=74.125.224.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hev.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hev.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hev-cc.20251104.gappssmtp.com header.i=@hev-cc.20251104.gappssmtp.com header.b="EW9eGfEt"
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-654672a6d68so4627941d50.0
        for <loongarch@lists.linux.dev>; Mon, 27 Apr 2026 08:29:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777303782; cv=none;
        d=google.com; s=arc-20240605;
        b=iss97+OuCh+0gONVIcBRA8dZNeOSHAsPpn88uvzqkY2O99p1MBMm96rirGJCtmuH5q
         +ZvvKXnBoYKEgNXT2Zhytl5f1R7fk/HJsYJp8ceq9o9SnqhJNPRdpMFS5H7HRga/q22y
         iymg/Anp1eHlP10geTNw621mtq0Rt6BLWlKHPR2ET+rsrIIax4uJM4bU5bKn4ca9EuzT
         QXkR62bHk+/pLo9Thu1Ts1UcZZRsS8quGNYEk4TwxBgdTZpIHSvp3gwDk8hOk+859wYT
         8TKz8Y/cFiZymvxuhyyTjYbc0Q0+04UTTDBt+Pf9fwsUFh5DjtwTsYF/mBL1m6i1Gnr6
         2pGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5xMIHn3yDcdr8mFbJMP8bbSm+7dOmoozq1bIImHRXXQ=;
        fh=8uyTqJrXipkVaUx8rYEtk3+kdYH+GtufC7OMdEpt7vA=;
        b=gkNm+WcWbgNFJmLw33EMutWsBvd8BQvOW+f/0bYIpUMjdjHbTQZAiGdRhTsv3GkeUk
         s84umyFL1Z9JqFwM7Q5pem77V9PD2r2Wgnd5zDVZ62npxYRBP+fN8ZeGq0OMPIDskvLT
         OdoelkhRgkJtj7/s7T+gunhU3v+EM4uaBZODl4ckv9DeE2j7yXRx9wdpGwVIb8m1lNF1
         9xyGY/teqJy46hN4z9h/o6GrgYCaVNkI9OSIHoPbixXAnlkVNVCGTablp6ppbX8E/tRc
         4Lt7Byz7LxhFFCJGRNV0k5CZUUNBP1i1TZTT+ZGzsjB6LPsjaMQ2qbJ9pA8DimZHWCXS
         hErA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hev-cc.20251104.gappssmtp.com; s=20251104; t=1777303782; x=1777908582; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5xMIHn3yDcdr8mFbJMP8bbSm+7dOmoozq1bIImHRXXQ=;
        b=EW9eGfEtnlhaNSbJ9uUdsfTodbSn5HCOrgKKxgmLsWfCMB/+eVXz+I3+x7CHvpU4+6
         72ALZy2LhK2QCrrw6ALIbzgaimuHlR9xM9nRyr/kydkcLUZf+9RcST3cu69m7dXew3M9
         qlORECuZJH5tMSNAmomTYinM54XqnIcVGPrAFnJ3Dq+6VFwDGu+WotLy38ms31ZqnBMB
         ZpeekmlRFCGhl/q9XWAW0W3Jc42pxLeqgHvC5RbRoeTa7WwzL5POXO3PNo8hoKyAVpHt
         QWqZb1SMi2DtI3L8xOQ2ym6hisMNEU6ay/BXU+3hoLzWXGR9ibBqTKVekXtpy80gbmZ7
         6O2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777303782; x=1777908582;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5xMIHn3yDcdr8mFbJMP8bbSm+7dOmoozq1bIImHRXXQ=;
        b=EOFdzOkChFuOr0kTslNOT35KITqzoaPG2o9T4Ee6i2iuZmy4cluWt/e+sx6NsbL2dL
         uAdTEkkNVFLoSW6ctD+aXimysaJexfW/SmIB1h+N0iOJrXdkur1eb1THeNgJzeYZNfUx
         QOmHV937Y5Kcia54Pl3E0Ih4lvS4zQCaFCK6p7UmKLyNMQjFqXsNHX4798lC0S+5q1dv
         feNiryEQ1H7hVm4Po/pCVfXA/iARKxVIaowCxutnP7W7XJaEwijWynTmag6Gol8WYYku
         LFDQH1agBRdDeAtzG9lxUeE9ig7VD10WF5gFcW28XD6q/1dP0KTA1L9/qTVhARbHTA0D
         WDXw==
X-Forwarded-Encrypted: i=1; AFNElJ85YgBQAHYHeJWj9McHyWYi7+I9h9a9Tnm7krwdMPFMISHhjsJEIqrnPoV8gXsL2fhzkx2YZicRkAY=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywjt2KUEInMt7Nni750rEfDA3jda67wGChCcaiQcuqVKYx/q2iN
	tZOlHq5STPBzEt2Y2s0Ea1b+ACNk6+JvJB73hf0GuqBgjwmcZc7liPlBWqxOeFwKeEJhqmK69D7
	xyGfHOP+my9+tVLZg+1k2GH8HeWn6J2NGs1TkbcgsRQ==
X-Gm-Gg: AeBDiesNyG8k0tyLiTaOUU+EHZyJrPCzRa7+C0Ig8q4yqCOmC2QcfzCdtpA6QlEaDq3
	mPM2Dff8T8lF5eNh5o+wzn4Mrt/s049+qk9whuPmYQKzM4hlAa7PTXZ6hxXnePAdzTz8PoE+bNP
	UtikEdLZle0UvQM8gErZ1nnJM679GNVBHtMIGNMOsTrjSGeI5063y3/yQ5Hk5fTgOAuDAfuilMF
	jJYVMH2wCzYsAb7cphP8DMwGnDGxWfd4JfZxObB38DlHGx50um3jgPw0x7qbITZgU4n0rN3wrOq
	CKrK+/0sFeiy+YAR8kPK5ZOAwwgVlvgiK1jJcKQx76nIvlSRz7s=
X-Received: by 2002:a05:690e:1a82:b0:650:18e3:d917 with SMTP id
 956f58d0204a3-653109fa086mr30305155d50.41.1777303781714; Mon, 27 Apr 2026
 08:29:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260427104721.47724-1-r@hev.cc> <20260427104721.47724-3-r@hev.cc>
 <CAAhV-H4CTAZT9pChSqv_j+ZT9VXUmYh7FoBS9gKmP95BzdPB-A@mail.gmail.com>
In-Reply-To: <CAAhV-H4CTAZT9pChSqv_j+ZT9VXUmYh7FoBS9gKmP95BzdPB-A@mail.gmail.com>
From: hev <r@hev.cc>
Date: Mon, 27 Apr 2026 23:29:29 +0800
X-Gm-Features: AVHnY4JF9ErHRW973tnO9UWMquw3bXMZZrTd8v187moO4nH0MzzyEz9_0zfvkLg
Message-ID: <CAHirt9i9XAYKuDmDmpHvrHGOfT7TAnzk5Rna9h4+Hy2aCdSDDg@mail.gmail.com>
Subject: Re: [PATCH 2/3] efi/loongarch: Randomize kernel preferred address for KASLR
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Ard Biesheuvel <ardb@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, loongarch@lists.linux.dev, 
	linux-efi@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Huacai,

On Mon, Apr 27, 2026 at 9:27=E2=80=AFPM Huacai Chen <chenhuacai@kernel.org>=
 wrote:
>
> Hi, Rui,
>
> On Mon, Apr 27, 2026 at 6:47=E2=80=AFPM WANG Rui <r@hev.cc> wrote:
> >
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
> >  arch/loongarch/Kconfig                   |  2 +-
> >  arch/loongarch/include/asm/efi.h         |  4 +++-
> >  drivers/firmware/efi/libstub/loongarch.c | 16 ++++++++++++++++
> >  3 files changed, 20 insertions(+), 2 deletions(-)
> >
> > diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
> > index 3b042dbb2c41..a5afb70f73d9 100644
> > --- a/arch/loongarch/Kconfig
> > +++ b/arch/loongarch/Kconfig
> > @@ -730,7 +730,7 @@ config RANDOMIZE_BASE
> >  config RANDOMIZE_BASE_MAX_OFFSET
> >         hex "Maximum KASLR offset" if EXPERT
> >         depends on RANDOMIZE_BASE
> > -       range 0x0 0x10000000
> > +       range 0x20000 0x10000000
> Why modify this?

The reason for changeing the lower bound is to simplify the
random_offset calculation, making sure that
(CONFIG_RANDOMIZE_BASE_MAX_OFFSET - SZ_64K - 1) is always >=3D 0.

>
> >         default "0x01000000"
> >         help
> >           When KASLR is active, this provides the maximum offset that w=
ill
> > diff --git a/arch/loongarch/include/asm/efi.h b/arch/loongarch/include/=
asm/efi.h
> > index eddc8e79b3fa..f831320efd41 100644
> > --- a/arch/loongarch/include/asm/efi.h
> > +++ b/arch/loongarch/include/asm/efi.h
> > @@ -30,6 +30,8 @@ static inline unsigned long efi_get_kimg_min_align(vo=
id)
> >         return SZ_2M;
> >  }
> >
> > -#define EFI_KIMG_PREFERRED_ADDRESS     PHYSADDR(VMLINUX_LOAD_ADDRESS)
> > +unsigned long efi_get_kimg_kaslr_address(void);
> > +
> > +#define EFI_KIMG_PREFERRED_ADDRESS     efi_get_kimg_kaslr_address()
> Can we reuse something in drivers/firmware/efi/libstub/kaslr.c?

This aligns with the kernel's built-in KASLR, ensuring the random
range stays within CONFIG_RANDOMIZE_BASE_MAX_OFFSET. This is also why
we didn't reuse kaslr.c.

>
> >
> >  #endif /* _ASM_LOONGARCH_EFI_H */
> > diff --git a/drivers/firmware/efi/libstub/loongarch.c b/drivers/firmwar=
e/efi/libstub/loongarch.c
> > index 9825f5218137..df67ef8c68ab 100644
> > --- a/drivers/firmware/efi/libstub/loongarch.c
> > +++ b/drivers/firmware/efi/libstub/loongarch.c
> > @@ -38,6 +38,22 @@ static efi_status_t exit_boot_func(struct efi_boot_m=
emmap *map, void *priv)
> >         return EFI_SUCCESS;
> >  }
> >
> > +unsigned long efi_get_kimg_kaslr_address(void)
> > +{
> > +       unsigned int random_offset =3D 0;
> > +
> > +#ifdef CONFIG_RANDOMIZE_BASE
> > +       if (!efi_nokaslr) {
> > +               efi_get_random_bytes(sizeof(random_offset), (u8 *)&rand=
om_offset);
> > +               random_offset ^=3D (rdtime_l() << 16);
> Use get_cycles() then the first patch can be dropped.

I'll use random_get_entropy() here.

Thanks,
Rui


>
> Huacai
>
> > +               random_offset &=3D (CONFIG_RANDOMIZE_BASE_MAX_OFFSET - =
SZ_64K - 1);
> > +               random_offset =3D ALIGN(random_offset, SZ_64K) + SZ_64K=
;
> > +       }
> > +#endif
> > +
> > +       return PHYSADDR(VMLINUX_LOAD_ADDRESS) + random_offset;
> > +}
> > +
> >  unsigned long __weak kernel_entry_address(unsigned long kernel_addr,
> >                 efi_loaded_image_t *image)
> >  {
> > --
> > 2.54.0
> >
