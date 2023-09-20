Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E93443D87
	for <loongarch@lists.linux.dev>; Wed, 20 Sep 2023 06:28:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E445C433C7
	for <loongarch@lists.linux.dev>; Wed, 20 Sep 2023 06:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695191302;
	bh=dWTtYLiXevvROWNf44v5vlbKB2jrmNZUUhZpwh3HA0A=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=MKQZlOKjyaqitmYeIrmw0T7gUCuFi6a4Ec/Jp1gilVzK96z9/R6qbqc3UoxuTSXZc
	 wICa+IsOiOWYGGOt4u7jTsTQ1pnudOq8Pr35xxs78Q7HYsuDmwUhH07QvAph8bcwPS
	 SdvMAUG/+UDlG9QMu+nXvPFqW+DtSwhnHtOwN2aSo7n4/VMr9CskwknWmKy2Cbu7JH
	 CLUOoRPnBv4WDbl5L05WgNkRv0pwNbCobYK/t+Z29jJSonYDNc9bMKhZ5DCjsnILdJ
	 SM9Gq1gT4ibxvZSn/XOXo6EeSoJTpPZlF1rhBSRRsRUAodWFsmQTly617v1spbiABu
	 JYEeH+xlhRboQ==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5031426b626so5106544e87.3
        for <loongarch@lists.linux.dev>; Tue, 19 Sep 2023 23:28:22 -0700 (PDT)
X-Gm-Message-State: AOJu0Yz3RvrJoqnWv9nFYNVgR6B2tS4G2U6Tcf0fkR9uZD5kSpG2s08V
	2+3uf8fkO1RXBEy4XEuBFFKgkHi7dgFpqXfY948=
X-Google-Smtp-Source: AGHT+IG9jdqZMTkppptA+UP6abajo9eKEWATWuIrrr0su0ZAMr5pDuEa2WJrGhmF3aDIu3f9n4KvTVs0Pa6QyK+NR9A=
X-Received: by 2002:a19:2d15:0:b0:500:acf1:b432 with SMTP id
 k21-20020a192d15000000b00500acf1b432mr1279251lfj.63.1695191300666; Tue, 19
 Sep 2023 23:28:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <1695114428-20308-1-git-send-email-yangtiezhu@loongson.cn> <7aa1e5a0-c161-08d6-a2fc-0d4f65148b01@loongson.cn>
In-Reply-To: <7aa1e5a0-c161-08d6-a2fc-0d4f65148b01@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Wed, 20 Sep 2023 14:28:08 +0800
X-Gmail-Original-Message-ID: <CAAhV-H74iDp3Sv8CaJAoS1yEUYsQFkNRVABSNYz23zXAqnCrfw@mail.gmail.com>
Message-ID: <CAAhV-H74iDp3Sv8CaJAoS1yEUYsQFkNRVABSNYz23zXAqnCrfw@mail.gmail.com>
Subject: Re: [PATCH v1] LoongArch: Remove dead code in relocate_new_kernel
To: Jinyang He <hejinyang@loongson.cn>
Cc: Tiezhu Yang <yangtiezhu@loongson.cn>, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Queued for loongarch-next, thanks.

Huacai

On Tue, Sep 19, 2023 at 5:24=E2=80=AFPM Jinyang He <hejinyang@loongson.cn> =
wrote:
>
> Not need my tag. Youling found that before, and simply talked about it
> to me.
>
> Thanks.
>
>
> On 2023-09-19 17:07, Tiezhu Yang wrote:
> > The initial aim is to silence the following objtool warning:
> >
> > arch/loongarch/kernel/relocate_kernel.o: warning: objtool: relocate_new=
_kernel+0x74: unreachable instruction
> >
> > There are two adjacent "b" instructions, the second one is unreachable,
> > it is dead code, just remove it.
> >
> > Co-developed-by: Jinyang He <hejinyang@loongson.cn>
> > Signed-off-by: Jinyang He <hejinyang@loongson.cn>
> > Co-developed-by: Youling Tang <tangyouling@loongson.cn>
> > Signed-off-by: Youling Tang <tangyouling@loongson.cn>
> > Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> > ---
> >   arch/loongarch/kernel/relocate_kernel.S | 1 -
> >   1 file changed, 1 deletion(-)
> >
> > diff --git a/arch/loongarch/kernel/relocate_kernel.S b/arch/loongarch/k=
ernel/relocate_kernel.S
> > index d132525..f49f6b0 100644
> > --- a/arch/loongarch/kernel/relocate_kernel.S
> > +++ b/arch/loongarch/kernel/relocate_kernel.S
> > @@ -72,7 +72,6 @@ copy_word:
> >       LONG_ADDI       s5, s5, -1
> >       beqz            s5, process_entry
> >       b               copy_word
> > -     b               process_entry
> >
> >   done:
> >       ibar            0
>
>
