Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F0873FE4
	for <loongarch@lists.linux.dev>; Tue,  3 Jun 2025 04:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748923923; cv=none; b=D22HhxzyV6qlnDClwO+hlV55ZNffbYcnWzjtL7+eCqfd5tBGdflDgOQoNcB8Mje4XJO7dCwo13UnirGihTz7RL3qpfalMKp0rHhrosc7GMAY+ep9gqryragCzROk/dSaNBiLd85u86ImhVg23JI7+FInuOBEnP9ImZtVRVH/xLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748923923; c=relaxed/simple;
	bh=eH7LWOmmL1anId5z2wZhvvJt6A5G/MNr+wNHWrMB2So=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Vc97c6EijxhxRQBhnxmar7VmGAIjMW3IurcHJKj8Zm7xdLT7kyvbUcDOvpemfunvkhEZpUNNAOFdO4ei4lveHVBR1OOf6sFCWUIVvyPUH3uSBwHjqaR/AAkOO3tdv/d83oOmlOR/zLdC6hHPK24kUbovCAwWbxhe6HHrpZIJK8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oIAD1GwC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oIAD1GwC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC1EEC4CEF1
	for <loongarch@lists.linux.dev>; Tue,  3 Jun 2025 04:12:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748923923;
	bh=eH7LWOmmL1anId5z2wZhvvJt6A5G/MNr+wNHWrMB2So=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=oIAD1GwCe0ns8XL6NQEYJwQdtduWwCjz4+pCHwblh+fiWVoNKOTHiL+6pckFLKp17
	 AMC6w8lb0/qZ769t6XlvJq9ih9CC8l+nTa9ZbT5K0uZUl7A9lHMmOUL+ygi9kNSO/0
	 TkpCeKyTlYgxWN5CQMxoeRuDeW7HbgTqH0PdjrQ3WlizhfXSLFq+kOq6U78oR3voUJ
	 CpyhD1pHWHPVPoOEF9OwYwpvbUCvXgLDDLy6G9Tn8dODhtkhJ8ZllzMyKQR01Csbyr
	 2liVIWrT/7RNp2oIV1rt2Hc7icbVKT6fQGsN8uBAs/GyC2FNvkN2foH9k5w2mCcWfr
	 q7N4hV3KjKMpw==
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6020ff8d51dso8803989a12.2
        for <loongarch@lists.linux.dev>; Mon, 02 Jun 2025 21:12:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUfEA9LK0ZjAV3/6cG2aksJC9Sn+jlHIhrzrWtioG3Bcg12pVUm6E5GY/tKGmUkkfF4K42tT8L2BLY=@lists.linux.dev
X-Gm-Message-State: AOJu0YxRxjLLsYc3oISPiXTFU1lNEH9jQrOpKA9btYixUWh0pJPtbW+T
	WYGDP7xFpClAyfD5R7sWIBNqkrUtDWz1X/6PBSVTbYwxzYIdXBJ9tDo47AJBZILnPSGK+/MTRDd
	FVk3K5QvkkWw2mhI8xExHwpaaUbHpm1o=
X-Google-Smtp-Source: AGHT+IFC3hZdYHnSXCAINF0e85twNdshEaSayERpY7dehkXv4qNlJa5HjD+1EG/20i3L++8LHTZqVITFe/NbV6v/Xpw=
X-Received: by 2002:a05:6402:5112:b0:604:e602:77a5 with SMTP id
 4fb4d7f45d1cf-6056df4758fmr13815147a12.15.1748923921501; Mon, 02 Jun 2025
 21:12:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250531113851.21426-1-ziyao@disroot.org> <20250531113851.21426-2-ziyao@disroot.org>
In-Reply-To: <20250531113851.21426-2-ziyao@disroot.org>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Tue, 3 Jun 2025 12:11:48 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7pvaz5N0-EfvhDNHAXJtR13p9Xi5hfgDxOpeXi9zMbTQ@mail.gmail.com>
X-Gm-Features: AX0GCFvre-UhQqbT7tbRl4VbSXuk5rN06luar9i31Dym01mPU6UQN37YMzcM_AY
Message-ID: <CAAhV-H7pvaz5N0-EfvhDNHAXJtR13p9Xi5hfgDxOpeXi9zMbTQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] platform/loongarch: laptop: Get brightness setting
 from EC on probe
To: Yao Zi <ziyao@disroot.org>
Cc: Jianmin Lv <lvjianmin@loongson.cn>, WANG Xuerui <kernel@xen0n.name>, 
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, 
	Mingcong Bai <jeffbai@aosc.io>, Kexy Biscuit <kexybiscuit@aosc.io>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 31, 2025 at 7:39=E2=80=AFPM Yao Zi <ziyao@disroot.org> wrote:
>
> Previously 1 is unconditionally taken as current brightness value. This
> causes problems since it's required to restore brightness settings on
> resumption, and a value that doesn't match EC's state before suspension
> will cause surprising changes of screen brightness.
laptop_backlight_register() isn't called at resuming, so I think your
problem has nothing to do with suspend (S3).

But there is really a problem about hibernation (S4): the brightness
is 1 during booting, but when switching to the target kernel, the
brightness may jump to the old value.

If the above case is what you meet, please update the commit message.

Huacai

>
> Let's get brightness from EC and take it as the current brightness on
> probe of the laptop driver to avoid the surprising behavior. Tested on
> TongFang L860-T2 3A5000 laptop.
>
> Cc: stable@vger.kernel.org
> Fixes: 6246ed09111f ("LoongArch: Add ACPI-based generic laptop driver")
> Signed-off-by: Yao Zi <ziyao@disroot.org>
> ---
>  drivers/platform/loongarch/loongson-laptop.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/platform/loongarch/loongson-laptop.c b/drivers/platf=
orm/loongarch/loongson-laptop.c
> index 99203584949d..828bd62e3596 100644
> --- a/drivers/platform/loongarch/loongson-laptop.c
> +++ b/drivers/platform/loongarch/loongson-laptop.c
> @@ -392,7 +392,7 @@ static int laptop_backlight_register(void)
>         if (!acpi_evalf(hotkey_handle, &status, "ECLL", "d"))
>                 return -EIO;
>
> -       props.brightness =3D 1;
> +       props.brightness =3D ec_get_brightness();
>         props.max_brightness =3D status;
>         props.type =3D BACKLIGHT_PLATFORM;
>
> --
> 2.49.0
>
>
