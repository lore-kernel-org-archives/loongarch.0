Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A27062C21DE
	for <loongarch@lists.linux.dev>; Sat,  6 Dec 2025 06:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765001265; cv=none; b=uApFfDMRbA2zI3IMDGN75NlbN6DAgIOU+f9Pbk9ObW7iH4XVFCtiXwSo7B2iX+GLK25IhT5fUDRSOJXi4E7JXWz/GuGbbQugXUqxz8ZtcwdcHFmHrTjM/NG0CtJLO0Ysd9rsLlbcuyknP89LfxxeqMVxR8K6vV78xcbqJFP+j5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765001265; c=relaxed/simple;
	bh=tGQglHScmycKEV/k+Nh77clbfHbHgUUhAw7of1k0Icw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j7Ak1bG8xPDuW94OIO2T+Uvivn25Z2EjG/y8KlC5iVVzNFakWIpUgnsfmwtReSR8Cwn9/BOH9tBPS5Jbkn8M36JusmoJEKud8ilAsDAQJq1sM0Usuq4rKssZVZKD13y7edRUmrVki6OAvjkdLY2n8fCLMU8npA/sR4WgsOdU+BI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KAY3ITup; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KAY3ITup"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53EBCC19422
	for <loongarch@lists.linux.dev>; Sat,  6 Dec 2025 06:07:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765001265;
	bh=tGQglHScmycKEV/k+Nh77clbfHbHgUUhAw7of1k0Icw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=KAY3ITupq+oQprTH4HibHvP2NtLU36zbf9Zm02Q0l7++sFVuD92KKfAPYJsivNxLg
	 cxOFDX8JylgrJg/0fUUEluXYg0gYlxTSQCxO0os0Gy/fr6XSuOhuzDHp4htzdILBIW
	 HA9EuoX6d+mMOEIQjqPvr1TpLWMfy5E5dEr/zmv3znragitN90HOCkEEqpYRLDOT17
	 N0p+3jfHQrzkLUiiRhuKGcWGrz+e8Q+0pGMS9oHJsGSBJKBPCKdWKBE6VVq8hD+vma
	 HRqnalZEzEzYmSDtUx1erwBfV7hdBx/PFfomOjqok2a5a5GniMZRgTxCgVJBuPQV/J
	 T3YxU2T99YxbA==
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-640a0812658so4917410a12.0
        for <loongarch@lists.linux.dev>; Fri, 05 Dec 2025 22:07:45 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXycJlLPPWPSzPvOcmmplzTdlBeNHLHYenZ4n/LfBEI4O+tZQIftjHSK5DMnstvXkJOjT2s9dWXfDM=@lists.linux.dev
X-Gm-Message-State: AOJu0YwWZxRJ2+Z7PUpeVs8YbFSxjHSgj5w97nLYm9DjAwjq98h384lY
	jIkuoam9Gxg+qKqAQvGRFi5i8tR9odiellm90dXuDZK0ndOf3f1sfA1uN0DvCXxjtg7bRGRIw+g
	GkEFwndTE8ycEMFdAhShqjK5UhJimuik=
X-Google-Smtp-Source: AGHT+IEucilbikih9FXT+bSBgeTMpSGSJQOynGkw1b2zU0SsUXaiCed8ZgqGkaYIGbD9I/0agUTUxk7lFsG4POZj914=
X-Received: by 2002:a05:6402:234b:b0:640:cea9:6752 with SMTP id
 4fb4d7f45d1cf-6491a8165c7mr1090196a12.25.1765001263854; Fri, 05 Dec 2025
 22:07:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251204024512.104519-1-wangyuli@aosc.io>
