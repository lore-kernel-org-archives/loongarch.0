Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDC9E234984
	for <loongarch@lists.linux.dev>; Tue,  9 Sep 2025 07:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757403865; cv=none; b=qruoGPuRMNhvRhHY3YK30+K42oiCt2E30Vgu2TOh1ix1bn0YKg4sJzsUyldzlKxoyXB1pJ7kt9MvGiQy8yKfQkgHPzBFWcQZAl4reIOY8sDjHlCzyG8Z3sZG3svl6xvz79XyEFdOsl9DusAex1NGjVD8yeZTpcxIzNkdOyLG7zQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757403865; c=relaxed/simple;
	bh=4WyM0AdWxEAbZ8DBkgh+c8d/r+Xm5rEvrCtPJsPTlpE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qyH6CFpr1jzDyd6VHrmKr6NP+oJKH5rFvGbk3Xul8bX+zSuLoTqPlBTHCTS2W74ZIpzLHYuRupy9/7Q0eKWH6kmJMfS5ASozGIvyz+7i2wATHQ3PWa6kXZEbPt5vVCe+VJ1DS7KViahxFibV8sRRi5qsglhigeQ8rT0LsOUvaiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OEYpH0i6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OEYpH0i6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96F18C4AF0B
	for <loongarch@lists.linux.dev>; Tue,  9 Sep 2025 07:44:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757403865;
	bh=4WyM0AdWxEAbZ8DBkgh+c8d/r+Xm5rEvrCtPJsPTlpE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=OEYpH0i6l649sXqKc7zhL56RIdpDIPMHKjmui0rkCoC4hOYHZh0qm+T38gG0uP1LV
	 2/8rItXgZgc+VaVb9nGNoEd0dzMZQ2oa+lmpzSJRh3VN0oMEuQXsDjafwcJGe9QR7Y
	 2BxJmHxMlVgKU6eiKlV3G/Wa1+pIeFArbbnm4GlKoBHilIecpDHv6ER/f5uR2OuwKY
	 sr6KIT96cDJGbLhmeU/va5qQStKyLzbuTSi5tCIOvkOh3iOXIMp1nQqNN+pUzUaBeS
	 ODlIukMm1se8U/C+2ACnd32u+89CrzOQbG4dIUoe51yi80LsGH4VPD41SeGw7CZokW
	 8iGuPj84nkH0w==
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6263d0e4b94so5641721a12.3
        for <loongarch@lists.linux.dev>; Tue, 09 Sep 2025 00:44:25 -0700 (PDT)
X-Gm-Message-State: AOJu0Ywp9l8WtzDzhXww77KhpflEw65YXT1jBP5liFYoLKMrgtIKe1ca
	LtOeucDXj7FMCtmGZTqLl3uSBCNdrvTbxSYqzb4bWMnSgo4KotNcIIUUp625+DpXZ0HH0c5u6/t
	SjESBqhMU5Y+g6bDOFloxi6ru1BAC07o=
X-Google-Smtp-Source: AGHT+IHMhZ+oLMqWLCOD2Z5j9DT/R+U7Agd45tjcYW8JTzXUWCyeZprCu8hKKpGzLPh+gIG5bE+thw8uQfSoC1ZxlYs=
X-Received: by 2002:a17:907:940c:b0:afd:be7d:725 with SMTP id
 a640c23a62f3a-b04b17030b3mr994408066b.61.1757403864156; Tue, 09 Sep 2025
 00:44:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250909071942.1846204-1-cuitao@kylinos.cn>
In-Reply-To: <20250909071942.1846204-1-cuitao@kylinos.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Tue, 9 Sep 2025 15:44:11 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5CjH8i81dGNxaVrzdVUiTwqMUYeuBifQ0wSW_Mw9wSTw@mail.gmail.com>
X-Gm-Features: Ac12FXxf3LaqCs7jXp6D00GcZbiMdW49-LZI3fByvD8rGcT0rmebhzAWov6mjzY
Message-ID: <CAAhV-H5CjH8i81dGNxaVrzdVUiTwqMUYeuBifQ0wSW_Mw9wSTw@mail.gmail.com>
Subject: Re: [PATCH v2] LoongArch: Add a check for the return value when
 creating the kobj
To: cuitao <cuitao@kylinos.cn>
Cc: loongarch@lists.linux.dev, kernel@xen0n.name, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 9, 2025 at 3:20=E2=80=AFPM cuitao <cuitao@kylinos.cn> wrote:
>
> Add a check for the return value of kobject_create_and_add to ensure
> that the kobj allocation succeeds.
>
> Signed-off-by: cuitao <cuitao@kylinos.cn>
> ---
> v2: Removed the unnecessary modifications.
> https://lore.kernel.org/all/CAAhV-H7ECnVeOgf93SEXLHLc4wvhQMjQXDbGKCR-KXKW=
f8Vgtg@mail.gmail.com/
> ---
>  arch/loongarch/kernel/env.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/arch/loongarch/kernel/env.c b/arch/loongarch/kernel/env.c
> index c0a5dc9aeae2..f4ae894f4219 100644
> --- a/arch/loongarch/kernel/env.c
> +++ b/arch/loongarch/kernel/env.c
> @@ -109,6 +109,10 @@ static int __init boardinfo_init(void)
>         struct kobject *loongson_kobj;
>
>         loongson_kobj =3D kobject_create_and_add("loongson", firmware_kob=
j);
> +       if (!loongson_kobj) {
> +               pr_warn("loongson: Firmware registration failed.\n");
The check is useful but the warning is unnecessary, because it is not
fatal for system use.

Huacai

> +               return -ENOMEM;
> +       }
>
>         return sysfs_create_file(loongson_kobj, &boardinfo_attr.attr);
>  }
> --
> 2.48.1
>
