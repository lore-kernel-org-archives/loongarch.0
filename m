Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 742A01F8690
	for <loongarch@lists.linux.dev>; Thu,  1 May 2025 01:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746063492; cv=none; b=pUECdx2F9ZHgWHvEci/eBx5s8vv8JDT6al6vy+1R95AkRUUm5AvuYgSf8mZUN1AAEqBoHf8uOe3Q/tMLfZ10MQXDdr8N0cmH++QsVu08OWA9jfbutSuVAEi7P+d/Q6ppaPoC5gZ8oYL9SQZpqpswfvj16XXlN2RaIt0XK6szhe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746063492; c=relaxed/simple;
	bh=qswmRgxBtKtJNAvLHM4hZPfSNBEZni24oTOcHXgl2v4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BET3LjXUjo+Cr/342QlOFrCf5UtOFPew0QF8XZB0Z0yajtyTutcF4ubNeXJPRd42aK6LNz172j54xyqSBq5sixt7WtSUzyQ+vj4iaqqXBpFRpw2dq6VFA1A+AzyHeaP4FVmpN62m6yHpIZ+Oxs3aniViHZnvfejZosSUHLnZ6K8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lvbQSsLu; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lvbQSsLu"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-47686580529so6312741cf.2
        for <loongarch@lists.linux.dev>; Wed, 30 Apr 2025 18:38:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746063489; x=1746668289; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nX4dVDllopq+tS8FzjHQ5g5N61k8rKm72Q1pN8FUsr0=;
        b=lvbQSsLud8eoKa6G3jjNkKnguC2pKgoj0P1xRPCnwSHBhZJhlreDpY2ZAAOuLR7VlF
         2HFinmg0ecgGe13M8M54Otk+KF0fGsXqflvIgVPZVJ89go25787G3DOOdF2o2T6ARdt6
         Ld0xj80g0z/ifzIbvrLFHMaYf6IVOA2LTQl1nevVNqMi5OE0aUxmqrksGaGz+J/j6DPY
         aOeyYbtWtRm7M/ebMHz3ZvPHV6SA8q39ITBY4LR7Oq45fN0elILgEozSmyrWT4yzm18w
         /VfXcuXL3/IHJSlAPTqLKWTWG1L+NtxMF8wiJa8Ta98Wojyh4pcyAJgamPqu41kwTJM+
         qWgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746063489; x=1746668289;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nX4dVDllopq+tS8FzjHQ5g5N61k8rKm72Q1pN8FUsr0=;
        b=WgIdf334UNe8L1z9q1O7hhrcu+O7I1z2mF/K+4f0e9lDlbNDMqXJ9GvVQy4kkrwlUn
         l5MwXOQrPn9sM8RcZvy4+DFzv2buhbrOY8rGOAlRPKbFqF0e88Abo2UUfO7eRJ5863sq
         nFV7sMqUJjLSyVQTI3Z5v0VaK+CJmWU3buh+dCKQEFoboCYdDuYQtUO0OORA7p4Lxz2Z
         Rc3WA4ycpf7RCahxFoOYWHoHUT++VprN/4rZe2uT1+JWTqJO/5GRPAXhvmk9ca26vl/h
         ddPJjiXk8VcGVk9+QOWrmfW6JgThBfTUVFgyI3tWNT/KFBsqLQcfwvOZU1DlY/6qk9Id
         200Q==
X-Forwarded-Encrypted: i=1; AJvYcCUoaOyiPQDHKuLr2hIhc+dO/LPZib6aljfir9sXVbLFoNvybpBYAGMIK/UK3K/Js+rDh5/TQQz5zBE=@lists.linux.dev
X-Gm-Message-State: AOJu0YxPIO0oEwBiLaorIKN/A7PwwoBwirR6a7z0YrIYwVevzaN4Ncjw
	0XKsqum/jpMZ7uVQyGGnpt4/vq/en8eXwQp3o3zmc96BQrnXkhbH4GbjelcC8FszDZjIZgJQ5Gz
	C09d1F8mTdobK6m/LjCItJ54Q9I0Ib+6W
X-Gm-Gg: ASbGncsuuPHIzCM+11CRijrCOqpR5nSfkl5b+tIlPs34+T9avNTkQ+dTRXshuOkNmLm
	wmlpIVE1gGJDOI6BjQMORxIt45bYTtRCVO6VJRSohjnwIvu+6d0iOWdZoy4VNXvxLXQFHAUtqEz
	NzWJA4CH/sufoOTmw++UAEIU6wz83ULOKlbfFMhX8lS86v8xLPsRSsAQ==
X-Google-Smtp-Source: AGHT+IHrCLTmNcY0FHD5WEC/WePPcdfn+RpbojiuUZCKwBlyUNvxT6k2qlNTuF2RqkP+4o2DKBbTidh6sUg7qZ3qWVQ=
X-Received: by 2002:a05:622a:1148:b0:477:5d12:aac5 with SMTP id
 d75a77b69052e-48b21a60df3mr11470771cf.35.1746063489322; Wed, 30 Apr 2025
 18:38:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250430131516.24287-1-yangtiezhu@loongson.cn> <CAAhV-H4VpYVEhwnhh4s083FuNsfEhGwrYxtceFDKD_imnBBrjw@mail.gmail.com>
