Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3FC22AF07
	for <loongarch@lists.linux.dev>; Thu,  9 Jan 2025 03:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736392019; cv=none; b=oUbfR7jNLCPLd9Ye/1d4AuiNSAhzxFNlaMADhIC+WR4UK0EvQPgx9NYdAlq/2gYObWGE2wNbS0aCmaXpifExBgObeaajqQgh1ixURak48k1+/KxnL0gWSQc618tNjTIrgwhL3C3/kxWQ4oUB0QVXVb3ZYQyKkahawS294hq9Y5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736392019; c=relaxed/simple;
	bh=j0oUpGZRketH66aLGlOqEratqE7lE81u3b79GqES3KA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NOTZRI/VVEHQVrr6PYWnx5ZAJrx3Moy3GGQfqauYuAmxguLRGvGBkiLzURZEG+pA/qScy0wfJ6Yhs77eiKbE5zoJUoDU4kBNb4/TJ/SvkVfStZleiJi1O7uE72hS2bqPwQVBGu4N00tfgQYItXflmkjfHip5vYZ6tcUZUHvm8AM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dXvMIScd; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dXvMIScd"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5d3f65844deso591321a12.0
        for <loongarch@lists.linux.dev>; Wed, 08 Jan 2025 19:06:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736392016; x=1736996816; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xcvguVZbOYQiUlHNff8pHH80HFCIQo3zkHLK6WxRevg=;
        b=dXvMIScdXzVSuhZ5eVzYHn83Cs8gAmqS+gISN/YFoCKtBRSg+K14iS8Xp4thFzwFrC
         5seZeBD8fQjS9wk8OXVOzfkn3lH3UXsEiUijb2ljaNDOlJElRywFedT8j+7qkiYcZsDo
         DTOvIP2WjTV6b2yNxwSPsIhlBE3fE7K/B2ZcZMlIZMM0ojmBQvCz9HDZ99vyd5YT4Vfn
         QukDatXonS3dXqyI668FK+sCYbZjkswplr5a4A6H2nZPogGl3lKFZw2WDeScJrlp6/7d
         1vhLUTtL0xlPkJ9+buCDT/0kb72W4gGHAdx6xMwZ2b2en+Q0XRiyIlpLZ+FRMFjzw44F
         UU5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736392016; x=1736996816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xcvguVZbOYQiUlHNff8pHH80HFCIQo3zkHLK6WxRevg=;
        b=KzMgBBpA1+HbNrJKx8tC+zCUDENMP8NevDxujgnjCJLrcjP+B+P7DmnydQnH2Q9xxj
         GxbLq89tEx+zlqKMnID49raGVQYNxDsJMGWYi4ceyir9hoLBS5I8SkC3jeaZleq+2muV
         uqx8D5Cc/Jmh0XnoaZq6yaQpKzV9RPu7W0MtRPGCiJoq/lD8mJu/8NT3sYu2HnR1a86R
         D7i12/Jr3Voh6czv0PfCUI2RkcWkgyBzZCYDyTIAhp+Zlv5eo6hgXKH1LM+ounGpO43Z
         nSJ1NsV8Yj0l5tfyIZWvXg21HS+5+XBzSXQsAU/OVTGXHuMvaqMV5dgAKlomi9zX8vxR
         nzCA==
X-Forwarded-Encrypted: i=1; AJvYcCUYpBKGfeee95GhyF2q7TDJ5bsKyrUvnV+UczZ2PzKHdXLTFeTmpU72wwl2OKLC7cceiC5MEkhOwh4=@lists.linux.dev
X-Gm-Message-State: AOJu0YyhZgyPouH+1GheQc2m3sYqVcY9U0nKCF5nZxzazcDb/feCKYwV
	jEebvx/TKdbUsDcjUKeTmoKqumgJqwCQJqGelMUMmNWZ/rBI/RkffnpaD/b9wrc+Mbo8ArbMeA0
	zHda28W/scaTETfe7VGHC3Zf3+tUK2ZOwA8n4eQ==
