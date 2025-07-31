Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D044239082
	for <loongarch@lists.linux.dev>; Thu, 31 Jul 2025 03:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753931338; cv=none; b=O9tkTiQWrLhWoenNdCiSVVOaIcUlD4/jJnc2IlKyxAQ7UisxSfXiBlTmLK/tuqypbB0jm81kXeRlwUxS9807vb/ErFQwiUS1ve92a+Dcn36rD5l9T+0Xqe0LemtOKwtdOlI8q5eYOpkaJXq7FQDp3U3Qy8YKs352F+MK5JRFwTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753931338; c=relaxed/simple;
	bh=mvs+ovDpBIZs4hSM4rEwzON36el9yKXw+T2mdYLlTtM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QbhkTckfvDoZ311Ntf/xVNxUnaYufd5skKyzuirsvKYrfmrHEbU7qlGPNCCotG8P0HOThVBNB4MoJZfcecrbziCLPcZ6o0mw2CPW/niQhO74GoIVC36vK3rbs3a4EY94mm3Qz2X+hHQDby0mkA26rVW1ZA0zndeSCU1rFfXik/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PtaZQR96; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PtaZQR96"
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-7e6783335a2so76420385a.1
        for <loongarch@lists.linux.dev>; Wed, 30 Jul 2025 20:08:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753931336; x=1754536136; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TisDFULU2XEIb9HwHN/LfkegFfKzxWLrbGQF5u+EfdY=;
        b=PtaZQR96tHd34GTXQagOAKvnQ+l4wVzfcLBf5NxAZjHcAyDGp67i1zoF4l7ljgxloH
         MvNTcodHyYxfTZphrnoUlwY4MM2vgY312hy/xGY1QSO8uVT9ox1I+6qV7yc6pF0alNrM
         2afJ3BU1ADvxVDCeUHysQMqs2xIQOtlK8cEqt05Me6jyJWBS5Ks45ADrnDYbZQqkI1S6
         KNMds77fZo7rnIAR/HfVJVhc1uALGOfvSL5dQJ9plE3EX83IMBoyaIn9kQtHrkvdJqcn
         0HsweGdzRW3Oi+lj4HzEKysH8gbo5UtbtyqkU66pkqSjdUT6asXcPIH0moA+9tT44Y0n
         K/kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753931336; x=1754536136;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TisDFULU2XEIb9HwHN/LfkegFfKzxWLrbGQF5u+EfdY=;
        b=i0C98vMW/cFalKraYngxYGKYFFuOUPjWs6uHyRS5/JfjX8Y1lJTrP/9N52jcFLl+3q
         0bRA53cxXQlmmsaOhZsL/I/DdWp4nwHTxi8kXJ2v1UXZpMtIkbXOAwE6syylM5gichuM
         aX9swsxW92hkF+bjAp2luwh7EJ/DOfE4CJG03+0Eh3eNT8D6fgIqoIoa7/E0DMB6q0cu
         2v0Lteko6NNLlnxkFyYZ6Pfso89TaqWWCV8DdmAG+KSMfzpy3ge0UGkPTryHQ1oS7vQP
         qvAfsK1yP7/GEJlVvBinJzHK1SWN5unHK0ff5Efp36akpD8jzYnNpocF9OxCn5ObJ0yI
         v7uA==
X-Forwarded-Encrypted: i=1; AJvYcCW5HIY8cl0oGREzAbweTYwHXQNkBIKcjYhWI676NpNcuhHxU8Y/e3jAW3K3/Ekf6IBT+4irWb5zQ9Y=@lists.linux.dev
X-Gm-Message-State: AOJu0YwfA5F87IA3jHxQIrmwhFxiBVbraWHlTW1RCil4mlhN7jQ3sG3u
	8yB1oqs7oZSUYl3MDdrI5tpJ8wr2h98HuWz2S4miIiLCduodBOOFn6j5SFzUmZFUtejiUdtiS/e
	dCvV7hOd5e9V2pDtnBVtP9bffE223J44=
