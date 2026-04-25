Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 969525C613
	for <loongarch@lists.linux.dev>; Sat, 25 Apr 2026 02:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777084177; cv=pass; b=fUyhaziRemgLAQTblK3xV9Irtcbi7btCI+vB/qvL5s6nJYR8Be4EYhM22+Bf/AJvBj41wZSKvT22OHsdhe0tFi3OptlNqz9hP8RsAycT+daVLen+XHPmSECYnNsyKivNCMnm9GGNOxBtOokYmajfCNypMomvAlTbeIgeKI9BMAk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777084177; c=relaxed/simple;
	bh=K0hgOLYR+G/1h5LE347oaBuXCQeCYRvaFXiI0aZn+sw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u5a40imMsDHipOHIULsKopK5+/hgKHYuLX04kNuOlZidf3yJg0RAlPza8FyZWRSe+OM3CIXD7oPvtNAURIcgR4er1gtrGZ1GpNUvtIw+LW0k2c31Ry0+IKQZ065fp+HotBFFJ2mDQC2V6q/lzSNWeItYe4IL2eu1SoW3Jt1TQ+Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hev.cc; spf=pass smtp.mailfrom=hev.cc; dkim=pass (2048-bit key) header.d=hev-cc.20251104.gappssmtp.com header.i=@hev-cc.20251104.gappssmtp.com header.b=U/gCM06n; arc=pass smtp.client-ip=74.125.224.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hev.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hev.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hev-cc.20251104.gappssmtp.com header.i=@hev-cc.20251104.gappssmtp.com header.b="U/gCM06n"
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-64eb84d1e37so6830550d50.2
        for <loongarch@lists.linux.dev>; Fri, 24 Apr 2026 19:29:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777084175; cv=none;
        d=google.com; s=arc-20240605;
        b=lSo0senoejxWfPZy5jikAs6IHjvnd6qGEsJY+7qGBIHosPva5Uq9DjYFVdqDKh5Yfk
         6SxkcCMLNDeBsV/JtSIMVIWXt0bq6vOJaV7QiUWiWEPhsnVOabMNJ937YpJy5Kilj98q
         UmBKjSu9hPcdkzdwOSicz4sodfoCPsOTu+r1XMiPgzlVkW71xcHf1CE5LTlEKxxYxrjn
         2Ke9eRUo0cQWOsZhav9hmtrHRjNkAphc4NipRRmaoTcai4f16Nv78WZi23a7X/PCCmSH
         s5Ra0/JlbqAIxaXxe0Wy4yd0GYDpeJ52rYpXuxfufFPsGkBuTIZ3zxTShVsvPrqDJ8zw
         uVXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aa1YDovK16d9cr7YC1EI5xCZ4/bFM0nFmVqYQCSI3j4=;
        fh=hJIhMGX5KeJLtVQTDfXa0dDY09HwltnT4/+3/2PENTI=;
        b=M8Y1QpZRfIhOd9veA7S8jGZogOUgEZO7xvEnMPVBvpyjjFu5zq8m0pX+f3o04+ufpx
         BGBF4A4BrJ3bFqaUcEqVpOVZxON2dECRCfJgc+JUZMA3n+Ei6nXzzRf8k4fFvsAG5Wo1
         G/hgreiKtK8nJNUVYmIf2n3/FTBbQsDfz0UcNoswjGRxnOdK7iTepq+q1O6PiNSWnbk8
         F2Y9GF8jXfJVEpMKWMwcvLGAZ8DLmXjQYgPUf/CE9hybQUv43DtJT2SuogVDm1jH/LRw
         ErZr8htkyd6Ua2X6Sj15bRSVCod1XwuLSfbx52KkOrOmNFL+S+A7gStSCbtHql7cN9eH
         3iXQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hev-cc.20251104.gappssmtp.com; s=20251104; t=1777084175; x=1777688975; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aa1YDovK16d9cr7YC1EI5xCZ4/bFM0nFmVqYQCSI3j4=;
        b=U/gCM06nIMDWP3S/KFmd2HuiGLM0LyW8P8urWGoc8/2AenCM9cyQhr2HPXKWZG/V/t
         dtayn5vAIxFekJZuCwGL6bC9SbRhCpMjlCo4kkxRsKarLrPmSPvLEKxI7+YchVmlKZUw
         cfz/3xgzGTTNd50uJu3QRaMtLBMPeF8IbpcxWmbEhsfs7DQAwF4TbTWDYmIDVWDH9OUy
         kCE+U1oYU4S5xdKrR9L10HBRk/NhvcT4KOO0St1uNn+Tspk3J14Rs/JyoDQtdc2j/HJn
         nSrMA9t4/VHvvR6Vgn9PZxTYtLRv4hBl5XwPRJWUSWoi9E2gybrtkddE+Yu/6EqtjF2y
         EhiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777084175; x=1777688975;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aa1YDovK16d9cr7YC1EI5xCZ4/bFM0nFmVqYQCSI3j4=;
        b=nlm8r14FbrlZF/dlNiMuz/XIjZmX3wXRTTTkOtaCRFiH5Zq/aVU9tb1DgjoP6VByAf
         XfBVYTE/HW47DwjJf9qYHmkWt1E9YAVtCfD8/KSCfDrXTPCg5M4OGg0bTcsNaNlBonPB
         Ze6W39x+0Tls393iw37gxQc8ZPF7a6p/DfqlL+fz+bRS+IAk+uCLTBhIfSF71flYfBwA
         XEtFWjOu4rDtANnDvg+gVS8TtrNmip3scqV0f20n9IvDU4HVfvrxFcZJ21HZRR0xv7og
         8mRmlfajyEd3iqMqBwrgX7XI879puBUwE+fKfHZp9yvrfY6RgzkQd9SLbMV1JIhkcI5N
         VE5w==
