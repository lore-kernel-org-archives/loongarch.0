Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F5FA36C
	for <loongarch@lists.linux.dev>; Thu,  9 Feb 2023 02:03:10 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id u12so1302455lfq.0
        for <loongarch@lists.linux.dev>; Wed, 08 Feb 2023 18:03:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8wpbhKb6PCWqitcpF+KztK8LkCfUogfjPGXlhCk+nko=;
        b=N8dxlFPY97Zdt08adulRLRKyc1gg6nLtHX6LDy57XcJ12OFfF+zG2uy+XbcIlUPmzO
         ALheyy0jbOtIp3NtWPAGsqfg0YHzs1deQ7ZapNHSPCiuJ3+8o2U2zaGSC+txn+0aT7uj
         JuaYQvcxK3wY6BrrXA0eyiULr8cecRMCPfIRpAOiR5DRnjqbdQE/0w57QwtZkHF6cYau
         vOQk9kIoi1OUXLdFQNFETsm9WVvtbS/EQKuiBa5Wb5EyuNOZYDNks+r4vM7+pxiyRrrz
         xVM+M70s6nYomCA/MlRKaSruQu6msvtgGDtnk2NnqPCjw/x32Ugcfik8eGjO5cAs57FA
         f6xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8wpbhKb6PCWqitcpF+KztK8LkCfUogfjPGXlhCk+nko=;
        b=JFLzlS+AFlWlorpqbVTxlW83H+K5mX9XeEl9S2aEexvg7QmOAeBk1mNX1YYxsgt48O
         rbUOb3SSD8gdRDF0IRyfyWliQ/lKqYexiiki+XygZwsB2IBI/IZ1+Q4/pabxh18BLflq
         gefKDUW535oqieAnN8GGN9Kvl+ywC43vobrgGOwvgV+4uXVlB/jQv/WXBcWgGEv5XXgj
         aPtwv2D4V/r10k+bC+jt4zASq95D1oJrXc7gv0pDMqfrsLh7894sdY+QjSsfiR1/6Zhb
         j92blGPEXGrb+LlyWEf2lnMYJ8QkVZHxBZHSgPZXmLuEzaYDjs22JlMocu/KBbvkaQZ5
         goGA==
X-Gm-Message-State: AO0yUKXuiNk7dOkxoyoV5BWKOey9zTTjxyrBxRCFKic6LLF81kRju6B5
	OM5cgvmirFSbER5OlzJDjpky5W5S01kDs00znT0=
X-Google-Smtp-Source: AK7set86DF6JSVay1oyAqtnLhmYEG3+tim+RPGMEM718C2gOfldauh6tcUoygjt1ghpYvV92EwgZnXQ6eW7AHYBySE8=
X-Received: by 2002:a19:f60e:0:b0:4b5:5f2d:1458 with SMTP id
 x14-20020a19f60e000000b004b55f2d1458mr1783908lfe.253.1675908188264; Wed, 08
 Feb 2023 18:03:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1675851111.git.chenfeiyang@loongson.cn> <b9bbf73286238bb4657d855c9d50983aa17953e2.1675851111.git.chenfeiyang@loongson.cn>
 <Y+N76C7hfcu5Ze/J@1wt.eu>
In-Reply-To: <Y+N76C7hfcu5Ze/J@1wt.eu>
From: Feiyang Chen <chris.chenfeiyang@gmail.com>
Date: Thu, 9 Feb 2023 10:02:56 +0800
Message-ID: <CACWXhKmmG799esYaEZZqWwNx-UwL74r6sr0qrxrF=Li4Ehckgg@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] tools/nolibc: Add statx() and make stat() rely on
 statx() when available
To: Willy Tarreau <w@1wt.eu>
Cc: paulmck@kernel.org, Feiyang Chen <chenfeiyang@loongson.cn>, arnd@arndb.de, 
	chenhuacai@kernel.org, jiaxun.yang@flygoat.com, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 8 Feb 2023 at 18:39, Willy Tarreau <w@1wt.eu> wrote:
>
> Hi Feiyang,
>
> On Wed, Feb 08, 2023 at 06:17:51PM +0800, chris.chenfeiyang@gmail.com wrote:
> > From: Feiyang Chen <chenfeiyang@loongson.cn>
> >
> > loongarch and riscv32 only have statx(). arc, hexagon, nios2 and
> > openrisc have statx() and stat64() but not stat() or newstat().
> > Add statx() and make stat() rely on statx() to make them happy.
>
> Thanks for this, that's way better. I'm just having one small request
> below:
>
> > +/*
> > + * int statx(int fd, const char *path, int flags, unsigned int mask, struct statx *buf);
> > + */
> > +
> > +static __attribute__((unused))
> > +int sys_statx(int fd, const char *path, int flags, unsigned int mask, struct statx *buf)
> > +{
> > +     return my_syscall5(__NR_statx, fd, path, flags, mask, buf);
> > +}
> > +
> > +static __attribute__((unused))
> > +int statx(int fd, const char *path, int flags, unsigned int mask, struct statx *buf)
> > +{
> > +     int ret = sys_statx(fd, path, flags, mask, buf);
> > +
> > +     if (ret < 0) {
> > +             SET_ERRNO(-ret);
> > +             ret = -1;
> > +     }
> > +     return ret;
> > +}
>
> Please guard these inside #if defined(__NR_statx) so that this can still
> be used as-is from slightly older toolchains that provide their own kernel
> includes.
>

Hi, Willy,

OK.

Thanks,
Feiyang

> The rest of the series looks pretty good to me.
>
> Thank you!
> Willy
