Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 869B323D2AB
	for <loongarch@lists.linux.dev>; Mon, 15 Dec 2025 03:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765769727; cv=none; b=BQTHmgeqBzXvbRMxG8Y6pNOfmVzX5dxbaL7zMjcir/yxSuSuVHvoKFDZVfB2nTlWrmlE51NcqqYtVM65sF8Gn03gVNPmVs2Dqn+l6cvjSSlgEajWccBqfL0NWnNSwM2XJpUMPKeKoV24VdaWHSqDwevXBBTuG3PfHnkXel7NDyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765769727; c=relaxed/simple;
	bh=mj9siQqFodzFTGlpLqgQlCAI8mIfqrtKrUwcmFmOjAA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r7Jxl+8cbpaF0OXelzNuD52Xz743WL/RutFArjzpxe5LtsfQZ5Iig69ncnKBP/03G/Pr2OUtvgwETOl3jDy+oqkT6yGFc0RMDXNU/xigjZly7e+4hqOlBcL2k1Y2Gzb4o1PvcQiSJcjGzTrT9NyHVmvIw9Xgr4mJpgiJDE1snUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oGQpPRMM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oGQpPRMM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B9D1C116B1
	for <loongarch@lists.linux.dev>; Mon, 15 Dec 2025 03:35:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765769727;
	bh=mj9siQqFodzFTGlpLqgQlCAI8mIfqrtKrUwcmFmOjAA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=oGQpPRMMyg2R+02IQpJLCiazGlJWuyir3P0sC71wh2LzrS6WIuw01kEzdUxVk6sZz
	 O2/nBn+sOyMG+2yghVS6/OkgCvcp3tQ0xwONO7j5IvpA+LdeWOevfL3vyiRXBq5IIF
	 4gtfdEVmlMyd7w3RbX0G5fMLuwtu4M+pwdWK2HAY27c9rP87+UsyUuuFrGMGyWQV/O
	 FvTiC0e7HrqvMwKraYKOgY4v/bAuRseUIfoynf9/sNwt4iN0ggNJTXljwavE62013+
	 tgqzJqKSxLc7EGdK6l8BZjqIwOflxsjetAI7Jf7Pif0tXKEyH1zY99INDmXqfp8/++
	 GZ8fV7VxUlG5g==
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b725ead5800so450083466b.1
        for <loongarch@lists.linux.dev>; Sun, 14 Dec 2025 19:35:27 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUsjQUE+ylrFA0pLnSiC5Bfavi5N1i+yAk+bjkWEjmph6wuWT2K+GbnMnD9CFSNrDNkewtcTwpQJVE=@lists.linux.dev
X-Gm-Message-State: AOJu0YyDCXcG7kv4BbcFh1vuGPJQF2C/k5m2h1HC0RwSgF0wMvB7ubPZ
	1g7hvOpmLSH1YC+rCmRKUDBWrD2ekWop5VHel2drY7vGAzmMe/A/KHGavWBN4jvfDeNbSpGR1ND
	KOgyWPSAdvB0mm0VKvNslgSFMtfyR/6A=
X-Google-Smtp-Source: AGHT+IH8iZSyNPIjuLoUQx90WG02DL56Q/BA/UorTWnKN7/PIcwE4t72I6QXObjJfYLXd49d91caYpcE+Bx+89Op4hM=
X-Received: by 2002:a17:907:d19:b0:b76:23b0:7d70 with SMTP id
 a640c23a62f3a-b7d23ad8414mr1160456766b.39.1765769725740; Sun, 14 Dec 2025
 19:35:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251209061809.15994-1-yangtiezhu@loongson.cn>
 <CAAhV-H6zjWXjjuoOkRov4886E82QRH=3NnkhP2e4hroSJr1UXg@mail.gmail.com>
 <92bf0e88-da14-20ce-137a-3e7777e19af3@loongson.cn> <ba1494da-a407-3acb-a5d1-8fbd9498b6c6@loongson.cn>
 <a1674623-4c08-1f4d-3e4e-5511b579e9ea@loongson.cn> <CAAhV-H4UpzqUiEi7Qfc2qtU1hm=yR9hYfaUGfrAtQssrk6qWOA@mail.gmail.com>
 <87eac880-d1c0-272c-8a9e-98cb4ac8541e@loongson.cn>
