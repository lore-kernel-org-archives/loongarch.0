Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D11632D438
	for <loongarch@lists.linux.dev>; Fri, 24 Apr 2026 04:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777004088; cv=none; b=kL43QaspkIZ0P9RGtRmTK9mRZgqQxNmsQRu9B9VmfE+1Ug7ptTrDGISa55MavRr1n9rdc5/6j0NWaiKWhmzUFYyjhzPr+aRzyEMals3b/GB/n/Wt4pDTJsppgm3yyYtfSkr0VHFn6ff0tJXdQ9yFGlYuF344EfgseoEaXRsapeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777004088; c=relaxed/simple;
	bh=9IAY9I9lHQ34OjS8jkqIDBWK3U/Live1vFCtQMJG06g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YlSSi7CzrcIDBKQrXjGrj0cwBw+MxzvJ4u3f//Lqf4144napHSlRzhofpC8CMyOIphRxa0PyrF2OEH0gnmguagqTcJGbRf5czj7yaTAhi7w37CruAggR8O5sH0o5PMIlgWVcAgzUG1s9VC+zt67Cdjd1cyQ97M0LmMyz6QT0EjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=et7kcIcj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="et7kcIcj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E682C2BCB0
	for <loongarch@lists.linux.dev>; Fri, 24 Apr 2026 04:14:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777004087;
	bh=9IAY9I9lHQ34OjS8jkqIDBWK3U/Live1vFCtQMJG06g=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=et7kcIcjPsVtkg3N7Se1/PEUjqKmyINfm6k8CR5/LXrOGFm6qRgU8MPMGA+mxb+f4
	 /kmtXfMMsxZYmhaqWVPbPpqBE0F2Cm/kx1xVUVwdEWo2N9r1CCE98gAM3/wML9eaCC
	 dE55PJRrIIWwjptY08/PpdAR/9cpjaVFh4oj53QZQ4vKJ5qWAoRq5hVZjzXGZqkzpH
	 Rvc9r/v8hFtPNjiWNVpmbixz0yctZ5qsXt8PaO30SoERvdKcnrZtx9Aaq8SEvV8wSz
	 Bg53ubm1ekZzPkmECtK+Po4B2QmqeYvNDKE794sxgMcAGYme8Sapj69pYACBkOEu88
	 N/4aXSmFoukeg==
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b9c603ec2dfso987523766b.1
        for <loongarch@lists.linux.dev>; Thu, 23 Apr 2026 21:14:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9fK30fuogpmoTY8XZt8BxkaQqY94Hsepl+ahmpYaO70nsGg1lKdfPZodctl69IKVygvM01NzQRWTo=@lists.linux.dev
X-Gm-Message-State: AOJu0YxGnjkCf/0IHveH8FCTerVBH5ea03U2vp9I84CCLjaK7GXMrpMk
	47LbxweUXI+w90SfJWPI8sZf6ZxJS5jvMhMjp5ucWhzx7m59MlJ3Ei8obFf0Ybz3hSXfxOLuaj9
	gwf5PhzDmnZdpSJ652ko8Fqw7HohrPpU=
X-Received: by 2002:a17:906:6a11:b0:ba4:a871:27de with SMTP id
 a640c23a62f3a-ba4a8712a6fmr1416708966b.3.1777004086132; Thu, 23 Apr 2026
 21:14:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251127154832.137925-1-chenhuacai@loongson.cn>
 <20251127154832.137925-15-chenhuacai@loongson.cn> <20260423220647.GA3447678@ax162>
In-Reply-To: <20260423220647.GA3447678@ax162>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Fri, 24 Apr 2026 12:14:59 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4dYwWsW8UBLptvPxcvpA-AO5kpNub-DMrvM0h3b3DQsg@mail.gmail.com>
X-Gm-Features: AQROBzABApY0UnCcuUd_LX71gL_TNow8_IOits1wCME_0XTi5tvL7pvUIzxRODU
Message-ID: <CAAhV-H4dYwWsW8UBLptvPxcvpA-AO5kpNub-DMrvM0h3b3DQsg@mail.gmail.com>
Subject: Re: [PATCH V4 14/14] LoongArch: Adjust build infrastructure for 32BIT/64BIT
To: Nathan Chancellor <nathan@kernel.org>
Cc: Huacai Chen <chenhuacai@loongson.cn>, loongarch@lists.linux.dev, 
	Xuefeng Li <lixuefeng@loongson.cn>, Guo Ren <guoren@kernel.org>, 
	Xuerui Wang <kernel@xen0n.name>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
	linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Nathan,

