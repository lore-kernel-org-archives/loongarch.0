Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D3F33201
	for <loongarch@lists.linux.dev>; Fri, 17 Jun 2022 14:06:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B761AC341C6
	for <loongarch@lists.linux.dev>; Fri, 17 Jun 2022 14:06:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655474762;
	bh=M3TnEMUKChrPmvu0lDuzfJ0pBvn+Z6pnwM5Hhv0TOpY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=i8nweTGlj/zaz9HuO5rgxv33QtFhwylK4j2sGNp4b7iRV3p3NVg+ABJIhiqFiN5qG
	 jmeJYdgjZya8ly/KCsugev9283Grs0sJweWMT8ligMoO1NwT+2GSQOrapw+utsjx7r
	 vU8GRK9XVzldYg82ACiS2nIbmiVCfQG70+Rha5jeksMDCvf2yXLvKZXYYYWjqBJn4c
	 A+DkvPiWkuC8FkcMwSL5Vz7c4121qlnRjsHHTHt2B/NF7qKGVliGIDnMQtCVQBJ2UO
	 8L/2Wn4Hyk5kBgCp5x7rL3otDqN7maTCRfqFhwg0+DeHwJKrZdj9Scw5M4uuIV5n/3
	 H0AcGh2+xheaA==
Received: by mail-lj1-f177.google.com with SMTP id l20so4893278lji.0
        for <loongarch@lists.linux.dev>; Fri, 17 Jun 2022 07:06:02 -0700 (PDT)
X-Gm-Message-State: AJIora/A+seSzrZIMtVJ+9wOrhf704fvsGdM3eCcGXvunBPu7uC99lo2
	i4e4F34kvZuA9wbrAy3qER7ZXfekQDQHqq99yAo=
X-Google-Smtp-Source: AGRyM1uo20Xuif3wx0UPcx1nWVe3BdIk1wqZgg7uxk6qAi0zagkn09C0ZqSdp4r5kENelks1oiRBZuxZQ6pI+Avxgpw=
X-Received: by 2002:a2e:8907:0:b0:259:1208:350 with SMTP id
 d7-20020a2e8907000000b0025912080350mr4960517lji.179.1655474760696; Fri, 17
 Jun 2022 07:06:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1655469906.git.siyanteng@loongson.cn>
In-Reply-To: <cover.1655469906.git.siyanteng@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Fri, 17 Jun 2022 22:05:49 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4Ckx8QDBrEYhS9s7HS9echXtro8T-XipYmOpO3KRxZpQ@mail.gmail.com>
Message-ID: <CAAhV-H4Ckx8QDBrEYhS9s7HS9echXtro8T-XipYmOpO3KRxZpQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] docs: Improve loongarch documents
To: Yanteng Si <siyanteng@loongson.cn>
Cc: Alex Shi <alexs@kernel.org>, bobwxc@email.cn, seakeel@gmail.com, 
	Jonathan Corbet <corbet@lwn.net>, WANG Xuerui <kernel@xen0n.name>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, 
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, Yanteng Si <siyanteng01@gmail.com>, 
	loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Series applied to loongarch-fixes, thanks.

Huacai

On Fri, Jun 17, 2022 at 8:46 PM Yanteng Si <siyanteng@loongson.cn> wrote:
>
> v4:
> Modify commit message.
>
> v3:
> Modify Subject.
>
> v2:
> Fix ``inline literals``.
> Delete "=E6=B3=A8=EF=BC=9A" of zh_CN patch.
> Add fix tag.
>
> v1:
> Rewrite all the notes in the loongarch document.
> Note is an admonition, let's use the directives
> implemented in the reference reStructuredText parser.
> About reStructuredText Directives,
> see <https://docutils.sourceforge.io/docs/ref/rst/directives.html>
>
> Yanteng Si (2):
>   docs/LoongArch: Fix notes rendering by using reST directives
>   docs/zh_CN/LoongArch: Fix notes rendering by using reST directives
>
>  Documentation/loongarch/introduction.rst      | 15 ++++++++-----
>  Documentation/loongarch/irq-chip-model.rst    | 22 +++++++++++--------
>  .../zh_CN/loongarch/introduction.rst          | 14 +++++++-----
>  .../zh_CN/loongarch/irq-chip-model.rst        | 14 +++++++-----
>  4 files changed, 38 insertions(+), 27 deletions(-)
>
> --
> 2.27.0
>
