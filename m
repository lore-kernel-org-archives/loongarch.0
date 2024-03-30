Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C93129D06
	for <loongarch@lists.linux.dev>; Sat, 30 Mar 2024 13:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711807198; cv=none; b=g1X7yDjoIlpTvrB9dgS8G6BORg3CuP6amwgy8DvYz9+a+pErKuVpqekd4cI1cnZANfv0BmTVbYFPVnv4Sem2Do2LDvWfVof6Qs8yNoXFOdbwT1SLd0WDRI1dB56dwFjbkMEMoA/GTWOs7/3532BpA70OqnKhC2pPbQkNLW9GhgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711807198; c=relaxed/simple;
	bh=FGD97a2BLDJE4wXb5b/jxGrqNvSwEG6LTQPxYP1fNkQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QkEBfeOCD2IrhWTXhcJgvgPmwPDHc4AVfbas1FJk4u1rQNTczN4qyJyybRClcL++KwZ9fGazMj8pAgSAjfJMugeGcjCYIhE96jkgpowa7OApI8bI7fwGO4OEW6N/SV8ULb5F5+JF/DjAGhn399UVCSmgUWcKrLIwMT8ZIBRgf8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vl8F1+0G; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vl8F1+0G"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E984C433F1
	for <loongarch@lists.linux.dev>; Sat, 30 Mar 2024 13:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711807198;
	bh=FGD97a2BLDJE4wXb5b/jxGrqNvSwEG6LTQPxYP1fNkQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Vl8F1+0G66SuOSa0IW5EuQqh1sHWTEhu8p5uCySHbMMhanIpU9WGcRYZro87GsOi0
	 fW5I3bHSyNASIs9gHDTHdInBSI17sYC7w4x1lq8xxVwiFWZYRymZziMFeim3AIXwjr
	 XXTHeokxjMa0FMC23DKWe/UmDaqptQKoehC9kzYD63z+IVVhg1dEB0Y+gZ8AU1Nw0C
	 1bZR+4Maq9j99bXJDqNKBM34L6MnEwGH+L5efx9d8SzY3ohP+4AuMNBc9UMZQsyokU
	 yl4hCNk0C74QNCU+LykeGCBfBMqiqvddSRcs1N105u0+Kbh8vg1GRZF3NYuULDIUS7
	 8zslmdO9is0RA==
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a4e39f5030dso161407466b.0
        for <loongarch@lists.linux.dev>; Sat, 30 Mar 2024 06:59:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU4ccs7ZLpKM6LzKoeNT2ZlTrjXTeiGp43AVZwsEOsqMcwv/yrcZXf8jTsDeb/wBTnxTeHeHPK+c3nXK3fSYRCNGoVqWAxO7Lfz
X-Gm-Message-State: AOJu0Yx7WQihRVO7bJJpdnzKdV2mLLv8e3sCY64pvjdkUQrxADgssHq6
	63OR/82Afw9XwV33FWa+ZAq0TtRtGK80jUAMSun2DoJTn8HSZY2x2LINswUXzS/wIL03vxnwGTC
	T7Lejym0ikwvbWfNfysJFHfWe0Os=
X-Google-Smtp-Source: AGHT+IHc3m2uZv7lcnXrkX1wRtlEpjeE35rVhJUzINHtpYXXLFAaIbzPIfaS5VBxQZkz1jOW3uw1Ht4ocwxkRM0QZUg=
X-Received: by 2002:a17:906:48c6:b0:a4e:4bb2:2ab1 with SMTP id
 d6-20020a17090648c600b00a4e4bb22ab1mr1372473ejt.20.1711807196707; Sat, 30 Mar
 2024 06:59:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240329132825.1102459-1-bhe@redhat.com> <20240329132825.1102459-2-bhe@redhat.com>
In-Reply-To: <20240329132825.1102459-2-bhe@redhat.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sat, 30 Mar 2024 21:59:45 +0800
X-Gmail-Original-Message-ID: <CAAhV-H76-FOvcTXB_rW1B1wFthYK6txVtC+brfzk6nwOhar8iQ@mail.gmail.com>
Message-ID: <CAAhV-H76-FOvcTXB_rW1B1wFthYK6txVtC+brfzk6nwOhar8iQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] arch/loongarch: clean up the left code and Kconfig
 item related to CRASH_CORE
To: Baoquan He <bhe@redhat.com>
Cc: kexec@lists.infradead.org, akpm@linux-foundation.org, geert@linux-m68k.org, 
	WANG Xuerui <kernel@xen0n.name>, loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Queued, thanks.

Huacai

On Fri, Mar 29, 2024 at 9:28=E2=80=AFPM Baoquan He <bhe@redhat.com> wrote:
>
> In commit 85fcde402db1 ("kexec: split crashkernel reservation code
> out from crash_core.c"), crashkernel reservation code is split out from
> crash_core.c, and add CRASH_RESERVE to control it. And also rename each
> ARCH's <asm/crash_core.h> to <asm/crash_reserve.h> accordingly.
>
> But the relevant part in loongarch is missed. Do it now.
>
> Signed-off-by: Baoquan He <bhe@redhat.com>
> Cc: Huacai Chen <chenhuacai@kernel.org>
> Cc: WANG Xuerui <kernel@xen0n.name>
> Cc: loongarch@lists.linux.dev
> ---
>  arch/loongarch/Kconfig                                       | 2 +-
>  arch/loongarch/include/asm/{crash_core.h =3D> crash_reserve.h} | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
>  rename arch/loongarch/include/asm/{crash_core.h =3D> crash_reserve.h} (7=
5%)
>
> diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
> index a5f300ec6f28..54ad04dacdee 100644
> --- a/arch/loongarch/Kconfig
> +++ b/arch/loongarch/Kconfig
> @@ -595,7 +595,7 @@ config ARCH_SELECTS_CRASH_DUMP
>         select RELOCATABLE
>
>  config ARCH_HAS_GENERIC_CRASHKERNEL_RESERVATION
> -       def_bool CRASH_CORE
> +       def_bool CRASH_RESERVE
>
>  config RELOCATABLE
>         bool "Relocatable kernel"
> diff --git a/arch/loongarch/include/asm/crash_core.h b/arch/loongarch/inc=
lude/asm/crash_reserve.h
> similarity index 75%
> rename from arch/loongarch/include/asm/crash_core.h
> rename to arch/loongarch/include/asm/crash_reserve.h
> index 218bdbfa527b..a1d9b84b1c7d 100644
> --- a/arch/loongarch/include/asm/crash_core.h
> +++ b/arch/loongarch/include/asm/crash_reserve.h
> @@ -1,6 +1,6 @@
>  /* SPDX-License-Identifier: GPL-2.0-only */
> -#ifndef _LOONGARCH_CRASH_CORE_H
> -#define _LOONGARCH_CRASH_CORE_H
> +#ifndef _LOONGARCH_CRASH_RESERVE_H
> +#define _LOONGARCH_CRASH_RESERVE_H
>
>  #define CRASH_ALIGN                    SZ_2M
>
> --
> 2.41.0
>