In-Reply-To: <CAAhV-H4VpYVEhwnhh4s083FuNsfEhGwrYxtceFDKD_imnBBrjw@mail.gmail.com>
From: Vincent Li <vincent.mc.li@gmail.com>
Date: Wed, 30 Apr 2025 18:37:57 -0700
X-Gm-Features: ATxdqUFlmxlvNicj0lwYOXAq-vMhrWpp638DpK7NoOjFQFt_McQ3EnOPUchj68M
Message-ID: <CAK3+h2xQbw=4s8qRK9WDGmzDhsWC2WhqkYWuwKUXdJFwLaL2Pg@mail.gmail.com>
Subject: Re: [PATCH 0/5] Enable some configs in loongson3_defconfig
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Tiezhu Yang <yangtiezhu@loongson.cn>, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Tiezhu,

On Wed, Apr 30, 2025 at 6:41=E2=80=AFAM Huacai Chen <chenhuacai@kernel.org>=
 wrote:
>
> Hi, Tiezhu,
>
> When I enable these options:
> CONFIG_FTRACE=3Dy
> CONFIG_FUNCTION_TRACER=3Dy
> CONFIG_FUNCTION_GRAPH_TRACER=3Dy
> CONFIG_DYNAMIC_FTRACE=3Dy
> CONFIG_DYNAMIC_FTRACE_WITH_REGS=3Dy
> CONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS=3Dy
> CONFIG_DYNAMIC_FTRACE_WITH_ARGS=3Dy
> CONFIG_KPROBES=3Dy
> CONFIG_UPROBES=3Dy
> CONFIG_KPROBE_EVENTS=3Dy
> CONFIG_UPROBE_EVENTS=3Dy
>
> Then your above commands will hang (or get a SIGTRAP), which options I
> am missing?
>
> I haven't tried your patches, maybe it works, but I want to know the
> exactly needed options.
>
> Huacai
>
>
> On Wed, Apr 30, 2025 at 9:15=E2=80=AFPM Tiezhu Yang <yangtiezhu@loongson.=
cn> wrote:
> >
> > This is a small patchset based on 6.15-rc4, each patch is a
> > single logical change to better describe the problem and make
> > it easier to review.
> >
> > If the changes make sense, all of them can be squashed into one
> > single patch, I think that would be fine as well, let us see if
> > other people have concern about it.
> >
> > By the way, I received many compile-time error reports about tools,
> > most are related with configs, this is the motivation of this series.
> >
> > Additionally, I also received one run-time bug report about uprobe,
> > but it works fine on my test environment. If somebody can reproduce
> > it, please let me know, maybe I am missing something.
> >
> > 1. How to reproduce
> >
> > (1) Compile and install Tongsuo
> >
> > git clone https://github.com/Tongsuo-Project/Tongsuo.git
> > cd Tongsuo && ./config --prefix=3D/opt/tongsuo -Wl,-rpath,/opt/tongsuo/=
lib
> > make && sudo make install
> >
> > https://www.tongsuo.net/docs/compilation/source-compilation
> >
> > (2) Compile and update kernel
> >
> > Apply this series based on 6.15-rc4, then use the loongson3_defconfig,
> > CONFIG_UPROBE_EVENTS is already set.
> >
> > (3) Probe "openssl speed sm2"
> >
> > cd tools/perf && make
> > sudo ./perf probe -x /usr/lib64/libcrypto.so BN_mod_mul_montgomery
> > sudo ./perf stat -e probe_libcrypto:BN_mod_mul_montgomery /opt/tongsuo/=
bin/openssl speed sm2
> >
> > 2. My test results
> >
> > fedora@linux:~/uprobe.git/tools/perf$ sudo ./perf probe -x /usr/lib64/l=
ibcrypto.so BN_mod_mul_montgomery
> > Added new event:
> >   probe_libcrypto:BN_mod_mul_montgomery (on BN_mod_mul_montgomery in /u=
sr/lib64/libcrypto.so.3.2.2)
> >
> > You can now use it in all perf tools, such as:
> >
> >         perf record -e probe_libcrypto:BN_mod_mul_montgomery -aR sleep =
1
> >
> > fedora@linux:~/uprobe.git/tools/perf$ sudo ./perf stat -e probe_libcryp=
to:BN_mod_mul_montgomery /opt/tongsuo/bin/openssl speed sm2
> > Doing 256 bits sign CurveSM2's for 10s: 7463 256 bits CurveSM2 signs in=
 10.00s
> > Doing 256 bits verify CurveSM2's for 10s: 9681 256 bits CurveSM2 verify=
 in 9.98s
> > ...
> >                               sign    verify    sign/s verify/s
> >  256 bits SM2 (CurveSM2)   0.0013s   0.0010s    746.3    970.0
> >
> >  Performance counter stats for '/opt/tongsuo/bin/openssl speed sm2':
> >
> >                  0      probe_libcrypto:BN_mod_mul_montgomery
> >
> >       20.007539877 seconds time elapsed
> >
> >       19.990010000 seconds user
> >        0.000000000 seconds sys
> >
> > Thanks,
> > Tiezhu
> >
> > Tiezhu Yang (5):
> >   LoongArch: Clean up loongson3_defconfig
> >   LoongArch: Enable tracing infrastructure in defconfig
> >   LoongArch: Enable tracing syscalls in defconfig
> >   LoongArch: Enable debug information in defconfig
> >   LoongArch: Enable kprobe and ftrace in defconfig
> >
> >  arch/loongarch/configs/loongson3_defconfig | 74 +++++-----------------
> >  1 file changed, 16 insertions(+), 58 deletions(-)

I recommend putting all the config changes in one patch so it is
easier to review change and test, I have to look through each patch to
see what config changed.

> >
> > --
> > 2.42.0
> >
>
