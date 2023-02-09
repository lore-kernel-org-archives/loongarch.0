Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11156623
	for <loongarch@lists.linux.dev>; Thu,  9 Feb 2023 02:25:38 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id v17so1271623lfd.7
        for <loongarch@lists.linux.dev>; Wed, 08 Feb 2023 18:25:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BLMhakQIT48mGbHrdvPxdUIKakGtAAFrbhrtkAP1xIc=;
        b=NAuw8qmITfKbzgSAY21VWv7uWWfH8qzLzScXXCjfhcuNIlrl9EqTGg4Wh7knFgg/3h
         mhlJbw3wsvlQQD3Bg/BBQbuwmG6UFljokJ70KU0ULTVnR6IjlT9KCfmQMgIfGg7wEPOu
         z3BCRn0AEJPlgWrIvvbOnY3sIYMGtOFVxxtTML+ZbtwxxzS9a4v/3y058xHkObHJlgDW
         83ZdzIHbjjGHkUpc9NG4HNobv5LmofmRq6SLk7BvgI5zO69J0Bgl8hh4pEx2ipDbdfUn
         cEsxu6NGZuewYaiwOrzp2tpnZoxOVXyT5pyQTrxJMWzbYviD5pJGlvuChKh/vWcy0gKL
         5efg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BLMhakQIT48mGbHrdvPxdUIKakGtAAFrbhrtkAP1xIc=;
        b=5XMh9KPlWlgkcH9BK9/372gPjqc/bDy2rIw+Rrr3ycx4Gt94erbrl9aJ6PDUVSg2iy
         4sUUOZV//rc6YHaprf05noo2YMXsoLghlZmbIWL/BXlMkszwG8tnj3rpqc6+aiyIWlw5
         qs/Ky8tBRil7tCRVwBiU5dUxmhKzbsa2zt2t/mhzJOrabgJKqrHdWbWt0igtohhjAczS
         y6128uGmVI3euwX9tRt4vb31nUx4Xdr5kgfJCx/UKt3ci1LFG9nzjRhsCgOYc5rlgWF/
         aC70SPh2fhk0bke9Db1BoIDJG6Qiy1mQ2jWyRMUIaB/zBpP3aZT7b6MwPshZEsLdd5WK
         NlEw==
X-Gm-Message-State: AO0yUKV+M4KelpHnf2wR/OADESYkzTsOGFTEKcATbfXEBcDv7xRbzGQU
	OcrPQutLCHM4dk5Kl3Pczfrs6Zb0KpQ30zGDgas=
X-Google-Smtp-Source: AK7set+tR+Pcz4be1Z2RwNX+EtODsH6ZtIZ90H7521wMHix2MU+MxbvOK6lpRZgqnZpZBD4z1KCgHzehupj747EwbNU=
X-Received: by 2002:ac2:560a:0:b0:4da:fb89:fcc5 with SMTP id
 v10-20020ac2560a000000b004dafb89fcc5mr1469342lfd.192.1675909537133; Wed, 08
 Feb 2023 18:25:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1675851111.git.chenfeiyang@loongson.cn> <b9bbf73286238bb4657d855c9d50983aa17953e2.1675851111.git.chenfeiyang@loongson.cn>
 <CAAhV-H5AvXdpYok43xA+QNz+oDEkcmQDxRdGoZ6jWTApf9mDBw@mail.gmail.com>
In-Reply-To: <CAAhV-H5AvXdpYok43xA+QNz+oDEkcmQDxRdGoZ6jWTApf9mDBw@mail.gmail.com>
From: Feiyang Chen <chris.chenfeiyang@gmail.com>
Date: Thu, 9 Feb 2023 10:25:25 +0800
Message-ID: <CACWXhKnwez6oG4ErzsCe69N-cQp3Ymab=fEk798x6DyH311i-g@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] tools/nolibc: Add statx() and make stat() rely on
 statx() when available
To: Huacai Chen <chenhuacai@kernel.org>
Cc: w@1wt.eu, paulmck@kernel.org, Feiyang Chen <chenfeiyang@loongson.cn>, arnd@arndb.de, 
	jiaxun.yang@flygoat.com, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 8 Feb 2023 at 19:00, Huacai Chen <chenhuacai@kernel.org> wrote:
