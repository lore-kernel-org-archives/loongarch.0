Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E3462F37
	for <loongarch@lists.linux.dev>; Wed, 31 Jul 2024 01:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722388031; cv=none; b=N1h0elXe1BLXdQYhOqmjQhTb5hTYqhvqrCZBk73mTkh3CW6xdN0s248JiVMBx0Nnf/vMYyS/RgbUzY+PA1OtK6kzEe1dniaSOIuPdEiSxP2fy7UJfWOyd8JP4ErrbY0GYXTT9YUYYOpvXRTjqGpj8jvUI/QhXMMNrxmwa5oXlgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722388031; c=relaxed/simple;
	bh=3cf8/IH5fWGwrqkVCPFgrihHd1rSTimzC3dmsm9znkM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ugv1zdhUjk4bTgkf4BIOFN4zx2uk3VOKkeGMi45FY++QebteuSDrhjDNDRfzmM/aOOta/CpW9KEciHU2wj2GRqg/Tf19wY/NLpeJOAC6WPAu0FyRM+LQuvqfJa8LMA0dltr1B1QaI8Ek6Iz7pu0C+EhvO1G1S707km2m4l94BuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iFdOm1eQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iFdOm1eQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E642AC4AF09
	for <loongarch@lists.linux.dev>; Wed, 31 Jul 2024 01:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722388030;
	bh=3cf8/IH5fWGwrqkVCPFgrihHd1rSTimzC3dmsm9znkM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=iFdOm1eQ75RevPThHY9FJqeD3Dal4N8G4X9T0Njc+U3OW2rx4tSMnN++a9vUwWIkd
	 FS3Mc39rvZML8fojyB49FL/BcPT2vlOu2RxoOWl5Iyz+OoC2Yk636oPevY2rrKRoo3
	 NoNi5Qx938pkqoEdmVGwOQhEQ6wbcFqtOjnB+fxtixsvJrT6UHGKuvKxEQTYkUH8C3
	 Sd35PBunMECVlcKO8eHaZy2XPkLzpgec/LK7FRU8t4I+JLs3/7eMUgsCCIYoo0JwjA
	 ATzv0CP3aDcreoTlzy19gHPyAwWu0cV4zoZCXwUyOjqFH/WoVhJO8L7ZEL4cLS9XuM
	 Jfj4hqmfeVwaA==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-52f0277daa5so8261272e87.0
        for <loongarch@lists.linux.dev>; Tue, 30 Jul 2024 18:07:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUzNz6tyCySfoXxM0T6XkkEAuYjPswN/9ilztU4V0mQWTQ7JKW/FLr1JxVGX/Nurzs7MP/JT3mufsFcgG1SrT0iv6PMWMjLxslt
X-Gm-Message-State: AOJu0Yza9VSYk9ASXOGhd0bjZnlVjfQ1lFaDgWDAaswd+unZoqzuZCa2
	WfOMmKPbdc/4tXyAysJYTXxfz2pgffRgWBs0u7UraQ/XDHpuG/fwl4M5J3Tg66VYbXdDDxnXrlc
	R9hwYkF3Tzqb9PtoZsLpFfc5NNWs=
X-Google-Smtp-Source: AGHT+IHF9qiOBkLVHOBVQ0wBgnDJBl3ec+j6xf3HzIGYOYuR6kUP4Bkwr/OxInWm0jP/KwMmsivWFFjm3VrtLIAFPoM=
X-Received: by 2002:ac2:4888:0:b0:52c:90b6:170f with SMTP id
 2adb3069b0e04-5309b27b023mr9631322e87.29.1722388029241; Tue, 30 Jul 2024
 18:07:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAAhV-H6vXEaJf9NO9Lqh0xKoFAehtOOOLQVO4j5v+_tD7oKEXQ@mail.gmail.com>
 <20240730022542.3553255-1-chenhuacai@loongson.cn> <2024073059-hamstring-verbalize-91df@gregkh>
