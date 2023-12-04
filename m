Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A892ECE
	for <loongarch@lists.linux.dev>; Mon,  4 Dec 2023 01:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BqRAHEPj"
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-6d986a75337so559524a34.1
        for <loongarch@lists.linux.dev>; Sun, 03 Dec 2023 17:53:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701654818; x=1702259618; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/O6x9fYJwBsgdgrCbuB22dComvuLhmJX5eQyzCr32ag=;
        b=BqRAHEPjWl+jzLN5uTJTISaj0X2F9Y3GJrTB3pj+Pun4acKcdBfZBbRYT9YEO+bDpy
         OvVl08iN81WgscfWWFTQ2yNz9AMIXc65aYxKJ66LDUy5FDW3WYLvZxwJqIXzqFWFwPq7
         c0eHFgL7MaOeap08LzmVayM/gBYqJv1PsBzjhwUSk2+xoyOnTpOY2k/G+4uCRY7NQCDJ
         XpM+NzNLKoZ5ejhyKaBht54ylywc/Nf/LaE65K24wmGj9cn55m03KRErmzJgoux/qN3M
         A9lRMYo1KDZNazbCS+jLhVwP1gwBA90I1OSdwIpd/sb5jcaFYpb0egP4bpFMa1e+OMGz
         4iUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701654818; x=1702259618;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/O6x9fYJwBsgdgrCbuB22dComvuLhmJX5eQyzCr32ag=;
        b=WAG/1dZaEdBMNsiOczTowD2vXQhait5/LhmNhVIaUds+0w/37uXPa4J3tLIzgGOSX4
         4mRU7m8kpv+Y6HwonGQNO1WHHxkZkL9OAmwcCSjPZXozQ4A4gjwNfIAQjirkLRy83t3j
         mmYsMEKAGhAk8Xg9d8AkQVBwCNS6fVCBfxPt6WrdBLdSrZi6fAHlRnPbabFRyAbSjBMR
         OKLd4g670JrpxtkwNiD8r6leFJJkxcr1sHscl6zHQBP7YS1XrK6N/Eh8EHpnPlzw6Q7n
         h3n7OpjuxSLsTlMUjldPiPvrfjLyRRwPS9l/mrkCjl22vihPNc7LSPQlg2LTBXFOu4zw
         XFUg==
X-Gm-Message-State: AOJu0YzBj/kWAw9hhRTxj7i0kmGtjYhy4f3ql11nvBaR+dFSVWViVzi3
	BfP/AesjFLF4bgs5MV0GgFs8kVh0xNM5DyMfdck=
X-Google-Smtp-Source: AGHT+IEdvx1YJAbBE60E7Uiicb/PgJqeraAhxjunFjP/E5R/jWYIYQR8IcvmP8RAcyDtQymbd3V/IEvESE+8EB49KPE=
X-Received: by 2002:a05:6871:7585:b0:1fb:75c:400a with SMTP id
 nz5-20020a056871758500b001fb075c400amr4130668oac.106.1701654818156; Sun, 03
 Dec 2023 17:53:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAEyhmHT6UOryPZi7eEfw01Y_CjAqxy8NM6eKkdvdojJqB9P7eQ@mail.gmail.com>
 <CAAhV-H5pKEzVnHKCiHm9=9wDapa5RhS5uMFEo2KHBskYrP7DnQ@mail.gmail.com> <CAAhV-H73o+RjdFBe3mHJJkqttNzZgamPfs-6oiXj5iwxL8fxww@mail.gmail.com>
In-Reply-To: <CAAhV-H73o+RjdFBe3mHJJkqttNzZgamPfs-6oiXj5iwxL8fxww@mail.gmail.com>
From: Hengqi Chen <hengqi.chen@gmail.com>
Date: Mon, 4 Dec 2023 09:53:27 +0800
Message-ID: <CAEyhmHSQj4idr3aTeYPpiDCjDu1WFmQug4vjNh88wfRs_oLcdA@mail.gmail.com>
Subject: Re: Kernel panic and stall triggered by bpf selftests
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Tiezhu Yang <yangtiezhu@loongson.cn>, loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Huacai,

I've found the root cause for the panic cases, will post a fix soon.

Cheers,
---
Hengqi

On Thu, Nov 30, 2023 at 7:23=E2=80=AFPM Huacai Chen <chenhuacai@kernel.org>=
 wrote:
>
> Hi, Hengqi,
>
> Maybe you can get something useful from here:
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commi=
t/tools/testing/selftests/bpf?h=3Dnext-20231130&id=3Dd128860dbb29cafc3c65ca=
2d22082745a32829dd
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commi=
t/tools/testing/selftests/bpf?h=3Dnext-20231130&id=3De13b5f2f3ba3df1ca31824=
d2fdbd182250fa10c7
>
> Huacai
>
> On Fri, Nov 24, 2023 at 2:29=E2=80=AFPM Huacai Chen <chenhuacai@kernel.or=
g> wrote:
> >
> > Add Tiezhu since he is familiar with bpf.
> >
> > Huacai
> >
> > On Thu, Nov 23, 2023 at 11:12=E2=80=AFPM Hengqi Chen <hengqi.chen@gmail=
.com> wrote:
> > >
> > > Hello,
> > >
> > > The following bpf selftests tigger kernel panics and stalls (RCU rela=
ted)
> > >
> > > | TEST CASE               | JIT    | JIT + UNPRIV |
> > > | cls_redirect            | PANIC  | PANIC        |
> > > | sockopt_inherit         | STALL  | STALL        |
> > > | test_profiler           | N/A    | STALL        |
> > > | verifier_map_ptr_mixing | PANIC  | PANIC        |
> > > | verifier_movsx          | PASSED | STALL        |
> > >
> > > BPF JIT can be enabled by:
> > >   # echo 1 > /proc/sys/net/core/bpf_jit_enable
> > > unprivileged BPF can be enabled by:
> > >   # echo 0 > /proc/sys/kernel/unprivileged_bpf_disabled
> > >
> > > For the full logs of each test cases, see below
> > > https://github.com/chenhengqi/public/commit/75a265e961e5d93b61c3b012e=
16f1db2f9d333b5
> > >
> > > I spent quite some time debugging this, but unable to isolate the
> > > related code path.
> > >
> > > Thoughts welcome.
> > >
> > > --
> > > Hengqi