In-Reply-To: <20251204024512.104519-1-wangyuli@aosc.io>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sat, 6 Dec 2025 14:07:52 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5M_TA1=L1pqZxqb+3Kg0KbDK_hFNXKmUU50+Oi8qwAKg@mail.gmail.com>
X-Gm-Features: AQt7F2pl5VJSNCUdF7wlu7NKUDoWNYKIOg-LTd-BOEZ1JWX872BoRZQEVS3X-v8
Message-ID: <CAAhV-H5M_TA1=L1pqZxqb+3Kg0KbDK_hFNXKmUU50+Oi8qwAKg@mail.gmail.com>
Subject: Re: [PATCH v2] LoongArch: Use __pmd()/__pte() helper for swap entry conversions
To: WangYuli <wangyuli@aosc.io>
Cc: kernel@xen0n.name, akpm@linux-foundation.org, david@kernel.org, 
	willy@infradead.org, bjorn@rivosinc.com, agordeev@linux.ibm.com, 
	zhangtianyang@loongson.cn, apopple@nvidia.com, thuth@redhat.com, 
	linmag7@gmail.com, loongarch@lists.linux.dev, linux-kernel@vger.kernel.org, 
	WangYuli <wangyl5933@chinaunicom.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Applied, thanks.

Huacai

On Thu, Dec 4, 2025 at 10:45=E2=80=AFAM WangYuli <wangyuli@aosc.io> wrote:
>
> From: WangYuli <wangyl5933@chinaunicom.cn>
>
> The __pmd() and __pte() helper macros provide the correct initialization
> syntax and abstraction for the pmd_t and pte_t types.
>
> Fix follow warning on gcc-15 under specific configs [1] :
>
>   In file included from ./include/linux/pgtable.h:6,
>                    from ./include/linux/mm.h:31,
>                    from ./include/linux/pagemap.h:8,
>                    from arch/loongarch/mm/init.c:14:
>   ./include/linux/swapops.h: In function =E2=80=98swp_entry_to_pmd=E2=80=
=99:
>   ./arch/loongarch/include/asm/pgtable.h:302:34: error: missing braces ar=
ound initializer [-Werror=3Dmissing-braces]
>     302 | #define __swp_entry_to_pmd(x)   ((pmd_t) { (x).val | _PAGE_HUGE=
 })
>         |                                  ^
>   ./include/linux/swapops.h:559:16: note: in expansion of macro =E2=80=98=
__swp_entry_to_pmd=E2=80=99
>     559 |         return __swp_entry_to_pmd(arch_entry);
>         |                ^~~~~~~~~~~~~~~~~~
>   cc1: all warnings being treated as errors
>
> Also update __swp_entry_to_pte() to use __pte() for consistency.
>
> [1]. https://download.01.org/0day-ci/archive/20251119/202511190316.luI90k=
Ao-lkp@intel.com/config
>
> Signed-off-by: WangYuli <wangyl5933@chinaunicom.cn>
> Signed-off-by: WangYuli <wangyuli@aosc.io>
> ---
> Changelog:
>  *v1 -> v2: Update __swp_entry_to_pte() to use __pte() for consistency.
> ---
>  arch/loongarch/include/asm/pgtable.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/loongarch/include/asm/pgtable.h b/arch/loongarch/includ=
e/asm/pgtable.h
> index 03fb60432fde..9a7029285fd5 100644
> --- a/arch/loongarch/include/asm/pgtable.h
> +++ b/arch/loongarch/include/asm/pgtable.h
> @@ -297,9 +297,9 @@ static inline pte_t mk_swap_pte(unsigned long type, u=
nsigned long offset)
>  #define __swp_offset(x)                ((x).val >> 24)
>  #define __swp_entry(type, offset) ((swp_entry_t) { pte_val(mk_swap_pte((=
type), (offset))) })
>  #define __pte_to_swp_entry(pte) ((swp_entry_t) { pte_val(pte) })
> -#define __swp_entry_to_pte(x)  ((pte_t) { (x).val })
> +#define __swp_entry_to_pte(x)  __pte((x).val)
>  #define __pmd_to_swp_entry(pmd) ((swp_entry_t) { pmd_val(pmd) })
> -#define __swp_entry_to_pmd(x)  ((pmd_t) { (x).val | _PAGE_HUGE })
> +#define __swp_entry_to_pmd(x)  __pmd((x).val | _PAGE_HUGE)
>
>  static inline bool pte_swp_exclusive(pte_t pte)
>  {
> --
> 2.51.0
>
