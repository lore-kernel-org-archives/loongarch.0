Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D17A31B4F09
	for <loongarch@lists.linux.dev>; Sat, 17 May 2025 09:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747474275; cv=none; b=cqXS2qwOmUF8Ljd1g9P+c/y6Cws6D2h/iOgs8lJC1VFRJaz02rYTWuZgKBPl2qarzcy+9omt0z3eGAg+lnffNCren/d3jTkXY3OUo2MvALdEsfl9pIN3uPcl4TXDQ1EVhTe7oDzKoerRvsyrDPidiVzDcJ7HEhRoTt/VMIGR15Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747474275; c=relaxed/simple;
	bh=PqPzUPxwI+GbVPiCBnMB+dwqnfzwl29HxDYi8okWcxU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SouTUyTHRiPceIRe+tqtSVp9KTRFWhpN4BGvTUoS8ztA8z1riPXLnQMZmBQwh0zSz8v4x6/DHFaOHsWXxgQl/oPRRVUYlcra0j5wgZTH7LLE677q/hfUHzGchc8USEEpFFKU+s1gYFRqp1UBIJgLG9Njf3yuUP5nJ2LyfRZZA0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UMujCbM6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UMujCbM6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6303CC4AF0B
	for <loongarch@lists.linux.dev>; Sat, 17 May 2025 09:31:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747474275;
	bh=PqPzUPxwI+GbVPiCBnMB+dwqnfzwl29HxDYi8okWcxU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=UMujCbM6ZwbR5Lh7Ijkkb0jRqL2DgAfXMX1mC5KPhNzLNCE6liyBIuGRHBWYDpa/v
	 AbCQ5bkpjyCBn8Ci6M1erFSnrPSqeEsvYWNDiCTpDQKGoRtmYN4G4q9Bxo6ootPyLY
	 RwKKg+OVaNXvyEyhIJABwDlo305h9yAWSp69ZIfXn5s5hceGsAYAavrdEYhFN3ghYQ
	 PEsCjsl2+2e5xBfJJtRJ0/WHMjThm6fbxdbOMmmfj0OnFTZGTYNr3V4w4Z+RcZmFPR
	 bAPav5JR/pIjYE2oy9lTiDtNH5fUPW0LgE1zi/N396Xns+VNN8Xn9YSYqBq1JaAWrA
	 ATaXdDLEDA2YQ==
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ad21a5466f6so770593166b.1
        for <loongarch@lists.linux.dev>; Sat, 17 May 2025 02:31:15 -0700 (PDT)
X-Gm-Message-State: AOJu0YzIThcy4//Dm2tUq2gbm5Gk4bsjyllgNHwAtaf1oselvVSQzInI
	M+NkmBp/QQ5pGXbkPvNGy8vrFjx8AFFREtnP86xLfwyZAy+MJsjE3ljjRnfmi5Jm4uIp/qXatpR
	Ic8GD/t9PQ+tpeFh9/VnuoqcickpCtXE=
X-Google-Smtp-Source: AGHT+IEGb4htsnxyOShucSxpDQnZHkAUamSivEZZ3KaU4lABqzfYN8kCeRsqwaGRiP1KLn9pk0l+wiBMqtbBQEAT9Vg=
X-Received: by 2002:a17:907:c28:b0:ad2:2c83:fb43 with SMTP id
 a640c23a62f3a-ad50f7bdff0mr790432866b.23.1747474273996; Sat, 17 May 2025
 02:31:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250424024034.78436-1-youling.tang@linux.dev>
In-Reply-To: <20250424024034.78436-1-youling.tang@linux.dev>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sat, 17 May 2025 17:31:02 +0800
X-Gmail-Original-Message-ID: <CAAhV-H69Eu9z2eG8Bn+gMo2UtJCccxSxsbO+afd0xd_QxOw5HA@mail.gmail.com>
X-Gm-Features: AX0GCFszC6D9Zwg31JGTqkbqDMwWN9_YqCjFm9jlQ-c_vFuGXGSSsHthS25A4Xg
Message-ID: <CAAhV-H69Eu9z2eG8Bn+gMo2UtJCccxSxsbO+afd0xd_QxOw5HA@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] LoongArch: Adjust the 'make install' operation
To: Youling Tang <youling.tang@linux.dev>
Cc: loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Applied, thanks.

Huacai

On Thu, Apr 24, 2025 at 10:41=E2=80=AFAM Youling Tang <youling.tang@linux.d=
ev> wrote:
>
> Changelog:
>   v3:
>   * Add a copy of the kernel config file.
>   * Some minor adjustments.
>
>   v2:
>   * Adjust the patch sequence.
>   * Adjust the title information.
>   * Distinguish between vmlinux.efi and vmlinux.elf in install.sh
>   * Correct minor mistakes.
>
> Youling Tang (3):
>   LoongArch: Add a default install.sh
>   LoongArch: Using generic scripts/install.sh in `make install`
>   LoongArch: Add some annotations in archhelp
>
>  arch/loongarch/Makefile        | 11 ++++---
>  arch/loongarch/boot/install.sh | 56 ++++++++++++++++++++++++++++++++++
>  2 files changed, 63 insertions(+), 4 deletions(-)
>  create mode 100755 arch/loongarch/boot/install.sh
>
> --
> 2.38.1
>
