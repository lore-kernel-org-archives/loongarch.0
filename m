Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEC0B1CBA18
	for <loongarch@lists.linux.dev>; Sun, 20 Jul 2025 08:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753001503; cv=none; b=qIy6BjiFeTgM7AlZqk8lVVrs6X3tOPnqiEYhdLL0XTGTrqpYbhBMOIEUUO0FptTuNnSHqOb4ifUOHG39OAa4iCINqvshAqZpskBP4FS1PBBJ7Td830XG41OMME1UhOSdnfzGL8+0OH1ExM9k9AEnxmHSHwQKZHxsuFRTr2w1Km4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753001503; c=relaxed/simple;
	bh=lp/52Ew8c83U99BdL7DDPH1gWntTrpLUrRWFOWIb3Go=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ex5jpAgxLGer1QN4w5T1RjgHu//3Sez4z85lcd5MzzMwYRVZn0leMzPElNqZ72x5IBNlNw1a0BoeuEZ1NWFbJPoqCqPoUAQy4V2fhmMd71R+9RsGvHClIvMoFx8MmyzBtlCdN95E17rJRI4tmpvc6Y15giEznAuAOjOUvMK83vE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tUDhlUF8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tUDhlUF8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE643C4CEE7
	for <loongarch@lists.linux.dev>; Sun, 20 Jul 2025 08:51:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753001502;
	bh=lp/52Ew8c83U99BdL7DDPH1gWntTrpLUrRWFOWIb3Go=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=tUDhlUF85e2PkPaMO3vy1r6Kzt1Ww9krVw9hOdFnwHmP9mszG70IxaXTYV5a/WGSu
	 Hr1Dcsg+9XWYRkM3UvIKkTFtzAOqKsU1fHQB8OVRKLfjk2YiDCUlBNhF5EvqZtFnyJ
	 Jwa1C7Ow90NaCdqdA88cWQnroqUkm0U+7uMSgEAyYiFsGschlKgoFoZCfI3p3Z5lxZ
	 XH0HeNqOrkDIcY5DNEt0dshfzpkkP/X2SGLrpmtygczxVut4X64VjUCI7fAID3PDVL
	 ZcHfz3opJzaOdePf47zlAyejl6flh+MtDgRyTyCQHI3y2/dHjJRFgY/yOtnTFCcoLR
	 Z6gq3Hh27R+2w==
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-60789b450ceso6552698a12.2
        for <loongarch@lists.linux.dev>; Sun, 20 Jul 2025 01:51:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU2/ETYy/wpUAicCEGAP8zoRMo0AEL6aoLdKExQKkZiA2H20SoLffIsUR1jdL95zzJsACKvjuUjyaI=@lists.linux.dev
X-Gm-Message-State: AOJu0YyMYkBNITxPVoe9r45KA5PDwol00yX8cZTElcXvMDvwglemx9Lk
	j1XfaRZUKiEUzxqrTZZN6drVa/qXN7cmv37b32+3DJHgqiA/fy0gNzIgB/+iHn7BfutUCNm+iFi
	ps5SLYba7tOuh/8EUpXChO3s+YeBqYss=
X-Google-Smtp-Source: AGHT+IG1iiYqOAYrelKBoHGblbNVG2qM2JF//hk3yGTkCqYIpuU6INM6nbhTSEPaHn7kLfBi+a8UbP+JDKFma/D59p0=
X-Received: by 2002:a05:6402:2789:b0:612:c846:cb67 with SMTP id
 4fb4d7f45d1cf-612c846d264mr7414925a12.6.1753001501336; Sun, 20 Jul 2025
 01:51:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250718-restricted-pointers-loongarch-v1-1-1462e779375f@linutronix.de>
In-Reply-To: <20250718-restricted-pointers-loongarch-v1-1-1462e779375f@linutronix.de>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sun, 20 Jul 2025 16:51:29 +0800
X-Gmail-Original-Message-ID: <CAAhV-H47h9H-22GQJ=bi7zthduTWA2_rLoVhS1xXe=Adk95B-Q@mail.gmail.com>
X-Gm-Features: Ac12FXxN6PKc8UZpJ_AiicsjcrSRH9aG7MxaKRGuTbQOE2FIKrSHe0tTyMnoLj0
Message-ID: <CAAhV-H47h9H-22GQJ=bi7zthduTWA2_rLoVhS1xXe=Adk95B-Q@mail.gmail.com>
Subject: Re: [PATCH] LoongArch/orc: Don't use %pK through printk
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: WANG Xuerui <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Applied, thanks.

Huacai

On Fri, Jul 18, 2025 at 9:36=E2=80=AFPM Thomas Wei=C3=9Fschuh
<thomas.weissschuh@linutronix.de> wrote:
>
> In the past %pK was preferable to %p as it would not leak raw pointer
> values into the kernel log.
> Since commit ad67b74d2469 ("printk: hash addresses printed with %p")
> the regular %p has been improved to avoid this issue.
> Furthermore, restricted pointers ("%pK") were never meant to be used
> through printk(). They can still unintentionally leak raw pointers or
> acquire sleeping locks in atomic contexts.
>
> Switch to the regular pointer formatting which is safer and
> easier to reason about.
>
> Signed-off-by: Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutronix.de>
> ---
>  arch/loongarch/kernel/unwind_orc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/loongarch/kernel/unwind_orc.c b/arch/loongarch/kernel/u=
nwind_orc.c
> index 0005be49b0569f28e0ee4a4f926f77562b14301b..0d5fa64a222522897df7f7c4b=
fbad8d2262a207e 100644
> --- a/arch/loongarch/kernel/unwind_orc.c
> +++ b/arch/loongarch/kernel/unwind_orc.c
> @@ -508,7 +508,7 @@ bool unwind_next_frame(struct unwind_state *state)
>
>         state->pc =3D bt_address(pc);
>         if (!state->pc) {
> -               pr_err("cannot find unwind pc at %pK\n", (void *)pc);
> +               pr_err("cannot find unwind pc at %p\n", (void *)pc);
>                 goto err;
>         }
>
>
> ---
> base-commit: d086c886ceb9f59dea6c3a9dae7eb89e780a20c9
> change-id: 20250718-restricted-pointers-loongarch-ecaa19f4d71c
>
> Best regards,
> --
> Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutronix.de>
>
