Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8422F71B3A;
	Sat,  6 Jul 2024 13:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720273791; cv=none; b=F1z2jGshGhXROv5vgwi4sMC388iVPWINAsq+H9uKgKVTlQ18YGI6sH8eWnFun0fMJXLXLwwDFbYCcDntBh7SNN1mn+9zyMS0LAbSHKN4RYV6rZ75QJ0nGpTAjelaJM3+TqJSuIPRhSdB3ZhN7M9CG6fxzUc9bfCgAhMgclCx1c4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720273791; c=relaxed/simple;
	bh=WwtWGqd3b7WM+nXM9jFiZlnjseqVlB8/RHiBNoQSNnU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IKX36ZAk2Zrw0as2Cu3Qq1Upu1z9lc31TZUyaMV5q9Bm3jEH6qaluk9HVA0lpwS2QOk3NR/FnEHAwrMTwLdTdV9oOB4XNRPn49hYkDUiIYuEJsHEX9TylwP5AbfTXKuaIJAAK4rbKx8XCnYvgoA/Q0paPRLCnB/vVq5dKV3RSEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aQ6n1yW3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aQ6n1yW3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC173C4AF0E;
	Sat,  6 Jul 2024 13:49:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720273791;
	bh=WwtWGqd3b7WM+nXM9jFiZlnjseqVlB8/RHiBNoQSNnU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=aQ6n1yW3LQvL8IMo2Spw+LlgLy92sXGml39aALacI8i/6Vky0GOkjxnyJBscWF8+y
	 glmNIUJukT3vRXDxDmLVw3A527OI8+zyWkQRWI407+lhxy2An21OWI4EKdaMEGauQ2
	 8IfAtP8NOaV9xKpcAoABq7Geh/rvREYyudTI/6jB35qJW8asDyNQ6L09q5sgHRz6dG
	 N8FYENwzK16gzkPmAPm+lhBtPceXl595GChXjL2L7nLcd2qckLh4aYdOSoyMOSjQnc
	 CxKmohqJFiY1ynCpypaCqa/dyaD8IpU1lIs4djD6ItHvuEOe1/kvhCXyKtsD5hKivv
	 ae3ZHLE/2BNEg==
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-58ba3e38027so2968838a12.1;
        Sat, 06 Jul 2024 06:49:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVPgwtgea4/R+DlskhMVhafPOwd+ssLEx4xHKu/p14pVXKQ99RBqoDUfnU5OG5wuHo/u2qjaYphwBj2o1sJcXJ5nCUsNu5rc7sdDGAFw3RqjRDFMu+289vx8IssJ1sVaw==
X-Gm-Message-State: AOJu0Yy3m7+FAgEWPgNj7W/KlZuXMbGaCdsbW0gUqSF90jk2FKY6KNNo
	JCnsEJsI9W3z0WBrXKAi1xbJYBIrQp7mgysLhgapi4DnGQ/pbGV+IQnKbBxCuSM/o8v12YhmWQN
	tsXjEc+ZYrgFgOX5POf1XSOAddyA=
X-Google-Smtp-Source: AGHT+IESGgckyWRKHZbg0sq8z9FEAOZ/7LM0DfdCM/NpkuRRuuAsW+3xXiTKLmrRqbU3XT7zJUed4tVMreQO5TRl/aA=
X-Received: by 2002:a17:906:aed1:b0:a77:b01b:f949 with SMTP id
 a640c23a62f3a-a77ba48cfc6mr558366566b.35.1720273789487; Sat, 06 Jul 2024
 06:49:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240706073858.161035-1-xry111@xry111.site> <20240706073858.161035-2-xry111@xry111.site>
 <CAAhV-H6K7SXtXpv9Udo8md0sdn+40TGPTCdSPeM1HmbJqrhboQ@mail.gmail.com> <cb3c2038b97689371226c467befdbf9e13113744.camel@xry111.site>
In-Reply-To: <cb3c2038b97689371226c467befdbf9e13113744.camel@xry111.site>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sat, 6 Jul 2024 21:49:40 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4CQMmrLRv=vi8N63p2NXbdozpDakJLia8soFvVohCbqQ@mail.gmail.com>
Message-ID: <CAAhV-H4CQMmrLRv=vi8N63p2NXbdozpDakJLia8soFvVohCbqQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] LoongArch: Add support for relocating the kernel with
 RELR relocation
To: Xi Ruoyao <xry111@xry111.site>
Cc: WANG Xuerui <kernel@xen0n.name>, Jinyang He <hejinyang@loongson.cn>, 
	Youling Tang <tangyouling@kylinos.cn>, Tiezhu Yang <yangtiezhu@loongson.cn>, 
	Fangrui Song <maskray@google.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 6, 2024 at 6:34=E2=80=AFPM Xi Ruoyao <xry111@xry111.site> wrote=
:
>
> On Sat, 2024-07-06 at 18:29 +0800, Huacai Chen wrote:
>
> /* snip */
>
> > > diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
> > > index ddc042895d01..03b3ef5edd24 100644
> > > --- a/arch/loongarch/Kconfig
> > > +++ b/arch/loongarch/Kconfig
> > > @@ -607,6 +607,7 @@ config ARCH_HAS_GENERIC_CRASHKERNEL_RESERVATION
> > >
> > >  config RELOCATABLE
> > >         bool "Relocatable kernel"
> > > +       select ARCH_HAS_RELR
> > Why is this selection under RELOCATABLE? I know ARM64 is the same, but
> > why?
>
> Because if we just select it in CONFIG_LOONGARCH instead of
> CONFIG_RELOCATABLE, the users who have disabled CONFIG_RELOCATABLE will
> still see the entry for RELR in their configuration interface.  And
> they'll ask "hey what's this for?  Why my kernel needs relocation?"
RELR is not a similar conception to RELA, it is only used for
relocatable kernel?

Huacai

>
> --
> Xi Ruoyao <xry111@xry111.site>
> School of Aerospace Science and Technology, Xidian University
