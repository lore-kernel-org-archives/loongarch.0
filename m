Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5EDE362
	for <loongarch@lists.linux.dev>; Wed, 12 Jul 2023 01:19:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67055C433C8
	for <loongarch@lists.linux.dev>; Wed, 12 Jul 2023 01:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689124781;
	bh=OM7jgID5+nDTdQR28+4xIcEawoenyRWnAs3OJMJYetA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=KogWyRn2VV5EZhXGlejNpBZVugdnvEr9ROeC4CRSSSEYKuuGFz6Q3eKZBWxlbfC7Q
	 xKynDGGP9yuWUJrf5EJunAhtgDUwFyPPJI0nAdhO7RzAXluhsgqEDWZZwSaSob5aOD
	 2PVtaK/wBMqAVqtxWitUn4aaCzZ2uf42yDh26ZCgR36pqxPgz6SAvLSVWRgYAHVqui
	 8ABLk16iWwNecceSWo9JPrF2a/E3nwbqgO4YV26BoJKh3/JO9hAH3npJFY8lq+QVEL
	 wrjdTcdrUtdMKFs7/hZZ7BajJ/L/K+UGu62Rg0SgZ1yhouMfSfHk4TEq9Okc0AWI6J
	 824m10wJFUDxA==
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-3fbca8935bfso65624535e9.3
        for <loongarch@lists.linux.dev>; Tue, 11 Jul 2023 18:19:41 -0700 (PDT)
X-Gm-Message-State: ABy/qLbhK4VsDR3AJsEh9rpICLOWPVNxIIPzjax2vT9t/iC9piT6Kgsh
	z+NGJayXp/tOk89u7jcKKiiS8FRcvboYPKDW59Q=
X-Google-Smtp-Source: APBJJlFk4AotcRZBsIkX55a+pPm9Vn/TiF+hEpBDZFcOK1865HA0wMQMSVlbpVD9PRtSkP69IMxrcW7aE7Y+qwwEGe0=
X-Received: by 2002:a05:6000:1106:b0:315:a1f9:8667 with SMTP id
 z6-20020a056000110600b00315a1f98667mr4599399wrw.23.1689124779730; Tue, 11 Jul
 2023 18:19:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <MEYP282MB2597B4BD3CDA1ED340691C9CD931A@MEYP282MB2597.AUSP282.PROD.OUTLOOK.COM>
 <CAAhV-H56GhqETf=NAGzHRLk73F+-Kb=j+gzNMshVQijPi-Tc=g@mail.gmail.com> <3310eb5b3c944434b6e3b53750f1801f510811f2.camel@hotmail.com>
In-Reply-To: <3310eb5b3c944434b6e3b53750f1801f510811f2.camel@hotmail.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Wed, 12 Jul 2023 09:19:28 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4ZE3eXOaMSaCCH6pk40pwYTOs9QasjLbPRtos5V=fM-w@mail.gmail.com>
Message-ID: <CAAhV-H4ZE3eXOaMSaCCH6pk40pwYTOs9QasjLbPRtos5V=fM-w@mail.gmail.com>
Subject: Re: [PATCH v3] LoongArch: Make CONFIG_CMDLINE work with
 CONFIG_CMDLINE_EXTEND and CONFIG_CMDLINE_BOOTLOADER
To: donmor <donmor3000@hotmail.com>
Cc: "loongarch@lists.linux.dev" <loongarch@lists.linux.dev>, "kernel@xen0n.name" <kernel@xen0n.name>, 
	"yangtiezhu@loongson.cn" <yangtiezhu@loongson.cn>, "zhoubinbin@loongson.cn" <zhoubinbin@loongson.cn>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "tglx@linutronix.de" <tglx@linutronix.de>, 
	"ardb@kernel.org" <ardb@kernel.org>, "tangyouling@loongson.cn" <tangyouling@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 11, 2023 at 11:27=E2=80=AFPM =E2=80=8E donmor <donmor3000@hotma=
il.com> wrote:
>
> =E5=9C=A8 2023-07-11=E6=98=9F=E6=9C=9F=E4=BA=8C=E7=9A=84 22:26 +0800=EF=
=BC=8CHuacai Chen=E5=86=99=E9=81=93=EF=BC=9A
>
> ...
> > +       if (IS_ENABLED(CONFIG_CMDLINE_EXTEND)) {
> > > +               strscpy(boot_command_line, CONFIG_CMDLINE, COMMAND_LI=
NE_SIZE);
> > > +               strlcat(boot_command_line, " ", COMMAND_LINE_SIZE);
> > > +               strlcat(boot_command_line, init_command_line, COMMAND=
_LINE_SIZE);
> > You can simply the logic:
> >                strlcat(boot_command_line, " ", COMMAND_LINE_SIZE);
> >                strlcat(boot_command_line, CONFIG_CMDLINE, COMMAND_LINE_=
SIZE);
> > And then modify the comments because you are appending built-in parts
> > to bootloader parts.
> >
> I think the command line retrieved from bootloader should be placed after=
 the
> built-in one so that it can override params in the latter.
config CMDLINE_EXTEND
        bool "Use built-in to extend bootloader kernel arguments"

The fdt version also uses this logic, but you are using bootloader
parts to extend built-in parts.

>
> > >         }
> > > +
> > > +       if (IS_ENABLED(CONFIG_CMDLINE_BOOTLOADER) && !boot_command_li=
ne[0])
> > > +               strscpy(boot_command_line, CONFIG_CMDLINE, COMMAND_LI=
NE_SIZE);
> > This should be removed if you want to keep the exact meaning of
> > CONFIG_CMDLINE_BOOTLOADER.
> >
> > Huacai
> >
> Do you mean 'IS_ENABLED(CONFIG_CMDLINE_BOOTLOADER) && ' is not necessary?=
 And I
> think the rest of this part should be here, because CONFIG_CMDLINE_BOOTLO=
ADER
> won't append anything to boot_command_line unless it is empty, according =
to its
> description.

OK, you are right here.

Huacai
