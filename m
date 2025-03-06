Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89CB025D8FA
	for <loongarch@lists.linux.dev>; Thu,  6 Mar 2025 20:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741293440; cv=none; b=g+tbMKpkK+2IX+O35VAJ4oTqrbjkfefX2FHWc15ghpF8A+c2HFHf1pUKVF4s8CmOfFbUrAKvKY3Y0Sh2+6dFBJ9LyAO8GRMjQTtWejjxzBgsUPpyIlw7kFs1ZbUbXpSWT7YWyEU9E5Dwy9/WEouf+XdxQeOGa2tYCQCy9y/tZxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741293440; c=relaxed/simple;
	bh=R2aBQXqe76n44wlQboEU86eLZISUmm8xoc3v6vHTwTQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YFKrBJZ0qPxTA+Z7zNeU6eAjnbydbkbMZPQAT0W5ZaVJOqmpxSdI33e4qC2lD1B4UAgSRAbIsPzwamWuzItAb5ZtTzz8LytVsMeBI3sc1ZZ78IchBLLJeJhNb6soFQDDwFLUkhJtH9ynuSggaw0J8WIcxbSxi1ZeLq7ovnHMdq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MlWJ5+Gz; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MlWJ5+Gz"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-474e0bd966dso9145461cf.0
        for <loongarch@lists.linux.dev>; Thu, 06 Mar 2025 12:37:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741293437; x=1741898237; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u3sGJ8o/dKJaiJh5keAs+as1aOJ+rHZACcRN9kFRumQ=;
        b=MlWJ5+Gzje0qrMs1DjHRcPCmvz2heJ0xHHsegXXJT01SORVt1H7GjTj4t/yFwZS3qE
         v8EMwTlVeDC1979nMq0QZw0KcvcQ65rq9S7JhnWKq6x9svGXe13eKVHjXAurRJ92RsBu
         vO0J6xAkIaL4v4M042XwIZRNcQHthy7pM0Yoztn1RSBuEyOvjm2s2+ae5fJU5JSqJR6c
         mmjL34UuCAuXcrzPwqTLsWJI1TpBj8ywKQtLyprS2EJoLWXlR7sXn7dEee7slYdYISUP
         M2NnMklGybHfb6Eydze3ZB/ynjstgIBrOazNtRDz4BNb6/LgDt6X8ueubV/U7V9ikWm9
         a+ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741293437; x=1741898237;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u3sGJ8o/dKJaiJh5keAs+as1aOJ+rHZACcRN9kFRumQ=;
        b=BBup9oDMKsG6S2eohGwgMY3vmd1BT7mTHSb7NEVPZgq3eZtHcJgXXUSoL0DPjvWzfW
         QTGhz6gUai/CJk8cUfL1FY4cQcxhin2iLlPJQn+ikiFbwBu5eqwlRY5TZLdgk1h/Jv+V
         N9QyZacYuQcnimxmVg5TsFOkH8pPOGGTiYe4tku52MpcXcQjupokujRI8OkDkoTWIHwX
         9yMywQyczAdIxyG4+hPnArf32zj5mAgm0rLdRFjOIrlvER6T6as6V418EQsFHJ3Vs+sn
         ylfNNdGthnaxrTZPQHyIYjvzJTSEbB6QhvffTWre1CcObrvXcbZHTmc0RQ8uy5X37Fry
         KoSA==
X-Gm-Message-State: AOJu0YzBwOxrgxfJf4Wg0Gy1WjUGVSLW0ReWdkdrBfPCw99j+lFaB8/j
	JXS80vx5iq7eyYXeWXONplsRUPuTyx8s7FlW35kzrnPECiuPFsL4IqYWBCVeOdB2fRNrEQMFwHK
	Ou14cEzDkhZC8CDwWUoIGXhC5zu4=
X-Gm-Gg: ASbGncvG/5kSgrvNQa7Q8pnvD0LLOlpjBJD9DXmYv3ZohOeiLBM4JxkvlSnubnCO3J5
	AQ+EliAPA5mmhucHz+YY64M1hwrvMkDnn7kZ7sES8dW7EYcWsARW962C4lwEgXGNw12YGtBid6n
	0Qx3nlCv+azrLtHAZ7OLcdpeZ+PFqrNsOJggnAwW6WVa73WhmAKNZm6Yb3Vbs=
