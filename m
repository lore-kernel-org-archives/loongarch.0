Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0A7C39FD5
	for <loongarch@lists.linux.dev>; Tue,  9 Jan 2024 15:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jOa0XSgF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 475FEC433F1
	for <loongarch@lists.linux.dev>; Tue,  9 Jan 2024 15:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704813924;
	bh=CJeyjUdFowaJ++57PffTRsqi7c9fHvWQnozwKTkxhNI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=jOa0XSgFnV2a18sVeW3l+4CJdcrYBzYAQ7uGJlpFTlfywydHioO9P3jBJnYAKhRAH
	 NHjBr+zRT3JCoJNmjM73E0cgS6jQdBpl8x75dyyPS3Lzv6HtrKnRxGZjO+0ovvrpbh
	 gs89D9t7eN7XbEFtjKZEExLxu2cPp1QsA/CuhslTRKJ0oGfC+bDIBQpPmJiJ1DrHfX
	 XbWLc6NY7qVG2IFOl/DCJSdUNQDgxOHUWMvsBZeLWSn4xui+XSqhyl6CRa95Jmk+zu
	 Q71GVifC0Qkl5AuNMsh0yyYnLNaA0/TINbUPmhb3gqqzUBsAvPkAh7mg3jviqQ+HYy
	 CzUVlJLyTHi4Q==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-50e7c6e3c63so3155270e87.3
        for <loongarch@lists.linux.dev>; Tue, 09 Jan 2024 07:25:24 -0800 (PST)
X-Gm-Message-State: AOJu0YwAR8hKzOj0WqIfO9gUSv5fVUf+TvBd6nQJRupChjQXuJPg5UNm
	d0JW2H0oDtECtqyq8aFrJfxmkCmj2n9RU61ctv0=
X-Google-Smtp-Source: AGHT+IGjwYSfqYQsaI39qQ3xdxq7BDoM4HiAFP/8xVK4cxf3DV8AvYbR9DgAZiBaAOuQ+is8eB8PGA802opi3drE6z8=
X-Received: by 2002:ac2:4116:0:b0:50e:9367:66b8 with SMTP id
 b22-20020ac24116000000b0050e936766b8mr1182147lfi.30.1704813922468; Tue, 09
 Jan 2024 07:25:22 -0800 (PST)
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
 <194f95be-59f2-4c71-8642-80e5ced9bf6b@linaro.org> <CAAhV-H6qNRHmPe64P7sy14iv0m4qxyM4iwk1EmrQe6-4WE0GYQ@mail.gmail.com>
 <a1ab57e5-5321-4232-a661-9940f99adcf7@linaro.org>
In-Reply-To: <a1ab57e5-5321-4232-a661-9940f99adcf7@linaro.org>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Tue, 9 Jan 2024 23:25:10 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7z8QtCshJ-LwuqyfViG--QNGMbb=ov5uQA2H51NZp5ug@mail.gmail.com>
Message-ID: <CAAhV-H7z8QtCshJ-LwuqyfViG--QNGMbb=ov5uQA2H51NZp5ug@mail.gmail.com>
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

On Tue, Jan 9, 2024 at 11:13=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 09/01/2024 16:02, Huacai Chen wrote:
> >>>>> Applied to loongarch-next, thanks.
> >>>>>
> >>>>
> >>>> It's merge window, why do you apply patches? For which cycle?
> >>> I'm sorry I forgot to reply to the email when I applied patches, the
> >>> patches have already been pulled in linux-next some days before.
> >>
> >> Really? I cannot find them on next-20240108, so what happened?
> > Hmm, I applied patches two days ago, and they were only pulled in next-=
20240109.
>
> Two days ago is weekend, so basically one day ago and definitely not
> "some days before".
>
> Anyway two days ago merge window started, so it means you applied them
> during the merge window or immediately before. That's not good. Patches
> should be in linux-next BEFORE.
>
> >
> >>
> >> Are you aware that patches should be in next for "few next cycles"
> >> minimum (which means few days or even a week)?
> > Thank you for your reminder, when I sent my first PR, my mentor had
> > already told me this. So I will wait until next week to send PR for
> > this series.
>
> In the future, please be sure that all your patches for next PR are for
> several days in your for-next branch, thus at least for few linux-next
> cycles.
OK, I will obey this rule strictly. Thanks.

Huacai

>
>
> Best regards,
> Krzysztof
>
