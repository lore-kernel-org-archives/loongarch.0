Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B14436C
	for <loongarch@lists.linux.dev>; Thu,  9 Feb 2023 02:06:42 +0000 (UTC)
Received: by mail-lj1-f181.google.com with SMTP id l3so506917ljo.5
        for <loongarch@lists.linux.dev>; Wed, 08 Feb 2023 18:06:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0m8ClOBeLQBsFwYLC8fvKLy64TPmQMW0ZakgoVvvjGc=;
        b=CbyN7eeNvfvF8O6Ed8EfIbWYfhz0RmbKIfdZ7jY2FB3bljqDCNusmPKMAye5stuTxr
         ZuobiulOFVfKgXWBBBaykoOb2SzSeIMtwuvAtGqpZCYNb0e2d2ZvmmaVjE9S4jvKXyK3
         9LThIKPRA0lQnKxvqJWRT13+1QvUAtlheOgYfAAdH2WZxMpV+yofoQ8glvIs2fowncmy
         YLw+lg9ofOoFNNR86xfeFj1dxzPCP0a5+yTSxo0J++1HOc/7ZUFQtaloIZMmOYm+FWWi
         Vi9CNP3z25u7TQ1zfeinZwgz8evuZaCJj7fMefbw7WQpSfiZKLQ5SzR+Og8CPAkpYHrZ
         joMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0m8ClOBeLQBsFwYLC8fvKLy64TPmQMW0ZakgoVvvjGc=;
        b=lRB0jp+5bY/P6JuZQTuqg5nRJUATjdRZVGMGknPGwXsSikBq2sdI0ws3ZjbvppsRgp
         0Ox7hy6grMjwfou4frSk0wkRipvjbV7ufuK1ok63GyoenMiEEmVVic2h+3PXvUxz2++B
         DqtaB9MprgGsfJe2y6rcDbWgSJY+GetlDckXi/IVyRaCyVHwGQDbHIRlrp5KTwFXk1kY
         X0Go1BKFcKlaouCdnosMSYceD8dZ1Muk2lnKvhzdOVRpaVuAuvGca728zUTQ7oIwIL7U
         eldc7b3+cp6G7wRb2qg+QMPY4tBvcNX+YCAJmkoKHRlHtYIkGP6AjYGjKS1zo17W1Hpk
         wHbg==
X-Gm-Message-State: AO0yUKV+7BIba890f2OcBksZzKMeRk3acv7llKyzUPT+eMBnjphSM5nE
	smxu19Kiipnc/zrG72FsQ7qc3kXz9Kv7V4/tJmQ=
X-Google-Smtp-Source: AK7set/cX7oRU8Ph9dAePM9HoAKAnJRDkcfe5HXpDbEQvp9aX0nYdqzeiWQckb7xZIcd2O46Wrn7X9AvpDztrm+wecE=
X-Received: by 2002:a2e:90d3:0:b0:293:2fe9:6ab1 with SMTP id
 o19-20020a2e90d3000000b002932fe96ab1mr80868ljg.24.1675908400403; Wed, 08 Feb
 2023 18:06:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1675851111.git.chenfeiyang@loongson.cn> <b9bbf73286238bb4657d855c9d50983aa17953e2.1675851111.git.chenfeiyang@loongson.cn>
 <e09b458a-32bf-46aa-b509-a383e34d4888@app.fastmail.com>
In-Reply-To: <e09b458a-32bf-46aa-b509-a383e34d4888@app.fastmail.com>
From: Feiyang Chen <chris.chenfeiyang@gmail.com>
Date: Thu, 9 Feb 2023 10:06:28 +0800
Message-ID: <CACWXhKmQGhSS6u7Jm=JuG7wiUBExNrmZMez50eWN=1u+voOuwA@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] tools/nolibc: Add statx() and make stat() rely on
 statx() when available
To: Arnd Bergmann <arnd@arndb.de>
Cc: Willy Tarreau <w@1wt.eu>, "Paul E. McKenney" <paulmck@kernel.org>, Feiyang Chen <chenfeiyang@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
	loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 8 Feb 2023 at 18:39, Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Wed, Feb 8, 2023, at 11:17, chris.chenfeiyang@gmail.com wrote:
> > From: Feiyang Chen <chenfeiyang@loongson.cn>
> >
> > loongarch and riscv32 only have statx(). arc, hexagon, nios2 and
> > openrisc have statx() and stat64() but not stat() or newstat().
> > Add statx() and make stat() rely on statx() to make them happy.
>
> > +#ifdef __NR_statx
> > +static __attribute__((unused))
> > +int sys_stat(const char *path, struct stat *buf)
> > +{
>
> The actual #ifdef check here does what I had suggested first, using
> statx() for all architectures, rather than what you describe in the
> changelog. I think you should keep the check from the first version,
> testing for __NR_stat/__NR_newfstatat and keep the changelog text
> here. Also please add something about the possibility of using statx()
> everywhere in the future.
>

Hi, Arnd,

OK, I will keep the check from the first version and mention that we
may use statx() everywhere.

Thanks,
Feiyang

>       Arnd
