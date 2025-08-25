Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF2E122576C
	for <loongarch@lists.linux.dev>; Mon, 25 Aug 2025 02:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756087882; cv=none; b=m3vXCN81ihxSHdjd3z5c3UCts1ayiOcUI0gmMTQYjxaWbXYBacHVgs0RVdl4Ptrhumo7hZJWWmRI3Yt8OHqN2X0b/O4uKB8ag69t+oNgnzcL1qVPI/UESBR1oqhAXcrHvhkb5bU9Vif7+8GhEQQ8KpTQRqkszK5UweaGiTtpTq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756087882; c=relaxed/simple;
	bh=TyW8v0tkCVtHu4cmdJXa1X+Tz6q4M/tb1TgnSbRBk+s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pN/r3M1FDFM8ZaxBWQrRPN0RzXp66zzG8IT6hB8F7sjaNvNy0QGoUB8i2OlfhmLNVg6/b6F94tVDsu1u6hrrJotEecCM0lLmmKvctcAOyH+za50dLKmW3dYpMFmKxwt0dTid2SCpDm3Te9WxT53CmykZE0DinLStYfOi9nU96h0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IbJqp3l3; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IbJqp3l3"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-4b1258a3d71so45939321cf.2
        for <loongarch@lists.linux.dev>; Sun, 24 Aug 2025 19:11:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756087880; x=1756692680; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1zBN6uIrwk8W4rRVF0NfRinFBRrEKDWukDgqTocnXYo=;
        b=IbJqp3l3s58bsTiZDZYJNP8NGOwY2NmePpQFGSxy+eVjFFL/5y7rtpxZUWMUND88tU
         1s4nc0SdTVbTgsuddjYlHSQAWXSiap/1metbnq0ZhJj1iNVTarrAb+d0EJCS/UdySet2
         ocNr5Y69OxrLbeoAgicJpRRbdVio6fZO0/4s0Xgb9Os/GSpjnUoGi6AD1JPGJkTiRmmi
         Tf8DxUTn3t1QUEN+/up4KHdRxWon2A0TCr/Hi43ll9ElDv1GitnzuwwF3JduaWdaI/RM
         6mNEjb3k+ahBd+rMOIR3f9JFXAxrm7YIK43Mm+bMXuwqrSOsJ94/VeK0W4gw2A3Kt67N
         iyHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756087880; x=1756692680;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1zBN6uIrwk8W4rRVF0NfRinFBRrEKDWukDgqTocnXYo=;
        b=Gt3fiU5/7UmOFPi2Yny5cPCBYNKOnN359dBwQBFdDby+axSZLxHU2uf48mEkfRx9f8
         EMtpVeN6qmEJU/guDAaBckJM9pui584ppzXFaQmcxtVCVodja+SFKepVqZ6vObe394y0
         8xqUu9e4tlWLuAQ0IaWxNQD47hAkSk9k+OEK45jOuAomLnAHXeqSaWqp1WTDwXvZeK8z
         KB4VdgwKXEpo0CfaviB+swe3BmHHa20cCg96exyf6FBQnSH+b4tpXNz/DQrcbbGQgeAb
         papoPymu38cOFiA3hwWP+x/20O389/AoME8Ghe/HH3YhN3UZqs9y2FJQ36ypKBZxroWb
         kv/A==
X-Forwarded-Encrypted: i=1; AJvYcCW6V0nWOZwYmscFhGiiPsqzDyEJP1OKKC8IdnDcrPPq41vHSK8usSpWY8z5HGpl7CuSBgnglbpxmwY=@lists.linux.dev
X-Gm-Message-State: AOJu0YxS2aU2o0oz3vE420fyIIwPNDPESYnbXMzyhvHBb7wO+50uiBr1
	+EPyp1SD/tuUeARM3ZYZI1DVWXTyX4Y0Y3gHnh9+uIu5WRcLbbWzKdnAIxgZbozbFe1WBSHLOFY
	KNh+ESplwdkU6NuLDGQu3QpvJ24HgnJc=
