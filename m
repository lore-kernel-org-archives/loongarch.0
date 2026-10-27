Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793088841;
	b=WRowwwSp/OfvYUrSuYbC2P4Rr69VPXmkQrdr0vyHoXUc1nmeFpk5H3STmU+TFD0gcvmC
	 djnWE8KjQif/NU++wvmpkvwkV2Rr/kc/vi8N8Beyi3TTBnrc2wsWtMz/lZHQzEGY1SQZ9
	 rY+vjzHj6QaqhMYm4zaxnAc7DvU66zKPhVAaDaInommjKoonw4VR5Y8V5iCSJb3SSk5pb
	 KMFxRaEhozHdrpnPsgOJD6/667Jzu1lp08G8Jh/GIMO8vwlv8Y8fB5BTrIuGukGTpH6ms
	 2zUSyv+iTUB3Z3DpQr16tn6pUta8jqJK6/fppkXVAV9iCob/Tc/yo7V4KxIslmVlCxA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793088841;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=w8VOaIxB0TFBB/OhvCNXDLo6PM/lUvCeTHrTbRbZxP4=;
	b=xkIzQF/rT/eJwSGpAI+8FxLYDFMx4oJBtlVLo0zeKau4s3BkpE6JjsH7BkSCWT2krarz
	 H0LwqhVErfpXwDjzFZUH6WqEU3aQenm83RNjbZg6pYzk4w2xLD1OYk+pLAHC09PLtVCbq
	 JiadGjNtDuY+sIoWFUCwvafgyV2XW9B3vv3aK4atyi3/yERVvWBWQVud64rjpAiD7+C7B
	 fhHGTmVedy3I7munbHN0fxd8S9XA2C8B3LvVnFBxCL8FdiIivwJcqSSn+D+JPRponwPmp
	 FY7zLCewDrKAijcdQD5sk7niaU0SJq4Eaicne5ZxrpBScIt/Osd8OIhRYOdyBcqbjvw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="CPV/f6JI";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.43
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FB9E606A31D
	for <loongarch@lists.linux.dev>; Tue, 27 Oct 2026 08:14:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1FB9E606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CPV/f6JI
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-4a822463a22so2134305fac.2
        for <loongarch@lists.linux.dev>; Tue, 27 Oct 2026 01:14:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793088840; cv=none;
        d=google.com; s=arc-20260327;
        b=shu65MPitcac8nuRRMiHjud6FLxmGFt2wXyg4ftGwHOoAAHamkf9vmLGsMzBnxsrkX
         uo1Ug1f9OvjraI6wffJ9KwPVapWsr/U9PAqWrMofK6NL17wGUphUKoEOg/CJTBLpt9wL
         JnzpcRfaCLVNB52oBWFtuVOK+gkvWsI3EFLL6KinPramFrkBLPlRLXUqgDUcNdBR+/fF
         o+3dydZEdAoJlOKgaBbrgrKEDlyOyObMHFPPAu46g8wu4S0n/T7F0F9OPf1WkKVsfKip
         np69IPFydw9FkzyHJ1n7ae8xLU48txAypsU9WFbmkQVD6v0fJH29MAs+0HUkcKeHfJY8
         EGMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=w8VOaIxB0TFBB/OhvCNXDLo6PM/lUvCeTHrTbRbZxP4=;
        fh=rqvjQ1qDFPfEALQmFhMu9teFLOF1/0hdwnXkyJpctPc=;
        b=IdL/IZ4bAmDW7GjPfNOOk3azeww8dqd1PlLoCOYbjEFMpyvCyNaTqSa/kKd+cWqDH7
         +luGP7UGqzztVsnqUzqUhEfXGoWLxnGaArxCoy8AFiDGbhg0vRBiJvhqQ8mUvyDr7RcL
         zfJ9pHR1ZCylg7Wc7X3U/73sVADew5z/Bt/OusjwHAYFoTKgKBIOMUaUV92/hRcplPyz
         uRU+ZzqH3lZDLjbbLzNeXsBTQFdrrxXTQ0e1ehCZKAHekyleo6r89FkQ2jPIRB3eLTVe
         ZPjxG6x4S81mgUBXuZWo5FfUxRagXGFyjY65QGzczRJL9JCH++Hz1d/i+dNFFK1pHitr
         lpFg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793088840; x=1793693640; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=w8VOaIxB0TFBB/OhvCNXDLo6PM/lUvCeTHrTbRbZxP4=;
        b=CPV/f6JI9EV7Ycp2YZm1N6Osx+BXZF4pVOxzQC9mFkS9e7YEo2DfFCuGZBFmKNBG4z
         ABC1+WHg8Xw/9l0pYTJ94N8A3ovy35ehlw0OyBs/AepKEFh7+gqPt+RWuEsOI1rb6D6p
         WotOnPFHKm8B5gFOKVW4Tx6AdKmP3whNHjNq5yJAg+i4lBVOyuCHndbT5MWDXc5VyooX
         FPyZK9T62o8lQy4dYUqvokCCZVI2hAINI3voC+a40tRaaRso9fMZ0Ij2IZe5Nx8jK5Y7
         8+chIPfkDySbToBDFEnU0pAndvOjaa6A6lbBcE08y0MLUzMffKuQ6s9pV8QE9gsva0Al
         gMzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793088840; x=1793693640;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w8VOaIxB0TFBB/OhvCNXDLo6PM/lUvCeTHrTbRbZxP4=;
        b=Iyx5wrau+QoPTBuF6jqgcrd/bTzA/HcwtIvoqZCHJKd5ed5Qa8oxMUwp1W+bCaDrEm
         PMqnfhcKzamPkpZuzMUpW0/rc+e4CxFbTeagxlfY79IROfuR2fxN7ui7TE5em8s1VqAC
         EjajMfBw47syVNjHs1UzKi6ABcEWTFFnHIk4gc2wqcD+MeI7phMMLhLVF+EP+cukSpRD
         8i3ZhlcFA18t69DjfWWwSLqBciu3/YVz+xuXPIzmGG2bP/Ny9an2TStWocFBqO6DGow5
         RXAPneRjfQLMaDDnZqf2OPNA7RLJW9Wm1AmSN04eCiyH4E6Epm/Bl0AlXgIK2t9/QYpr
         im1Q==