X-Gm-Gg: ASbGnctSnyAUskVJDc7c2HxZSZv7Wc3qHOChRPfX4wSLHh3tnnbvgAkfv940wKf8XKS
	uIJWf0wZ708ZZ8Z9YsluVx74EogCjE1XKMVI46WJRZgpGxLPkCSgRUGJ51iBm/JkeWObCtPQoPw
	NaREA4G9zbpI2kRghfy1txgpeD7Q0/qJKIlSjrr/qGOY7XvezJM3QuL/P4nEYk6N+Kv89q3hjWa
	ybsv5Y=
X-Google-Smtp-Source: AGHT+IGLvhmfHB50pGBdVY4qBEO02QwsSzz5HSbydkaMJN6hQKpmJO5YfF5dtCFGaaHqyHNC7rWh+MCt5AftdxMxmmM=
X-Received: by 2002:a05:620a:1997:b0:7e1:31ca:954d with SMTP id
 af79cd13be357-7e66ef7923emr812172085a.13.1753931335859; Wed, 30 Jul 2025
 20:08:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAK3+h2z3Zx+0KbVcRbLuz_-LhBwov9Bmvp9HdumbaN5GYtovFg@mail.gmail.com>
 <20250731022958.GA190477@chenghao-pc>
In-Reply-To: <20250731022958.GA190477@chenghao-pc>
From: Vincent Li <vincent.mc.li@gmail.com>
Date: Wed, 30 Jul 2025 20:08:45 -0700
X-Gm-Features: Ac12FXzo16ZQodIGlm29cuSs5Z5SNX3Hq7QlRM1wEdZNhnjAQqS5CuaVCyHSK1k
Message-ID: <CAK3+h2xDdMumjbQ2=eDQ3ZmNY-a=hL5PWpgjFMdxfqfHxkTjcQ@mail.gmail.com>
Subject: Re: bpf selftest build error - undeclared function 'bpf_qdisc_skb_drop'
To: Chenghao Duan <duanchenghao@kylinos.cn>
Cc: Tiezhu Yang <yangtiezhu@loongson.cn>, loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 30, 2025 at 7:30=E2=80=AFPM Chenghao Duan <duanchenghao@kylinos=
.cn> wrote:
>
> On Wed, Jul 30, 2025 at 07:21:52PM -0700, Vincent Li wrote:
> > Hi Tiezhu and Chenghao,
> >
> > While attempting to test the bpf trampoline patches on loongarch on
> > top of https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.g=
it,
> >  I ran into bpf selftest build error irrelevant to the bpf trampoline
> >
> >   CLNG-BPF [test_progs] bpf_qdisc_fail__incompl_ops.bpf.o
> > progs/bpf_qdisc_fail__incompl_ops.c:13:2: error: call to undeclared
> > function 'bpf_qdisc_skb_drop'; ISO C99 and later do not support
> > implicit function declarations [-Wimplicit-function-declaration]
> >    13 |         bpf_qdisc_skb_drop(skb, to_free);
> >       |         ^
> >
> > I am on Fedora 38 ( I should have updated to newer Fedora :)) with
> > clang version 18.1.0rc, not sure if it is related, wonder if you guys
> > have run into similar issues.
> >
> > Vincent
>
> Hi Vincent,
>
> Yes, I have encountered a similar issue. My approach is to temporarily
> block or comment out the test code that is unrelated to the trampoline
> test.
>
> Chenghao

good to know I am not the only one, actually I have looked at the
configs  below to check if I missed some kernel config, but somehow I
missed the CONFIG_NET_SCH_BPF. By the way, there is no
config.loongarch64 under tools/testing/selftests/bpf, is someone up
for adding bpf selftests for loongarch ? I thought about it, but it is
beyond my knowledge.

[root@fedora linux]# find tools/testing/selftests/bpf/ -name "config*"
tools/testing/selftests/bpf/config.riscv64
tools/testing/selftests/bpf/config.vm
tools/testing/selftests/bpf/config.x86_64
tools/testing/selftests/bpf/config
tools/testing/selftests/bpf/config.aarch64
tools/testing/selftests/bpf/config.s390x
