Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E7FA1C0DE7
	for <loongarch@lists.linux.dev>; Thu, 11 Apr 2024 04:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712809896; cv=none; b=QzxBDwXbyFxdj0i9nR3DqBnaldpE8BBH13KicgQMU8x/fvvg6I9HU2moYdjbJJ6r7KTDwnmQTJROUCbDrUcM2FK5GoENNnk/Om+pOtmAYpzM8OqQ3c17qqmjvd9jNWJmrvi4nSxtuIpZqWfXk2dwQgkl2A90MVpFCWJNZQI0b3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712809896; c=relaxed/simple;
	bh=vrTyJSsz66VhcSci1RRtIF3jsVvFSQOsHe+hs0NSE9s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=vEilN4ALaYC3+eUv1VKkda8yPB2M1nsqkA4zQ2PuSGp5U/WZHcZNPggIPVdu5MR2+ME9tRh5XDhd3Y9ifQLwuQPuILgIHwL/b/ydGztdTWXQbmAOASIdUFCBGv4MDFQWeAQmB7AQvSRpZO6wSjm3CbMSrcyaX2izT/6mCkknCjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uHMFCn8q; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uHMFCn8q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAB02C433F1
	for <loongarch@lists.linux.dev>; Thu, 11 Apr 2024 04:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712809896;
	bh=vrTyJSsz66VhcSci1RRtIF3jsVvFSQOsHe+hs0NSE9s=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=uHMFCn8qPHjNAa0TdZJhUUMsr2B7NCGbIh1WKFYUvvBV6hv/AAOqUiiYeFuEIdLT3
	 Lwqq14DMOxLWNR1nH6CZTQNXD6385U+ZUdN7lAi/wZsiEGFH37KcU86wjhDu5rVl76
	 gvKlM+L4Qh2tIqjJsUhSnM8vmBy3ShMjeC5VPzqIPQDmuDjgKFzGXNlYybPI7GhO9N
	 MidqLzXwPFxGqGAhMCNirM5+cYlnRYaTUrKZUdT4y8woXqTQa8LkKN+6dGNNGrSusE
	 QM58RXBiJysogbUx4pPCn/LX5WjAFJMYqjwf4B6OwbHHkYpgc/y2ta7RWLkpS9zMzR
	 5ELXpWXTpO0bA==
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a51ddc783e3so480849266b.0
        for <loongarch@lists.linux.dev>; Wed, 10 Apr 2024 21:31:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUVakLEYP6rE8HSDV0OwDUZHlF3sMa+Aj9un56vBbJzhFvCN3LB2DaplokgZAp37kZ9QC0CiDSm2d3z2f1PFXh5qvnbM9jT9LgA
X-Gm-Message-State: AOJu0YymGBMuRy3afrHObYIKSeQ4R6GIrvGKmfoM2pG4vCgqO7iNDaHv
	+gLwa6fJig2Y6BkmlZz4byPItzGrrJcG9UChqV5o/dIYi9VBelztfvdxzbKWXp88+DCNOs/+NcQ
	NCuZBWLZfyeuaGpBKnI1Sd5Cl0gs=
X-Google-Smtp-Source: AGHT+IGL+/3vzAYK4K0QiuFLsO1aXZQYmTioRDYy4LKcuDF0qFutdNCevBoKbn4z3I0uejXah3+/f+nNYqIVBin3FsE=
X-Received: by 2002:a17:906:c346:b0:a51:bc68:d61e with SMTP id
 ci6-20020a170906c34600b00a51bc68d61emr2614686ejb.30.1712809894523; Wed, 10
 Apr 2024 21:31:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1712731524.git.zhoubinbin@loongson.cn>
In-Reply-To: <cover.1712731524.git.zhoubinbin@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Thu, 11 Apr 2024 12:31:20 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5QJVrTjDEyNFRw5p5x0f7ONYWYyL_4D91aHXSMrNd9nw@mail.gmail.com>
Message-ID: <CAAhV-H5QJVrTjDEyNFRw5p5x0f7ONYWYyL_4D91aHXSMrNd9nw@mail.gmail.com>
Subject: Re: [PATCH v3 0/6] Add Loongson-2k0500 and Loongson-2k2000 clock support
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Binbin Zhou <zhoubb.aaron@gmail.com>, Huacai Chen <chenhuacai@loongson.cn>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Yinbo Zhu <zhuyinbo@loongson.cn>, loongson-kernel@lists.loongnix.cn, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

For the whole series,

Acked-by: Huacai Chen <chenhuacai@loongson.cn>

On Thu, Apr 11, 2024 at 10:58=E2=80=AFAM Binbin Zhou <zhoubinbin@loongson.c=
n> wrote:
>
> Hi all:
>
> As we know, the Loongson-2K family of SoCs (ls2k0500/ls2k1000/ls2k2000)
> have a similar clock structure, and I support them to be configured with
> different parameters (e.g., register offsets, etc.).
>
> To make it easier to add support for different SoCs, I refactored the
> original driver to make the whole driver as understandable as possible.
>
> Briefly, I have divided all clocks into three categories according to
> their properties and their parent clocks: Independent PLLs, clocks based
> on frequency scales, and clock dividers.
>
> Thanks.
>
> ----
> V3:
> - Remove the dts-related patches and update dts at once after all relevan=
t
>   drivers are complete.
> patch(1/6):
>  - Drop unsuitable comments.
>
> Link to V2:
> https://lore.kernel.org/all/cover.1711504700.git.zhoubinbin@loongson.cn/
>
> V2:
> patch(1/8):
>  - Drop LOONGSON2_CLK_END, for it is not a binding.
> patch(1/8)(3/8)(5/8):
>  - Add Acked-by tag from Conor, Thanks.
>
> Link to V1:
> https://lore.kernel.org/all/cover.1710926402.git.zhoubinbin@loongson.cn/
>
> Binbin Zhou (6):
>   dt-bindings: clock: Add Loongson-2K expand clock index
>   clk: clk-loongson2: Refactor driver for adding new platforms
>   dt-bindings: clock: loongson2: Add Loongson-2K0500 compatible
>   clk: clk-loongson2: Add Loongson-2K0500 clock support
>   dt-bindings: clock: loongson2: Add Loongson-2K2000 compatible
>   clk: clk-loongson2: Add Loongson-2K2000 clock support
>
>  .../bindings/clock/loongson,ls2k-clk.yaml     |   4 +-
>  drivers/clk/clk-loongson2.c                   | 549 ++++++++++--------
>  include/dt-bindings/clock/loongson,ls2k-clk.h |  54 +-
>  3 files changed, 329 insertions(+), 278 deletions(-)
>
> --
> 2.43.0
>
