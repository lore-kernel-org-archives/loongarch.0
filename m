Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B33319597F
	for <loongarch@lists.linux.dev>; Sat,  2 Aug 2025 14:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754146041; cv=none; b=esyjaOu614Twq9vZYTJ1Erg3dVVY1Q/dPDFbfZfdNUDVFfPkieL1nud9ZLdF8EcVWaRSnZGuT0NBbdhUaHbu/sh3/lMjM3grc5cjgHXWKUI6J/iH0YKh7WlPUlET8eaT4n3GSZ/lv7QzjaaHkM66d7NiBgGdxYWpSRmBcu3l6UU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754146041; c=relaxed/simple;
	bh=GjMCMuAEzXOkJQ2fzxUe1nXB2SVRIRJ2Ow/yCmGI7Ps=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Spl33Wsm+nWknC9H096It2Vrke4Z2Jk3Im9tignKWNhlA7KZ7qdZA+6zAm9LDzS1G9hzR98Dd09B221Y8+gvSVq72rH5+0bzSRsJhwEg6cv3keG9E/kaX0B8sMDwZIY2Sjc5i4prweBNzl3ox+n27HJ+tuks9aiTGcbjx2pgbPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XGnSmCwq; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XGnSmCwq"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-7e344e0212eso279549085a.0
        for <loongarch@lists.linux.dev>; Sat, 02 Aug 2025 07:47:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754146038; x=1754750838; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gIKg2EZUmMvZLoK9yHu0zN+lLA6idzym9DxdPQJA1O8=;
        b=XGnSmCwqC6ZS7ZsdHYtmTm99JzA3+RGMtBlZId0ncwqDpHJVpbRQXMj2KfJXEE6cZU
         0rlEMGpZ0Bb00cVTdK/3PLuz6eg2z6jkluFQibc/pX1TQRh7H/QwMAnQWXPF/cUbf4Fn
         Lmc2tkoZYDrGNndGMLvoO8l5dR0sa22JZejIVOxVNWlh/ozXodOVGV0LlYxDM0K2X9kt
         3xYX2LAfANHmLbPUpjAkX+ExmTDedmN0Z0Gsb5Mh5z2DnLEfh8qghepcbw1Df2J8IwDR
         7Gz2VUYR6lvXjTMkrpEqn3Gzvpplp8fU/5Q1KsQeW+rk0sJnw1PC32w/AFRzyXASh+tn
         Is2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754146038; x=1754750838;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gIKg2EZUmMvZLoK9yHu0zN+lLA6idzym9DxdPQJA1O8=;
        b=FVSsJgnvVlM5XSsW5u9hXibZ+RlYvXmBcz9gu+bf5fm8aqVmfvVp40QiH04wChqHkt
         /hEvhNue6bAQITlb96EsOpendTGRS5tUXQC9XwmlDs5di/lkch5TdXS15eY+EMHYErWn
         fj/TcCbemWHcnLG9iCoVA+gRya4LHzZfLmG6SwqdRUvB19N4BNECigUfN2Swuc+vc6Ts
         otUfz+8lJ/GKTzRDfeMym9khn/j5n34B6NeL1ewG9zjJQNGW2zdsKeFdSXbkuLzzElaF
         CjnXTIaf2zHz6LkbVhufGOBqg9BkNa+qD/+LDg2l2eq4sHUceBKrkDtdanwu+Y5Ios/R
         xGXQ==
X-Forwarded-Encrypted: i=1; AJvYcCW3Ftr542qSO2WuV0xl8k/w5YhrCgX/55NDEOPq/Nrh2jPk52qxAQjCi/TMyPxR+50E2ghog8GU/kc=@lists.linux.dev
X-Gm-Message-State: AOJu0YzEq7icQKg/ZIZrfya/mdkMZd8R8yxRmcnRelnvgBEfTyKzAmF4
	C1LROQdihcR0G2SHPpxOeRKOkFL7D/SSVCCMoLU5lnB73oJ6AOWMH95cUirUb1d3+xpzEPpa1S/
	4dlahp85y8t65s9+2IdENPv5yfG2i5Lo=
X-Gm-Gg: ASbGncuKXrLVjxanSVEKH31t1aSafcAwybl8hKQPhoqHgrPzh2eTyF9ZmaFIVPCW0IZ
	fPcqXAFqkarN+4lZaCKwx0q3XBMePzvyoXrwXrf9CstYJ1FljSwp7HZbHomATn1ojc4Rx9TxRK+
	OY4nVORFb/92/RbKwiOjlpIodb1TBAYA/0aA5/shqNoMGbbZbM3rAdG+vuDnDI5QXRpd4xK0U6j
	VDMhao=
X-Google-Smtp-Source: AGHT+IENLGq9bG6jg/gaDrU7fAHRT8puherB1+EdVOTD33ZwZCCOReZi9717Sy2GmCZOnP9H0NTPIHPsPhq6Y2jxWtw=
X-Received: by 2002:a05:620a:4113:b0:7e0:868b:f54e with SMTP id
 af79cd13be357-7e68128cdb7mr1316525785a.5.1754146038414; Sat, 02 Aug 2025
 07:47:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250730131257.124153-1-duanchenghao@kylinos.cn>
 <CAK3+h2wG-++Np7e-CZMbdjkL9tbuRi4bx+DP4RzLvJqu_+UY8A@mail.gmail.com>
 <84789726-18a6-b46f-3ece-f887599ccf4a@loongson.cn> <CAK3+h2x4MWR677UPTdAGX8jUg7EC_iweCKh8S1FMWSVVVsO8oA@mail.gmail.com>