X-Forwarded-Encrypted: i=1; AFNElJ/8Qgt82OWPSj+aRFVs6mN/S93BnP6gRtdzTMuCLcjC27RXVAbCvCQmXcsHGN3r0ctk+PC9UOHbLZQ=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz9Ah/zDb5h8gp8tqb0zz07VzsjAR83WuoplSeZCP3lKlCtpGBX
	UdcYwzClxBK3Z+knwK4y49LLPGc/q+YX5C03xgiWD8zqsesLLbXlBx0plAycj74ByPj3tU15+fw
	I2azMVd6QBd7Bnx/0+uyxfDlT54JkmBgELnCJJVsDBQ==
X-Gm-Gg: AeBDievzSelOvtBGCndqed9YxhVcg8fhMG+ct67KWZcWsyFtBti92n+C8k4s+Gw+t5u
	BsxFzQpbfgxQgK5Eu/S8Nueh29mycLlFM5pTZ7s5pbOV0zUYVqn/uyQ+zAJH7YonCsIm8g4e/l2
	rkCQ3isYXQBXcBFZYL0m6XZDo14JgGbxvzQOjLrPaOTmrMtAuxM+XiGpRUrwjuKVqCAM4CJiHx3
	46rBJGq/GcoV2x3RH3byS+F29Eaa8W/ssx7R8qf3fXQ6c0YaTYQlsVSvfECNccDym/jQlVrTXHc
	haVkqUQIMAuyf3xX15YdQEJ6BnYerH0R74ow+HlcDzNHoqFXgK/d
X-Received: by 2002:a05:690c:e4ee:b0:7ba:f922:b820 with SMTP id
 00721157ae682-7baf922be5fmr213316597b3.35.1777084174623; Fri, 24 Apr 2026
 19:29:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260423220647.GA3447678@ax162> <20260424110624.48510-1-r@hev.cc> <20260424181951.GA813908@ax162>
In-Reply-To: <20260424181951.GA813908@ax162>
From: hev <r@hev.cc>
Date: Sat, 25 Apr 2026 10:29:23 +0800
X-Gm-Features: AQROBzCxr7wVFIE6VaBwjyz-6qqw7AWfxtVEkOulHTQF9cFF_P5bjISZUFXXwK8
Message-ID: <CAHirt9gG-qbL7sANAxQN5WERtuLhQ7QzUnh=-+m6-wnFA0PnsA@mail.gmail.com>
Subject: Re: [PATCH V4 14/14] LoongArch: Adjust build infrastructure for 32BIT/64BIT
To: Nathan Chancellor <nathan@kernel.org>
Cc: arnd@arndb.de, chenhuacai@kernel.org, chenhuacai@loongson.cn, 
	guoren@kernel.org, jiaxun.yang@flygoat.com, kernel@xen0n.name, 
	linux-kernel@vger.kernel.org, lixuefeng@loongson.cn, 
	loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Nathan,

