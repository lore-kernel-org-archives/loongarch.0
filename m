Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7E291DA4E
	for <loongarch@lists.linux.dev>; Sat,  9 Aug 2025 03:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754708630; cv=none; b=fkoOV3OcWMm2bK2Y71Ibzq9yBlc8xywOAe61KsoxYr4qNPirTCdvIJwsEfgzb/O3WPbefufn7gXoVQbtWXPZAVbPAZsaDmzQBQNW/dg9RZY86rHbVvENooUjb9yf9mIkOigJLT3cZJFAaDS0T4rVGhhYrfu/eOhNGzdJ4yYo6JY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754708630; c=relaxed/simple;
	bh=w/hiiEN694cJ8YcCBliv6sgeqcW+9CbJaFQ2lcRTGZU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WSH+cL3NYzu28aeQA7ks61nC7lTWob10UYxRKod/eStpk6ZAz03tk0yu8zbIb7mn8oTgRZaDZ7YWGAwVKdC70+1nzUq70Iqr8bd5yaRm2CTdHlyBt4Fl/j1mHBZSU7H7V+80Bg/k8eGJZo0An/EizURoUMtnF/Q+TdJnnMjZFZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OnqyXCm0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OnqyXCm0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 365D3C4CEED
	for <loongarch@lists.linux.dev>; Sat,  9 Aug 2025 03:03:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754708630;
	bh=w/hiiEN694cJ8YcCBliv6sgeqcW+9CbJaFQ2lcRTGZU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=OnqyXCm0bmS99iYG7Qk6WFBCjWDOWFnXFH1ACFi2BxwPVR/72YkdxS01F7WkKE+TC
	 7PGvBQFvLVHNiI1Ed28zZQDdD2t5Q3jNwCV08qxQHp0Isa7YmSTQhvQuWTw/Eji3YR
	 xhgIyhmQ8iU1ddXcrfThtLGsiYMbCTHuBVqFWgxp5G0lt0aZDgFgbpYm6swk4/3Yog
	 lyJmHOFQhcMqIuuMK8viKmCgijVVOAmV03xqyH8t8RLB4XtnQcunePDKu9YbKGFC0l
	 SWbEXZRV66J4YlOM/Ea3jiyUkO+YF9N//6k1398l8SoEkmrlNrh47MVvj0+J91fvWZ
	 cfgj8et32ZFLg==
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-605b9488c28so4858519a12.2
        for <loongarch@lists.linux.dev>; Fri, 08 Aug 2025 20:03:50 -0700 (PDT)
X-Gm-Message-State: AOJu0YyXGSNmpk6yPGc6kaw9CNkx+o3U+F9MoWW0eWlddU5yy0AABYBd
	kkovpxdj/Qm8YbXI+k22KiGhnf9fWjTieqTSfKVOWvqJ5hM8e0kxdUWMdGWOsZSIc3XI+Sp95Wx
	w9em2J5ketH8BHqJGTBpF6GCVANbZ+4E=
X-Google-Smtp-Source: AGHT+IE5OuFSjoJkfoTs2liUUMg7RYFX9E7JrR0ISz/dA1b6608iMi6x9HauCFJsnxawEcAuDA5Op7vm6IzcXZCUFE0=
X-Received: by 2002:a05:6402:2751:b0:617:b662:2272 with SMTP id
 4fb4d7f45d1cf-617e2f0725amr4010732a12.33.1754708628829; Fri, 08 Aug 2025
 20:03:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAK3+h2x_N-UnQqz_=bQOK9vB8fxEU=4YQ3YwCpnMNW4i5uBkQg@mail.gmail.com>
In-Reply-To: <CAK3+h2x_N-UnQqz_=bQOK9vB8fxEU=4YQ3YwCpnMNW4i5uBkQg@mail.gmail.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sat, 9 Aug 2025 11:03:36 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7wOZUJfn4pP2bV0G8Hnt2AfXt1ZL-eY5FFnQs4XF8g8Q@mail.gmail.com>
X-Gm-Features: Ac12FXx8ovkril7uOgtGMAYQgDm3tz2zJsRsEpr-hPXGZRQcsi91jzEMVfz6OSk
Message-ID: <CAAhV-H7wOZUJfn4pP2bV0G8Hnt2AfXt1ZL-eY5FFnQs4XF8g8Q@mail.gmail.com>
Subject: Re: kernel lockup on bpf selftests module_attach
To: Vincent Li <vincent.mc.li@gmail.com>
Cc: loongarch@lists.linux.dev, Hengqi Chen <hengqi.chen@gmail.com>, 
	Chenghao Duan <duanchenghao@kylinos.cn>, Tiezhu Yang <yangtiezhu@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Vincent,

On Sat, Aug 9, 2025 at 12:53=E2=80=AFAM Vincent Li <vincent.mc.li@gmail.com=
> wrote:
>
> Hi Folks,
>
> Hengqi mentioned offline that the loongarch kernel locked up when
> running full bpf selftests, so I went ahead and ran make run_tests to
> perform full bpf selftest, I observed lockup too. It appears the
> lockup happens when running module_attach test which includes testing
> on fentry so this could be related to the trampoline patch series. for
> example, if I just run ./test_progs -t module_attach, the kernel
> lockup immediately.
Is this a regression caused by the latest trampoline patches? Or in
another word, Does vanilla 6.16 has this problem?

Huacai

>
> A side note, if I put the module_attach test in
> tools/testing/selftests/bpf/DENYLIST to skip the module_attach test,
> the module_attach test is not skipped.
>
> Thanks
>
> Vincent
