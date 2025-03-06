Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 598E5184E
	for <loongarch@lists.linux.dev>; Thu,  6 Mar 2025 07:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741246493; cv=none; b=tBr0X02kRTjQOjfSxAYfWSOFCss9pHOkiEclraRTk1gHv03TnHLnOR2uv6jUa/90+ht1Hoxfu64KmsnCRMp3QJno0bT91oWM6WbIT2d/gzW0yVd99DYtZASQUkOSEdnnnuDfoztcTpZMU9B+uijR+dTIgHXHxgER7BZi8CfiUJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741246493; c=relaxed/simple;
	bh=U7paQcgSNmg+8RyHk9bHCpsXbum+neRGBpvw4lvVW4c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aH/Y9pZ57DBXKGCeKRAeg7muU+EBocqsr0Sft/onN12lvJgi+nDwJaXVDWPlD6Ksw45xWshuY4V3oZeqNnK7Bi1s1X8CFZdX4Q0LKcMTO+wsaHgQ/F+gKR970lHI4P8YgqV1DAre7Eaknqn6itIwNFw9dz5Y7f4ubSz4VtVYU3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R9GzPrNu; arc=none smtp.client-ip=209.85.167.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R9GzPrNu"
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-3f3da35555eso249915b6e.1
        for <loongarch@lists.linux.dev>; Wed, 05 Mar 2025 23:34:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741246491; x=1741851291; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nr06ATHc4iimVWFKb3Mu8eSLsVIObp0+xvvAWbDA3uk=;
        b=R9GzPrNuhWlo2JGP82mCpv9S/s0HUU6DaFFWFXhjy0NkQMFYdJbzZ8ZWXEdd+Vw+Gr
         i/g6uT8/8QJ/iWlXf32cEs4CqwGoIYV0dzXbkQeM8icsCZYBDpXyu0VzGDxC/qxnvgMB
         VYmAPelSVVujyauYNjbd1raFgwJzR+u7Mac1JGW8Xa58CAKteQeQm42eAf5s8WbXl4/z
         ZpbXYPb0uSv59IkAb7Ic4G8MnmGEWIXnjmeLi2I7KBFHSKtgLO7GZYjjfW3HhGqJmgjJ
         M+ml5h063Sewo/ITWusqusYBH8jbajcRxL4Rofg7P0ME3XdcoRG8nQOX1t3V5eHPVfCw
         uL0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741246491; x=1741851291;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nr06ATHc4iimVWFKb3Mu8eSLsVIObp0+xvvAWbDA3uk=;
        b=fvecTpgov5qSdTD2qmDzMflGdFcL1bsZbxibnGbG7HiavMMn225U9IVLPgaZZWbK0w
         4iqi/n2IOx1xj4OuecN/49OyMGubolCw8/AqxQpPEE1ChYMLywwEnnaFZLYv8TzvmhD4
         heOpTQhkuTHIZQK5K/8cVWVTJykmp8rX7a6EZk7eFHTk4YZmXNH2irM/2QHs909Gl79I
         acFxYU7SrPCHr1Bi3AEaIigtr8UMpYkFCj3Uedh/iDKT2Ih9XtT7gBaWZz3kyXRkLHwa
         8cK4VJFKhb2/VjsV07OZ8Hq8DRxQPIH2hFrhNNOYCVmdzEnxpcfg1cBmuo13ckC5t2Tn
         OkOA==
X-Gm-Message-State: AOJu0Yw8SHnky+g7WhsvkIH0inoxjs8LOoFkR7Wh2rHNjFKlSoWKD6hJ
	d/MOBh6hPpZlntIIhSczmBvoYATD1wmgZT8aZhHjNEu9Ud0r1XveuXxQDq3kEPgmqA2XNpbkxK1
	NmJQZN5zS/C+31FUV0q2uQSeeLzE=
X-Gm-Gg: ASbGncssTBc7i84uoEFYfYcAgRQdr+6Z0B3egvjF80xfF0vrLozD+GIQMpzBxrW5+1t
	EZ7U88BJ0fRfoJd7hfsOdsstkaICTJSIfjhYo1/r4/+mYQVpQxvjRIilVKfzjsCbfRsuFtWQT3Q
	OuzPHOUXupoDuT2vbOqIJuvVx7WQ==
X-Google-Smtp-Source: AGHT+IHlAuDrnnugLExSjGsG0HyL0TeYredydl278k8RmkKLsw2cWbNx5ox2bRAyNRPmo+JA7E3RXFk5OIN5YL4XPKE=
X-Received: by 2002:a05:6808:2dc8:b0:3f6:78b2:9ce4 with SMTP id
 5614622812f47-3f6831d069emr3729402b6e.28.1741246491359; Wed, 05 Mar 2025
 23:34:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAK3+h2w6WESdBN3UCr3WKHByD7D6Q_Ve1EDAjotVrnx6Or_c8g@mail.gmail.com>
In-Reply-To: <CAK3+h2w6WESdBN3UCr3WKHByD7D6Q_Ve1EDAjotVrnx6Or_c8g@mail.gmail.com>
From: Hengqi Chen <hengqi.chen@gmail.com>
Date: Thu, 6 Mar 2025 15:34:39 +0800
X-Gm-Features: AQ5f1JpucGClUwDGxbvnxB3QHjHIs2VqySKetPvodXvQzJbUUGbOs0DFXFrqrnk
Message-ID: <CAEyhmHRCXHbd9NL2QvOvY4yhKg2W7T0+d+0U9-PH5JCt8RqG1g@mail.gmail.com>
Subject: Re: [BUG?] loxilb tc BPF program cause Loongarch kernel hard lockup
To: Vincent Li <vincent.mc.li@gmail.com>
Cc: loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Vincent,

On Thu, Mar 6, 2025 at 8:53=E2=80=AFAM Vincent Li <vincent.mc.li@gmail.com>=
 wrote:
>
> Hi,
>
> I have an issue recorded here [0] with kernel call trace  when I start
> loxilb, the loxilb tc BPF program seems to be loaded and attached to
> the network interface, but immediately it causes a loongarch kernel
> hard lockup, no keyboard response. Sometimes the panic call trace
> shows up in the monitor screen after I disabled kernel panic reboot
> (echo 0 > /proc/sys/kernel/panic) and started loxilb.
>
> Background: I ported open source IPFire [1] to Loongarch CPU
> architecture and enabled kernel BPF features, added loxilb as LFS
> (Linux from scratch) addon software, loxilb 0.9.8.3 has libbpf 1.5.0
> which has loongarch support [2]. The same loxilb addon runs fine on
> x86 architecture. Any clue on this?
>
> [0]: https://github.com/vincentmli/BPFire/issues/76
> [1]: https://github.com/ipfire/ipfire-2.x
> [2]: https://github.com/loxilb-io/loxilb/issues/972
>
> Vincent
>

What's your kernel version ?
Could you craft a minimal reproducible bpf prog or try with latest kernel ?

Cheers,
--
Hengqi
