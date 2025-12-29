Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91F0E3164AB
	for <loongarch@lists.linux.dev>; Mon, 29 Dec 2025 13:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767014854; cv=none; b=LY1Gn+4BfYqlHHHip1M7K8WYO1regtQPQ9hDVFwYSPvFDVMhC11+74mKV7SavBb3FihWnUlZVtkyeFL/GTo4g61mB00GxWAsb+dy1xzU0ukR9jjxkqMACPXzAjWTqWHdYfx2zlyIMyt3AsmNze8c93x35h8bT3LJn6i06Q0JUfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767014854; c=relaxed/simple;
	bh=j9sMbAwzQ4WsEz95enNeWahOMcPHIxgg5ZvgRJoRHF0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iJMB4YbnQ3AyTCtOZ1fxNqwuIECL0xUkEvxlzZbbksmKqURQybaHIkvA56RpvgaC7aaF38X/jpC33KQwEQOMA4Qy68eoSAuWk1oUuf4fS82noXsqDMWPUW8aGzg12/tdoSJwyA2DongPkaKivPk1N0qNN/OQyJe+c9mzmm//nNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eikPnCzu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eikPnCzu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C44FC4CEF7
	for <loongarch@lists.linux.dev>; Mon, 29 Dec 2025 13:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767014854;
	bh=j9sMbAwzQ4WsEz95enNeWahOMcPHIxgg5ZvgRJoRHF0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=eikPnCzuPumPfcZZgmSzXusmv2eEMUPw+vlOvD7uFYdIWe347BbDyCTzNX6XyApyr
	 Nhb4Hhv1iupls++ug4abBNULkM6ZT/3fHwXIr/sloBbfyCqORJNVx/Bbhpp0XB0V+q
	 MRjzSxmJ0BC7lBFE7KLuyd/qCLx0oH4SJE0/ffCcG/f7JEe72tGSrFPO1SrN8kwhZo
	 0WS8nHRuCxOEtFkO2h8ieGBaBSugD4gr1ImWDdwabrK76lasVkTOpU8LiKJ2pkWmdj
	 RQXCAOwsz5nzCK0FmvBRdBchtCh3ix6q4V5WWQwAqM7k4QiW/duYA5jaKdLPZs1nqP
	 fPPPRE0ScZovg==
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-64d4d8b3ad7so9230042a12.2
        for <loongarch@lists.linux.dev>; Mon, 29 Dec 2025 05:27:34 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUSEWWI8J5hNxDDGM6TPdtDFPCw6YtiKldHqk9Vlt/+uHdBhOO2SvbfDa9V585nLKcjRu5tLFZjLtY=@lists.linux.dev
X-Gm-Message-State: AOJu0YygWoNr4EBxGAc4xuQqxn7naP5V5SJI47N4ygFmfOvBIeMwRHsm
	8tvPoDFI6NG6mpw/PyVKgoU3mh+V6OzKiNqHQVFiHjSzFdYHpKOG0WgWUvS1IpRzRHBaD0xNabV
	dSmhdxCKfEopQNxTywTgWZfeA4lDAQZo=
X-Google-Smtp-Source: AGHT+IG4GMRUusOGmgb6IWS0WYapBYKqmnCYK/rCXa7B515C18gXlmPp4Buzt1Jf4m2DAZxRaGDhT242pOYezWB0zFw=
X-Received: by 2002:a17:907:746:b0:b83:8fc:c659 with SMTP id
 a640c23a62f3a-b8308fcf4d9mr1371962866b.3.1767014852823; Mon, 29 Dec 2025
 05:27:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251224103516.12654-1-yangtiezhu@loongson.cn>
In-Reply-To: <20251224103516.12654-1-yangtiezhu@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Mon, 29 Dec 2025 21:27:25 +0800
X-Gmail-Original-Message-ID: <CAAhV-H47rrcStPaPMm=jByTD9i1Mvad9uXpUux_LGFTh858yGg@mail.gmail.com>
X-Gm-Features: AQt7F2pCMYP5iM9sHWqAZY2B5SeY16vGmDE38ujqLu-2Uvf_6K4bAf66rvntq9w
Message-ID: <CAAhV-H47rrcStPaPMm=jByTD9i1Mvad9uXpUux_LGFTh858yGg@mail.gmail.com>
Subject: Re: [PATCH 0/2] LoongArch: Refine entry points code for ORC unwinder
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Applied, thanks.

Huacai

On Wed, Dec 24, 2025 at 6:35=E2=80=AFPM Tiezhu Yang <yangtiezhu@loongson.cn=
> wrote:
>
> The changes were in the previous patches, this series is based on 6.19-rc=
2.
>
> Tiezhu Yang (2):
>   LoongArch: Use UNWIND_HINT_END_OF_STACK for entry points
>   LoongArch: Remove is_entry_func() and kernel_entry_end
>
>  arch/loongarch/kernel/head.S       |  4 ++--
>  arch/loongarch/kernel/unwind_orc.c | 11 -----------
>  2 files changed, 2 insertions(+), 13 deletions(-)
>
> --
> 2.42.0
>
