Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795162759;
	b=HqgqkD/nm5BjW5QGOhKGO1isRgYdlnkuf4+yxuuNRo03bn5SA7XY04dRd/XNoxIiBqMt
	 wtZ8q1xNL3h7HS9uuuHYMeg0Rdox9GEe722ueIqi5ikgONIT5J41ZQvXSjZcE8mNOIMNd
	 YFMxwthadnQv9dUNVACtQqW6TV41FZHV13c7gXfSPW6NHbsuPK9ZLzy9zoIs6qyTw6aDY
	 gJ26aiu6Hpgt7LPl4NCL8CeNGCwrbpLQvjUBkxJNQS4lv4ak0VBH4ZW6jARrfk9u/yj65
	 TcjmS0EryjfgtcdgKGs365sNFkPnfmox/TjfAe26qSDbiEXH+8OtAuZM8NOOUTPvdYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795162759;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ZLVZJxESS8nh61KH4gKvJ6pqCiTggJl/NDFsKtAxWgY=;
	b=2FOF8f5R0SqyET/CdIg96iGQuAk67SkNK0dq6zhLgoLgzJNCijzFW2S9/CPQvJwL+vkM
	 kXJfHynnAeZwy+8TgYcZSs1YO+l0azbTlKR8Jr4MXKHA/yd3SsWHLaQuicFfrGK9zEqhx
	 8ZKgPAxhapKhCeMU8F09S8nAeyHvfRQyzFRO8C9jxUmzm2f5n2EJDyeBoemykQzZvXnt8
	 gXeh51u6JOm1s9uXLQ6gnyr9QK7cfQQIYTmA8gJBBPq/dlBDwpqqKmZ66hdtz2JnElzLN
	 mts0qUBiLVVKx8tAeKA/qPk8Ct2n52/+bEnP6G6dzbAfIGklhKLLr/0mHFtAhnF7uQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WlbJGa6r;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71B7D606A332
	for <loongarch@lists.linux.dev>; Fri, 20 Nov 2026 08:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WlbJGa6r
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 454DB1F000CF
	for <loongarch@lists.linux.dev>; Fri, 20 Nov 2026 08:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795162759;
	bh=ZLVZJxESS8nh61KH4gKvJ6pqCiTggJl/NDFsKtAxWgY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=WlbJGa6rvPAEL9wEVmhuqKwq5b9PQsHofUWiHjD6MEyvzikzfKGtxbqPGelKuVxYs
	 m5p9pRMK/WjoeetJ4SxALT+BhcI7SlSoqL30ucUrC7oL03QyMUNNTtC4p/1UFpHGE8
	 MX+wFnOe21Je8mXXfpJ+TZSot7025mlXytCgoxP/yg70OdLx/aoNnpP/g7pkk9Lg0p
	 35jxfSqJAb8gLSUUS7L4Esc/tpH27jCLNA6poK8j5LY5u4Z5WZKT/fPV9+K398+OQQ
	 ahs+Rid6qcYr9FlHQWxDJChtd/CB/HxmAWcACB1+HKdLeTUevE+FoNLBSvP7meyu1o
	 y20qAuljNqCSw==
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6b8a1f59d5eso718880a12.3
        for <loongarch@lists.linux.dev>; Fri, 20 Nov 2026 00:19:19 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErE7eMgs7jagpD8C4aQGO1jKqdeym3yXESJyY1nqvg7rAUIodZSG++UD6rDg0DTyq0zBTDQRlEo53bc=@lists.linux.dev
X-Gm-Message-State: APuU4Z8zLuZHXMEYhv+erqpRHf26PVJXR4nJskkuKw3kYx8GAPmM9E6X
	PVE9srGNTmOQNwNnLmm5jnr65bXwfdjYd0htngFPDIpfH0Di+nA3O7T5mYMSr/b4EPd98Nj2IYn
	q6Gqg5MPQYNQkk/DALm+ncy0zqDv5S14=
X-Received: by 2002:aa7:c0d0:0:b0:6ba:144f:ae43 with SMTP id
 4fb4d7f45d1cf-6ba37c7b138mr1080749a12.6.1795162757947; Fri, 20 Nov 2026
 00:19:17 -0800 (PST)
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <CAAhV-H4pmcV8hah8sPyQn3nR9cO-NwkXMPLeSABAO-VEnS08fg@mail.gmail.com>
 <20261119125221.11897-1-dongtai.guo@linux.dev>
In-Reply-To: <20261119125221.11897-1-dongtai.guo@linux.dev>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Fri, 20 Nov 2026 16:19:08 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5ZZxa-wMovPdCEhzwPaxkcEac0uwBgV2jdfY=6jUrGYg@mail.gmail.com>
X-Gm-Features: AclHuK_s8BaVf06BT7xe6EODjiMXez_Tr3nUEr-rhXoD_pDYy5cCCc3-DaMT3_A
Message-ID: <CAAhV-H5ZZxa-wMovPdCEhzwPaxkcEac0uwBgV2jdfY=6jUrGYg@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: Allow memblock arrays to resize
To: George Guo <dongtai.guo@linux.dev>
Cc: kernel@xen0n.name, rppt@kernel.org, liukexin@kylinos.cn, 
	guodongtai@kylinos.cn, loongarch@lists.linux.dev, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 19, 2026 at 8:52=E2=80=AFPM George Guo <dongtai.guo@linux.dev> =
wrote:
>
> Hi Huacai,
>
> On Thu, Nov 19, 2026 at 8:05 PM Huacai Chen <chenhuacai@kernel.org> wrote=
:
> > Would you mind if I move it between memblock_dump_all() and
> > memblock_set_bottom_up(false)?
>
> Not at all, please go ahead. KHO still works with it there, since
> kho_memory_init() runs after setup_arch().
Applied, thanks.

Huacai

>
> Thanks,
> George
