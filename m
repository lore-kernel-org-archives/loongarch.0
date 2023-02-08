Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C2C39466
	for <loongarch@lists.linux.dev>; Wed,  8 Feb 2023 11:00:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D14F6C433A0
	for <loongarch@lists.linux.dev>; Wed,  8 Feb 2023 11:00:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675854058;
	bh=9hLMEKKhd96ovtt0i/2dgYmtKqdRcf5Ck4E0zoCc1jU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=n0gFfc07YQWSeeNlCppNQm8QBQLTcNQRQQRZ0+IG6lLmly4YWxU6VCLISkwCllT/A
	 jhqAOFzq7AraR56CF5KRPGZSPjSsRs2glYBxhuA5jGFwX264AedpTkF+XJOojaNu7j
	 BhL2LyXQlGJonx/4cwWxnB2nyWFYA/HQgcSGUr8Icax33OruApdJkwYkhm2vJatirq
	 2mNZuWv/uGx5gauQZuaV7ft0yR7REhF3EqK5VKTiNKShJE+9GvWv4H52gpesHceiGD
	 Ag45z9sbXl9fLT+h3Qt/jcjnggTFDmXXmnlOCF73ofDsUMxWauvGpZHHDIQuqC5D3y
	 +qjFBj8WKLG7Q==
Received: by mail-ej1-f50.google.com with SMTP id lu11so50286998ejb.3
        for <loongarch@lists.linux.dev>; Wed, 08 Feb 2023 03:00:58 -0800 (PST)
X-Gm-Message-State: AO0yUKVfQ479i4qU+xVfGu+EP+F8nj2aOrPJT1m87Xu0OsO4SShuOZQ1
	2kVqPqNnMmYvDz5m/UWsjytAiEh87vo+8bD/3EU=
X-Google-Smtp-Source: AK7set/CnKHz8itK5vT8kZfWbn46KD9zCzHIvOBVkAZ4v39ApjrA2GpC72lUoRaj5uTY4nc2QA9HpVm7t+5xnRK7aZc=
X-Received: by 2002:a17:906:a185:b0:889:7bef:3a9d with SMTP id
 s5-20020a170906a18500b008897bef3a9dmr1938556ejy.150.1675854057107; Wed, 08
 Feb 2023 03:00:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1675851111.git.chenfeiyang@loongson.cn> <b9bbf73286238bb4657d855c9d50983aa17953e2.1675851111.git.chenfeiyang@loongson.cn>
In-Reply-To: <b9bbf73286238bb4657d855c9d50983aa17953e2.1675851111.git.chenfeiyang@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Wed, 8 Feb 2023 19:00:40 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5AvXdpYok43xA+QNz+oDEkcmQDxRdGoZ6jWTApf9mDBw@mail.gmail.com>
Message-ID: <CAAhV-H5AvXdpYok43xA+QNz+oDEkcmQDxRdGoZ6jWTApf9mDBw@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] tools/nolibc: Add statx() and make stat() rely on
 statx() when available
To: chris.chenfeiyang@gmail.com
Cc: w@1wt.eu, paulmck@kernel.org, Feiyang Chen <chenfeiyang@loongson.cn>, arnd@arndb.de, 
	jiaxun.yang@flygoat.com, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi, Feiyang,

On Wed, Feb 8, 2023 at 6:18 PM <chris.chenfeiyang@gmail.com> wrote:
>
> From: Feiyang Chen <chenfeiyang@loongson.cn>
>
> loongarch and riscv32 only have statx(). arc, hexagon, nios2 and
> openrisc have statx() and stat64() but not stat() or newstat().
> Add statx() and make stat() rely on statx() to make them happy.
Some bikesheddings, maybe it is better to use LoongArch here.

Huacai
>
> Signed-off-by: Feiyang Chen <chenfeiyang@loongson.cn>
> ---
>  tools/include/nolibc/sys.h | 51 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 51 insertions(+)
>
> diff --git a/tools/include/nolibc/sys.h b/tools/include/nolibc/sys.h
> index c4818a9c8823..46b6b3bb3b4e 100644
> --- a/tools/include/nolibc/sys.h
> +++ b/tools/include/nolibc/sys.h
> @@ -20,6 +20,7 @@
>  #include <linux/time.h>
>  #include <linux/auxvec.h>
>  #include <linux/fcntl.h> // for O_* and AT_*
> +#include <linux/stat.h>  // for statx()
>
>  #include "arch.h"
>  #include "errno.h"
> @@ -1048,12 +1049,61 @@ pid_t setsid(void)
>         return ret;
>  }
>
> +/*
> + * int statx(int fd, const char *path, int flags, unsigned int mask, struct statx *buf);
> + */
> +
> +static __attribute__((unused))
> +int sys_statx(int fd, const char *path, int flags, unsigned int mask, struct statx *buf)
> +{
> +       return my_syscall5(__NR_statx, fd, path, flags, mask, buf);
> +}
> +
> +static __attribute__((unused))
> +int statx(int fd, const char *path, int flags, unsigned int mask, struct statx *buf)
> +{
> +       int ret = sys_statx(fd, path, flags, mask, buf);
> +
> +       if (ret < 0) {
> +               SET_ERRNO(-ret);
> +               ret = -1;
> +       }
> +       return ret;
> +}
>
>  /*
>   * int stat(const char *path, struct stat *buf);
>   * Warning: the struct stat's layout is arch-dependent.
>   */
>
> +#ifdef __NR_statx
> +static __attribute__((unused))
> +int sys_stat(const char *path, struct stat *buf)
> +{
> +       struct statx stat;
> +       long ret;
> +
> +       ret = sys_statx(AT_FDCWD, path, AT_NO_AUTOMOUNT, STATX_BASIC_STATS, &stat);
> +       buf->st_dev     = ((stat.stx_dev_minor & 0xff)
> +                         | (stat.stx_dev_major << 8)
> +                         | ((stat.stx_dev_minor & ~0xff) << 12));
> +       buf->st_ino     = stat.stx_ino;
> +       buf->st_mode    = stat.stx_mode;
> +       buf->st_nlink   = stat.stx_nlink;
> +       buf->st_uid     = stat.stx_uid;
> +       buf->st_gid     = stat.stx_gid;
> +       buf->st_rdev    = ((stat.stx_rdev_minor & 0xff)
> +                         | (stat.stx_rdev_major << 8)
> +                         | ((stat.stx_rdev_minor & ~0xff) << 12));
> +       buf->st_size    = stat.stx_size;
> +       buf->st_blksize = stat.stx_blksize;
> +       buf->st_blocks  = stat.stx_blocks;
> +       buf->st_atime   = stat.stx_atime.tv_sec;
> +       buf->st_mtime   = stat.stx_mtime.tv_sec;
> +       buf->st_ctime   = stat.stx_ctime.tv_sec;
> +       return ret;
> +}
> +#else
>  static __attribute__((unused))
>  int sys_stat(const char *path, struct stat *buf)
>  {
> @@ -1083,6 +1133,7 @@ int sys_stat(const char *path, struct stat *buf)
>         buf->st_ctime   = stat.st_ctime;
>         return ret;
>  }
> +#endif /* __NR_statx */
>
>  static __attribute__((unused))
>  int stat(const char *path, struct stat *buf)
> --
> 2.39.0
>
