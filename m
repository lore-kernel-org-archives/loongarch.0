Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43DCA800
	for <loongarch@lists.linux.dev>; Fri, 27 Oct 2023 01:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TbBCFdcv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B90E7C433C9
	for <loongarch@lists.linux.dev>; Fri, 27 Oct 2023 01:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698370823;
	bh=Tg1BcN8MTB11mXGkDAIPwyalWPjJFr1KuXuRuiuHTMY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=TbBCFdcvYbCRp/t5JHRVTV5fnyhS47C6nm8TprZpBlZPpD8hnOsITBNm29pS/lD1F
	 BzbZjnmgcGFzut+1L0AgBmL3iug/YAZ4N/Jpdb79vupM14wa4ZKR/2HVV6doJDq8Ow
	 qwBtoTD+g5MuPsDbgQqa4lkLL5z0zpKhEx2tgunnWtGurMLooyCgv3sSC0Subyvf7H
	 WPsPvitEja4WIGwRctX/80oXAyX5xCRoQ7W50OoEAdI1zWXrek2fPOTypDaD/pK2lG
	 2yDKvuibysGF2uRrfWQslR9lDHnYqH4pA+PDGgkZR7hkM6IqKPyKlfSv73YiZpMyX0
	 2rMHr9UOWFzqg==
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5230a22cfd1so2591009a12.1
        for <loongarch@lists.linux.dev>; Thu, 26 Oct 2023 18:40:23 -0700 (PDT)
X-Gm-Message-State: AOJu0Yy+9Sr+If0cfRlhl+3Uy+wPfVjF+6sOUPZUTtuUw6R1QsB8wGb2
	nufTGaLSJGXtVEse7CkJK3S7MTOyBT1Iw7QMJ+Y=
X-Google-Smtp-Source: AGHT+IFNg9bwsxZP5Gx7uA1HjiH/lO4Sf/zpLdAOH5WCN/PdxqI9L/SIz5GzGkVjk8eB0UflReyPeb/Nm1A31vLqo38=
X-Received: by 2002:a05:6402:3447:b0:53d:b1ca:293c with SMTP id
 l7-20020a056402344700b0053db1ca293cmr1154834edc.22.1698370822207; Thu, 26 Oct
 2023 18:40:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231026114446.5932-1-huangpei@loongson.cn> <20231026114446.5932-2-huangpei@loongson.cn>
 <0e0cbc68-2b4c-462d-aff4-abd795b3b63d@efficios.com>
In-Reply-To: <0e0cbc68-2b4c-462d-aff4-abd795b3b63d@efficios.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Fri, 27 Oct 2023 09:40:09 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5bCmF6Tcjg_fMBwQTRne3h2Zr+PpBZMt_KCZNzot-i4g@mail.gmail.com>
Message-ID: <CAAhV-H5bCmF6Tcjg_fMBwQTRne3h2Zr+PpBZMt_KCZNzot-i4g@mail.gmail.com>
Subject: Re: [PATCH 2/3] LoongArch: Add RSEQ_SIG break code definition
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: Huang Pei <huangpei@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Mathieu,

On Fri, Oct 27, 2023 at 2:16=E2=80=AFAM Mathieu Desnoyers
<mathieu.desnoyers@efficios.com> wrote:
>
> On 2023-10-26 07:44, Huang Pei wrote:
> > Signed-off-by: Huang Pei <huangpei@loongson.cn>
> > ---
> >   arch/loongarch/include/uapi/asm/break.h | 2 ++
>
> Why is this part of the uapi ? None of the other architecture has this
> as part of uapi. It's only defined in the rseq selftest arch-specific
> header file.
From my point of view, it makes sense to list the dedicated break code
in UAPI. It is harmless and can avoid potential conflict in future.

Huacai

>
> Thanks,
>
> Mathieu
>
> >   1 file changed, 2 insertions(+)
> >
> > diff --git a/arch/loongarch/include/uapi/asm/break.h b/arch/loongarch/i=
nclude/uapi/asm/break.h
> > index bb9b82ba59f2..e0fcfc304834 100644
> > --- a/arch/loongarch/include/uapi/asm/break.h
> > +++ b/arch/loongarch/include/uapi/asm/break.h
> > @@ -20,4 +20,6 @@
> >   #define BRK_UPROBE_BP               12      /* See <asm/uprobes.h> */
> >   #define BRK_UPROBE_XOLBP    13      /* See <asm/uprobes.h> */
> >
> > +#define BRK_RSEQ_SIG         16      /* See rseq */
> > +
> >   #endif /* __UAPI_ASM_BREAK_H */
>
> --
> Mathieu Desnoyers
> EfficiOS Inc.
> https://www.efficios.com
>
>