X-Google-Smtp-Source: AGHT+IGaFrZrgFITow4KddN7WPBVxwXecWVQYu7YHINtHH5o3/ly8vnZzt9yeA+WutWeTz3/I6c8wXPxdIcX17DIG1g=
X-Received: by 2002:ac8:7dd0:0:b0:474:fee1:7913 with SMTP id
 d75a77b69052e-476109c1698mr5848481cf.24.1741293437150; Thu, 06 Mar 2025
 12:37:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAK3+h2w6WESdBN3UCr3WKHByD7D6Q_Ve1EDAjotVrnx6Or_c8g@mail.gmail.com>
 <CAEyhmHRCXHbd9NL2QvOvY4yhKg2W7T0+d+0U9-PH5JCt8RqG1g@mail.gmail.com> <CAK3+h2zWGJ3BKO6bErk=-m0+gE49iQ_JJG5FQZxXoiGsGY_CXQ@mail.gmail.com>
In-Reply-To: <CAK3+h2zWGJ3BKO6bErk=-m0+gE49iQ_JJG5FQZxXoiGsGY_CXQ@mail.gmail.com>
From: Vincent Li <vincent.mc.li@gmail.com>
Date: Thu, 6 Mar 2025 12:37:06 -0800
X-Gm-Features: AQ5f1JqPpze9_j4Di7wOlhQWAVStIaUedqs9v3wAjEvN0Xz5quUOOwZoHWQw-9k
Message-ID: <CAK3+h2wBF1_B3iBqk=8HFyxSYE4KioSnkxj6CvVmHDLx-RhbNQ@mail.gmail.com>
Subject: Re: [BUG?] loxilb tc BPF program cause Loongarch kernel hard lockup
To: Hengqi Chen <hengqi.chen@gmail.com>
Cc: loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 6, 2025 at 7:39=E2=80=AFAM Vincent Li <vincent.mc.li@gmail.com>=
 wrote:
>
> On Wed, Mar 5, 2025 at 11:34=E2=80=AFPM Hengqi Chen <hengqi.chen@gmail.co=
m> wrote:
> >
> > Hi Vincent,
> >
> > On Thu, Mar 6, 2025 at 8:53=E2=80=AFAM Vincent Li <vincent.mc.li@gmail.=
com> wrote:
> > >
> > > Hi,
> > >
> > > I have an issue recorded here [0] with kernel call trace  when I star=
t
> > > loxilb, the loxilb tc BPF program seems to be loaded and attached to
> > > the network interface, but immediately it causes a loongarch kernel
> > > hard lockup, no keyboard response. Sometimes the panic call trace
> > > shows up in the monitor screen after I disabled kernel panic reboot
> > > (echo 0 > /proc/sys/kernel/panic) and started loxilb.
> > >
> > > Background: I ported open source IPFire [1] to Loongarch CPU
> > > architecture and enabled kernel BPF features, added loxilb as LFS
> > > (Linux from scratch) addon software, loxilb 0.9.8.3 has libbpf 1.5.0
> > > which has loongarch support [2]. The same loxilb addon runs fine on
> > > x86 architecture. Any clue on this?
> > >
> > > [0]: https://github.com/vincentmli/BPFire/issues/76
> > > [1]: https://github.com/ipfire/ipfire-2.x
> > > [2]: https://github.com/loxilb-io/loxilb/issues/972
> > >
> > > Vincent
> > >
> >
> > What's your kernel version ?
> > Could you craft a minimal reproducible bpf prog or try with latest kern=
el ?
> >
>

I tried lastest kernel 6.14-rc5, same issue.

> I am not familiar with the details of the loxilb tc BPF program, It
> can be tricky for me to come up with a minimal reproducible bpf prog.
>
> I  has another smaller XDP program
> https://github.com/vincentmli/xdp-tools/blob/loongjit/xdp-dnsrrl/xdp_dnsr=
rl.bpf.c
> that could also lockup loongarch kernel and can be reproducilble on
> Loongarch fedora community release,  but it may be a different issue.
> The common thing between loxilb tc BPF program and this XDP program is
> they both use bpf tail call, not sure if that is related.
>
> I can upload the new loongfire flash image  which can be installed on
> 3A6000 if that is helpful.
>
> > Cheers,
> > --
> > Hengqi
