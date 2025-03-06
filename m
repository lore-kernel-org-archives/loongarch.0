Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A99D321505F
	for <loongarch@lists.linux.dev>; Thu,  6 Mar 2025 16:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741279216; cv=none; b=i8xbNPHJ4poH9AZFmreDk9lM6uRFkvSAgTgCm2+DBeNZtGHkCKhoynuI4zjLmNFLVqmzCV71udFdXZ4GweG2Ex/lmhN2xqXYgRkPpEDMgTDwfkKA3EXgHLWqCE6d7Bc1y8rY/r9IIgusSlc47SkcmjSofYnBiqA71eJRykRHBEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741279216; c=relaxed/simple;
	bh=1VYXkR6M+VK4phNIsCJpZXb7BkWQamJ/dVm6cyB0/Qc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UWrfXPDi6M/ykb58pmpziKerrTl0VWJPeTxtn89SoTIMOQlQog0EKSMoF50PoRoCDgzf8hj9rV2AiuBYZDxKfLUb7+PixOjJLkjkrcwsqKc+eIQHfN0h5CuUfD+wYNhtV5GOH3Q96aw8zHTuXz1X12Cq6gm02T/ttDpoViCaor0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iGghUWcf; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iGghUWcf"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-4750bc8d102so8185961cf.1
        for <loongarch@lists.linux.dev>; Thu, 06 Mar 2025 08:40:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741279213; x=1741884013; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D4TlFKFABE6JuyxPMRwnusgLB0AVbZibXRg8T64tX9o=;
        b=iGghUWcfK6Jpke1ynv0Gxy90e7c7ne6aMpc2DrslDN7WjRAwJvd606p4u0qX+IkHvQ
         aMJYERXuknQRBtiZlr7hU7XxFIIGHi4X+rQwSV0hHhkq9cr6ZEj2pFRojkY+B6D7/8hn
         UExBzz7mtVx+xnxBoNB6UXvbWzcEZC0ze8DhDvEsHqDOC7T+EGpbMm2Zw0K+3fwQoyp4
         mYOFlVQx1a4Y8SI3O5sU1XPco2sUDWvcJfEnTe7Uks9Wtt29CISF/6MgTigkG8CI7yht
         mryNclRq/HinihrfiVVC99tLYpoKClueRFgG84RUgDOradHHojBVvtrhTrCIoR1JSW/4
         4L1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741279213; x=1741884013;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D4TlFKFABE6JuyxPMRwnusgLB0AVbZibXRg8T64tX9o=;
        b=b0SUj8oK//Nh1FmuPCYtXw9ribfiu8DQqraAOexLG6mQ4/zEbcjp/GLXPRGsLyTEsO
         UondPqDhQXAwkyxJDqx11w/SL09KxOd9SZIXVdBBco3KlSIGN9aiwxtfZGpr6VEsg5l9
         7EcTX/TQDWCOiIx++CXRBkNeIsOg0N57fqoAlra2puchwNa82kPlUOhEGK3EPbzFz6K6
         3KTdMbC6qWkXQ3ax+xfcJ74JABcrsZSxSX2YxpeEglkduG5MmRqB1CbSvnBp1G3vMFFw
         OEY2YVwEoANOfKT1eXICDudI3j0fJYnGFeIsLZqpuzEe0S1qrUbfYhh9iOclsiw+NdVg
         YHWQ==
X-Gm-Message-State: AOJu0YyemJ7sTHSTyzw3jW19CCxE6Y6uXQn+4PIv6fGv4eBbihgm/XLu
	pxCz8RTW0m1m877PCmP5wNJQavHsueijb65vufEUXwZGBL9TD2JqgXUdas4xTkyi/iLI6kDq0td
	+/6QQBYQ5bnxvDE5UVfDjR5Ct5SnkkZQv
X-Gm-Gg: ASbGncsxWqn7iwncGo6pA26ZubePjtHvlYt37UfAmmml+5CW4tJjyghj7d0KbXTAL/5
	EP35aJdAZVC5SUNYMcU2JHnZKttbvpyb4x8lhV6apCzxXTn6LcIdIP9BPKLw+DUmAvZQhZJCM+d
	2y8/TaMwf91lB+yah9Xt6jIpKS+g==
X-Google-Smtp-Source: AGHT+IFjINnac5n3KPzDytBLQf9mnfBZNHqNnctTdb6SPxqPI0sc5AfANONUKSj7Hf48oq9uxA+ou8cNgVCTZRSryTQ=
X-Received: by 2002:a05:622a:450:b0:474:fee1:7913 with SMTP id
 d75a77b69052e-4750b45aed0mr86667601cf.24.1741279213420; Thu, 06 Mar 2025
 08:40:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAK3+h2w6WESdBN3UCr3WKHByD7D6Q_Ve1EDAjotVrnx6Or_c8g@mail.gmail.com>
 <1e6f33356ce63b19a730eda60719c3e5257e0dc0.camel@linuxfromscratch.org>
In-Reply-To: <1e6f33356ce63b19a730eda60719c3e5257e0dc0.camel@linuxfromscratch.org>
From: Vincent Li <vincent.mc.li@gmail.com>
Date: Thu, 6 Mar 2025 08:40:01 -0800
X-Gm-Features: AQ5f1Jodrm1ue4ZfyBD8q2rK8TqE2J9Y2lxi7zPNMl1s_qEJRTZQ1x6m-Z1XPO0
Message-ID: <CAK3+h2zugg+UQJVVJx+n9zKq=YzmoDoRz45UEbEtsmGHNh043g@mail.gmail.com>
Subject: Re: [BUG?] loxilb tc BPF program cause Loongarch kernel hard lockup
To: Xi Ruoyao <xry111@linuxfromscratch.org>
Cc: loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 6, 2025 at 4:55=E2=80=AFAM Xi Ruoyao <xry111@linuxfromscratch.o=
rg> wrote:
>
> On Wed, 2025-03-05 at 16:53 -0800, Vincent Li wrote:
> > Hi,
> >
> > I have an issue recorded here [0] with kernel call trace  when I start
> > loxilb, the loxilb tc BPF program seems to be loaded and attached to
> > the network interface, but immediately it causes a loongarch kernel
> > hard lockup, no keyboard response. Sometimes the panic call trace
> > shows up in the monitor screen after I disabled kernel panic reboot
> > (echo 0 > /proc/sys/kernel/panic) and started loxilb.
>
> It's better to use a serial console to get the panic message.
>

I tested this on 3A6000 mini PC, it seems no serial port is available.

> Or if you can see the message on the screen just photo it and attach it.
> If the message is incomplete or broken, enabling DRM panic and using a
> DRM driver supporting it (for example just SimpleDRM driver running on
> the EFI framebuffer, or AMDGPU with the latest 6.14 release candidate)
> would likely help.
>

I have the  call trace picture attached in the
https://github.com/vincentmli/BPFire/issues/76#issuecomment-2699091059

> > Background: I ported open source IPFire [1] to Loongarch CPU
> > architecture and enabled kernel BPF features, added loxilb as LFS
> > (Linux from scratch) addon software
>
> Please don't refer a system forked from Linux From Scratch many years
> ago (even before multiple major refactors we've done for LFS) and for a
> completely different objective as LFS.  Yes Linux From Scratch is not a
> registered trademark so we cannot really stop you, but referring such a
> thing as LFS will just puzzle people.

Sorry for the confusion, I don't know much about LFS history other
than knowing IPFire
is based on LFS, I have no intention to mess with the term LFS :).
