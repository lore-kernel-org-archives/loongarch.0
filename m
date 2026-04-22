Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03DA13A7F4E
	for <loongarch@lists.linux.dev>; Wed, 22 Apr 2026 08:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776845699; cv=none; b=qYqmM1DSvLDLGxP1d8YvFrTeJXh+E5WYkgrvAU+gqMuCo/IbAExA79PoIIO1CHoRKVSVSFoBkkriiqucofIzumgjDAnTX4xl6Q/lP/lbSb41wG8C95phaYchag89LLaBOuMACYig3/hn98CFjw9tvR58S/WuW0NjaT6+L+i4SBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776845699; c=relaxed/simple;
	bh=DchJEvknrlog+Bb0qThllzXp4dmvec1QoJ8Vkf+bdIM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CRduvvrxF8q1AjbdLQZhI4wiu/hz5ECZfbX/0WIOyQhdBysOntB+yQr6m4mWp7qgVkvbR7+pTDqEeymvymuHAGfAajXxJ/wCTo2wS9zEH3c4e57XB/LY3nRCuBQpIX5tZkfYy50qOvxNz4LrnJsBKJEOSf8TMxu0v53hfHw+7m8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NBQn0W7d; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NBQn0W7d"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72D71C4AF09
	for <loongarch@lists.linux.dev>; Wed, 22 Apr 2026 08:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776845698;
	bh=DchJEvknrlog+Bb0qThllzXp4dmvec1QoJ8Vkf+bdIM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=NBQn0W7dZEgmC1gQWgPisvS0QWC04SkAZxwkBb24vdofRbyBb9yfMmcQGoLAuz98W
	 qNWgANsJO/+BUi1xJFlCLW3MOI9e+C2H2i/UxVX6UenKa47wGPURZ3DqHTi+NoX8iZ
	 RSII9mabu7OQpc/u0aSf1y1iPhCDCuHfzPdsjP6Nj6VmY8L+vrUPcrKg4Riijfqzwd
	 4x3pZHFDEGtoUvaEqI3Jc0pysIE/iF46D0tbL6YHOkeUg59dWY/dw3W2caTWSIqWw7
	 CdjeEqmfZdtHbG4WIR9rn9BG2OTwV8PpbeQV1IOMbyEVfooLsutGHvQdIVh66DLzb3
	 2Rle1b2DNE1Cg==
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-ba6838e76f2so431331466b.2
        for <loongarch@lists.linux.dev>; Wed, 22 Apr 2026 01:14:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8heItr9+IxA5kEfqqOuhgVRGSdcXRtLklQKcAW5VOQFn9A9BJyGvqQavYKMn24TBckhghLMT0//CU=@lists.linux.dev
X-Gm-Message-State: AOJu0YwIjIAseXnuVen6B6FcjEs2OWZAptJb9JTk7mHp7fX3gJ16wy5f
	XzsArm3X/239D1MV74ixoszDl7n8gJRomnUZWZcihxvWOxsD5zezLzNl19WsKmNrPIbTREl1761
	mi3GSdnLN0lCJa0voe5KfwzFlvwyb0g8=
X-Received: by 2002:a17:906:fe04:b0:b97:c719:14d4 with SMTP id
 a640c23a62f3a-ba41adf9294mr1036119866b.29.1776845697017; Wed, 22 Apr 2026
 01:14:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260413040506.26640-1-yangtiezhu@loongson.cn>
 <CAAhV-H59RuXDEqLe7UNDYssvMFXqZ2YZuW4gOUqdscPQZpqibg@mail.gmail.com> <4a6c89b6-72a8-a80b-1f7c-9a620ed24505@loongson.cn>
In-Reply-To: <4a6c89b6-72a8-a80b-1f7c-9a620ed24505@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Wed, 22 Apr 2026 16:15:08 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6kL9ZY13N5pDXzQRcdO6bWso=8vaDFU_5ki1EejnvQSw@mail.gmail.com>
X-Gm-Features: AQROBzAYTZJEK5kJL3Em_yWktov8zoZYWxZi9C86fAIiw-IEvSAAVNco0dL6xME
Message-ID: <CAAhV-H6kL9ZY13N5pDXzQRcdO6bWso=8vaDFU_5ki1EejnvQSw@mail.gmail.com>
Subject: Re: [PATCH v3 0/5] LoongArch: BPF: Support more atomic instructions
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: Hengqi Chen <hengqi.chen@gmail.com>, loongarch@lists.linux.dev, bpf@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 21, 2026 at 9:24=E2=80=AFPM Tiezhu Yang <yangtiezhu@loongson.cn=
> wrote:
>
> On 4/21/26 20:38, Huacai Chen wrote:
> > Hi, Tiezhu,
> >
> > Maybe we need V4? If so, please submit as soon as possible.
>
> For now, TBH, I do not want to do that.
>
> Patch #1 is OK.
>
> Patch #2 is OK.
>
> Patch #3 is OK according to Wang Rui's reply.
>
> Patch #4 has no big problems, the current testcases passed,
> I am not sure whether it has problem, I can fix it if there
> is a real problem, maybe it needs to update the testcase first.
>
> patch #5 is OK, hope you can replace "usable" with "enable" in
> the patch subject and commit message when applying.
OK, Applied to loongarch-next with some small modifications, please
make sure everything works well.

Huacai

>
> Thanks,
> Tiezhu
>
>
