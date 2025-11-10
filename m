Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9FDC212FB9
	for <loongarch@lists.linux.dev>; Mon, 10 Nov 2025 06:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762757318; cv=none; b=EUAEafnPuTEabwpOvzGs28AWdzRDRWzgGNX9Bix1xtp0ly9bNhii0k+hzNXv72oTXmPJNeQewxOxdQKPyIHfPbAPKHn0yfkW6UYPwMlfVv3lcFDpqSa0ENt9f/8xlFaxaDRJnL0e1lGSXxoZUCXAAT5FuHe/VMqHMsQc9UBXA5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762757318; c=relaxed/simple;
	bh=DtLTKwKWpiQcyruUJj2zM1Xn2D3re+1oQG3ad3kJHts=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TNZpQxbEANrdDivRRbCUzorrV/2RfsH6qptwBtfXpqnmDN0sX7fcTntHnJCz1aOxq9kDr51DMqvdJt7L1WDrvKZFh3vl8Q5pTo2XIZ9+sCPXMZwVdjrQaXZC3Zh0OCH46vSvNUYsmlIJV+pZf17mS7YAuBqKDg9E+NbPEpLLZxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iuQv8KvD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iuQv8KvD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B39FC19422
	for <loongarch@lists.linux.dev>; Mon, 10 Nov 2025 06:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762757317;
	bh=DtLTKwKWpiQcyruUJj2zM1Xn2D3re+1oQG3ad3kJHts=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=iuQv8KvDXdC3B13qTLccB6f924FxGkLYhvy2ArVLIhzSguwxzfDJ8ZpJ0s5fMee6i
	 M+aWlWvMnQISRhJYux+9JCEjvril/O0RYKzqmrPX8rSr5Dh2X+okEiffodGDhw5UJ/
	 SBal4TTiGZ/PXxDgeoB0Kui8x+g6scYKvFnRfkBAD9KHGgV/uMBDQOCS+XeUVeDQEy
	 HDgCyDUtwnS2q0pnQDz1usVXdwI8xdGxiqGXywZfF9CJe3sTLR/IBuLyccLor1wV47
	 XjUbsSRRsXPZhQyXDiiJOlEwdEDa7HhtUS6kcEkWxmFVvtdgsn7c/1mZ98Djj4vJx+
	 E3+FmfITb+bEA==
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b7272012d30so474396866b.2
        for <loongarch@lists.linux.dev>; Sun, 09 Nov 2025 22:48:37 -0800 (PST)
X-Gm-Message-State: AOJu0YxzvOLeXT0rZMsYVUuXvECFEulX7B8Q0WZqYSZP7Vx6Nw195ZjZ
	1fEKPzBzT2Jtz5kldNvk/MlzTDMb0GqX0C1bgb/Q9usy5w/ceCU68P+LpRe0GThleuklkptEq5c
	l3FVLcyt9rQDD9pVFn+dGxAu9ejz1xYc=
X-Google-Smtp-Source: AGHT+IGPs1j0WtZ0myaCy1VKoJU1+zBNGFI7PZwzFwdyQQ2gXuaNuA76LjhAIPivMaQcB38Ztp1LJ//qEKtqr5Egm7A=
X-Received: by 2002:a17:907:2687:b0:b0e:d477:4972 with SMTP id
 a640c23a62f3a-b72e031a2famr698014666b.25.1762757316165; Sun, 09 Nov 2025
 22:48:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251110025906.17096-1-yangtiezhu@loongson.cn>
In-Reply-To: <20251110025906.17096-1-yangtiezhu@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Mon, 10 Nov 2025 14:48:35 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4=ZfYfRFE8VYmxyKxTAi8E=YKysG1fzed4kZRWnMUoeA@mail.gmail.com>
X-Gm-Features: AWmQ_bmg5FlL4EcXgBr9_PfkR2OrlOyhuKe-LfEt6XEOUehI6UTLqQ19QqtAQtM
Message-ID: <CAAhV-H4=ZfYfRFE8VYmxyKxTAi8E=YKysG1fzed4kZRWnMUoeA@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] LoongArch: Refine init_hw_perf_events()
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

V1 was applied last week and now in linux-next, don't do meaningless work.

Huacai

On Mon, Nov 10, 2025 at 10:59=E2=80=AFAM Tiezhu Yang <yangtiezhu@loongson.c=
n> wrote:
>
> This version is based on 6.18-rc5, use the proper patch title
> to make it clear.
>
> Tiezhu Yang (2):
>   LoongArch: Use CPUCFG6_PMNUM_SHIFT to get PMU number
>   LoongArch: Detect PMU bits via CPUCFG instruction
>
>  arch/loongarch/include/asm/loongarch.h | 1 +
>  arch/loongarch/kernel/perf_event.c     | 7 ++++---
>  2 files changed, 5 insertions(+), 3 deletions(-)
>
> --
> 2.42.0
>
