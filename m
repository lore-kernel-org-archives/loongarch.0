Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADF123D87
	for <loongarch@lists.linux.dev>; Wed, 20 Sep 2023 06:27:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 108A0C433C9
	for <loongarch@lists.linux.dev>; Wed, 20 Sep 2023 06:27:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695191274;
	bh=aKadO3U4TnL2TXTxl4CJlXU+DprvIkWeqJzC/Nqz8bY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Ob8Fj0WQej79SOC8XyqOwwMOcuf8FJssGyl8FfaUE9IMgbGM1dd3Z3jl7J1pCKRMQ
	 TKb6ycUEcAefJpSo9Hwa2F36Y+AY57nDuMPl0YhrIj9v1hQopKOm1cN2pqj5P5uJQm
	 +REsQQzJRypBMo7d8iASl4i6vXLGvYQja3iKK2vO4pO5XkdTsEaj2IX5IPqmdpIbNj
	 GLAOjxlP+eLiMelWhpysr2TRYRl2jW1zNm4UuuC8sHM7RjSv8XoWpz9PKD7uOUKKJZ
	 krbFBrpEZVioMVAidW13/TKPnh7wR+f6uI9HXUGd9/VRMgZpYJvRFYTTV+CDUZUIN9
	 lRm6mHPwnCgSQ==
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-52f3ba561d9so1195569a12.1
        for <loongarch@lists.linux.dev>; Tue, 19 Sep 2023 23:27:53 -0700 (PDT)
X-Gm-Message-State: AOJu0Yxzo71PAk7TD9H69FZ+erNBCq+ufg1+F2ppcYpK1lt06HcE3EOm
	nI9CRYp61vwhSbi1exwkefivdSqBGvprttx+/ng=
X-Google-Smtp-Source: AGHT+IF64244Hk3wdFHeEi52bl20YWnvHxyfaFIZqydi3XW+5eIdjSeULQiRM9dvLux5ZR38SnscT4wHQ2DEe7RpCgA=
X-Received: by 2002:a05:6402:4304:b0:530:bfb6:66cd with SMTP id
 m4-20020a056402430400b00530bfb666cdmr6449027edc.7.1695191272461; Tue, 19 Sep
 2023 23:27:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <1695113866-20120-1-git-send-email-yangtiezhu@loongson.cn>
In-Reply-To: <1695113866-20120-1-git-send-email-yangtiezhu@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Wed, 20 Sep 2023 14:27:41 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6jUBHQL-R-3SriF7R5Y5O7P2SsH8mcn6LsC4kmfZRWeg@mail.gmail.com>
Message-ID: <CAAhV-H6jUBHQL-R-3SriF7R5Y5O7P2SsH8mcn6LsC4kmfZRWeg@mail.gmail.com>
Subject: Re: [PATCH v1 0/2] LoongArch: Update the links of ABI documentation
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: Jonathan Corbet <corbet@lwn.net>, loongarch@lists.linux.dev, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Queued for loongarch-next, thanks.

Huacai

On Tue, Sep 19, 2023 at 4:57=E2=80=AFPM Tiezhu Yang <yangtiezhu@loongson.cn=
> wrote:
>
> Tiezhu Yang (2):
>   docs/LoongArch: Update the links of ABI
>   docs/zh_CN/LoongArch: Update the links of ABI
>
>  Documentation/arch/loongarch/introduction.rst                    | 4 ++-=
-
>  Documentation/translations/zh_CN/arch/loongarch/introduction.rst | 4 ++-=
-
>  2 files changed, 4 insertions(+), 4 deletions(-)
>
> --
> 2.1.0
>
>
