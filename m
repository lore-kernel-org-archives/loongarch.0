Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 044B728E4
	for <loongarch@lists.linux.dev>; Thu, 16 Jun 2022 12:34:10 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id s6so1966844lfo.13
        for <loongarch@lists.linux.dev>; Thu, 16 Jun 2022 05:34:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TcmjiftvmvstcVVvvRVC96LjLQUb9YXPsyorLZpT7Eo=;
        b=qhLeneM5IfLMq6+4CtNi+ecFfjQWnvkJeicJAimHxgtTT7+vPBKc2RchZH9p+wYdTD
         gMmFHIrevsoJGwvEysG0Bgu/NNM2miz97uOmyCdWH5koYymF8rzEEaIqr4arGIYve0oV
         6zBDSsvtf7R7jOPbN6xQ7yOtEtrajwCbex+Nny24SuYJbwJXPhIY3vts/IHGmE+JCOW1
         3IOwRVmh/zoCs7R7z1WzsLtKqqoZGSenaEjYbI/4cMamYyU9BrKLrTrB6Mv0DXEJxPln
         64Yh3jwH+FgRBBYA6ktvU7u7cjXvqR9zULWt8vsbPNSlXOnjcmVxaINh7LgMq3rq+yCZ
         wxaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TcmjiftvmvstcVVvvRVC96LjLQUb9YXPsyorLZpT7Eo=;
        b=cqCdbPFjcRcLvCYoLzYu5GFm6/+YnQ93V65vay00Gbv26cyNyj7O8dRtvBjUhCvKLF
         xtNCjt9b5FG2p63vyG07uzKHsFcmzofdNupRHCxfNxjvNvt6iaovwiVCJ/vqY+k//UQb
         w4lhpClivGE4Awh+lCZmWea9Mdcip+ve0kpw2wG4GwyDgRF2cvok8hfJMgCreAy8RVaR
         Ad+Ln47R8Oe3GIs2S0BGz8LMqGgIiADlyMi/ZnnlJcIuFZyYVqEYcDopdwPqNXWntrd5
         XR8mxC3yth1QbWYvdXN+eQ4AtO5sp3/svzUVcjVOGed50dewZ4RKLscbeRuyrOxn7to/
         9AzA==
X-Gm-Message-State: AJIora+/dDTGHEsRl/uGduQT2g/Ap9qD5hrQ6WKbWY9NszgpzNb/X2sr
	VVRGmp5yCbj5fvRvGUo6SHM2jY1QbGqS5rX1TJs=
X-Google-Smtp-Source: AGRyM1tQ8rUEgj2RZPiOje7V1yhvKo6lrBJQedfMEkmkj33ARiAh6lkPBtd6vdK9szIPiA2o2U85nF/g+uupa8H6/dE=
X-Received: by 2002:a05:6512:2398:b0:479:24aa:6454 with SMTP id
 c24-20020a056512239800b0047924aa6454mr2732604lfv.664.1655382849043; Thu, 16
 Jun 2022 05:34:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220616121456.3613470-1-chenhuacai@loongson.cn> <ab6e2213-0795-68d1-c596-3dae1e174421@xen0n.name>
In-Reply-To: <ab6e2213-0795-68d1-c596-3dae1e174421@xen0n.name>
From: Huacai Chen <chenhuacai@gmail.com>
Date: Thu, 16 Jun 2022 20:33:58 +0800
Message-ID: <CAAhV-H7MPgKN1CUCZNDUL00_hyMrhVRxjNOXioZfbjYvS8favg@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Add maillist information for LoongArch
To: WANG Xuerui <kernel@xen0n.name>
Cc: Huacai Chen <chenhuacai@loongson.cn>, Arnd Bergmann <arnd@arndb.de>, 
	Andrew Morton <akpm@linux-foundation.org>, loongarch@lists.linux.dev, 
	linux-arch <linux-arch@vger.kernel.org>, Xuefeng Li <lixuefeng@loongson.cn>, 
	Guo Ren <guoren@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset="UTF-8"

Hi, Xuerui,

On Thu, Jun 16, 2022 at 8:21 PM WANG Xuerui <kernel@xen0n.name> wrote:
>
> On 2022/6/16 20:14, Huacai Chen wrote:
> > Now there is a dedicated maillist (loongarch@lists.linux.dev) for
> > LoongArch, add it for better development.
>
> Obligatory English fixes:
>
>  > Now that there is a dedicated mailing list for LoongArch, add it for
> better collaboration.
>
> Is this version better? We have the list address below so I feel no need
> for duplicating it in the commit message.
Thank you, it is better, but I will keep the list address in the commit message.

Huacai
>
> >
> > Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
> > ---
> >   MAINTAINERS | 1 +
> >   1 file changed, 1 insertion(+)
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 1fc9ead83d2a..dba5e89527a2 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -11590,6 +11590,7 @@ F:    drivers/gpu/drm/bridge/lontium-lt8912b.c
> >   LOONGARCH
> >   M:  Huacai Chen <chenhuacai@kernel.org>
> >   R:  WANG Xuerui <kernel@xen0n.name>
> > +L:   loongarch@lists.linux.dev
> >   S:  Maintained
> >   T:  git git://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loongson.git
> >   F:  arch/loongarch/
>
> Otherwise LGTM. I should become the 4th subscriber shortly ;-)
>
> Reviewed-by: WANG Xuerui <git@xen0n.name>
>
