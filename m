Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8968D9456
	for <loongarch@lists.linux.dev>; Wed,  8 Feb 2023 09:20:32 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id o20so26193948lfk.5
        for <loongarch@lists.linux.dev>; Wed, 08 Feb 2023 01:20:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6x/YLvjMdKqIyfSq9HWwMBVMm1r5pILgbR3br9aIWe4=;
        b=eDNiEt5ahHb0Nak3ekxqptay2gOu7jeigadWsx/mo1bJoUDQCyLGcBDi6oFGt616wG
         JvcD0uxBDJp6+N749kMGO8DJoYJaUbFP3IUcta47A91TCIBvHm30nWUX1+QgWQWtkFTj
         bfUelsTHIovsAqwjj0IuNpH29JzXWSDKXsaWZ0JGLZw6QoBo5ou19t6Zw97hA1RfD1mz
         sJN+sp756ZRHSHKWiN725SZxl/RkADyQhWFkhkDPFtb7o2o/levnXS9ZZ2OYb/p/sfIf
         8yqfUCeIB6u1R8qpWtOYfcAEAoHZyZZH1frh8sg4j2madxhDfJ2MshoH+GbNTC9Dqnca
         6qOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6x/YLvjMdKqIyfSq9HWwMBVMm1r5pILgbR3br9aIWe4=;
        b=Du+3dc/UsWe07ukFKJzj1U0YuXsvriyCeMHxEUXXBw9Ut2RE+SsyPcwIcA1ClMWsIY
         VaAIXiPj+2ebhVunJ62mSotXLckVA/U0mVG5cIcjlLmYcS9DCnfLQdl/gUytneUdvwx6
         kvaDjdCYB+CSFUus1aafoszPTy1hlyyFqdlrRC+FI8991dcjWPlZhdDby4DjpTR6RSRI
         QlECptD4LZ5fBFc0OcIftNahNiUllXYB0rYPDsPdbDqhrm1JLAuKQhy7uVHrqcjG5s0o
         8COQR04+laHnRRmGx8gFv2gZ9MXSl/V63+Uoj7y/HdHbs31nuCAHcgYJG6/Ig7jXF4lG
         08xQ==
X-Gm-Message-State: AO0yUKUWGDz2v+AEiMpd38oY0x5B5ZNSlz5Afr4BR371WhQmtPKTI/W5
	2ZNTs6UfKIwlvz3/fe/wY4UTowvWwybDcNQQP/0=
X-Google-Smtp-Source: AK7set+kypxFGR3xaFePIv6tbGa7nm2uXd/1Q8BtGmcGgbmFBf62BNVkuqZhLtzKe7MWYdoSW8CDnfKgnRuRHAYikO4=
X-Received: by 2002:ac2:4350:0:b0:4ca:f757:6c91 with SMTP id
 o16-20020ac24350000000b004caf7576c91mr1005207lfl.92.1675848030486; Wed, 08
 Feb 2023 01:20:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1675734681.git.chenfeiyang@loongson.cn> <1af05c1441e9f96870be1cc20b1162e3f5043b2e.1675734681.git.chenfeiyang@loongson.cn>
 <1e7da4e7-392d-4a9e-aa95-0599a0c84419@app.fastmail.com> <CACWXhK==yVZGZbY+3DUAuxL34=gKwQv20Cw3y1+QKir0D2F3EQ@mail.gmail.com>
 <Y+MXk9A+gB1W6T/n@1wt.eu> <CACWXhKn1N6f7XvtrbDno4UyAhMZbV_htQoRbm0ws9gjF08wnBw@mail.gmail.com>
 <7c98aac5-6b64-4f6b-b242-7ad3b8a334a8@app.fastmail.com> <Y+NbF6OrYu62OQCX@1wt.eu>
In-Reply-To: <Y+NbF6OrYu62OQCX@1wt.eu>
From: Feiyang Chen <chris.chenfeiyang@gmail.com>
Date: Wed, 8 Feb 2023 17:20:18 +0800
Message-ID: <CACWXhKmWo0MX2mVE3O_xDDwNg7XxW_Yjm272K2nzRAiN13CQ9w@mail.gmail.com>
Subject: Re: [PATCH 1/3] nolibc: Add statx() support to implement sys_stat()
To: Willy Tarreau <w@1wt.eu>
Cc: Arnd Bergmann <arnd@arndb.de>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Feiyang Chen <chenfeiyang@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 8 Feb 2023 at 16:19, Willy Tarreau <w@1wt.eu> wrote:
>
> On Wed, Feb 08, 2023 at 09:06:24AM +0100, Arnd Bergmann wrote:
> > On Wed, Feb 8, 2023, at 08:42, Feiyang Chen wrote:
> > > On Wed, 8 Feb 2023 at 11:31, Willy Tarreau <w@1wt.eu> wrote:
> > >>
> > >> I generally agree with the Arnd's points overall and I'm fine with the
> > >> rest of your series. On this specific point, I'm fine with your proposal,
> > >> let's just start with sys_statx() only on this arch, please add a comment
> > >> about this possibility in the commit message that brings statx(),
> > >> indicating that other archs are likely to benefit from it as well, and
> > >> let's see after this if we can migrate all archs to statx.
> > >>
> > >
> > > We have a problem if we just start with sys_statx() only on this arch.
> > > When struct stat is not defined, what should we do with stat() in the
> > > nolibc selftest?
> >
> > To clarify: your proposed implementation of the stat() function that
> > fills the nolibc 'struct stat' based on information from 'struct statx'
> > is fine here. Just remove the 'struct sys_stat_struct' definition
> > loongarch but keep 'struct stat'.
>
> Ah I think now I understand the problem Feiyang is facing. Since "struct
> stat" is just between libc and userland, there's the "sys_stat_struct"
> that we're using to abstract the syscalls in sys_stat() and that is
> compatible with each variant of the stat() syscall on each arch. Here
> there's simply no stat() syscall so it's best not to try to abstract
> this function at all since types will not match between stat and statx,
> so it will be better to just implement it like this:
>
> #if defined(__NR_statx)
>     static __attribute__((unused))
>     int sys_stat(const char *path, struct stat *buf)
>     {
>        struct statx statx;
>        long ret;
>
>        ret = statx(...);
>        buf->xxx = statx.xxx;
>        ...
>        return ret;
>     }
> #else ...
>    // keep the regular sys_stat() here
> #endif
>
> Also looking at the man page I see that statx() only appeared in 4.11,
> and here we're targetting userland so I'd rather keep a bit of margin
> when it comes to backwards compatibility, thus not dropping stat() and
> friends too early when not necessary. However using statx() by default
> when available sounds fine to me!
>

Hi, Arnd, Willy,

I think I get it now, thank you!

Thanks,
Feiyang

> Cheers,
> Willy
