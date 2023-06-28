Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 431B5C8E3
	for <loongarch@lists.linux.dev>; Wed, 28 Jun 2023 15:37:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B806BC433C0
	for <loongarch@lists.linux.dev>; Wed, 28 Jun 2023 15:37:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687966646;
	bh=URRLSvyneAYstNQfgj6lGuC/8vb3HBgmCBmh1P+6bcI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=js5MkCrVzbMok4fSTLQ+uDT8alNWZKQsCCjQTWc8hxKzSJDinbBgzZUYFh9UwYnFh
	 MyAMRo9QvzzM+9q0hSlveVcve4K/n0cQoNIuMz6By8JhmcjiM1L6cgL7Qcim3CD9/8
	 dvwg7sVem3zOBHD1CtPsUMsnmU4G5DTbrq5deKv3U5xk9mDoE5tpd8N1spGQVkSLWJ
	 tn8SHBUXWlGwiY5Tn0pXp0QiQSUGCLgo/Hab1vk75NAdo5m/JE6yOh1tqGRYOePyWE
	 lK0W/CQ9d8TIxT00qL26GrGLhJmw808fD4Wkf5bTBuaMPdy+1t5+Cis65LCJP9QkT6
	 B89LVb+Y6sFDw==
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-51d805cb33aso6198074a12.3
        for <loongarch@lists.linux.dev>; Wed, 28 Jun 2023 08:37:26 -0700 (PDT)
X-Gm-Message-State: AC+VfDxASHSJz6i3Igb9xLkmSXNY0xuROp/eA8KzOkpnqNHHxPsNuZ1I
	p6jKp0ruOUKMvEVXL7IO2OGGUUDFNeXBMyF/K0Y=
X-Google-Smtp-Source: ACHHUZ6bt/GKONHGgdrgwHXvTepDJy81A3PhB37VRKCiiHQROMrj89C8PTgUdw3VE6MitMrJB6u8gUfAlZKVbYTZeVg=
X-Received: by 2002:a05:6402:1651:b0:51d:afb0:f05 with SMTP id
 s17-20020a056402165100b0051dafb00f05mr2997728edx.37.1687966644940; Wed, 28
 Jun 2023 08:37:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <7627f2b9-2287-46d2-b461-d33aa69931a8@moroto.mountain> <2217f142-470d-b467-6ad8-b1d7c0aee2c8@xen0n.name>
In-Reply-To: <2217f142-470d-b467-6ad8-b1d7c0aee2c8@xen0n.name>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Wed, 28 Jun 2023 23:37:13 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6EisP3BLAPb64To=bX-S-XaPwHmxRB1BpU+YP4McMyzg@mail.gmail.com>
Message-ID: <CAAhV-H6EisP3BLAPb64To=bX-S-XaPwHmxRB1BpU+YP4McMyzg@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: Delete debugfs checking
To: WANG Xuerui <kernel@xen0n.name>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, Ivan Orlov <ivan.orlov0322@gmail.com>, 
	Immad Mir <mirimmad17@gmail.com>, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Queued for loongarch-next, thanks.


Huacai

On Wed, Jun 28, 2023 at 10:22=E2=80=AFPM WANG Xuerui <kernel@xen0n.name> wr=
ote:
>
> Hi,
>
> On 2023/6/20 16:06, Dan Carpenter wrote:
> > Debugfs functions are not supposed to be checked for errors.  This
> > is sort of unusual but it is described in the comments for the
> > debugfs_create_dir() function.  Also debugfs_create_dir() can never
> > return NULL.
> >
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > ---
> > I spotted this code because I was looking at patches which were sent
> > to stable but without a Fixes tag.  The correct way of checking for
> > error pointers is not IS_ERR_OR_NULL(), it's IS_ERR().  When a function
> > returns both error pointers and NULL, the NULL should be treated as a
> > special kind of success.  Please see my blog for more details.
> >
> > https://staticthinking.wordpress.com/2022/08/01/mixing-error-pointers-a=
nd-null/
> >
> > I have not included a Fixes tag here, because it's not really a bug fix=
,
> > it's just a clean up.
>
> Thanks for the patch and sorry for the late review. I didn't notice this
> back then (just recovering from covid around that time) but since
> loongarch-next isn't tagged yet I think the patch could make it this
> cycle. (Somehow Huacai didn't see the mail either, weird...)
>
> >
> >   arch/loongarch/kernel/unaligned.c | 2 --
> >   1 file changed, 2 deletions(-)
> >
> > diff --git a/arch/loongarch/kernel/unaligned.c b/arch/loongarch/kernel/=
unaligned.c
> > index 85fae3d2d71a..3abf163dda05 100644
> > --- a/arch/loongarch/kernel/unaligned.c
> > +++ b/arch/loongarch/kernel/unaligned.c
> > @@ -485,8 +485,6 @@ static int __init debugfs_unaligned(void)
> >       struct dentry *d;
> >
> >       d =3D debugfs_create_dir("loongarch", NULL);
> > -     if (IS_ERR_OR_NULL(d))
> > -             return -ENOMEM;
> >
> >       debugfs_create_u32("unaligned_instructions_user",
> >                               S_IRUGO, d, &unaligned_instructions_user)=
;
>
> Trivial enough, thanks!
>
> Reviewed-by: WANG Xuerui <git@xen0n.name>
>
> --
> WANG "xen0n" Xuerui
>
> Linux/LoongArch mailing list: https://lore.kernel.org/loongarch/
>
>
