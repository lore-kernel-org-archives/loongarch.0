Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D6E61C36
	for <loongarch@lists.linux.dev>; Fri,  1 Jul 2022 18:34:41 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id x20so3120170plx.6
        for <loongarch@lists.linux.dev>; Fri, 01 Jul 2022 11:34:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=2xkgTEHJBTgB3VGmVVz/PMgIQBXndHgY0Rz63AAgjtQ=;
        b=BexsrX9OxXBQK8TgK59VrYFBF0hMpq/3jBL8ecoqv26B1nTqia4WeJLmv2MfevghAc
         sDWjOFlTnBjp8PRRgIZfFNj0z8ONgn5Plxx3hBh4utEecUbbVV14nWMrkefCHWO8tm9b
         TzkH1Jy2rgI4kh2QkYHR7q8NGQu3clg8Vj0eu24s+iZtODTTJ6EoSFjAlFg2YCVusDsF
         HclWML4CayHOzf8eitF69LvDIi8mluK6rRe+mwuIcCVQYBVXCdNqNNfugvZGvfCANt4n
         F9pOpWEASZZPMKWNeUEMFfvQDQU3drkqIptMkDi19Rb+j71a64qF06YPL/EsEtrgGBkX
         mA+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to;
        bh=2xkgTEHJBTgB3VGmVVz/PMgIQBXndHgY0Rz63AAgjtQ=;
        b=arByu8EggEaQ6O3pGvqS+CNfhV8UDxfds8Du+YRVsXw8/ZOIN0ukDr3t9WQIDyFJIv
         MpqfFbkoVVN8InSvwisb/XIgzCtCAv3SDDIiahf40KsXLp28kmHCzzviHOcamhPAUXKd
         BnxynLAHD9Cl58QqmN7cNT4XVbss4CMAl4O/09HXGcuhMjyO6WjItH5+6wjDVO9bAy5y
         7552ZXQPthQyzUiDJcvbBAZUG1/WoqpLwD8gT1PyByHK13CNLQAsa8BUJ1A6d3pnnjHk
         XsDLFGEARM5Lw6N67A2JwrQ26fDQo27xVP59R8Knp5f+sr8K6nj9k3ywSYjt+yurTOlO
         H7JA==
X-Gm-Message-State: AJIora++7kWZCo41dMAQQ91aY8JzptiBP88kJ+lHxEBUIIEzKgYoqKMh
	SqF5tPFBj0n1ZRjBJxPRIW0=
X-Google-Smtp-Source: AGRyM1vRUhRnuqu6eOqKDLqSv4Ob2xvS8l03q+Lrur5TUcqbqXImLTlYKg3kIK312sNcfy1eOixNuA==
X-Received: by 2002:a17:903:40cb:b0:16a:29dd:368f with SMTP id t11-20020a17090340cb00b0016a29dd368fmr22991862pld.96.1656700480754;
        Fri, 01 Jul 2022 11:34:40 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id k6-20020a17090a910600b001ef42b3c5besm3513908pjo.23.2022.07.01.11.34.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Jul 2022 11:34:39 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 1 Jul 2022 11:34:37 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: WANG Xuerui <kernel@xen0n.name>
Cc: Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev
Subject: Re: Building loongarch64 toolchain
Message-ID: <20220701183437.GA2976148@roeck-us.net>
References: <f83d6a9d-ec07-21d1-87e3-700475192694@roeck-us.net>
 <CAAhV-H41pxiYudNRYOYK8hndMA2Ki6VUXxSaqa27yME1mjWjgw@mail.gmail.com>
 <9427ebf1-8b5a-cebc-6ec4-2414197c24a8@roeck-us.net>
 <4f874205-d004-fa00-6fe0-b959ba21c186@xen0n.name>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4f874205-d004-fa00-6fe0-b959ba21c186@xen0n.name>

On Sat, Jul 02, 2022 at 12:37:21AM +0800, WANG Xuerui wrote:
> Hi,
> 
> On 7/1/22 14:39, Guenter Roeck wrote:
> > On 6/30/22 19:14, Huacai Chen wrote:
> > > Hi, Xuerui,
> > > 
> > > On Thu, Jun 30, 2022 at 10:06 PM Guenter Roeck <linux@roeck-us.net>
> > > wrote:
> > > > 
> > > > Hi,
> > > > 
> > > > I have been trying to build a toolchain for loongarch64 using
> > > > gcc 12.1.0 and
> > > > binutils 2.38. Unfortunately, the resulting toolchain doesn't
> > > > work for me.
> > > > Tracking down the problem, it turns out that gcc passes
> > > > -mabi=lp64d to the
> > > > assembler, but the assembler only supports -mabi=lp64.
> > > > 
> > > > Where can I find guidance on how to build a working toolchain ?
> > > > Using the
> > > > available toolchain binaries is not an option.
> > > Could you please give some guidance?
> > > 
> > 
> > I ended up hacking binutils to accept all lp64 mabi variants.
> > 
> > --- binutils-2.38.orig/gas/config/tc-loongarch.c    2022-01-22
> > 04:14:08.000000000 -0800
> > +++ binutils-2.38/gas/config/tc-loongarch.c    2022-06-30
> > 07:41:29.545038901 -0700
> > @@ -142,7 +142,8 @@
> >    switch (c)
> >      {
> >      case OPTION_ABI:
> > -      if (strcasecmp (arg, "lp64") == 0)
> > +      if (!strcasecmp (arg, "lp64") || !strcasecmp (arg, "lp64d") ||
> > +          !strcasecmp (arg, "lp64s") || !strcasecmp (arg, "lp64f"))
> >      {
> >        LARCH_opts.ase_abi |= EF_LOONGARCH_ABI_LP64;
> >        LARCH_opts.ase_ilp32 = 1;
> > 
> > With that, I am able to compile loongarch:defconfig. I'd still like
> > to understand the problem and avoid the hack, though.
> 
> This is due to an incompatible change to the LoongArch toolchain convention
> spec (the first version was like [1], got criticized mainly by me, then
> morphed into the final take [2], all discussion was in Chinese though),
> after the initial port went public and got accepted by binutils upstream.
> The binutils trunk has already been updated; in particular, you want at
> least [3] for compatibility with gcc.
> 
Thanks a lot for the explanation. Unfortunately, [3] does not apply on top
of binutils 2.38, so I asssume that there are other loongarch related
changes.

> BTW, you could use the Gentoo toolchain for easy experimentation if that's
> acceptable for you. (I maintain the Gentoo/LoongArch port so I know that
> toolchain is working for most commonly encountered software. It's probably
> carrying more downstream patches than some of you would prefer, although I
> don't find that to be a problem so far.)
> 

At this point I am just trying to compile the Linux kernel. The next step
would be create a root file system and to boot that kernel in qemu.
I'll leave that for later when I find an example of how to do that
to make sure that I don't waste my time playing around with qemu.
Until then, I think I'll just stick with my hack (and hopefully the
next version of binutils should work).

On a related note, in addition to the Linux kernel patches I just posted,
allmodconfig doesn't build because __cmpxchg and __xchg do not support
8-bit and 16-bit operations. Is there a plan to fix this ?

Thanks,
Guenter

> [1]: https://github.com/loongson/LoongArch-Documentation/pull/23
> [2]: https://github.com/loongson/LoongArch-Documentation/pull/24
> [3]: https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=3b14682a432e61c756ec9ad0b5bf5f8136e2cdce
> 
> -- 
> WANG "xen0n" Xuerui
> 
> Linux/LoongArch mailing list: https://lore.kernel.org/loongarch/
> 