X-Gm-Gg: ASbGncsT/lWWOHjDFl77b//o1GkBJ38lUpVoe7bv20BfNGj/YyYaXeqe31Nr7e6TCr1
	gqP9qu9k6OWuFaBh6rXRtAn1R1hmI9fRJ3Jw=
X-Google-Smtp-Source: AGHT+IGfqqtzl5vrGSo7HJcvcyDWUl65drgIH6Vv3pEl7FUmKO18JawV8JUiNayrLTBBFixjVFqVA3LHLEdBoEk5SxU=
X-Received: by 2002:a05:6402:13c6:b0:5d2:7270:6124 with SMTP id
 4fb4d7f45d1cf-5d972e484a3mr4167328a12.23.1736392016040; Wed, 08 Jan 2025
 19:06:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241225060600.3094154-1-zhoubinbin@loongson.cn>
 <526d7ad1f0b299145ab676900f81ba1a.sboyd@kernel.org> <CAMpQs4+i11DVGhdinMrE41HkC8hhD11P0BLeOaK5yW8QXUMX-Q@mail.gmail.com>
 <0757e78b02165aca65465d4e96eb6e92.sboyd@kernel.org>
In-Reply-To: <0757e78b02165aca65465d4e96eb6e92.sboyd@kernel.org>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Thu, 9 Jan 2025 11:06:43 +0800
X-Gm-Features: AbW1kvb-fi80aY0XoQiHcrnDQm4aLOeDclKMtkIp68GA6Jq64FhC6QCWI27RyFE
Message-ID: <CAMpQs4+pcqCUxXyg64_bzdi=3K-kb4mvKG7vM-yqcaoWO=TiLA@mail.gmail.com>
Subject: Re: [PATCH] clk: clk-loongson2: Fix the number count of clk provider
To: Stephen Boyd <sboyd@kernel.org>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	Michael Turquette <mturquette@baylibre.com>, Yinbo Zhu <zhuyinbo@loongson.cn>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, linux-clk@vger.kernel.org, 
	Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Stephen:

Thanks for your comments.

On Thu, Jan 9, 2025 at 3:20=E2=80=AFAM Stephen Boyd <sboyd@kernel.org> wrot=
e:
>
> Quoting Binbin Zhou (2025-01-07 17:41:43)
> > On Wed, Jan 8, 2025 at 5:25=E2=80=AFAM Stephen Boyd <sboyd@kernel.org> =
wrote:
> > > Quoting Binbin Zhou (2024-12-24 22:05:59)
> > > > diff --git a/drivers/clk/clk-loongson2.c b/drivers/clk/clk-loongson=
2.c
> > > > index 6bf51d5a49a1..b1b2038acd0b 100644
> > > > --- a/drivers/clk/clk-loongson2.c
> > > > +++ b/drivers/clk/clk-loongson2.c
> > > > @@ -294,7 +294,7 @@ static int loongson2_clk_probe(struct platform_=
device *pdev)
> > > >                 return -EINVAL;
> > > >
> > > >         for (p =3D data; p->name; p++)
> > > > -               clks_num++;
> > > > +               clks_num =3D max(clks_num, p->id + 1);
> > >
> > > NULL is a valid clk. Either fill the onecell data with -ENOENT error
> > > pointers, or stop using it and implement a custom version of
> > > of_clk_hw_onecell_get() that doesn't allow invalid clks to be request=
ed
> > > from this provider.
> >
> > Emm...
> > Just in case, how about setting all items to ERR_PTR(-ENOENT) before
> > assigning them.
> > This is shown below:
> >
> >                while (--clk_num >=3D 0)
> >                          clp->clk_data.hws[clk_num] =3D ERR_PTR(-ENOENT=
);
>
> Or something like:
>
>         memset_p(&clk->clk_data.hws, ERR_PTR(-ENOENT), clk_num);

Indeed, it looks better and cleaner.
I'll update in V2 soon.

--
Thanks.
Binbin
