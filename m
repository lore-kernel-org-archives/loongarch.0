Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 567591D416C
	for <loongarch@lists.linux.dev>; Tue, 30 Dec 2025 12:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767097164; cv=none; b=ZoBPU5QydY7d+pvIPpCI7rkS4syT/eYNNNO3cEwwranzcWYPB70Cb/8iTD5x4AtMWlbKUT/2gqQRVLLQBNI2U3QARkUZ0A005Tp1PtI6bJ97rZmM9Lm+D8k7NXCczdKf+RKESX0ZrcC2/92Y8TAuq6vpFDDcKsV99Jh1BstOlVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767097164; c=relaxed/simple;
	bh=nhfwPQ9e2CqZ2JKjiXTX4moFXzbX/jsKuob1Go9PGjs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K/52E5UjP9tBe+0ZFNZhdOHz7I6ekW/LAl2IKmrZHixzTqHgQOweLLZdkaybiYMAclgnBlYHZwStDH9HOlVAIV7qtKXB+upangU8KEcA73LyL7MsO9xGA+OUGhpU/jk2uLKMzLxlK5UUXOFIV1TAqE063ZYmOdy/4ib+gKGgp90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tv87ezLq; arc=none smtp.client-ip=209.85.167.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tv87ezLq"
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-44fe6771b2dso1998778b6e.1
        for <loongarch@lists.linux.dev>; Tue, 30 Dec 2025 04:19:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767097162; x=1767701962; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+zm1V7Ylb3g5dQMqWZaN8eaEl3ucvxWTQFCsivAGs+8=;
        b=Tv87ezLqinSRTCh4dYshGJ0IRlD+dVCMEARy3HYAgib3ZJhXvgEEeJgxVnl9CI+TiP
         cqwBYLyxkg2RgmNce5vpn//XdIEDsU0AhE73Nu/fXiiSvYAMtaALjmY3IysgdBH3YtXE
         FCw35XySZfQUefYGOLMMPrrZ6yXJuYjrUVdIOiI72sX1Vqd7l3M5WS4aRRVMMxRRbra2
         X131yTTiuxjnLFUFdBHF6rc806jG5IYY8SihaqLMtj4bKCKdsG+2ia6ayGf+HaG2UxSY
         snucORAVRciEQf1mAWYPf2d7EwnRxsZSquyTeUX+ttBUUdvkj5+ZtrCrkSpufijIR6En
         +4mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767097162; x=1767701962;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+zm1V7Ylb3g5dQMqWZaN8eaEl3ucvxWTQFCsivAGs+8=;
        b=gIS+dQnoWCm26dXlE4YnG4ChPcyog/pCgStO8F7fG8NRuJ9mxiev+/4YpJcAqQzZXe
         DW6eic8ILsdZIo5GQMFRO1PRuJnAK+wfQJaT/f1D0ucDBiBVeSbycDTHYAJO02mq0X3g
         snFOfL5p8Yb0ZB1A+yjEYwzUoLf1JqerHAwVIj7Vh4KLhGsjxp4GI1opHxH8BsInnjRR
         1kCvK1P/bxOR38fDCgedrAR17Nq3uYICvzZYuWMUxp5xqx2Bg6eipHHE/eKE6LBeUSxp
         58nGGg9Lmi+vDFqKV4CCHxdh5qBmbC7Enh9SDgH86pLmHXefxIXYZnBxfoO5nzopK3tm
         VTmA==
X-Forwarded-Encrypted: i=1; AJvYcCXqpl6AXzdd9cpf28tcaoRcrnnkeU6gOs7XjhgiVd/WTv1r5USMIe3cKMHlgRylvTVi1jAH618/nV4=@lists.linux.dev
X-Gm-Message-State: AOJu0YzK67iiGVnYHet71InV2y1yVu7heXl5c6km+mT4v7X+3wRoJpyf
	l5w4QPbDNoMGHxbQZ4RTO+tTmJuiqyK8K26WBQn0ssHEWDugqJvyXsSr6rmaDLBqkNyhmLDT8+1
	luhC2/2N9QO2sTR2JQP3ujAnL+xTeg3w=