On Fri, Apr 24, 2026 at 6:06=E2=80=AFAM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> Hi Huacai,
>
> Now that this is in -next as commit 3d9aba6618d1 ("LoongArch: Adjust
> build infrastructure for 32BIT/64BIT"), I am seeing two issues:
>
> On Thu, Nov 27, 2025 at 11:48:32PM +0800, Huacai Chen wrote:
> > Adjust build infrastructure (Kconfig, Makefile and ld scripts) to let
> > us enable both 32BIT/64BIT kernel build.
> ...
> > diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
> > index 730f34214519..4bacde9f46d1 100644
> > --- a/arch/loongarch/Kconfig
> > +++ b/arch/loongarch/Kconfig
> > +menu "Kernel type and options"
> > +
> > +choice
> > +     prompt "Kernel type"
> >
> >  config 32BIT
> > -     bool
> > +     bool "32-bit kernel"
> > +     help
> > +       Select this option if you want to build a 32-bit kernel.
> >
> >  config 64BIT
> > -     def_bool y
> > +     bool "64-bit kernel"
> > +     help
> > +       Select this option if you want to build a 64-bit kernel.
> > +
> > +endchoice
>
> The way this is written results in a 32-bit kernel when building
> ARCH=3Dloongarch allmodconfig or having a previously 64-bit configuration
> and running olddefconfig on it, which seems surprising to me. I think it
> would be good to either adjust the ordering such that 64BIT is first or
> include an explicit default statement like so:
>
> diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
> index 3b042dbb2c41..3addd06b3f5a 100644
> --- a/arch/loongarch/Kconfig
> +++ b/arch/loongarch/Kconfig
> @@ -220,6 +220,7 @@ menu "Kernel type and options"
>
>  choice
>         prompt "Kernel type"
> +       default 64BIT
>
>  config 32BIT
>         bool "32-bit kernel"
> --
Thank you for pointing out, since the code has been tagged, I will fix
it after 7.1-rc1 as soon as possible.

Huacai

>
> > diff --git a/arch/loongarch/Makefile b/arch/loongarch/Makefile
> > index 8d45b860fe56..47516aeea9d2 100644
> > --- a/arch/loongarch/Makefile
> > +++ b/arch/loongarch/Makefile
> ...
> > @@ -62,9 +66,19 @@ ifneq ($(SUBARCH),$(ARCH))
> >    endif
> >  endif
> >
> > +ifdef CONFIG_32BIT
> > +ifdef CONFIG_32BIT_STANDARD
> > +ld-emul                      =3D $(32bit-emul)
> > +cflags-y             +=3D -march=3Dla32v1.0 -mabi=3Dilp32s -mcmodel=3D=
normal
> > +else  # CONFIG_32BIT_REDUCED
> > +ld-emul                      =3D $(32bit-emul)
> > +cflags-y             +=3D -march=3Dla32rv1.0 -mabi=3Dilp32s -mcmodel=
=3Dnormal
> > +endif
> > +endif
>
> As a result of the above problem, I see
>
>   clang: error: ignoring '-mabi=3Dilp32s' as it conflicts with that impli=
ed by '-msoft-float' (lp64s) [-Werror,-Woption-ignored]
>   clang: error: ignoring '-mabi=3Dilp32s' as it conflicts with that impli=
ed by '-msoft-float' (lp64s) [-Werror,-Woption-ignored]
>   clang: error: ignoring '-mabi=3Dilp32s' as it conflicts with that impli=
ed by '-msoft-float' (lp64s) [-Werror,-Woption-ignored]
>
> when building configurations that I expected to be 64-bit but had been
> turned into 32-bit ones with LLVM. This was also reported by the test
> robot with allnoconfig.
>
>   https://lore.kernel.org/202604232041.ESJDwVG4-lkp@intel.com/
>
> Maybe some change is needed on the LLVM side?
>
> Cheers,
> Nathan
