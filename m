Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF65A3A1A1
	for <loongarch@lists.linux.dev>; Tue,  9 Jan 2024 15:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VeGaTvwd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F2A0C43390
	for <loongarch@lists.linux.dev>; Tue,  9 Jan 2024 15:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704812553;
	bh=yOvT1eLm6KS3irNaHppZ3zcfmUbyFhS3rXQmiybbjUE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=VeGaTvwdEX6tCVhJLuIbO2U3FcIsQc2f3oA50akWc7mmS/NwDKvqzYEC9GyrBbKFV
	 K4yGXityzmfuqQBwMCCPrzG94GDykaB4JR/AHfi7dOFIRPNZJmviSdF2Q2Vvy3llKD
	 g1hd8WWpBOXw7XCev7MRkPpujQ6CEoN982J9IVxdXR8eX2wb4PB/Rf/hhCGZ932zUw
	 N1Vi9eMALRrW3JJQvp9NbajgixuwzNaSePR55RYKpXO5Q80OZ7InjR/MXB5yXK3/cA
	 yd1mjBEfxoQmLXLaggse9zEo7OiYDLqjQPOYXiW+DTG5GxFUGVFMG9h9SRq/5MRPM9
	 x0KaXNNrG8R0A==
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a2a225e9449so307802566b.0
        for <loongarch@lists.linux.dev>; Tue, 09 Jan 2024 07:02:33 -0800 (PST)
X-Gm-Message-State: AOJu0YwqAIxfdpUwGKDrjckUJCrDDaUwr9zB7toGAf+tYkfAySgg4bQV
	Ik2ZHmMezJen8MKTgtY/Jd0SfELrDQyJekUDOks=
X-Google-Smtp-Source: AGHT+IHnV2v9eN/aIZmVnkeoFiC38HLC2asS0gH37JBhm8CFzGc/b3xoOcJgScFpoehNB1oDK1ryVXCir/FBS4/oavM=
X-Received: by 2002:a17:907:3f26:b0:a29:27ad:8eac with SMTP id
 hq38-20020a1709073f2600b00a2927ad8eacmr1049171ejc.6.1704812551848; Tue, 09
 Jan 2024 07:02:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1703229766.git.zhoubinbin@loongson.cn> <20231222-support-relieve-5d8f25292b40@spud>
 <CAMpQs4+Uwu=j56Qa_V211_hC+F4MKE6mvTVtW75M1wuAY3-p1g@mail.gmail.com>
 <20231228-ultimatum-paramedic-6c0301f56d1c@spud> <CAAhV-H6O_Ke-xJPGFmgdwNVbGkDS2P6EK3ecfgo9KkkNyi9eOg@mail.gmail.com>
 <CAAhV-H5aZc2sWhodA0+V9aWBUoD0oD4tQHiqDSyg2B-iuHDA9g@mail.gmail.com>
 <a51aec3f-3f1b-4e8a-bfaa-904ef2a79c64@linaro.org> <CAAhV-H7QQD9ida52rvkhUgzU6O1KmKD7EsNxn=7YyVZP4HXa=Q@mail.gmail.com>
 <194f95be-59f2-4c71-8642-80e5ced9bf6b@linaro.org>
In-Reply-To: <194f95be-59f2-4c71-8642-80e5ced9bf6b@linaro.org>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Tue, 9 Jan 2024 23:02:19 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6qNRHmPe64P7sy14iv0m4qxyM4iwk1EmrQe6-4WE0GYQ@mail.gmail.com>
Message-ID: <CAAhV-H6qNRHmPe64P7sy14iv0m4qxyM4iwk1EmrQe6-4WE0GYQ@mail.gmail.com>
Subject: Re: [PATCH v6 0/7] LoongArch: Add built-in dtb support
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Conor Dooley <conor@kernel.org>, Binbin Zhou <zhoubb.aaron@gmail.com>, 
	Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org, Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, Hongliang Wang <wanghongliang@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Krzysztof,

On Tue, Jan 9, 2024 at 9:33=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 09/01/2024 13:13, Huacai Chen wrote:
> > Hi,  Krzysztof,
> >
> > On Tue, Jan 9, 2024 at 7:14=E2=80=AFPM Krzysztof Kozlowski
> > <krzysztof.kozlowski@linaro.org> wrote:
> >>
> >> On 09/01/2024 10:57, Huacai Chen wrote:
> >>> Applied to loongarch-next, thanks.
> >>>
> >>
> >> It's merge window, why do you apply patches? For which cycle?
> > I'm sorry I forgot to reply to the email when I applied patches, the
> > patches have already been pulled in linux-next some days before.
>
> Really? I cannot find them on next-20240108, so what happened?
Hmm, I applied patches two days ago, and they were only pulled in next-2024=
0109.

>
> Are you aware that patches should be in next for "few next cycles"
> minimum (which means few days or even a week)?
Thank you for your reminder, when I sent my first PR, my mentor had
already told me this. So I will wait until next week to send PR for
this series.

Huacai

>
> Best regards,
> Krzysztof
>
>