X-Forwarded-Encrypted: i=1; AKwUvByZynk0L8vdIM/M0/79sRNcvk8gjHP+D0teb/v47FEqdkahl1x0nLxKARYxsr0tzL/8ypJGMgg3Qgw=@lists.linux.dev
X-Gm-Message-State: AFq9FYLEoLYCErI/bI7EuTXPnGT2EB8grbz8jpVYd/ts/wkKkJMccyHf
	egkvLuLEYvZRiwU5RFferk+VO/DSdzlybOAiSGbbTEjSsR5Yd0BqGxkPmwaeIBzh5zJGCpA4SH9
	JQgbx8jiQU6Nc3dWb+GZ2zRZ3vlMc7gs=
X-Gm-Gg: AYBFou1szsrhHPoEn5R2YZZ4pcOirrJ4fopwcw9Dr5x8mX6NEHsxk+WFd8yj4InZNsf
	3nq8+iH0Q4bHV1s2iIIdL948xMNILH2HSwMB7t8GFS4OOMQdGYfLBIna0VUrXiMeS44jGapkpej
	i6WYd5+Xp7Uovj2Ezg2W74XYGcXF/k6uhjanlzSVMRABxq7gPrzVjvQ1b2JVxem23eeIVK5tOYm
	ARmomQLXWHyszyxcZXavWVCzqX26KAJQK0U6dpEcj7VS4upgEHUhmxiHiKs/6PmL1Zv8d8L1uh6
	q3q8N4TKYGWLAbAcwRZNeFk4naTzWm0hN4dOv4WAETP/uKlehLMyOcbH7//fWDvdh7uamqzeMfa
	b+wUVJz5OfGFnAZ+5HWhVJjpkA4RyKs1VeJXxGw==
