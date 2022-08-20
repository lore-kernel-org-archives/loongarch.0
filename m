Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B8FB6122
	for <loongarch@lists.linux.dev>; Sat, 20 Aug 2022 02:17:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16198C43140
	for <loongarch@lists.linux.dev>; Sat, 20 Aug 2022 02:17:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660961833;
	bh=8iQAQ32qqDbHq5wsUf8jya/MYI4PvyumME5D7QFSNfA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=keOAy5JRV+yERuRjcNQRuLTUi6VHNW8WpWfYftL8l5pGvcoDy5AlIl3KxDRXBwwap
	 LwsVItIlzp2jtDZv+JHYixmc8ZJTiUv6lF8H5zpcvia5EYZ3lC4tPIneSEfJZvMmVF
	 hXtm5MNia9uxl1dxbkHX6WmPYLHgraKn79dM0D01tQHlc18l4oK6qK7SPeH8lXmdjq
	 v2vm+Euu84SqBALarEVKi4LSB5zHb5sKhhaEpW6JWhPh7zf89Q6y/d6aEsrfC4eQHg
	 0bx9pKDJi+9r4Fwc8e4lXJPz3Ovm8ZGfuJZUHGd1FL6tuvFgtwuVQI0do/Rm1RvMl8
	 DHaLqnWSUlZ1A==
Received: by mail-vs1-f42.google.com with SMTP id k2so6115364vsk.8
        for <loongarch@lists.linux.dev>; Fri, 19 Aug 2022 19:17:13 -0700 (PDT)
X-Gm-Message-State: ACgBeo0laaX/66pJkJRfFrhc4STbG5p4WZkpvE7lcpU+ZWW5BCssRNFp
	6JC0ZljElRj4CZAQ3jR0v172RYHaQLHjrysmVvg=
X-Google-Smtp-Source: AA6agR4AdxdwgLKOpjY1WxAeizyGuDuybEZamKTt+850iPzH8Qsi1TMyozDV+i7fndmwC4ajsfbAEDnU9+bKDMCphi8=
X-Received: by 2002:a67:d58b:0:b0:390:2574:6736 with SMTP id
 m11-20020a67d58b000000b0039025746736mr2100279vsj.78.1660961832041; Fri, 19
 Aug 2022 19:17:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220819081403.7143-1-zhangqing@loongson.cn> <20220819081403.7143-2-zhangqing@loongson.cn>
 <f9b12eed-a7a0-0f2b-4679-1f465e22cad6@loongson.cn> <20220819125343.1623d850@gandalf.local.home>
 <06575d5e-7451-17ca-b5a8-4153816b3808@loongson.cn>
In-Reply-To: <06575d5e-7451-17ca-b5a8-4153816b3808@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sat, 20 Aug 2022 10:16:59 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4hVhid1=aaP-fDtdvYyJ+yJqkKeznEN5a9zF9S-dHgog@mail.gmail.com>
Message-ID: <CAAhV-H4hVhid1=aaP-fDtdvYyJ+yJqkKeznEN5a9zF9S-dHgog@mail.gmail.com>
Subject: Re: [PATCH 1/9] LoongArch/ftrace: Add basic support
To: Qing Zhang <zhangqing@loongson.cn>
Cc: Steven Rostedt <rostedt@goodmis.org>, Jinyang He <hejinyang@loongson.cn>, 
	Ingo Molnar <mingo@redhat.com>, WANG Xuerui <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	LKML <linux-kernel@vger.kernel.org>, linux-arch <linux-arch@vger.kernel.org>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, all,

On Sat, Aug 20, 2022 at 9:34 AM Qing Zhang <zhangqing@loongson.cn> wrote:
>
>
>
> On 2022/8/20 =E4=B8=8A=E5=8D=8812:53, Steven Rostedt wrote:
> > On Fri, 19 Aug 2022 17:29:29 +0800
> > Jinyang He <hejinyang@loongson.cn> wrote:
> >
> >> It seems this patch adds non-dynamic ftrace, this code should not
> >> appear here.
> >> BTW is it really necessary for non-dynamic ftrace? I do not use it
> >> directly and frequently, IMHO, non-dynamic can be completely
> >>
> >> replaced dynamic?
> >
> > Note, I keep the non dynamic ftrace around for debugging purposes.
> >
> > But sure, it's pretty useless. It's also good for bringing ftrace to a =
new
> > architecture (like this patch is doing), as it is easier to implement t=
han
> > dynamic ftrace, and getting the non-dynamic working is usually the firs=
t
> > step in getting dynamic ftrace working.
> >
> > But it's really up to the arch maintainers to keep it or not.
> >
> Before submitting, I saw that other architectures almost kept
> non-dynamic methods without cleaning up, I tend to keep them.
> How do you think, Huacai. :)
I prefer to keep the non-dynamic method.

Huacai
>
> Thanks,
> - Qing
> > -- Steve
> >
>
>
