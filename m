Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00C0B2EB5CD
	for <loongarch@lists.linux.dev>; Sat, 10 Jan 2026 04:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768018333; cv=none; b=d8bYSzqmT3NTp08pkAKwXeyfudwuUdcdO8iQMHhucv0bOjbD9vrII7XPVtsDtCxwosLh76hV03dZtespGcPnfAOVd4gvJFC7ixOsaJTrA4PQ8Gn4AzO2lJR2KUCc1Cs8KRqV3FQpOLgl8sxjuH37RKsgJVrp1rXbcSmQFBDnqUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768018333; c=relaxed/simple;
	bh=rBzWEbljwvTCEizK1MqNl/+DOvGlB/3FYxfpSB0shoE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HTgWmxpSLurzZdRUaFPZHTiQyJ3nW1NcQabvNSAvQFyAVK0BID/oIu6zhury4mXX3+xror5wPtJp4rvSvTrm6v1+JgLjaBr82bDeKhbCPrZB2LYgTZVNnsmvqNv3DiuHpdr9qHbsDbx+Sq/b+kJ1xTilGnl7YhNqDwSe0waYtIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B74DO9Tc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B74DO9Tc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78CC1C4AF09
	for <loongarch@lists.linux.dev>; Sat, 10 Jan 2026 04:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768018332;
	bh=rBzWEbljwvTCEizK1MqNl/+DOvGlB/3FYxfpSB0shoE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=B74DO9TcqMGa6E7oplCT8zBAgkExGom2tS8XAckAQsyLm7fPdIPgtYFy0bj5B96zi
	 OVTosDorBO5JZzvGI8BlxkcNemqLT+vYhaeATECBACtJvXK1bF/vvm17/N79h6Uckw
	 V4nipC2fFGk2jKUUbgPUKwRWxLvsjCMkL74shIYSkSfGBPhBMVgFKisPAysjR9RLgL
	 pKDi4TkJcw/ZOo0EXXb2b5eW4Ry7O2302Lw0ofI4K80VcFBDxTrPEMrPks41KBKG9G
	 c6R4s5kWOk0GO4wFKe5s+7CiAEW3fezu3J0mW5XTyRJak/U2Isyj8STL6ZaBHLeG0Y
	 okxj7vz+51IFA==
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b843e8a4fbfso587768766b.0
        for <loongarch@lists.linux.dev>; Fri, 09 Jan 2026 20:12:12 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUzpxUWH/vmb5UUfa2D5tZdn24iqLFUqod4hZDdpIka34uuHSzt6i3huILcywCvviN++2XXE8sk+zw=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyq6zvc0GOAS+rDRYFSRF01lKL2jxtlRsgQAY6rQWbcQ0HHVHHM
	O93ChoejspKKA76+K/7usHLlcmCffv4gA8S5H6m95nbXvaCr06z7FZ+U8zT6pYyUbg+k22I/RK7
	1SQ1giZz9j1KvIkunSJdslVCu+BxbrLo=
X-Google-Smtp-Source: AGHT+IHe8Rkshud/oO8HoRDF+vbdW27yvNAIRWLbuzQ4bqUqGlgK321WVKeVS3RVyrfL3sjZvqmMKBUG/e/A5rk5qws=
X-Received: by 2002:a17:906:6a06:b0:b70:af93:b32d with SMTP id
 a640c23a62f3a-b84453cb19dmr1331587766b.53.1768018331116; Fri, 09 Jan 2026
 20:12:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260105105514.76021-1-dongtai.guo@linux.dev> <20260105105514.76021-5-dongtai.guo@linux.dev>
In-Reply-To: <20260105105514.76021-5-dongtai.guo@linux.dev>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sat, 10 Jan 2026 12:12:03 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5ntZ2ztnapYyFshF0RpgTim99QzjJ7J_4zk3CO2ACx-Q@mail.gmail.com>
X-Gm-Features: AZwV_Qg-ableGQAwnwU73dI_LSnl2yQXoXFOrKVzDc-aNnCv4JuA4lcPRhHp9Bc
Message-ID: <CAAhV-H5ntZ2ztnapYyFshF0RpgTim99QzjJ7J_4zk3CO2ACx-Q@mail.gmail.com>
Subject: Re: [PATCH v9 loongarch-next 4/4] LoongArch: Enable 128-bit atomics
 cmpxchg support
To: George Guo <dongtai.guo@linux.dev>
Cc: hengqi.chen@gmail.com, kernel@xen0n.name, lianyangyang@kylinos.cn, 
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, r@hev.cc, 
	xry111@xry111.site, George Guo <guodongtai@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, George,

On Mon, Jan 5, 2026 at 6:55=E2=80=AFPM George Guo <dongtai.guo@linux.dev> w=
rote:
>
> From: George Guo <guodongtai@kylinos.cn>
>
> Add select HAVE_CMPXCHG_DOUBLE and select HAVE_ALIGNED_STRUCT_PAGE in Kco=
nfig
> to enable 128-bit atomic cmpxchg support on LoongArch.
Please squash this patch to Patch-3.


Huacai

>
> Reviewed-by: Hengqi Chen <hengqi.chen@gmail.com>
> Tested-by: Hengqi Chen <hengqi.chen@gmail.com>
> Signed-off-by: George Guo <guodongtai@kylinos.cn>
> ---
>  arch/loongarch/Kconfig | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
> index 730f34214519..f9845ebec1a4 100644
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
> @@ -130,6 +131,7 @@ config LOONGARCH
>         select HAVE_ARCH_TRANSPARENT_HUGEPAGE
>         select HAVE_ARCH_USERFAULTFD_MINOR if USERFAULTFD
>         select HAVE_ASM_MODVERSIONS
> +       select HAVE_CMPXCHG_DOUBLE
>         select HAVE_CONTEXT_TRACKING_USER
>         select HAVE_C_RECORDMCOUNT
>         select HAVE_DEBUG_KMEMLEAK
> --
> 2.43.0
>
>