X-Gm-Gg: ASbGnctxdVtIWswkRaUhnm4sa6O7sWKjDdxFfGz5p1K8R3D8uVRtXvaReR2cMj3CAG6
	h/rBquoys4h8r8vhL+oKvjl6Li513LJd9KPD/j3q+FA7kDAS20VKpMh3BOflxgKZGzx2/rDK+nv
	E6uzSp0DUZyuNawbj2Ty28weq4Lf/dimK4H7YgtLXslfXLXcDhB6MXGs79VJ69QSi1PHjXU9rhB
	rx7tcg=
X-Google-Smtp-Source: AGHT+IHVkoUZGowdFSTkgl4LbXKBceF61hSY3wUFutUbImjAU7ryiXeHBgFXlWnqK0JaJStAihQ+74+tMyJaQu9ffKA=
X-Received: by 2002:a05:622a:92:b0:4b2:8ac5:27bf with SMTP id
 d75a77b69052e-4b2aab513c2mr120600001cf.74.1756087879534; Sun, 24 Aug 2025
 19:11:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250821091003.404870-1-hengqi.chen@gmail.com>
In-Reply-To: <20250821091003.404870-1-hengqi.chen@gmail.com>
From: Vincent Li <vincent.mc.li@gmail.com>
Date: Sun, 24 Aug 2025 19:11:08 -0700
X-Gm-Features: Ac12FXzDM6kbMFEc3IG7buSfGiLD5L067Awb_cRPHaN9KsF-VGmAXUb84tK8VFY
Message-ID: <CAK3+h2znPrsopFNc67vXddKzAnfLoLXN+3KPQyG638kDk5E8dA@mail.gmail.com>
Subject: Re: [PATCH 0/3] LoongArch: Fix BPF trampoline related issues
To: Hengqi Chen <hengqi.chen@gmail.com>
Cc: chenhuacai@kernel.org, yangtiezhu@loongson.cn, jianghaoran@kylinos.cn, 
	duanchenghao@kylinos.cn, ast@kernel.org, daniel@iogearbox.net, 
	andrii@kernel.org, martin.lau@linux.dev, bpf@vger.kernel.org, 
	loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 21, 2025 at 5:16=E2=80=AFAM Hengqi Chen <hengqi.chen@gmail.com>=
 wrote:
>
> The following two selftest cases triggers oops on LoongArch:
>
>     $ ./test_progs -a ns_bpf_qdisc -a tracing_struct
>

I tested this patch series by running bpf selftests as below to bypass
the tests that would hang up the loongarch kernel, I also denied the
tracing_struct that I think is related to module_attach and
subprogs_extable, these three tests I think is  related to
fentry/fexit on kernel module functions and that would hang up
loongarch kernel. The rest of bpf selftests failed report for the
loongarch kernel  is here [0].

./test_progs \
--deny=3Dmodule_attach \
--deny=3Dstruct_ops \
--deny=3Dsubprogs_extable \
--deny=3Dtracing_struct \
--deny=3Dtimer_lockup \
--json-summary=3D"./ns_bpf_qdisc.json"

...
#213/1   ns_bpf_qdisc/fifo:OK
#213/2   ns_bpf_qdisc/fq:OK
#213/3   ns_bpf_qdisc/attach to mq:OK
#213/4   ns_bpf_qdisc/attach to non root:OK
#213/5   ns_bpf_qdisc/incompl_ops:OK
#213     ns_bpf_qdisc:OK
...

[0]: https://www.bpfire.net/download/ns_bpf_qdisc.json.txt

Tested-by: Vincent Li <vincent.mc.li@gmail.com>

> This small series tries to fix/workaround these issues.
> See individual commit for details.
>
> While at it, remove a duplicated flags check in __arch_prepare_bpf_trampo=
line().
>
> Hengqi Chen (3):
>   LoongArch: BPF: Remove duplicated flags check
>   LoongArch: BPF: Sign extend struct ops return values properly
>   LoongArch: BPF: No support of struct argument in trampoline programs
>
>  arch/loongarch/net/bpf_jit.c | 54 +++++++++++++++++++++++++++++-------
>  1 file changed, 44 insertions(+), 10 deletions(-)
>
> --
> 2.43.5
