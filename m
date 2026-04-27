Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F26E3C4552
	for <loongarch@lists.linux.dev>; Mon, 27 Apr 2026 13:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777296470; cv=none; b=SwqmngzW3zNAdxeemQjWTV5UkI0RnruxJEL9DbiOdaUd0t3594rO72MtOdTBagnL8/wHktiBA0LXRHpgjWMDLG0k+onFMqTCVCcJW9roWjl77KbwgMJn4r9FV90/8tPc5F+l9TY6BcTMUqefgSOT5j4nwL0zvcmraX7TaVDom6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777296470; c=relaxed/simple;
	bh=DLmxgTriwxNwcATkPMX5dFaCZvwuGoaajoViR9idAiA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aO3agoKcZM4n31h1QGiiIW3+LLj0U0YFMMQWptI+9I9LpepWix6FWNZrassXvcOph4SBiaz1qYEoFdlXfPxlQweeOocsjl7phCtRi45mz7AhWBJfrgD/zNCVMdpzoffY7sMIwK7qRJsImfPo15/t888Fb9BcYSwyBNi5/9ZEjuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MsWOa6Dn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MsWOa6Dn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2B49C2BCB9
	for <loongarch@lists.linux.dev>; Mon, 27 Apr 2026 13:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777296469;
	bh=DLmxgTriwxNwcATkPMX5dFaCZvwuGoaajoViR9idAiA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=MsWOa6DnWbGQfxNnkKROZC03j51eZmHOYeG1jgmKhALVSaPnscQl6yzE5DHVoXIVi
	 wjqeUOFyE8+jG/uz7Cd49YGkIlMm9mXykzXF2uy439S4c0asEpOHf+bm5wyFP3Ox9c
	 yGdAQfEwOV+Gh1H5Q6bXu9qVotuIXCKmncMSfhXPtKx0+yYXtiskd1UQteEkKtxQXc
	 HpcQtpXoBlpC5tTp7qm3jRman1xdyWnwexZuH57qd674ITwXvlTGLnpWLmnbj4+txE
	 248dyNZ6fs5BdR9qRwn3xbiv7GR0+OT1ZqWxxmGcFGGXmY3xLc8VCt8b5ixVNfQG/r
	 QTQb8+SPuq8OA==
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b9c3e2cf3c0so1742645766b.1
        for <loongarch@lists.linux.dev>; Mon, 27 Apr 2026 06:27:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/UuPRHYn9slsS1SDI+Z/WxfdaSholN9uVVKwrSMB0duMaThbckEFSZfss667h7ES5JNgWxTu3NBJg=@lists.linux.dev
X-Gm-Message-State: AOJu0YxD8GFdtxxoyz+0yYhdiHuDpJhTnwtkd9rBUgUy8cODNjJLLu4N
	Ml8pWZkFtfhbRpW3GrEZIMwVrSUdOWeq8Z2SnHzTgQbUK0A1kNQombDegAoGaRj0rA0yJOSqTMD
	K8j/H+LH7+hNKoFcB4b2Pjs/KxVaUptM=
X-Received: by 2002:a17:907:960b:b0:bab:ae1f:d128 with SMTP id
 a640c23a62f3a-babae1ff4femr1038279966b.22.1777296468495; Mon, 27 Apr 2026
 06:27:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260427104721.47724-1-r@hev.cc> <20260427104721.47724-3-r@hev.cc>
In-Reply-To: <20260427104721.47724-3-r@hev.cc>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Mon, 27 Apr 2026 21:27:35 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4CTAZT9pChSqv_j+ZT9VXUmYh7FoBS9gKmP95BzdPB-A@mail.gmail.com>
X-Gm-Features: AVHnY4KTqif-03oVKvT8iQubjaHSyzpjDwF1z_DarSZ2f-SZ00YF1ayflsNyA_0
Message-ID: <CAAhV-H4CTAZT9pChSqv_j+ZT9VXUmYh7FoBS9gKmP95BzdPB-A@mail.gmail.com>
Subject: Re: [PATCH 2/3] efi/loongarch: Randomize kernel preferred address for KASLR
To: WANG Rui <r@hev.cc>
Cc: Ard Biesheuvel <ardb@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, loongarch@lists.linux.dev, 
	linux-efi@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Rui,

