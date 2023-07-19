Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 891F1C8C7
	for <loongarch@lists.linux.dev>; Wed, 19 Jul 2023 07:22:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00D97C433C7
	for <loongarch@lists.linux.dev>; Wed, 19 Jul 2023 07:22:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689751348;
	bh=v+KzWx3A540NW8aAgQGBA0OhgGvyrwyOdzXHhvq2quA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=NHG0AIdGyV6plj0mYiDIUa1yfQ5R7aui2+xWEKeiQzUzb0dxb6CtzvOOZUtFUK94I
	 /HVFlu8bollcLb61dFxUa85WDSiDjERnKi1ERRX0y9/438ka1Q/IeHiRVb7VjqUoI3
	 5yyVH21Ou7O+MCquJtxgpf+7lz4qHbMVyayzg2aCqjbpI94Ikpuxv4jla7WwvnjaVp
	 plzW8C/0FqZaWEC0XX6N9vNvircV3o+ZxJIC9K5bHt/qfqW8MYwTJ56N+WpmdEjE/m
	 HMTpWhR5yxsd3ZVqKjf9Pm/zb8ZYfmlrLBm+qFASmOHzv7sZqXghzgmSbS2ZYCkzqq
	 Cess+QHAYBsjw==
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5217bb5ae05so5506405a12.0
        for <loongarch@lists.linux.dev>; Wed, 19 Jul 2023 00:22:27 -0700 (PDT)
X-Gm-Message-State: ABy/qLZWwAoy9LYe9cyF+aCkoM8j2fHUh2Nugk94Ys0RITBBQTfo0iBS
	Q+15K7dfPxjEAtoM1pq0XfNmF9cwY7b/Lu47xWU=
X-Google-Smtp-Source: APBJJlGgFowu6dGDg4naL/LQVEuvtSanlod0S5HMByJDn7shqAJ5E7r/8oPECUcfYfFdSH/QCwseM85/5g1ZvbZFZ1c=
X-Received: by 2002:a50:ef0c:0:b0:51d:d16f:7e52 with SMTP id
 m12-20020a50ef0c000000b0051dd16f7e52mr1734736eds.29.1689751346283; Wed, 19
 Jul 2023 00:22:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230718153348.3340811-1-chenhuacai@loongson.cn> <261edc6c-e339-faeb-3045-bfe6604d1aef@web.de>
In-Reply-To: <261edc6c-e339-faeb-3045-bfe6604d1aef@web.de>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Wed, 19 Jul 2023 15:22:13 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5nNMmYZQXvoog85cgMUd+gM2QMaG3cUhYk_iGzjB=B4Q@mail.gmail.com>
Message-ID: <CAAhV-H5nNMmYZQXvoog85cgMUd+gM2QMaG3cUhYk_iGzjB=B4Q@mail.gmail.com>
Subject: Re: [PATCH v5] LoongArch: Fix CONFIG_CMDLINE_EXTEND and
 CONFIG_CMDLINE_BOOTLOADER handling
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Zhihong Dong <donmor3000@hotmail.com>, loongarch@lists.linux.dev, 
	loongson-kernel@lists.loongnix.cn, kernel-janitors@vger.kernel.org, 
	LKML <linux-kernel@vger.kernel.org>, Guo Ren <guoren@kernel.org>, 
	Huacai Chen <chenhuacai@loongson.cn>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
	Xuefeng Li <lixuefeng@loongson.cn>, Xuerui Wang <kernel@xen0n.name>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Markus,

On Wed, Jul 19, 2023 at 2:51=E2=80=AFPM Markus Elfring <Markus.Elfring@web.=
de> wrote:
>
> >                                                   =E2=80=A6, so this pa=
tch add
> > some code to fix it.
>
> Would you like to avoid a typo here?
>
> Will any other imperative change description variant become more helpful?
Thank you for pointing this out, but since Zhihong is the original
author, I don't want to completely rewrite the commit message, so just
fix the typo...

Huacai
>
> See also:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/D=
ocumentation/process/submitting-patches.rst?h=3Dv6.5-rc2#n94
>
> Regards,
> Markus
