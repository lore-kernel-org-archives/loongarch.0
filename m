Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D057DEEB2
	for <loongarch@lists.linux.dev>; Fri,  5 Apr 2024 09:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712308896; cv=none; b=FnjOSlBKUWduLTROPVQjQ75/6GE5XUE26qg9M75IirFMHhG+AGAxChAry/wE8n438+xsgXR9Rfp1oifxLfvXKivaql870rD0B/DLKUMl5SVoiM21ApZjPxoQ7xfFwCns5kc3Ly9VnTEVewi1iZ6fKTWbQ2Liugp7hZQiYkf6yEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712308896; c=relaxed/simple;
	bh=kXYJax6SMc5fEX2Qq3xhhaKTyorpIOKA/K5ZRGBzgoQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TH0DOcTI4k1NQR4XOkNzQmMIIP1D8dxF2EN8KnG29vV0JP5fe3MzHI1vRsvOmZsTyeoXfHaofdJsaXxF2tZvAHpJSJtrPGG83Mgygy4gmCU3gkCdNt46LijHVLRDJ1oLwzlDnXiXKHNwBf1JfNoMnbeUm8EgEwMnfGAQHudhDDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AEiy9Vug; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AEiy9Vug"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADFB4C433F1
	for <loongarch@lists.linux.dev>; Fri,  5 Apr 2024 09:21:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712308896;
	bh=kXYJax6SMc5fEX2Qq3xhhaKTyorpIOKA/K5ZRGBzgoQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=AEiy9VuguSsSP9FTOQZVjzlN9g+yYG5W2C6YmlATBWCiEQ1LOHjrhvb+8aTbUP2rT
	 sCP4EAeVf38No9iaKZfWYFUlJ7VXeEpZjsAXO/LrBFbpID9itooKSJ7rfMkHKBXJCn
	 OLp2dzop5QvtBgbJxfmhkIwk70cJn5mvB8UvSMMXBaNzQROFkXc0nlIwAwTEtmNGtT
	 O2+R0aUZseK6o6+uDAev04QkNvq3keFMdU+uREVDnS3eoR0oTUUl23sT0vpa+hy4od
	 K+lwjcwv2ItR3TZTqsdpmP0jXdtP2N1qWCo04cJ+l+tKsAESfwrEQlU8w2aQC17yLn
	 +sOjnUFj1824Q==
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a51a7d4466bso37041666b.2
        for <loongarch@lists.linux.dev>; Fri, 05 Apr 2024 02:21:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWpkCxJEZQoFO/ofj+/0JBO+Hjz5Afyx28Cnb8pAiMjGBqB2YGr0XCIpcsLbBVAf8qAplkyZgQz5NqMJzonkT0CnmZTzPoDFrcA
X-Gm-Message-State: AOJu0YzuIni5wrx9m5ESIcQwnp+Tc1r+/MXZ/6t5veQV89nrP8ieTWNV
	HqI+XNWteGV45xnC0qwcBP4wUFisIzOlFWmPhG+JCziIeN55qo0HknavlwqmtT/pIus6uyL+D/9
	OhvRs3cMWzI6H2Yk2gCgY+nYIZUc=
X-Google-Smtp-Source: AGHT+IHsvYvyZPc/Yacto/gLkYNUVzXawnN29Wxuvy2uRdc25PRnaix45JPTuO4eKx1jWxTqOetLynPZ9Yk3hTqjdsw=
X-Received: by 2002:a17:906:454f:b0:a46:d5b9:c2ae with SMTP id
 s15-20020a170906454f00b00a46d5b9c2aemr586797ejq.32.1712308895263; Fri, 05 Apr
 2024 02:21:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240404133642.971583-1-chenhuacai@loongson.cn>
 <20240404133642.971583-2-chenhuacai@loongson.cn> <20240404112518.51204544a4e73c2639ce53b1@linux-foundation.org>
In-Reply-To: <20240404112518.51204544a4e73c2639ce53b1@linux-foundation.org>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Fri, 5 Apr 2024 17:21:25 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6pFfFuLE9ARPCXS-5d1==H7hiEfySPnQdQbf-kiXx_XA@mail.gmail.com>
Message-ID: <CAAhV-H6pFfFuLE9ARPCXS-5d1==H7hiEfySPnQdQbf-kiXx_XA@mail.gmail.com>
Subject: Re: [PATCH 1/3] mm: Move lowmem_page_address() a little later
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Huacai Chen <chenhuacai@loongson.cn>, loongarch@lists.linux.dev, linux-mm@kvack.org, 
	Xuefeng Li <lixuefeng@loongson.cn>, Guo Ren <guoren@kernel.org>, 
	Xuerui Wang <kernel@xen0n.name>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
	linux-kernel@vger.kernel.org, loongson-kernel@lists.loongnix.cn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 5, 2024 at 2:25=E2=80=AFAM Andrew Morton <akpm@linux-foundation=
.org> wrote:
>
> On Thu,  4 Apr 2024 21:36:34 +0800 Huacai Chen <chenhuacai@loongson.cn> w=
rote:
>
> > LoongArch will override page_to_virt() which use page_address() in the
> > KFENCE case (by defining WANT_PAGE_VIRTUAL/HASHED_PAGE_VIRTUAL). So mov=
e
> > lowmem_page_address() a little later to avoid such build errors:
> >
> > error: implicit declaration of function 'page_address'.
> >
>
> Acked-by: Andrew Morton <akpm@linux-foundation.org>
>
> Please ensure that it spends adequate time in linux-next for the
> compilation testing.
OK, thanks.

Huacai
