Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0158526CE2D
	for <loongarch@lists.linux.dev>; Mon, 27 Apr 2026 08:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777278944; cv=none; b=FOSSJ/a7NfODZyzneigAKsFdjvU1nYgHxZ+EUqH6wEieGoC3QjyKGQEOyjiH/9UptKlNa7u5D07Cwv5n3N8okFGQL32eL1sHSuT5BliZL7QOTlEEPpKScEpOidiFmdNI/QG5ntFHgTcxEQmbQaqcf2WYIXUM4gBsRDhLq66tDho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777278944; c=relaxed/simple;
	bh=Zv+TO29QHFMwpQXCUDa54CnjJjHfs+jaGILg50uTD6k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AOk/6+iNuN67Km0tCoMjoGuhZndBYX+fjuj0n/y4VoaYy/pN6YoW8sPEegXe5GxJLEUHhve2jiLGMXVavjgF+BrtTh+W+IvlgHmavxnkiaUz/0YJTkGr/3ilJDApVCd17C/BufnL9md/kQ0d/qWKRgs/ZyfP4VkIjt5xCsRqskk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JDHqct81; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JDHqct81"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90588C2BCB4
	for <loongarch@lists.linux.dev>; Mon, 27 Apr 2026 08:35:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777278943;
	bh=Zv+TO29QHFMwpQXCUDa54CnjJjHfs+jaGILg50uTD6k=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=JDHqct81a0Su+ezG1QIxcYrckQXilQiz8wvFdO34WPS/qGMtGk4I39zHeCiwfH6Bv
	 sKrafirNcu0D7dInm8I3HB0E/mv73GaTscrXHBD5I7aSmlETYsay/QQ2/VVpJToLRF
	 ljfLkQodoA5WEK9JcDFykHJQEkpd46d6RQHP7O95tzX5dF9CgII2F9eArXXg9buL+F
	 c9Fg09IGkqS+lWRTCmGnqzuvPjzvvddkS3xd0d7+WjaIuFYKdFEVMgGghdoMIcKLl+
	 Y1yx0QhFhePaKvZEnumu3HjWKhyIhknBA3+ir7QwMtYtexoq/4pDOF5y62khJ8QI/N
	 zgHTyV+2eQdaQ==
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b9c745e18a0so1696090166b.1
        for <loongarch@lists.linux.dev>; Mon, 27 Apr 2026 01:35:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+15+34TrfdK2q4UPxymyoxGSqbbb9Sj32SLh6euNJMOL3co3blHCTzQgs04Kvi0L98/w3HKvmr9kw=@lists.linux.dev
X-Gm-Message-State: AOJu0YwbRYr9kByxNV0U2roWw/h2Hvdmz6H0lOSEo7ItCpqVTlEXqgFk
	BCGVCdfGGaUflPx87AaBBA0CovrUyS8cLMmpEyNgSQSwFFikl8xTdQWjbGoHaigyFaDWfMCg4/A
	KL6p0J+V7NboAW9/n8oQvzaTzd4nHbLo=
X-Received: by 2002:a17:907:6d08:b0:ba2:5314:f979 with SMTP id
 a640c23a62f3a-ba42140793bmr1848583566b.6.1777278942094; Mon, 27 Apr 2026
 01:35:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260422-vdso-loongarch-cleanup-v1-1-1fef08f07614@linutronix.de>
In-Reply-To: <20260422-vdso-loongarch-cleanup-v1-1-1fef08f07614@linutronix.de>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Mon, 27 Apr 2026 16:35:56 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4DP-kTKxbPwfP_mmX7kqmvNZFA5dT2s2YcMPkKeEkn=A@mail.gmail.com>
X-Gm-Features: AVHnY4LucrCaCluBMek6ff3jqwjBLMQvQB4VJw7qsuiKrPvgqNILZjlsUCQdDao
Message-ID: <CAAhV-H4DP-kTKxbPwfP_mmX7kqmvNZFA5dT2s2YcMPkKeEkn=A@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: vDSO: Drop custom __arch_vdso_hres_capable()
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: WANG Xuerui <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Applied, thanks.

Huacai

On Wed, Apr 22, 2026 at 3:45=E2=80=AFPM Thomas Wei=C3=9Fschuh
<thomas.weissschuh@linutronix.de> wrote:
>
> The custom definition is identical to the generic fallback one.
>
> Remove it.
>
> Signed-off-by: Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutronix.de>
> ---
>  arch/loongarch/include/asm/vdso/gettimeofday.h | 6 ------
>  1 file changed, 6 deletions(-)
>
> diff --git a/arch/loongarch/include/asm/vdso/gettimeofday.h b/arch/loonga=
rch/include/asm/vdso/gettimeofday.h
> index bae76767c693..18ba403e1ed9 100644
> --- a/arch/loongarch/include/asm/vdso/gettimeofday.h
> +++ b/arch/loongarch/include/asm/vdso/gettimeofday.h
> @@ -85,12 +85,6 @@ static __always_inline u64 __arch_get_hw_counter(s32 c=
lock_mode,
>         return count;
>  }
>
> -static inline bool loongarch_vdso_hres_capable(void)
> -{
> -       return true;
> -}
> -#define __arch_vdso_hres_capable loongarch_vdso_hres_capable
> -
>  #endif /* CONFIG_GENERIC_GETTIMEOFDAY */
>
>  #endif /* !__ASSEMBLER__ */
>
> ---
> base-commit: 6596a02b207886e9e00bb0161c7fd59fea53c081
> change-id: 20260422-vdso-loongarch-cleanup-d16e07e92422
>
> Best regards,
> --
> Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutronix.de>
>
>
