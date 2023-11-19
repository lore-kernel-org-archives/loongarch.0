Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C3881859
	for <loongarch@lists.linux.dev>; Sun, 19 Nov 2023 04:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GvA6j/IJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B909EC433C7
	for <loongarch@lists.linux.dev>; Sun, 19 Nov 2023 04:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700369439;
	bh=zNXER7j7tF5pfX+nQwMxcuPe+WxAcejTCNbyXNYTx7s=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=GvA6j/IJYlL3C7I5ZKYNVoN+G6go5ApTuq6BluLe/OUIUtJWZFzIppKXq57jj8xt4
	 s/1o7M291ZEDOQL3hTE+DAfoTRKLGtZh94+RjWUMWnsaufo1I6GQV98sP+gXpmytL5
	 2/W7mp9fwGNqNIC/dzNTVnE9kAj+rv5C3zWQguAJRoNbDDbSny7qlI1Vria9xEjQ7x
	 3jWXK31v2Hn6b8ilfuKLLXEgZGNjBO0ACdnk4Hg/XDENlZkAnPwwuiK9ehjYow1gK7
	 5PchmuXc/advVxai77W2yT8zvAiVCL0xK8yPoGhKSG+pmgAw8YKoyuCGyojKKo06Lv
	 QBnzB2FGiW65w==
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-9c773ac9b15so444553266b.2
        for <loongarch@lists.linux.dev>; Sat, 18 Nov 2023 20:50:39 -0800 (PST)
X-Gm-Message-State: AOJu0YzkJNwt0pjA+9rq4KIqJYsL0Pj8wSbuCqfTqNIckFmNJYDWABRK
	1DVB/ihLCu6R9PvUDV/eq1LnsOBnxX6hRYF5K/g=
X-Google-Smtp-Source: AGHT+IER67XbvB5u725agtnKI/UdWgR01M3yq3KhEHCV4bUhokIYktTA+CZRvrf43+0BAq5s0Xfx+EU+7LYq8Orgj8c=
X-Received: by 2002:a17:906:34c7:b0:9c4:b8c9:1bf3 with SMTP id
 h7-20020a17090634c700b009c4b8c91bf3mr2707302ejb.27.1700369438060; Sat, 18 Nov
 2023 20:50:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1700221148.git.siyanteng@loongson.cn>
In-Reply-To: <cover.1700221148.git.siyanteng@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sun, 19 Nov 2023 12:50:25 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7-9JL1hf8_Hs3dirJ8aqgK4BGU1PANsXDDVkSHP_fe9A@mail.gmail.com>
Message-ID: <CAAhV-H7-9JL1hf8_Hs3dirJ8aqgK4BGU1PANsXDDVkSHP_fe9A@mail.gmail.com>
Subject: Re: [PATCH 0/2] Docs/LoongArch: Update links in the introduction.rst
To: Yanteng Si <siyanteng@loongson.cn>
Cc: kernel@xen0n.name, corbet@lwn.net, alexs@kernel.org, 
	wu.xiangcheng@linux.dev, linux-doc@vger.kernel.org, loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Series applied in loongarch-fixes, thanks.

Huacai

On Fri, Nov 17, 2023 at 7:47=E2=80=AFPM Yanteng Si <siyanteng@loongson.cn> =
wrote:
>
> LoongArch-Vol1 has been updated to v1.10, the links in the
> documentation are out of date. That means, everyone can't
> download it, let's update it.
>
> Yanteng Si (2):
>   Docs/LoongArch: Update arch LoongArch introduction.rst
>   Docs/zh_CN/LoongArch: Update arch LoongArch introduction.rst
>
>  Documentation/arch/loongarch/introduction.rst                 | 4 ++--
>  .../translations/zh_CN/arch/loongarch/introduction.rst        | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
>
> --
> 2.31.4
>
