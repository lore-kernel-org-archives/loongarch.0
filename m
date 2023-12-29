Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 276B611CBA
	for <loongarch@lists.linux.dev>; Fri, 29 Dec 2023 15:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T1WAKmSL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90B84C433CB
	for <loongarch@lists.linux.dev>; Fri, 29 Dec 2023 15:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703862646;
	bh=SvBX/eCbZWF+DTvCkFPRMPOUIUGWSf/TKZf+zNov1RU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=T1WAKmSLGOTr5CHVwatLdTU0u8sPsFvt6JF8+TMoedS2VPuqyMssoYeKwDJuV4ctc
	 tEM3J6Ot0nLvtvxTeO+7JUhgEzQuZpph4hu7xTdQNDeXCHjXrGiBtvkZb1pVRGkCZu
	 FvADqJtyns92WmbqpaU69sC/Hl6PQjwnBFC6WAROZqYvvCFUnYcP/YDKmbYCn4cK2E
	 yDo1BeKeCwSgkI8c3iuzJPApCkgZGGeossm/HKBKOqSOyssJjYZIeNQ1eqPBZrnSDB
	 cVwCJ56tOPubdYB8CkqN/Rxl5vALQGfreXr7If6EkKWl24ecVW/Vql0fvYcpPDZf5S
	 +p1nDKF5cfYaw==
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a2356bb40e3so574746166b.1
        for <loongarch@lists.linux.dev>; Fri, 29 Dec 2023 07:10:46 -0800 (PST)
X-Gm-Message-State: AOJu0YyM/HvNTzZpS4F1v85PK46pPgvTUtZyihBw9Jhu7rQQBXzQJmoE
	y+JakXPGRkQDSDL5/xTpZW5UwIYOyV3AtMy6gb4=
X-Google-Smtp-Source: AGHT+IHkSCveTRbo6tJ+d9eQPxijP4045Bs1Z54IdHcgWRrymlTKGMmopvvWmoGT3rYlTgKSStzpXqs2kwPHPgfPJQk=
X-Received: by 2002:a17:906:b10b:b0:a27:5342:aca4 with SMTP id
 u11-20020a170906b10b00b00a275342aca4mr2361684ejy.3.1703862645044; Fri, 29 Dec
 2023 07:10:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1703229766.git.zhoubinbin@loongson.cn> <20231222-support-relieve-5d8f25292b40@spud>
 <CAMpQs4+Uwu=j56Qa_V211_hC+F4MKE6mvTVtW75M1wuAY3-p1g@mail.gmail.com> <20231228-ultimatum-paramedic-6c0301f56d1c@spud>
In-Reply-To: <20231228-ultimatum-paramedic-6c0301f56d1c@spud>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Fri, 29 Dec 2023 23:10:33 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6O_Ke-xJPGFmgdwNVbGkDS2P6EK3ecfgo9KkkNyi9eOg@mail.gmail.com>
Message-ID: <CAAhV-H6O_Ke-xJPGFmgdwNVbGkDS2P6EK3ecfgo9KkkNyi9eOg@mail.gmail.com>
Subject: Re: [PATCH v6 0/7] LoongArch: Add built-in dtb support
To: Conor Dooley <conor@kernel.org>
Cc: Binbin Zhou <zhoubb.aaron@gmail.com>, Binbin Zhou <zhoubinbin@loongson.cn>, 
	Huacai Chen <chenhuacai@loongson.cn>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org, Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, Hongliang Wang <wanghongliang@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This series is good enough for me, I will apply it to the loongarch
tree after [1] is merged.

[1] https://lore.kernel.org/loongarch/cover.1701933946.git.zhoubinbin@loong=
son.cn/T/#t

Huacai

On Thu, Dec 28, 2023 at 10:09=E2=80=AFPM Conor Dooley <conor@kernel.org> wr=
ote:
>
> On Wed, Dec 27, 2023 at 12:04:59PM +0600, Binbin Zhou wrote:
> >
> > Ah, yes, I tried looking at the `hwloc-ls` output before committing,
> > and it's below(LS2K1000):
> >
> > [root@fedora ~]# hwloc-ls
> > Machine (7730MB total)
> >   Package L#0
> >     NUMANode L#0 (P#0 7730MB)
> >     L2 L#0 (1024KB)
> >       L1d L#0 (32KB) + L1i L#0 (32KB) + Core L#0 + PU L#0 (P#0)
> >       L1d L#1 (32KB) + L1i L#1 (32KB) + Core L#1 + PU L#1 (P#1)
> >
> > It's the same as what we actually have.
>
>
> Yeah, that looks to be about what I would expect, thanks.
