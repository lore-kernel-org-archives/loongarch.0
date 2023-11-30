Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85982134B6
	for <loongarch@lists.linux.dev>; Thu, 30 Nov 2023 11:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UtvHevNd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 100F0C433C9
	for <loongarch@lists.linux.dev>; Thu, 30 Nov 2023 11:23:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701343407;
	bh=nAmHeSXEsjhy93x4xbYPJVYvdPWjv6x5rNspjStVL/w=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=UtvHevNdySWePxcnv1prtzCnPv/pcRgfT9jiEbPES3QSIiMbdr4NvoqtNYvdEjgCt
	 Lc8OsxhXqTKOG0r1Px6PgJ01RcT6oLxEOqgcfgvSnZkc1GY+PeLhVx1pN6zh9IGjSZ
	 CUgi6MUbWb2iROFR4rd5+2Tyg1HZnPz2iJWwBg3jVpenJOoNTCMXI+Vc3nfQUN/6LG
	 wU4Mkss/IykuZqQnnrn+OklNJaBkdNaMVa5IYx+RAu4erPQYezFOij5NS4o+ciwvXC
	 aAV/HPXFTyTfU0OMQd1W0CpdW2HwTfm9bDtGqElOFteunU1/fMgNr5gc/AcEZ/t8n/
	 In1i/Y2dEWe6A==
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-54b0c7987easo826856a12.3
        for <loongarch@lists.linux.dev>; Thu, 30 Nov 2023 03:23:26 -0800 (PST)
X-Gm-Message-State: AOJu0Yx7UDc09IwUplK1tcv/ZnhnQfuG1Of7k/xjHvxEW67EOEkmu7SN
	nt5yVtMsWUm9Xr+mi6MOIxZ6DuFVC2dtjg2sWt8=
X-Google-Smtp-Source: AGHT+IHwMBcnNZLSiY/O2otZQ1LeFGUXkFmMLeB1ILb15w45kG9MyCgDPAPkqKcVHIw2MPx2ht3ROtkEwEe9YOy4EBc=
X-Received: by 2002:a17:907:1c1c:b0:9fd:8cd9:7842 with SMTP id
 nc28-20020a1709071c1c00b009fd8cd97842mr19742539ejc.44.1701343405544; Thu, 30
 Nov 2023 03:23:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAEyhmHT6UOryPZi7eEfw01Y_CjAqxy8NM6eKkdvdojJqB9P7eQ@mail.gmail.com>
 <CAAhV-H5pKEzVnHKCiHm9=9wDapa5RhS5uMFEo2KHBskYrP7DnQ@mail.gmail.com>
In-Reply-To: <CAAhV-H5pKEzVnHKCiHm9=9wDapa5RhS5uMFEo2KHBskYrP7DnQ@mail.gmail.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Thu, 30 Nov 2023 19:23:18 +0800
X-Gmail-Original-Message-ID: <CAAhV-H73o+RjdFBe3mHJJkqttNzZgamPfs-6oiXj5iwxL8fxww@mail.gmail.com>
Message-ID: <CAAhV-H73o+RjdFBe3mHJJkqttNzZgamPfs-6oiXj5iwxL8fxww@mail.gmail.com>
Subject: Re: Kernel panic and stall triggered by bpf selftests
To: Hengqi Chen <hengqi.chen@gmail.com>, Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Hengqi,

Maybe you can get something useful from here:
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/=
tools/testing/selftests/bpf?h=3Dnext-20231130&id=3Dd128860dbb29cafc3c65ca2d=
22082745a32829dd
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/=
tools/testing/selftests/bpf?h=3Dnext-20231130&id=3De13b5f2f3ba3df1ca31824d2=
fdbd182250fa10c7

Huacai

On Fri, Nov 24, 2023 at 2:29=E2=80=AFPM Huacai Chen <chenhuacai@kernel.org>=
 wrote:
>
> Add Tiezhu since he is familiar with bpf.
>
> Huacai
>
> On Thu, Nov 23, 2023 at 11:12=E2=80=AFPM Hengqi Chen <hengqi.chen@gmail.c=
om> wrote:
> >
> > Hello,
> >
> > The following bpf selftests tigger kernel panics and stalls (RCU relate=
d)
> >
> > | TEST CASE               | JIT    | JIT + UNPRIV |
> > | cls_redirect            | PANIC  | PANIC        |
> > | sockopt_inherit         | STALL  | STALL        |
> > | test_profiler           | N/A    | STALL        |
> > | verifier_map_ptr_mixing | PANIC  | PANIC        |
> > | verifier_movsx          | PASSED | STALL        |
> >
> > BPF JIT can be enabled by:
> >   # echo 1 > /proc/sys/net/core/bpf_jit_enable
> > unprivileged BPF can be enabled by:
> >   # echo 0 > /proc/sys/kernel/unprivileged_bpf_disabled
> >
> > For the full logs of each test cases, see below
> > https://github.com/chenhengqi/public/commit/75a265e961e5d93b61c3b012e16=
f1db2f9d333b5
> >
> > I spent quite some time debugging this, but unable to isolate the
> > related code path.
> >
> > Thoughts welcome.
> >
> > --
> > Hengqi
