Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6FC236AE6
	for <loongarch@lists.linux.dev>; Mon,  9 Oct 2023 15:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YJGiEP+w"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96D49C433C7
	for <loongarch@lists.linux.dev>; Mon,  9 Oct 2023 15:16:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696864605;
	bh=gyjT+k3AHCiRmdkHp4cLqbLW9JDEEgp8ck+rIXkHvJQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=YJGiEP+weJoUqeSv3oPzBGav0eFeFLFN82uF7EZyUcIhjA1EyjtYEuvkTlDrGhT0u
	 /V6nqwJvEQiqK7quVzb9Mqx6BtYpts9uQj3DVjcVXHHivYIhQ8ORfVnqzTdkWRU/v3
	 wRVA8NX3ZkKN/h5XCbjRIjaE1hm1JmzPLBMtM4y2Gk9/cEEB1mNGHUHod+l4SFMh87
	 ENpghqeBL286Kg9eUYfedeZX8BZqcVmxCDaPAm36D7+yzAV2vClCWTidtcI5CjIMGr
	 Iaf2JFtfAf0CPD/R07NCGZNx8VciV8lRbmV+YXEK/ywMrYBtVO7HWBOJg77NV1ICFl
	 AhwayJmx43TWQ==
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-53b962f09e0so3103996a12.0
        for <loongarch@lists.linux.dev>; Mon, 09 Oct 2023 08:16:45 -0700 (PDT)
X-Gm-Message-State: AOJu0Yy/lzFYMEMm9ZpM1Ujifw8HyQgw56s0utyQCXz6Oob3txuYo/YW
	XbpP54YZMlYSiO4O1DBk69aY/Uc98oJAcIHwDBE=
X-Google-Smtp-Source: AGHT+IGSLEtp8/ZbK1MsosRqbvxV8azkLSHz9Otz3nXZ+lvSbGwGVYiT2aLKFzSbqavypW8JCUPmWuuVmeizyQ6W5pM=
X-Received: by 2002:a05:6402:3445:b0:52f:a5d4:1f5b with SMTP id
 l5-20020a056402344500b0052fa5d41f5bmr12782747edc.9.1696864604058; Mon, 09 Oct
 2023 08:16:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231009124210.1064021-1-masahiroy@kernel.org>
In-Reply-To: <20231009124210.1064021-1-masahiroy@kernel.org>
From: Guo Ren <guoren@kernel.org>
Date: Mon, 9 Oct 2023 23:16:30 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQxiCEyGiGieHJMBK0Hmj49f8mdcm1TwsTZbgbvxVxGcw@mail.gmail.com>
Message-ID: <CAJF2gTQxiCEyGiGieHJMBK0Hmj49f8mdcm1TwsTZbgbvxVxGcw@mail.gmail.com>
Subject: Re: [PATCH 1/5] csky: remove unused cmd_vdso_install
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-um@lists.infradead.org, 
	loongarch@lists.linux.dev, sparclinux@vger.kernel.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 9, 2023 at 8:42=E2=80=AFPM Masahiro Yamada <masahiroy@kernel.or=
g> wrote:
>
> You cannot run this code because arch/csky/Makefile does not define the
> vdso_install target.
>
> It appears that this code was blindly copied from another architecture.
Yes, I do that. Thx for pointing it out.

Acked-by: Guo Ren <guoren@kernel.org>

>
> Remove the dead code.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>
>  arch/csky/kernel/vdso/Makefile | 10 ----------
>  1 file changed, 10 deletions(-)
>
> diff --git a/arch/csky/kernel/vdso/Makefile b/arch/csky/kernel/vdso/Makef=
ile
> index 299e4e41ebc5..ddf784a62c11 100644
> --- a/arch/csky/kernel/vdso/Makefile
> +++ b/arch/csky/kernel/vdso/Makefile
> @@ -58,13 +58,3 @@ quiet_cmd_vdsold =3D VDSOLD  $@
>  # that contains the same symbols at the same offsets.
>  quiet_cmd_so2s =3D SO2S    $@
>        cmd_so2s =3D $(NM) -D $< | $(srctree)/$(src)/so2s.sh > $@
> -
> -# install commands for the unstripped file
> -quiet_cmd_vdso_install =3D INSTALL $@
> -      cmd_vdso_install =3D cp $(obj)/$@.dbg $(MODLIB)/vdso/$@
> -
> -vdso.so: $(obj)/vdso.so.dbg
> -       @mkdir -p $(MODLIB)/vdso
> -       $(call cmd,vdso_install)
> -
> -vdso_install: vdso.so
> --
> 2.39.2
>


--=20
Best Regards
 Guo Ren
