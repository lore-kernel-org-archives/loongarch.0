Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E24922F1FD9
	for <loongarch@lists.linux.dev>; Sat, 13 Dec 2025 12:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765628669; cv=none; b=Hrm4aFFNolv1k6eEqa99hdqd4LoOSIPQfVGSqjFctKomA144lNl5aaSc6V3Ha6XEun9Eh/hke3jX5mlX62qRC4xowZRA7VsB6WWQ1ZtYvUbRwnDH61ga3ALDtm8Yn2nDhLy6E07pNUSWf6l2v0dy15yoyxz3jA0DEf51rLDC/BY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765628669; c=relaxed/simple;
	bh=0nvWR+tu97JmBkSWSrilHWi/dts+LrLrvVc/wqgWmGA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sEiwiYOQO109k8Fql8scCNFoeXjrtY7jqwCFQvtT0Bv5YXCvFs/y79p8WZ3VSPl32LxQFxcLtFgU7iW7IaUsByBclqCQAS7mrOzqTqXpPI/uhd3Zv0iUUZBMgsxeJVgNGUMvA5v99LtKCqWcSRXawzREW7Eqp4qtOWbBzhIJemM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RkjbnF6W; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RkjbnF6W"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 834A8C4CEFB
	for <loongarch@lists.linux.dev>; Sat, 13 Dec 2025 12:24:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765628668;
	bh=0nvWR+tu97JmBkSWSrilHWi/dts+LrLrvVc/wqgWmGA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=RkjbnF6W4wcFF2orBnFucgXPTIlyJRkLpeCeBLR4c2lq7goDK7rOa8qopch+wxD9j
	 vLzN71dXeTmz6aTmopgzMWX3sD1HVqj7zgYtuMVDOc6Oy2wc5WFoqyvncOm2KtpxPj
	 mcnucw5jT9f6C8l/wo16KcM0hLI+tpr+xRhJqw0BBzgad6rSbqy0kl8x5qQ82/xWv5
	 J+aI1Q1DvXdeiy7XqI2/SsCm46WzhF9smoOhd9cWp3tmRU2B3vo97e8aQ9aZymrrNS
	 tarigVYdBevVTwqfy8j5CdoLlcdoFOYuRyygGFy7m6lOYluzfeBDzB+LUZsyFj18Xc
	 Iru4AiFgKK94Q==
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b7a72874af1so319128466b.3
        for <loongarch@lists.linux.dev>; Sat, 13 Dec 2025 04:24:28 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVXTYEdke/qG3CRRN4m8vJvlzTwL0ZzJvUl6UkckYbFFQzhZlU/+qoVAbLfoW6aNKlVFWgu1G1o2d8=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxs6J3hIlYhEBe8dY6QbYYd08viZUfsCMXssjaph3+SZYqCMks3
	GgN+dLMGoOHAkbsAqUpIB8I/GmlmGrqXJXULlP8LXtXXVOIdbuV4Q9buBPsFUtGBw1KmDrxyWpy
	pBwGz/uWE6GU7h0QeQRP6OQQ4zhbYgjA=
X-Google-Smtp-Source: AGHT+IHNLRP6UVo9KHjNOndBjUD8SBQQZdHNUGmq+vFhVViP2bJl2+A57gqQDn/rJA+zEdAkA/7U2IaSZWoVVlS/HJM=
X-Received: by 2002:a17:907:60cf:b0:b79:eaf6:8f5e with SMTP id
 a640c23a62f3a-b7d236292b0mr540689066b.14.1765628667109; Sat, 13 Dec 2025
 04:24:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251209061809.15994-1-yangtiezhu@loongson.cn>
 <CAAhV-H6zjWXjjuoOkRov4886E82QRH=3NnkhP2e4hroSJr1UXg@mail.gmail.com>
 <92bf0e88-da14-20ce-137a-3e7777e19af3@loongson.cn> <ba1494da-a407-3acb-a5d1-8fbd9498b6c6@loongson.cn>
 <a1674623-4c08-1f4d-3e4e-5511b579e9ea@loongson.cn>
In-Reply-To: <a1674623-4c08-1f4d-3e4e-5511b579e9ea@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sat, 13 Dec 2025 20:24:38 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4UpzqUiEi7Qfc2qtU1hm=yR9hYfaUGfrAtQssrk6qWOA@mail.gmail.com>
X-Gm-Features: AQt7F2r2bD8_MuQvepyvkJNIoCbNqWDHlxeQRsV5l_fBQQ1LQbN6H3Tn-8jtmdM
Message-ID: <CAAhV-H4UpzqUiEi7Qfc2qtU1hm=yR9hYfaUGfrAtQssrk6qWOA@mail.gmail.com>
Subject: Re: [PATCH v1] LoongArch: Remove unnecessary checks in bt_address()
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: Bibo Mao <maobibo@loongson.cn>, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 10, 2025 at 4:00=E2=80=AFPM Tiezhu Yang <yangtiezhu@loongson.cn=
> wrote:
>
> On 2025/12/10 =E4=B8=8A=E5=8D=8810:25, Bibo Mao wrote:
> >
> >
> > On 2025/12/10 =E4=B8=8A=E5=8D=889:28, Tiezhu Yang wrote:
> >> On 2025/12/9 =E4=B8=8B=E5=8D=884:30, Huacai Chen wrote:
> >>> Hi, Tiezhu,
> >>>
> >>> On Tue, Dec 9, 2025 at 2:18=E2=80=AFPM Tiezhu Yang <yangtiezhu@loongs=
on.cn>
> >>> wrote:
> >>>>
> >> ...
> >>>>          extern unsigned long eentry;
> >>>>
> >>>> -       if (__kernel_text_address(ra))
> >>>> -               return ra;
> >>>> -
> >>>> -       if (__module_text_address(ra))
> >>>> -               return ra;
> >>> I think the correct way is to remove the __module_text_address()
> >>> condition but keep the __kernel_text_address() condition. Then return
> >>> 0 at the end of this function, and remove the __kernel_text_address()
> >>> condition out of this function.
> >>
> >> It can not remove the check of __kernel_text_address() after calling
> >> bt_address() because it needs to validate the calculated address for
> >> exception, then no need to keep the __kernel_text_address() condition
> >> in bt_address() because it will check the PC outside bt_address().
> >          state->pc =3D bt_address(pc);
> >          if (!state->pc) {
> >                  pr_err("cannot find unwind pc at %p\n", (void *)pc);
> >                  goto err;
> >          }
> >
> >          if (!__kernel_text_address(state->pc))
> >                  goto err;
> > I guess that you both comes from different views :) one treats these
> > piece of code into one, one only views function bt_address().
> >
> > Especially with if (!state->pc), how could this happen?
>
> IMO, state->pc will be not 0 forever in practice, this check is just an
> error path and can be removed too if possible.
bt_address() return ra both in "good path" and "bad path" is strange.
I still suggest using my method, but move __kernel_text_address()
after the "if (ra >=3D eentry && ra < eentry +  EXCCODE_INT_END *
VECSIZE)" block to verify the modified ra.

Huacai

>
> Thanks,
> Tiezhu
>
