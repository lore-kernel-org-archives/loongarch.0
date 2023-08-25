Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13361CA60
	for <loongarch@lists.linux.dev>; Fri, 25 Aug 2023 15:13:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6648FC433CC
	for <loongarch@lists.linux.dev>; Fri, 25 Aug 2023 15:13:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692976433;
	bh=WkhOJYLE+ues6uXybxrkDTqzwzf54+ugLpiyd1X1qD4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=hVl+dq/YMlku1ai1U5AOXCm2uo/geY18Uym7VClfr3vuDw+UwpDvc3HeAhIAGkgSu
	 VZkZYlteZ4bnxaY6Kl4Oe2AMfaVnLNxtTLuOmb56KzR+XGtdVSSgzx0YoLfjnJOWGu
	 fKI+5FoBmiXtghAmlH5Uo5KMNfXLQM3OTrnY5JUDAOaBEqk6LndCLdLLK/wGqjH4Jt
	 i3CSXz6ACvXwZrbpxOwhJxeg6DNyMr1+Ns6tiiqizxprbrOTDtfHWA7pKBl1Pk7SJW
	 gBX9MDjrBz9/zr5VBAsZkoKjhk0m2y75zOJ6ORj52OCAVBqtGAfN+5+xjNUff4UBrL
	 FiBewBKlv4Mww==
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-99c1c66876aso129778566b.2
        for <loongarch@lists.linux.dev>; Fri, 25 Aug 2023 08:13:53 -0700 (PDT)
X-Gm-Message-State: AOJu0YxsMBDbC1HUXyvpepzJIRJFRpJc+rKKg+Aj9Xuf0wujpJgeZqAu
	BqOYwW5OiSpzUtpqQ1ZX3eidOAxN+tUEKdKCS2I=
X-Google-Smtp-Source: AGHT+IHwf5sskXQeP52vSQ1CC9d7CGeC42LRXf66m6UturBCBYbtfOO65oVp7jksLJ1+wvTIJ3jfeb+r3lujLqEAoEk=
X-Received: by 2002:a17:907:2671:b0:99c:e38d:e47d with SMTP id
 ci17-20020a170907267100b0099ce38de47dmr14271574ejc.27.1692976431644; Fri, 25
 Aug 2023 08:13:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1692783907.git.zhoubinbin@loongson.cn> <3e69929008c8190cff331941dd4d34f748e5e44a.1692783907.git.zhoubinbin@loongson.cn>
 <20230823194250.GA2768550-robh@kernel.org> <CAMpQs4KQzXYDsMJesGGRVX=e_psyiik-Th2Y0CV=keU+-v86mQ@mail.gmail.com>
 <20230825-hypocrite-smoking-cc6ce8c2936b@wendy>
In-Reply-To: <20230825-hypocrite-smoking-cc6ce8c2936b@wendy>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Fri, 25 Aug 2023 23:13:39 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6LqgcHpioGU7GS0Cab7JKggGLc=TOwDsQmamuPwa4OtQ@mail.gmail.com>
Message-ID: <CAAhV-H6LqgcHpioGU7GS0Cab7JKggGLc=TOwDsQmamuPwa4OtQ@mail.gmail.com>
Subject: Re: [PATCH v4 3/7] LoongArch: Allow device trees to be built into the kernel
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Binbin Zhou <zhoubb.aaron@gmail.com>, Rob Herring <robh@kernel.org>, 
	Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org, loongson-kernel@lists.loongnix.cn, 
	Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, Hongliang Wang <wanghongliang@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Conor,

On Fri, Aug 25, 2023 at 8:01=E2=80=AFPM Conor Dooley <conor.dooley@microchi=
p.com> wrote:
>
> On Thu, Aug 24, 2023 at 11:20:34AM +0800, Binbin Zhou wrote:
> > Hi Rob:
> >
> > On Thu, Aug 24, 2023 at 3:42=E2=80=AFAM Rob Herring <robh@kernel.org> w=
rote:
> > >
> > > On Wed, Aug 23, 2023 at 05:54:51PM +0800, Binbin Zhou wrote:
> > > > Some systems do not provide a useful device tree to the kernel at b=
oot
> > > > time. Let's keep a device tree table in the kernel, keyed by the dt=
s
> > > > filename, containing the relevant DTBs.
> > >
> > > Support for this in other arches was added to support legacy bootload=
ers
> > > with no DT support. You should not need this for a new architecture. =
Fix
> > > the bootloader to provide a useful DT.
> > >
> > Yes, our bootloader already supports DT.
> >
> > Our original intention of providing kernel built-in DTS is to describe
> > all possible device information of that SoC, so that everyone can use
> > it as a reference during development; we will unlikely to add more
> > .dts files to the kernel besides the reference ones.
> >
> > And as a reference, our built-in DTS provides the most basic bootable
> > combinations (so it is generic enough) as an alternative in case the
> > DTS in the bootloader is unexpected.
> >
> > Does this make any sense?
>
> I don't see how this answers the question - as far as I can tell Rob was
> asking specifically about the building the dtb into the kernel, whereas
> your response seems to talk about havint the dts files in the kernel
> tree.
I'm sorry, but from my point of view, giving users a chance to build
the reference dts file into the kernel is not a bad idea. Of course
the commit message can be improved.

Huacai
