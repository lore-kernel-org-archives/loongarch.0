Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8A991C84D7
	for <loongarch@lists.linux.dev>; Tue,  9 Dec 2025 04:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765253636; cv=none; b=P7+vG4NfER7TxDSyWvoi31W4KOmSmeVhL/NbBGoDtOlxNirmkktKaWsbhm9qf4cajmsieVSfW8heLrA64sJ0pjtvp+s6POX8JbX2+1KVYlcywpa3oY3Em3ejFxSsM7k4Rw7oRlPB+v+ZpnKC6dQsv3RTZ8RqtoAr5stxB/7t6r8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765253636; c=relaxed/simple;
	bh=K7Qa1+Vf/bUdx66tRqBc2JjOhwBwoU1qNNdQz7b27WY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mdolljkacXnAMy8rrOWETPs81jA514S//fioOFRS3AyuypS8MpCiwrA6MUzGN92BiTPxq0u+Ldd1pui3k+8Up/p+EnFMODxpf3E0y+w3tX2Tk4POQiU9OpFkz8vJNxk3BKwyKelLmASx7K0xx0qTsFlhCsD1Yvk9MlV0HL+bOBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pd7uz6gl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pd7uz6gl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DC3DC4CEF5
	for <loongarch@lists.linux.dev>; Tue,  9 Dec 2025 04:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765253636;
	bh=K7Qa1+Vf/bUdx66tRqBc2JjOhwBwoU1qNNdQz7b27WY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=pd7uz6glfHcS4nnss027AVaebC1GvamPA+/NYbUojcz9/lJ9eOlnJgL5MJX8WpPXW
	 UGA9N8ZY8qqw2bK+1fNHq/gUjI8DjH1334P1RwuP29T78JURPEx1HlqiS3/KpQHlmg
	 b0mV1r5PKIoaiPQpcTaUkL6n2k8NhM+dZAtoKLeCrHeIwtuq4T5aF+dGNXCaffuKZU
	 9jahkRloIOoqXIy4Xue8l6jWACrrNH3tt+5eWAQRjcLgj3ydN0e3ZEcst5FCF+Ec9E
	 kUDXWD2OlryNdi5zEge60gctdGDJpM2/UgdX+whx8moPmjWfKlA/EDVLjH/2J7//dF
	 zxjOdT+XaSUIg==
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-640a0812658so8853560a12.0
        for <loongarch@lists.linux.dev>; Mon, 08 Dec 2025 20:13:56 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVbYaCG1vzXNixx6QUepOoa8o24ybrSoxUQQX3xSiEDgMl3KGWB8KTCfvDcKJuL4daeRZ2sUxGhGqo=@lists.linux.dev
X-Gm-Message-State: AOJu0YzsHY0a9LJOC/eL3E+YrUDyd6INbrDmjTNjGLjQYOaOqyUNummG
	X+jeesXaXT8pFfPEMdPPDVt5mHSsDsf9FbjzamWoSEWcFme+m+e5hrhLdD6FxIJo47OCpPMWhw3
	ij5nvESDoRPoy3C/RaWvvba5v2Owjw6g=
X-Google-Smtp-Source: AGHT+IGzPBoKaZ+C5XgRfa7Zoad0f2dAj/52ful1XM7Soe3sYjRcNuQC/zxkRtDoKKihNDP3th46XXGalbg7cpC8+DE=
X-Received: by 2002:a05:6402:35d5:b0:640:b99c:de83 with SMTP id
 4fb4d7f45d1cf-6491a42f8c2mr8647481a12.17.1765253635071; Mon, 08 Dec 2025
 20:13:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251124055642.1591-1-hengqi.chen@gmail.com> <CAAhV-H6rrpgBF+bMpEvsJyq0F7sdWisGSwTbuf=ZBhi4XD-5jw@mail.gmail.com>
 <CAEyhmHSntgSQdAOksd6YUsHh0UXJS7XMmSHAZmRDQ5uEzDU0JQ@mail.gmail.com>
 <CAAhV-H5Vab3bwgT2LdGyNB4ipzhnS+JW7PdcOSmNm4JZ30tWTg@mail.gmail.com>
 <fc62bac6-b212-3aed-1536-aee8a60d2f0a@loongson.cn> <CAEyhmHQO9bDP7L=cwxLUbQCrkFfcDaSeKMgB5R32sqMgvJk7ng@mail.gmail.com>
 <CAEyhmHTUToX3qedYVS7v3LP84f3LiW9NbrH-nzxEqEdWAkhFmw@mail.gmail.com>
 <CAAhV-H7+ORpvG-73OaprbH2HiHzF-HUepVxGLsJb9rJXzg3gPA@mail.gmail.com> <CAEyhmHS3Gqomep4GYHMjJqJmd2eFJdcok6_+D4+BQ7WE4Bhnsw@mail.gmail.com>
