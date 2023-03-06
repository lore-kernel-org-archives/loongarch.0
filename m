Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDE197E
	for <loongarch@lists.linux.dev>; Mon,  6 Mar 2023 01:55:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BA54C4339E
	for <loongarch@lists.linux.dev>; Mon,  6 Mar 2023 01:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678067739;
	bh=LFOlhZwjqco3To24PwT/bnjj85QY4nt/PP/0xwPn7vk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=jmjgia47Nm0V2fMUC+HcgRaq5jaoDN1qK8kVi9874X3ogjTjxrzkxsqc+h4D3rArt
	 eigsRC6bbzSQLeoWETlqr735jtOdMW8DQAwymL/dEsP9IRPn45wYvy7K5MkykDk+Cn
	 9vH5fgnDsZIWyxDd+ptU0fxqBFMWgQLRVvkhur3eVMAxjLQd0Xu8B/E3EvVXJHa3vB
	 Yxqw61NI9Ac72tsDlFAIpRmsoHvrDeYMr1FMtzmRFHXMna6kEeuWyRQBdTkdz9+ZhZ
	 seYzvxO+jNDl6DZCtW6FfJeRGtHdA/+iMDGuEIuoBAz6hXftxoTvLcUM5SoPQcZrxy
	 oFQ9gtjSLNBEQ==
Received: by mail-ed1-f54.google.com with SMTP id u9so32588061edd.2
        for <loongarch@lists.linux.dev>; Sun, 05 Mar 2023 17:55:39 -0800 (PST)
X-Gm-Message-State: AO0yUKWA8dfHUD0oqC7LeYmqKCGYK+ueG8UgwcxrVCZsQ3u3/jnvLBCE
	smzUSMKTud+LBKTaEB5LABcrdCjFhR+hkRbVT5o=
X-Google-Smtp-Source: AK7set/D4BiQAR9m/qKto9etEw32s+atfviVn8FEBBDjd8K4N5zPu71rK44UGSm5NsriVjlfyEepBpjGXTI+b+9MgxU=
X-Received: by 2002:a17:906:274f:b0:877:7480:c561 with SMTP id
 a15-20020a170906274f00b008777480c561mr4377647ejd.1.1678067737750; Sun, 05 Mar
 2023 17:55:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230305052818.4030447-1-chenhuacai@loongson.cn>
 <48f508aa-ab40-7032-a68d-90d8986afb2f@xen0n.name> <CAAhV-H55QUrkYYR1Lbj=zbquiz3frX2dNAH23fAuN6eCOUddNA@mail.gmail.com>
 <58cc7e6d19628757d6d8dc192d07876288f6077e.camel@xry111.site>
In-Reply-To: <58cc7e6d19628757d6d8dc192d07876288f6077e.camel@xry111.site>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Mon, 6 Mar 2023 09:55:27 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7vv+AE-7kDf7YpU6_f_dTNxKKoRSHC6vA4aBHOVyMRAQ@mail.gmail.com>
Message-ID: <CAAhV-H7vv+AE-7kDf7YpU6_f_dTNxKKoRSHC6vA4aBHOVyMRAQ@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: Provide kernel fpu functions
To: Xi Ruoyao <xry111@xry111.site>
Cc: WANG Xuerui <kernel@xen0n.name>, Huacai Chen <chenhuacai@loongson.cn>, 
	Arnd Bergmann <arnd@arndb.de>, loongarch@lists.linux.dev, linux-arch@vger.kernel.org, 
	Xuefeng Li <lixuefeng@loongson.cn>, Guo Ren <guoren@kernel.org>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-kernel@vger.kernel.org, 
	loongson-kernel@lists.loongnix.cn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 5, 2023 at 9:28=E2=80=AFPM Xi Ruoyao <xry111@xry111.site> wrote=
:
>
> On Sun, 2023-03-05 at 20:18 +0800, Huacai Chen wrote:
> > > Might be good to provide some explanation in the commit message as to
> > > why the pair of helpers should be GPL-only. Do they touch state burie=
d
> > > deep enough to make any downstream user a "derivative work"? Or are t=
he
> > > annotation inspired by arch/x86?
> > Yes, just inspired by arch/x86, and I don't think these symbols should
> > be used by non-GPL modules.
>
> Hmm, what if one of your partners wish to provide a proprietary GPU
> driver using the FPU like this way?  As a FLOSS developer I'd say "don't
> do that, make your driver GPL".  But for Loongson there may be a
> commercial issue.
So use EXPORT_SYMBOL can make life easier?

Huacai
> --
> Xi Ruoyao <xry111@xry111.site>
> School of Aerospace Science and Technology, Xidian University