X-Received: by 2002:a05:6870:148d:b0:49d:ff8c:2070 with SMTP id
 586e51a60fabf-4a83f64f8a1mr5440798fac.62.1793088839941; Tue, 27 Oct 2026
 01:13:59 -0700 (PDT)
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261016081006.26069-1-yangtiezhu@loongson.cn>
 <20261016081006.26069-4-yangtiezhu@loongson.cn> <CAEyhmHQe5T6Ai0LXiJnwXzBgy_Xu5=upeqWHbMz7J3X6QntWBA@mail.gmail.com>
 <b5c793ec-c951-930f-fc9d-06de6f49ac9e@loongson.cn>
In-Reply-To: <b5c793ec-c951-930f-fc9d-06de6f49ac9e@loongson.cn>
From: Hengqi Chen <hengqi.chen@gmail.com>
Date: Tue, 27 Oct 2026 16:13:48 +0800
X-Gm-Features: AclHuK98IjpjRz-E6wrGUKQi5ueh0VkowRqNb6vJZLkdRKcKoBwQRts6NLE8Z_U
Message-ID: <CAEyhmHQkJzTjmYfocSqoFYBJ4Q8bq6D=Rojce3EbCAJLWEQSww@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] LoongArch: BPF: Optimize 32-bit operations using
 native instructions
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, bpf@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 27, 2026 at 12:10=E2=80=AFPM Tiezhu Yang <yangtiezhu@loongson.c=
n> wrote:
>
> On 2026/10/27 =E4=B8=8A=E5=8D=8810:02, Hengqi Chen wrote:
> > On Fri, Oct 16, 2026 at 4:10=E2=80=AFPM Tiezhu Yang <yangtiezhu@loongso=
n.cn> wrote:
> >>
> >> Currently, the LoongArch BPF JIT emits numerous redundant zero and sig=
n
> >> extensions across 32-bit operations, bloating the final JIT image size
> >> and also leading to runtime overhead, particularly in the division and
> >> modulo operations. Thus, it is necessary to optimize 32-bit operations
> >> by emitting LoongArch native 32-bit word instructions.
>
> ...
>
> >> +               if (cpu_has_div32) {
> >> +                       if (!off)
> >> +                               emit_insn(ctx, divwu, dst, dst, src);
> >> +                       else
> >> +                               emit_insn(ctx, divw, dst, dst, src);
> >
> > For ALU32 SDIV, off !=3D 0, it seems like there is a overflow in S32_MI=
N / -1.
> > verifier_sdiv.c has related test cases but annotate with
> > __arch_x86_64, so it is not run on LoongArch.
>
> After enabling the signed division and modulo overflow tests for
> LoongArch, here are the test results:
>
> $ sudo ./test_progs -t verifier_sdiv | grep "MIN/-1"
> #731/121 verifier_sdiv/SDIV64, overflow r/r, LLONG_MIN/-1:OK
> #731/123 verifier_sdiv/SDIV64, overflow r/i, LLONG_MIN/-1:OK
> #731/125 verifier_sdiv/SDIV32, overflow r/r, INT_MIN/-1:OK
> #731/127 verifier_sdiv/SDIV32, overflow r/i, INT_MIN/-1:OK
> #731/129 verifier_sdiv/SMOD64, overflow r/r, LLONG_MIN/-1:OK
> #731/131 verifier_sdiv/SMOD64, overflow r/i, LLONG_MIN/-1:OK
> #731/133 verifier_sdiv/SMOD32, overflow r/r, INT_MIN/-1:OK
> #731/135 verifier_sdiv/SMOD32, overflow r/i, INT_MIN/-1:OK
>
> That is to say, the current jit code is no problem.
>

Great.

Acked-by: Hengqi Chen <hengqi.chen@gmail.com>

> Thanks,
> Tiezhu
>
