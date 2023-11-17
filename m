Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B861634
	for <loongarch@lists.linux.dev>; Fri, 17 Nov 2023 00:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gu0DYQvV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F24BDC433C7
	for <loongarch@lists.linux.dev>; Fri, 17 Nov 2023 00:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700181997;
	bh=52vZZ4VMa5VvfSK6bdVL9eIeuQTagBJSJmhIefXMmvU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=gu0DYQvVWiloU+XZjg1t6aQpHDspYNz9EFsI/JHPaj7asPSduRu33hwihLM4rfnWx
	 flBTwoAqD7c+332titbC1ubdj41p+rH1glcBUP43QMF5kfWehlOXnoYWlMS0+bLltH
	 1F6ExDac5br/IURc7CKiGjVVDtWbtUhfRQhnhQ5F4fCRWxludqckgEWUK2XdpAf4/h
	 SFIPlbBL3ggiIUGD4zuwTK1aUFFEaWVjHB7qzLB42fyKI32PUAcHsKMl94Ggqf24aT
	 2mfDiGjpzXrKoEgL4D+OlYHGiXa1q87cK6ZrQW8T40Sei0Nk8wRJ1dJFQL8JxFKzcf
	 /vBxqznkIlEOQ==
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-540c54944c4so2774840a12.1
        for <loongarch@lists.linux.dev>; Thu, 16 Nov 2023 16:46:36 -0800 (PST)
X-Gm-Message-State: AOJu0YyKCcAG5bINYC/aUYEeFB079xUqRHR+yscQ9kZlrK3gjDYL4CZb
	WZwiF3rXY54BOHqaoojoPe4XGbhlA12S6l+G2W0=
X-Google-Smtp-Source: AGHT+IEwy7rkqpvK5sSI31UXRwIOzu/GaTn7Twr3XZgTgzDxW4cNQ8kR+1DN605eFM+iKOytn+iw9cUWvz9K9XQFr0g=
X-Received: by 2002:a05:6402:2490:b0:544:3ad0:37ad with SMTP id
 q16-20020a056402249000b005443ad037admr4133052eda.3.1700181995418; Thu, 16 Nov
 2023 16:46:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231115033350.1228588-1-sashal@kernel.org> <20231115033350.1228588-4-sashal@kernel.org>
 <CAAhV-H61R006eHGN+ujvDqrT_6AYV0XBcSaT2zyVLJi1rR=kMA@mail.gmail.com> <ZVZT27pS16Y7S9wQ@sashalap>
In-Reply-To: <ZVZT27pS16Y7S9wQ@sashalap>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Fri, 17 Nov 2023 08:46:24 +0800
X-Gmail-Original-Message-ID: <CAAhV-H78xGOBpjOW7K-dQEK3J_dQGMKDSPPET_n2A2cCMGctug@mail.gmail.com>
Message-ID: <CAAhV-H78xGOBpjOW7K-dQEK3J_dQGMKDSPPET_n2A2cCMGctug@mail.gmail.com>
Subject: Re: [PATCH AUTOSEL 6.6 4/6] LoongArch/smp: Call rcutree_report_cpu_starting()
 earlier
To: Sasha Levin <sashal@kernel.org>
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Huacai Chen <chenhuacai@loongson.cn>, maobibo@loongson.cn, palmer@rivosinc.com, 
	yangtiezhu@loongson.cn, wangliupu@loongson.cn, jpoimboe@kernel.org, 
	zhoubinbin@loongson.cn, loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 17, 2023 at 1:39=E2=80=AFAM Sasha Levin <sashal@kernel.org> wro=
te:
>
> On Wed, Nov 15, 2023 at 11:55:24AM +0800, Huacai Chen wrote:
> >Hi, Sasha,
> >
> >In 6.6 and earlier versions, rcutree_report_cpu_starting() should be
> >rcu_cpu_starting().
>
> I'll drop this one. Happy to apply a backport...
You can simply replace rcutree_report_cpu_starting() with
rcu_cpu_starting(), just one line change. :)

Huacai
>
> --
> Thanks,
> Sasha
