Received: from 1wt.eu (wtarreau.pck.nerim.net [62.212.114.60])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50CEC364
	for <loongarch@lists.linux.dev>; Wed,  8 Feb 2023 10:39:49 +0000 (UTC)
Received: (from willy@localhost)
	by mail.home.local (8.17.1/8.17.1/Submit) id 318AdaVU000323;
	Wed, 8 Feb 2023 11:39:36 +0100
Date: Wed, 8 Feb 2023 11:39:36 +0100
From: Willy Tarreau <w@1wt.eu>
To: chris.chenfeiyang@gmail.com
Cc: paulmck@kernel.org, Feiyang Chen <chenfeiyang@loongson.cn>, arnd@arndb.de,
        chenhuacai@kernel.org, jiaxun.yang@flygoat.com,
        loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/5] tools/nolibc: Add statx() and make stat() rely on
 statx() when available
Message-ID: <Y+N76C7hfcu5Ze/J@1wt.eu>
References: <cover.1675851111.git.chenfeiyang@loongson.cn>
 <b9bbf73286238bb4657d855c9d50983aa17953e2.1675851111.git.chenfeiyang@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b9bbf73286238bb4657d855c9d50983aa17953e2.1675851111.git.chenfeiyang@loongson.cn>

Hi Feiyang,

On Wed, Feb 08, 2023 at 06:17:51PM +0800, chris.chenfeiyang@gmail.com wrote:
> From: Feiyang Chen <chenfeiyang@loongson.cn>
> 
> loongarch and riscv32 only have statx(). arc, hexagon, nios2 and
> openrisc have statx() and stat64() but not stat() or newstat().
> Add statx() and make stat() rely on statx() to make them happy.

Thanks for this, that's way better. I'm just having one small request
below:

> +/*
> + * int statx(int fd, const char *path, int flags, unsigned int mask, struct statx *buf);
> + */
> +
> +static __attribute__((unused))
> +int sys_statx(int fd, const char *path, int flags, unsigned int mask, struct statx *buf)
> +{
> +	return my_syscall5(__NR_statx, fd, path, flags, mask, buf);
> +}
> +
> +static __attribute__((unused))
> +int statx(int fd, const char *path, int flags, unsigned int mask, struct statx *buf)
> +{
> +	int ret = sys_statx(fd, path, flags, mask, buf);
> +
> +	if (ret < 0) {
> +		SET_ERRNO(-ret);
> +		ret = -1;
> +	}
> +	return ret;
> +}

Please guard these inside #if defined(__NR_statx) so that this can still
be used as-is from slightly older toolchains that provide their own kernel
includes.

The rest of the series looks pretty good to me.

Thank you!
Willy