In-Reply-To: <2024073059-hamstring-verbalize-91df@gregkh>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Wed, 31 Jul 2024 09:06:56 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7W-Ygn6tXySrip4k3P5xVbVf7GpjOzjXfQvCCbA4r5Wg@mail.gmail.com>
Message-ID: <CAAhV-H7W-Ygn6tXySrip4k3P5xVbVf7GpjOzjXfQvCCbA4r5Wg@mail.gmail.com>
Subject: Re: [PATCH for-stable] LoongArch: Define __ARCH_WANT_NEW_STAT in unistd.h
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Huacai Chen <chenhuacai@loongson.cn>, loongarch@lists.linux.dev, 
	Sasha Levin <sashal@kernel.org>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 30, 2024 at 10:24=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Tue, Jul 30, 2024 at 10:25:42AM +0800, Huacai Chen wrote:
> > Chromium sandbox apparently wants to deny statx [1] so it could properl=
y
> > inspect arguments after the sandboxed process later falls back to fstat=
.
> > Because there's currently not a "fd-only" version of statx, so that the
> > sandbox has no way to ensure the path argument is empty without being
> > able to peek into the sandboxed process's memory. For architectures abl=
e
> > to do newfstatat though, glibc falls back to newfstatat after getting
> > -ENOSYS for statx, then the respective SIGSYS handler [2] takes care of
> > inspecting the path argument, transforming allowed newfstatat's into
> > fstat instead which is allowed and has the same type of return value.
> >
> > But, as LoongArch is the first architecture to not have fstat nor
> > newfstatat, the LoongArch glibc does not attempt falling back at all
> > when it gets -ENOSYS for statx -- and you see the problem there!
> >
> > Actually, back when the LoongArch port was under review, people were
> > aware of the same problem with sandboxing clone3 [3], so clone was
> > eventually kept. Unfortunately it seemed at that time no one had notice=
d
> > statx, so besides restoring fstat/newfstatat to LoongArch uapi (and
> > postponing the problem further), it seems inevitable that we would need
> > to tackle seccomp deep argument inspection.
> >
> > However, this is obviously a decision that shouldn't be taken lightly,
> > so we just restore fstat/newfstatat by defining __ARCH_WANT_NEW_STAT
> > in unistd.h. This is the simplest solution for now, and so we hope the
> > community will tackle the long-standing problem of seccomp deep argumen=
t
> > inspection in the future [4][5].
> >
> > More infomation please reading this thread [6].
> >
> > [1] https://chromium-review.googlesource.com/c/chromium/src/+/2823150
> > [2] https://chromium.googlesource.com/chromium/src/sandbox/+/c085b51940=
bd/linux/seccomp-bpf-helpers/sigsys_handlers.cc#355
> > [3] https://lore.kernel.org/linux-arch/20220511211231.GG7074@brightrain=
.aerifal.cx/
> > [4] https://lwn.net/Articles/799557/
> > [5] https://lpc.events/event/4/contributions/560/attachments/397/640/de=
ep-arg-inspection.pdf
> > [6] https://lore.kernel.org/loongarch/20240226-granit-seilschaft-eccc24=
33014d@brauner/T/#t
> >
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
> > ---
> >  arch/loongarch/include/uapi/asm/unistd.h | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/arch/loongarch/include/uapi/asm/unistd.h b/arch/loongarch/=
include/uapi/asm/unistd.h
> > index fcb668984f03..b344b1f91715 100644
> > --- a/arch/loongarch/include/uapi/asm/unistd.h
> > +++ b/arch/loongarch/include/uapi/asm/unistd.h
> > @@ -1,4 +1,5 @@
> >  /* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
> > +#define __ARCH_WANT_NEW_STAT
> >  #define __ARCH_WANT_SYS_CLONE
> >  #define __ARCH_WANT_SYS_CLONE3
> >
> > --
> > 2.43.5
> >
> >
>
> What kernel branch(s) is this for?
For 6.1~6.10.

Huacai
>
> thanks,
>
> greg k-h