In-Reply-To: <CAK3+h2x4MWR677UPTdAGX8jUg7EC_iweCKh8S1FMWSVVVsO8oA@mail.gmail.com>
From: Vincent Li <vincent.mc.li@gmail.com>
Date: Sat, 2 Aug 2025 07:47:07 -0700
X-Gm-Features: Ac12FXwLiIxzNRFZUQHik097qt_Knt7NunYHF9zQL4TxKozHhMRfPW0NHTuk9kE
Message-ID: <CAK3+h2y-7h=D5NaO=v8u7HaoHQ+MdhAvsH4drpZxypbr+ABodg@mail.gmail.com>
Subject: Re: [PATCH v5 0/5] Support trampoline for LoongArch
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: Chenghao Duan <duanchenghao@kylinos.cn>, hengqi.chen@gmail.com, chenhuacai@kernel.org, 
	kernel@xen0n.name, loongarch@lists.linux.dev, guodongtai@kylinos.cn, 
	youling.tang@linux.dev, jianghaoran@kylinos.cn, geliang@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 2, 2025 at 6:53=E2=80=AFAM Vincent Li <vincent.mc.li@gmail.com>=
 wrote:
>
> On Sat, Aug 2, 2025 at 2:19=E2=80=AFAM Tiezhu Yang <yangtiezhu@loongson.c=
n> wrote:
> >
> > On 2025/8/1 =E4=B8=8B=E5=8D=881:21, Vincent Li wrote:
> > > Hi Chenghao,
> > >
> > > I trimmed the email recipients only to the loongarch mailing list and
> > > folks who might pay attention to this, I personally don't like to
> > > bother other people who may not be interested in this :). Folks let m=
e
> > > know if this  is not ok. anyway, please check my bpf selftest result
> > > inline.  The fentry_attach_stress results in kernel lockup.
> >
> > It passed on my test environment.
> >
> >    $ sudo ./test_progs -a fentry_attach_stress
> >    #104     fentry_attach_stress:OK
> >    Summary: 1/0 PASSED, 0 SKIPPED, 0 FAILED
> >
> > I used loongson3_defconfig and the following additional configs:
> >
> > CONFIG_KPROBES=3Dy
> > CONFIG_FUNCTION_ERROR_INJECTION=3Dy
> > CONFIG_TEST_BPF=3Dm
> > CONFIG_FTRACE=3Dy
> > CONFIG_FUNCTION_TRACER=3Dy
> > CONFIG_DYNAMIC_FTRACE=3Dy
> > CONFIG_FPROBE=3Dy
> > CONFIG_FTRACE_SYSCALLS=3Dy
> > CONFIG_BPF_KPROBE_OVERRIDE=3Dy
> > CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=3Dy
> > CONFIG_DEBUG_INFO_BTF=3Dy
> > CONFIG_NET_SCH_BPF=3Dy
> > CONFIG_BPF_LSM=3Dy
> > CONFIG_BPF_UNPRIV_DEFAULT_OFF=3Dn
> > CONFIG_ARCH_STRICT_ALIGN=3Dn
> >
> > I am not sure whether it is related with configs, you can test it again=
.
> >

I did:
  cp arch/loongarch/configs/loongson3_defconfig .config
  ./scripts/kconfig/merge_config.sh -y .config config-tiezhu(your above con=
fig)
indeed I could not reproduce the lockup, even run the test in a loop.
it seems to be related to the kernel config I use, maybe you could try
my kernel config?

[root@fedora bpf]# while true; do ./test_progs -a
fentry_attach_stress; sleep 1; done
#105     fentry_attach_stress:OK
Summary: 1/0 PASSED, 0 SKIPPED, 0 FAILED
#105     fentry_attach_stress:OK
Summary: 1/0 PASSED, 0 SKIPPED, 0 FAILED

#105     fentry_attach_stress:OK
Summary: 1/0 PASSED, 0 SKIPPED, 0 FAILED
#105     fentry_attach_stress:OK
Summary: 1/0 PASSED, 0 SKIPPED, 0 FAILED
#105     fentry_attach_stress:OK
Summary: 1/0 PASSED, 0 SKIPPED, 0 FAILED
#105     fentry_attach_stress:OK
Summary: 1/0 PASSED, 0 SKIPPED, 0 FAILED
#105     fentry_attach_stress:OK

>
> Have you tried to run the same  fentry_attach_stress multiple times or
> in a loop like while true; do ./test_progs -a fentry_attach_stress;
> sleep 1; done
> the lockup happens intermittently, sometime it PASSED, sometime kernel
> locks up. I merged the tools/testing/selftests/bpf/config with my
> original config by
> ./scripts/kconfig/merge_config.sh -y .config
> tools/testing/selftests/bpf/config. my config seems including
> everything  you listed above except CONFIG_ARCH_STRICT_ALIGN not set,
> here is my config https://www.bpfire.net/download/loongfire/config.txt
>
> > Thanks,
> > Tiezhu
> >
