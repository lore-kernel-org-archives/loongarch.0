Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43C4715A0
	for <loongarch@lists.linux.dev>; Tue, 17 Jan 2023 01:38:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF11BC433D2
	for <loongarch@lists.linux.dev>; Tue, 17 Jan 2023 01:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673919503;
	bh=6I6qWiZy6+VUHL/BjgqW5ooPHVYKqIo8pjsdpLzyhJM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Uxp8WjQMOD1iV74W2WXYsEwNnKRGE0lhIviQY5FqQ7Mdw/vd5KD1zTKaC/MUyBbeD
	 39N9VNrYjQh4awIY7UQpNiFPb03zjd+EQasCWKhTtKI5iMWQnx2ZVOzuccryhPs9tg
	 oBOCUGok/coBej/8h+M8P/L+heGRslB68jIrvQgOdnvCZqOYuMI1AMQXgrgdO05LSQ
	 3DMTvv6As2f1rFB8414m5OkdZ3ApipyrNzZyWrIU/lNgykeAaY97+hm9/0dsCvC9YL
	 STEDKiZzkHOqBmFPtLlE4G4w59DEojLNKVkuqe6ylERUzozi0wFr3emkaNBpEa+GNp
	 nt/ztCsuE5Rog==
Received: by mail-ej1-f46.google.com with SMTP id qx13so13544087ejb.13
        for <loongarch@lists.linux.dev>; Mon, 16 Jan 2023 17:38:22 -0800 (PST)
X-Gm-Message-State: AFqh2kpR5d1CTVT8qKUEe6ZTcyRtFlXeOrog/qfA5xSqqFL1qaz371ZN
	WD7ldnXJoN7TgXi8g3L6dK4yAAyJj7y1jG/0Tew=
X-Google-Smtp-Source: AMrXdXsuy/+hu9YZJiwbj1ERS++KdqjNREl+w+fhFyyt/KJk1es4EKClr4/cdxR7/yu/s8nsvUMnoQ/MeClPnRlUkGk=
X-Received: by 2002:a17:906:a28a:b0:7c0:ff76:7866 with SMTP id
 i10-20020a170906a28a00b007c0ff767866mr58519ejz.272.1673919501199; Mon, 16 Jan
 2023 17:38:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <1673255274-18238-1-git-send-email-tangyouling@loongson.cn>
 <1673255274-18238-2-git-send-email-tangyouling@loongson.cn>
 <6f1a1f3c-4569-c427-76ae-2f7093cb5e9f@loongson.cn> <CAAhV-H55Kj4gMnORHfQUYJ3KBueLv7j+ktkNP9cE-=32nEShzg@mail.gmail.com>
 <972e4d0c69dea4e9659eb9459072b2b7b2fd963b.camel@xry111.site>
In-Reply-To: <972e4d0c69dea4e9659eb9459072b2b7b2fd963b.camel@xry111.site>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Tue, 17 Jan 2023 09:38:11 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7KpR3wKUYVR2mSfbCuwbONAmPwSB9oaLAE-4zGhx1r4g@mail.gmail.com>
Message-ID: <CAAhV-H7KpR3wKUYVR2mSfbCuwbONAmPwSB9oaLAE-4zGhx1r4g@mail.gmail.com>
Subject: Re: [PATCH 1/4] LoongArch: Use trampoline for exception handlers and
 kill la.abs
To: Xi Ruoyao <xry111@xry111.site>
Cc: Jinyang He <hejinyang@loongson.cn>, Youling Tang <tangyouling@loongson.cn>, 
	Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, Jan 16, 2023 at 1:41 PM Xi Ruoyao <xry111@xry111.site> wrote:
>
> On Mon, 2023-01-16 at 09:30 +0800, Huacai Chen wrote:
> > On Sat, Jan 14, 2023 at 2:38 PM Jinyang He <hejinyang@loongson.cn>
> > wrote:
> > >
> > > Hi, Ruoyao and Youling,
> > >
> > > I care about the performance when NUMA enabled. We set CSR.EENTRY
> > > for each possible cpus where is NUMA-relative. So, I guess the more
> > > codes in NUMA-relative memory makes more performance. If we just set
> > > handler_trampoline as exception handler, the performance may be
> > > influenced.
> > So copying both the handlers and handler_trampoline can solve the
> > problem? If that is possible, please do that on top of the latest code
> > in
> > https://github.com/loongson/linux/commits/loongarch-next
>
> Hi folks,
>
> I just wrote the trampoline code as a PoC to show "relocatable kernel
> can work" and there must be some better way.  But I'm too sad to write
> any serious code in this month, and I don't have access to a LoongArch
> NUMA system.  So I think it's better to leave the job for you guys now
> :).
Hmm, I hope this series can be merged in 6.3. :)

Huacai
>
> Best regards
>
> --
> Xi Ruoyao <xry111@xry111.site>
> School of Aerospace Science and Technology, Xidian University
