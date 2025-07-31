Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DCA4239E78
	for <loongarch@lists.linux.dev>; Thu, 31 Jul 2025 03:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753930806; cv=none; b=anx+2nju9d8IXZQXY3HV3f4ZwWxK+YJWcpknOLfP8uOGOYJqdFiHiWZdog8+xzTNeIao4+JWKGYCCF2690eaL78A5AJsdR3WzcGHSyWRxUa8Rpvk9TawWUCTM79cxL6d/GLGys5doOSr3gE/BAAw2tj5jyTdI4c6dWX6wiFBX0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753930806; c=relaxed/simple;
	bh=HXC9MCVkyvhgMnTzNEg55m++ZiQFz54yccXLQOfkFiE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ekz/G93B0Kqs8zwTgYM+U9sIayuj/wo2mV0OPmUSk+hMlm0X4k1h8/EB5oOfg1xaJI30Pcy9l3Fp+QWi2DAgZ1lMPdVPBfpwIhYm6hrBgJbkrbq38s6ubz2sECCxbancJR162LwfS/GPiGr/HO4Tu7nrbyDsGzDdV3TRlF+r030=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q2TyaWrU; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q2TyaWrU"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-4ab93f24dc3so7808211cf.0
        for <loongarch@lists.linux.dev>; Wed, 30 Jul 2025 20:00:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753930803; x=1754535603; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aoPoRMZiwTeRoOjMbpU9tQn9vtdJG8I5pJUXUxu+VQY=;
        b=Q2TyaWrU55NfZsJH2nt31s7b5wVNrSsiLqgyKzWl6Bdtq4b+r1By5/tO8PA71TDwGJ
         nVkdkRyvrpIno92iqNX6c6d6SUvIbQc9QDM/PaudzWQ2ZoUKMzAlx9DRaqBd6m+9viy2
         BWq0enej3l/2IOcaPLA5zky0YSEzx3RDASm1iDxMq5uRmOurYmXV6M2If2JcI4ykJvv1
         6wt0RCgJSdskLbHgA8G1TyXxVt/HokRZkLunczBBNLTYMGljqmbx6VifY7Tb2oHpm6/a
         g9ddddZQiH0zJS9dt9trbGYRZWgbG/Yz4gdQTZzXD//fredOE8bLoo7YIOjPG7CVQDUu
         FJ7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753930803; x=1754535603;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aoPoRMZiwTeRoOjMbpU9tQn9vtdJG8I5pJUXUxu+VQY=;
        b=JztomTkZZckW76VzWYmWNW+iI39ZY6Lrh2hH7zDd6zMua4wKV9Zp07zpZRY5UrmwUZ
         RRzHNJ9y+Nc91n9LxPvXF1IFlFpkBgiMVFsXEtherR51+OZXBh8JVety7j18QKvwsR0N
         opkE21+o0BsG95BM84MA/dfK8ZbTjbJiu53brtLd5COaVCdGaLXkANpe78x+3agzuVb1
         M96GmEEgRhMrIfUv+whWSMgwvy2rG5uLIyG8FuLKJ8HuTlFbYIDhQfcfdkL1no8Mfn99
         9ALZYo3LX4Qe+YGpmeDBWXZEx9Ov7Th/ypSJIu1CTQaqy5HaFPoXqjngBOTuLik2R1B2
         SdaQ==
X-Forwarded-Encrypted: i=1; AJvYcCXh0GYCXaFUQCAbo3f4DbXZ+/thHZ2dSYBJkIiHLzIwDhqD+nrIT6ZGT7qfOZ+Iudp0G409Z8j6eK0=@lists.linux.dev
X-Gm-Message-State: AOJu0YwoV8WWQQCKJk059p9zoM06GQUz9+REmENs/m0uDrAx0LsBNCH+
	fvnZKAskp2fTSgAbPS5ZXZIn+K0yysricsoJvjB8tEx7F0Gon64ED3iBlb4cB0VC4uBJTJ5suyQ
	Hpn1PSfBYcJbbejGMfr8le/iaPdwJold7jw==
X-Gm-Gg: ASbGncuDBkXOeDUt+5NXR7zHePmHjih54azS762YYdTBl/5bjXuCfQyBLL7RQB1O3X3
	ebvFCKXaBRY0npCysiiPtD0owyEl5aYHbgMpY0y2FVQg2gDGBi1uM/RQT+0ez2UihkMTTzQW3zP
	ECxeV46e+mUjOyX/i8gOZ+injiJXjOsEBd3a3KPd6AQKPUh2b/EEye5Mk957akPOrCP/Va67rTL
	mnqUjo=
X-Google-Smtp-Source: AGHT+IG82hN1YqXVAMcA2kZfRsFVW1wgJ69dLTz1mcq34HdQatSUE7yL1yXsPKQzRIc1hzPmXMa99NNlIiNAJV5LI9s=
X-Received: by 2002:a05:622a:5806:b0:4ab:825b:fc4d with SMTP id
 d75a77b69052e-4aeecc9980cmr29190441cf.8.1753930803239; Wed, 30 Jul 2025
 20:00:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAK3+h2z3Zx+0KbVcRbLuz_-LhBwov9Bmvp9HdumbaN5GYtovFg@mail.gmail.com>
 <0fe044d3-f36a-d7a7-3ce3-237da83eaea2@loongson.cn>
In-Reply-To: <0fe044d3-f36a-d7a7-3ce3-237da83eaea2@loongson.cn>
From: Vincent Li <vincent.mc.li@gmail.com>
Date: Wed, 30 Jul 2025 19:59:52 -0700
X-Gm-Features: Ac12FXxhkia1vti2HTvZ7VWj0Bwvhy2lDZP_665FQpmfMypNyvRYhIG2JygLgiE
Message-ID: <CAK3+h2xe+7kzbu0TxfyLv0+cnE_p0WHVtgCYeqG2BJYtvuFVCQ@mail.gmail.com>
Subject: Re: bpf selftest build error - undeclared function 'bpf_qdisc_skb_drop'
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: Chenghao Duan <duanchenghao@kylinos.cn>, loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 30, 2025 at 7:30=E2=80=AFPM Tiezhu Yang <yangtiezhu@loongson.cn=
> wrote:
>
> On 2025/7/31 =E4=B8=8A=E5=8D=8810:21, Vincent Li wrote:
> > Hi Tiezhu and Chenghao,
> >
> > While attempting to test the bpf trampoline patches on loongarch on
> > top of https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.g=
it,
> >   I ran into bpf selftest build error irrelevant to the bpf trampoline
> >
> >    CLNG-BPF [test_progs] bpf_qdisc_fail__incompl_ops.bpf.o
> > progs/bpf_qdisc_fail__incompl_ops.c:13:2: error: call to undeclared
> > function 'bpf_qdisc_skb_drop'; ISO C99 and later do not support
> > implicit function declarations [-Wimplicit-function-declaration]
> >     13 |         bpf_qdisc_skb_drop(skb, to_free);
> >        |         ^
>
> Please enable CONFIG_NET_SCH_BPF.
>

indeed I am missing it, will enable it, thanks a lot!

> net/sched/bpf_qdisc.c
> bpf_qdisc_skb_drop()
>
> net/sched/Makefile
> obj-$(CONFIG_NET_SCH_BPF)       +=3D bpf_qdisc.o
>
> Thanks,
> Tiezhu
>
>
