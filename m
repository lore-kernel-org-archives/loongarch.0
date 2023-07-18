Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9EF7D518
	for <loongarch@lists.linux.dev>; Tue, 18 Jul 2023 15:39:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73AA1C433C7
	for <loongarch@lists.linux.dev>; Tue, 18 Jul 2023 15:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689694746;
	bh=7rHfs2GMogQauEkq0epPnmohdkROdKonN2mtJ7v19TQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=DsjDNIaoPYi54KEa07jHVq9vV3+RgKR6lDiRSlFSe/xuDHotq4E4OYlaByFN9IwUe
	 rlIOh0ZbESrVJ7/wVhAt6k1oDoSvcxliWmKMXSs0FCe2/fDoonnOADYBA/qskdMS/Y
	 beD1eWaqH2XiXuWeN6u3iNzb3UGRHRVPVFZr9UQvQKBqXUPKVGeqtlBezgVwHhUpQy
	 S+p38pt7M/fpKIXie9MZlImXVZbrTvd73FHbgDESu7omi16lCFwYJ/avLrn3AFd6KK
	 bNzoFxYAqfg3bfoBYaSabOnmW7W4uR8WQNYoZZaVjoig1KcFBsbRcGuM4Q8mKR7/5a
	 ywjYe4inOsJyQ==
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-51e619bcbf9so8124631a12.3
        for <loongarch@lists.linux.dev>; Tue, 18 Jul 2023 08:39:06 -0700 (PDT)
X-Gm-Message-State: ABy/qLbkgVvXu6qtuuBsLw2dDNPje3LhfzSvXyFc2RnL0/YdjISvGLKT
	OfixLTgQya6pRMLVsYEEbuZ7m2Zevvd5oknOd8Q=
X-Google-Smtp-Source: APBJJlGaLOuKJwTGrsmgv+ATI4sOFUwlNFrsjaQBkOlAH/HEEJau0+QlY6ZbLUiBC25LbSXOXW2csk0/hv+PUwAydI0=
X-Received: by 2002:aa7:d787:0:b0:521:9d92:5863 with SMTP id
 s7-20020aa7d787000000b005219d925863mr64329edq.42.1689694744717; Tue, 18 Jul
 2023 08:39:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <MEYP282MB259720FF3C1683A75881EF02D93BA@MEYP282MB2597.AUSP282.PROD.OUTLOOK.COM>
 <CAAhV-H6dn9iRxaGGoD+=7YHiDEmt_Be4_v8d1oY7+dmhrJBUMw@mail.gmail.com>
In-Reply-To: <CAAhV-H6dn9iRxaGGoD+=7YHiDEmt_Be4_v8d1oY7+dmhrJBUMw@mail.gmail.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Tue, 18 Jul 2023 23:38:53 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6hY=Y_DagrHJzNY5wn8JkCzheAR2JnjrOQf5DUHES1Tg@mail.gmail.com>
Message-ID: <CAAhV-H6hY=Y_DagrHJzNY5wn8JkCzheAR2JnjrOQf5DUHES1Tg@mail.gmail.com>
Subject: Re: [PATCH v4] LoongArch: Fix CONFIG_CMDLINE_EXTEND and
 CONFIG_CMDLINE_BOOTLOADER handling
To: Dong Zhihong <donmor3000@hotmail.com>
Cc: kernel@xen0n.name, ardb@kernel.org, tangyouling@loongson.cn, 
	zhoubinbin@loongson.cn, yangtiezhu@loongson.cn, tglx@linutronix.de, 
	loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Zhihong,

On Mon, Jul 17, 2023 at 3:05=E2=80=AFPM Huacai Chen <chenhuacai@kernel.org>=
 wrote:
>
> On Mon, Jul 17, 2023 at 2:51=E2=80=AFPM Dong Zhihong <donmor3000@hotmail.=
com> wrote:
> >
> > Make CONFIG_CMDLINE work with CONFIG_CMDLINE_EXTEND and
> > CONFIG_CMDLINE_BOOTLOADER. The touched function is bootcmdline_init()`.
> > There's already code handling CONFIG_CMDLINE_FORCE, which replaces
> > `boot_command_line` with CONFIG_CMDLINE and immediately`goto out`. It'd=
 be
> > similar way to handle CONFIG_CMDLINE_EXTEND and CONFIG_CMDLINE_BOOTLOAD=
ER,
> > so some code is added after OF_FLATTREE part to handle them.
> >
> > Signed-off-by: Dong Zhihong <donmor3000@hotmail.com>
> > ---
> >
> > v4 -> v3: Make CONFIG_CMDLINE appended to the end of command line (Huac=
ai);
> >         Removed unnecessary #ifdef since CONFIG_CMDLINE is always a str=
ing on
> >         LoongArch
> >         Reworded comments
> >         Reworded the subject of commit message (Huacai)
> > v3 -> v2: Reworded the commit message again to make it imperative (Ruoy=
ao)
> > v2 -> v1: Reworded the commit message so it's more imperative (Markus);
> >         Added `goto out` to FDT part (Huacai)
> >
> >  arch/loongarch/kernel/setup.c | 17 +++++++++++++++++
> >  1 file changed, 17 insertions(+)
> >
> > diff --git a/arch/loongarch/kernel/setup.c b/arch/loongarch/kernel/setu=
p.c
> > index 78a00359bde3..a98f33553acf 100644
> > --- a/arch/loongarch/kernel/setup.c
> > +++ b/arch/loongarch/kernel/setup.c
> > @@ -332,9 +332,26 @@ static void __init bootcmdline_init(char **cmdline=
_p)
> >                         strlcat(boot_command_line, " ", COMMAND_LINE_SI=
ZE);
> >
> >                 strlcat(boot_command_line, init_command_line, COMMAND_L=
INE_SIZE);
> > +               goto out;
> >         }
> >  #endif
> >
> > +       /*
> > +        * Append built-in command to the retrieved one if
> > +        * CONFIG_CMDLINE_EXTEND is enabled.
> > +        */
> > +       if (IS_ENABLED(CONFIG_CMDLINE_EXTEND) && CONFIG_CMDLINE[0]) {
> Don't need to check CONFIG_CMDLINE[0], this simplifies the conditions.
>
> > +               strlcat(boot_command_line, " ", COMMAND_LINE_SIZE);
> > +               strlcat(boot_command_line, CONFIG_CMDLINE, COMMAND_LINE=
_SIZE);
> > +               goto out;
> Remove this line and in the next line using the old method
> (IS_ENABLED(CONFIG_CMDLINE_BOOTLOADER) && !boot_command_line[0]) is
> better.
To save everyone's time, I adjust the logic and send v5 [1]. If you
have no objections, I'll apply that one to loongarch-next.

[1] https://lore.kernel.org/loongarch/20230718153348.3340811-1-chenhuacai@l=
oongson.cn/T/#u

Huacai
>
> Huacai
> > +       }
> > +
> > +       /*
> > +        * Use built-in command line if nothing is retrieved from boot =
loader.
> > +        */
> > +       if (!boot_command_line[0])
> > +               strscpy(boot_command_line, CONFIG_CMDLINE, COMMAND_LINE=
_SIZE);
> > +
> >  out:
> >         *cmdline_p =3D boot_command_line;
> >  }
> > --
> > 2.25.1
> >
