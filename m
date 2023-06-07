Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E85C8F47
	for <loongarch@lists.linux.dev>; Wed,  7 Jun 2023 09:27:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02735C4339B
	for <loongarch@lists.linux.dev>; Wed,  7 Jun 2023 09:27:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686130053;
	bh=S4N84Q/XuKxvguEVlL08Ccbl7qNQPElJBwjg19W/h3o=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=mrtMmwqSeJbOgCKBOaa8URlgbeoYQYXN8UhkrxVffqNt6nDAr0dPfEPSr5Ot5PO2v
	 LTjE855EauyATXa2+J6tk+qAchzTtK1qO6mHYlmLGlzAnRQLY6kXk61T1Uz35+SNku
	 /WXjrJvgJb1sz1cVmckANC2aa2vZcskZK4SDJSpynq5mQxcsSvhwH84lHW8CxlqajZ
	 USee+saso+eseb8M3A6RQ+SoXGYbLEmqLatRAXansVXH854LVBYX1jvXbIozlaYZwR
	 SCOAWFTEz97hwgKZQRBxxQKLwnmCnoIJOKuRWX9fNOH+VYJQ8kt4ijf53wx3moYq7g
	 boxUZOP3AeLOg==
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5147f7d045bso889118a12.2
        for <loongarch@lists.linux.dev>; Wed, 07 Jun 2023 02:27:32 -0700 (PDT)
X-Gm-Message-State: AC+VfDxADSQ4ZohiW6JES8D3VSYA3uSQ8L4efuAkbS0EKx1He1jhFt56
	syyqeYs9k0wAoNDUR9KgAjRd5xAbUzb0xCeY5Dg=
X-Google-Smtp-Source: ACHHUZ6Bjf1fTZHehrmL/0J7KIp5KJgCHQLXcP99ZoQHK0JdBwWTlD0SrnO3Wkcd3zEsyblyQohw5HIAdV+g29Gixe4=
X-Received: by 2002:a17:907:1c9e:b0:974:20bd:6e15 with SMTP id
 nb30-20020a1709071c9e00b0097420bd6e15mr6406408ejc.4.1686130051016; Wed, 07
 Jun 2023 02:27:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1686128807.git.siyanteng@loongson.cn>
In-Reply-To: <cover.1686128807.git.siyanteng@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Wed, 7 Jun 2023 17:27:19 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4imFk2tmz+kCRBEiD+ka08nKKhvhepWFhovhVNnoA49g@mail.gmail.com>
Message-ID: <CAAhV-H4imFk2tmz+kCRBEiD+ka08nKKhvhepWFhovhVNnoA49g@mail.gmail.com>
Subject: Re: [PATCH RESEND v3 0/4] Add Loongson HD Audio support
To: Yanteng Si <siyanteng@loongson.cn>
Cc: tiwai@suse.com, perex@perex.cz, chenhuacai@loongson.cn, 
	alsa-devel@alsa-project.org, loongarch@lists.linux.dev, 
	loongson-kernel@lists.loongnix.cn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Acked-by: Huacai Chen <chenhuacai@loongson.cn>

On Wed, Jun 7, 2023 at 5:22=E2=80=AFPM Yanteng Si <siyanteng@loongson.cn> w=
rote:
>
> v3:
> * Adding some comments.
> * Seting polling_mode flag.
>
> v2:
> * Handling with two new flags added to struct hdac_bus.
>
> v1:
> * The Loongson HDA controller is compatible with High Definition Audio
>   Specification Revision 1.0a.
>   See <https://loongson.github.io/LoongArch-Documentation/Loongson-
>   7A1000-usermanual-EN.html#hda-controller>
>
> Yanteng Si (4):
>   ALSA: hda: Add Loongson LS7A HD-Audio support
>   ALSA: hda: Using polling mode for loongson controller by default
>   ALSA: hda: Workaround for SDnCTL register on loongson
>   ALSA: hda/intel: Workaround for WALLCLK register for loongson
>     controller
>
>  include/linux/pci_ids.h     |  3 +++
>  include/sound/hdaudio.h     |  2 ++
>  sound/hda/hdac_controller.c |  5 ++++-
>  sound/hda/hdac_device.c     |  1 +
>  sound/hda/hdac_stream.c     |  6 +++++-
>  sound/pci/hda/hda_intel.c   | 20 ++++++++++++++++++++
>  sound/pci/hda/patch_hdmi.c  |  1 +
>  7 files changed, 36 insertions(+), 2 deletions(-)
>
> --
> 2.31.4
>
>
