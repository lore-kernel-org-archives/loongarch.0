Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CBC133DEF9
	for <loongarch@lists.linux.dev>; Mon, 19 Oct 2026 02:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792375260; cv=none; b=UcQetzXTDEe16ME5NNn8T+Gblp8QoOwaxEw7OF0U144fFqzvEF27QMkjuAumLJ9KB/UaQvNPv//9oT7pXE92T4oMg4uGf5b0ybldml+Z5EwnBg6nfoNfjzDLShcl8odcWptKKWpHzjp5wyFlCdxCWewaAVfERSFBhGmycgMnX9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792375260; c=relaxed/simple;
	bh=lK+xi1CtkJn6VZaJl1i9UBW4/J1clWLoaX/IdvnnHiE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oQFSOfGz1rX3YBhPeGEqdJxcSKC4xXbUPD+yseQbn63GhIxDxUZL9seyxNNX1dUA97DmrGtis7jt/c19CI/2OFR9JAF9egXWNWZ4k4lXiorAFPL0Iz7wdNJGnRQiX1V9J8Fk3q5JQy+188W7290vA1K0JonNEa1asC8pW0ojZos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BBhIJ946; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BBhIJ946"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C38051F000CB
	for <loongarch@lists.linux.dev>; Mon, 19 Oct 2026 02:00:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792375258;
	bh=lK+xi1CtkJn6VZaJl1i9UBW4/J1clWLoaX/IdvnnHiE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=BBhIJ946GQK80KG9eKnZtuEenkHQsoxoNskMAKXKmBi75OwPHgoyMyWIhAENHyEI8
	 Z+ijaCs4OHW+n4TTMRdtPtSRAgr474mftliH+Pkrt12zMm3tWdATikR5UDQFRuDpSv
	 XEcoK+Pe329cSTBUWawVckkaTAVffOKK5MHA/n0QcH8KTJiP+DsZG9otYZm1yyA3f+
	 cItZ9huzuBs7jFr0HUlKcVZWRicOwxsmwcEo3GZHQM7NVkRAJ1VUIC2WOtPSXWjB+3
	 mw9HCRhejqDIM2stDRzAs1OUFt8nAMT8kgMsgL47ccmQWGfxYk6QbXZ3tL2eM/Srv8
	 ESFi3/t3UOCuQ==
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6b1d8944cb0so2278061a12.3
        for <loongarch@lists.linux.dev>; Sun, 18 Oct 2026 19:00:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxIeHmGBUGwW8WphqT4l/DBA9ku7P5mAvjsg5HCy1dKrwZKt7rnUpHripw2cYc4S+G43C49qSWSmMs=@lists.linux.dev
X-Gm-Message-State: AFq9FYJ9P4VoBreeLyyEsrO05ssnddxK995kNwhVOqN+6ArSFYk4WkSL
	1x6i2vZdfoXVfkLVvMrWqNxAunjfNpUeCCTZYi+WAaVuQvi4Rt/JURMwKj5FmMedQiRma9Gg0br
	XWvpn/qSoDdl1dAYefendUN8OrEp9T50=
X-Received: by 2002:a05:6402:1952:b0:6ac:aec6:a3c5 with SMTP id
 4fb4d7f45d1cf-6b3a81b74fcmr3685234a12.42.1792375257407; Sun, 18 Oct 2026
 19:00:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260303070642.2785715-1-zhoubinbin@loongson.cn> <f0baa480-cd6d-42ad-bdb9-92cb793d774e@kernel.org>
In-Reply-To: <f0baa480-cd6d-42ad-bdb9-92cb793d774e@kernel.org>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Mon, 19 Oct 2026 10:00:46 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4REngu3boHogg+s0PTkgEDFQk+JnQFtt-jF86jN3NqgA@mail.gmail.com>
X-Gm-Features: AclHuK-3zlBaxQjMu1BZEqroXGyYsh0v3LJ2zcYsvyXhuT3eNUNMdX67fFDnKmE
Message-ID: <CAAhV-H4REngu3boHogg+s0PTkgEDFQk+JnQFtt-jF86jN3NqgA@mail.gmail.com>
Subject: Re: [PATCH] soc: loongson: loongson2_guts: Use of_root instead of own reference
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Binbin Zhou <zhoubb.aaron@gmail.com>, 
	Huacai Chen <chenhuacai@loongson.cn>, Yinbo Zhu <zhuyinbo@loongson.cn>, 
	Arnd Bergmann <arnd@arndb.de>, Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	soc@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 7, 2026 at 6:14=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> On 03/03/2026 08:06, Binbin Zhou wrote:
> > There is already a global of_root reference. Use that instead of gettin=
g
> > one on our own. We don't need to care about the reference count either
> > this way.
> >
> > Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> > ---
>
>
> Please follow standard defconfig submission rules, so as explained in
> maintainer soc profile document: you are not supposed to send patches
> soc@ for review.
Applied to the loongarch tree.

Huacai

>
> Best regards,
> Krzysztof
>
