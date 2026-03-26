Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA04130FC1A
	for <loongarch@lists.linux.dev>; Thu, 26 Mar 2026 02:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774493420; cv=none; b=rcUsP7YdwHhbL8+JAOJg/mkWozLJ8IPcDV1paWZg+gTtPCha8U6JiWRkXZ++alN5t+CTavNU79PHQv7J+zITWT4rOPRvQO2AdTWZYsbMi/KAE4fomLi5WjY7pV3bxpDO/Z2QLICI08VrvazqHc2AuMS1BtOdZihj9cJ8Ibbyrd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774493420; c=relaxed/simple;
	bh=wt3/+0UdxcZmWvy+FIM+VCkKH7ozyMa0+pxLsB0UqYM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JUV29w7455p+Bn4ZG/9riI7Omw+qTHP5cBVV6d/BSG6AkshzHeOWp/fejBJop/jWaA9sDNhhy8K5gZ2ulgwY0rEAcDKQPoQFlxidigEkfJcpv5j9qCBxL2eRDggFlX01TTau2SovnM9FBjF+jwG1VthVv2nKhWiZLJttwxyk9Ls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OuWGRSIT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OuWGRSIT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 905A1C4AF09
	for <loongarch@lists.linux.dev>; Thu, 26 Mar 2026 02:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774493419;
	bh=wt3/+0UdxcZmWvy+FIM+VCkKH7ozyMa0+pxLsB0UqYM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=OuWGRSIT4B8VKm7l0pBnXwI4/caxkf1kJ2IQO2YSS+74Z7YoapFoRhLFQmexAG/tm
	 Y9eHk2XUrRqsIqWdCb0rdfAdNbJUXkpfSbrYJEVhisnaQAXcMQ8gSIIvIFryfE5Kgy
	 RccWerUo0R3H3GHVD1FJbzrDYbyWQYjTSQFDZBh3Jj6ESkbvo7L4m+o4Rl+d14zi7q
	 HZwNFNP6PAA5OIDlN/wBrG2879IoVz4pehzcrKTyw0ziiptLNl0PWXX4ZendezQNq1
	 8ONid7RXmbnAiMtFHdaoIhCxrvJwf0n4lNVfC7BmaNzZQS/UyDzrxOao43vA52Qk4e
	 Kx+fZaNAp51lw==
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b979d16dd0cso87087666b.1
        for <loongarch@lists.linux.dev>; Wed, 25 Mar 2026 19:50:19 -0700 (PDT)
X-Gm-Message-State: AOJu0Yx7PS059aUgUizgDXPHuBTmyjaRLeoJvjLcGwJPLr0A98AgzMlx
	rQzI1ipTxL8r8YgvCcV+Xt7/U6VuPsWYS52/35MIeYWcmQdlngTPlDlaN7YZ8KYdX2Bki90hXGd
	Nc/mN1cPecicDCpGxOCmdPpjqpOwqx3o=
X-Received: by 2002:a17:907:a68a:b0:b98:6926:13ce with SMTP id
 a640c23a62f3a-b9a3f1a1666mr419594266b.21.1774493418041; Wed, 25 Mar 2026
 19:50:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260320053934.2306138-1-lijun01@kylinos.cn>
In-Reply-To: <20260320053934.2306138-1-lijun01@kylinos.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Thu, 26 Mar 2026 10:50:15 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7zpRsdVZbJDcs41WmNJqm+wnx2vB6J4Jq0y8rUzVU43g@mail.gmail.com>
X-Gm-Features: AQROBzA5xyuWYyUPzk1Zt2GW8L65Jd-hEPmGQKMXYRYNS35-JTNmmJJlyz5g9Vs
Message-ID: <CAAhV-H7zpRsdVZbJDcs41WmNJqm+wnx2vB6J4Jq0y8rUzVU43g@mail.gmail.com>
Subject: Re: [PATCH v4] LoongArch: env: fix missing NULL checks for kstrdup
To: Li Jun <lijun01@kylinos.cn>
Cc: loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Applied, thanks.

Huacai

On Fri, Mar 20, 2026 at 1:39=E2=80=AFPM Li Jun <lijun01@kylinos.cn> wrote:
>
> 1.Replacing `of_find_node_by_path("/")` with `of_root` avoids multiple
> calls to `of_node_put()`.
> 2.Fixes potential kernel oops during early boot when memory
> allocation fails while parsing CPU model from device tree.
>
> --Replacing `of_find_node_by_path("/")` with `of_root`,
>
> Signed-off-by: Li Jun <lijun01@kylinos.cn>
> ---
>  arch/loongarch/kernel/env.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
>
> diff --git a/arch/loongarch/kernel/env.c b/arch/loongarch/kernel/env.c
> index 841206fde3ab..652456768b55 100644
> --- a/arch/loongarch/kernel/env.c
> +++ b/arch/loongarch/kernel/env.c
> @@ -42,16 +42,15 @@ static int __init init_cpu_fullname(void)
>         int cpu, ret;
>         char *cpuname;
>         const char *model;
> -       struct device_node *root;
>
>         /* Parsing cpuname from DTS model property */
> -       root =3D of_find_node_by_path("/");
> -       ret =3D of_property_read_string(root, "model", &model);
> +       ret =3D of_property_read_string(of_root, "model", &model);
>         if (ret =3D=3D 0) {
>                 cpuname =3D kstrdup(model, GFP_KERNEL);
> +               if (!cpuname)
> +                       return -ENOMEM;
>                 loongson_sysconf.cpuname =3D strsep(&cpuname, " ");
>         }
> -       of_node_put(root);
>
>         if (loongson_sysconf.cpuname && !strncmp(loongson_sysconf.cpuname=
, "Loongson", 8)) {
>                 for (cpu =3D 0; cpu < NR_CPUS; cpu++)
> --
> 2.34.1
>
>
