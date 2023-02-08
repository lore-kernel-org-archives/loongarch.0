Received: from 1wt.eu (wtarreau.pck.nerim.net [62.212.114.60])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10BEA7F
	for <loongarch@lists.linux.dev>; Wed,  8 Feb 2023 03:32:47 +0000 (UTC)
Received: (from willy@localhost)
	by mail.home.local (8.17.1/8.17.1/Submit) id 3183VVfp029045;
	Wed, 8 Feb 2023 04:31:31 +0100
Date: Wed, 8 Feb 2023 04:31:31 +0100
From: Willy Tarreau <w@1wt.eu>
To: Feiyang Chen <chris.chenfeiyang@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, "Paul E. McKenney" <paulmck@kernel.org>,
        Feiyang Chen <chenfeiyang@loongson.cn>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>, loongarch@lists.linux.dev,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] nolibc: Add statx() support to implement sys_stat()
Message-ID: <Y+MXk9A+gB1W6T/n@1wt.eu>
References: <cover.1675734681.git.chenfeiyang@loongson.cn>
 <1af05c1441e9f96870be1cc20b1162e3f5043b2e.1675734681.git.chenfeiyang@loongson.cn>
 <1e7da4e7-392d-4a9e-aa95-0599a0c84419@app.fastmail.com>
 <CACWXhK==yVZGZbY+3DUAuxL34=gKwQv20Cw3y1+QKir0D2F3EQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACWXhK==yVZGZbY+3DUAuxL34=gKwQv20Cw3y1+QKir0D2F3EQ@mail.gmail.com>

Hi Feiyang,

Sorry for the delay.

On Wed, Feb 08, 2023 at 10:09:48AM +0800, Feiyang Chen wrote:
> On Tue, 7 Feb 2023 at 22:31, Arnd Bergmann <arnd@arndb.de> wrote:
(...)
> > Given that all architectures implement statx the same way, I wonder
> > if we can't just kill off the old function here and always use statx.
> >
> > That would also allow removing the architecture specific
> > sys_stat_struct definitions in all arch-*.h files.
> >
> 
> Hi, Arnd,
> 
> I'd really like to make all architectures use sys_statx() instead
> of sys_stat(). I just fear we might get dragged into a long discussion.
> Can I send a patch series to do this later?

I generally agree with the Arnd's points overall and I'm fine with the
rest of your series. On this specific point, I'm fine with your proposal,
let's just start with sys_statx() only on this arch, please add a comment
about this possibility in the commit message that brings statx(),
indicating that other archs are likely to benefit from it as well, and
let's see after this if we can migrate all archs to statx.

I'm having another comment below however:

> > > +struct statx_timestamp {
> > > +     __s64   tv_sec;
> > > +     __u32   tv_nsec;
> > > +     __s32   __reserved;
> > > +};
> > > +
> > > +struct statx {
> > > +     /* 0x00 */
> > > +     __u32   stx_mask;       /* What results were written [uncond] */
> > > +     __u32   stx_blksize;    /* Preferred general I/O size [uncond] */
> > > +     __u64   stx_attributes; /* Flags conveying information about the file
(...)

For all these types exposed to userland that you have to define, I'd
prefer if we would avoid using kernel-inherited types like __u32, __u64
etc given that all other archs for now only use regular types. It's not
critical at all but I'd prefer that we stay consistent between all archs.
Also, based on the comments on the fields it seems to me that this file
was just copy-pasted from some uapi header which is not under the same
license, so that's another reason for just defining what is needed here
if you need to define it here. And of course, if including linux/stat.h
also works, that's by far the preferred solution which will also save
us from having to maintain a copy!

Thanks!
Willy