On Sat, Apr 25, 2026 at 2:19=E2=80=AFAM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> Hi Rui,
>
> On Fri, Apr 24, 2026 at 07:06:23PM +0800, WANG Rui wrote:
> > > As a result of the above problem, I see
> > >
> > >   clang: error: ignoring '-mabi=3Dilp32s' as it conflicts with that i=
mplied by '-msoft-float' (lp64s) [-Werror,-Woption-ignored]
> > >   clang: error: ignoring '-mabi=3Dilp32s' as it conflicts with that i=
mplied by '-msoft-float' (lp64s) [-Werror,-Woption-ignored]
> > >   clang: error: ignoring '-mabi=3Dilp32s' as it conflicts with that i=
mplied by '-msoft-float' (lp64s) [-Werror,-Woption-ignored]
> > >
> > > when building configurations that I expected to be 64-bit but had bee=
n
> > > turned into 32-bit ones with LLVM. This was also reported by the test
> > > robot with allnoconfig.
> > >
> > >   https://lore.kernel.org/202604232041.ESJDwVG4-lkp@intel.com/
> > >
> > > Maybe some change is needed on the LLVM side?
> >
> > The root cause is that scripts/Makefile.clang unconditionally sets
> > CLANG_TARGET_FLAGS_loongarch to loongarch64-linux-gnusf.
> > However, Clang with --target=3Dloongarch64 does not support a 32-bit AB=
I.
> > LLVM clearly separates loongarch32 and loongarch64 targets.
> >
> > Since CLANG_TARGET_FLAGS gets initialized before CONFIG is available, t=
he
> > current setup effectively assumes that a 64-bit target must also handle
> > a 32-bit ABI. That assumption may not hold for LLVM, which models 32-bi=
t
> > and 64-bit LoongArch as separate targets.
>
> Hmmm, okay, that definitely explains it. As the comment at the top of
> scripts/Makefile.clang states, we rely on targets supporting switching
> their word size via '-m32' / '-m64' so that we can use a 64-bit triple
> but still get a 32-bit one if necessary. For example:
>
>   --target=3Dx86_64-linux-gnu -m32
>
> effectively becomes
>
>   --target=3Di386-linux-gnu
>
> It seems like this works for LoongArch in clang as well?
>
> diff --git a/arch/loongarch/Makefile b/arch/loongarch/Makefile
> index 47516aeea9d2..2837004d0d75 100644
> --- a/arch/loongarch/Makefile
> +++ b/arch/loongarch/Makefile
> @@ -67,6 +67,9 @@ ifneq ($(SUBARCH),$(ARCH))
>  endif
>
>  ifdef CONFIG_32BIT
> +ifdef CONFIG_CC_IS_CLANG
> +cflags-y               +=3D -m32
> +endif
>  ifdef CONFIG_32BIT_STANDARD
>  ld-emul                        =3D $(32bit-emul)
>  cflags-y               +=3D -march=3Dla32v1.0 -mabi=3Dilp32s -mcmodel=3D=
normal
> diff --git a/arch/loongarch/vdso/Makefile b/arch/loongarch/vdso/Makefile
> index 42aa96249828..eeda13ecb711 100644
> --- a/arch/loongarch/vdso/Makefile
> +++ b/arch/loongarch/vdso/Makefile
> @@ -14,6 +14,7 @@ ccflags-vdso :=3D \
>         $(filter -E%,$(KBUILD_CFLAGS)) \
>         $(filter -march=3D%,$(KBUILD_CFLAGS)) \
>         $(filter -m%-float,$(KBUILD_CFLAGS)) \
> +       $(filter -m32,$(KBUILD_CFLAGS)) \
>         $(CLANG_FLAGS) \
>         -D__VDSO__
>
> --
>
> appears to do the right thing?
>
>   $ make -skj"$(nproc)" ARCH=3Dloongarch LLVM=3D1 mrproper loongarch32_de=
fconfig all
>
>   $ file vmlinux arch/loongarch/boot/vmlinux.efi
>   vmlinux:                         ELF 32-bit LSB executable, LoongArch, =
version 1 (SYSV), statically linked, BuildID[sha1]=3D26b4af26bb14c923270429=
f4ccdc66a519c059b1, not stripped
>   arch/loongarch/boot/vmlinux.efi: PE32+ executable for EFI (application)=
, LoongArch 32-bit (stripped to external PDB), 2 section
>

Ah, I see now that Clang already maps -m32/-m64 to the corresponding
triple variants in the common layer.

Thanks for the clarification!
Rui

> Cheers,
> Nathan