On Mon, Apr 27, 2026 at 6:47=E2=80=AFPM WANG Rui <r@hev.cc> wrote:
>
> Introduce efi_get_kimg_kaslr_address() to compute the preferred
> kernel image address dynamically when CONFIG_RANDOMIZE_BASE is
> enabled. The function derives a random offset using EFI-provided
> randomness combined with the timer value, and constrains it within
> CONFIG_RANDOMIZE_BASE_MAX_OFFSET.
>
> Update EFI_KIMG_PREFERRED_ADDRESS to call this helper so that the
> EFI stub can select a randomized load address when KASLR is active,
> while preserving the original base address behavior when KASLR is
> disabled or nokaslr is specified.
>
> Signed-off-by: WANG Rui <r@hev.cc>
> ---
>  arch/loongarch/Kconfig                   |  2 +-
>  arch/loongarch/include/asm/efi.h         |  4 +++-
>  drivers/firmware/efi/libstub/loongarch.c | 16 ++++++++++++++++
>  3 files changed, 20 insertions(+), 2 deletions(-)
>
> diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
> index 3b042dbb2c41..a5afb70f73d9 100644
> --- a/arch/loongarch/Kconfig
> +++ b/arch/loongarch/Kconfig
> @@ -730,7 +730,7 @@ config RANDOMIZE_BASE
>  config RANDOMIZE_BASE_MAX_OFFSET
>         hex "Maximum KASLR offset" if EXPERT
>         depends on RANDOMIZE_BASE
> -       range 0x0 0x10000000
> +       range 0x20000 0x10000000
Why modify this?

>         default "0x01000000"
>         help
>           When KASLR is active, this provides the maximum offset that wil=
l
> diff --git a/arch/loongarch/include/asm/efi.h b/arch/loongarch/include/as=
m/efi.h
> index eddc8e79b3fa..f831320efd41 100644
> --- a/arch/loongarch/include/asm/efi.h
> +++ b/arch/loongarch/include/asm/efi.h
> @@ -30,6 +30,8 @@ static inline unsigned long efi_get_kimg_min_align(void=
)
>         return SZ_2M;
>  }
>
> -#define EFI_KIMG_PREFERRED_ADDRESS     PHYSADDR(VMLINUX_LOAD_ADDRESS)
> +unsigned long efi_get_kimg_kaslr_address(void);
> +
> +#define EFI_KIMG_PREFERRED_ADDRESS     efi_get_kimg_kaslr_address()
Can we reuse something in drivers/firmware/efi/libstub/kaslr.c?

>
>  #endif /* _ASM_LOONGARCH_EFI_H */
> diff --git a/drivers/firmware/efi/libstub/loongarch.c b/drivers/firmware/=
efi/libstub/loongarch.c
> index 9825f5218137..df67ef8c68ab 100644
> --- a/drivers/firmware/efi/libstub/loongarch.c
> +++ b/drivers/firmware/efi/libstub/loongarch.c
> @@ -38,6 +38,22 @@ static efi_status_t exit_boot_func(struct efi_boot_mem=
map *map, void *priv)
>         return EFI_SUCCESS;
>  }
>
> +unsigned long efi_get_kimg_kaslr_address(void)
> +{
> +       unsigned int random_offset =3D 0;
> +
> +#ifdef CONFIG_RANDOMIZE_BASE
> +       if (!efi_nokaslr) {
> +               efi_get_random_bytes(sizeof(random_offset), (u8 *)&random=
_offset);
> +               random_offset ^=3D (rdtime_l() << 16);
Use get_cycles() then the first patch can be dropped.

Huacai

> +               random_offset &=3D (CONFIG_RANDOMIZE_BASE_MAX_OFFSET - SZ=
_64K - 1);
> +               random_offset =3D ALIGN(random_offset, SZ_64K) + SZ_64K;
> +       }
> +#endif
> +
> +       return PHYSADDR(VMLINUX_LOAD_ADDRESS) + random_offset;
> +}
> +
>  unsigned long __weak kernel_entry_address(unsigned long kernel_addr,
>                 efi_loaded_image_t *image)
>  {
> --
> 2.54.0
>