In-Reply-To: <CAEyhmHS3Gqomep4GYHMjJqJmd2eFJdcok6_+D4+BQ7WE4Bhnsw@mail.gmail.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Tue, 9 Dec 2025 12:14:04 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6HJnMy5EidSug8s0KDbzyQKT1-F=y2pwv=DPsAp4FRgA@mail.gmail.com>
X-Gm-Features: AQt7F2rGgbf4YIhSfQR3dondnNvtSZewtSYRcr4xDdbne_kYhOFdE-v-NT3iZw8
Message-ID: <CAAhV-H6HJnMy5EidSug8s0KDbzyQKT1-F=y2pwv=DPsAp4FRgA@mail.gmail.com>
Subject: Re: [PATCH 0/5] LoongArch: BPF features and fixes
To: Hengqi Chen <hengqi.chen@gmail.com>
Cc: Tiezhu Yang <yangtiezhu@loongson.cn>, vincent.mc.li@gmail.com, 
	loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 9, 2025 at 9:38=E2=80=AFAM Hengqi Chen <hengqi.chen@gmail.com> =
wrote:
>
> On Fri, Dec 5, 2025 at 3:16=E2=80=AFPM Huacai Chen <chenhuacai@kernel.org=
> wrote:
> >
> > On Fri, Dec 5, 2025 at 3:04=E2=80=AFPM Hengqi Chen <hengqi.chen@gmail.c=
om> wrote:
> > >
> > > Hi Huacai,
> > >
> > > Will you pick this series for 6.19 ?
> > I tend to not pick it, because it is a little hurried.
> >
>
> Fine, but deferring does not improve anything if no one else is involved.
> Maybe the fixes part can go in after rc1 ?
The first two? No problem, but I still want a name better than emit_abi_ext=
()...

Huacai

> Anyway, no big deal. Thanks.
>
> Hengqi
>
> > Huacai
> >
> > >
> > > Thanks.
> > >
> > > On Fri, Nov 28, 2025 at 9:37=E2=80=AFAM Hengqi Chen <hengqi.chen@gmai=
l.com> wrote:
> > > >
> > > > On Thu, Nov 27, 2025 at 3:30=E2=80=AFPM Tiezhu Yang <yangtiezhu@loo=
ngson.cn> wrote:
> > > > >
> > > > > On 2025/11/27 =E4=B8=8B=E5=8D=882:44, Huacai Chen wrote:
> > > > > > Hi, Tiezhu,
> > > > > >
> > > > > > On Mon, Nov 24, 2025 at 3:49=E2=80=AFPM Hengqi Chen <hengqi.che=
n@gmail.com> wrote:
> > > > > >>
> > > > > >> On Mon, Nov 24, 2025 at 2:31=E2=80=AFPM Huacai Chen <chenhuaca=
i@kernel.org> wrote:
> > > > > >>>
> > > > > >>> Hi, Hengqi,
> > > > > >>>
> > > > > >>> I think this is the successor of
> > > > > >>> https://lore.kernel.org/loongarch/20251006053323.193581-1-hen=
gqi.chen@gmail.com/T/#t
> > > > > >>>
> > > > > >>> Right?
> > > > > >>>
> > > > > >>
> > > > > >> Right, sorry for the long delay.
> > > > > > Could you please help to review this series?
> > > > >
> > > > > I trust Hengqi and I am OK with this series in general with
> > > > > a quick look.
> > > > >
> > > > > For the two functions sign_extend() and emit_abi_ext(), I
> > > > > have no strong opinion, I do not want to respin the patch
> > > > > since the merge window is coming soon, it does not affect
> > > > > the correctness, so we can refine the code later if there
> > > > > is a better way.
> > > > >
> > > > > Acked-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> > > > >
> > > >
> > > > Thanks.
> > > >
> > > > > Thanks,
> > > > > Tiezhu
> > > > >
