Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D09762571BA
	for <loongarch@lists.linux.dev>; Tue, 15 Apr 2025 20:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744749989; cv=none; b=m5q/nC24412OCGmcQhh7OHGP3pqSlX9N3ZxNifqBKgJxE9JzhzfD9nD7Bfmn2YDeKIH7cUOlu24Mxpl1qDjuWE4bWTwZf7vLg0nVJeKBRPHaHhaW82fskgXLNq6w747otLirlXXgxxLBHfgL2hRIXhdxEDNsXV+UU4+XvWhvqiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744749989; c=relaxed/simple;
	bh=TygAyc8ZcamwcaK7R4ldaqjD/sb+gNyDwakhRjNo3Oo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TUSKYUdKCf5lTg0a3MEMHJrp8zNZNyID6En+NJoNp8JWqRKeqve4O+fRSwao1vVvDzk2OspLLH+6AEJ1TCCgv77u5DmCluKUaNscLoBFEwB02+AYohnS8eTM0T4k8Ca4ZOOSJXFp3p1v3rS/vDnHvFuGkjcAnIBqNn0aDW4NZfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=MkAVMyzM; arc=none smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="MkAVMyzM"
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-72b938f6014so356178a34.3
        for <loongarch@lists.linux.dev>; Tue, 15 Apr 2025 13:46:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1744749987; x=1745354787; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xe9yiz5hRk6Ih7N2Ac32P9e4ZYaPgsUiw3u3c/ePwGs=;
        b=MkAVMyzMqRGb/oe/HF0akr+GSG8oGiaSwkxrA/sAeT1KgGtokE6yxmh6JvJ0b9GAQk
         rh/v10felge42Mtbvm7fe9e7PSko6QLsEBgi3n//pwnEzbImAj9HddxXruDboTuH2Jmb
         Ic2FtW8R984Oe6GxxfzrIONbqqPMJXO5Wo4mQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744749987; x=1745354787;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xe9yiz5hRk6Ih7N2Ac32P9e4ZYaPgsUiw3u3c/ePwGs=;
        b=wsNQcXL5pz/n9Ol9xazjeX97rp0jWlbZnvIMiXeyYfKLhzcLvmkAnx+yUAcfP8Mpfw
         4P5aYho5MF9mvB62LnNwcFtOmf/lWZ/qEFvYogZIvRF2twdG7JA831DjsyVISMJ/xtHf
         pY0GFMyK94FaYBZCSkywjBJydrKoI52BAaok2/Qq/f9QbpzzkvNEF/0giNlS2nImZKHd
         gM0ypV9IR0ezIu4GC5giJ2yG9TXP/9SMvPfWGO3qSzYICUicbN8En0S7RpFDmfmTrZ3u
         gpDzqgi6av2uFSpTCP7dV7dIsbjN4v/DI7kye1mTa5KQZiMtId45gbVBV3bAq2t8M20Z
         qwcQ==
X-Forwarded-Encrypted: i=1; AJvYcCWz32TPbF+pBUYTOkMke4SjUY9OSPIge/V6zQ/rLA5WgRNH03MeVvlcxYd3NZLEAkYHJkqTzd6K330=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzsu+innr5rTrnQYHg6EsoHfWUcy/70gTVHygA/fz/5ydCoint0
	jCowA/Pvz9YGktVvCrjIAjFk3BdPDUTcCtM4vifzDd/79Di7zn31hO9otGL8cKdrUa+QU8FbUPQ
	mQkdeUe1PL8ztqOG15neutcARWozgxIaGJYVm
X-Gm-Gg: ASbGnctwdokxcfxMRh9Pm9EA7TTwcIA7srYFmbP4+YBXVB0Mlwg+OU7nYfxt17lGkm/
	lICXL984o1AEr14bq/i4OGECHvzXTvbRTKXTom4ziRtY70q9uSX5MAJJJMKhAlgd6wU2Dn/CUxX
	fP5vH89U3Nf+B968IvRXLpVeIV6ae1jwGNYfwcCw+IulM4eBPDDw==
X-Google-Smtp-Source: AGHT+IF1laZWfAr2YIqlDARR+3dKjqHrGIZm755fOrYIwd7mc6DGetjqrkzit1gFufVSqqgi3FL0ISL0YLiHKXN9uFo=
X-Received: by 2002:a05:6808:1582:b0:3f4:210e:c0f2 with SMTP id
 5614622812f47-400acc3f649mr216633b6e.0.1744749986835; Tue, 15 Apr 2025
 13:46:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <648AB3031B5618C0+20250415153903.570662-1-wangyuli@uniontech.com>