In-Reply-To: <87eac880-d1c0-272c-8a9e-98cb4ac8541e@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Mon, 15 Dec 2025 11:35:38 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5OWewfPDQ92yw-e4UerTkg2KUXL4nyRyJRrxfBLzv63g@mail.gmail.com>
X-Gm-Features: AQt7F2qye3N94jwnzccUj-UBR03IQWKACFn89RvACNltnnBM2PbQQ2hUQ5g8GxI
Message-ID: <CAAhV-H5OWewfPDQ92yw-e4UerTkg2KUXL4nyRyJRrxfBLzv63g@mail.gmail.com>
Subject: Re: [PATCH v1] LoongArch: Remove unnecessary checks in bt_address()
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: Bibo Mao <maobibo@loongson.cn>, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 14, 2025 at 9:15=E2=80=AFPM Tiezhu Yang <yangtiezhu@loongson.cn=
> wrote:
>
> On 12/13/25 20:24, Huacai Chen wrote:
> > On Wed, Dec 10, 2025 at 4:00=E2=80=AFPM Tiezhu Yang <yangtiezhu@loongso=
n.cn> wrote:
> >>
> >> On 2025/12/10 =E4=B8=8A=E5=8D=8810:25, Bibo Mao wrote:
> >>>
> >>>
> >>> On 2025/12/10 =E4=B8=8A=E5=8D=889:28, Tiezhu Yang wrote:
> >>>> On 2025/12/9 =E4=B8=8B=E5=8D=884:30, Huacai Chen wrote:
> >>>>> Hi, Tiezhu,
> >>>>>
> >>>>> On Tue, Dec 9, 2025 at 2:18=E2=80=AFPM Tiezhu Yang <yangtiezhu@loon=
gson.cn>
> >>>>> wrote:
> >>>>>>
> >>>> ...
> >>>>>>           extern unsigned long eentry;
> >>>>>>
> >>>>>> -       if (__kernel_text_address(ra))
> >>>>>> -               return ra;
> >>>>>> -
> >>>>>> -       if (__module_text_address(ra))
> >>>>>> -               return ra;
> >>>>> I think the correct way is to remove the __module_text_address()
> >>>>> condition but keep the __kernel_text_address() condition. Then retu=
rn
> >>>>> 0 at the end of this function, and remove the __kernel_text_address=
()
> >>>>> condition out of this function.
> >>>>
> >>>> It can not remove the check of __kernel_text_address() after calling
> >>>> bt_address() because it needs to validate the calculated address for
> >>>> exception, then no need to keep the __kernel_text_address() conditio=
n
> >>>> in bt_address() because it will check the PC outside bt_address().
> >>>           state->pc =3D bt_address(pc);
> >>>           if (!state->pc) {
> >>>                   pr_err("cannot find unwind pc at %p\n", (void *)pc)=
;
> >>>                   goto err;
> >>>           }
> >>>
> >>>           if (!__kernel_text_address(state->pc))
> >>>                   goto err;
> >>> I guess that you both comes from different views :) one treats these
> >>> piece of code into one, one only views function bt_address().
> >>>
> >>> Especially with if (!state->pc), how could this happen?
> >>
> >> IMO, state->pc will be not 0 forever in practice, this check is just a=
n
> >> error path and can be removed too if possible.
> > bt_address() return ra both in "good path" and "bad path" is strange.
> > I still suggest using my method, but move __kernel_text_address()
> > after the "if (ra >=3D eentry && ra < eentry +  EXCCODE_INT_END *
> > VECSIZE)" block to verify the modified ra.
>
> I am OK if you mean like this:
>
> static inline unsigned long bt_address(unsigned long ra)
> {
>         extern unsigned long eentry;
>
>         if (ra >=3D eentry && ra < eentry +  EXCCODE_INT_END * VECSIZE) {
>                 ...
>                 ra =3D func + offset;
>         }
>
>         if (__kernel_text_address(ra))
>                 return ra;
>
>         return 0;
> }
>
> bool unwind_next_frame(struct unwind_state *state)
> {
>         ...
>         state->pc =3D bt_address(pc);
>         if (!state->pc) {
>                 pr_err("cannot find unwind pc at %p\n", (void *)pc);
>                 goto err;
>         }
>
>         return true;
>         ...
> }
>
> If so, I will send v2 later.
Yes, this is what I want.

Huacai

>
> Thanks,
> Tiezhu
>
>
