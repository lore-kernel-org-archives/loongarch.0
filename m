Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F164710F5
	for <loongarch@lists.linux.dev>; Tue,  8 Aug 2023 07:16:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62A55C433CA
	for <loongarch@lists.linux.dev>; Tue,  8 Aug 2023 07:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691478991;
	bh=up16RXyyZBwP5yRPc98CmAEJ6Vw7daUD5jnAUW1A1nk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=dPc9u2+ftIntBXeQ/G/iFz0OZh8fmLeuLRkaF//kyCJHdfaajjTiK/RgnVodt/UAG
	 TG1WZM5OLN49O62f8BWr9cSL4JGcuPetiMjieC3YKC3I57XX419PaAKyOyHZl5sCav
	 i7dQMt8j0vgt3lZeibl9ukRpYdKcFBrEFIR5oZTYhZLxvm31q5X7kbTEozEhz62HKf
	 X9oIYR7R721H64UK14DYt5IqrbLRGSj9I4nqkmhPfTZ4leWXEsdUuVZy50bpePhLLa
	 LcKaTcVEN8cXJ8AQFmMgYSM9hrt3T/fJB12EqY6Pargk3t8odJ+gQH6up66PfzsGgb
	 B/agY/uavwrrw==
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-51e28cac164so13365396a12.1
        for <loongarch@lists.linux.dev>; Tue, 08 Aug 2023 00:16:31 -0700 (PDT)
X-Gm-Message-State: AOJu0Yz4htMeIwGQ6Idg69Q2Ga5xvmFCCsEN9TTTL6wv8T7edlBjBR3d
	bWw3dhvoBCkGwBKol+aLcdqoknNIertT9EAdVVI=
X-Google-Smtp-Source: AGHT+IG6Tq8NX0vBcna1c8tYYNYOuSSocyTGwpQCzh4u+BX6Zm9k5AscPm2jzl+rCgoDS6+AHYQW0/J+A23/8I41/qI=
X-Received: by 2002:a05:6402:5249:b0:51e:588b:20ca with SMTP id
 t9-20020a056402524900b0051e588b20camr10774580edd.8.1691478989598; Tue, 08 Aug
 2023 00:16:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230808034836.418485-1-xry111@xry111.site>
In-Reply-To: <20230808034836.418485-1-xry111@xry111.site>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Tue, 8 Aug 2023 15:16:17 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5=FJqx3FcR71LXuMB51PBAKXMO-t7DqJj_dr2BD-JtZw@mail.gmail.com>
Message-ID: <CAAhV-H5=FJqx3FcR71LXuMB51PBAKXMO-t7DqJj_dr2BD-JtZw@mail.gmail.com>
Subject: Re: [PATCH] loongarch: Remove spurious "source drivers/firmware/Kconfig"
To: Xi Ruoyao <xry111@xry111.site>
Cc: loongarch@lists.linux.dev, WANG Xuerui <kernel@xen0n.name>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Ruoyao,

I think the title should be "LoongArch: Remove redundant "source
drivers/firmware/Kconfig""?

Huacai

On Tue, Aug 8, 2023 at 11:49=E2=80=AFAM Xi Ruoyao <xry111@xry111.site> wrot=
e:
>
> In drivers/Kconfig, drivers/firmware/Kconfig is sourced for all ports so
> there is no need to source it in the port-specific Kconfig file.  And
> sourcing it here also caused the "Firmware Drivers" menu appeared two
> times: once in the "Device Drivers" menu, another time in the toplevel
> menu.  This was really puzzling.
>
> Signed-off-by: Xi Ruoyao <xry111@xry111.site>
> ---
>  arch/loongarch/Kconfig | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
> index e71d5bf2cee0..465759f6b0ed 100644
> --- a/arch/loongarch/Kconfig
> +++ b/arch/loongarch/Kconfig
> @@ -662,5 +662,3 @@ source "kernel/power/Kconfig"
>  source "drivers/acpi/Kconfig"
>
>  endmenu
> -
> -source "drivers/firmware/Kconfig"
> --
> 2.41.0
>
