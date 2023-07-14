Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CED7E7EB
	for <loongarch@lists.linux.dev>; Fri, 14 Jul 2023 02:52:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 513EDC433CB
	for <loongarch@lists.linux.dev>; Fri, 14 Jul 2023 02:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689303129;
	bh=Rt1Yj48o9lXp6HDz9mbRjANKY6d9BQheYKcQ48ne19I=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=HLRP6iBtERst+OmORX//AKFRHzvopLVRaeHaJmfhSWrCcmfcROoSQFDN8ojs2yg43
	 MiZXJkl5agtPU5fWlwRR8vknvjM8INYYhDVIDxr2EVyY/hfCiNCHgeue5RQDGmvfDT
	 8YXN6DywWfJAJirtG38YySzMxL2vXeCuSBRrOmPLQHyMcOgN3URo7mQqaoPKOLBjmG
	 DiihKRyjw/qD98enMb+k/fYq6fzdDLz347YZQqw4f0pXbXKnLdouwPDBE3ndY06fog
	 jPfqS3k6cbCfZnK+IB0qFo602SLLcumu+2WKP/Y4/h/czytXOVlPAyVlb8uhvHzlGt
	 0hmbJd1Zuc/Bg==
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-51e590a8ab5so1744958a12.2
        for <loongarch@lists.linux.dev>; Thu, 13 Jul 2023 19:52:09 -0700 (PDT)
X-Gm-Message-State: ABy/qLaRajhli9uOuIFnlOCaFs6a7Zs0/mK2lRYneg5gkDLm+8/Xa0t7
	PglbwJnnLgu5vSVES6i1CIeaDHWln1m+eK5J6MU=
X-Google-Smtp-Source: APBJJlF+HNL/r01EYtfL6XDOOmrLblSuixspBpbcoD5kMh/fmcTJaPgoWhiYO47QolNrWskHgmMDV5xUExT07lAkI3Q=
X-Received: by 2002:aa7:c60d:0:b0:51d:9195:400f with SMTP id
 h13-20020aa7c60d000000b0051d9195400fmr3345345edq.17.1689303127563; Thu, 13
 Jul 2023 19:52:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230711071043.4119353-1-chenfeiyang@loongson.cn>
In-Reply-To: <20230711071043.4119353-1-chenfeiyang@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Fri, 14 Jul 2023 10:51:56 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7oegnkmDOUoUbf99jkqPFBxcDBxr5L_qefv1sQERE0vQ@mail.gmail.com>
Message-ID: <CAAhV-H7oegnkmDOUoUbf99jkqPFBxcDBxr5L_qefv1sQERE0vQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] LoongArch: Allow building with kcov coverage
To: Feiyang Chen <chenfeiyang@loongson.cn>
Cc: dvyukov@google.com, andreyknvl@gmail.com, corbet@lwn.net, 
	loongarch@lists.linux.dev, kasan-dev@googlegroups.com, 
	loongson-kernel@lists.loongnix.cn, chris.chenfeiyang@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Queued for loongarch-next, thanks.


Huacai

On Tue, Jul 11, 2023 at 3:11=E2=80=AFPM Feiyang Chen <chenfeiyang@loongson.=
cn> wrote:
>
> Provide kaslr_offset() and allow building with kcov.
>
> Feiyang Chen (2):
>   LoongArch: Provide kaslr_offset() to get kernel offset
>   LoongArch: Allow building with kcov coverage
>
>  Documentation/features/debug/kcov/arch-support.txt | 2 +-
>  arch/loongarch/Kconfig                             | 2 ++
>  arch/loongarch/include/asm/setup.h                 | 6 ++++++
>  arch/loongarch/vdso/Makefile                       | 2 ++
>  4 files changed, 11 insertions(+), 1 deletion(-)
>
> --
> 2.39.3
>
