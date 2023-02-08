Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6143120EE
	for <loongarch@lists.linux.dev>; Wed,  8 Feb 2023 07:43:09 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id y25so25856262lfa.9
        for <loongarch@lists.linux.dev>; Tue, 07 Feb 2023 23:43:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mVCtFK5+Mzt3hAp57nZ3RLtIxxaSOtloZUtvAg8w8Z8=;
        b=VC+DuNOOj82IU4SduBxcLaGSrM4ddq1tKPseKrkGHxrCuw6C/zChYL0qfklZdF3P+R
         D8iSXjulGePVAobJZom/AbyDrYjYoyTEXpmBoVlf8bfLTTa58LNTnVU9IluL9SnnYy4+
         Xhteo6NM0gniCGjlZ9LVNHdnI+ch8r40Pr+V9w6Pn5fT/DWby3Wiy0apGsjIoE4MD87F
         PAUlSSgzqdIaRPULhcl/SOkLvQG2vUG94lwmIYS6Zvq8WqNntjWA2DeZOzAGaJag5KHN
         M6eAl5fpOnIncJ/PIO101Fnr6nQTWSLxJ2Bsu4d4iXAGLGDnEN7cfPow6lg01i9FIeqc
         viQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mVCtFK5+Mzt3hAp57nZ3RLtIxxaSOtloZUtvAg8w8Z8=;
        b=WqcV8iIszwxpKcQ+28gAX8Rq3co0cYnDUzRc12uZ42XWTCiv6OTW0xuncukQA0K6IM
         Xkx1vjk/k6WmapIxK1wTjxFL1yP9UEWI9sCFv5JONptk2/ZTQua3Bbihntd6gOzDxtb/
         Hji/DzfqdnYiehL32uqEDsLE2sofJjwiLZLiRdrbcS7bsFTugFPYAA49C8ISyLweEfeH
         iBsAaKoNitlpG2UGmIm+Cgf8i/9qiaUeQ+jDlqcOAE8WypQTJk/QG6zj7Fz0mFJep8bC
         dxlb8f1QONgfvyWkRmIuko/D0stHoPzc/TP2VxXDdE42sDAeaRPsdzQVHpYMtuHPQ/QC
         MSnA==
X-Gm-Message-State: AO0yUKXCGD98pPXBBm82uXp0U5tpjmPvlMPn463opSuzJSH7uotiST/L
	4DN8Cht9/fO8lvlaSgP0jGhHsYfJF8j3ZMJWofI=
X-Google-Smtp-Source: AK7set8sYvuy7Swp4ow4tiyiX80IrlkMkxfPBMo7vkP9t44dgWIjcaX3D9lMBrZqlgJspQF9whRYX1nMJFdMt/TWUR0=
X-Received: by 2002:a19:f60e:0:b0:4b5:5f2d:1458 with SMTP id
 x14-20020a19f60e000000b004b55f2d1458mr1153724lfe.253.1675842187514; Tue, 07
 Feb 2023 23:43:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1675734681.git.chenfeiyang@loongson.cn> <1af05c1441e9f96870be1cc20b1162e3f5043b2e.1675734681.git.chenfeiyang@loongson.cn>
 <1e7da4e7-392d-4a9e-aa95-0599a0c84419@app.fastmail.com> <CACWXhK==yVZGZbY+3DUAuxL34=gKwQv20Cw3y1+QKir0D2F3EQ@mail.gmail.com>
 <Y+MXk9A+gB1W6T/n@1wt.eu>
In-Reply-To: <Y+MXk9A+gB1W6T/n@1wt.eu>
From: Feiyang Chen <chris.chenfeiyang@gmail.com>
Date: Wed, 8 Feb 2023 15:42:56 +0800
Message-ID: <CACWXhKn1N6f7XvtrbDno4UyAhMZbV_htQoRbm0ws9gjF08wnBw@mail.gmail.com>
Subject: Re: [PATCH 1/3] nolibc: Add statx() support to implement sys_stat()
To: Willy Tarreau <w@1wt.eu>
Cc: Arnd Bergmann <arnd@arndb.de>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Feiyang Chen <chenfeiyang@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 8 Feb 2023 at 11:31, Willy Tarreau <w@1wt.eu> wrote:
>
> Hi Feiyang,
>
> Sorry for the delay.
>
> On Wed, Feb 08, 2023 at 10:09:48AM +0800, Feiyang Chen wrote:
> > On Tue, 7 Feb 2023 at 22:31, Arnd Bergmann <arnd@arndb.de> wrote:
> (...)
> > > Given that all architectures implement statx the same way, I wonder
> > > if we can't just kill off the old function here and always use statx.
> > >
> > > That would also allow removing the architecture specific
> > > sys_stat_struct definitions in all arch-*.h files.
> > >
> >
> > Hi, Arnd,
> >
> > I'd really like to make all architectures use sys_statx() instead
> > of sys_stat(). I just fear we might get dragged into a long discussion.
> > Can I send a patch series to do this later?
>
> I generally agree with the Arnd's points overall and I'm fine with the
> rest of your series. On this specific point, I'm fine with your proposal,
> let's just start with sys_statx() only on this arch, please add a comment
> about this possibility in the commit message that brings statx(),
> indicating that other archs are likely to benefit from it as well, and
> let's see after this if we can migrate all archs to statx.
>

Hi, Arnd, Willy,

We have a problem if we just start with sys_statx() only on this arch.
When struct stat is not defined, what should we do with stat() in the
nolibc selftest?

> I'm having another comment below however:
>
> > > > +struct statx_timestamp {
> > > > +     __s64   tv_sec;
> > > > +     __u32   tv_nsec;
> > > > +     __s32   __reserved;
> > > > +};
> > > > +
> > > > +struct statx {
> > > > +     /* 0x00 */
> > > > +     __u32   stx_mask;       /* What results were written [uncond] */
> > > > +     __u32   stx_blksize;    /* Preferred general I/O size [uncond] */
> > > > +     __u64   stx_attributes; /* Flags conveying information about the file
> (...)
>
> For all these types exposed to userland that you have to define, I'd
> prefer if we would avoid using kernel-inherited types like __u32, __u64
> etc given that all other archs for now only use regular types. It's not
> critical at all but I'd prefer that we stay consistent between all archs.
> Also, based on the comments on the fields it seems to me that this file
> was just copy-pasted from some uapi header which is not under the same
> license, so that's another reason for just defining what is needed here
> if you need to define it here. And of course, if including linux/stat.h
> also works, that's by far the preferred solution which will also save
> us from having to maintain a copy!
>

I try to include linux/stat.h and it works.

Thanks,
Feiyang

> Thanks!
> Willy