In-Reply-To: <648AB3031B5618C0+20250415153903.570662-1-wangyuli@uniontech.com>
From: Jeff Xu <jeffxu@chromium.org>
Date: Tue, 15 Apr 2025 13:46:14 -0700
X-Gm-Features: ATxdqUEmIxsEAScvJDNIReMH4unvMuy3JinsyoEKeBkvV32K_0n2IQ9VdZ-tyfo
Message-ID: <CABi2SkV2v-48Mhn9qLzx08KatToWMpgc63HAWn8RKe8Y8HXWPA@mail.gmail.com>
Subject: Re: [PATCH v2] mseal sysmap: enable LoongArch
To: WangYuli <wangyuli@uniontech.com>
Cc: corbet@lwn.net, chenhuacai@kernel.org, kernel@xen0n.name, 
	akpm@linux-foundation.org, lorenzo.stoakes@oracle.com, 
	Liam.Howlett@oracle.com, kees@kernel.org, hca@linux.ibm.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	loongarch@lists.linux.dev, xry111@xry111.site, tglx@linutronix.de, 
	thomas.weissschuh@linutronix.de, Jason@zx2c4.com, zhanjun@uniontech.com, 
	niecheng1@uniontech.com, guanwentao@uniontech.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Yuli

On Tue, Apr 15, 2025 at 8:40=E2=80=AFAM WangYuli <wangyuli@uniontech.com> w=
rote:
>
> Provide support for CONFIG_MSEAL_SYSTEM_MAPPINGS on LoongArch,
> covering the vdso.
>
> Link: https://lore.kernel.org/all/25bad37f-273e-4626-999c-e1890be96182@lu=
cifer.local/
> Tested-by: Yuli Wang <wangyuli@uniontech.com>
> Signed-off-by: Yuli Wang <wangyuli@uniontech.com>
> ---
> Changelog:
>  *v1->v2: Modify mseal_sys_mappings/arch-support.txt.
> ---
>  .../features/core/mseal_sys_mappings/arch-support.txt         | 2 +-
>  Documentation/userspace-api/mseal.rst                         | 2 +-
>  arch/loongarch/Kconfig                                        | 1 +
>  arch/loongarch/kernel/vdso.c                                  | 4 +++-
>  4 files changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/Documentation/features/core/mseal_sys_mappings/arch-support.=
txt b/Documentation/features/core/mseal_sys_mappings/arch-support.txt
> index c6cab9760d57..a3c24233eb9b 100644
> --- a/Documentation/features/core/mseal_sys_mappings/arch-support.txt
> +++ b/Documentation/features/core/mseal_sys_mappings/arch-support.txt
> @@ -12,7 +12,7 @@
>      |       arm64: |  ok  |
>      |        csky: |  N/A |
>      |     hexagon: |  N/A |
> -    |   loongarch: | TODO |
> +    |   loongarch: |  ok  |
>      |        m68k: |  N/A |
>      |  microblaze: |  N/A |
>      |        mips: | TODO |
> diff --git a/Documentation/userspace-api/mseal.rst b/Documentation/usersp=
ace-api/mseal.rst
> index 1dabfc29be0d..ef733f69003d 100644
> --- a/Documentation/userspace-api/mseal.rst
> +++ b/Documentation/userspace-api/mseal.rst
> @@ -144,7 +144,7 @@ Use cases
>    architecture.
>
>    The following architectures currently support this feature: x86-64, ar=
m64,
> -  and s390.
> +  loongarch and s390.
>
>    WARNING: This feature breaks programs which rely on relocating
>    or unmapping system mappings. Known broken software at the time
> diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
> index 067c0b994648..54ed5b59a690 100644
> --- a/arch/loongarch/Kconfig
> +++ b/arch/loongarch/Kconfig
> @@ -69,6 +69,7 @@ config LOONGARCH
>         select ARCH_SUPPORTS_INT128 if CC_HAS_INT128
>         select ARCH_SUPPORTS_LTO_CLANG
>         select ARCH_SUPPORTS_LTO_CLANG_THIN
> +       select ARCH_SUPPORTS_MSEAL_SYSTEM_MAPPINGS
>         select ARCH_SUPPORTS_NUMA_BALANCING
>         select ARCH_SUPPORTS_RT
>         select ARCH_USE_BUILTIN_BSWAP
> diff --git a/arch/loongarch/kernel/vdso.c b/arch/loongarch/kernel/vdso.c
> index 10cf1608c7b3..7b888d9085a0 100644
> --- a/arch/loongarch/kernel/vdso.c
> +++ b/arch/loongarch/kernel/vdso.c
> @@ -105,7 +105,9 @@ int arch_setup_additional_pages(struct linux_binprm *=
bprm, int uses_interp)
>
>         vdso_addr =3D data_addr + VVAR_SIZE;
>         vma =3D _install_special_mapping(mm, vdso_addr, info->size,
> -                                      VM_READ | VM_EXEC | VM_MAYREAD | V=
M_MAYWRITE | VM_MAYEXEC,
> +                                      VM_READ | VM_EXEC |
> +                                      VM_MAYREAD | VM_MAYWRITE | VM_MAYE=
XEC |
> +                                      VM_SEALED_SYSMAP,
>                                        &info->code_mapping);
>         if (IS_ERR(vma)) {
>                 ret =3D PTR_ERR(vma);
> --
> 2.49.0
>
LGTM, thank you for taking care of the documentation as well.

Reviewed-by: Jeff Xu <jeffxu@chromium.org>