X-Gm-Gg: AY/fxX51bS+UlHKD8MazF9ixLt2WQkLAzCoDLI0mMBlboAeeKMIVJSHLBn99/FCZHhM
	jFX4m8uH7zndokcvyLyHpa0Y+oMHnNmv45tFDMLqPY0cCOegCUB0+9NlLGdxAOx2fTnVoORPQWT
	xrK4s6vh8qMvxNhrS7tvJYm6oUtPvT9I2pIniplaaTdtiFmE+6qnamxHX9V+RaQZV/n34F7Ti4p
	VhlNwDnHNLnF8vt8BH5Klw3YUb7C8uldEtzXhN3fJ+/mBwmAkW3EHfoaoYpKtkqMDvqKvNWw4Fu
	2uhEvJo=
X-Google-Smtp-Source: AGHT+IGsBYeU/QBGFyB0HZg1F0L2gE77cijxxeDtJR0yfgrhBqgHjcIhmWI0EPzCqFcbZuZfYyAX4lHbd88XeiPb4lc=
X-Received: by 2002:a05:6808:4fe0:b0:450:cb51:a55c with SMTP id
 5614622812f47-457b22272f7mr14693818b6e.65.1767097162205; Tue, 30 Dec 2025
 04:19:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAEyhmHT1gRtGCiM7C6QmrF38xxzc2OLKgiNRWd0whpSSJoyrjg@mail.gmail.com>
 <20251230013417.37393-1-dongtai.guo@linux.dev> <20251230013417.37393-5-dongtai.guo@linux.dev>
In-Reply-To: <20251230013417.37393-5-dongtai.guo@linux.dev>
From: Hengqi Chen <hengqi.chen@gmail.com>
Date: Tue, 30 Dec 2025 20:19:11 +0800
X-Gm-Features: AQt7F2ojCTwv0Tyw04COXc6rglVdbBe9OjspeZqgDLbeNtCMq0I9Ejhkj_aAMqE
Message-ID: <CAEyhmHR=gzyBbMYQb=sUyF5Ms7VyrhB2esqfxLddfUrBVy1FRg@mail.gmail.com>
Subject: Re: [PATCH v7 loongarch-next 4/4] LoongArch: Enable 128-bit atomics
 cmpxchg support
To: George Guo <dongtai.guo@linux.dev>
Cc: chenhuacai@kernel.org, guodongtai@kylinos.cn, kernel@xen0n.name, 
	lianyangyang@kylinos.cn, linux-kernel@vger.kernel.org, 
	loongarch@lists.linux.dev, r@hev.cc, xry111@xry111.site
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 30, 2025 at 9:34=E2=80=AFAM George Guo <dongtai.guo@linux.dev> =
wrote:
>
> From: George Guo <guodongtai@kylinos.cn>
>
> Add select HAVE_CMPXCHG_DOUBLE and select HAVE_ALIGNED_STRUCT_PAGE in Kco=
nfig
> to enable 128-bit atomic cmpxchg support on LoongArch.
>
> Signed-off-by: George Guo <guodongtai@kylinos.cn>
> ---
>  arch/loongarch/Kconfig | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
> index 730f34214519..d4de823276d1 100644
> --- a/arch/loongarch/Kconfig
> +++ b/arch/loongarch/Kconfig
> @@ -114,6 +114,7 @@ config LOONGARCH
>         select GENERIC_TIME_VSYSCALL
>         select GPIOLIB
>         select HAS_IOPORT
> +       select HAVE_ALIGNED_STRUCT_PAGE
>         select HAVE_ARCH_AUDITSYSCALL
>         select HAVE_ARCH_BITREVERSE
>         select HAVE_ARCH_JUMP_LABEL
> @@ -141,6 +142,7 @@ config LOONGARCH
>         select HAVE_DYNAMIC_FTRACE_WITH_DIRECT_CALLS
>         select HAVE_DYNAMIC_FTRACE_WITH_REGS
>         select HAVE_EBPF_JIT
> +       select HAVE_CMPXCHG_DOUBLE
>         select HAVE_EFFICIENT_UNALIGNED_ACCESS if !ARCH_STRICT_ALIGN
>         select HAVE_EXIT_THREAD
>         select HAVE_GENERIC_TIF_BITS
> --

Keep the list sorted ?

> 2.49.0
>