>
> Hi, Feiyang,
>
> On Wed, Feb 8, 2023 at 6:18 PM <chris.chenfeiyang@gmail.com> wrote:
> >
> > From: Feiyang Chen <chenfeiyang@loongson.cn>
> >
> > loongarch and riscv32 only have statx(). arc, hexagon, nios2 and
> > openrisc have statx() and stat64() but not stat() or newstat().
> > Add statx() and make stat() rely on statx() to make them happy.
> Some bikesheddings, maybe it is better to use LoongArch here.
>

Hi, Huacai

Yes.

Thanks,
Feiyang

> Huacai
> >
> > Signed-off-by: Feiyang Chen <chenfeiyang@loongson.cn>
> > ---
> >  tools/include/nolibc/sys.h | 51 ++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 51 insertions(+)
> >
> > diff --git a/tools/include/nolibc/sys.h b/tools/include/nolibc/sys.h
> > index c4818a9c8823..46b6b3bb3b4e 100644
> > --- a/tools/include/nolibc/sys.h
> > +++ b/tools/include/nolibc/sys.h
> > @@ -20,6 +20,7 @@
> >  #include <linux/time.h>
> >  #include <linux/auxvec.h>
> >  #include <linux/fcntl.h> // for O_* and AT_*
> > +#include <linux/stat.h>  // for statx()
> >
> >  #include "arch.h"
> >  #include "errno.h"
> > @@ -1048,12 +1049,61 @@ pid_t setsid(void)
> >         return ret;
> >  }
> >
> > +/*
> > + * int statx(int fd, const char *path, int flags, unsigned int mask, struct statx *buf);
> > + */
> > +
> > +static __attribute__((unused))
> > +int sys_statx(int fd, const char *path, int flags, unsigned int mask, struct statx *buf)
> > +{
> > +       return my_syscall5(__NR_statx, fd, path, flags, mask, buf);
> > +}
> > +
> > +static __attribute__((unused))
> > +int statx(int fd, const char *path, int flags, unsigned int mask, struct statx *buf)
> > +{
> > +       int ret = sys_statx(fd, path, flags, mask, buf);
> > +
> > +       if (ret < 0) {
> > +               SET_ERRNO(-ret);
> > +               ret = -1;
> > +       }
> > +       return ret;
> > +}
> >
> >  /*
> >   * int stat(const char *path, struct stat *buf);
> >   * Warning: the struct stat's layout is arch-dependent.
> >   */
> >
> > +#ifdef __NR_statx
> > +static __attribute__((unused))
> > +int sys_stat(const char *path, struct stat *buf)
> > +{
> > +       struct statx stat;
> > +       long ret;
> > +
> > +       ret = sys_statx(AT_FDCWD, path, AT_NO_AUTOMOUNT, STATX_BASIC_STATS, &stat);
> > +       buf->st_dev     = ((stat.stx_dev_minor & 0xff)
> > +                         | (stat.stx_dev_major << 8)
> > +                         | ((stat.stx_dev_minor & ~0xff) << 12));
> > +       buf->st_ino     = stat.stx_ino;
> > +       buf->st_mode    = stat.stx_mode;
> > +       buf->st_nlink   = stat.stx_nlink;
> > +       buf->st_uid     = stat.stx_uid;
> > +       buf->st_gid     = stat.stx_gid;
> > +       buf->st_rdev    = ((stat.stx_rdev_minor & 0xff)
> > +                         | (stat.stx_rdev_major << 8)
> > +                         | ((stat.stx_rdev_minor & ~0xff) << 12));
> > +       buf->st_size    = stat.stx_size;
> > +       buf->st_blksize = stat.stx_blksize;
> > +       buf->st_blocks  = stat.stx_blocks;
> > +       buf->st_atime   = stat.stx_atime.tv_sec;
> > +       buf->st_mtime   = stat.stx_mtime.tv_sec;
> > +       buf->st_ctime   = stat.stx_ctime.tv_sec;
> > +       return ret;
> > +}
> > +#else
> >  static __attribute__((unused))
> >  int sys_stat(const char *path, struct stat *buf)
> >  {
> > @@ -1083,6 +1133,7 @@ int sys_stat(const char *path, struct stat *buf)
> >         buf->st_ctime   = stat.st_ctime;
> >         return ret;
> >  }
> > +#endif /* __NR_statx */
> >
> >  static __attribute__((unused))
> >  int stat(const char *path, struct stat *buf)
> > --
> > 2.39.0
> >
