Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 609967B
	for <loongarch@lists.linux.dev>; Mon, 17 Oct 2022 00:17:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C53AC433D6
	for <loongarch@lists.linux.dev>; Mon, 17 Oct 2022 00:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665965825;
	bh=RmH0Em+mUEQfgXRh5FfsxTgViYVAlp+3YdZ6yupU9AY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=hY3Ay9re6wdH1Vw2gLbE0W4v1pf1uPrkPKH8HCPj6S0td4xlVrxGDhrYl0ZCxP20d
	 ESdaITopMB68ljfsqMtJs3BmOzpQ6BKbG9hZE4cNZY7ZVtrokQUuTh/HGYUY8hPTvY
	 JuqCvTlLVCihZeZdUqwXrs0410UbhOM5ZGKHiuy0knh6VwkKT7fyig/KJ3+dJmPkdu
	 Z/bxYn6V4MCMPRjVWMKmeVp0yaaVHlpR6QzrOZ7ByaqZH+pcneV5OZUhp7iowxIM+l
	 K+9vn8S6uEddDK6a+sO/U4kNE2aqeF5CZME/6uuP3rfwatuuRdmgwJd5+9LyxPlM2F
	 UCYNcL+HLnx6Q==
Received: by mail-ed1-f46.google.com with SMTP id a13so13910040edj.0
        for <loongarch@lists.linux.dev>; Sun, 16 Oct 2022 17:17:04 -0700 (PDT)
X-Gm-Message-State: ACrzQf0uXD0Jv2h7HFE+sla2xLMhzCv8SjGZuBho0ZEeb31VAzTjmBd4
	RSCKku1Gor4WHLXilUyM1iD8tNNQyJb3LOxeOF0=
X-Google-Smtp-Source: AMsMyM690iXp/F0qjSxqImW5oshNJm8xdDlg8EMypwugxmntB95iNOzT0EMVK3o4wDffhWCUjYB7br0thiPEizrBa2w=
X-Received: by 2002:aa7:d4d9:0:b0:45c:7eae:d8d8 with SMTP id
 t25-20020aa7d4d9000000b0045c7eaed8d8mr7975846edr.254.1665965823238; Sun, 16
 Oct 2022 17:17:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221016133418.2122777-1-chenhuacai@loongson.cn> <c1b674a37a1a04f9c84df1e9a227db68bf78e922.camel@xry111.site>
In-Reply-To: <c1b674a37a1a04f9c84df1e9a227db68bf78e922.camel@xry111.site>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Mon, 17 Oct 2022 08:16:53 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4vGt4MTXCyiSnn7cQFrxR-amLC4nKe7-EcLyT8G-Ciqg@mail.gmail.com>
Message-ID: <CAAhV-H4vGt4MTXCyiSnn7cQFrxR-amLC4nKe7-EcLyT8G-Ciqg@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: Add unaligned access support
To: Xi Ruoyao <xry111@xry111.site>
Cc: Huacai Chen <chenhuacai@loongson.cn>, loongarch@lists.linux.dev, 
	Xuefeng Li <lixuefeng@loongson.cn>, Tiezhu Yang <yangtiezhu@loongson.cn>, 
	Guo Ren <guoren@kernel.org>, Xuerui Wang <kernel@xen0n.name>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi, Ruoyao,

On Sun, Oct 16, 2022 at 11:05 PM Xi Ruoyao <xry111@xry111.site> wrote:
>
> On Sun, 2022-10-16 at 21:34 +0800, Huacai Chen wrote:
>
> > Loongson-2 series (Loongson-2K500, Loongson-2K1000)
>
> "2K1000LA"? "2K1000" is puzzling because of a name conflict with the
> MIPS-based model.
Technically this is correct, both MIPS-based and LoongArch-based
Loongson-2K1000 have no hardware support.

>
> /* snip */
>
> > +static inline unsigned long read_fpr(unsigned int fd)
> > +{
> > +#define READ_FPR(fd, __value)          \
> > +{                                      \
>
> Unnecessary curly brace pair.
OK,thanks.

>
> > +       __asm__ __volatile__(           \
> > +       "movfr2gr.d\t%0, $f%1\n\t"      \
> > +       : "=r"(__value) : "i"(fd));     \
> > +}
>
> I'm not sure if this is a correct use of "i" constraint.  Maybe we
> should just concatenate the string?
OK, thanks.

Huacai
>
> "movfr2gr.d\t%0, $f" #fd "\n\t"
>
> > +
> > +       unsigned long __value;
> > +
> > +       switch (fd) {
>
> I don't like this "very long" switch statement, but it seems we have no
> way to make it better...
>
> > +       case 0:
> > +               READ_FPR(0, __value);
> > +               break;
> > +       case 1:
> > +               READ_FPR(1, __value);
> > +               break;
> > +       case 2:
> > +               READ_FPR(2, __value);
> > +               break;
>
> --
> Xi Ruoyao <xry111@xry111.site>
> School of Aerospace Science and Technology, Xidian University
