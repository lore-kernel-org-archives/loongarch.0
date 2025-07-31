Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 695132206B2
	for <loongarch@lists.linux.dev>; Thu, 31 Jul 2025 09:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753954431; cv=none; b=oJP4IAW7SUcIIF70hKu+94ld+IpsvRwOkzoeP2Sd2xGbsQkTYd7z+A7r9RoSruso5kLWlfGWEaCgPHfMgZdA0h5S+fvvdzTAfT8SVGz8wjpMvW6tguKsAtFvBBAhydEl51SwRtXgTWeJ84DDiEdAD/sOC3S85ZkMW+/Tl8An+R4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753954431; c=relaxed/simple;
	bh=3Po5tHY8wyiv0YK9aucd+EfDUJHpZK5a1SS7q68vnLg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HJA4aId04sLJEqJH5yTqYNsA1+nVWp/nXnPhYGJQEWIHVnQ8LhXnqYShN95QR/GTBZSEwTJgLH13stoTeCawkB4NnlWJhpAzdd3NO+hcQmx8s+7wIzYsPsK9s+mzUUjbuixY7S2pHtjaIkgmMUQ9luNRGHIR+PhJ6o5T57Yr59w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OfUYCM0D; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OfUYCM0D"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F48AC4CEEF
	for <loongarch@lists.linux.dev>; Thu, 31 Jul 2025 09:33:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753954431;
	bh=3Po5tHY8wyiv0YK9aucd+EfDUJHpZK5a1SS7q68vnLg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=OfUYCM0DSsszsG3g9EODqft28MhI0bNcO4hBZR5UPovhaBWN0DJRFjpJb3L02S5Im
	 PWdY8c8rDe3NMv36Nw+gglz16AAEt2VtukfVgCC0enSlrCCuzoFuvxo+R+B/8WThiE
	 kx4MIMXDaDZM05vgKWs3txq7dHUdRtan7q5+JLyhgNbxkyiRbzB2vqz4LOenhjen4Y
	 QbC/vrBNcIBR2A6UHcY5igncji24fMMFWijGnwtgc/soZQgFfwkbLcaExCkX+ICyI1
	 l4NBzK6KjpFxG6zoZ0NdtbjhVdiLsT1ovu4CM9oatIRGIyRuhY3C9zMLfPL5i7f+dA
	 nvy+ByP0nnuew==
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-605b9488c28so320574a12.2
        for <loongarch@lists.linux.dev>; Thu, 31 Jul 2025 02:33:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU/L/w+3u7UkW5RMCNcRwb5/770cXrm53yG6IlGiz08RMtjTVYY4OR06yUwQ0welsU/KaiqNOhWOcA=@lists.linux.dev
X-Gm-Message-State: AOJu0YwHVEtfdWiuwlhxOg9RMmyUe3j62kdSxhAYUQbG3Odf9ZDL66MR
	nZF3Ag58ywjuz6hwBP4qLYXoYgJ563RHDoSWDSFpZD3aNxo5QYZ+w7RbtWIYLO8P+U35ncMF+nx
	BHs920Frshl8vXQhoXyd2Tr6EabLZr6E=
X-Google-Smtp-Source: AGHT+IFpmRkfc0sDZTQd2YRkLR11vNPRxlOCCU/3GXiQpX362B+CoYeol5yvnHniEzFD98M+WuD53WHNgOFZc330ozo=
X-Received: by 2002:aa7:d9cc:0:b0:615:4d3a:9330 with SMTP id
 4fb4d7f45d1cf-61586f1e61amr5714287a12.14.1753954429645; Thu, 31 Jul 2025
 02:33:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250731091109.16901-1-tiwai@suse.de> <20250731091109.16901-3-tiwai@suse.de>
In-Reply-To: <20250731091109.16901-3-tiwai@suse.de>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Thu, 31 Jul 2025 17:33:38 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6uDytXrsWv43uxNic9PH=ed1M3=29LTqCoYxzNdESkfw@mail.gmail.com>
X-Gm-Features: Ac12FXxenkxSHPDvVtvVV3LnqeNQPfWYDzIG90vtnWDotY17M1HmFmclI8OUeBA
Message-ID: <CAAhV-H6uDytXrsWv43uxNic9PH=ed1M3=29LTqCoYxzNdESkfw@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] LoongArch: Update HD-audio codec configs
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 31, 2025 at 5:11=E2=80=AFPM Takashi Iwai <tiwai@suse.de> wrote:
>
> The HD-audio codec driver configs have been updated again the drivers
> got split with different kconfigs.
I'm sorry for making noise, but is SND_HDA_INTEL_HDMI_SILENT_STREAM
needed for common use? If yes, I also prefer it be enabled.

Huacai

>
> Enable all Realtek HD-audio codecs and HDMI codecs (except for
> NVIDIA_MCP and TEGRA) per request.
>
> Fixes: 1d8dd982c409 ("ALSA: hda/realtek: Enable drivers as default")
> Fixes: 81231ad173d8 ("ALSA: hda/hdmi: Enable drivers as default")
> Cc: loongarch@lists.linux.dev
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> ---
> v1->v2: enable all Realtek codecs and most of HDMI codecs
>
> The changes are only in sound.git tree, so I'll pick up this there, too
>
>  arch/loongarch/configs/loongson3_defconfig | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>
> diff --git a/arch/loongarch/configs/loongson3_defconfig b/arch/loongarch/=
configs/loongson3_defconfig
> index 0d59af6007b7..7993020ffebb 100644
> --- a/arch/loongarch/configs/loongson3_defconfig
> +++ b/arch/loongarch/configs/loongson3_defconfig
> @@ -784,8 +784,23 @@ CONFIG_SND_HDA_HWDEP=3Dy
>  CONFIG_SND_HDA_INPUT_BEEP=3Dy
>  CONFIG_SND_HDA_PATCH_LOADER=3Dy
>  CONFIG_SND_HDA_CODEC_REALTEK=3Dy
> +CONFIG_SND_HDA_CODEC_REALTEK_LIB=3Dy
> +CONFIG_SND_HDA_CODEC_ALC260=3Dy
> +CONFIG_SND_HDA_CODEC_ALC262=3Dy
> +CONFIG_SND_HDA_CODEC_ALC268=3Dy
> +CONFIG_SND_HDA_CODEC_ALC269=3Dy
> +CONFIG_SND_HDA_CODEC_ALC662=3Dy
> +CONFIG_SND_HDA_CODEC_ALC680=3Dy
> +CONFIG_SND_HDA_CODEC_ALC861=3Dy
> +CONFIG_SND_HDA_CODEC_ALC861VD=3Dy
> +CONFIG_SND_HDA_CODEC_ALC880=3Dy
> +CONFIG_SND_HDA_CODEC_ALC882=3Dy
>  CONFIG_SND_HDA_CODEC_SIGMATEL=3Dy
>  CONFIG_SND_HDA_CODEC_HDMI=3Dy
> +CONFIG_SND_HDA_CODEC_HDMI_GENERIC=3Dy
> +CONFIG_SND_HDA_CODEC_HDMI_INTEL=3Dy
> +CONFIG_SND_HDA_CODEC_HDMI_ATI=3Dy
> +CONFIG_SND_HDA_CODEC_HDMI_NVIDIA=3Dy
>  CONFIG_SND_HDA_CODEC_CONEXANT=3Dy
>  CONFIG_SND_USB_AUDIO=3Dm
>  CONFIG_SND_SOC=3Dm
> --
> 2.50.1
>
>
